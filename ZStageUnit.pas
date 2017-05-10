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

interface

uses
  System.SysUtils, System.Classes, Windows, FMX.Dialogs, math ;

type
  TZStage = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FStageType : Integer ;    // Type of stage
    ComHandle : THandle ;     // Com port handle
    ComPortOpen : Boolean ;   // Com port open flag
    FControlPort : DWord ;    // Control port number
    FBaudRate : DWord ;       // Com port baud rate
    ControlState : Integer ;  // Z stage control state
    Status : String ;         // Z stage status report
    MoveToRequest : Boolean ;   // Go to requested flag
    MoveToPosition : Double ;   // Position (um) to go to
    NewXPosition : Double ;   // New X position (requested)
    NewYPosition : Double ;   // New Y position (requested)
    NewZPosition : Double ;   // New Z position (requested)

    OverLapStructure : POVERLAPPED ;

    procedure OpenCOMPort ;
    procedure CloseCOMPort ;
    procedure ResetCOMPort ;
    function SendCommand( const Line : string ) : Boolean ;
    function ReceiveBytes( var EndOfLine : Boolean ) : string ;
    procedure SetControlPort( Value : DWord ) ;
    procedure SetBaudRate( Value : DWord ) ;
    procedure SetStageType( Value : Integer ) ;

    procedure UpdateZPositionOSII ;
    procedure UpdateZPositionPZ ;
    procedure MoveToOSII( X : Double ; // New X pos.
                          Y : Double ; // NEw Y pos.
                          Z : Double  // New Z pos.
                          ) ;

    procedure MoveToPZ( Position : Double ) ;
    function GetScaleFactorUnits : string ;
    procedure ProScanEnableZStageTTLAction ;
    procedure WaitforCompletion ;
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
    procedure Open ;
    procedure Close ;
    procedure UpdateZPosition ;
    procedure MoveTo( X : Double ; // New X pos.
                      Y : Double ; // NEw Y pos.
                      Z : Double  // New Z pos.
                      ) ;
    procedure GetZStageTypes( List : TStrings ) ;
    procedure GetControlPorts( List : TStrings ) ;

  published
    Property ControlPort : DWORD read FControlPort write SetControlPort ;
    Property BaudRate : DWORD read FBaudRate write SetBaudRate ;
    Property StageType : Integer read FStageType write SetStageType ;
    Property ScaleFactorUnits : string read GetScaleFactorUnits ;
  end;

var
  ZStage: TZStage;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

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


procedure TZStage.DataModuleCreate(Sender: TObject);
// ---------------------------------------
// Initialisations when module is created
// ---------------------------------------
begin
    FStageType := stNone ;
    ComPortOpen := False ;
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
    ZScaleFactor := 1.0 ;
    NewXPosition := 0.0 ;
    NewYPosition := 0.0 ;
    NewZPosition := 0.0 ;
    MoveToRequest := False ;
    end;

procedure TZStage.DataModuleDestroy(Sender: TObject);
// --------------------------------
// Tidy up when module is destroyed
// --------------------------------
begin
    if ComPortOpen then CloseComPort ;
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

    // Close COM port (if open)
    if ComPortOpen then CloseComPort ;

    case FStageType of
        stOptiscanII,stProScanIII : begin
          OpenComPort ;
          end ;
        stPiezo : begin

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
    if ComPortOpen then CloseComPort ;
    end;


procedure TZStage.UpdateZPosition ;
// ---------------------------
// Update position of Z stage
// ---------------------------
begin
    case FStageType of
        stOptiscanII,stProScanIII : UpdateZPositionOSII ;
        stPiezo : UpdateZPositionPZ ;
        end;
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
        stOptiscanII,stProScanIII : MoveToOSII(  X,Y,Z ) ;
        stPiezo : MoveToPZ( Z ) ;
        end;
    end;


procedure TZStage.OpenCOMPort ;
// ----------------------------------------
// Establish communications with COM port
// ----------------------------------------
var
   DCB : TDCB ;           { Device control block for COM port }
   CommTimeouts : TCommTimeouts ;
begin
     if ComPortOpen then Exit ;

     { Open com port  }
     ComHandle :=  CreateFile( PCHar(format('COM%d',[ControlPort+1])),
                     GENERIC_READ or GENERIC_WRITE,
                     0,
                     Nil,
                     OPEN_EXISTING,
                     FILE_ATTRIBUTE_NORMAL,
                     0) ;

     if ComHandle < 0 then Exit ;

     { Get current state of COM port and fill device control block }
     GetCommState( ComHandle, DCB ) ;
     { Change settings to those required for 1902 }
     DCB.BaudRate := CBR_9600 ;
     DCB.ByteSize := 8 ;
     DCB.Parity := NOPARITY ;
     DCB.StopBits := ONESTOPBIT ;

     { Update COM port }
     SetCommState( ComHandle, DCB ) ;

     { Initialise Com port and set size of transmit/receive buffers }
     SetupComm( ComHandle, 4096, 4096 ) ;

     { Set Com port timeouts }
     GetCommTimeouts( ComHandle, CommTimeouts ) ;
     CommTimeouts.ReadIntervalTimeout := $FFFFFFFF ;
     CommTimeouts.ReadTotalTimeoutMultiplier := 0 ;
     CommTimeouts.ReadTotalTimeoutConstant := 0 ;
     CommTimeouts.WriteTotalTimeoutMultiplier := 0 ;
     CommTimeouts.WriteTotalTimeoutConstant := 5000 ;
     SetCommTimeouts( ComHandle, CommTimeouts ) ;

     ComPortOpen := True ;
      Status := '' ;
    ControlState := csIdle ;

    end ;


procedure TZStage.CloseCOMPort ;
// ----------------------
// Close serial COM port
// ----------------------
begin
     if ComPortOpen then CloseHandle( ComHandle ) ;
     ComPortOpen := False ;
     end ;

function TZStage.SendCommand(
          const Line : string   { Text to be sent to Com port }
          ) : Boolean ;
{ --------------------------------------
  Write a line of ASCII text to Com port
  --------------------------------------}
var
   i : Integer ;
   nWritten,nC : DWORD ;
   xBuf : array[0..258] of ansichar ;
   Overlapped : Pointer ;
   OK : Boolean ;
begin

     { Copy command line to be sent to xMit buffer and and a CR character }
     nC := Length(Line) ;
     for i := 1 to nC do xBuf[i-1] := ANSIChar(Line[i]) ;
     xBuf[nC] := #13 ;
     Inc(nC) ;

    Overlapped := Nil ;
    OK := WriteFile( ComHandle, xBuf, nC, nWritten, Overlapped ) ;
    if (not OK) or (nWRitten <> nC) then
        begin
 //      ShowMessage( ' Error writing to COM port ' ) ;
        Result := False ;
        end
     else Result := True ;

     end ;


procedure TZStage.WaitforCompletion ;
var
  Status : string ;
  Timeout : Cardinal ;
  EndOfLine : Boolean ;
begin
   TimeOut := timegettime + 1000 ;
   repeat
     Status := ReceiveBytes( EndOfLine ) ;
     Until EndOfLine or (timegettime > TimeOut) ;
     end ;


function TZStage.ReceiveBytes(
          var EndOfLine : Boolean
          ) : string ;          { bytes received }
{ -------------------------------------------------------
  Read bytes from Com port until a line has been received
  -------------------------------------------------------}
var
   Line : string ;
   rBuf : array[0..255] of ansichar ;
   ComState : TComStat ;
   PComState : PComStat ;
   NumBytesRead,ComError,NumRead : DWORD ;
begin

     PComState := @ComState ;
     Line := '' ;
     rBuf[0] := ' ' ;
     NumRead := 0 ;
     EndOfLine := False ;
     Result := '' ;

     { Find out if there are any characters in receive buffer }
     ClearCommError( ComHandle, ComError, PComState )  ;

     // Read characters until CR is encountered
     while (NumRead < ComState.cbInQue) and (RBuf[0] <> #13) do begin
         ReadFile( ComHandle,rBuf,1,NumBytesRead,OverlapStructure ) ;
         if rBuf[0] <> #13 then Line := Line + String(rBuf[0])
                           else EndOfLine := True ;
         //outputdebugstring(pwidechar(RBuf[0]));
         Inc( NumRead ) ;
     end ;

     Result := Line ;

     end ;


procedure TZStage.UpdateZPositionOSII ;
// ----------------------------------------
// Update position of Z stage (Optoscan II)
// ----------------------------------------
var
    EndOfLine : Boolean ;
    OK : Boolean ;
    i,iNum : Integer ;
    c,s : string ;
begin

    case ControlState of

        csIdle :
          begin
          if MoveToRequest then
             begin
             // Go to required position
             OK := SendCommand( format('G %d,%d,%d',
                   [Round(NewXPosition*XScaleFactor),
                    Round(NewYPosition*YScaleFactor),
                    Round(NewZPosition*ZScaleFactor)]));
             if OK then ControlState := csWaitingForCompletion ;
             MoveToRequest := False ;
             end
          else
             begin
             // Request stage X,Y,Z position
             OK := SendCommand( 'P' ) ;
             if OK then ControlState := csWaitingForPosition ;
             end ;
          end;

        csWaitingForPosition :
          begin
          XScaleFactor := Max(XScaleFactor,1E-4) ;
          YScaleFactor := Max(YScaleFactor,1E-4) ;
          ZScaleFactor := Max(ZScaleFactor,1E-4) ;
          Status := Status + ReceiveBytes( EndOfLine ) ;
          if EndOfLine then
             begin
             i := 1 ;
             s := '' ;
             iNum := 0 ;
             while i <= Length(Status) do
                   begin
                   c := Status[i] ;
                   if (c = ',') or (i = Length(Status)) then
                      begin
                      if c <> ',' then s := s + Status[i] ;
                      case iNum of
                          0 : XPosition := StrToInt64(s)/XScaleFactor ;
                          1 : YPosition := StrToInt64(s)/YScaleFactor ;
                          2 : ZPosition := StrToInt64(s)/ZScaleFactor ;
                          end ;
                      Inc(INum) ;
                      s := '' ;
                      end
                   else s := s + Status[i] ;
                   Inc(i) ;
                   end;
             Status := '' ;
             ControlState := csIdle ;
             end;
          end ;

        csWaitingForCompletion :
          begin
          Status := ReceiveBytes( EndOfLine ) ;
          if EndOfLine then
             begin
             Status := '' ;
             ControlState := csIdle ;
             end;

          end;
    end;

end;


procedure TZStage.MoveToOSII( X : Double ; // New X pos.
                              Y : Double ; // New Y pos.
                              Z : Double   // New Z pos.
                              ) ;
// ------------------------------
// Go to Z position (Optoscan II)
// ------------------------------
begin
    NewXPosition := X ;
    NewYPosition := Y ;
    NewZPosition := Z ;
    MoveToRequest := True ;
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
          if ComPortOpen then
             begin
             CloseComPort ;
             OpenComPort ;
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

procedure TZStage.UpdateZPositionPZ ;
// ----------------------------------
// Update position of Z stage (Piezo)
// ----------------------------------
begin
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

procedure TZStage.ProScanEnableZStageTTLAction ;
// ---------------------------------------------------------------
// Enable action to be taken when TTL hard limit trigger activated
// ---------------------------------------------------------------
begin
     SendCommand('TTDEL,1') ;
     WaitforCompletion ;
     SendCommand('TTLTP,1,1') ;       // Enable trigger on input #1 going high
     WaitforCompletion ;
     SendCommand('TTLACT,1,31,0,0,0') ; // Move Z axis to zero position
     WaitforCompletion ;
     SendCommand('TTLTRG,1') ;         // Enable triggers
     WaitforCompletion ;
     end;



end.
