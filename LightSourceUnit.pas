unit LightSourceUnit;
// ========================================================================
// MesoCam: Light Source control module
// (c) J.Dempster, Strathclyde Institute for Pharmacy & Biomedical Sciences
// ========================================================================
// 20.03.17 USB-controlled CoolLED pE-x support added
// 14.06.17 USB serial communication working but not complete
// 38.08.17 Now uses correct COM port settings for CoolLED
//          Detects and reports failure to communicate with CoolLED
// 01.12.17 Wavelength list requested from CoolLED at 1 second intervals.
//          NamesChanged flag added indicating a wavelength name has changed
// 05.12.17 NamesChanged flag now also set if ControlLines changed
// 30.10.18 Now used ComThread for COM I/O to CoolLED
// 21.11.18 CoolLED light source list now obtained once after initialisation
//          .Update blocked until initialisation completed

interface



uses
  System.SysUtils, System.Classes, Windows, FMX.Dialogs, math, Vcl.ExtCtrls,
  system.StrUtils, System.Character, LightSourceComThreadUnit ;

const
  MaxLightSources = 8 ;
  lsNone = 0 ;
  lsLED = 1 ;
  lsCoolLED = 2 ;
  // Com port control flags
  dcb_Binary = $00000001;
  dcb_ParityCheck = $00000002;
  dcb_OutxCtsFlow = $00000004;
  dcb_OutxDsrFlow = $00000008;
  dcb_DtrControlMask = $00000030;
  dcb_DtrControlDisable = $00000000;
  dcb_DtrControlEnable = $00000010;
  dcb_DtrControlHandshake = $00000020;
  dcb_DsrSensivity = $00000040;
  dcb_TXContinueOnXoff = $00000080;
  dcb_OutX = $00000100;
  dcb_InX = $00000200;
  dcb_ErrorChar = $00000400;
  dcb_NullStrip = $00000800;
  dcb_RtsControlMask = $00003000;
  dcb_RtsControlDisable = $00000000;
  dcb_RtsControlEnable = $00001000;
  dcb_RtsControlHandshake = $00002000;
  dcb_RtsControlToggle = $00003000;
  dcb_AbortOnError = $00004000;
  dcb_Reserveds = $FFFF8000;
  CoolLEDRequestWavelengthsAtTick = 10 ;



type
  TLightSource = class(TDataModule)
    Timer: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FSourceType : Integer ;   // Type of light source
    Status : String ;         // Status report
    ControlState : Integer ;  // Control state
    FOn : Boolean ;           // TRUE = Light source(s) on
    ReplyBuf : string ;
    ComFailed : Boolean ;
    TickCounter : Integer ;  // Timer tick counter
    OldNames : Array[0..MaxLightSources-1] of string ; // Previous list of light source names
    OldControlLines : Array[0..MaxLightSources-1] of Integer ;

    ComThread : TLightSourceComThread ;

    procedure ResetCOMPort ;

    procedure SetBaudRate( Value : DWord ) ;
    procedure SetControlPort( Value : DWord ) ;
    procedure SetSourceType( Value : Integer ) ;
    procedure CoolLEDInit ;
    procedure CoolLEDHandleMessages ;
    procedure CoolLEDUpdate ;
    procedure LEDUpdate ;

  public
    { Public declarations }
    Active : Array [0..MaxLightSources-1] of Boolean ;
    Intensity : Array[0..MaxLightSources-1] of Double ;
    ControlLines : Array[0..MaxLightSources-1] of Integer ;
    Names : Array[0..MaxLightSources-1] of string ;
    NamesChanged : Boolean ;
    MinLevel : Array[0..MaxLightSources-1] of Double ;
    MaxLevel : Array[0..MaxLightSources-1] of Double ;
    List : Array[0..MaxLightSources-1] of Integer ;
    NumList : Integer ;
    ListIndex : Integer ;
    FControlPort : DWord ;    // Control port number
    CommandList : TstringList ;  // Light Source command list
    ReplyList : TstringList ;    // Light source replies
    Initialised : Boolean ;      // TRUE indicates light is initalised

    procedure GetSourceTypes( List : TStrings ) ;
    procedure GetControlLineNames( List : TStrings ) ;
    procedure Update ;
    procedure Open ;
    procedure Close ;
    procedure GetControlPorts( List : TStrings ) ;
    procedure SetOn( Value : Boolean ) ;

    Property ControlPort : DWORD read FControlPort write SetControlPort ;
    Property SourceType : Integer read FSourceType write SetSourceType ;
    Property On : Boolean read FOn write SetOn ;

  end;

var
    LightSource : TLightSource ;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses LabIOUnit, mmsystem ;

const
    csIdle = 0 ;
    csWaitingForPosition = 1 ;
    csWaitingForCompletion = 2 ;


{$R *.dfm}

procedure TLightSource.GetSourceTypes( List : TStrings ) ;
// -----------------------------------
// Get list of supported light sources
// -----------------------------------
begin
      List.Clear ;
      List.Add('None') ;
      List.Add('LED (Digital/Analogue Control)') ;
      List.Add('Cool-LED pe-4000/pe-2') ;
      end;

procedure TLightSource.DataModuleCreate(Sender: TObject);
var
  I: Integer;
// --------------------------------
// Initialise light source settings
// --------------------------------
begin

    FSourceType := lsNone ;
    FControlPort := 0 ;
    Status := '' ;
    ControlState := csIdle ;
    ReplyBuf := '' ;
    ComFailed := False ;
    TickCounter := 0 ;
    NamesChanged := False ;

    for I := 0 to High(Names) do begin
        Names[i] := format('LS%d',[i]) ;
        OldNames[i] := '' ;
        ControlLines[i] := LineDisabled ;
        OldControlLines[i] := -1 ;
        MinLevel[i] := 0.0 ;
        MaxLevel[i] := 5.0 ;
        end;

    CommandList := TStringList.Create ;
    ReplyList := TStringList.Create ;
    ComThread := Nil ;

    end;


procedure TLightSource.DataModuleDestroy(Sender: TObject);
// ---------------------------
// Tidy up when form destroyed
// ---------------------------
begin
    if ComThread <> Nil then FreeAndNil(ComThread);
    CommandList.Free ;
    ReplyList.Free ;
    end;


procedure TLightSource.Open ;
// -------------------------------
// Open light source for operation
// -------------------------------
var
    i : Integer ;
begin

    // Clear old name list
    for i := 0 to High(OldNames) do OldNames[i] := '' ;

    // Close COM port (if open)
    if ComThread <> Nil then FreeAndNil(ComThread);

    case FSourceType of
        lsCoolLED : begin
          ComThread := TLightSourceComThread.Create ;
          CoolLEDInit ;
          end ;
        lsLED : begin
          Initialised := True ;
          end;
        end;

    for i := 0 to High(OldNames) do OldNames[i] := '' ;

    end;


procedure TLightSource.Close ;
// ---------------------------
// Close down Z stage operation
// ---------------------------
begin
    // Close COM thread (if active)
    if ComThread <> Nil then FreeAndNil(ComThread); ;

    end;


Procedure TLightSource.GetControlLineNames( List : TStrings ) ;
// -----------------------------------
// Get list of available control ports
// -----------------------------------
var
  i : Integer ;
  s : string ;
begin
     List.Clear ;

    List.AddObject('None',TObject(LineDisabled)) ;
    for i := 0 to LabIO.NumResources-1 do
        begin
        if (LabIO.Resource[i].ResourceType = DACOut) then
           begin
           // Analog outputs
           s := format('Dev%d: AO.%d',
                 [LabIO.Resource[i].Device,
                  LabIO.Resource[i].StartChannel]) ;
                List.AddObject(s,TObject(i))
           end
        else if (LabIO.Resource[i].ResourceType = DIGOut) then
           begin
           // Digital outputs
           s := format('Dev%d: PO.%d',
                 [LabIO.Resource[i].Device,
                  LabIO.Resource[i].StartChannel]) ;
                List.AddObject(s,TObject(i))
           end ;
        end;
     end;


procedure TLightSource.SetOn( Value : Boolean ) ;
// -------------------------
// Turn light sources On/Off
// -------------------------
begin
      FOn := Value ;
      Update ;
end;


procedure TLightSource.Update ;
// --------------------
// Update light sources
// --------------------
begin

   if not Initialised then Exit ;

   case SourceType of
        lsLED : LEDUpdate ;
        lsCoolLED : CoolLEDUpdate ;
        end;

end;


procedure TLightSource.LEDUpdate ;
// --------------------------------------------------
// Update digital/analogue light source control lines
// --------------------------------------------------
var
    V : Single ;
    i,Dev,Chan,OnState,OffState  : Integer ;
    ResourceType : TResourceType ;
begin
     for i := 0 to High(ControlLines) do if ControlLines[i] < LineDisabled then
        begin

        Dev := LabIO.Resource[ControlLines[i]].Device ;
        Chan := LabIO.Resource[ControlLines[i]].StartChannel ;
        ResourceType := LabIO.Resource[ControlLines[i]].ResourceType ;


        if ResourceType = DACOut then
           begin
           // Analogue outputs
           // Set LED level
           if Active[i] and FOn then V := (MaxLevel[i] - MinLevel[i])*(Intensity[i]/100.0) + MinLevel[i]
                                else V := MinLevel[i] ;
           LabIO.DACOutState[Dev][Chan] := V ;
           LabIO.WriteDAC(Dev,V,Chan);
           end
        else if ResourceType = DIGOut then
           begin
           // Digital outputs
           // Set On/Off state depending on polarity of MaxLevel - MinLevel
           if MaxLevel[i] >= MinLevel[i] then
              begin
              // Active High
              OnState := 1 ;
              OffState := 0 ;
              end
           else
              begin
              // Active Low
              OnState := 0 ;
              OffState := 1 ;
              end ;
           if Active[i] and FOn then LabIO.SetBit(LabIO.DigOutState[Dev],Chan,OnState)
                                else LabIO.SetBit(LabIO.DigOutState[Dev],Chan,OffState) ;
           end;
        end;

     // Update digital outputs
     for Dev := 1 to LabIO.NumDevices do LabIO.WriteToDigitalOutPutPort( Dev, LabIO.DigOutState[Dev] ) ;

     end;


procedure TLightSource.CoolLEDUpdate ;
// ---------------------------
// Update CoolLED light source
// ---------------------------
var
  i: Integer;
  SourceLetter : Array[0..3] of string ;
  s,sIntensity : string ;
  OK : Boolean ;
begin

    SourceLetter[0] := 'CA' ;
    SourceLetter[1] := 'CB' ;
    SourceLetter[2] := 'CC' ;
    SourceLetter[3] := 'CD' ;
    for i := 0 to 3 do if (ControlLines[i] <> LineDisabled) then
        begin
        Intensity[i] := Min(Max(Intensity[i],0.0),100.0);
        sIntensity := format('%d',[Round(Intensity[i])]) ;
        if Length(sIntensity) < 3 then sIntensity := '0' + sIntensity ;
        if Length(sIntensity) < 3 then sIntensity := '0' + sIntensity ;
        CommandList.Add(SourceLetter[i] + 'I' + sIntensity ) ;
        if Active[i] and FOn then s := SourceLetter[i] + 'N'
                             else s := SourceLetter[i] + 'F' ;
        CommandList.Add(s) ;
        end ;

    end;


procedure TLightSource.SetSourceType( Value : Integer ) ;
// ------------------------
// Set type of light source
// ------------------------
begin
      // Close existing stage
      Close ;
      FSourceType := Value ;
      // Reopen new stage
      Open ;
      end;


procedure TLightSource.TimerTimer(Sender: TObject);
// --------------------------------------------
// Timed interval light source monitoring tasks
// --------------------------------------------
var
    i : Integer ;
begin

   case SourceType of
        lsCoolLED : CoolLEDHandleMessages ;
   end;

   // Set flag if names have changed
   NamesChanged := False ;
   for i := 0 to High(Names) do
       begin
       if Names[i] <> OldNames[i] then NamesChanged := True ;
       if ControlLines[i] <> OldControlLines[i] then NamesChanged := True ;
       OldNames[i] := Names[i] ;
       OldControlLines[i]:= ControlLines[i] ;
       end;

end ;


procedure TLightSource.CoolLEDHandleMessages ;
// -----------------------------
// Handle CoolLED reply messages
// -----------------------------
var
    EndOfLine,OldInitialised : Boolean ;
    sNum : string ;
    i : Integer ;
begin

    OldInitialised := Initialised ;

    // Disable unsupported lines
    ControlLines[4] := LineDisabled ;
    ControlLines[5] := LineDisabled ;
    ControlLines[6] := LineDisabled ;
    ControlLines[7] := LineDisabled ;

    if ReplyList.Count > 0 then
       begin
       if ANSIContainsStr( ReplyList[0], 'LAM:' ) then
          begin
          ReplyBuf := ReplyList[0] ;
          sNum := '' ;
          for i := 1 to Length(ReplyBuf) do
              if IsNumber(ReplyBuf[i]) then sNum := sNum + ReplyBuf[i] ;

          if ANSIContainsStr( ReplyBuf, 'LAM:A' ) then
             begin
             Names[0] := sNum + 'nm' ;
             ControlLines[0] := 0 ;
             end;
          if ANSIContainsStr( ReplyBuf, 'LAM:B' ) then
             begin
             Names[1] := sNum + 'nm' ;
             ControlLines[1] := 1 ;
             end;
           if ANSIContainsStr( ReplyBuf, 'LAM:C' ) then
              begin
              Names[2] := sNum + 'nm' ;
              ControlLines[2] := 2 ;
              end;
            if ANSIContainsStr( ReplyBuf, 'LAM:D' ) then
               begin
               Names[3] := sNum + 'nm' ;
               ControlLines[3] := 3 ;
               Initialised := True ;
               end;
          end;
       ReplyList.Delete(0);
       end;

    // Increment init counter
    Inc(TickCounter) ;
    // Initialise light source after 20 ticks (2 seconds) if not already init'd
    if TickCounter > 20 then Initialised := True ;

    // Update light source when initialised
    if Initialised <> OldInitialised then Update ;

    end;




procedure TLightSource.SetControlPort( Value : DWord ) ;
// -----------------------
// Set Control Serial Port
//------------------------
begin
    FControlPort := Max(Value,0) ;
//    ResetCOMPort ;
    end;


procedure TLightSource.SetBaudRate( Value : DWord ) ;
// ----------------------
// Set com Port baud rate
//-----------------------
begin
    if Value <= 0 then Exit ;
//    FBaudRate := Value ;
//    ResetCOMPort ;
    end;


procedure TLightSource.ResetCOMPort ;
// --------------------------
// Reset COM port (if in use)
// --------------------------
begin
    case FSourceType of
        lsCoolLED :
          begin
          if ComThread <> Nil then
             begin
             FreeAndNil(ComThread);
             ComThread := TLightSourceCOMThread.Create ;
             end;
          end;
        end;
    end;


procedure TLightSource.GetControlPorts( List : TStrings ) ;
// -----------------------------------
// Get list of available control ports
// -----------------------------------
var
    i : Integer ;
begin
    // COM ports
    for i := 1 to 16 do List.Add(format('COM%d',[i]));
    end;


procedure TLightSource.CoolLEDInit ;
// -------------------------
// Initialise CoolLED device
// -------------------------
var
    i : Integer ;
begin

    // Clear control lines
    for I := 0 to High(ControlLines) do ControlLines[i] := LineDisabled ;

    // Request list of wavelengths available
    CommandList.Add('LAMS');

//    if COMFailed then ShowMessage('CoolLED Initialization: Device not responding to command!');

    TickCounter := 0 ; // Set tick counter to zero to ensure 1 second deley before next wavelength request
    Initialised := False ;

    end;




end.



