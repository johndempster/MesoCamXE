unit LabIOUnit;
{$O-}
// ---------------------------------------------------
// National Instruments NIDAQ library interface module
// ---------------------------------------------------
// (c) John Dempster, University of Strathclyde, 2002
// All Rights Reserved
// 28/2/2002
// 26.8.2002 ... Multi-channel scans now triggered from PFI_7 (ADCToMemoryExtScan)
// 27.3.2003 ... Functions call now be called without hardware being available
//               without generating errors
// 21.9.2004 ... Bug in WriteDACS fixed (was outputting large glitches when windows closed
// 14.03.2005 .. PCI 6014 and other boards with only one DMA channel now supported
// 24.03.2005 .. Multi-board ADC & DAC clocks can now be synchronised either by RTSI0 or PFI5
// 19.04.2005 ..
// 06.05.2005 .. Bugs where Device=1 constant used instead of DeviceNum fixed
//               (Caused problem with Tom Carter's system)
// 31.08.05   .. Both Traditional NIDAQ and NIDAQ-MX now supported
//               Last device doing DAC now used as master ADC/DAC timing source
//               NIDAQMX_UpdateDACBuffer disabled (DAC restart needed for DAC buffer updates
// 23.11.05 .... MemoryToDAC now has PFI0 external trigger mode (added for Ultima support)
// 23.06.06 .... DACMinValue array now set correctly (not 0) for Traditional NI-DAQ
// 28.08.06 .... DigitalWaveCapable public array now reports if devices supports
//               timed digital output waveforms
// 26.07.07 .... SamplingRate adjusted in ADCToMemoryExtScan to avoid exceeding 200 kHZ aggregate
// 17.02.08 .... Digital waveform capability now recognised in 625X boards
// 04.03.09 JD .... DACOutState and DigOutState now saved whenever static DAC or Dig write takes place
// 11.03.09 JD .... FillDIGBufWithDefaultValues added.
// 13.03.09 JD .. Memory violation which ocurred when switching to NIDAQ-MX with no NIDAQ-MX Dll
//                fixed. Card list now also cleared
// 15.06.09 NS .... NIDAQ_InitialiseNIBoards no longer re-initializes NI devices.
// 04.08.11 JD .... PCI-6733 board name now returned
// 23.10.17 JD .... If error detecting board name no. of devices set to zero

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, nidaqcns, math, mmsystem, strutils ;
const

    NIDAQ = 0 ;
    NIDAQMX = 1 ;
    MaxDevices = 10 ;
    MaxDACs = 16 ;
    MaxVRanges = 16 ;
    MaxDACChannels = 16 ;
    MaxResources = 200 ;
    LineDisabled = MaxResources+1 ;
    ClockSync_RTSI0 = 0 ;
    ClockSync_PFI5 = 1 ;
    DefaultTimeOut = 1.0 ;
    MaxADCSamples = 100000000 ;
    InBufMaxSamples = 2000000 ;
    OutBufMaxSamples = 5000000 ;

    imSingleEnded = 0  ; // Single ended A/D input mode
    imDifferential = 1 ; // Differential input mode
    imBNC2110 = 2 ;      // Standard mode for BNC-2110 panel (differential)
    imBNC2090 = 3 ;      // Standard mode for BNC 2090 panel (SE)
    imSingleEndedRSE = 4 ;          // Single Ended (grounded)

type
  TSmallIntArray = Array[0..MaxADCSamples-1] of SmallInt ;
  PSmallIntArray = ^TSmallIntArray ;
  TIntArray = Array[0..MaxADCSamples-1] of Integer ;
  PIntArray = ^TIntArray ;
  TDoubleArray = Array[0..MaxADCSamples-1] of Double ;
  PDoubleArray = ^TDoubleArray ;

  TResourceType = (ADCIn,DACOut,DigOut,None) ;
  TResource = record
        Device : Integer ;
        ResourceType : TResourceType ;
        StartChannel : Integer ;
        EndChannel : Integer ;
        end ;

  TBig16bitArray = Array[0..$1FFFFFFF] of SmallInt ;
  PBig16bitArray = ^TBig16bitArray ;
  TBig8bitArray = Array[0..$1FFFFFFF] of Byte ;
  PBig8bitArray = ^TBig8bitArray ;
  TBig32bitArray = Array[0..$1FFFFFF] of Integer ;
  PBig32bitArray = ^TBig32bitArray ;
  TBigSingleArray = Array[0..$1FFFFFF] of Single ;
  PBigSingleArray = ^TBigSingleArray ;

  TLabIO = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    FNIDAQAPI : Integer ;       // NI-DAQ library (NIDAQ,NIDAQMX)
    LibraryHnd : HModule ;
    LibraryLoaded : Boolean ;

    //BoardInitialised : Boolean ;

    InBuf : PBig16bitArray ; // A/D input buffer pointer

    // NIDAQ-MX task objects
    DACTask : Array[1..MaxDevices] of Integer ;
    ADCTask : Array[1..MaxDevices] of Integer ;
    DIGTask : Array[1..MaxDevices] of Integer ;

    ADCVScale : Array[1..MaxDevices] of Single ;
    ADCVOffset : Array[1..MaxDevices] of Single ;
    ADCVoltageRangeAtX1Gain : Array[1..MaxDevices] of Single ;
    FADCCircularBuffer : Boolean ;

    FADCPointer : Integer ;
    FADCNumChannels : Integer ;
    FADCNumSamples : Integer ;
    FADCNumSamplesAcquired : Integer ;

    DACFreeBufferSpace : Integer ;
    GetADCSamplesInUse : Boolean ;

    FPUExceptionMask : Set of TFPUException ;
    FPUExceptionMaskSet : Boolean ;

    procedure DisableFPUExceptions ;
    procedure EnableFPUExceptions ;
    function  PCharArrayToString( CBuf : Array of ANSIChar ) : ANSIString ;



  function IsLabInterfaceAvailable : boolean ;

  function  IntLimit( Value : Integer ; LoLimit : Integer ; HiLimit : Integer
          ) : Integer ;

  procedure SetNIDAQAPI( Value : Integer ) ;

  procedure Wait( Delay : Single ) ;



  public
    { Public declarations }

    NumDevices : Integer ;
    DeviceName : Array[1..MaxDevices] of ANSIString ;
    DeviceBoardName : Array[1..MaxDevices] of ANSIString ;
    DeviceBoardType : Array[1..MaxDevices] of SmallInt ;
    DeviceNumDMAChannels : Array[1..MaxDevices] of Integer ;
    NumDACs : Array[1..MaxDevices] of SmallInt ;
    NumADCs : Array[1..MaxDevices] of SmallInt ;
    DACMaxValue : Array[1..MaxDevices] of Integer ;
    DACMinValue : Array[1..MaxDevices] of Integer ;
    DACResolution : Array[1..MaxDevices] of Integer ;
    DACMaxVolts  : Array[1..MaxDevices] of Single ;
    DACMinVolts  : Array[1..MaxDevices] of Single ;
    DACScale : Array[1..MaxDevices] of Single ;
    DACNumSamplesToWrite : DWord ;
    DACNumSamplesWRitten : DWord ;
    DACNumChannels : Integer ;
    pDACBuf : PBig16bitArray ;

    // DAC output voltage states
    DACOutState : Array[1..MaxDevices,0..MaxDACs-1] of Single ;

    ADCInputMode : Integer ;
    ADCMaxValue : Array[1..MaxDevices] of Integer ;
    ADCMinValue : Array[1..MaxDevices] of Integer ;
    ADCResolution : Array[1..MaxDevices] of Integer ;
    ADCScale : Array[1..MaxDevices] of Single ;
    ADCVoltageRanges : Array[1..MaxDevices,0..MaxVRanges] of Single ;
    NumADCVoltageRanges : Array[1..MaxDevices] of Integer ;

    DigitalWaveformCapable : Array[1..MaxDevices] of Boolean ;
    DigOutState : Array[1..MaxDevices] of Integer ;

    Resource : Array[0..MaxResources-1] of TResource ;
    NumResources : Integer ;

    BoardsInitialised : Boolean ;    // A/D hardware available
    TimerAvailable : Boolean ;  // Timer hardware available

    ADCActive : Array[1..MaxDevices] of Boolean ;     { A/D sampling in progress flag }
    DACActive : Array[1..MaxDevices] of Boolean ;     { D/A output in progress flag }
    DIGActive : Array[1..MaxDevices] of Boolean ;     { D/A output in progress flag }

    ADCVoltageRangeMax : single ;  { Max. positive A/D input voltage range}
    ADCChannelOffsets : Array[0..15] of Integer ;
    ADCMinSamplingInterval : single ;
    ADCMaxSamplingInterval : single ;

    DACMinUpdateInterval : Double ;


    function Open : Boolean ;

    function InitialiseNIBoards : Boolean ;
    function ResetNIBoards : Boolean ;
    procedure GetDeviceADCChannelProperties( DeviceNum : Integer ) ;
    procedure GetDeviceDACChannelProperties( DeviceNum : Integer ) ;

    procedure Close ;

    procedure CheckError( Err : Integer ) ;


    function ADCToMemoryExtScan(
             Device : SmallInt ;
             var ADCBuf : Array of SmallInt  ;
             FirstChannel : Integer ;
             nChannels : Integer ;
             nSamples : Integer ;
             ADCVoltageRange : Single ;
             CircularBuffer : Boolean ;
             TimingDevice : SmallInt
             ) : Boolean ;

    procedure CheckSamplingInterval(
              DeviceNum : Integer ;
              var SamplingInterval : double ;
               NumADCChannels : Integer
              ) ;


    function StopADC( Device : SmallInt ) : Boolean ;

    function ADCInputModeCode(
             Device : Integer ;
             InputMode : Integer ) : Integer ;
    procedure GetADCInputModes( InputModes :TStrings ) ;

    procedure GetADCSamples(
          Device : Integer ;
          var ADCBuf : Array of SmallInt ;
          var NumSamplesRead : Integer ;
          DACBuf : PBig16bitArray ;
          YStartVolts : Single ;
          YScale : Single ;
          YLineSpacingVolts : Single ;
          NumPointsPerLine : Cardinal
          ) ;

    function MemoryToDAC(
             Device : SmallInt ;
             var DACBuf : Array of SmallInt  ;
             nChannels : SmallInt ;
             nPoints : Cardinal ;
             nPointsInDACBuffer : Cardinal ;
             UpdateInterval : Double ;
             CircularBufferMode : Boolean ;
             ExternalTrigger : Boolean ;
             TimingDevice : SmallInt
             ) : Boolean ;

    procedure UpdateDACBuffer(
              Device : SmallInt ;
              var DACBuf : Array of SmallInt  ; { D/A output data buffer (IN) }
              nChannels : SmallInt ;            { No. of D/A channels (IN) }
              nPoints : Integer                 { No. of D/A output values (IN) }
              ) ;

    function StopDAC( Device : SmallInt ) : Boolean ;

    procedure WriteDACs(
              Device : Integer ;
              DACVolts : array of Single ;
              nChannels : Integer ) ;

    procedure WriteDAC(
              Device : Integer ;
              DACVolts : Single ;
              iChannel : Integer ) ;

    function MemoryToDIG(
             Device : SmallInt ;
             var DIGBuf : Array of Integer  ;
             nPoints : Integer ;
             UpdateInterval : Double ;
             CircularBufferMode : Boolean ;
             ExternalTrigger : Boolean ;
             TimingDevice : SmallInt
             ) : Boolean ;

    procedure UpdateDIGBuffer(
              Device : SmallInt ;
              var DIGBuf : Array of Integer  ; { D/A output data buffer (IN) }
              nPoints : Integer                 { No. of D/A output values (IN) }
              ) ;

    function StopDIG( Device : SmallInt ) : Boolean ;

     function ReadADC(
              Device : Integer ;
              Channel : Integer ;
              ADCVoltageRange : Single
              ) : Integer ;

   procedure WriteToDigitalOutPutPort(
             Device : Integer ;
             Pattern : Integer
             ) ;

   procedure FillDACBufWithDefaultValues(
         Dev : Integer ;            // Device #
         DACBuf : PBig16bitArray ;  // Buffer to be updated
         NumPoints : Integer // No. of points in buffer
         ) ;

   procedure FillDIGBufWithDefaultValues(
         Dev : Integer ;            // Device #
         DIGBuf : PBig32bitArray ;  // Buffer to be updated
         NumPoints : Integer // No. of points in buffer
         ) ;

    procedure SetBit( var iValue : Integer ;
                      BitNum : Integer ;
                      State : Integer ) ;


    function GetChannelOffset(
             Chan : Integer ;
             NumChannels : Integer ) : Integer ;

    function BitMask( BitNumber : Integer ) : Integer ;

    property NIDAQAPI : Integer read FNIDAQAPI write SetNIDAQAPI ;

  end;

var
  LabIO: TLabIO;

implementation

uses MainUnit, logunit, nidaqmxlib ;

//uses Main;

{$R *.DFM}

const
   InternalClock = 0 ;
   Timebase_Ext = 0 ;
   Timebase_1us = 1 ;
   Timebase_10us = 2 ;
   Timebase_100us = 3 ;
   Timebase_1ms = 4 ;
   Timebase_10ms = 5 ;
   TimeBasePeriod : Array[-3..5] of Single = (5E-8,0.0,2E-7,0.0,1E-6,1E-5,1E-4,1E-3,1E-2) ;




type

   { NIDAQ.DLL procedure  variables }
    pi16 = ^SmallInt ;
    PSmallInt = ^SmallInt ;
    PLongInt = ^LongInt ;


procedure TLabIO.DataModuleCreate(Sender: TObject);
// --------------------------------------
// Initialisations when module is created
// --------------------------------------
var
    i,j : Integer ;
begin

    BoardsInitialised := False ;
    LibraryLoaded := False ;
    FPUExceptionMaskSet := False ;

    FNIDAQAPI := NIDAQ ;

    for i := 1 to MaxDevices do DeviceBoardName[i] := '' ;
    for i := 1 to MaxDevices do DigitalWaveformCapable[i] := False ;
    for i := 1 to MaxDevices do DeviceName[i] := '' ;
    for i := 1 to MaxDevices do NumDACs[i] := 0 ;
    for i := 1 to MaxDevices do NumADCs[i] := 0 ;
    for i := 1 to MaxDevices do ADCMaxValue[i] := 0 ;
    for i := 1 to MaxDevices do DACMaxVolts[i] := 0. ;
    for i := 1 to MaxDevices do DACMinVolts[i] := 0. ;
    for i := 1 to MaxDevices do NumADCVoltageRanges[i] := 0 ;
    for i := 1 to MaxDevices do ADCVoltageRangeAtX1Gain[i] := 1.0 ;
    for i := 1 to MaxDevices do for j := 0 to MaxDACs-1 do DACOutState[i,j] := 0.0 ;
    NumResources := 0 ;
    InBuf := Nil ;

    end;


procedure TLabIO.SetNIDAQAPI( Value : Integer ) ;
// ------------------------------------------
// Set National Instrument interface API type
// ------------------------------------------
begin

    // Shut down system to allow change of API
    if BoardsInitialised then Close ;

    // Reset API
    if Value = NIDAQ then FNIDAQAPI := NIDAQ
                     else FNIDAQAPI := NIDAQMX ;

    // Re-open interface
    Open ;

    end ;


function TLabIO.Open : Boolean ;
// ---------------------------------
// Open laboratory interface for use
// ---------------------------------
var
   MinInterval : array[0..370] of single ;
   MinDACInterval : array[0..370] of single ;
   i : Integer ;
begin
     Result := False ;
     if BoardsInitialised then Exit ;

     for i := 0 to High(MinInterval) do
         begin
         MinInterval[i] := 1E-5 ;
         MinDACInterval[i] := 1E-4 ;
         end ;

     BoardsInitialised := InitialiseNIBoards ;

     // Create input buffer
     if InBuf <> Nil then FreeMem(InBuf) ;
     GetMem(InBuf,InBufMaxSamples*Sizeof(Integer)) ;

     Result := BoardsInitialised ;

     end ;


procedure TLabIO.FillDACBufWithDefaultValues(
         Dev : Integer ;            // Device #
         DACBuf : PBig16bitArray ;  // Buffer to be updated
         NumPoints : Integer // No. of points in buffer
         ) ;
// ---------------------------------------
// Update DAC buffer with default voltages
// ---------------------------------------
var
  ch,i,j,DACValue : Integer ;
begin

     if DACBuf = nil then Exit ;

     // Initialise DAC outputs to current default DAC states
     for ch := 0 to NumDACS[Dev]-1 do
         begin
         j := ch ;
         DACValue := Round( DACOutState[Dev,ch]*DACScale[Dev] ) ;
         for i := 0 to NumPoints-1 do
             begin
             DACBuf^[j] := DACValue ;
             j := j + NumDACS[Dev] ;
             end ;
         end ;

     end ;


procedure TLabIO.FillDIGBufWithDefaultValues(
         Dev : Integer ;            // Device #
         DIGBuf : PBig32bitArray ;  // Buffer to be updated
         NumPoints : Integer // No. of points in buffer
         ) ;
// ---------------------------------------
// Update DAC buffer with default voltages
// ---------------------------------------
var
  i : Integer ;
begin

     if DIGBuf = nil then Exit ;

     // Initialise DAC outputs to current default DAC states
     for i := 0 to NumPoints-1 do DIGBuf^[i] := DigOutState[Dev] ;

     end ;



// *******************************
// NIDAQ-MX functions & procedures
// *******************************

function TLabIO.InitialiseNIBoards : Boolean ;
{ ----------------------------------------------------
  Initialise A/D converter hardware and NI-DAQ library
  ---------------------------------------------------- }
var
    Done : Boolean ;
    i : Integer ;
    CBuf : Array[0..500] of ANSIChar ;
    DeviceNum,Err : Integer ;
begin

   // Clear number of devices
   NumDevices := 0 ;

   { Clear A/D and D/A in progress flags }

   for i := 1 to MaxDevices do ADCActive[i] := False ;
   for i := 1 to MaxDevices do DACActive[i] := False ;
   for i := 1 to MaxDevices do DIGActive[i] := False ;
   Result := False ;

   // Load API function library
   if not LibraryLoaded then LibraryLoaded := NIDAQMX_LoadLibrary( LibraryHnd ) ;
   if not LibraryLoaded then
      begin
      LogFrm.AddLine('NIDAQ-MX library (nicaiu.dll) not found!') ;
      Exit ;
      end ;

   // Get list of devices available
   CheckError(DAQmxGetSysDevNames( CBuf, High(CBuf)+1 )) ;

   NumDevices := 0 ;
   for i := 0 to High(DeviceName) do DeviceName[i] := '' ;
   i := 0 ;
   Done := False ;
   repeat
        if (CBuf[i] <> ',') and (CBuf[i] <> #0) then
           begin
           if CBuf[i] <> ' ' then
              DeviceName[NumDevices+1] := DeviceName[NumDevices+1] + CBuf[i] ;
           end
        else
           begin
           Inc(NumDevices) ;
           if CBuf[i] = #0 then Done := True ;
           end ;
        Inc(i) ;
        if i >= High(CBuf) then Done := True ;
   until Done ;


   if NumDevices <= 0 then Exit ;

   // Get device board name
   for i := 1 to NumDevices do
       begin
       Err := DAQmxGetDevProductType(PANSIChar(DeviceName[i]),CBuf,High(CBuf)+1) ;
       CheckError(Err) ;
       DeviceBoardName[i] := PCharArrayToString(CBuf) ;
       if AnsiContainsText(DeviceBoardName[i],'622') or
          AnsiContainsText(DeviceBoardName[i],'625') then DigitalWaveformCapable[i] := True
                                                     else DigitalWaveformCapable[i] := False ;
       end ;

   // If error getting board name then set no. of devices to 0
   if Err <> 0 then NumDevices := 0 ;

   for i := 1 to NumDevices do DeviceNumDMAChannels[i] := 2 ;

   // List available device resources

   NumResources := 0 ;
   for DeviceNum := 1 to NumDevices do
       begin

       // Determine number of A/D channels per board
       GetDeviceADCChannelProperties( DeviceNum ) ;
       // Add to resource list
       if NumADCs[DeviceNum] > 0 then
          begin
          Resource[NumResources].Device := DeviceNum ;
          Resource[NumResources].ResourceType := ADCIn ;
          Resource[NumResources].StartChannel := 0 ;
          Resource[NumResources].EndChannel := NumADCs[DeviceNum]-1 ;
          Inc(NumResources) ;
          end ;

       // Determine number of D/A channels per board
       GetDeviceDACChannelProperties( DeviceNum ) ;
       // Set analogue output DMA transfer mode
       if NumDACs[DeviceNum] > 0 then
          begin
          // Add to resource list
          for i := 0 to NumDACs[DeviceNum]-1 do
              begin
              Resource[NumResources].Device := DeviceNum ;
              Resource[NumResources].ResourceType := DACOut ;
              Resource[NumResources].StartChannel := i ;
              Resource[NumResources].EndChannel := i ;
              Inc(NumResources) ;
              end ;
          end ;

        // Volts -> binary scaling factor
        if (DACMaxVolts[DeviceNum]- DACMinVolts[DeviceNum]) > 0.0 then
           begin
           DACScale[DeviceNum] := (DACMaxValue[DeviceNum] - DACMinValue[DeviceNum])/
                                  (DACMaxVolts[DeviceNum] - DACMinVolts[DeviceNum]) ;
           end
        else DACScale[DeviceNum] := 1.0 ;

        // Digital O/P ports
        for i := 0 to 7 do
            begin
            Resource[NumResources].Device := DeviceNum ;
            Resource[NumResources].ResourceType := DIGOut ;
            Resource[NumResources].StartChannel := i ;
            Resource[NumResources].EndChannel := i ;
            Inc(NumResources) ;
            end ;
        end ;


   Result := True ;

   end ;


function TLabIO.ResetNIBoards : Boolean ;
{ ----------------------------------------------------
  Reset A/D converter hardware and NI-DAQ library
  ---------------------------------------------------- }
var
    Done : Boolean ;
    i : Integer ;
    CBuf : Array[0..500] of ANSIChar ;
    CBuf1 : Array[0..500] of ANSIChar ;
    DeviceNum : Integer ;
begin

   // Clear number of devices
   NumDevices := 0 ;

   { Clear A/D and D/A in progress flags }

   for i := 1 to MaxDevices do ADCActive[i] := False ;
   for i := 1 to MaxDevices do DACActive[i] := False ;
   for i := 1 to MaxDevices do DIGActive[i] := False ;
   Result := False ;

   // Load API function library
   if not LibraryLoaded then LibraryLoaded := NIDAQMX_LoadLibrary( LibraryHnd ) ;
   if not LibraryLoaded then
      begin
      LogFrm.AddLine('NIDAQ-MX library (nicaiu.dll) not found!') ;
      Exit ;
      end ;

   // Get list of devices available
   CheckError(DAQmxGetSysDevNames( CBuf1, High(CBuf1)+1 )) ;

   NumDevices := 0 ;
   for i := 0 to High(DeviceName) do DeviceName[i] := '' ;
   i := 0 ;
   Done := False ;
   repeat
        if (CBuf[i] <> ',') and (CBuf[i] <> #0) then
           begin
           if CBuf[i] <> ' ' then
              DeviceName[NumDevices+1] := DeviceName[NumDevices+1] + CBuf[i] ;
           end
        else
           begin
           Inc(NumDevices) ;
           if CBuf[i] = #0 then Done := True ;
           end ;
        Inc(i) ;
        if i >= High(CBuf) then Done := True ;
   until Done ;


   if NumDevices <= 0 then Exit ;

   // Get device board name
   for i := 1 to NumDevices do
       begin
       CheckError(DAQmxGetDevProductType(PANSIChar(DeviceName[i]),CBuf,High(CBuf)+1)) ;
       DeviceBoardName[i] := PCharArrayToString(CBuf) ;
       if AnsiContainsText(DeviceBoardName[i],'622') or
          AnsiContainsText(DeviceBoardName[i],'625') then DigitalWaveformCapable[i] := True
                                                     else DigitalWaveformCapable[i] := False ;
       end ;

   for i := 1 to NumDevices do DeviceNumDMAChannels[i] := 2 ;

   // List available device resources

   NumResources := 0 ;
   for DeviceNum := 1 to NumDevices do
       begin

       // Determine number of A/D channels per board
       GetDeviceADCChannelProperties( DeviceNum ) ;
       // Add to resource list
       if NumADCs[DeviceNum] > 0 then
          begin
          Resource[NumResources].Device := DeviceNum ;
          Resource[NumResources].ResourceType := ADCIn ;
          Resource[NumResources].StartChannel := 0 ;
          Resource[NumResources].EndChannel := NumADCs[DeviceNum]-1 ;
          Inc(NumResources) ;
          end ;

       // Determine number of D/A channels per board
       GetDeviceDACChannelProperties( DeviceNum ) ;
       // Set analogue output DMA transfer mode
       if NumDACs[DeviceNum] > 0 then
          begin
          // Add to resource list
          for i := 0 to NumDACs[DeviceNum]-1 do
              begin
              Resource[NumResources].Device := DeviceNum ;
              Resource[NumResources].ResourceType := DACOut ;
              Resource[NumResources].StartChannel := i ;
              Resource[NumResources].EndChannel := i ;
              Inc(NumResources) ;
              end ;
          end ;

        // Volts -> binary scaling factor
        if (DACMaxVolts[DeviceNum]- DACMinVolts[DeviceNum]) > 0.0 then
           begin
           DACScale[DeviceNum] := (DACMaxValue[DeviceNum] - DACMinValue[DeviceNum])/
                                  (DACMaxVolts[DeviceNum] - DACMinVolts[DeviceNum]) ;
           end
        else DACScale[DeviceNum] := 1.0 ;

        // Digital O/P ports
        for i := 0 to 7 do
            begin
            Resource[NumResources].Device := DeviceNum ;
            Resource[NumResources].ResourceType := DIGOut ;
            Resource[NumResources].StartChannel := i ;
            Resource[NumResources].EndChannel := i ;
            Inc(NumResources) ;
            end ;
        end ;


   Result := True ;

   end ;


procedure TLabIO.GetDeviceADCChannelProperties(
          DeviceNum : Integer
          ) ;
// ------------------------------------------------
// Get number of device A/D channels and properties
// ------------------------------------------------
const
    NumVRanges = 9 ;
    VRanges : Array[0..8] of Double = (10.0,5.0,2.5,1.25,1.0,0.5,0.25,0.2,0.1) ;
var
    DValue : Double ;
    ADCScaleFactors : Array[0..20] of Double ;
    i : Integer ;
    Err : Integer ;
    ChannelName : ANSIString ;
    NumChannels : Integer ;
begin

    DisableFPUExceptions ;

    NumChannels := 0 ;
    Err := 0 ;
    While Err = 0 do
        begin

        // Create A/D task for selected channel
        CheckError( DAQmxCreateTask( '', ADCTask[DeviceNum] ) ) ;
        ChannelName := format('%s/ai%d',[DeviceName[DeviceNum],NumChannels]) ;
        Err := DAQmxCreateAIVoltageChan( ADCTask[DeviceNum],
                                      PANSIChar(ChannelName),
                                      nil ,
                                      DAQmx_Val_Diff,
                                      -10,
                                      10,
                                      DAQmx_Val_Volts,
                                      nil);

        if Err <> 0 then
           begin
           // Check for 61XX series devices which only
           // support pseudo-differential inputs 01/07/10
           CheckError( DAQmxClearTask( ADCTask[DeviceNum] ) ) ;
           CheckError( DAQmxCreateTask( '', ADCTask[DeviceNum] ) ) ;
           Err := DAQmxCreateAIVoltageChan( ADCTask[DeviceNum],
                                            PANSIChar(ChannelName),
                                            nil ,
                                            DAQmx_Val_PseudoDiff,
                                            -10,
                                            10,
                                            DAQmx_Val_Volts,
                                            nil);
           end ;


        // If channel is valid, get its properties

        if (Err = 0) and (NumChannels=0) then
           begin

           // Get A/D converter resolution
           CheckError( DAQmxGetAIResolution( ADCTask[DeviceNum],
                                             PANSIChar(ChannelName),
                                             DValue)) ;

           // Channel scaling factors
           CheckError( DAQmxGetAIDevScalingCoeff( ADCTask[DeviceNum],
                                                  PANSIChar(ChannelName),
                                                  @ADCScaleFactors,
                                                  4 )) ;
           ADCVScale[DeviceNum] := ADCScaleFactors[1] ;
           ADCVOffset[DeviceNum] := ADCScaleFactors[0] ;
           ADCResolution[DeviceNum] := Round(DValue) ;
           ADCMaxValue[DeviceNum] := Round(Power(2.0,DValue-1.0)) - 1 ;
           ADCMinValue[DeviceNum] := -ADCMaxValue[DeviceNum] - 1 ;
           end ;

        Inc(NumChannels) ;
        CheckError( DAQmxClearTask( ADCTask[DeviceNum] ) ) ;
        end ;

    NumADCs[DeviceNum] := NumChannels - 1 ;
    if NumChannels <= 0 then Exit ;

    // Get available A/D voltage ranges

    NumADCVoltageRanges[DeviceNum] := 0 ;
    for i := 0 to NumVRanges-1 do
        begin

        CheckError( DAQmxCreateTask( '', ADCTask[DeviceNum] ) ) ;
        ChannelName := DeviceName[DeviceNum] + '/AI0' ;
        Err := DAQmxCreateAIVoltageChan( ADCTask[DeviceNum],
                                              PANSIChar(ChannelName),
                                              nil ,
                                              ADCInputModeCode(DeviceNum,imDifferential),
                                              -0.9*VRanges[i],
                                              0.9*VRanges[i],
                                              DAQmx_Val_Volts,
                                              nil);

        if Err = 0 then
           begin
           CheckError( DAQmxGetAIMax( ADCTask[DeviceNum], PANSIChar(ChannelName), DValue ));
           if Abs((DValue - VRanges[i])/VRanges[i]) < 0.1 then
              begin
              ADCVoltageRanges[DeviceNum,NumADCVoltageRanges[DeviceNum]] := DValue ;
              if NumADCVoltageRanges[DeviceNum] <= High(NumADCVoltageRanges) then
                 NumADCVoltageRanges[DeviceNum] := NumADCVoltageRanges[DeviceNum] + 1 ;
              end ;
           end ;

        CheckError( DAQmxClearTask( ADCTask[DeviceNum] ) ) ;
        end ;

    EnableFPUExceptions ;

    end ;


procedure TLabIO.GetDeviceDACChannelProperties(
          DeviceNum : Integer
          ) ;
// ------------------------------------------------
// Get number of device D/A channels and properties
// ------------------------------------------------
var
    DValue,VMin,VMax : Double ;
    Err : Integer ;
    ChannelName : ANSIString ;
    NumChannels : Integer ;
begin

    DisableFPUExceptions ;

    // Create D/A task
    NumChannels := 0 ;
    Err := 0 ;
    While Err = 0 do
        begin

        CheckError( DAQmxCreateTask( '', DACTask[DeviceNum] ) ) ;
        ChannelName := format('%s/ao%d',[DeviceName[DeviceNum],NumChannels]) ;

        if AnsiContainsText(DeviceBoardName[DeviceNum],'600') then
           begin
           VMin := 0.0 ;
           VMax := 5.0 ;
           end
        else
           begin
           VMin := -10.0 ;
           VMax := 10.0 ;
           end;

        Err := DAQmxCreateAOVoltageChan( DACTask[DeviceNum],
                                      PANSIChar(ChannelName),
                                      nil,
                                      VMin,
                                      VMax,
                                      DAQmx_Val_Volts,
                                      nil);

        if (Err = 0) then
           begin

           // D/A output range
           CheckError(DAQmxGetAODACRngHigh( DACTask[DeviceNum],
                                            PANSIChar(ChannelName),
                                            DValue ));
           DACMaxVolts[DeviceNum] := DValue ;

           // D/A output range
           CheckError(DAQmxGetAODACRngLow( DACTask[DeviceNum],
                                           PANSIChar(ChannelName),
                                           DValue ));
           DACMinVolts[DeviceNum] := DValue ;

           // Get D/A converter resolution
           CheckError( DAQmxGetAOResolution( DACTask[DeviceNum],
                                             PANSIChar(ChannelName),
                                             DValue)) ;
           DACResolution[DeviceNum] := Round(DValue) ;

           if DACMinVolts[DeviceNum] = 0.0 then
              begin
              // Unipolar DACs
              DACMaxValue[DeviceNum] := Round(Power(2.0,DValue)) - 1 ;
              DACMinValue[DeviceNum] := 0 ;
              end
           else
              begin
              // Bipolar DACs
              DACMaxValue[DeviceNum] := Round(Power(2.0,DValue-1.0)) - 1 ;
              DACMinValue[DeviceNum] := -DACMaxValue[DeviceNum] - 1 ;
              end ;

           Inc(NumChannels) ;
           CheckError( DAQmxClearTask( DACTask[DeviceNum] ) ) ;
           end ;
      end;

    NumDACs[DeviceNum] := NumChannels ;

    EnableFPUExceptions ;

    end ;


procedure  TLabIO.CheckError( Err : Integer ) ;
var
   ErrString : Array[0..511] of ANSIChar ;
begin
     if Err = 0 then Exit ;
     DAQmxGetErrorString( Err, ErrString, 511 ) ;
     ShowMessage( String(ErrString) ) ;
     end ;


procedure TLabIO.DisableFPUExceptions ;
// ----------------------
// Disable FPU exceptions
// ----------------------
var
    FPUNoExceptions : Set of TFPUException ;
begin

     if not FPUExceptionMaskSet then FPUExceptionMask := GetExceptionMask ;
     FPUExceptionMaskSet := True ;

     Include(FPUNoExceptions, exInvalidOp );
     Include(FPUNoExceptions, exDenormalized );
     Include(FPUNoExceptions, exZeroDivide );
     Include(FPUNoExceptions, exOverflow );
     Include(FPUNoExceptions, exUnderflow );
     Include(FPUNoExceptions, exPrecision );
     SetExceptionMask( FPUNoExceptions ) ;

     end ;


procedure TLabIO.EnableFPUExceptions ;
// ----------------------
// Disable FPU exceptions
// ----------------------
begin
     SetExceptionMask( FPUExceptionMask ) ;
     end ;


function TLabIO.IsLabInterfaceAvailable : boolean ;
{ ------------------------------------------------------------
  Check to see if a lab. interface library is available
  ------------------------------------------------------------}
begin
     IsLabInterfaceAvailable := InitialiseNIBoards ;
     end ;


function TLabIO.ADCInputModeCode(
         Device : Integer ;
         InputMode : Integer                // Device in use
         ) : Integer ;
// ---------------------------------------------------------
// Return A/D input mode code for input mode in ADCInputMode
// ---------------------------------------------------------
begin
     // Set A/D input mode
     if (InputMode = imDifferential) or (InputMode = imBNC2110) then
        begin
        if ANSIContainsText( DeviceBoardName[Device], '61' ) then
           begin
           Result := DAQmx_Val_PseudoDiff;
           end
        else Result := DAQmx_Val_Diff ;
        end
     else Result := DAQmx_Val_NRSE ;
     end ;


procedure TLabIO.GetADCInputModes( InputModes :TStrings ) ;
// ----------------------------------------
// Return list of available A/D input modes
// ----------------------------------------
begin
    InputModes.Clear ;
    InputModes.Add( 'Single Ended') ;
    InputModes.Add( 'Differential') ;
    InputModes.Add( 'BNC 2110 ') ;
    InputModes.Add( 'BNC 2090 ') ;
    InputModes.Add('Single Ended (RSE)') ;
    end ;


function TLabIO.ADCToMemoryExtScan(
          Device : SmallInt ;
          var ADCBuf : Array of SmallInt  ;  { A/D sample buffer (OUT) }
          FirstChannel : Integer ;           // First A/D channel to acquire
          nChannels : Integer ;              { Number of A/D channels (IN) }
          nSamples : Integer ;               { Number of A/D samples ( per channel) (IN) }
          ADCVoltageRange : Single ;         { A/D input voltage range (V) (IN) }
          CircularBuffer : Boolean ;          { Repeated sampling into buffer (IN) }
          TimingDevice : SmallInt            // Device supply ADC/DAC timing pulses
          ) : Boolean ;                      { Returns TRUE indicating A/D started }
{ ----------------------------
  Start A/D converter sampling
  ----------------------------}
var
   ChannelList : ANSIString ;
   ClockSource : ANSIString ;
   ch : Integer ;
   SampleMode : Integer ;
   SamplingRate : Double ;
begin

     Result := False ;
     if (Device < 1) or (Device > NumDevices) then Exit ;
     if NumADCs[Device] <= 0 then Exit ;

     // Stop any running A/D task
     StopADC(Device) ;

     DisableFPUExceptions ;

     // Create A/D task
     CheckError( DAQmxCreateTask( '', ADCTask[Device] ) ) ;

     // Select A/D input channels
     ChannelList := format( DeviceName[Device] + '/AI%d:%d', [FirstChannel,FirstChannel+nChannels-1] ) ;

     CheckError( DAQmxCreateAIVoltageChan( ADCTask[Device],
                                           PANSIChar(ChannelList),
                                           nil ,
                                           ADCInputModeCode(Device,ADCInputMode),
                                           -ADCVoltageRange,
                                           ADCVoltageRange,
                                           DAQmx_Val_Volts,
                                           nil));

     // Select continuous sampling if circular buffer selected
     FADCCircularBuffer := CircularBuffer ;
     if CircularBuffer then SampleMode := DAQmx_Val_ContSamps
                       else SampleMode := DAQmx_Val_FiniteSamps ;

     // Set timing
     ClockSource := '/' + DeviceName[TimingDevice] + '/ao/sampleclock' ;
     SamplingRate := 200000.0 / (nChannels+1) ;

     CheckError( DAQmxCfgSampClkTiming( ADCTask[Device],
                                             PANSIChar(ClockSource),
                                             SamplingRate,
                                             DAQmx_Val_Falling ,
                                             SampleMode,
                                             Int64(nSamples)));

     // Get clock rate set
     CheckError( DAQmxGetSampClkRate( ADCTask[Device], SamplingRate )) ;
//     SamplingInterval := 1.0 / SamplingRate ;

     // Configure buffer
     CheckError( DAQmxCfgInputBuffer ( ADCTask[Device], nSamples )) ;
     // Enable immediate return with any available data within buffer
     CheckError( DAQmxSetReadReadAllAvailSamp( ADCTask[Device], True )) ;

     // Set triggering
     // --------------

     // Request immediate start
     CheckError(DAQmxDisableStartTrig(ADCTask[Device]));

     // Start A/D task
     CheckError( DAQmxStartTask(ADCTask[Device])) ;

     // Restore FPU exceptions
     EnableFPUExceptions ;

     FADCPointer := 0 ;
     FADCNumChannels := nChannels ;
     FADCNumSamples := nSamples ;
     FADCNumSamplesAcquired := 0 ;

     // Define A/D channel offset sequence within A/D sample buffer
     for ch := 0 to nChannels-1 do ADCChannelOffsets[ch] := ch ;

     ADCActive[Device] := True ;
     Result := ADCActive[Device] ;

     end ;


function TLabIO.StopADC(
         Device : SmallInt
         ) : Boolean ;      { Returns FALSE = A/D stopped }
{ -------------------------------
  Reset A/D conversion sub-system
  -------------------------------}
begin
     Result := False ;
     if (Device < 1) or (Device > NumDevices) then Exit ;
     if NumADCs[Device] <= 0 then Exit ;
     if not ADCActive[Device] then Exit ;

     DisableFPUExceptions ;

     // Stop running A/D task
     CheckError( DAQmxClearTask(ADCTask[Device])) ;

     EnableFPUExceptions ;

     ADCActive[Device] := False ;
     Result := ADCActive[Device] ;

     end ;


procedure TLabIO.GetADCSamples(
          Device : Integer ;
          var ADCBuf : Array of SmallInt ;
          var NumSamplesRead : Integer ;
          DACBuf : PBig16bitArray ;
          YStartVolts : Single ;
          YScale : Single ;
          YLineSpacingVolts : Single ;
          NumPointsPerLine : Cardinal
          ) ;
// -------------------------------------------------------------
// Get latest A/D samples acquired and transfer to memory buffer
// -------------------------------------------------------------
var
    i : Integer ;
    ADCBufNumSamples : Integer ;
    ADCBufEnd : Integer ;
    VScale,VOffset,VUnscale,YLinePosition : Single ;
    ADCMaxVal : Single ;
    ADCMinVal : Single ;
    ScaledValue : Single ;
    t0 : Integer ;
    NumSamplesWritten,NumPointsToWrite,NumLinesToWrite,NumLinesWritten : Integer ;
    iX,j,SpaceAvailable,LineOffset : Cardinal ;
    iYValue : Smallint ;
begin

    if not ADCActive[Device] then Exit ;

    if GetADCSamplesInUse then Exit ;

    GetADCSamplesInUse := True ;

    ADCBufNumSamples := FADCNumSamples*FADCNumChannels ;
    ADCBufEnd := FADCNumSamples*FADCNuMChannels - 1 ;

    if (not FADCCircularBuffer) and (FADCNumSamplesAcquired >= ADCBufNumSamples) then begin
       GetADCSamplesInUse := False ;
       Exit ;
    end;

    t0 := TimeGetTime ;

    // Read data from A/D converter
    DAQmxReadBinaryI16( ADCTask[Device],
                                  -1,
                                  DefaultTimeOut,
                                  DAQmx_Val_GroupByScanNumber,
                                  InBuf,
                                  ADCBufNumSamples,
                                  NumSamplesRead,
                                  Nil) ;

    // Apply calibration factors and copy to output buffer
    VUnScale := ADCMaxValue[Device]/10.0 ;
    VScale := ADCVScale[Device] ;
    VOffset := ADCVOffset[Device] ;
    ADCMaxVal := ADCMaxValue[Device] - 1 ;
    ADCMinVal := ADCMinValue[Device] + 1 ;
    for i := 0 to NumSamplesRead*FADCNumChannels-1 do begin
        ScaledValue := (InBuf^[i]*VScale + VOffset)*VUnScale ;
        ADCBuf[i] := Round( Max( Min( ScaledValue, ADCMaxVal ), ADCMinVal )) ;
        Inc(FADCPointer) ;
        FADCNumSamplesAcquired := FADCPointer ;
        if (FADCPointer > ADCBufEnd) and FADCCircularBuffer then FADCPointer := 0 ;
        end ;

    DACFreeBufferSpace := DACFreeBufferSpace + NumSamplesRead ;

    // Update D/A output buffer with XY scan waveform
    DAQmxGetWriteSpaceAvail( DACTask[Device], SpaceAvailable ) ;

    if (DACNumSamplesToWrite > DACNumSamplesWritten)
        and (SpaceAvailable >= (NumPointsPerLine*2))
        and DACActive[Device] then
        begin

        // Copy X waveform from 1st two lines of DACBuf and update Y positon
        NumPointsToWrite := Min(DACNumSamplesToWrite - DACNumSamplesWritten,SpaceAvailable ) ;
        NumPointsToWrite := Min( NumPointsToWrite, InBufMaxSamples ) ;
        NumLinesToWrite := (NumPointsToWrite div NumPointsPerLine) ;
        NumPointsToWrite := NumLinesToWrite*NumPointsPerLine ;
        NumLinesWritten := DACNumSamplesWritten div NumPointsPerLine ;
        j := 0 ;
        iX := 0 ;
        LineOffset := (NumLinesWritten mod 2)*NumPointsPerLine*2 ;
        for i := 0 to NumPointsToWrite-1 do
            begin
            if ix = 0 then
               begin
               YLinePosition := NumLinesWritten*YLineSpacingVolts + YStartVolts ;
               iYValue := Round(YLinePosition*YScale) ;
//               Inc(NumLinesWritten);
               end;
            InBuf^[j] := DACBuf^[j+LineOffset] ;
            InBuf^[j+1] := iYValue ;
            j := j + 2 ;
            inc(ix) ;
            if ix >= NumPointsPerLine then ix := 0 ;
            end;

        DAQmxWriteBinaryI16( DACTask[Device],
                           NumPointsToWrite,
                           False,
                           0.0,
                           DAQmx_Val_GroupByScanNumber,
                           InBuf,
                           NumSamplesWritten,
                           Nil
                           ) ;

        DACNumSamplesWritten := DACNumSamplesWritten + NumSamplesWritten ;
        DACFreeBufferSpace := Max(DACFreeBufferSpace - NumSamplesWritten,0) ;
     //outputdebugString(PChar(format('%d %d %d %d',
     //[SpaceAvailable,NumSamplesWritten,NumPointsToWrite,NumPointsToWrite-NumSamplesWritten]))) ;
     end;
    GetADCSamplesInUse := False ;
    end ;


procedure TLabIO.CheckSamplingInterval(
               DeviceNum : Integer ;
               var SamplingInterval : double ;
               NumADCChannels : Integer
               ) ;
// ------------------------------------------------
// Set sampling interval to nearest supported value
// ------------------------------------------------
var
    ChannelList : ANSIString ;
    SamplingRate : Double ;
    ActualSamplingRate : Double ;
    Err : Integer ;
begin

     if ADCActive[DeviceNum] then Exit ;
     if not BoardsInitialised then InitialiseNIBoards ;
     if not BoardsInitialised then Exit ;

     DisableFPUExceptions ;

     // Create A/D task
     CheckError( DAQmxCreateTask( '', ADCTask[DeviceNum] ) ) ;

     // Select A/D input channels
     ChannelList := format( DeviceName[DeviceNum] + '/AI0:%d', [NumADCChannels-1] ) ;

     CheckError( DAQmxCreateAIVoltageChan( ADCTask[DeviceNum],
                                                PANSIChar(ChannelList),
                                                nil ,
                                                ADCInputModeCode(DeviceNum,ADCInputMode),
                                                -10.0,
                                                10.0,
                                                DAQmx_Val_Volts,
                                                nil));

     // Set sampling rate (ensuring that it can be supported by board)

     SamplingRate := 1.0 / SamplingInterval ;
     Repeat
        Err := DAQmxCfgSampClkTiming( ADCTask[DeviceNum],
                                      nil,
                                      SamplingRate,
                                      DAQmx_Val_Falling ,
                                      DAQmx_Val_FiniteSamps,
                                      2);

        // Read rate back from board
        Err := DAQmxGetSampClkRate( ADCTask[DeviceNum], ActualSamplingRate ) ;
        if Err <> 0 then SamplingRate := SamplingRate*0.75 ;
        Until Err = 0 ;

     // Return actual sampling interval
     SamplingInterval := 1.0 / ActualSamplingRate ;

     // Clear task
     CheckError( DAQmxClearTask(ADCTask[DeviceNum])) ;

     EnableFPUExceptions ;

     end ;


function TLabIO.MemoryToDAC(
          Device : SmallInt ;
          var DACBuf : Array of SmallInt  ; { D/A output data buffer (IN) }
          nChannels : SmallInt ;            { No. of D/A channels (IN) }
          nPoints : Cardinal ;               { No. of D/A output values (IN) }
          nPointsInDACBuffer : Cardinal ;    // No. of points in internal DAC buffer
          UpdateInterval : Double ;          { D/A output interval (s) (IN) }
          CircularBufferMode : Boolean ;     { TRUE = continuous update from circular buffer }
          ExternalTrigger : Boolean ;
          TimingDevice : SmallInt           // Device providing ADC/DAC timing pulse
          ): Boolean ;                      { Returns TRUE=D/A active }
{ --------------------------
  Start D/A converter output
  --------------------------}
var
    SampleMode : Integer ;
    ClockSource : ANSIString ;
    ChannelList : ANSIString ;
    NumSamplesWritten : Integer ;
    VScale : Double ;
    UpdateRate : Double ;
begin
     Result := False ;
     if (Device < 1) or (Device > NumDevices) then Exit ;
     if NumDACs[Device] <= 0 then Exit ;

     if Device > TimingDevice then begin
        ShowMessage('ERROR! Timing device must be last device number started.)') ;
        Exit ;
        end ;

    // Stop any running D/A task
     StopDAC(Device) ;

     DisableFPUExceptions ;

     // Create D/A task
     CheckError( DAQmxCreateTask( '', DACTask[Device] ) ) ;

     // Select D/A output channels
     DACNumChannels := nChannels ;
     ChannelList := format( DeviceName[Device] + '/AO0:%d', [nChannels-1] ) ;
     CheckError( DAQmxCreateAOVoltageChan( DACTask[Device],
                                           PANSIChar(ChannelList),
                                           nil ,
                                           DACMinVolts[Device],
                                           DACMaxVolts[Device],
                                           DAQmx_Val_Volts,
                                           nil));

     // Select continuous sampling if repeated waveform selected
     if CircularBufferMode then SampleMode := DAQmx_Val_ContSamps
                           else SampleMode := DAQmx_Val_FiniteSamps ;

     // Set D/A clock source
     if TimingDevice <> Device then begin
        ClockSource := '/' + DeviceName[TimingDevice] + '/ao/sampleclock' ;
        end
     else begin
        ClockSource := 'onboardclock' ;
        end ;

     // Configure buffer size
     CheckError( DAQmxCfgOutputBuffer ( DACTask[Device], nPointsInDACBuffer )) ;

     // Convert to volts and ensure that data is within valid limits
     VScale := DACMaxVolts[Device] / (DACMaxValue[Device]+1.0) ;

     // Set timing
     UpdateRate := 1.0 / UpdateInterval ;
     CheckError( DAQmxCfgSampClkTiming( DACTask[Device],
                                        PANSIChar(ClockSource),
                                        UpdateRate,
                                        DAQmx_Val_Falling ,
                                        SampleMode,
                                        Int64(nPoints) )) ;

     // Write data to buffer
     CheckError( DAQmxWriteBinaryI16( DACTask[Device],
                           Min( nPointsInDACBuffer, nPoints ),
                           False,
                           DefaultTimeOut,
                           DAQmx_Val_GroupByScanNumber,
                           @DACBuf[0],
                           NumSamplesWritten,
                           Nil
                           )) ;

     DACNumSamplesToWrite := nPoints ;
     DACNumSamplesWritten :=  NumSamplesWritten ;
     DACFreeBufferSpace := 0 ;
     pDACBuf := @DACBuf ;
     //outputdebugString(PChar(format('%d %d',[DACNumSamplesWritten,NumSamplesWritten]))) ;

     // Request immediate start
     CheckError(DAQmxDisableStartTrig(DACTask[Device]));
     // Start D/A task
     CheckError( DAQmxStartTask(DACTask[Device])) ;

     // Restore FPU exceptions
     EnableFPUExceptions ;

     DACActive[Device] := True ;
     GetADCSamplesInUse := False ;
     Result := DACActive[Device] ;

     //FreeMem( DBuf ) ;

     end ;


procedure TLabIO.UpdateDACBuffer(
          Device : SmallInt ;
          var DACBuf : Array of SmallInt  ; { D/A output data buffer (IN) }
          nChannels : SmallInt ;            { No. of D/A channels (IN) }
          nPoints : Integer                 { No. of D/A output values (IN) }
          ) ;
{ --------------------------
  Update DAC buffer
  --------------------------}
var
    i : Integer ;
    NumSamplesWritten : Integer ;
    VScale : Double ;
    DBuf : PDoubleArray ;
begin

     if (Device < 1) or (Device > NumDevices) then Exit ;
     if NumDACs[Device] <= 0 then Exit ;
     Exit ;

     // Allocate buffer
     GetMem( DBuf, nChannels*nPoints*8 ) ;

     if not DACActive[Device] then Exit ;

     DisableFPUExceptions ;

     VScale := DACMaxVolts[Device] / (DACMaxValue[Device]+1.0) ;
     for i := 0 to nChannels*nPoints-1 do DBuf^[i] := DACBuf[i]*VScale ;

     CheckError( DAQmxSetWriteRelativeTo( DACTask[Device], DAQmx_Val_FirstSample )) ;
     CheckError( DAQmxSetWriteOffset( DACTask[Device], 0 )) ;

     // Write data to buffer
     DAQmxWriteAnalogF64 ( DACTask[Device],
                           nPoints,
                           False,
                           DefaultTimeOut,
                           DAQmx_Val_GroupByScanNumber,
                           DBuf,
                           NumSamplesWritten,
                           Nil
                           ) ;

//     outputdebugString(PANSIChar(format('%d %d',[nPoints,NumSamplesWritten]))) ;


     // Restore FPU exceptions
     EnableFPUExceptions ;

     FreeMem( DBuf ) ;

     end ;



function TLabIO.StopDAC(
         Device : SmallInt
         ) : Boolean ;    { Returns FALSE = D/A stopped }
{ ---------------
  Stop D/A output
  --------------- }
begin
     Result := False ;
     if (Device < 1) or (Device > NumDevices) then Exit ;
     if NumDACs[Device] <= 0 then Exit ;
     if not DACActive[Device] then Exit ;

     DisableFPUExceptions ;

     // Stop running D/A task
     CheckError( DAQmxClearTask(DACTask[Device])) ;
 //    outputdebugString(PANSIChar(format('DAC stopped dev=%d',[Device]))) ;

     EnableFPUExceptions ;

     DACActive[Device] := False ;
     Result := DACActive[Device] ;

     end ;


procedure TLabIO.WriteDACs(
          Device : Integer ;
          DACVolts : array of Single ;
          nChannels : Integer ) ;
{ --------------------------------------
  Write values to D/A converter outputs
  -------------------------------------}
var
   DBuf : Array[0..MaxDACChannels-1] of Double ;
   ChannelList : ANSIString ;
   NumSamplesWritten : Integer ;
   i : Integer ;

begin

     // Quit if device does not exist or have DACs
     if (Device < 1) or (Device > NumDevices) then Exit ;
     if NumDACs[Device] <= 0 then Exit ;

     // Stop any running D/A task
     StopDAC(Device) ;

     DisableFPUExceptions ;

     // Create task
     CheckError( DAQmxCreateTask( '', DACTask[Device] ) ) ;

     // Select D/A output channels
     ChannelList := format( DeviceName[Device] + '/AO0:%d', [nChannels-1] ) ;
     CheckError( DAQmxCreateAOVoltageChan( DACTask[Device],
                                           PANSIChar(ChannelList),
                                           nil ,
                                           DACMinVolts[Device],
                                           DACMaxVolts[Device],
                                           DAQmx_Val_Volts,
                                           nil)) ;

     // Copy into double array
     for i := 0 to nChannels-1 do
          begin
          DBuf[i] := Max(Min(DACVolts[i],DACMaxVolts[Device]),DACMinVolts[Device]) ;
          end ;

     // Write data to buffer
     DAQmxWriteAnalogF64 ( DACTask[Device],
                           1,
                           True,
                           DefaultTimeOut,
                           DAQmx_Val_GroupByScanNumber,
                           @DBuf,
                           NumSamplesWritten,
                           Nil
                           ) ;

     // Clear task
     CheckError( DAQmxClearTask ( DACTask[Device] ) ) ;

     EnableFPUExceptions ;

     end ;


procedure TLabIO.WriteDAC(
          Device : Integer ;
          DACVolts : Single ;
          iChannel : Integer ) ;
{ --------------------------------------
  Write values to D/A converter outputs
  -------------------------------------}
var
   DBuf : Array[0..MaxDACChannels-1] of Double ;
   ChannelList : ANSIString ;
   NumSamplesWritten : Integer ;

begin

     // Quit if device does not exist or have DACs
     if (Device < 1) or (Device > NumDevices) then Exit ;
     if iChannel >= NumDACs[Device] then Exit ;

     // Stop any running D/A task
     StopDAC(Device) ;

     DisableFPUExceptions ;

     // Create task
     CheckError( DAQmxCreateTask( '', DACTask[Device] ) ) ;

     // Select D/A output channels
     ChannelList := format( DeviceName[Device] + '/AO%d', [iChannel] ) ;
     CheckError( DAQmxCreateAOVoltageChan( DACTask[Device],
                                           PANSIChar(ChannelList),
                                           nil ,
                                           DACMinVolts[Device],
                                           DACMaxVolts[Device],
                                           DAQmx_Val_Volts,
                                           nil)) ;

     // Copy into double array
      DBuf[0] := Max(Min(DACVolts,DACMaxVolts[Device]),DACMinVolts[Device]) ;

     // Write data to buffer
     DAQmxWriteAnalogF64 ( DACTask[Device],
                           1,
                           True,
                           DefaultTimeOut,
                           DAQmx_Val_GroupByScanNumber,
                           @DBuf,
                           NumSamplesWritten,
                           Nil
                           ) ;

     // Clear task
     CheckError( DAQmxClearTask ( DACTask[Device] ) ) ;

     EnableFPUExceptions ;

     end ;


function TLabIO.MemoryToDIG(
          Device : SmallInt ;
          var DIGBuf : Array of Integer  ;     { Digital output data buffer (IN) }
          nPoints : Integer ;               { No. of digital output values (IN) }
          UpdateInterval : Double ;          { Digital output interval (s) (IN) }
          CircularBufferMode : Boolean ;     { TRUE = continuous update from circular buffer }
          ExternalTrigger : Boolean ;
          TimingDevice : SmallInt           // Device providing ADC/DAC timing pulse
          ): Boolean ;                      { Returns TRUE=D/A active }
{ --------------------------
  Start digital output
  --------------------------}
var
    PortList : ANSIString ;
    SampleMode : Integer ;
    ClockSource : ANSIString ;
    NumBytesWritten : Integer ;
begin
     Result := False ;
     if (Device < 1) or (Device > NumDevices) then Exit ;

     if Device > TimingDevice then
        begin
        ShowMessage('ERROR! Timing device must be last device number started.)') ;
        Exit ;
        end ;

    // Stop any running D/A task
     StopDIG(Device) ;

     DisableFPUExceptions ;

     // Create D/A task
     CheckError( DAQmxCreateTask( '', DIGTask[Device] ) ) ;

     // Select digital port 0 for output
     PortList := DeviceName[Device] + '/port0' ;
     CheckError( DAQmxCreateDOChan( DIGTask[Device],
                                    PANSIChar(PortList),
                                    nil,
                                    DAQmx_Val_ChanForAllLines ));

     // Select continuous sampling if repeated waveform selected
     if CircularBufferMode then SampleMode := DAQmx_Val_ContSamps
                           else SampleMode := DAQmx_Val_FiniteSamps ;

     // Set D/A clock source
     if TimingDevice <> Device then
        begin
        ClockSource := '/' + DeviceName[TimingDevice] + '/ao/sampleclock' ;
        end
     else
        begin
        ClockSource := 'onboardclock' ;
        end ;
     ClockSource := '/' + DeviceName[TimingDevice] + '/ao/sampleclock' ;

     // Set digital output timing
     CheckError( DAQmxCfgSampClkTiming( DIGTask[Device],
                                        PANSIChar(ClockSource),
                                        1.0/UpdateInterval,
                                        DAQmx_Val_Falling ,
                                        SampleMode,
                                        nPoints)) ;

     // Configure buffer
     CheckError( DAQmxCfgOutputBuffer ( DIGTask[Device], nPoints )) ;

     // Write bit pattern to port
     CheckError( DAQmxWriteDigitalU32( DIGTask[Device],
                                       nPoints,
                                       False,
                                       DefaultTimeOut,
                                       DAQmx_Val_GroupByScanNumber ,
                                       @DigBuf,
                                       NumBytesWritten,
                                       Nil)) ;

     // Start output when DAC clocks starts
//     CheckError( DAQmxCfgDigEdgeStartTrig( DIGTask[Device],
//                                           PANSIChar(DeviceName[TimingDevice] + '/ao/SampleClock'),
//                                           DAQmx_Val_Rising )) ;

     // Request immediate start
   //  CheckError(DAQmxDisableStartTrig(DIGTask[Device]));
     // Start D/A task
     CheckError( DAQmxStartTask(DIGTask[Device])) ;

     // Restore FPU exceptions
     EnableFPUExceptions ;

     DIGActive[Device] := True ;
     Result := DIGActive[Device] ;

     end ;


procedure TLabIO.UpdateDIGBuffer(
          Device : SmallInt ;
          var DIGBuf : Array of Integer  ; { Digital output data buffer (IN) }
          nPoints : Integer                 { No. of D/A output values (IN) }
          ) ;
{ --------------------------
  Update digital buffer
  --------------------------}
var
    NumBytesWritten : Integer ;
begin

     if (Device < 1) or (Device > NumDevices) then Exit ;
     if not DIGActive[Device] then Exit ;

     DisableFPUExceptions ;

     CheckError( DAQmxSetWriteRelativeTo( DIGTask[Device], DAQmx_Val_FirstSample )) ;
     CheckError( DAQmxSetWriteOffset( DIGTask[Device], 0 )) ;

     // Write bit pattern to port
     CheckError( DAQmxWriteDigitalU32( DIGTask[Device],
                                      nPoints,
                                      False,
                                      DefaultTimeOut,
                                      DAQmx_Val_GroupByScanNumber ,
                                      @DigBuf,
                                      NumBytesWritten,
                                      Nil)) ;

//     outputdebugString(PANSIChar(format('%d %d',[nPoints,NumBytesWritten]))) ;

     // Restore FPU exceptions
     EnableFPUExceptions ;

     end ;



function TLabIO.StopDIG(
         Device : SmallInt
         ) : Boolean ;    { Returns FALSE = D/A stopped }
{ -------------------
  Stop digital output
  ------------------- }
begin
     Result := False ;
     if (Device < 1) or (Device > NumDevices) then Exit ;
     if not DIGActive[Device] then Exit ;

     DisableFPUExceptions ;

     // Stop running D/A task
     CheckError( DAQmxClearTask(DIGTask[Device])) ;
//     outputdebugString(PANSIChar(format('DIG stopped dev=%d',[Device]))) ;

     EnableFPUExceptions ;

     DIGActive[Device] := False ;
     Result := DIGActive[Device] ;

     end ;


procedure TLabIO.WriteToDigitalOutPutPort(
          Device : Integer ;
          Pattern : Integer
          ) ;
{ ----------------------
  Update digital port 0
  ---------------------}
var
   PortList : ANSIString ;
begin

     if Device > NumDevices then Exit ;
     //Exit ;

     DisableFPUExceptions ;

     // Create task
     CheckError( DAQmxCreateTask( '', DigTask[Device] ) ) ;

     // Select digital port 0 for output
     PortList := DeviceName[Device] + '/port0' ;
     CheckError( DAQmxCreateDOChan( DigTask[Device],
                                    PANSIChar(PortList),
                                    nil,
                                    DAQmx_Val_ChanForAllLines ));

     // Write bit pattern to output (first 8 bits only used)
     CheckError( DAQmxWriteDigitalScalarU32( DigTask[Device],
                                             True,
                                             DefaultTimeOut,
                                             Pattern,
                                             Nil )) ;

     // Clear task
     CheckError( DAQmxClearTask ( DigTask[Device] ) ) ;

     EnableFPUExceptions ;

     end ;


function TLabIO.ReadADC(
         Device : Integer ;
         Channel : Integer ;       { A/D channel to be read (IN) }
         ADCVoltageRange : Single  { A/D converter input voltage range (V) (IN) }
         ) : Integer ;
// ----------------------------------------------
// Single read of selected A/D converter channel
// ----------------------------------------------
var
    ChannelList : ANSIString ;
    Voltage : Double ;
begin
     Result := 0 ;
     // Quit if device does not exist or have ADCs
     if (Device < 1) or (Device > NumDevices) then Exit ;
     if NumADCs[Device] <= 0 then Exit ;

     // Stop any running A/D task
     StopADC(Device) ;

     DisableFPUExceptions ;

     // Create task
     CheckError( DAQmxCreateTask( '', ADCTask[Device] ) ) ;

     // Select A/D input channel
     ChannelList := format( DeviceName[Device] + '/AI%d', [Channel] ) ;


     CheckError( DAQmxCreateAIVoltageChan( ADCTask[Device],
                                           PANSIChar(ChannelList),
                                           nil ,
                                           ADCInputModeCode(Device,ADCInputMode),
                                           -ADCVoltageRange,
                                           ADCVoltageRange,
                                           DAQmx_Val_Volts,
                                           nil));

     // Read voltage
     CheckError( DAQmxReadAnalogScalarF64( ADCTask[Device],
                                           DefaultTimeOut,
                                           Voltage,
                                           Nil )) ;

     // Clear task
     CheckError( DAQmxClearTask ( ADCTask[Device] ) ) ;

     EnableFPUExceptions ;

     Result := Round( (Voltage/ADCVoltageRange)*ADCMaxValue[Device] ) ;

     end ;


function TLabIO.GetChannelOffset(
         Chan : Integer ;
         NumChannels : Integer ) : Integer ;
begin
     Result := Chan ;
     end ;


procedure TLabIO.Close ;
{ -----------------------------------
  Shut down lab. interface operations
  ----------------------------------- }
var
    Device : SmallInt ;
begin

     for Device := 1 to NumDevices do begin
         if DACActive[Device] then StopDAC(Device) ;
         if ADCActive[Device] then StopADC(Device) ;
         end ;

     BoardsInitialised := False ;

     if InBuf <> Nil then FreeMem(InBuf) ;
     InBuf := Nil ;

     if LibraryLoaded then FreeLibrary( LibraryHnd ) ;
     LibraryLoaded := False ;

     end ;


function  TLabIO.IntLimit(
          Value : Integer ;
          LoLimit : Integer ;
          HiLimit : Integer
          ) : Integer ;
{ -------------------------------------------------------------
  Return integer Value constrained within range LoLimit-HiLimit
  ------------------------------------------------------------- }
begin
     if Value > HiLimit then Value := HiLimit ;
     if Value < LoLimit then Value := LoLimit ;
     Result := Value ;
     end ;

function  TLabIO.PCharArrayToString(
          CBuf : Array of ANSIChar
          ) : ANSIString ;
var
  i : Integer ;
  s : ANSIString ;
begin

    i := 0 ;
    s := '' ;
    repeat
        if Cbuf[i] <> #0 then s := s + CBuf[i] ;
        Inc(i) ;
    until (CBuf[i] = #0) or (i >= High(CBuf)) ;
    Result := s ;
    end ;

procedure TLabIO.SetBit( var iValue : Integer ;
                         BitNum : Integer ;
                         State : Integer ) ;

var
  Bit, BitMask : Integer;
begin
    BitMask := not (1 shl BitNum) ;
    Bit := State shl BitNum ;
    iValue := (iValue and BitMask) or Bit ;
    end;


procedure TLabIO.Wait( Delay : Single ) ;
var
  T : Integer ;
  TExit : Integer ;
begin
    T := TimeGetTime ;
    TExit := T + Round(Delay*1E3) ;
    while T < TExit do
       begin
       T := TimeGetTime ;
       Application.ProcessMessages ;
       end ;
    end ;

function TLabIO.BitMask( BitNumber : Integer ) : Integer ;
// ----------------------------------------------
// Return bit mask from number of bit (0..15) within word
// ----------------------------------------------
var
    i, Bit : Integer ;

begin
    Bit := 1 ;
    for i := 1 to BitNumber do Bit := Bit*2 ;
    Result := Bit ;
    end ;



end.
