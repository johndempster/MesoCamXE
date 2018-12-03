unit ZStageUnit;
// ========================================================================
// MesoScan: Z Stage control module
// (c) J.Dempster, Strathclyde Institute for Pharmacy & Biomedical Sciences
// ========================================================================
// 7/6/12 Supports Prior OptiScan II controller
// 14.5.14 Supports voltage-controlled lens positioner
// 27.0.16 Z stage pressure switch protection implemented
// 11.02.17 .Enabled removed, XPosition, YPosition added
// 16.01.17 ZStage.XScaleFactor and ZStage.YScaleFactor added
// 10.05.17 ZPositionMax,ZPositionMin limits added
// 24.05.17 ProScanEnableZStageTTLAction now executed before first Z stage position
//          check because commands fail to work immediatelt after opening of com link to
//          ProSCan III stage
// 08.08.17 Prior stage: ProScanEnableZStageTTLAction - stop all movement command added
//          to TTL triggered list to abort any move commands in progress.
//          Now operates in standard mode to allow 'R' command responses to be returned immediately after command
//          Moves can now be changed while in progress.
// 18.10.17 Now reports if COM port cannot be opened and disables send/recieves to controller
// 14.11.18 Conversion to Threaded COM I/O in progress
// 03.12.18 Now tested and working with threaded COM I/O

interface

uses
  System.SysUtils, System.Classes, Windows, FMX.Dialogs, math, strutils, ZStageComThreadUnit,
  Vcl.ExtCtrls ;

type
  TZStage = class(TDataModule)
    Timer: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    FStageType : Integer ;    // Type of stage
//    FControlPort : DWord ;    // Control port number
    FBaudRate : DWord ;       // Com port baud rate
    ControlState : Integer ;  // Z stage control state
    Status : String ;         // Z stage status report
    MoveToRequest : Boolean ;   // Go to Final flag
    RequestedXPos : Double ;   // Intermediate X position
    RequestedYPos : Double ;   // Intermediate Y position
    RequestedZPos : Double ;   // Intermediate Z position

    StageInitRequired : Boolean ; // Stage needs to be initialised
    WaitingForPositionUpdate : Boolean ;

    ComThread : TZStageComThread ;

    procedure ResetCOMPort ;
    procedure SetControlPort( Value : DWord ) ;
    procedure SetBaudRate( Value : DWord ) ;
    procedure SetStageType( Value : Integer ) ;

    procedure MoveToPrior( X : Double ; // New X pos.
                          Y : Double ; // NEw Y pos.
                          Z : Double  // New Z pos.
                          ) ;

    procedure MoveToPZ( Position : Double ) ;
    function GetScaleFactorUnits : string ;
  public
    { Public declarations }
    XPosition : Double ;     // X position (um)
    XScaleFactor : Double ;  // X step scaling factor
    YPosition : Double ;     // Y position (um)
    YScaleFactor : Double ;  // Y step scaling factor
    ZPosition : Double ;     // Z position (um)
    ZPositionMax : Double ;  // Z position upper limit (um)
    ZPositionMin : Double ;  // Z position lower limit (um)
    ZScaleFactor : Double ;  // Z step scaling factor
    ZStepTime : Double ;     // Time to perform Z step (s)

    FControlPort : DWord ;    // Control port number
    CommandList : TstringList ;  // Light Source command list
    ReplyList : TstringList ;    // Light source replies
    TickCounter : Integer ;      // Timer tick counter
    ReplyZeroCount : Integer ;   // No. of '0' replies to wait for before init complete
    Initialised : Boolean ;      // TRUE = stage initialised

    procedure Open ;
    procedure Close ;
    procedure MoveTo( X : Double ; // New X pos.
                      Y : Double ; // NEw Y pos.
                      Z : Double  // New Z pos.
                      ) ;
    procedure GetZStageTypes( List : TStrings ) ;
    procedure GetControlPorts( List : TStrings ) ;
    procedure PriorHandleMessages ;

  published
    Property ControlPort : DWORD read FControlPort write SetControlPort ;
    Property BaudRate : DWORD read FBaudRate write SetBaudRate ;
    Property StageType : Integer read FStageType write SetStageType ;
    Property ScaleFactorUnits : string read GetScaleFactorUnits ;
  end;

var
  ZStage: TZStage;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses LabIOUnit, mmsystem;

{$R *.dfm}

const
    csIdle = 0 ;
    csWaitingForPosition = 1 ;
    csWaitingForCompletion = 2 ;

    stNone = 0 ;
    stOptiscanII = 1 ;
    stProscanIII = 2 ;
    stPiezo = 3 ;

    XMaxStep = 10000.0 ;
    YMaxStep = 10000.0 ;
    ZMaxStep = 10000.0 ;

procedure TZStage.DataModuleCreate(Sender: TObject);
// ---------------------------------------
// Initialisations when module is created
// ---------------------------------------
begin
    FStageType := stNone ;
    FControlPort := 0 ;
    FBaudRate := 9600 ;
    Status := '' ;
    ControlState := csIdle ;
    XPosition := 0.0 ;
    XscaleFactor := 1.0 ;
    YPosition := 0.0 ;
    YScaleFactor := 1.0 ;
    ZPosition := 0.0 ;
    ZPositionMax := 10000.0 ;
    ZPositionMin := -10000.0 ;
    ZScaleFactor := 10.0 ;
    RequestedXPos := 0.0 ;
    RequestedYPos := 0.0 ;
    RequestedZPos := 0.0 ;

    CommandList := TStringList.Create ;
    ReplyList := TStringList.Create ;
    ComThread := Nil ;
    TickCounter := 0 ;
    Initialised := False ;
    WaitingForPositionUpdate := False ;

    MoveToRequest := False ;
    StageInitRequired := False ;
    end;

procedure TZStage.DataModuleDestroy(Sender: TObject);
// --------------------------------
// Tidy up when module is destroyed
// --------------------------------
begin
    if ComThread <> Nil then FreeAndNil(ComThread);
    CommandList.Free ;
    ReplyList.Free ;
    end;


procedure TZStage.GetZStageTypes( List : TStrings ) ;
// -----------------------------------
// Get list of supported Z stage types
// -----------------------------------
begin
      List.Clear ;
      List.Add('None') ;
      List.Add('Prior Optiscan II') ;
      List.Add('Prior Proscan III') ;
      List.Add('Piezo (Voltage Controlled)');
      end;

procedure TZStage.GetControlPorts( List : TStrings ) ;
// -----------------------------------
// Get list of available control ports
// -----------------------------------
var
    i : Integer ;
  iDev: Integer;
begin
     List.Clear ;
     case FStageType of
        stOptiscanII,stProScanIII : begin
          // COM ports
          List.Add(format('None',[0]));
          for i := 1 to 16 do List.Add(format('COM%d',[i]));
          end ;
        stPiezo : begin
          // Analog outputs
          for iDev := 1 to LabIO.NumDevices do
              for i := 0 to LabIO.NumDACs[iDev]-1 do begin
                List.Add(Format('Dev%d:AO%d',[iDev,i])) ;
                end;
          end;
        else begin
          List.Add('None');
          end ;
        end;
     end;


procedure TZStage.Open ;
// ---------------------------
// Open Z stage for operation
// ---------------------------
begin

    // Close COM thread (if open)
    if ComThread <> Nil then FreeAndNil(ComThread);

    case FStageType of
        stOptiscanII :
          begin
          ComThread := TZStageComThread.Create ;
          CommandList.Add('COMP 0') ;
          end;
        stProScanIII :
          begin
          ComThread := TZStageComThread.Create ;
          // Download stage protection handler
          // (Returns stage to Z=0 when stage microswitch triggered)
          CommandList.Add('COMP 0') ;
          CommandList.Add('SMZ 20') ;           // Set Z stage speed to 20% of maximum
          CommandList.Add( 'TTLDEL,1') ;
          CommandList.Add( 'TTLTP,1,1') ;       // Enable trigger on input #1 going high
          CommandList.Add( 'TTLACT,1,70,0,0,0') ; // Stop all movement
          CommandList.Add( 'TTLACT,1,31,0,0,0') ; // Move Z axis to zero position
          CommandList.Add( 'TTLTRG,1') ;         // Enable triggers
          ReplyZeroCount := 6 ;
          StageInitRequired := True ;
          end ;
        stPiezo :
          begin

          end;
        end;
    end;

function TZStage.GetScaleFactorUnits : string ;
// -------------------------------
// Return units for Z scale factor
// -------------------------------
begin
    case FStageType of
        stOptiscanII,stProScanIII : Result := 'steps/um' ;
        stPiezo : Result := 'V/um' ;
        else Result := '' ;
        end;
    end;


procedure TZStage.Close ;
// ---------------------------
// Close down Z stage operation
// ---------------------------
begin
    if ComThread <> Nil then FreeAndNil(ComThread);
    end;


procedure TZStage.MoveTo( X : Double ; // New X pos.
                          Y : Double ; // New Y pos.
                          Z : Double   // New Z pos.
                          ) ;
// ----------------
// Go to Z position
// ----------------
begin
    // Keep within limits
    Z := Min(Max(Z,ZPositionMin),ZPositionMax);

    case FStageType of
        stOptiscanII,stProScanIII : MoveToPrior(  X,Y,Z ) ;
        stPiezo : MoveToPZ( Z ) ;
        end;
    end;


procedure TZStage.MoveToPrior( X : Double ; // New X pos.
                               Y : Double ; // New Y pos.
                               Z : Double   // New Z pos.
                               ) ;
// ------------------------------
// Go to Z position (Optoscan II)
// ------------------------------
begin

    // Stop any stage moves in progress
    CommandList.Add('I') ;

    RequestedXPos := X ;
    RequestedYPos := Y ;
    RequestedZPos := Z ;

    // Move to new position
    CommandList.Add( format('G %d,%d,%d',
                     [Round(RequestedXPos*XScaleFactor),
                      Round(RequestedYPos*YScaleFactor),
                      Round(RequestedZPos*ZScaleFactor)]));

    end;


procedure TZStage.SetControlPort( Value : DWord ) ;
// ----------------
// Set Control Port
//-----------------
begin
    FControlPort := Max(Value,0) ;
    ResetCOMPort ;
    end;


procedure TZStage.SetBaudRate( Value : DWord ) ;
// ----------------------
// Set com Port baud rate
//-----------------------
begin
    if Value <= 0 then Exit ;
    FBaudRate := Value ;
    ResetCOMPort ;
    end;


procedure TZStage.ResetCOMPort ;
// --------------------------
// Reset COM port (if in use)
// --------------------------
begin
    case FStageType of
        stOptiscanII,stProScanIII :
          begin
          if ComThread <> Nil then
             begin
             FreeAndNil(ComThread);
             ComThread := TZStageCOMThread.Create ;
             end;
          end;
        end;
    end;


procedure TZStage.SetStageType( Value : Integer ) ;
// ------------------------------
// Set type of Z stage controller
// ------------------------------
begin
      // Close existing stage
      Close ;
      FStageType := Value ;
      // Reopen new stage
      Open ;
      end;

procedure TZStage.TimerTimer(Sender: TObject);
// --------------------------------------------
// Timed interval Z stage monitoring tasks
// --------------------------------------------
begin
   case FStageType of
        stOptiscanII,stProScanIII : PriorHandleMessages ;
   end;

end;


procedure TZStage.PriorHandleMessages ;
// -----------------------------------
// Handle Prior Z stage reply messages
// -----------------------------------
var
    OldInitialised : Boolean ;
    Reply,s,c : string ;
    i,iNum : Integer ;
begin

    OldInitialised := Initialised ;

    if Initialised and (not WaitingForPositionUpdate) then
       begin
       CommandList.Add('P') ;
       WaitingForPositionUpdate := True ;
       end;

    if ReplyList.Count > 0 then
       begin
       if (ReplyList[0] = 'R') {or (ReplyList[0] = 'O')} then
          begin
          end
       else if ReplyList[0] = '0' then
          begin
          Dec(ReplyZeroCount) ;
          if ReplyZeroCount = 0 then Initialised := True ;
          end
       else
          begin
          Reply := ReplyList[0] ;
          i := 1 ;
          s := '' ;
          iNum := 0 ;
          XScaleFactor := Max(XScaleFactor,1E-4) ;
          YScaleFactor := Max(YScaleFactor,1E-4) ;
          ZScaleFactor := Max(ZScaleFactor,1E-4) ;

          while i <= Length(Reply) do
                begin
                c := Reply[i] ;
                if (c = ',') or (i = Length(Reply)) then
                   begin
                   if c <> ',' then s := s + Reply[i] ;
                   // Remove error flag (if represent)
                   s := ReplaceText(s,'R','');
                   if (not ContainsText(s,'R')) and (s<>'') then
                     begin
                     case iNum of
                          0 : XPosition := StrToInt64(s)/XScaleFactor ;
                          1 : YPosition := StrToInt64(s)/YScaleFactor ;
                          2 : begin
                              ZPosition := StrToInt64(s)/ZScaleFactor ;
                              end;
                          end ;
                   end;
                Inc(INum) ;
                s := '' ;
                end
                else s := s + Reply[i] ;
                Inc(i) ;
                end;
          WaitingForPositionUpdate := False ;
          end;

       ReplyList.Delete(0);
       end;

    // Increment init counter
    Inc(TickCounter) ;
    // Initialise light source after 20 ticks (2 seconds) if not already init'd
    if TickCounter > 40 then Initialised := True ;

    end;


procedure TZStage.MoveToPZ( Position : Double ) ;
// -------------------------
// Go to Z position (Piezo)
// -------------------------
var
    iPort,iChan,iDev : Integer ;
begin

    ZPosition := Position ;

    iPort := 0 ;
    for iDev := 1 to LabIO.NumDevices do
        for iChan := 0 to LabIO.NumDACs[iDev]-1 do
            begin
            if iPort = FControlPort then
               begin
               LabIO.WriteDAC(iDev,Position*ZScaleFactor,iChan);
               end;
            inc(iPort) ;
            end;
    end ;


end.
