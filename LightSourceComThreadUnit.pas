unit LightSourceComThreadUnit;
// ==================================================
// COM port I/O handler thread for Laser control unit
// ==================================================
// 02.10.18
// 22.03.22 COM port Baud rate now set by constructor

interface

uses
  System.Classes, System.SysUtils, Windows, mmsystem, System.StrUtils ;

type
  TLightSourceComThread = class(TThread)
  private
    { Private declarations }
    FComPort : Integer ;              // Com port #
    FComHandle : THandle ;            // Com port handle
    FComPortOpen : Boolean ;          // Com port open flag
    FBaudRate : DWord ;               // Com port baud rate
    ComFailed : Boolean ;             // COM port communications failed flag

    OverLapStructure : POVERLAPPED ;

    procedure OpenCOMPort ;
    procedure CloseCOMPort ;

    function SendCommand( const Line : string ) : Boolean ;
    function ReceiveBytes( var EndOfLine : Boolean ) : string ;

  public
    constructor Create( BaudRate : DWord ) ;

  protected
    procedure Execute; override;
  end;

implementation

uses LightSourceUnit ;

const

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


constructor TLightSourceComThread.Create( BaudRate : DWord ) ;
// ------------------
// Thread constructor
// ------------------
begin
    // Create thread
    inherited Create(False);

    FBaudRate := BaudRate ;

end ;


procedure TLightSourceComThread.Execute;
// --------------------------------
// COM Port transmit/receive thread
// --------------------------------
var
    EndOfLine : Boolean ;
    Reply : string ;
begin

// Create command list
   Reply := '' ;

// Initialization
   OpenComPort ;

  { Place thread code here }
  while not Terminated do begin
      Synchronize( procedure
         begin

         // Send next command in list
         if (LightSource.CommandList.Count > 0) then
            begin
            SendCommand(LightSource.CommandList[0]);
//            outputdebugstring(pchar(format('Light Source tx: %s',[LightSource.CommandList[0]])));
            LightSource.CommandList.Delete(0) ;
            end;

         // Wait for command completion reply from remote device
         Reply := Reply + ReceiveBytes(EndOfLine) ;
         if EndOfLine then
           begin
           if Reply <> '' then LightSource.ReplyList.Add(Reply);
 //          outputdebugstring(pchar(format('Light Source rx: %s',[Reply])));
           Reply := '' ;
           end ;
         end );
      sleep(1);
   end;

   // Close COM port
   CloseComPort ;

   end;


procedure TLightSourceComThread.OpenCOMPort ;
// ----------------------------------------
// Establish communications with COM port
// ----------------------------------------
var
   DCB : TDCB ;           { Device control block for COM port }
   CommTimeouts : TCommTimeouts ;
begin

     if FComPortOpen then Exit ;

     Synchronize( procedure begin FComPort := LightSource.FControlPort end ) ;

     ComFailed := True ;
     if FComPort < 1 then Exit ;

     { Open com port  }
     FComHandle :=  CreateFile( PCHar(format('COM%d',[FComPort])),
                     GENERIC_READ or GENERIC_WRITE,
                     0,
                     Nil,
                     OPEN_EXISTING,
                     FILE_ATTRIBUTE_NORMAL,
                     0) ;

     if NativeInt(FComHandle) < 0 then
        begin
        FComPortOpen := False ;
//        ShowMessage(format('OBIS: Unable to open serial port: COM%d',[FControlPort+1]));
        Exit ;
        end;

     outputdebugstring(pchar(format('Light Source COM%d open on handle %d',[FComPort,FComHandle])));

     { Get current state of COM port and fill device control block }
     GetCommState( FComHandle, DCB ) ;
     { Change settings to those required for CoolLED }
     DCB.BaudRate := FBaudRate ; //Old value pre 22.3.22 CBR_9600 ;
     DCB.ByteSize := 8 ;
     DCB.Parity := NOPARITY ;
     DCB.StopBits := ONESTOPBIT ;
     // Settings required to activate remote mode of CoolLED
     DCB.Flags := dcb_Binary or dcb_DtrControlEnable or dcb_RtsControlEnable ;

     { Update COM port }
     SetCommState( FComHandle, DCB ) ;

     { Initialise Com port and set size of transmit/receive buffers }
     SetupComm( FComHandle, 4096, 4096 ) ;

     { Set Com port timeouts }
     GetCommTimeouts( FComHandle, CommTimeouts ) ;
     CommTimeouts.ReadIntervalTimeout := $FFFFFFFF ;
     CommTimeouts.ReadTotalTimeoutMultiplier := 0 ;
     CommTimeouts.ReadTotalTimeoutConstant := 0 ;
     CommTimeouts.WriteTotalTimeoutMultiplier := 0 ;
     CommTimeouts.WriteTotalTimeoutConstant := 5000 ;
     SetCommTimeouts( FComHandle, CommTimeouts ) ;

     ClearCommBreak( FComHandle ) ;

     FComPortOpen := True ;
     ComFailed := False ;

     end ;


procedure  TLightSourceComThread.CloseCOMPort ;
// ----------------------
// Close serial COM port
// ----------------------
begin
     if FComPortOpen then CloseHandle( FComHandle ) ;
     FComPortOpen := False ;
end ;


function TLightSourceComThread.SendCommand(
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

     Result := False ;
     if not FComPortOpen then Exit ;
     if ComFailed then Exit ;

//     outputdebugstring(pchar('tx: ' + Line));

     { Copy command line to be sent to xMit buffer and and a CR character }
     nC := Length(Line) ;
     for i := 1 to nC do xBuf[i-1] := ANSIChar(Line[i]) ;
     xBuf[nC] := #13 ;
     Inc(nC) ;
     xBuf[nC] := #10 ;
     Inc(nC) ;

    Overlapped := Nil ;
    OK := WriteFile( FComHandle, xBuf, nC, nWritten, Overlapped ) ;
    if (not OK) or (nWRitten <> nC) then
        begin
 //      ShowMessage( ' Error writing to COM port ' ) ;
        Result := False ;
        end
     else Result := True ;

     end ;


function TLightSourceComThread.ReceiveBytes(
          var EndOfLine : Boolean
          ) : string ;          { bytes received }
{ -------------------------------------------------------
  Read bytes from COMort until a line has been received
  -------------------------------------------------------}
var
   Line : string ;
   rBuf : array[0..255] of ansichar ;
   ComState : TComStat ;
   PComState : PComStat ;
   NumBytesRead,ComError,NumRead : DWORD ;
begin

     if not FComPortOpen then Exit ;

     PComState := @ComState ;
     Line := '' ;
     rBuf[0] := ' ' ;
     NumRead := 0 ;
     EndOfLine := False ;
     Result := '' ;

     { Find out if there are any characters in receive buffer }
     ClearCommError( FComHandle, ComError, PComState )  ;

     // Read characters until CR is encountered
     while (NumRead < ComState.cbInQue) and {(RBuf[0] <> #10) and} (RBuf[0] <> #13) do
         begin
         ReadFile( FComHandle,rBuf,1,NumBytesRead,OverlapStructure ) ;
         if (rBuf[0] <> #10) and (rBuf[0] <> #13) then Line := Line + String(rBuf[0])
                                                  else EndOfLine := True ;
         //outputdebugstring(pwidechar(RBuf[0]));
         Inc( NumRead ) ;
         end ;

     Result := Line ;

     end ;



end.
