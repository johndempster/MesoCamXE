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
// 15.01.19 Adding support for Thorlabs TDC001
// 20.02.19 COM port thread now terminated before freeing.

interface

uses
  System.SysUtils, System.Classes, Windows, FMX.Dialogs, math, strutils, ZStageComThreadUnit,
  Vcl.ExtCtrls ;

type

  TTLI_DeviceInfo = packed record
     typeID : DWord ;
     description : Array[0..64] of ANSIChar ;
     serialNo : Array[0..8] of ANSIChar ;
     PID :DWORD ;
     isKnownType : Boolean ;
     motorType : DWord ;
     isPiezoDevice : Boolean ;
     isLaser : Boolean ;
     isCustomType : Boolean ;
     isRack : Boolean ;
     maxChannels : SmallInt
     end ;

  TTLI_BuildDeviceList = function : SmallInt ; cdecl ;
  TTLI_GetDeviceListSize = function : SmallInt ; cdecl ;
  TLI_GetDeviceListByTypeExt = function(
                               receiveBuffer : PANSIChar ;
                               sizeOfBuffer : DWORD ;
                               typeID : Integer ) : SmallInt ; cdecl ;
  TTLI_GetDeviceInfo = function(
                       serialNo :PANSIChar ;
                       info : TTLI_DeviceInfo ) : SmallInt ; cdecl ;
  TCC_Open = function( serialNo :PANSIChar ) : SmallInt ; cdecl ;
  TCC_Close = procedure( serialNo :PANSIChar ) ; cdecl ;
  TCC_StartPolling = function(  serialNo :PANSIChar ;
                                Milliseconds : Integer ) : WordBool ; cdecl ;
  TCC_StopPolling = function(  serialNo :PANSIChar ) : WordBool ; cdecl ;
  TCC_ClearMessageQueue = procedure(  serialNo :PANSIChar ) ; cdecl ;
  TCC_Home = function(  serialNo :PANSIChar ) : SmallInt ; cdecl ;
  TCC_WaitForMessage = function(
                       serialNo :PANSIChar ;
                       var messageType : DWORD ;
                       var messageID : DWORD ;
                       var messageData : DWORD ) : Boolean ; cdecl ;
  TCC_GetVelParams = function(
                       serialNo :PANSIChar ;
                       var acceleration : Integer ;
                       var maxVelocity : Integer ) : SmallInt ; cdecl ;
  TCC_SetVelParams = function(
                       serialNo :PANSIChar ;
                       acceleration : Integer ;
                       maxVelocity : Integer ) : SmallInt ; cdecl ;
  TCC_MoveToPosition = function(
                       serialNo :PANSIChar ;
                       Index : Integer ) : SmallInt ; cdecl ;
  TCC_GetPosition = function(
                    serialNo :PANSIChar ) : Integer ; cdecl ;

  TCC_GetMotorParamsExt = function(
                          serialNo : PANSIChar ;
                          var stepsPerRev : double ;
                          var gearBoxRatio : double ;
                          var pitch : double ) : SMallInt ; cdecl ;

  TCC_GetRealValueFromDeviceUnit = function(
                                   serialNo : PANSIChar ;
                                   device_unit : Integer ;
                                   //var real_unit : Double ;
                                   p : Pointer ;
                                   unitType : Integer ) : SMallInt ; cdecl ;

  TCC_GetDeviceUnitFromRealValue = function(
                                   serialNo : PANSIChar ;
                                   real_unit : Double ;
                                   var device_unit : Integer ;
                                   unitType : Integer ) : SMallInt ; cdecl ;

  TCC_SetMotorTravelLimits = function(
                             serialNo : PANSIChar ;
                             minPosition : Double ;
                             maxPosition : Double ) : SMallInt ; cdecl ;

  TCC_GetMotorTravelLimits = function(
                             serialNo : PANSIChar ;
                             var minPosition : Double ;
                             var maxPosition : Double ) : SMallInt ; cdecl ;

  TZStage = class(TDataModule)
    Timer1: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FStageType : Integer ;    // Type of stage
    FStageIsOpen : Boolean ;       // TRUE = stage is open for use
    FSerialNumber : ANSIString  ;  // Device serial number

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

    // Thorlabs TDC001 procedures and variables
    LibraryHnd : THandle ;
    CommonLibraryHnd : THandle ;
    mmToDeviceUnits : Double ;
    DeviceUnitsTomm : Double ;

    TLI_BuildDeviceList : TTLI_BuildDeviceList ;
    TLI_GetDeviceListSize : TTLI_GetDeviceListSize ;
    TLI_GetDeviceListByTypeExt : TLI_GetDeviceListByTypeExt ;
    TLI_GetDeviceInfo : TTLI_GetDeviceInfo ;
    CC_Open : TCC_Open ;
    CC_Close : TCC_Close ;
    CC_StartPolling : TCC_StartPolling ;
    CC_StopPolling : TCC_StopPolling ;
    CC_ClearMessageQueue : TCC_ClearMessageQueue ;
    CC_Home : TCC_Home ;
    CC_WaitForMessage : TCC_WaitForMessage ;
    CC_GetVelParams : TCC_GetVelParams ;
    CC_SetVelParams : TCC_SetVelParams ;
    CC_MoveToPosition : TCC_MoveToPosition ;
    CC_GetPosition : TCC_GetPosition ;
    CC_GetMotorParamsExt : TCC_GetMotorParamsExt ;
    CC_GetRealValueFromDeviceUnit : TCC_GetRealValueFromDeviceUnit ;
    CC_GetDeviceUnitFromRealValue : TCC_GetDeviceUnitFromRealValue ;
    CC_SetMotorTravelLimits : TCC_SetMotorTravelLimits ;
    CC_GetMotorTravelLimits : TCC_GetMotorTravelLimits ;

    procedure SetControlPort( Value : DWord ) ;
    procedure SetStageType( Value : Integer ) ;

    procedure MoveToPrior( X : Double ; // New X pos.
                          Y : Double ; // NEw Y pos.
                          Z : Double  // New Z pos.
                          ) ;

    procedure MoveToPZ( Position : Double ) ;
    function GetScaleFactorUnits : string ;
    procedure StopComThread ;
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

    function IsControlPortRequired : Boolean ;
    function IsSerialNumberRequired : Boolean ;
    procedure SetSerialNumber( Value : String ) ;
    function GetSerialNumber : string ;

    procedure PriorHandleMessages ;

    procedure TDC001_Open ;
    procedure TDC001_GetPosition ;
    procedure TDC001_MoveTo( Z : Double ) ;
    procedure TDC001_Close ;
    procedure TDC001_LoadLibrary ;

    function GetDLLAddress(
             Handle : THandle ;
             const ProcName : string ) : Pointer ;

  published
    Property ControlPort : DWORD read FControlPort write SetControlPort ;
    Property StageType : Integer read FStageType write SetStageType ;
    Property ScaleFactorUnits : string read GetScaleFactorUnits ;
    Property ControlPortRequired : Boolean read IsControlPortRequired ;
    Property SerialNumberRequired : Boolean read IsSerialNumberRequired ;
    Property SerialNumber : String read GetSerialNumber write SetSerialNumber ;
    Property IsOpen : Boolean read FStageIsOpen ;
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
    stTDC001 = 4 ;

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

    // Thorlab device variable inits.
    FSerialNumber := '0' ;
    LibraryHnd := 0 ;
    CommonLibraryHnd := 0 ;
    FStageIsOpen := False ;

    end;

procedure TZStage.DataModuleDestroy(Sender: TObject);
// --------------------------------
// Tidy up when module is destroyed
// --------------------------------
begin
    StopComThread ;
    CommandList.Free ;
    ReplyList.Free ;

    // Free DLLs
    //if LibraryHnd <> 0 then FreeLibrary(LibraryHnd) ;
    LibraryHnd := 0 ;

    if CommonLibraryHnd <> 0 then FreeLibrary(CommonLibraryHnd) ;
    CommonLibraryHnd := 0 ;


    end;

procedure TZStage.StopComThread ;
// ------------------------
// Stop and free COM thread
// ------------------------
begin
     if ComThread = Nil Then Exit ;
     ComThread.Terminate ;
     ComThread.WaitFor ;
     FreeAndNil(ComThread);
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
      List.Add('Thorlabs TDC001');
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
    StopComThread ;

    case FStageType of
        stOptiscanII :
          begin
          ComThread := TZStageComThread.Create ;
          CommandList.Add('COMP 0') ;
          FStageIsOpen := True ;
          end;
        stProScanIII :
          begin
          ComThread := TZStageComThread.Create ;
          // Download stage protection handler
          // (Returns stage to Z=0 when stage microswitch triggered
          CommandList.Add('COMP 0') ;
          CommandList.Add('SMZ 20') ;           // Set Z stage speed to 20% of maximum
          CommandList.Add( 'TTLDEL,1') ;
          CommandList.Add( 'TTLTP,1,1') ;       // Enable trigger on input #1 going high
          CommandList.Add( 'TTLACT,1,70,0,0,0') ; // Stop all movement
          CommandList.Add( 'TTLACT,1,31,0,0,0') ; // Move Z axis to zero position
          CommandList.Add( 'TTLTRG,1') ;         // Enable triggers
          ReplyZeroCount := 6 ;
          StageInitRequired := True ;
          WaitingForPositionUpdate := False ;
          FStageIsOpen := True ;
          end ;

        stPiezo :
          begin
          FStageIsOpen := True ;
          end;

        stTDC001 :
          begin
          TDC001_Open ;
          end;

        else
          begin
          FStageIsOpen := True ;
          end;

        end;
    end;

function TZStage.GetScaleFactorUnits : string ;
// -------------------------------
// Return units for Z scale factor
// -------------------------------
begin
    case FStageType of
        stOptiscanII,stProScanIII,stTDC001 : Result := 'steps/um' ;
        stPiezo : Result := 'V/um' ;
        else Result := '' ;
        end;
    end;


procedure TZStage.Close ;
// ---------------------------
// Close down Z stage operation
// ---------------------------
begin

    if not FStageIsOpen then Exit ;

    // Stop COM port thread if it is running
    StopComThread ;

    case FStageType of
        stTDC001 :
          begin
          TDC001_Close ;
          end;
    end;

    FStageIsOpen := False ;

    end;


procedure TZStage.MoveTo( X : Double ; // New X pos.
                          Y : Double ; // New Y pos.
                          Z : Double   // New Z pos.
                          ) ;
// ----------------
// Go to Z position
// ----------------
begin

    if not FStageIsOpen then Exit ;

    // Keep within limits
    Z := Min(Max(Z,ZPositionMin),ZPositionMax);

    case FStageType of
        stOptiscanII,stProScanIII : MoveToPrior(  X,Y,Z ) ;
        stTDC001 : TDC001_MoveTo(Z) ;
        stPiezo : MoveToPZ( Z ) ;
        end;
    end;


function TZStage.IsControlPortRequired : Boolean ;
// --------------------------------------------------------------------
// Returns TRUE if a control port is required to communicate with stage
// --------------------------------------------------------------------
begin
    case FStageType of
        stOptiscanII,stProScanIII,stPiezo : Result := True ;
        else Result := False ;
        end;
end ;

function TZStage.IsSerialNumberRequired : Boolean ;
// --------------------------------------------------------------------
// Returns TRUE if a serial number is required to identify the stage
// --------------------------------------------------------------------
begin
    case FStageType of
        stTDC001 : Result := True
        else Result := False ;
        end;
end ;


procedure TZStage.SetSerialNumber( Value : string ) ;
// ------------------------
// Set device serial number
// ------------------------
begin
    if FSerialNumber <> Value then
       begin
       FSerialNumber := ansisTRING(Value) ;
       if IsSerialNumberRequired and FStageIsOpen then
          begin
          // Close and re-open stage
          Close ;
          Open ;
          end;
       end;
end;


function TZStage.GetSerialNumber : string ;
// ------------------------
// Get device serial number
// ------------------------
begin
     Result := FSerialNumber ;
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

    // If stage is open for use, close and re-open
    if FStageIsOpen then
       begin
       Close ;
       Open ;
       end;
    end;


procedure TZStage.SetStageType( Value : Integer ) ;
// ------------------------------
// Set type of Z stage controller
// ------------------------------
begin

      if not FStageIsOpen then FStageType := Value
      else
        begin
        // If stage is open, close, set type and re-open
        Close ;
        FStageType := Value ;
        Open ;
        end;
      end;


procedure TZStage.Timer1Timer(Sender: TObject);
// --------------------------------------------
// Timed interval Z stage monitoring tasks
// --------------------------------------------
begin

   if not FStageIsOpen then Exit ;

   case FStageType of
        stOptiscanII,stProScanIII : PriorHandleMessages ;
        stTDC001 : TDC001_GetPosition ;
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


procedure TZStage.TDC001_Open ;
// --------------------
// Open Thorlabs device
// --------------------
begin

    FStageIsOpen := False ;

    // Load DLL library
    TDC001_LoadLibrary ;

    // Open selected device
    if CC_Open(PANSIChar(FSerialNumber)) <> 0 then Exit ;

    CC_StartPolling(PANSIChar(FSerialNumber), 200);
    CC_ClearMessageQueue(PANSIChar(FSerialNumber));

    // Move to home position
    CC_Home(PANSIChar(FSerialNumber)) ;

    FStageIsOpen := True ;

    end;


procedure TZStage.TDC001_LoadLibrary ;
// -----------------------------
// Load Thorlabs DLL libraries
// -----------------------------
var
    Path : Array[0..255] of Char ;
    LibFileName,SYSDrive : String ;
begin

     // Exit if library already loaded
     if LibraryHnd <> 0 then Exit ;

     
     // Get system drive
     GetSystemDirectory( Path, High(Path) ) ;
     SYSDrive := ExtractFileDrive(String(Path)) ;

    LibFileName := SYSDrive + '\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManager.DLL' ;
    CommonLibraryHnd := LoadLibrary( PChar(LibFileName ) );
    if CommonLibraryHnd = 0 then begin
       ShowMessage( 'Unable to open' + LibFileName ) ;
       Exit ;
       end ;

    LibFileName :=      SYSDrive + '\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.TCube.DCServo.DLL' ;
    LibraryHnd := LoadLibrary( PChar(LibFileName));
    if LibraryHnd = 0 then begin
       ShowMessage( 'Unable to open' + LibFileName ) ;
       Exit ;
       end ;

    @TLI_BuildDeviceList := GetDLLAddress( LibraryHnd, 'TLI_BuildDeviceList' ) ;
    @TLI_GetDeviceListSize := GetDLLAddress( LibraryHnd, 'TLI_GetDeviceListSize' ) ;
    @TLI_GetDeviceListByTypeExt := GetDLLAddress( LibraryHnd, 'TLI_GetDeviceListByTypeExt' ) ;
    @TLI_GetDeviceInfo := GetDLLAddress( LibraryHnd, 'TLI_GetDeviceInfo' ) ;
    @CC_Open := GetDLLAddress( LibraryHnd, 'CC_Open' ) ;
    @CC_Close := GetDLLAddress( LibraryHnd, 'CC_Close' ) ;
    @CC_StartPolling := GetDLLAddress( LibraryHnd, 'CC_StartPolling' ) ;
    @CC_StopPolling := GetDLLAddress( LibraryHnd, 'CC_StopPolling' ) ;
    @CC_ClearMessageQueue := GetDLLAddress( LibraryHnd, 'CC_ClearMessageQueue' ) ;
    @CC_Home := GetDLLAddress( LibraryHnd, 'CC_Home' ) ;
    @CC_WaitForMessage := GetDLLAddress( LibraryHnd, 'CC_WaitForMessage' ) ;
    @CC_GetVelParams := GetDLLAddress( LibraryHnd, 'CC_GetVelParams' ) ;
    @CC_SetVelParams := GetDLLAddress( LibraryHnd, 'CC_SetVelParams' ) ;
    @CC_MoveToPosition := GetDLLAddress( LibraryHnd, 'CC_MoveToPosition' ) ;
    @CC_GetPosition := GetDLLAddress( LibraryHnd, 'CC_GetPosition' ) ;
    @CC_GetMotorParamsExt := GetDLLAddress( LibraryHnd, 'CC_GetMotorParamsExt' ) ;
    @CC_GetRealValueFromDeviceUnit := GetDLLAddress( LibraryHnd, 'CC_GetRealValueFromDeviceUnit' ) ;
    @CC_GetDeviceUnitFromRealValue := GetDLLAddress( LibraryHnd, 'CC_GetDeviceUnitFromRealValue' ) ;
    @CC_SetMotorTravelLimits := GetDLLAddress( LibraryHnd, 'CC_SetMotorTravelLimits' ) ;
    @CC_GetMotorTravelLimits := GetDLLAddress( LibraryHnd, 'CC_GetMotorTravelLimits' ) ;

end;


procedure TZStage.TDC001_GetPosition ;
// --------------------------------
// Handle data returned from TDC001
// --------------------------------
var
    DeviceUnits : Integer ;
    ii : Int64 ;
begin
  if not FStageIsOpen then Exit ;
  DeviceUnits := CC_GetPosition( PANSIChar(FSerialNumber) ) ;
  if ZScaleFactor <> 0.0 then ZPosition := DeviceUnits / ZScaleFactor ;
end;


procedure TZStage.TDC001_MoveTo( Z : Double ) ;
// -------------------------------------
// Move to selected Z position (microns)
// -------------------------------------
var
    Steps : Integer ;
begin

    // Keep within limits
    z := Max(Min(Z,ZPositionMax),ZPositionMin);

    Steps := Round(Z*ZScaleFactor) ;
    CC_MoveToPosition( PANSIChar(FSerialNumber), Steps ) ;

end;


procedure TZStage.TDC001_Close ;
// ----------------------------------------
// Close Thorlabs TDC001 DC servo controller
// ----------------------------------------
begin

    if not FStageIsOpen then Exit ;

    // Stop polling device
    CC_StopPolling(PANSIChar(FSerialNumber)) ;

    CC_ClearMessageQueue(PANSIChar(FSerialNumber)) ;

    // Close device
    CC_Close(PANSIChar(FSerialNumber)) ;

    FStageIsOpen := False ;

end;


function TZStage.GetDLLAddress(
         Handle : THandle ;
         const ProcName : string ) : Pointer ;
// -----------------------------------------
// Get address of procedure within DLL
// -----------------------------------------
begin

    Result := GetProcAddress(Handle,PChar(ProcName)) ;
    if Result = Nil then ShowMessage('DLL: ' + ProcName + ' not found') ;
    end ;



end.
