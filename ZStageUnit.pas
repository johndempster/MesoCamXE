unit ZStageUnit;
// ========================================================================
// MesoScan: Z Stage control module
// (c) J.Dempster, Strathclyde Institute for Pharmacy & Biomedical Sciences
// ========================================================================
// 7/6/12 Supports Prior OptiScan II controller
// 14.5.14 Supports voltage-controlled lens positioner

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
    FEnabled : Boolean ;      // Z stage Enabled/disabled flag
    ComHandle : THandle ;     // Com port handle
    ComPortOpen : Boolean ;   // Com port open flag
    FControlPort : DWord ;    // Control port number
    FBaudRate : DWord ;       // Com port baud rate
    ControlState : Integer ;  // Z stage control state
    Status : String ;         // Z stage status report
    MoveToRequest : Boolean ;   // Go to requested flag
    MoveToPosition : Double ;   // Position (um) to go to
    OverLapStructure : POVERLAPPED ;

    procedure OpenCOMPort ;
    procedure CloseCOMPort ;
    procedure ResetCOMPort ;
    procedure SendCommand( const Line : string ) ;
    function ReceiveBytes( var EndOfLine : Boolean ) : string ;
    procedure SetControlPort( Value : DWord ) ;
    procedure SetBaudRate( Value : DWord ) ;
    procedure SetEnabled( Value : Boolean ) ;
    procedure SetStageType( Value : Integer ) ;

    procedure UpdateZPositionOSII ;
    procedure UpdateZPositionPZ ;
    procedure MoveToOSII( Position : Double ) ;
    procedure MoveToPZ( Position : Double ) ;
    function GetZScaleFactorUnits : string ;
  public
    { Public declarations }
    ZPosition : Double ;     // Z position (um)
    ZScaleFactor : Double ;  // Z step scaling factor
    ZStepTime : Double ;     // Time to perform Z step (s)
    procedure Open ;
    procedure Close ;
    procedure UpdateZPosition ;
    procedure MoveTo( Position : Double ) ;
    procedure GetZStageTypes( List : TStrings ) ;
    procedure GetControlPorts( List : TStrings ) ;

  published
    Property ControlPort : DWORD read FControlPort write SetControlPort ;
    Property BaudRate : DWORD read FBaudRate write SetBaudRate ;
    Property Enabled : Boolean read FEnabled write SetEnabled ;
    Property StageType : Integer read FStageType write SetStageType ;
    Property ZScaleFactorUnits : string read GetZScaleFactorUnits ;
  end;

var
  ZStage: TZStage;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses LabIOUnit;

{$R *.dfm}

const
    csIdle = 0 ;
    csWaitingForPosition = 1 ;
    csWaitingForCompletion = 2 ;

    stNone = 0 ;
    stOptiscanII = 1 ;
    stPiezo = 2 ;

procedure TZStage.DataModuleCreate(Sender: TObject);
// ---------------------------------------
// Initialisations when module is created
// ---------------------------------------
begin
    FStageType := stNone ;
    FEnabled := False ;
    ComPortOpen := False ;
    FControlPort := 0 ;
    FBaudRate := 9600 ;
    Status := '' ;
    ControlState := csIdle ;
    ZPosition := 0.0 ;
    ZscaleFactor := 1.0 ;
    MoveToRequest := False ;
    MoveToPosition := 0.0 ;
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
        stOptiscanII : begin
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
        stOptiscanII : begin
          OpenComPort ;
          end ;
        stPiezo : begin

          end;
        end;
    end;

function TZStage.GetZScaleFactorUnits : string ;
// -------------------------------
// Return units for Z scale factor
// -------------------------------
begin
    case FStageType of
        stOptiscanII : Result := 'steps/um' ;
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
        stOptiscanII : UpdateZPositionOSII ;
        stPiezo : UpdateZPositionPZ ;
        end;
    end;

procedure TZStage.MoveTo( Position : Double ) ;
// -----------------
// Go to Z position
// -----------------
begin
    case FStageType of
        stOptiscanII : MoveToOSII(  Position ) ;
        stPiezo : MoveToPZ(  Position ) ;
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

procedure TZStage.SendCommand(
          const Line : string   { Text to be sent to Com port }
          ) ;
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

     if not FEnabled then Exit ;

     { Copy command line to be sent to xMit buffer and and a CR character }
     nC := Length(Line) ;
     for i := 1 to nC do xBuf[i-1] := ANSIChar(Line[i]) ;
     xBuf[nC] := #13 ;
     Inc(nC) ;
//     xBuf[nC] := chr(10) ;
//     Inc(nC) ;

    Overlapped := Nil ;
    OK := WriteFile( ComHandle, xBuf, nC, nWritten, Overlapped ) ;
    if (not OK) or (nWRitten <> nC) then begin
        //ShowMessage( ' Error writing to COM port ' ) ;
        FEnabled := False ;
    end;
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

     if not FEnabled then Exit ;

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
begin

    case ControlState of

        csIdle : begin
          if MoveToRequest then begin
             // Go to required position
             SendCommand(format('U %d',[Round((MoveToPosition-ZPosition)*ZScaleFactor)])) ;
             ControlState := csWaitingForCompletion ;
             MoveToRequest := False ;
          end
          else begin
            // Request stage position
            SendCommand( 'PZ' ) ;
            ControlState := csWaitingForPosition ;
          end ;
        end;

        csWaitingForPosition : begin
          Status := Status + ReceiveBytes( EndOfLine ) ;
          if EndOfLine then begin
             ZScaleFactor := Max(ZScaleFactor,1E-3) ;
             ZPosition := StrToInt64(Status)/ZScaleFactor ;
             Status := '' ;
             ControlState := csIdle ;
          end;
        end ;

        csWaitingForCompletion : begin
          Status := ReceiveBytes( EndOfLine ) ;
          if EndOfLine then begin
             Status := '' ;
             ControlState := csIdle ;
          end;

        end;
    end;
end;


procedure TZStage.MoveToOSII( Position : Double ) ;
// ------------------------------
// Go to Z position (Optoscan II)
// ------------------------------
begin
    MoveToPosition := Position ;
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
        stOptiscanII : begin
          if ComPortOpen then begin
             CloseComPort ;
             OpenComPort ;
             end;
          end;
        end;
    end;


procedure TZStage.SetEnabled( Value : Boolean ) ;
// ------------------------------
// Enable/disable Z stage control
//-------------------------------
begin

    FEnabled := Value ;
    case FStageType of
        stOptiscanII : begin
          if FEnabled and (not ComPortOpen) then OpenComPort
          else if (not FEnabled) and ComPortOpen then CloseComPort ;
          end;
        end ;

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
        for iChan := 0 to LabIO.NumDACs[iDev]-1 do begin
            if iPort = FControlPort then begin
                LabIO.WriteDAC(iDev,Position*ZScaleFactor,iChan);
                end;
            inc(iPort) ;
            end;
    end ;

end.
