unit MainUnit;
// =======================================================================
// MesoCam: Mesolens Camera Image Acquisition Software
// =======================================================================
// (c) John Dempster, University of Strathclyde 2011-16
// V1.0
// V1.5.1 12.04.16 S
// V1.5.2 29.04.16
// V1.5.3 9.05.16 Nearly working with Vieworks camera
//                Upper exposure time limited to 140ms
//        10.05.16 Black level offset still present
//        24.05.16 Settings now saved in C:\Users\Public\Documents\MesoCam
// V1.5.4 30.9.16 Warning message displayed when program is closed down
//                SaveAsBIGTIFF flag now correctly loaded from settings file
//                Exposure time errors fixed (by limiting to 10 us steps)
// V1.5.4 13.10.16 Exposure time attribute corrected in Vieworks VA-29MC-5M.icd file. Now correctly sets
//                 exposure time 10 us - 7s. Exposure frame capture rates now faster
//                 6 x SD contrast range now calculated correctly
// V1.5.6 09.11/16 Now working with PCIe-1433 card and new camera
// V1.5.7 17.11.16 Pixel Intensity histogram display added
//                 Lens table added
// V1.5.8 16.01.17 Z stage now working and XY axes now supported
//                 Pixel intensity histogram added and lens magnification table
// V1.5.9 21.02.17 Time series option added
// V1.5.9 22.02.17 Z step no longer forced to be multiple of pixel size
//                 Working on incorrect first image in pixel shift sequence.
// V1.6.0 08.03.17 Incorrect first image in pixel shift sequence fixed
//                 'CAPTUREMODE','GOTOXPOSITION','GOTOYPOSITION','GOTOZPOSITION' added to INI file
//                 SaveImage() Now saves Z stacks as multipage TIFFs correctly.
// V1.6.1 22.03.17 USB control of CoolLED light source added
// V1.6.2 27.04.17 Camera trigger pulse to start VA-29MC-5M pixel shift sequences now implemented
//                 in Cam1.Startcapture to fix pixel misalignment problem
// V1.6.3 10.05.17 ZPositionMin, ZPositionMax limits added
// V1.6.4 24.05.17 Z stage protection now initialised correctly
// V1.6.5 31.05.17 Z stage limits now on goto control now updated when changed in setup
//                 Pixel-shift images now workinh again with PCVIe-1427 framer grabber
// V1.6.6 07.06.17 Fan on/off now handle via attribute string
//        14.06.17 CoolLED USB serial communication working but not complete
// V1.6.7 05.07.17 Save Image now works again
//                 CoolLED USB support now works
// V1.6.8 12.07.17 VA-29MC-5M Fan on/off now handled by call again
// V1.6.9 04.08.17 ZStage: Prior stage now moved in small increments to
//                 allow movement to be changed during stage movement. Lens protection
//                 TTL command now aborts move command before moving to 0,0,0
//                 VMC-29MC-5MCCD stage position now set manually using Cam1.CCDXShift Cam1.CCDYShift properties.
// V1.7.0 16.08.17 Images now acquired as single image snaps in Timer procedure.
// V1.7.1 22.08.17 Pixel shift images now equalised in intensity before interleaving into final image
//                 Folder holding mesocam.raw file can now be changed in settings.
// V1.7.1 23.08.17 Variation in exposure time still noy fully resolved.
// V1.7.2 24.08.17 Pixel shift imaging working
//        25.08.17 Now correctly displays captured image when live imaging stopped
//        28.08.17 ROI, zoom and display move functions now available simultaneously
//        29.08.17 Sequential multiwavelength imaging working
//        30.08.17 Sequential multiwavelength imaging tested and working
// V1.7.3 27.09.17
// V1.7.4 04.10.17 Display control text reduced to fit everyyhing on screen
// V1.7.5 05.10.17 Exposure times up to 7s now supported
// V1.7.6 15.10.17 'CAMERATEMPERATURESETPOINT', Cam1.CameraTemperatureSetPoint added to setting files
//                 CalibrationBarSize added
//                 Raw file image now now saved and redisplayed when program restarted
// V1.7.7 18.10.17 File>Save Image now works again.
//                 Calibration bar added to display
//                 Light Source and Z stage commands ignored if serial port does not open avoiding timeout delays
//                 More help pages added
// V1.7.8 19.10.17 Intermittent failure to start camera when Capture Image pressed fixed by changing to
//                 Free Run trigger mode instead of Trigger Pulse (IMAQ_SnapImage).
//                 Correct max. grey level now selected when program started
//                 Image stored in raw file on start up now resized correctly
//                 .T0 and .Z0 eliminated from TIF file name when only single Z or T images.
// V1.7.9 23.10.17 NI Boards: If error detecting board name no. of devices set to zero avoiding repeated error loop
// V1.8.0 23.10.17 Auto contrast adjust now operational. Image now moves when dragged with left mouse button down (ratehr
//                 moving oonly when button released.
// V1.8.1 06.11.17 Timeout added which forces camera restart if frames capture ceases
//                 Cam1.CCDTapOffsetLT etc. CCD tap black offset adjustment properties added and saved in ini file
// V1.8.2 01.12.17 CoolLED wavelength list now updated every second to monitor changes in selected wavelength
//                 Timeout which forces camera restart if frames capture ceases renoved
// V1.8.3 05.12.17 CoolLED wavelength list update now works.
// V1.8.4 17.05.18 IMAQUNit.pas Camera start now tried repeatedly to overcome random failure to start camera acquisition
// V1.8.5 21.11.18 CoolLED coms now handled by thread
// V1.8.6 18.03.19 Thorlabs Z stage controller added. CoolLED and Z stage coms now handled by thread.
//                 LEDs now turned off between time lapse exposures
// V1.8.7 27.03.19 Now supports FlASH 4.0 and other DCAM cameras.
// V1.8.8 08.04.19 Calbration bar and temperature set point labells now in correct places
// V1.8.9 24.04.19 StartCamera() Extra frame at beginning of CCD shift exposure sequences now only collected
//                 for Vieworks cameras on IMAQ interface
//                 'CAMERAREADOUTSPEED', Cam1.ReadoutSpeed now stored in settings file
// V1.9.0 11.03.22 Time lapse, Z stack and multi-wavelength illumination now supported
//                 Timing of light source, image capture snd Z stage now handled by Event list.
// V1.9.1 19.03.22 Debugging in progress with Vieworks pixel shift camera
// V1.9.2 19.03.22 LIGHTSOURCECHANGETIME added to settings file
// V1.9.3 19.03.22 T and Z scroll bars now fixed at bottom of display

Interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ValidatedEdit, LabIOUnit, RangeEdit, math,
  ExtCtrls, ImageFile, xmldoc, xmlintf, ActiveX, Vcl.Menus, system.types, strutils, UITypes,
  SESCam, mmsystem, Vcl.ToolWin, Vcl.Buttons, LightSourceUnit, shellapi,shlobj,
  XYPlotDisplay, About, VCL.HTMLHelpViewer ;

const
    VMax = 10.0 ;
    MaxFrameType = 2 ;
    GreyScalePalette = 0 ;
    LUTSize = $10000 ;
    GreyLevelLimit = $FFFF ;
    FalseColourPalette = 1 ;
    MaxPanels = 4 ;
    MaxHistogramBins = 128 ;
    MaxLenses = 10 ;
    evLightSource = 1 ;
    evZStage = 2 ;
    evSetCCDPixelShift = 3 ;
    evExposure = 4 ;
    evImageWait = 5 ;
    evSequenceStart = 6 ;
    evSequenceEnd = 7 ;
type

 TPaletteType = (palGrey,palGreen,palRed,palBlue,palFalseColor) ;

 TDoubleRect = record
    Left : Double ;
    Right : Double ;
    Top : Double ;
    Bottom : Double ;
    Width : Double ;
    Height : Double ;
    end ;

 TEventListItem = record
    EventType : Cardinal ;
//    Time : Cardinal ;
    Delay : Cardinal ;
    LightSourceOn : Boolean ;
    LightSources : TActiveLightSource ;
    CCDShiftCounter : Cardinal ;
    ZPosition : Double ;
    TSection : Integer ;
    ZSection : Integer ;
    end ;

 TEventList = Array[0..1000000] of TEventListItem ;
 PEventList = ^TEventList ;


  TMainFrm = class(TForm)
    ControlGrp: TGroupBox;
    bCaptureImage: TButton;
    Timer: TTimer;
    bStopImage: TButton;
    ImageFile: TImageFile;
    SaveDialog: TSaveDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    mnExit: TMenuItem;
    mnSetup: TMenuItem;
    mnScanSettings: TMenuItem;
    ImageSizeGrp: TGroupBox;
    ZStackGrp: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edNumZSections: TValidatedEdit;
    edNumPixelsPerZStep: TValidatedEdit;
    edMicronsPerZStep: TValidatedEdit;
    ZStageGrp: TGroupBox;
    edGotoXPosition: TValidatedEdit;
    bGotoZPosition: TButton;
    LightSourceGrp: TGroupBox;
    DisplayGrp: TGroupBox;
    cbPalette: TComboBox;
    ContrastPage: TPageControl;
    RangeTab: TTabSheet;
    bFullScale: TButton;
    bMaxContrast: TButton;
    edDisplayIntensityRange: TRangeEdit;
    ckContrast6SDOnly: TCheckBox;
    ckAutoOptimise: TCheckBox;
    SlidersTab: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    StatusGrp: TGroupBox;
    bLiveImage: TButton;
    mnSaveImage: TMenuItem;
    cbCaptureMode: TComboBox;
    edExposureTime: TValidatedEdit;
    Label7: TLabel;
    CCDAreaGrp: TGroupBox;
    bFullFrame: TButton;
    bSelectedRegion: TButton;
    bEnterCCDArea: TButton;
    Label8: TLabel;
    cbCameraGain: TComboBox;
    edStatus: TEdit;
    pnLightSource0: TPanel;
    ckLightSourceOn0: TCheckBox;
    edName: TEdit;
    TrackBar1: TTrackBar;
    ValidatedEdit1: TValidatedEdit;
    pnLightSource1: TPanel;
    ckLightSourceOn1: TCheckBox;
    Edit1: TEdit;
    TrackBar2: TTrackBar;
    ValidatedEdit2: TValidatedEdit;
    pnLightSource2: TPanel;
    ckLightSourceOn2: TCheckBox;
    Edit2: TEdit;
    TrackBar3: TTrackBar;
    ValidatedEdit3: TValidatedEdit;
    pnLightSource3: TPanel;
    ckLightSourceOn3: TCheckBox;
    Edit3: TEdit;
    TrackBar4: TTrackBar;
    ValidatedEdit4: TValidatedEdit;
    pnLightSource4: TPanel;
    ckLightSourceOn4: TCheckBox;
    Edit4: TEdit;
    TrackBar5: TTrackBar;
    ValidatedEdit5: TValidatedEdit;
    pnLightSource5: TPanel;
    ckLightSourceOn5: TCheckBox;
    Edit5: TEdit;
    TrackBar6: TTrackBar;
    ValidatedEdit6: TValidatedEdit;
    pnLightSource6: TPanel;
    ckLightSourceOn6: TCheckBox;
    Edit6: TEdit;
    TrackBar7: TTrackBar;
    ValidatedEdit7: TValidatedEdit;
    pnLightSource7: TPanel;
    ckLightSourceOn7: TCheckBox;
    Edit7: TEdit;
    TrackBar8: TTrackBar;
    ValidatedEdit8: TValidatedEdit;
    Page: TPageControl;
    tbChan0: TTabSheet;
    tbChan1: TTabSheet;
    tbChan2: TTabSheet;
    Image0: TImage;
    lbReadout: TLabel;
    Image1: TImage;
    Image2: TImage;
    mnSaveToImageJ: TMenuItem;
    tbContrast: TTrackBar;
    tbBrightness: TTrackBar;
    ckSeparateLightSources: TCheckBox;
    ckAcquireZStack: TCheckBox;
    tbChan3: TTabSheet;
    Image3: TImage;
    cbLiveBin: TComboBox;
    plHistogram: TXYPlotDisplay;
    Label2: TLabel;
    cbLens: TComboBox;
    mnHelp: TMenuItem;
    mnContents: TMenuItem;
    mnABout: TMenuItem;
    edGotoYPosition: TValidatedEdit;
    edGotoZPosition: TValidatedEdit;
    edXYZPosition: TEdit;
    ckAcquireTimeLapseSeries: TCheckBox;
    TimeLapseGrp: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edNumTimeLapsePoints: TValidatedEdit;
    edTimeLapseInterval: TValidatedEdit;
    bGoToXPosition: TButton;
    bGoToYPosition: TButton;
    Cam1: TSESCam;
    lbSaveFilename: TLabel;
    SlidersGrp: TGroupBox;
    TSectionPanel: TPanel;
    lbTSection: TLabel;
    Label15: TLabel;
    scTSection: TScrollBar;
    ZSectionPanel: TPanel;
    lbZSection: TLabel;
    Label1: TLabel;
    scZSection: TScrollBar;
    edSaveFileStatus: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bCaptureImageClick(Sender: TObject);
    procedure bFullScaleClick(Sender: TObject);
    procedure edDisplayIntensityRangeKeyPress(Sender: TObject;
      var Key: Char);
    procedure bMaxContrastClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure bStopImageClick(Sender: TObject);
    procedure cbPaletteChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnExitClick(Sender: TObject);
    procedure edXPixelsKeyPress(Sender: TObject; var Key: Char);
    procedure edYPixelsKeyPress(Sender: TObject; var Key: Char);
    procedure mnScanSettingsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image0MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ckLineScanClick(Sender: TObject);
    procedure bGotoZPositionClick(Sender: TObject);

    procedure Image0MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image0MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure scZSectionChange(Sender: TObject);
    procedure edNumPixelsPerZStepKeyPress(Sender: TObject; var Key: Char);
    procedure edMicronsPerZStepKeyPress(Sender: TObject; var Key: Char);
    procedure edGotoXPositionKeyPress(Sender: TObject; var Key: Char);
    procedure sbContrastChange(Sender: TObject);
    procedure bLiveImageClick(Sender: TObject);
    procedure mnSaveImageClick(Sender: TObject);
    procedure edExposureTimeKeyPress(Sender: TObject; var Key: Char);
    procedure cbCameraGainChange(Sender: TObject);
    procedure bFullFrameClick(Sender: TObject);
    procedure cbCaptureModeChange(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure ValidatedEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ckLightSourceOn0Click(Sender: TObject);
    procedure bSelectedRegionClick(Sender: TObject);
    procedure mnSaveToImageJClick(Sender: TObject);
    procedure tbBrightnessChange(Sender: TObject);
    procedure tbContrastChange(Sender: TObject);
    procedure bEnterCCDAreaClick(Sender: TObject);
    procedure ckAcquireZStackClick(Sender: TObject);
    procedure ckSeparateLightSourcesClick(Sender: TObject);
    procedure PageChange(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure cbLiveBinChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbLensChange(Sender: TObject);
    procedure mnABoutClick(Sender: TObject);
    procedure ckAcquireTimeLapseSeriesClick(Sender: TObject);
    procedure scTSectionChange(Sender: TObject);
    procedure mnContentsClick(Sender: TObject);
    procedure edGotoYPositionKeyPress(Sender: TObject; var Key: Char);
    procedure edGotoZPositionKeyPress(Sender: TObject; var Key: Char);
    procedure rbROIModeClick(Sender: TObject);
    procedure rbZoomModeClick(Sender: TObject);
    procedure bGoToXPositionClick(Sender: TObject);
    procedure bGoToYPositionClick(Sender: TObject);
  private

    { Private declarations }
        TimerBusy : Boolean ;
        BitMap : TBitMap ;  // Image internal bitmaps
        procedure DisplayROI( BitMap : TBitmap ) ;
        procedure DisplaySquare(
                  X : Integer ;
                  Y : Integer ) ;
        procedure DisplayCalibrationBar(
                  X : Integer ;
                  Y : Integer ) ;
       procedure DisplayCursorReadout ;


        procedure FixRectangle( var Rect : TRect ) ;
        function GetSpecialFolder(const ASpecialFolderID: Integer): string;
        procedure PlotHistogram ;
        procedure CopyImageToDisplayBuf( iFrame : Integer ) ;
        procedure InterleaveToPixelShiftImage( iShift : Integer ) ;
  public
    { Public declarations }
    ProgramName : string ;                  // Program name & version
    CameraType : Integer ;

    RelayLensMagnification : Double ;       // Camera relay lens magnification
    NumLenses : Integer ;                   // No. lenses in table
    LensMagnification : Array[0..MaxLenses-1] of Double ;  // Lens magnification
    LensName : Array[0..MaxLenses-1] of String ;           // Lens name
    LensSelected : Integer ;               // Lens # selected for use
    CameraPixelSize : double ;             // Camera pixel size (microns)
    CalibrationBarSize : double ;          // Display calibration bar size (microns)
    LiveBinSelected : Integer ;            // Selected live binning option
    MagnifiedCameraPixelSize : double ;    // Image pixel size (microns)
    CameraTriggerOutput : Integer ;        // Camera trigger digital output line
    CameraTriggerActiveHigh : Boolean ;    // TTL high level triggers camera
    CameraGainIndex : Integer ;
    CCDShiftCounter : Integer ;            // CCD stage shift counter
    Initialising : Boolean ;

    ShowCapturedImage : Boolean ;
    LiveImagingInProgress : Boolean ;      // Live imaging in progress (not saving to disk)
    ImageCaptureInProgress : Boolean ;     // Image capture in progress (saving to disk)
    ShowCameraImage : Boolean ;
    RawImageAvailable : Boolean ;
    ImageCaptured : Boolean ;              // Image has been captured flag

    DeviceNum : Integer ;
    pFrameBuf : Pointer ;

    TempBuf : PBig16bitArray ;
    FirstImageSum : Double ;
    ResizeImage : Boolean ;

    FramePointer : Integer ;
    MostRecentFrame : Integer ;
    PreviousFrameCount : Integer ;
    LastFrameDisplayed : Integer ;
    GetImageInProgress : Boolean ;
    TStart : Integer  ;
    NumFramesAcquired : Integer ;     // No. of frames acquired by camera
    NumFramesRequired : Integer ;     //  No. of frames required to be captured
//    OldNumFramesAcquired : Integer ;
//    NextCameraTrigger : Integer ;

    LastFrameCount : Cardinal ;        // Last camera frame count

    TimeLapseNumPoints : Integer ;    // No. points in time lapse series
    TimeLapseInterval : Double ;      // Interval between time lapse images

    PixelsToMicronsX : Double ;                // Image pixel X# to micron scaling factor
    PixelsToMicronsY : Double ;                // Image pixel Y# to micron scaling factor
    Images : Array[0..3] of TImage ;           // Image pointers

    CCDRegion : TDoubleRect ;                  // CCD image area
    SelectedRect : TDoubleRect ;               // Selected sub-area within displayed image (image pixels)
    SelectedRectBM : TRect ;                   // Selected sub-area (bitmap pixels)
    SelectedEdge : TRect ;                     // Selection rectangle edges selected
    MouseDown : Boolean ;                      // TRUE = image cursor mouse is depressed
    CursorPos : TPoint ;                       // Position of cursor within image
    TopLeftDown : TPoint ;
    MouseDownAt : TPoint ;                     // Mouse position when button depressed
    MouseDownButton : TMouseButton ;           // Button pressed
    MouseUpCursor : Integer ;                  // Cursor icon when button released
    CursorReadoutText : string ;               // X,Y position of mouse cursor on display and intensity

    ZTop : Double ;
    FrameWidth : Integer ;                // Width of image on display
    FrameHeight : Integer ;               // Height of image of display
    NumComponentsPerPixel : Integer ;     // No. of colour components per pixel
    NumComponentsPerFrame : Integer ;     // No. of colour components in display image
    NumBitsPerPixel : Integer ;           // No. of bits in component
    GreyLevelMax2 : Double ;               // No. of grey levels in component

//  High resolution image
    HRFrameWidth : Integer ;                 // Width
    HRFrameHeight : Integer ;                // Height
    HRNumComponentsPerPixel : Integer ;     // No. of colour components per pixel
    HRNumComponentsPerFrame : Integer ;     // No. of colour components
    NumPixelShiftFrames : Integer ;         // No. of pixel shifted frames

    EventList : PEventList ;            // Timer event list
    NumEvents : Integer ;               // No. events in list
    EventCounter : Integer ;            // Event list pointer
    TNextEvent : Cardinal ;             // System time for next event (ms)
    TZStackStart : Cardinal ;          // System time (ms) that Z stack started

    LightSourcesInUse : Array[0..MaxLightSources] of Integer  ;  // List of index nos. of light sources in use
    NumLightSourcesInUse : Integer ;                            // No. of light sources in use
//    NumImagePanels : Integer ;                                   // No. of image panels in use

    SlidersDisabled : Boolean ;

    // Z axis control
    NumZSectionsRequested : Integer ;   // No. of sections in Z stack requested

//    ZStackStartingPosition : Double ;   // Starting position of Z stack series

    TImageCaptureStartedAt : Cardinal ; // System time (ms) that image capture started

    NumTSectionsAvailable : Integer ;   // No. of time lapse sections available
    NumTSectionsRequested : Integer ;   // No. of time lapse sections required
//    NumPanelsAvailable : Integer ;   // No. of image panels available

    ZStartingPosition : Double ;      // Z position at start of scanning
    EmptyFlag : Integer ;
    UpdateDisplay : Boolean ;

    DisplayMaxWidth : Integer ;
    DisplayMaxHeight : Integer ;

    XLeft : Double ;                 // Left edge of display (fraction of camera frame)
    YTop : Double ;                  // Top edge of display (fraction of camera frame)
    ScaleToBM : Double ;             // Scale from image pixel to bit map coord
    ROIMode : Boolean ;              // Region of interest mode flag

    Magnification : Array[0..999] of Integer ;

    iZoom : Integer ;

        // Display look-up tables
    GreyLo : Integer ; // Lower limit of display grey scale
    GreyHi : Integer ; // Upper limit of display grey scale
    GreyLevelMax : Integer ;                  // Max. grey level
    RedLUT : Array[0..LUTSize-1] of Word ;    // Display look-up tables
    GreenLUT : Array[0..LUTSize-1] of Word ;    // Display look-up tables
    BlueLUT : Array[0..LUTSize-1] of Word ;    // Display look-up tables
    PaletteType : TPaletteType ;  // Display colour palette
    pImageBuf : PIntArray ;              // Pointer to image buffers
    pLiveImageBuf : PIntArray ;          // Pointer to live image buffer
    pDisplayBuf : PIntArray ;

    PanelName : Array[0..MaxPanels-1] of string ; // Names of display panels in use
    NumPanels : Integer ;                         // No. of display panels in use

//    SnapStartAt : Cardinal ;                       // Time (ms) to acquire next image
//    LastSnapStartedAt : Cardinal ;                 // Time (ms) last snap started
//    LightSourceOnAt : Cardinal ;                   // Time (ms) to turn light source(s) on

    UpdateLightSource : Boolean ;                  // Update light source flag

    ScanningInProgress : Boolean ;

    INIFileName : String ;
    ProgDirectory : String ;
    SaveDirectory : String ;
    SettingsDirectory : String ;
    RawImagesFileName : String ;
    NumImagesInRawFile : Integer ;        // Num images in file
    TPointCounter : Integer ;             // Time lapse point counter
    ZSectionCounter : Integer ;           // Z section counter

    UnsavedRawImage : Boolean ;      // TRUE indicates raw images file contains an unsaved hi res. image
    SaveAsMultipageTIFF : Boolean ;  // TRUE = save as multi-page TIFF, FALSE=separate files
    ImageJPath : String ;            // Path to Image-J program

    HistogramNumBins : Integer ;
    Histogram : Array[0..MaxHistogramBins-1] of Single ;

    IgnorePanelControls : Boolean ;

    MemUsed : Integer ;
    procedure SetImagePanels ;
    procedure StartImageCapture ;
    procedure StartCamera ;
    procedure StopCamera ;

    procedure SetDisplayIntensityRange(
          LoValue : Integer ;
          HiValue : Integer
          ) ;

    procedure UpdateLUT( GreyMax : Integer ) ;

    procedure UpdateImage ;

    procedure CalculateMaxContrast ;

    procedure SetScanZoomToFullField ;
    procedure SetLensMenu ;
    procedure ClearImageBuffers ;

procedure SaveRawImage(
          FileName : String ;    // File to save to
          iImage : Integer     // Image Section number
          ) ;

function SectionFileName(
         FileName : string ;   // Base file name
         iPanel : Integer ;    // Image panel #
         iZSection : Integer ;   // Z section #
         iTSection : Integer     // T section #
         ) : string ;

procedure LoadRawImage(
          FileName : String ;    // File to save to
          ZSection : Integer ;   // Z stack section
          TSection : Integer ;   // T series section
          iPanel : Integer       // Wavelength panel
          ) ;

procedure SaveImage(
          OpenImageJ: boolean    // TRUE = open in Image-J
          ) ;

    procedure SaveSettingsToXMLFile1(
              FileName : String
              ) ;
    procedure SaveSettingsToXMLFile(
              FileName : String
              ) ;
    procedure LoadSettingsFromXMLFile1(
              FileName : String
              ) ;
    procedure LoadSettingsFromXMLFile(
              FileName : String
              ) ;

    procedure AddElementDouble(
              ParentNode : IXMLNode ;
              NodeName : String ;
              Value : Double
              ) ;
    function GetElementDouble(
              ParentNode : IXMLNode ;
              NodeName : String ;
              Value : Double
              ) : Double ;
    procedure AddElementInt(
              ParentNode : IXMLNode ;
              NodeName : String ;
              Value : Integer
              ) ;
    function GetElementInt(
              ParentNode : IXMLNode ;
              NodeName : String ;
              Value : Integer
              ) : Integer ;
    procedure AddElementBool(
              ParentNode : IXMLNode ;
              NodeName : String ;
              Value : Boolean
              ) ;
    function GetElementBool(
              ParentNode : IXMLNode ;
              NodeName : String ;
              Value : Boolean
              ) : Boolean ;

    procedure AddElementText(
              ParentNode : IXMLNode ;
              NodeName : String ;
              Value : String
              ) ;
    function GetElementText(
              ParentNode : IXMLNode ;
              NodeName : String ;
              Value : String
              ) : String ;

    function FindXMLNode(
         const ParentNode : IXMLNode ;  // Node to be searched
         NodeName : String ;            // Element name to be found
         var ChildNode : IXMLNode ;     // Child Node of found element
         var NodeIndex : Integer        // ParentNode.ChildNodes Index #
                          // Starting index on entry, found index on exit
         ) : Boolean ;

    procedure SetLightSourcePanel(
              Num : Integer ;
              Panel : TPanel ;
              var iTop : Integer ) ;
    procedure GetLightSourcePanel(
              Num : Integer ;
              Panel : TPanel ;
              TrackBarChange : Boolean ) ;
    procedure GetAllLightSourcePanels ;

  end;


// Corrected system function call template
function GetSystemPaletteEntries(
         DC : HDC ;
         StartIndex : Cardinal ;
         NumEntries : Cardinal ;
         PaletteEntries : Pointer ) : Cardinal ; stdcall ;


var
  MainFrm: TMainFrm;

implementation

//uses LogUnit;


uses SettingsUnit, ZStageUnit, SetCCDReadoutUnit ;

{$R *.dfm}

function GetSystemPaletteEntries ; external gdi32 name 'GetSystemPaletteEntries' ;


procedure TMainFrm.FormCreate(Sender: TObject);
// --------------------------------------
// Initalisations when program is created
// --------------------------------------
begin
     BitMap := Nil ;
     pDisplayBuf := Nil ;
     pImageBuf := Nil ;
     pLiveImageBuf := Nil ;
     EventList := Nil ;
     NumEvents := 0 ;
     EventCounter := 0 ;

     IgnorePanelControls := True ;
     TimerBusy := False ;
     ResizeImage := False ;

     NumImagesInRawFile := 0 ;
     ZSectionCounter := 0 ;
     TPointCounter := 0 ;
     NumTSectionsAvailable := 0 ;
     CursorReadoutText := '' ;
     edSaveFileStatus.Visible := False ;
     end;


procedure TMainFrm.FormShow(Sender: TObject);
// --------------------------------------
// Initialisations when form is displayed
// --------------------------------------
var
    i : Integer ;
begin

     Initialising := False ;
     LiveImagingInProgress := False ;
     ImageCaptureInProgress := False ;
     ShowCapturedImage := False ;
     UpdateLightSource := False ;

     ProgramName := 'MesoCam V1.9.3';
     {$IFDEF WIN32}
     ProgramName := ProgramName + ' (32 bit)';
    {$ELSE}
     ProgramName := ProgramName + ' (64 bit)';
    {$IFEND}
     ProgramName := ProgramName + ' 19/03/22';
     Caption := ProgramName ;

     TempBuf := Nil ;
     DeviceNum := 1 ;
     LabIO.Open ;

     Cam1.BinFactor := 1 ;

     edStatus.Text := LabIO.DeviceName[1] + ': ' + LabIO.DeviceBoardName[1] ;

     LabIO.ADCInputMode := imDifferential ;
     if cam1.NumBytesPerPixel = 1 then EmptyFlag := 255
                                  else EmptyFlag := 32000 ;

    TimeLapseNumPoints := 100 ;
    TimeLapseInterval := 10.0 ;

     DeviceNum := 1 ;

     Magnification[0] := 1 ;
     for i := 0 to High(Magnification) do begin
         Magnification[i+1] := Magnification[i] + Max(Round(Magnification[i]*0.25),1) ;
         end ;
     iZoom := 0 ;

     // Live mode binning
     cbLiveBin.Clear ;
     cbLiveBin.Items.AddObject('Live Bin 4x4',TObject(4));
     cbLiveBin.Items.AddObject('Live Bin 2x2',TObject(2));
     cbLiveBin.Items.AddObject('Live Bin 1x1',TObject(1));
     cbLiveBin.ItemIndex := 0 ;
     LiveBinSelected := 0 ;

     cbCaptureMode.Clear ;
     cbCaptureMode.Items.AddObject('Standard (1X1)',TObject(1));
     cbCaptureMode.Items.AddObject('High Res. (2X2)',TObject(4));
     cbCaptureMode.Items.AddObject('High Res. (3X3)',TObject(9));
     cbCaptureMode.ItemIndex := 0 ;
     NumPixelShiftFrames := Round(Integer(cbCaptureMode.Items.Objects[cbCaptureMode.ItemIndex])) ;

     // Imaging mode
     ckAcquireZStack.Checked := False ;
     ZStackGrp.Visible := False ;

     // Intensity display palette
     cbPalette.Clear ;
     cbPalette.Items.AddObject(' Grey scale', TObject(palGrey)) ;
//     cbPalette.Items.AddObject(' False colour', TObject(palFalseColor)) ;
     cbPalette.Items.AddObject(' Red scale', TObject(palRed)) ;
     cbPalette.Items.AddObject(' Green scale', TObject(palGreen)) ;
     cbPalette.Items.AddObject(' Blue scale', TObject(palBlue)) ;
     cbPalette.ItemIndex := cbPalette.Items.IndexOfObject(TObject(MainFrm.PaletteType)) ;

     edDisplayIntensityRange.LoLimit := 0 ;
     edDisplayIntensityRange.HiLimit := Cam1.GreyLevelMax ;

     bFullScale.Click ;

     // Save image file dialog
     SaveDialog.InitialDir := '' ;
     SaveDialog.Title := 'Save Image ' ;
     SaveDialog.options := [ofHideReadOnly,ofPathMustExist] ;
     SaveDialog.DefaultExt := '.tif' ;
     SaveDialog.Filter := ' TIFF (*.tif)|*.tif' ;
     SaveDialog.FilterIndex := 3 ;
     SaveDirectory := '' ;

     FrameWidth := Cam1.FrameWidthMax ;
     FrameHeight := Cam1.FrameHeightMax ;

     if BitMap <> Nil then BitMap.Free ;
     BitMap := TBitMap.Create ;
     BitMap.Width := FrameWidth ;
     BitMap.Height := FrameHeight ;
     BitMap.PixelFormat := pf24bit ;

     edNumPixelsPerZStep.Value := 1.0 ;
     edNumZSections.Value := 10.0 ;

     NumLenses := 1 ;
     LensSelected := 0 ;
     LensMagnification[0] := 4.0 ;
     LensName[0] := '4X' ;
     SetLensMenu ;

     RelayLensMagnification := 1.0 ;
     CameraPixelSize := 1.0 ;
     CalibrationBarSize := 100.0 ;

     MagnifiedCameraPixelSize := CameraPixelSize /
                                 Max(RelayLensMagnification*LensMagnification[LensSelected],1E-3) ;

     // Image-J program path
     ImageJPath := 'C:\ImageJ\imagej.exe';

     ProgDirectory := ExtractFilePath(ParamStr(0)) ;

     // Create settings directory path
     SettingsDirectory := GetSpecialFolder(CSIDL_COMMON_DOCUMENTS) + '\MesoCam\';
     if not SysUtils.DirectoryExists(SettingsDirectory) then
        begin
        if not SysUtils.ForceDirectories(SettingsDirectory) then
           ShowMessage( 'Unable to create settings folder' + SettingsDirectory) ;
        end ;

     // Folder to hold mesocam.raw file
     RawImagesFileName := SettingsDirectory + 'mesocam.raw' ;
     RawImagesFileName := ANSIReplaceStr(  RawImagesFileName, '\\', '\');

     // Load last used settings
     INIFileName := SettingsDirectory + 'mesocam settings.xml' ;
     LoadSettingsFromXMLFile( INIFileName ) ;

     // Help file
     Application.HelpFile := ProgDirectory + 'mesocam.chm';

     Cam1.OpenCamera(CameraType);
     GreyLo := 0 ;
     GreyLevelMax := Cam1.GreyLevelMax ;
     GreyHi := GreyLevelMax ;

     // Set camera gain list
     Cam1.GetCameraGainList( cbCameraGain.Items );
     cbCameraGain.ItemIndex := CameraGainIndex ;

     // Open Z stage
     ZStage.Open ;

     // Open light source
     Lightsource.Open ;

     // Load first image from existing raw images file
     scZSection.Position := 0 ;
     scTSection.Position := 0 ;
     Page.TabIndex := 0 ;
     if NumImagesInRawFile > 0 then RawImageAvailable := True
                               else RawImageAvailable := False ;
     LoadRawImage( RawImagesFileName,scZSection.Position,scTSection.Position,Page.TabIndex) ;
     ShowCapturedImage := RawImageAvailable ;

     UpdateDisplay := False ;
//     SnapStartAt := 0 ;
//     LastSnapStartedAt := 0 ;
     ScanningInProgress := False ;

     SetImagePanels ;

     // Indicate selected frame type selected for contrast update
//     DisplayGrp.Caption := ' Display Contrast ' ;
     SetDisplayIntensityRange( GreyLo, GreyHi ) ;
     // Update display look up tables
     UpdateLUT( GreyLevelMax );

    MouseUpCursor := crCross ;

    SetScanZoomToFullField ;

    // Initialise digital outputs
//    for iDev := 1 to LabIO.NumDevices do begin
//        LabIO.WriteToDigitalOutPutPort( iDev, LabIO.DigOutState[iDev] ) ;
//        end;

     Timer.Enabled := True ;
     UpdateDisplay := True ;
     bStopImage.Enabled := False ;
     image0.ControlStyle := image0.ControlStyle + [csOpaque] ;
     tbChan0.ControlStyle := tbChan0.ControlStyle + [csOpaque] ;
     image1.ControlStyle := image1.ControlStyle + [csOpaque] ;
     tbChan1.ControlStyle := tbChan1.ControlStyle + [csOpaque] ;
     image2.ControlStyle := image2.ControlStyle + [csOpaque] ;
     tbChan2.ControlStyle := tbChan2.ControlStyle + [csOpaque] ;
     image3.ControlStyle := image3.ControlStyle + [csOpaque] ;
     tbChan3.ControlStyle := tbChan3.ControlStyle + [csOpaque] ;

     lbreadout.ControlStyle := lbreadout.ControlStyle + [csOpaque] ;

     Left := 10 ;
     Top := 10 ;
     Width := Screen.Width - 10 - Left ;
     Height := Screen.Height - 50 - Top ;

     IgnorePanelControls := False ;

     // Request a form resize
     ResizeImage := True ;

     end;

procedure TMainFrm.ClearImageBuffers ;
// ------------------
// Free image buffers
// ------------------
begin

  if pLiveImageBuf <> Nil then begin
     FreeMem(pLiveImageBuf) ;
     pLiveImageBuf := Nil ;
  end;

  if pImageBuf <> Nil then begin
     FreeMem(pImageBuf) ;
     pImageBuf := Nil ;
  end;

  pDisplayBuf := Nil ;

end;


procedure TMainFrm.SetLensMenu ;
// ----------------------------------
// Update lens menu and selected lens
// ----------------------------------
var
  i: Integer;
begin
    cbLens.Clear ;
    for i := 0 to NumLenses-1 do cbLens.Items.Add( LensName[i] ) ;
    LensSelected := Min(Max(LensSelected,0),NumLenses-1); ;
    cbLens.ItemIndex := LensSelected ;

    // Update magnified pixel size
    MagnifiedCameraPixelSize := CameraPixelSize /
                                 Max(RelayLensMagnification*LensMagnification[LensSelected],1E-3) ;

    end;


procedure TMainFrm.SetScanZoomToFullField ;
// ---------------------------
// Set scan zoom to full field
// ---------------------------
begin

     SelectedRect.Left := 0 ;
     SelectedRect.Top := 0 ;
     SelectedRect.Right := 1.0 ;
     SelectedRect.Bottom := 1.0 ;

     CCDRegion.Left := 0.0 ;
     CCDRegion.Top := 0.0 ;
     CCDRegion.Right := 1.0 ;
     CCDRegion.Bottom := 1.0 ;
     CCDRegion.Width := 1.0 ;
     CCDRegion.Height := 1.0 ;

     end ;


procedure TMainFrm.Image0MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
// -------------------
// Mouse down on image
// -------------------
begin

     // Save mouse position when button pressed
     CursorPos.X := X ;
     CursorPos.Y := Y ;

     // Set mouse down flag
     MouseDown := True ;
     MouseDownAt.X := X ;
     MouseDownAt.Y := Y ;
     TopLeftDown.X := Round(XLeft*FrameWidth) ;
     TopLeftDown.Y := Round(YTop*FrameHeight) ;

     MouseUpCursor := Image0.Cursor ;
     if (Image0.Cursor = crCross) {and (not ROIMode)} then Image0.Cursor := crHandPoint ;

     Image0.Cursor := crSizeAll ;

     if not ROIMode then Screen.Cursor := crSizeAll ;

     UpdateDisplay := True ;

     end;


procedure TMainFrm.Image0MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
// ----------------------
// Mouse moved over image
// ----------------------
const
    EdgeSize = 5 ;
var
    i : Integer ;
    XRight,YBottom : Double ;
    XShift,YShift,XImage,YImage : Integer ;
begin

     if pDisplayBuf = Nil then Exit ;

     // Add magnification and limit bitmap to window
     ScaleToBM := (BitMap.Width*Magnification[iZoom]) / Max(FrameWidth,1) ;

     XImage := Round(X/ScaleToBM) + Round(XLeft*FrameWidth) ;
     YImage := Round(Y/ScaleToBM) + Round(YTop*FrameHeight) ;
     i := YImage*FrameWidth + XImage ;

     PixelsToMicronsX := Cam1.BinFactor*MagnifiedCameraPixelSize/sqrt(Cam1.NumPixelShiftFrames) ;
     PixelsToMicronsY := PixelsToMicronsX ;

     if (i > 0) and (i < FrameWidth*FrameHeight) then
        begin
        CursorReadoutText := format('X=%.6g um, Y=%.6g um, I=%d',
                             [XImage*PixelsToMicronsX,
                              YImage*PixelsToMicronsY,
                              pDisplayBuf[i]]) ;
        UpdateDisplay := True ;
        end ;

     if not MouseDown then
        begin
        // Indicate if cursor is over edge of zoom selection rectangle
        SelectedEdge.Left := 0 ;
        SelectedEdge.Right := 0 ;
        SelectedEdge.Top := 0 ;
        SelectedEdge.Bottom := 0 ;
        if (Abs(X - SelectedRectBM.Left) < EdgeSize) and
           (Y >= SelectedRectBM.Top) and
           (Y <= SelectedRectBM.Bottom) then SelectedEdge.Left := 1 ;
        if (Abs(X - SelectedRectBM.Right) < EdgeSize) and
           (Y >= SelectedRectBM.Top) and
           (Y <= SelectedRectBM.Bottom) then SelectedEdge.Right := 1 ;
        if (Abs(Y - SelectedRectBM.Top) < EdgeSize) and
           (X >= SelectedRectBM.Left) and
           (X <= SelectedRectBM.Right) then SelectedEdge.Top := 1 ;
        if (Abs(Y - SelectedRectBM.Bottom) < EdgeSize) and
           (X >= SelectedRectBM.Left) and
           (X <= SelectedRectBM.Right) then SelectedEdge.Bottom := 1 ;
        if (SelectedEdge.Left = 1) and (SelectedEdge.Top = 1) then Image0.Cursor := crSizeNWSE
        else if (SelectedEdge.Left = 1) and (SelectedEdge.Bottom = 1) then Image0.Cursor := crSizeNESW
        else if (SelectedEdge.Right = 1) and (SelectedEdge.Top = 1) then Image0.Cursor := crSizeNESW
        else if (SelectedEdge.Right = 1) and (SelectedEdge.Bottom = 1) then Image0.Cursor := crSizeNWSE
        else if SelectedEdge.Left = 1 then Image0.Cursor := crSizeWE
        else if SelectedEdge.Right = 1 then Image0.Cursor := crSizeWE
        else if SelectedEdge.Top = 1 then Image0.Cursor := crSizeNS
        else if SelectedEdge.Bottom = 1 then Image0.Cursor := crSizeNS
        else Image0.Cursor := crCross ;
        if Image0.Cursor <>  crCross then ROIMode := True
                                     else ROIMode := False ;
        CursorPos.X := X ;
        CursorPos.Y := Y ;
        end
     else
        begin

        XShift := X - CursorPos.X ;
        CursorPos.X := X ;
        YShift := Y - CursorPos.Y ;
        CursorPos.Y := Y ;
        if (Abs(XShift) >= 2) or (Abs(YShift) >= 2) then
           begin
  //         Image0.Cursor := crDrag ;
             UpdateDisplay := True ;
           end;
        if SelectedEdge.Left = 1 then
           begin
           // Move left edge
           SelectedRectBM.Left := Max(SelectedRectBM.Left + XShift,0);
           SelectedRectBM.Left := Min(SelectedRectBM.Left,Min(BitMap.Width-1,SelectedRectBM.Right-1)) ;
           SelectedRect.Left := (SelectedRectBM.Left/ScaleToBM)/FrameWidth + XLeft ;
           end ;
        if SelectedEdge.Right = 1 then
           begin
           // Move right edge
           SelectedRectBM.Right := Max(SelectedRectBM.Right + XShift,Max(0,SelectedRectBM.Left));
           SelectedRectBM.Right := Min(SelectedRectBM.Right,BitMap.Width-1) ;
           SelectedRect.Right := (SelectedRectBM.Right/ScaleToBM)/FrameWidth + XLeft ;
           end;
        if SelectedEdge.Top = 1 then
           begin
           // Move top edge
           SelectedRectBM.Top := Max(SelectedRectBM.Top + YShift,0);
           SelectedRectBM.Top := Min(SelectedRectBM.Top,Min(BitMap.Height-1,SelectedRectBM.Bottom-1)) ;
           SelectedRect.Top := ((SelectedRectBM.Top/ScaleToBM))/FrameHeight + YTop ;
           end;

        if SelectedEdge.Bottom = 1 then
           begin
           // Move bottom edge
           SelectedRectBM.Bottom := Max(SelectedRectBM.Bottom + YShift,SelectedRectBM.Top+1);
           SelectedRectBM.Bottom := Min(SelectedRectBM.Bottom,BitMap.Height-1) ;
           SelectedRect.Bottom := ((SelectedRectBM.Bottom/ScaleToBM))/FrameHeight + YTop ;
           end;


        if (SelectedEdge.Left = 0) or
           (SelectedEdge.Right = 0) or
           (SelectedEdge.Top = 0 ) or
           (SelectedEdge.Bottom = 0) then
            begin
            // Move display window
            XLeft := XLeft*FrameWidth ;
            YTop := YTop*FrameHeight ;
            XLeft := TopLeftDown.X - Round((X - MouseDownAt.X)/ScaleToBM) ;
            XRight := Min(XLeft + Round(Bitmap.Width/ScaleToBM),FrameWidth) ;
            XLeft := Max( XRight - Round(Bitmap.Width/ScaleToBM), 0 ) ;
            YTop := TopLeftDown.Y - Round((Y - MouseDownAt.Y)/ScaleToBM) ;
            YBottom := Min(YTop + Round(Bitmap.Height/ScaleToBM),FrameHeight) ;
            YTop := Max( YBottom - Round(Bitmap.Height/ScaleToBM),0) ;
            XLeft := XLeft/FrameWidth ;
            YTop := YTop/FrameHeight ;
            end;
         end ;

     end ;


procedure TMainFrm.FixRectangle( var Rect : TRect ) ;
// -----------------------------------------------------
// Ensure top/left is above/to the right of bottom/right
// -----------------------------------------------------
var
    RTemp : TRect ;
begin

    RTemp := Rect ;
    Rect.Left := Min(RTemp.Left,RTemp.Right) ;
    Rect.Right := Max(RTemp.Left,RTemp.Right) ;
    Rect.Top := Min(RTemp.Top,RTemp.Bottom) ;
    Rect.Bottom := Max(RTemp.Top,RTemp.Bottom) ;

    end;


procedure TMainFrm.Image0MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
// -------------------
// Mouse up on image
// -------------------
var
   NewWidth,NewHeight,MagnificationOld : Integer ;
begin

    if not ROIMode and
       (Abs(CursorPos.X - MouseDownAt.X) < 2) and
       (Abs(CursorPos.Y - MouseDownAt.Y) < 2) then
       begin
       MagnificationOld := Magnification[iZoom] ;
       if Button = mbLeft then iZoom := Min(iZoom + 1,High(Magnification))
                          else iZoom := Max(iZoom - 1,0);

       // Add magnification and limit bitmap to window
       ScaleToBM := (BitMap.Width*Magnification[iZoom]) / Max(FrameWidth,1) ;

       NewWidth := Round(BitMap.Width*(MagnificationOld/Magnification[iZoom])) ;
       NewHeight := Round(BitMap.Height*(MagnificationOld/Magnification[iZoom])) ;

       XLeft := XLeft*FrameWidth ;
       YTop := YTop*FrameHeight ;
       XLeft := Max(XLeft + Round((CursorPos.X-(NewWidth div 2))/ScaleToBM),0);
       XLeft := Min(XLeft,FrameWidth - Round(NewWidth/ScaleToBM)) ;
       YTop := Max(YTop + Round((CursorPos.Y-(NewHeight div 2))/ScaleToBM),0);
       YTop := Min(YTop,FrameHeight - Round(NewHeight/ScaleToBM)) ;
       XLeft := XLeft/FrameWidth ;
       YTop := YTop/FrameHeight ;

       Resize ;
       UpdateDisplay := True ;
       end;

     MouseDown := False ;

     ROIMode := False ;                   // Turn ROI mode off
     FixRectangle(SelectedRectBM);

     // Screen cursor restored to default
     Image0.Cursor := crCross ;
     Screen.Cursor := crDefault ;
     UpdateDisplay := True ;

end;


procedure TMainFrm.SetImagePanels ;
// -------------------------------------------
// Set size and number of image display panels
// -------------------------------------------
const
    MarginPixels = 16 ;
var
    HeightWidthRatio : Double ;
    i,TabIndex,iPanel : Integer ;

begin

     DisplayMaxWidth := tbChan0.ClientWidth - Image0.Left - 5 ;
     DisplayMaxHeight := tbChan0.ClientHeight
                         - Image0.Top - 5 - ZSectionPanel.Height ;

     if BitMap <> Nil then BitMap.Free ;
     BitMap := TBitMap.Create ;
     BitMap.PixelFormat := pf24bit ;

     // Scale bitmap to fit into window
     BitMap.Width := DisplayMaxWidth ;
     HeightWidthRatio := FrameHeight/Max(FrameWidth,1) ;
     BitMap.Height := Round(BitMap.Width*HeightWidthRatio) ;
     if BitMap.Height > DisplayMaxHeight then
        begin
        BitMap.Height := DisplayMaxHeight ;
        BitMap.Width := Round(BitMap.Height/HeightWidthRatio) ;
        BitMap.Width := Min(BitMap.Width,DisplayMaxWidth) ;
        end;

     // Add magnification and limit bitmap to window
     ScaleToBM := (BitMap.Width*Magnification[iZoom]) / Max(FrameWidth,1) ;
     BitMap.Width := Min(BitMap.Width*Magnification[iZoom],DisplayMaxWidth) ;
     BitMap.Height := Min(BitMap.Height*Magnification[iZoom],DisplayMaxHeight) ;

     // Create image pointer array of images on panels
     Images[0] := Image0 ;
     Images[1] := Image1 ;
     Images[2] := Image2 ;
     Images[3] := Image3 ;

     for i := 0 to High(Images) do
        begin
        Images[i].Width := BitMap.Width ;
        Images[i].Height := BitMap.Height ;
        Images[i].Canvas.Pen.Color := clWhite ;
        Images[i].Canvas.Brush.Style := bsClear ;
        Images[i].Canvas.Font.Color := clWhite ;
        Images[i].Canvas.TextFlags := 0 ;
        Images[i].Canvas.Pen.Mode := pmXOR ;
        Images[i].Canvas.Font.Name := 'Arial' ;
        Images[i].Canvas.Font.Size := 12 ;
        Images[i].Canvas.Font.Color := clBlue ;
        end ;

     // Assign image panel captions
     TabIndex := Page.TabIndex ;
     iPanel := 0 ;
     tbChan0.Caption := '' ;
     tbChan1.TabVisible := False ;
     tbChan2.TabVisible := False ;
     tbChan3.TabVisible := False ;

     for i := 0 to High(LightSource.Active) do if LightSource.Active[i] then
         begin
         case iPanel of
              0 : begin
                  tbChan0.Caption := tbChan0.Caption + LightSource.Names[i] + ' ';
                  PanelName[iPanel] := tbChan0.Caption ;
                  end;
              1 : begin
                  tbChan1.Caption := LightSource.Names[i] ;
                  PanelName[iPanel] := tbChan1.Caption ;
                  tbChan1.TabVisible := True ;
                  end;
              2 : begin
                  tbChan2.Caption := LightSource.Names[i] ;
                  PanelName[iPanel] := tbChan2.Caption ;
                  tbChan2.TabVisible := True ;
                  end ;
              3 : begin
                  tbChan3.Caption := LightSource.Names[i] ;
                  PanelName[iPanel] := tbChan3.Caption ;
                  tbChan3.TabVisible := True ;
                  end ;
              end;
         if ShowCapturedImage and ckSeparateLightSources.checked then Inc(iPanel) ;
         end;
     Page.TabIndex := TabIndex ;
//     NumPanels := Max(NumPanels,1);
end ;


procedure TMainFrm.SetDisplayIntensityRange(
          LoValue : Integer ;
          HiValue : Integer
          ) ;
// --------------------------------------
// Set display contrast range and sliders
// --------------------------------------
begin
     edDisplayIntensityRange.LoLimit := 0.0  ;
     edDisplayIntensityRange.HiLimit := GreyLevelMax  ;
     edDisplayIntensityRange.LoValue := LoValue  ;
     edDisplayIntensityRange.HiValue := HiValue  ;
     tbBrightness.Max := GreyLevelMax ;
     tbContrast.Max := GreyLevelMax ;
     tbBrightness.Position := tbBrightness.Max - (LoValue + HiValue) div 2 ;
     tbContrast.Position := tbContrast.Max - Abs(HiValue - LoValue) ;
end ;


procedure TMainFrm.FormClose(Sender: TObject; var Action: TCloseAction);
// ------------
// Stop program
// ------------
begin

     // Close Z stage
     ZStage.Close ;
     // Close NI interface
     LabIO.Close ;
     // Close camera
     Cam1.CloseCamera ;

     if pLiveImageBuf <> Nil then FreeMem(pLiveImageBuf) ;
     if pImageBuf <> Nil then FreeMem(pImageBuf) ;

     SaveSettingsToXMLFile( INIFileName ) ;

end;


procedure TMainFrm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
// ----------------------------------------
// Warn user that program is about to close
// ----------------------------------------
begin
    if MessageDlg( 'Exit Program! Are you Sure? ',
       mtConfirmation,[mbYes,mbNo], 0 ) = mrYes then CanClose := True
                                                else CanClose := False ;
end;

procedure TMainFrm.DisplayROI(
          BitMap : TBitmap
          ) ;
// ------------------------------------------------------
// Display selected scanning region in full field of view
// ------------------------------------------------------
var
  PaletteType : TPaletteType ;
  PenColor : Integer ;
  Y : Integer ;
begin

     // Set ROI colour
     PaletteType := TPaletteType(cbPalette.Items.Objects[cbPalette.ItemIndex]) ;
     case PaletteType of
          palGrey : PenColor := clRed ;
          else PenColor := clWhite ;
     end;

     Bitmap.Canvas.Pen.Color := PenColor ;
     Bitmap.Canvas.Pen.Width := 2 ;
     Bitmap.Canvas.Brush.Style := bsClear ;
     Bitmap.Canvas.Font.Color := PenColor ;

     SelectedRectBM.Left := Round((SelectedRect.Left-XLeft)*FrameWidth*ScaleToBM) ;
     SelectedRectBM.Right := Round((SelectedRect.Right - XLeft)*FrameWidth*ScaleToBM) ;
     SelectedRectBM.Top := Round((SelectedRect.Top - YTop)*FrameHeight*ScaleToBM) ;
     SelectedRectBM.Bottom := Round((SelectedRect.Bottom - YTop)*FrameHeight*ScaleToBM) ;

     // Display zomm area selection rectangle
     Bitmap.Canvas.Rectangle(SelectedRectBM);

     // Display square corner and mid-point tags
     DisplaySquare( SelectedRectBM.Left, SelectedRectBM.Top ) ;
     DisplaySquare( (SelectedRectBM.Left + SelectedRectBM.Right) div 2, SelectedRectBM.Top ) ;
     DisplaySquare( SelectedRectBM.Right, SelectedRectBM.Top ) ;
     DisplaySquare( SelectedRectBM.Left, (SelectedRectBM.Top + SelectedRectBM.Bottom) div 2) ;
     DisplaySquare( SelectedRectBM.Right, (SelectedRectBM.Top + SelectedRectBM.Bottom) div 2) ;
     DisplaySquare( SelectedRectBM.Left, SelectedRectBM.Bottom ) ;
     DisplaySquare( (SelectedRectBM.Left + SelectedRectBM.Right) div 2, SelectedRectBM.Bottom ) ;
     DisplaySquare( SelectedRectBM.Right, SelectedRectBM.Bottom ) ;

     Bitmap.Canvas.Pen.Color := clRed ;
     Y := (SelectedRectBM.Top + SelectedRectBM.Bottom) div 2 ;
     Bitmap.Canvas.Pen.Color := clWhite ;

end ;


procedure TMainFrm.DisplaySquare(
          X : Integer ;
          Y : Integer ) ;
var
    Square : TRect ;
begin
     Square.Left := X - 4 ;
     Square.Right := X + 4 ;
     Square.Top := Y - 4 ;
     Square.Bottom := Y + 4 ;
     //Bitmap.Canvas.Pen.Color := clwhite ;
     Bitmap.Canvas.Brush.Style := bsSolid ;
     Bitmap.Canvas.Rectangle(Square);

end ;


procedure TMainFrm.DisplayCalibrationBar(
          X : Integer ;
          Y : Integer ) ;
// --------------------------------
// Display calibration bar on image
// --------------------------------
Const
    TickHeight = 10 ;
var
    PixelsToMicrons : double ;
    X1,BarWidth : Integer ;
begin

     PixelsToMicrons := Cam1.BinFactor*MagnifiedCameraPixelSize/sqrt(Cam1.NumPixelShiftFrames) ;
     ScaleToBM := (BitMap.Width*Magnification[iZoom]) / Max(FrameWidth,1) ;
     BarWidth := Round( (CalibrationBarSize/PixelsToMicrons)*ScaleToBM ) ;

     Bitmap.Canvas.Pen.Color := clwhite ;
     Bitmap.Canvas.Brush.Style := bsClear ;
     Bitmap.Canvas.Pen.Width := 2 ;
     Bitmap.Canvas.MoveTo( X, Y - TickHeight ) ;
     Bitmap.Canvas.LineTo(X, Y + TickHeight ) ;
     Bitmap.Canvas.MoveTo( X, Y ) ;
     X1 := X + BarWidth ;
     Bitmap.Canvas.LineTo( X1, Y  ) ;
     Bitmap.Canvas.MoveTo( X1, Y - TickHeight ) ;
     Bitmap.Canvas.LineTo( X1, Y + TickHeight ) ;

     Bitmap.Canvas.Font.Color := clWhite ;
     Bitmap.Canvas.Font.Size := 10 ;
     Bitmap.Canvas.TextOut( X, Y + TickHeight + 1, format('%.3g um',[CalibrationBarSize]));

end ;


procedure TMainFrm.DisplayCursorReadout ;
// ----------------------------------------
// Display X,Y,intensity at cursor position
// ----------------------------------------
Const
    TickHeight = 10 ;
begin


     Bitmap.Canvas.Pen.Color := clwhite ;
     Bitmap.Canvas.Brush.Style := bsClear ;
     Bitmap.Canvas.Pen.Width := 2 ;
     Bitmap.Canvas.Font.Color := clWhite ;
     Bitmap.Canvas.Font.Size := 12 ;
     if CursorReadoutText <> '' then Bitmap.Canvas.TextOut( 0,0, CursorReadoutText );

end ;

procedure TMainFrm.UpdateImage ;
// --------------
// Display image
// --------------
type
  TRGBTripleArray = ARRAY[Word] of TRGBTriple;
  pRGBTripleArray = ^TRGBTripleArray;
var
    Ybm,Xbm,i,iLine,j,jRed,jGreen,jBlue : Integer ;
    pRGB : pRGBTripleArray ;    // Bitmap line buffer pointer
    X,Y,dX,dY : Double ;
    XMap,YMap : PIntArray ;
    YBottom,XRight : Double ;
    pImBuf : PIntArray ;
begin

    if ShowCameraImage then
       begin
       FrameWidth := Cam1.FrameWidth ;
       FrameHeight := Cam1.FrameHeight ;
       NumComponentsPerFrame := Cam1.NumComponentsPerFrame ;
       NumComponentsPerPixel := Cam1.NumComponentsPerPixel ;
       pImBuf := pLiveImageBuf ;
       pDisplayBuf := pLiveImageBuf ;
       end
    else
       begin
       pImBuf := pImageBuf ;
       pDisplayBuf := pImageBuf ;
       FrameWidth := HRFrameWidth ;
       FrameHeight := HRFrameHeight ;
       NumComponentsPerFrame := HRNumComponentsPerFrame ;
       NumComponentsPerPixel := HRNumComponentsPerPixel ;
       end;

    if pImBuf = Nil then Exit ;

    if ResizeImage then SetImagePanels ;
    ResizeImage := False ;

    ScaleToBM := (BitMap.Width*Magnification[iZoom]) / Max(FrameWidth,1) ;

    Images[Page.TabIndex].Width := BitMap.Width ;
    Images[Page.TabIndex].Height := BitMap.Height ;

    DisplayMaxWidth := tbCHan0.ClientWidth - Image0.Left - 5 ;
    DisplayMaxHeight := tbCHan0.ClientHeight - Image0.Top - 5  ;

    // Adjust left,top edge of displayed region of image when bottom,right is off image
    XLeft := XLeft*FrameWidth ;
    Ytop := YTop*FrameHeight ;
    XRight := Min(XLeft + Round(Bitmap.Width/ScaleToBM),FrameWidth) ;
    XLeft := Max( XRight - Round(Bitmap.Width/ScaleToBM), 0 ) ;
    YBottom := Min(YTop + Round(Bitmap.Height/ScaleToBM),FrameHeight) ;
    YTop := Max( YBottom - Round(Bitmap.Height/ScaleToBM),0) ;
    XLeft := XLeft/FrameWidth ;
    Ytop := YTop/FrameHeight ;

    //  X axis pixel mapping
    X := Round(XLeft*FrameWidth) ;
    dX := 1.0/ScaleToBM ;
    GetMem( XMap, BitMap.Width*4 ) ;
    for i := 0 to BitMap.Width-1 do
        begin
        XMap^[i] := Min(Max(Round(X),0),FrameWidth-1) ;
        X := X + dX ;
        end;

    // Y axis line mapping
    //ScaleToBM := (BitMap.Width*Magnification*FrameHeightScale) / FrameWidth ;
    GetMem( YMap, BitMap.Height*4 ) ;
    Y := Round(YTop*FrameHeight) ;
    dY := 1.0/ScaleToBM ;
    for i := 0 to BitMap.Height-1 do
        begin
        YMap^[i] := Min(Max(Round(Y),0),FrameHeight-1) ;
        Y := Y + dY ;
        end;

    jRed := Min(NumComponentsPerPixel-1,0) ;
    jGreen := Min(NumComponentsPerPixel-1,1) ;
    jBlue := Min(NumComponentsPerPixel-1,2) ;
    for Ybm := 0 to BitMap.Height-1 do
        begin
        // Copy line to bitmap
        pRGB := BitMap.ScanLine[Ybm] ;
        iLine := YMap^[Ybm]*FrameWidth ;
        for xBm := 0 to BitMap.Width-1 do
            begin
            j := (XMap^[xBm]+iLine)*NumComponentsPerPixel ;
            PRGB^[xBm].rgbtRed := RedLUT[Word(pImBuf^[j+jRed])] ;
            PRGB^[xBm].rgbtGreen := GreenLUT[Word(pImBuf^[j+jGreen])] ;
            PRGB^[xBm].rgbtBlue := BlueLUT[Word(pImBuf^[j+jBlue])] ;
            end ;
        end ;

     // Display ROI
     DisplayROI(BitMap) ;

     // Display calibration bar
     DisplayCalibrationBar(10, BitMap.Height - 50 ) ;

     // Display cursor readout text at top,left of image
     DisplayCursorReadout ;

     Images[Page.TabIndex].Picture.Assign(BitMap) ;
     Images[Page.TabIndex].Width := BitMap.Width ;
     Images[Page.TabIndex].Height := BitMap.Height ;

     // Show Z section slider bar
     scZSection.Max := Max( Min( NumZSectionsRequested, NumImagesInRawFile div NumPanels ) -1,0);
     lbZSection.Caption := format(' %d/%d',[scZSection.Position+1,scZSection.Max+1]) ;

     // Show T section slider bar
     lbTSection.Caption := format(' %d/%d',[scTSection.Position+1,scTSection.Max+1]) ;
     edSaveFileStatus.Top := ZSectionPanel.Top ;
     if TSectionPanel.Visible or ZSectionPanel.Visible then edSaveFileStatus.Left := ZSectionPanel.Left + ZSectionPanel.Width
                                                       else edSaveFileStatus.Left := ZSectionPanel.Left ;
     edSaveFileStatus.Width := Page.Width + Page.Left - edSaveFileStatus.Left ;

     FreeMem(XMap) ;
     FreeMem(YMap) ;

     end ;


procedure TMainFrm.UpdateLUT(
          GreyMax : Integer ) ;
// ----------------------------
// Create display look-up table
// ----------------------------
const
    DisplayGreyMax = 255 ;
var
    y : Integer ;
    i : Integer ;
    GreyScale : Single ;
begin

     if GreyHi <> GreyLo then
        GreyScale := DisplayGreyMax / (GreyHi - GreyLo)
     else GreyScale := 1.0 ;


     case TPaletteType(cbPalette.Items.Objects[cbPalette.ItemIndex]) of

          palGrey :
              begin
                 for i := 0 to High(RedLUT) do
                 begin
                 y := Min(Max(Round((i-GreyLo)*GreyScale),0),DisplayGreyMax) ;
                 RedLUT[i] := y ;
                 GreenLUT[i] := y ;
                 BlueLUT[i] := y ;
                 end ;
              end;

          palRed :
             begin
             for i := 0 to High(RedLUT) do
                 begin
                 y := Min(Max(Round((i-GreyLo)*GreyScale),0),DisplayGreyMax) ;
                 RedLUT[i] := y ;
                 GreenLUT[i] := 0 ;
                 BlueLUT[i] := 0 ;
                 end ;
             end;

          palGreen :
             begin
             for i := 0 to High(RedLUT) do
                 begin
                 y := Min(Max(Round((i-GreyLo)*GreyScale),0),DisplayGreyMax) ;
                 RedLUT[i] := 0 ;
                 GreenLUT[i] := y ;
                 BlueLUT[i] := 0 ;
                 end ;
             end;

          palBlue :
             begin
             for i := 0 to High(RedLUT) do
                 begin
                 y := Min(Max(Round((i-GreyLo)*GreyScale),0),DisplayGreyMax) ;
                 RedLUT[i] := 0 ;
                 GreenLUT[i] := 0 ;
                 BlueLUT[i] := y ;
                 end ;
             end;


     end ;

end ;


procedure TMainFrm.ValidatedEdit1KeyPress(Sender: TObject; var Key: Char);
// --------------------------------------
// Light source intensity setting changed
// --------------------------------------
begin
    if Key = #13 then
      begin
      GetLightSourcePanel(0, pnLightSource0, False ) ;
      GetLightSourcePanel(1, pnLightSource1, False ) ;
      GetLightSourcePanel(2, pnLightSource2, False ) ;
      GetLightSourcePanel(3, pnLightSource3, False ) ;
      GetLightSourcePanel(4, pnLightSource4, False ) ;
      GetLightSourcePanel(5, pnLightSource5, False ) ;
      GetLightSourcePanel(6, pnLightSource6, False ) ;
      GetLightSourcePanel(7, pnLightSource7, False ) ;
      UpdateLightSource := True ;
      end ;
end;


procedure TMainFrm.bLiveImageClick(Sender: TObject);
// -------------------------------------------
// Acquire and display live images from camera
// -------------------------------------------
begin
    bLiveImage.Enabled := False ;
    bCaptureImage.Enabled := True ;
    bStopImage.Enabled := True ;
    LiveImagingInProgress := True ;
    ImageCaptureInProgress := False ;
    ShowCapturedImage := False ;
    ShowCameraImage := True ;
//    StartImageCapture ;

    StopCamera ;
       StartCamera ;
end ;


procedure TMainFrm.bCaptureImageClick(Sender: TObject);
// -----------------------------------
// Capture currently selected CCD area
// -----------------------------------
begin
    bCaptureImage.Enabled := False ;
    if LiveImagingInProgress then
       begin
//       StopCamera ;
//       LiveImagingInProgress := False ;
       bStopImage.Click ;
       end;

    StartImageCapture ;

    bLiveImage.Enabled := True ;
    bStopImage.Enabled := True ;
    NumFramesRequired := 1 ;
    ShowCameraImage := True ;
    EdStatus.Text := 'Capture Image(s)' ;

end ;


procedure TMainFrm.bEnterCCDAreaClick(Sender: TObject);
// -----------------------------------------
// Set CCD readout region as % of total area
// -----------------------------------------
begin

     if LiveImagingInProgress then StopCamera ;

     SetCCDReadoutFrm := TSetCCDReadoutFrm.Create(Self) ;
     SetCCDReadoutFrm.Show ;
     SetCCDReadoutFrm.Left := 20 ;
     SetCCDReadoutFrm.Top := 20 ;
     bEnterCCDArea.Enabled := False ;

    if LiveImagingInProgress then
       begin
       StopCamera ;
       StartCamera ;
       end;

end;


procedure TMainFrm.StartImageCapture ;
// ----------------------------------
// Start new image capture sequence
// ----------------------------------
var
    ImageSaveTime : Double ;
    iT,i,iZ,iLS,iP,iPS,iPS_Start : Integer ;
begin

    if UnsavedRawImage and
       (MessageDlg( 'Current image(s) not saved! Do you want to overwrite?',mtWarning,[mbYes,mbNo], 0 ) = mrNo) then Exit ;

    // No. of pixel shifted frames per image
    NumPixelShiftFrames := Round(Integer(cbCaptureMode.Items.Objects[cbCaptureMode.ItemIndex])) ;

    // Light sources in use
    GetAllLightSourcePanels ;

    // Create list of light sources (wavelengths) in use
    NumLightSourcesInUse := 0 ;
    for iLS := 0 to High(LightSource.Active) do if LightSource.Active[iLS] then
        begin
        LightSourcesInUse[NumLightSourcesInUse] :=  iLS ;
        Inc(NumLightSourcesInUse) ;
        end;

    // Set no. of image panels depending on whether light source wavelengths are to be acquired simultaneously or separately
    if ckSeparateLightSources.Checked then NumPanels := NumLightSourcesInUse
                                      else NumPanels := 1 ;

     // Z sections
     ZSectionCounter := 0 ;
     if ckAcquireZStack.Checked then
        begin
        NumZSectionsRequested := Max(Round(edNumZsections.Value),1) ;
        scZSection.Max := 0 ;
        end
     else
        begin
        NumZSectionsRequested := 1 ;
        scZSection.Max := 0 ;
        end;

     TPointCounter := 0 ;
     NumTSectionsAvailable := 0 ;
     if ckAcquireTimeLapseSeries.Checked then
        begin
        NumTSectionsRequested := Max(Round(edNumTimeLapsePoints.Value),1)
        end
     else
       begin
       NumTSectionsRequested := 1 ;
       scTSection.Max := 0 ;
       end;
     NumImagesInRawFile := 0 ;
     scTSection.Max := NumTSectionsRequested - 1 ;
     scZSection.Max := NumZSectionsRequested - 1 ;

    // Create event list

    NumEvents := NumZSectionsRequested*NumTSectionsRequested*NumPixelShiftFrames*NumPanels*20 ;
    if EventList <> Nil then FreeMem(EventList) ;
    EventList := AllocMem( NumEvents*SizeOf(TEventListItem) ) ;

    NumEvents := 0 ;
    ImageSaveTime := 0.05 ;
    EventList[0].TSection := 0 ;
    EventList[0].ZSection := 0 ;
    EventCounter := 0 ;

    for iT := 0 to NumTSectionsRequested-1 do
        begin

        // Start Z stack capture sequence
        EventList[NumEvents].TSection := iT ;
        EventList[NumEvents].ZSection := 0 ;
        EventList[NumEvents].Delay := 0 ;
        EventList[NumEvents].EventType := evSequenceStart ;
        Inc(NumEvents) ;

        // Acquire Z sections

        for iZ := 0 to NumZSectionsRequested-1 do
            begin

            // Set Z stage position (except for first exposure
            EventList[NumEvents].TSection := iT ;
            EventList[NumEvents].ZSection := iZ ;
            if NumZSectionsRequested > 1 then
               begin
               EventList[NumEvents].Delay := Round(ZStage.ZStepTime*edMicronsPerZStep.Value*1000.0) ;
               EventList[NumEvents].EventType := evZStage ;
               EventList[NumEvents].ZPosition := ZStage.ZPosition + iZ*edMicronsPerZStep.Value ;
               Inc(NumEvents) ;
               end;

            for iP := 0 to NumPanels-1 do
                begin

                // Select wavelengths and turn light sources on
                EventList[NumEvents].TSection := iT ;
                EventList[NumEvents].ZSection := iZ ;
                EventList[NumEvents].Delay := Round(LightSource.ChangeTime*1000.0) ;
                EventList[NumEvents].EventType := evLightSource ;
                for i := 0 to MaxLightSources-1 do EventList[NumEvents].LightSources[i] := False ;
                if NumPanels = 1 then
                   begin
                   // All wavelengths on simultaneously
                   for iLS := 0 to NumLightSourcesInUse-1 do
                       EventList[NumEvents].LightSources[LightSourcesInUse[iLS]] := True ;
                   end
                else
                   begin
                   // Separate images for each wavelength
                   EventList[NumEvents].LightSources[LightSourcesInUse[iP]] := True ;
                   end;

                EventList[NumEvents].LightSourceOn := True ;
                Inc(NumEvents) ;

                //Set camera exposure
                if NumPixelShiftFrames = 1 then iPS_Start := 0
                                           else iPS_Start := -1 ;
                for iPS := iPS_Start to NumPixelShiftFrames-1 do
                    begin

                    // Set pixel shift counter for cameras using CCD pixel shift resolution enhancement
                    if NumPixelShiftFrames > 1 then
                       begin
                       EventList[NumEvents].TSection := iT ;
                       EventList[NumEvents].ZSection := iZ ;
                       EventList[NumEvents].Delay := 50 ;
                       EventList[NumEvents].EventType := evSetCCDPixelShift ;
                       EventList[NumEvents].CCDShiftCounter := iPS ;
                       Inc(NumEvents) ;
                       end;

                   // Start camera exposure
                   EventList[NumEvents].TSection := iT ;
                   EventList[NumEvents].ZSection := iZ ;
                   EventList[NumEvents].Delay :=  Round((edExposureTime.Value + ImageSaveTime)*1000.0) ;
                   EventList[NumEvents].EventType := evExposure ;
                   Inc(NumEvents) ;

                   // Wait for image
                   EventList[NumEvents].TSection := iT ;
                   EventList[NumEvents].ZSection := iZ ;
                   EventList[NumEvents].Delay := 50 ;
                   EventList[NumEvents].EventType := evImageWait ;
                   Inc(NumEvents) ;

                   end;

                end;

            end;

        // Return to starting Z position
        if NumZSectionsRequested > 1 then
           begin
           EventList[NumEvents].Delay := Round(ZStage.ZStepTime*1000.0) ;
           EventList[NumEvents].EventType := evZStage ;
           EventList[NumEvents].ZPosition := ZStage.ZPosition ;
           Inc(NumEvents) ;
           end;

        // Turn light sources off
        EventList[NumEvents].TSection := iT ;
        EventList[NumEvents].ZSection := 0 ;
        EventList[NumEvents].Delay := Round(LightSource.ChangeTime*1000.0) ;
        EventList[NumEvents].EventType := evLightSource ;
        EventList[NumEvents].LightSourceOn := False ;
        Inc(NumEvents) ;

        // End Z stack capture sequence
        EventList[NumEvents].TSection := iT ;
        EventList[NumEvents].ZSection := 0 ;
        EventList[NumEvents].Delay := Round(edTimeLapseInterval.Value*1000.0) ;
        if iT >= NumTSectionsRequested then EventList[NumEvents].Delay := 50 ;
        EventList[NumEvents].EventType := evSequenceEnd ;
        Inc(NumEvents) ;

        end;


    FixRectangle( SelectedRectBM ) ;

    // Image pixel to microns scaling factor
    PixelsToMicronsX := 1.0 ;
    PixelsToMicronsY := PixelsToMicronsX ;

    RawImageAvailable := False ;

    SetImagePanels ;

    StartCamera ;

    ImageCaptureInProgress := True ;
    LiveImagingInProgress := False ;

    // Time (ms) that image capture started at
    TImageCaptureStartedAt := timegettime ;
    TNextEvent := timegettime ;
    ImageCaptured := False ;

    end ;


procedure TMainFrm.tbBrightnessChange(Sender: TObject);
// -------------------------
// Brightness slider changed
// -------------------------
var
    HalfRange : Integer ;
begin

     HalfRange := Abs((GreyHi - GreyLo) div 2) ;
     GreyHi := GreyLevelMax - Min(tbBrightness.Position - HalfRange,GreyLevelMax) ;
     GreyLo := GreyLevelMax - Max(tbBrightness.Position + HalfRange,0) ;

     edDisplayIntensityRange.LoValue := GreyLo  ;
     edDisplayIntensityRange.HiValue := GreyHi  ;

     UpdateLUT( GreyLevelMax ) ;

end;


procedure TMainFrm.tbContrastChange(Sender: TObject);
// -------------------------
// Contrast slider changed
// -------------------------
var
    HalfRange : Integer ;
begin

     HalfRange := Max((tbContrast.Max - tbContrast.Position) div 2,1) ;
     GreyHi := tbBrightness.Max - Min(tbBrightness.Position - HalfRange,GreyLevelMax) ;
     GreyLo := tbBrightness.Max - Max(tbBrightness.Position + HalfRange,0) ;

     edDisplayIntensityRange.LoValue := GreyLo  ;
     edDisplayIntensityRange.HiValue := GreyHi  ;

     UpdateLUT( GreyLevelMax ) ;

     end;


procedure TMainFrm.StartCamera ;
// ---------------
// Scan image scan
// ---------------
var
    i : Integer ;
begin

    if Initialising then Exit ;

    // Stop A/D & D/A
    MemUsed := 0 ;

    Cam1.StopCapture ;

    LightSource.Update ;
    // Set CDD pixel shift stage to 0,0
    Cam1.CCDXShift := 0.0 ;
    Cam1.CCDYShift := 0.0 ;

    // Save current positoion of Z stage
    //ZStartingPosition := ZStage.ZPosition ;

    if not bLiveImage.Enabled then
       begin
       Cam1.BinFactor := Integer(cbLiveBin.Items.Objects[cbLiveBin.ItemIndex]) ;
       if (CCDRegion.Height < 0.5) {or (Cam1.ReadoutTime <= 0.1)} then Cam1.BinFactor := 1 ;

       Cam1.TriggerMode := camFreeRun ;
       Cam1.NumPixelShiftFrames := 1 ;
       end
    else
       begin
       Cam1.BinFactor := 1 ;
       Cam1.TriggerMode := CamExtTrigger ;
       Cam1.NumPixelShiftFrames := Integer(cbCaptureMode.Items.Objects[cbCaptureMode.ItemIndex]) ;
       NumPixelShiftFrames := Integer(cbCaptureMode.Items.Objects[cbCaptureMode.ItemIndex]) ;
       if NumPixelShiftFrames > 1 then Cam1.TriggerMode := CamExtTrigger
                                  else Cam1.TriggerMode := camFreeRun ;
       Cam1.TriggerMode := camFreeRun ;
       end;
    NumFramesRequired := Cam1.NumPixelShiftFrames ;

     // Set to full frame
    Cam1.SetCCDArea( Round(CCDRegion.Left*MainFrm.Cam1.FrameWidthMax),
                     Round(CCDRegion.Top*MainFrm.Cam1.FrameHeightMax),
                     Round(CCDRegion.Right*MainFrm.Cam1.FrameWidthMax)-1,
                     Round(CCDRegion.Bottom*MainFrm.Cam1.FrameHeightMax)-1);

    Cam1.FrameInterval := edExposureTime.Value / (Cam1.BinFactor*Cam1.BinFactor) ;
    Cam1.GetFrameBufferPointer( pFrameBuf ) ;
    Cam1.AmpGain := cbCameraGain.ItemIndex ;

    if true {(Cam1.NumComponentsPerFrame <> NumComponentsPerFrame) or (pLiveImageBuf = Nil)} then
       begin
       if pLiveImageBuf <> Nil then FreeMem(pLiveImageBuf);
       NumComponentsPerFrame := Cam1.NumComponentsPerFrame ;
       NumComponentsPerPixel := Cam1.NumComponentsPerPixel ;
       pLiveImageBuf := GetMemory(Cam1.NumComponentsPerFrame*SizeOf(Integer)) ;
       for i := 0 to Cam1.NumComponentsPerFrame-1 do pLiveImageBuf^[i] := 0 ;
       NumBitsPerPixel := Cam1.PixelDepth ;
       GreyLevelMax := Cam1.GreyLevelMax ;
       end;

    NumBitsPerPixel := Cam1.PixelDepth ;
    GreyLevelMax := Cam1.GreyLevelMax ;
//    nShifts := Round(sqrt(Cam1.NumPixelShiftFrames)) ;

    Cam1.NumFramesInBuffer := 18 ;
//    Cam1.TriggerMode := CamExtTrigger ;//camFreeRun ;

    Cam1.GetFrameBufferPointer( pFrameBuf ) ;

    if LiveImagingInProgress then
       begin
       LightSource.On := True ;
       LightSource.Update ;
       Cam1.StartCapture ;
       end;
//                             else Cam1.SnapImage ;

    FramePointer := 0 ;
    MostRecentFrame := -1 ;
    PreviousFrameCount := -1 ;
    LastFrameDisplayed := MostRecentFrame ;
    GetImageInProgress := false ;

//    bStopImage.Enabled := True ;

    TStart := TimeGetTime ;
    NumFramesAcquired := 0 ;

    // Initialise frame timeout variables
    LastFrameCount := 0 ;

    // CCDShiftCounter set to -1 for Vieworks pixel shift camera
    // to ensure that an extra frame is collected at start of
    // CCD shift sequence (and discarded) because first frame
    // in series has incorrect expsoure time
//    if Cam1.CameraType = IMAQ then CCDShiftCounter := -1
//                              else CCDShiftCounter := 0 ;

    UpdateDisplay := True ;
    ResizeImage := True ;

    outputdebugstring(pchar('Camera started'));

    end;


procedure TMainFrm.StopCamera ;
// ------------
// Stop camera
// ------------
begin
    Cam1.StopCapture ;
    end ;


procedure TMainFrm.bFullFrameClick(Sender: TObject);
// ------------------------------------
// Set frame capture area to full frame
// ------------------------------------
begin

    if LiveImagingInProgress then StopCamera ;

     bFullFrame.Enabled := False ;

     CCDRegion.Left := 0.0 ;
     CCDRegion.Top := 0.0 ;
     CCDRegion.Right := 1.0 ;
     CCDRegion.Bottom := 1.0 ;
     CCDRegion.Width := 1.0 ;
     CCDRegion.Height := 1.0 ;

     // Set to full frame
     MainFrm.Cam1.SetCCDArea( 0,
                              0,
                              Round(CCDRegion.Right*MainFrm.Cam1.FrameWidthMax)-1,
                              Round(CCDRegion.Bottom*MainFrm.Cam1.FrameHeightMax)-1);

     if LiveImagingInProgress then StartCamera ;
     bFullFrame.Enabled := True ;

     end;


procedure TMainFrm.bFullScaleClick(Sender: TObject);
// --------------------------------------------------------
// Set display grey scale t1o full intensity range of camera
// --------------------------------------------------------
begin

     edDisplayIntensityRange.LoValue := 0 ;
     GreyLo := Round(edDisplayIntensityRange.LoValue) ;
     edDisplayIntensityRange.HiValue := GreyLevelMax ;
     GreyHi := Round(edDisplayIntensityRange.HiValue) ;

     UpdateLUT( GreyLevelMax ) ;

     // Set intensity range and sliders
     SetDisplayIntensityRange( GreyLo, GreyHi ) ;

     UpdateDisplay := True ;
     end ;


procedure TMainFrm.edDisplayIntensityRangeKeyPress(Sender: TObject;
  var Key: Char);
// ------------------------------
// Update display intensity range
// ------------------------------
begin

     if key <> #13 then Exit ;

     if edDisplayIntensityRange.LoValue = edDisplayIntensityRange.HiValue then
        begin
        edDisplayIntensityRange.LoValue := edDisplayIntensityRange.LoValue - 1.0 ;
        edDisplayIntensityRange.HiValue := edDisplayIntensityRange.HiValue + 1.0 ;
        end ;

     GreyLo := Round(edDisplayIntensityRange.LoValue) ;
     GreyHi := Round(edDisplayIntensityRange.HiValue) ;

     UpdateLUT( GreyLevelMax ) ;

     // Set intensity range and sliders
     SetDisplayIntensityRange( GreyLo, GreyHi ) ;
     UpdateDisplay := True ;
     end;


procedure TMainFrm.edExposureTimeKeyPress(Sender: TObject; var Key: Char);
// ---------------------
// Exposure time changed
// ---------------------
begin
    if (Key = #13) and LiveImagingInProgress then
       begin
//       SnapStartAt := TimeGetTime ;
       StopCamera ;
       StartCamera ;
       end;

    end;

procedure TMainFrm.edGotoXPositionKeyPress(Sender: TObject; var Key: Char);
// ------------------------------
// Go to user entered X position
// ------------------------------
begin
    if Key = #13 then
       begin
       ZStage.MoveTo( edGoToXPosition.Value, ZStage.YPosition, ZStage.ZPosition ) ;
       end;
    end;


procedure TMainFrm.edGotoYPositionKeyPress(Sender: TObject; var Key: Char);
// ------------------------------
// Go to user entered Y position
// ------------------------------
begin
    if Key = #13 then
       begin
       ZStage.MoveTo( ZStage.XPosition, edGoToYPosition.Value, ZStage.ZPosition ) ;
       end;
end;


procedure TMainFrm.edGotoZPositionKeyPress(Sender: TObject; var Key: Char);
// ------------------------------
// Go to user entered Z position
// ------------------------------
begin
    if Key = #13 then
       begin
       ZStage.MoveTo( ZStage.XPosition, ZStage.YPosition, edGoToZPosition.Value  ) ;
       end;
end;


procedure TMainFrm.edMicronsPerZStepKeyPress(Sender: TObject; var Key: Char);
// -------------------------
// Microns per Z step changed
// -------------------------
var
     NumSubPixels : Double ;
begin
      if Key = #13 then
         begin
         NumSubPixels := Round(sqrt(NumPixelShiftFrames)) ;
         edNumPixelsPerZStep.Value := (edMicronsPerZStep.Value*NumSubPixels)/MagnifiedCameraPixelSize;
         end;
end;


procedure TMainFrm.edNumPixelsPerZStepKeyPress(Sender: TObject; var Key: Char);
// -------------------------
// Pixels per Z step changed
// -------------------------
var
     NumSubPixels : Double ;
begin
      if Key = #13 then
         begin
         NumSubPixels := Round(sqrt(NumPixelShiftFrames)) ;
         edMicronsPerZStep.Value := (edNumPixelsPerZStep.Value*MagnifiedCameraPixelSize)/NumSubPixels ;
         end;
end;


procedure TMainFrm.bGoToXPositionClick(Sender: TObject);
// -------------------------
// Go to specified X position
// --------------------------
begin
    ZStage.MoveTo( edGoToXPosition.Value, ZStage.YPosition,ZStage.ZPosition ) ;
end;


procedure TMainFrm.bGoToYPositionClick(Sender: TObject);
// -------------------------
// Go to specified Y position
// --------------------------
begin
    ZStage.MoveTo( ZStage.XPosition, edGoToYPosition.Value, ZStage.ZPosition ) ;
end;

procedure TMainFrm.bGotoZPositionClick(Sender: TObject);
// -------------------------
// Go to specified Z position
// --------------------------
begin
    ZStage.MoveTo( ZStage.XPosition,ZStage.YPosition,edGoToZPosition.Value ) ;
end;


procedure TMainFrm.bMaxContrastClick(Sender: TObject);
// -------------------------------------------------------------
// Request display intensity range to be set for maximum contrast
// -------------------------------------------------------------
begin

     CalculateMaxContrast ;

     // Set intensity range and sliders
     SetDisplayIntensityRange( GreyLo,GreyHi ) ;

     UpdateDisplay := True ;

end;


procedure TMainFrm.CalculateMaxContrast ;
// ---------------------------------------------------------
// Calculate and set display for maximum grey scale contrast
// ---------------------------------------------------------
const
    MaxPoints = 10000 ;
var
     i,NumPixels,iStep,nPoints : Integer ;
     z,zMean,zSD,zSum : Single ;
     iz,ZMin,ZMax,ZLo,ZHi,ZThreshold : Integer ;
     pImBuf : PIntArray ;
begin

    if ShowCameraImage then
       begin
       FrameWidth := Cam1.FrameWidth ;
       FrameHeight := Cam1.FrameHeight ;
       NumComponentsPerFrame := Cam1.NumComponentsPerFrame ;
       NumComponentsPerPixel := Cam1.NumComponentsPerPixel ;
       pImBuf := pLiveImageBuf ;
       end
    else
       begin
       PimBuf := pImageBuf ;
       FrameWidth := HRFrameWidth ;
       FrameHeight := HRFrameHeight ;
       NumComponentsPerFrame := HRNumComponentsPerFrame ;
       NumComponentsPerPixel := HRNumComponentsPerPixel ;
       end;

    if pImBuf = Nil then Exit ;


    NumPixels := FrameWidth*FrameHeight - 4 ;
//    FrameType := 0 ;
    if NumPixels < 2 then Exit ;

    iStep := Max(NumPixels div MaxPoints,1) ;

    if ckContrast6SDOnly.Checked then
       begin
       // Set contrast range to +/- 3 x standard deviation
       ZSum := 0.0 ;
       i := 0 ;
       nPoints := 0 ;
       repeat
          ZSum := ZSum + pImBuf^[i] ;
          i := i + iStep ;
          Inc(nPoints) ;
       until i >= NumPixels ;
       ZMean := ZSum / Max(nPoints,1) ;

       ZSum := 0.0 ;
       i := 0 ;
       repeat
          Z :=pImBuf^[i] ;
          ZSum := ZSum + (Z - ZMean)*(Z - ZMean) ;
          i := i + iStep ;
          Inc(nPoints) ;
       until i >= NumPixels ;
       ZSD := Sqrt( ZSum / Max(nPoints-1,0) ) ;

       ZLo := Max( Round(ZMean - 3*ZSD),0) ;
       ZHi := Min( Round(ZMean + 3*ZSD), GreyLevelMax );

       end
    else
       begin
       // Set contrast range to min-max
       ZMin := GreyLevelMax ;
       ZMax := 0 ;
       i := 0 ;
       repeat
          iz := pImBuf^[i] ;
          if iz < ZMin then ZMin := iz ;
          if iz > ZMax then ZMax := iz ;
          i := i + iStep ;
       until i >= NumPixels ;
       ZLo := ZMin ;
       ZHi := ZMax ;
       end ;

    // Update contrast
    ZThreshold := Max((GreyLevelMax div 50),2) ;
    if (not ckAutoOptimise.Checked) or
       (Abs(GreyLo- ZLo) > 10) then GreyLo := ZLo ;
    if (not ckAutoOptimise.Checked) or
       (Abs(GreyHi- ZHi) > 10) then GreyHi := ZHi ;

    // Ensure a non-zero LUT range
    if GreyLo = GreyHi then
       begin
       GreyLo := GreyLo - 1 ;
       GreyHi := GreyHi + 1 ;
       end ;

    UpdateLUT(GreyLevelMax) ;

end ;


procedure TMainFrm.PlotHistogram ;
// ---------------------------------------------------------
// Calculate and set display for maximum grey scale contrast
// ---------------------------------------------------------
const
    MaxPoints = 10000 ;
var
     i,ix,NumPixels,iStep,BinWidth : Integer ;
     XLo,XMid,XHi,YMax : single ;
begin

    if pDisplayBuf = Nil then Exit ;

    NumPixels := FrameWidth*FrameHeight - 4 ;

    if NumPixels < 2 then Exit ;

    iStep := Max(NumPixels div MaxPoints,1) ;

    BinWidth := (Cam1.GreyLevelMax+1) div MaxHistogramBins ;
    HistogramNumBins := Min(Cam1.GreyLevelMax div BinWidth,MaxHistogramBins) ;

    for i := 0 to HistogramNumBins-1 do  Histogram[i] := 0.0 ;
    i := 0 ;
    repeat
       ix := Max(Min(pDisplayBuf^[i] div BinWidth,HistogramNumBins-1),0) ;
       Histogram[ix] := Histogram[ix] + 1.0 ;
       i := i + iStep ;
       until i >= NumPixels ;

    YMax := 0.0 ;
    for i := 0 to HistogramNumBins-1 do
        begin
        if YMax < Histogram[i] then YMax := Histogram[i] ;
        end ;

    // Plot new Histogram }
    plHistogram.xAxisAutoRange := False ;
    plHistogram.xAxisMin := 0.0 ;
    plHistogram.xAxisMax := BinWidth*(HistogramNumBins+1) ;
    plHistogram.XAxisTick := plHistogram.xAxisMax ;
    plHistogram.XAxisLabel := '' ;
    plHistogram.yAxisAutoRange := False ;
    plHistogram.yAxisMin := 0.0 ;
    plHistogram.yAxisMax := YMax ;
    plHistogram.yAxisTick := YMax ;
    plHistogram.YAxisLabel := '' ;
    plHistogram.ScreenFontSize := 8 ;

    // Create Histogram plot
    plHistogram.CreateHistogram( 0 ) ;

    XLo := 0.0 ;
    for i := 0 to HistogramNumBins-1 do
        begin
        XHi := XLo + BinWidth ;
        XMid := XLo + BinWidth*0.5 ;
        plHistogram.AddBin( 0,XLo,XMid,XHi,Histogram[i]) ;
        XLo := XLo + BinWidth ;
        end ;


end ;


procedure TMainFrm.rbROIModeClick(Sender: TObject);
// -----------------
// ROI mode selected
// -----------------
begin
    UpdateDisplay := True ;
    end;


procedure TMainFrm.rbZoomModeClick(Sender: TObject);
// -----------------
// Zoom mode selected
// -----------------
begin
    UpdateDisplay := True ;
    end;


procedure TMainFrm.TimerTimer(Sender: TObject);
// -------------------------
// Regular timed operations
// --------------------------
var
    NumSubPixels : Integer ;
    FrameRate : Double ;
    s : string ;
    TNow : Cardinal ;
begin

    if TimerBusy then Exit ;

    TNow := TimeGetTime ;

    if ImageCaptureInProgress and (EventCounter < NumEvents) then
       begin

       if TNow > TNextEvent then
          begin
          case EventList[EventCounter].EventType of

              // Start of Z stack capture sequence
              evSequenceStart :
                begin
                TZStackStart := TNow ;
                TNextEvent := TNow ;
                Inc(EventCounter) ;
                end;

              // Light source event
              evLightSource :
                begin
                LightSource.Active := EventList[EventCounter].LightSources ;
                LightSource.On := EventList[EventCounter].LightSourceOn ;
                LightSource.Update ;
                SetImagePanels ;
                TNextEvent := TNow + EventList[EventCounter].Delay ;
                Inc(EventCounter) ;
                end;

              // Z stage event
              evZStage :
                begin
                ZStage.MoveTo( ZStage.XPosition, ZStage.YPosition, EventList[EventCounter].ZPosition );
                TNextEvent := TNow + EventList[EventCounter].Delay ;
                Inc(EventCounter) ;
                end;

              // Pixel shift event
              evSetCCDPixelShift :
                begin
                NumSubPixels := Round(sqrt(NumPixelShiftFrames)) ;
                CCDShiftCounter := EventList[EventCounter].CCDShiftCounter ;
                // Calculate fractional CCD shifts
                Cam1.CCDXShift := (Max(CCDShiftCounter,0) mod NumSubPixels)/NumSubPixels ;
                Cam1.CCDYShift := (Max(CCDShiftCounter,0) div NumSubPixels)/NumSubPixels ;

                TNextEvent := TNow + EventList[EventCounter].Delay ;
                Inc(EventCounter) ;
                end;

              // Acquire image
              evExposure :
                begin
                Cam1.SnapImage ;
                ImageCaptured := False ;
                TNextEvent := TNow + EventList[EventCounter].Delay ;
                Inc(EventCounter) ;
                end;

              // Wait for image
              evImageWait :
                begin
                if ImageCaptured then
                   begin
                   TNextEvent := TNow + EventList[EventCounter].Delay ;
                   Inc(EventCounter) ;
                   end;
                end;

              // End of Z stack sequence
              evSequenceEnd :
                begin
                TNextEvent := Max( TZStackStart + EventList[EventCounter].Delay, TNow) ;
                Inc(EventCounter) ;
                end;

              end;
          end;

       // Update status
       s := format('T:%d/%d',[EventList[EventCounter].TSection+1,NumTSectionsRequested]);
       if NumZSectionsRequested > 1 then
          s := s + format(' Z:%d/%d',[EventList[EventCounter].ZSection+1,NumZSectionsRequested]);
       if NumPixelShiftFrames > 1 then
          s := s + format(' PS:%d/%d',[Min(CCDShiftCounter+1,NumPixelShiftFrames),NumPixelShiftFrames]);
       s := s + format(' Imgs:%d',[NumImagesInRawFile]) ;
       s := s + format(' (%.1f s)',[Max((TNextEvent*0.001-TNow*0.001),0.0)]);
       edstatus.Text := s ;

       if EventCounter >= NumEvents then bStopImage.Click ;

       end;

        // Read images from camera
    if Cam1.CameraActive then Cam1.ReadCamera ;

    if Cam1.CameraActive and ImageCaptureInProgress then
       Begin
         // Update CCD XY stage position
         if Cam1.FrameCount >= 1 then
            begin

            // Stop camera
            Cam1.StopCapture ;

            // Copy image to display buffer
            CopyImageToDisplayBuf( Cam1.FrameCount-1 ) ;

            // Add image to interleaved buffer
            InterleaveToPixelShiftImage( Max(CCDShiftCounter,0) ) ;

            // Set next pixel shift steps
//            NumSubPixels := Round(sqrt(NumPixelShiftFrames)) ;
//            Inc(CCDShiftCounter) ;
            // Calculate fractional CCD shifts
 //           Cam1.CCDXShift := (Max(CCDShiftCounter,0) mod NumSubPixels)/NumSubPixels ;
 //           Cam1.CCDYShift := (Max(CCDShiftCounter,0) div NumSubPixels)/NumSubPixels ;
 //           outputdebugstring(Pchar(format('%d CCD X=%.3g Y=%.3g',[CCDShiftCounter,Cam1.CCDXShift,Cam1.CCDYShift])));

            if CCDShiftCounter >= (NumPixelShiftFrames-1) then
               begin
               // Save to raw image file
               Application.ProcessMessages ;
               Inc(NumImagesInRawFile) ;
               SaveRawImage( RawImagesFileName, NumImagesInRawFile-1 ) ;
               end;

            UpdateDisplay := True ;
            ImageCaptured := True ;
            end ;
       End;

    // Live imaging
    if Cam1.CameraActive and LiveImagingInProgress then
       begin
       // Find latest unfilled frame
       if Cam1.FrameCount > 0 then
          begin
          MostRecentFrame := (Cam1.FrameCount-1) mod Cam1.NumFramesInBuffer ;
          NumFramesAcquired := MostRecentFrame ;
          end;

       if MostRecentFrame <> LastFrameDisplayed then
          begin
          // Copy image to display buffer
          CopyImageToDisplayBuf( MostRecentFrame ) ;
          LastFrameDisplayed := MostRecentFrame ;
          UpdateDisplay := True ;
          end;

       // Update status
       if TimeGetTime <> TStart then FrameRate := (1000.0*Cam1.FrameCount) /(TimeGetTime-TStart)
                                else FrameRate := 0.0 ;
       edStatus.Text := format('Live: Frame %2d/%2d (%5.2f FPS)',
                        [Cam1.FrameCount mod Cam1.NumFramesInBuffer,Cam1.NumFramesInBuffer,FrameRate]);

       LastFrameCount := Cam1.FrameCount ;

       end ;


    if UpdateDisplay then
       begin ;
       // if auto contrast on
       if ckAutoOptimise.Checked then
          begin
          CalculateMaxContrast ;
          SetDisplayIntensityRange( GreyLo,GreyHi ) ;
          end;
       UpdateImage ;
       UpdateDisplay := False ;
       PlotHistogram ;
       end ;

    // Update lightsource panels if names have changed
    if LightSource.NamesChanged then
       begin
       Resize ;
       LightSource.NamesChanged := False ;
       end;

    // Update light source settings (if requested)
    if UpdateLightSource then
       begin
       LightSource.Update ;
       UpdateLightSource := False ;
       end;

    // Acquire and display current stage position
    edXYZPosition.Text := format('X=%.2f, Y=%.2f, Z=%.2f um',
                          [ZStage.XPosition,ZStage.YPosition,ZStage.ZPosition]) ;

    Image0.Cursor := Image0.Cursor ;
    TimerBusy := False ;

    end;


procedure TMainFrm.TrackBar1Change(Sender: TObject);
// --------------------------------------
// Light source track bar setting changed
// --------------------------------------
begin
    GetLightSourcePanel(0, pnLightSource0, True ) ;
    GetLightSourcePanel(1, pnLightSource1, True ) ;
    GetLightSourcePanel(2, pnLightSource2, True ) ;
    GetLightSourcePanel(3, pnLightSource3, True ) ;
    GetLightSourcePanel(4, pnLightSource4, True ) ;
    GetLightSourcePanel(5, pnLightSource5, True ) ;
    GetLightSourcePanel(6, pnLightSource6, True ) ;
    GetLightSourcePanel(7, pnLightSource7, True ) ;
    UpdateLightSource := True ;
    end;


procedure TMainFrm.CopyImageToDisplayBuf( iFrame : Integer ) ;
// -----------------------------------------------
// Copy image from camera buffer to display buffer
// -----------------------------------------------
var
    i,j : Integer ;
begin

       // Copy image from circular buffer into 32 bit display buffer
       j := iFrame*Cam1.NumComponentsPerFrame ;
       if Cam1.NumBytesPerPixel = 1 then
          begin
          for i := 0 to Cam1.NumComponentsPerFrame-1 do
              begin
              pLiveImageBuf^[i] := PByteArray(pFrameBuf)^[j] ;
              Inc(j) ;
              end ;
          end
       else
          begin
          for i := 0 to Cam1.NumComponentsPerFrame-1 do
              begin
              pLiveImageBuf^[i] := PWordArray(pFrameBuf)^[j] ;
              Inc(j) ;
              end ;
          end;
       end ;


procedure TMainFrm.InterleaveToPixelShiftImage(
          iShift : Integer
          ) ;
// --------------------------------------------------
// Interleave image into high resolution image buffer
// --------------------------------------------------
var
    i,nShifts,x,y,ifrom,ito,iComp : Integer ;
    pBuf : Pointer ;
    xshift : array[0..8] of Integer ;
    yshift : array[0..8] of Integer ;
    Scale : single ;
    Sum : double ;
begin

    if iShift >= NumPixelShiftFrames then Exit ;

    nShifts := Round(sqrt(NumPixelShiftFrames)) ;
    HRFrameWidth := Cam1.FrameWidth*nShifts ;
    HRFrameHeight := Cam1.FrameHeight*nShifts ;
    HRNumComponentsPerPixel := Cam1.NumComponentsPerPixel ;
    HRNumComponentsPerFrame := HRFrameWidth*HRFrameHeight*HRNumComponentsPerPixel ;

    // Create buffer on first image
    if iShift = 0 then
       begin
       if PImageBuf <> Nil then FreeMem(PImageBuf) ;
       PImageBuf := GetMemory( Int64(HRNumComponentsPerFrame)*SizeOf(Integer)) ;
       for i := 0 to HRNumComponentsPerFrame-1 do PImageBuf^[i] := 0 ;
       end;

    // Copy to display buffer
    case NumPixelShiftFrames of
          9 :
            begin
            xShift[0] := 2 ;
            yShift[0] := 0 ;
            xShift[1] := 1 ;
            yShift[1] := 0 ;
            xShift[2] := 0 ;
            yShift[2] := 0 ;

            xShift[3] := 2 ;
            yShift[3] := 1 ;
            xShift[4] := 1 ;
            yShift[4] := 1 ;
            xShift[5] := 0 ;
            yShift[5] := 1 ;

            xShift[6] := 2 ;
            yShift[6] := 2 ;
            xShift[7] := 1 ;
            yShift[7] := 2 ;
            xShift[8] := 0 ;
            yShift[8] := 2 ;

            end ;

          4 :
            begin
            xShift[0] := 1 ;
            yShift[0] := 0 ;

            xShift[1] := 0 ;
            yShift[1] := 0 ;

            xShift[2] := 1 ;
            yShift[2] := 1 ;

            xShift[3] := 0 ;
            yShift[3] := 1 ;
            end ;
          1 :
            begin
            xShift[0] := 0 ;
            yShift[0] := 0 ;
            end ;
          end;

    pBuf := Pointer(NativeUInt(PByte(pFrameBuf))) ; //{+ NativeUInt(Cam1.NumBytesPerFrame)*NativeUInt(iFrame))} ;
    if Cam1.NumBytesPerPixel = 1 then
       begin
       // Byte images
       // -----------

       // Sum of pixels
       Sum := 0 ;
       for i := 0 to Cam1.FrameHeight*Cam1.FrameWidth-1 do Sum := Sum + PByteArray(pBuf)^[i] ;
       if iShift = 0 then FirstImageSum := Sum ;
       // Scale to same average intensity of first image
       Scale := FirstImageSum / Max(Sum,1) ;

       // Copy into interleaved position in high resolution image
       for y := 0 to Cam1.FrameHeight-1 do
           begin
           ifrom := y*Cam1.FrameWidth*Cam1.NumComponentsPerPixel ;
           ito := ((y*nShifts + yShift[iShift])*HRFrameWidth + xShift[iShift])*Cam1.NumComponentsPerPixel ;
           for x := 0 to Cam1.FrameWidth-1 do
               begin
               for iComp := 0 to Cam1.NumComponentsPerPixel-1 do
                   pImageBuf^[ito+iComp] := Round(Scale*PByteArray(pBuf)^[ifrom+iComp]) ;
               ifrom := ifrom + Cam1.NumComponentsPerPixel ;
               ito := ito + nShifts*Cam1.NumComponentsPerPixel ;
               end;
           end ;
       end
    else begin
       // Word images
       // -----------

       // Sum of pixels
       Sum := 0.0 ;
       for i := 0 to Cam1.FrameHeight*Cam1.FrameWidth-1 do Sum := Sum + PWordArray(pBuf)^[i] ;
       if iShift = 0 then FirstImageSum := Sum ;
       // Scale to same average intensity of first image
       Scale := FirstImageSum / Max(Sum,1) ;
//       outputdebugstring(pchar(format('%d Scale=%.4g',[iShift,Scale])));

       // Copy into interleaved position in high resolution image
       for y := 0 to Cam1.FrameHeight-1 do
           begin
           ifrom := y*Cam1.FrameWidth*Cam1.NumComponentsPerPixel ;
           ito := ((y*nShifts + yShift[iShift])*HRFrameWidth + xShift[iShift])*Cam1.NumComponentsPerPixel ;
           for x := 0 to Cam1.FrameWidth-1 do
               begin
               for iComp := 0 to Cam1.NumComponentsPerPixel-1 do
                   pImageBuf^[ito+iComp] := Round(Scale*PWordArray(pBuf)^[ifrom+iComp]) ;
               ifrom := ifrom + Cam1.NumComponentsPerPixel ;
               ito := ito + nShifts*Cam1.NumComponentsPerPixel ;
               end;
           end ;
       end


    end ;


procedure TMainFrm.bSelectedRegionClick(Sender: TObject);
// ---------------------------
// Set new frame capture area
// ---------------------------
begin

    if LiveImagingInProgress then StopCamera ;

     bSelectedRegion.Enabled := False ;

     // Set CCD region to selected ROI region
     CCDRegion.Left := SelectedRect.Left ;
     CCDRegion.Right := SelectedRect.Right ;
     CCDRegion.Top := SelectedRect.Top ;
     CCDRegion.Bottom := SelectedRect.Bottom ;

     // Reset selected ROI to full image
     SelectedRect.Left := 0 ;
     SelectedRect.Right := 1.0 ;
     SelectedRect.Width := 1.0 ;
     SelectedRect.Top := 0.0 ;
     SelectedRect.Bottom := 1.0 ;
     SelectedRect.Height := 1.0 ;

     // Reset display zoom to full image
     iZoom := 0 ;
     XLeft := 0.0 ;
     YTop := 0.0 ;

     if LiveImagingInProgress then StartCamera ;
     bSelectedRegion.Enabled := True  ;

end;


procedure TMainFrm.bStopImageClick(Sender: TObject);
// ----------------------
// Stop collecting images
// ----------------------
begin

    // Stop camera (if running) and kill any trigger requests
    Cam1.StopCapture ;

    // Turn illumination off
    LightSource.On := False ;
    GetAllLightSourcePanels ;
    LightSource.Update ;

    scZSection.Position := 0 ;
    scTSection.Position := 0 ;

    // Reload image
    if ImageCaptureInProgress  then
       begin
       LoadRawImage( RawImagesFileName,scZSection.Position,scTSection.Position,Page.TabIndex) ;
       UpdateDisplay := True ;
       end;

    // Enable/disable buttons
    bStopImage.Enabled := False ;
    bLiveImage.Enabled := True ;
    bCaptureImage.Enabled := True ;

    // Disable all image capture
    LiveImagingInProgress := False ;
    ImageCaptureInProgress := False ;

    // Displayed stored images
    ShowCameraImage := False ;
    ShowCapturedImage := True ;

    UpdateDisplay := True ;

    // Update size and number of image panels
    SetImagePanels ;

    end;



procedure TMainFrm.cbCameraGainChange(Sender: TObject);
// ---------------------
// Gain changed
// ---------------------
begin
    if LiveImagingInProgress then StopCamera ;
    CameraGainIndex := cbCameraGain.ItemIndex ;
    if LiveImagingInProgress then StartCamera ;
    end;


procedure TMainFrm.cbCaptureModeChange(Sender: TObject);
var
    NumSubPixels : Double ;
begin
    NumSubPixels := Round(sqrt(NumPixelShiftFrames)) ;
    edNumPixelsPerZStep.Value := (edMicronsPerZStep.Value*NumSubPixels)/MagnifiedCameraPixelSize ;
    end;


procedure TMainFrm.cbLensChange(Sender: TObject);
// ------------
// Lens changed
// ------------
begin
    LensSelected := cbLens.ItemIndex ;
    // Update magnified pixel size
    MagnifiedCameraPixelSize := CameraPixelSize /
                                Max(RelayLensMagnification*LensMagnification[LensSelected],1E-3) ;
end;

procedure TMainFrm.cbLiveBinChange(Sender: TObject);
// -------------------------
// Live binning mode changed
// -------------------------
begin
   LiveBinSelected := cbLiveBin.ItemIndex ;
   if LiveImagingInProgress then
      begin
      StopCamera ;
      StartCamera ;
      end;
end;

procedure TMainFrm.cbPaletteChange(Sender: TObject);
// ------------------------------
// Display colour palette changed
// ------------------------------
begin
     UpdateLUT( GreyLevelMax ) ;
     UpdateDisplay := True ;
     end;


procedure TMainFrm.ckAcquireTimeLapseSeriesClick(Sender: TObject);
// -----------------------------------------
// Acquire time lapse series setting changed
// -----------------------------------------
begin
    resize ;
    end;


procedure TMainFrm.ckAcquireZStackClick(Sender: TObject);
// -------------------------------
// Acquire Z stack setting changed
// -------------------------------
begin
    resize ;
    end;


procedure TMainFrm.ckLightSourceOn0Click(Sender: TObject);
// -------------------------------------
// Light source on/off check box changed
// -------------------------------------
begin
    if IgnorePanelControls then Exit ;
    GetAllLightSourcePanels ;
    UpdateLightSource := True ;
    if LiveImagingInProgress then SetImagePanels ;
    end;


procedure TMainFrm.GetAllLightSourcePanels ;
// ---------------------------------------
// Get settings of all light source panels
// ---------------------------------------
begin
    GetLightSourcePanel(0, pnLightSource0, True ) ;
    GetLightSourcePanel(1, pnLightSource1, True ) ;
    GetLightSourcePanel(2, pnLightSource2, True ) ;
    GetLightSourcePanel(3, pnLightSource3, True ) ;
    GetLightSourcePanel(4, pnLightSource4, True ) ;
    GetLightSourcePanel(5, pnLightSource5, True ) ;
    GetLightSourcePanel(6, pnLightSource6, True ) ;
    GetLightSourcePanel(7, pnLightSource7, True ) ;
end;

procedure TMainFrm.ckLineScanClick(Sender: TObject);
// ----------------------
// Line scan mode changed
// ----------------------
begin
    UpdateDisplay := True ;
    end;


procedure TMainFrm.ckSeparateLightSourcesClick(Sender: TObject);
// --------------------------------------
// Separate light sources setting changed
// --------------------------------------
begin
    SetImagePanels ;
    end;


procedure TMainFrm.mnABoutClick(Sender: TObject);
// --------------
// Show about box
// --------------
begin
    AboutBox.ShowModal;
    end;

procedure TMainFrm.mnContentsClick(Sender: TObject);
// ---------------------
// Display help contents
// ---------------------
begin
     application.helpcontext( 10 ) ;
     end;


procedure TMainFrm.mnExitClick(Sender: TObject);
// ------------
// Stop program
// ------------
begin
    Close ;
    end;

procedure TMainFrm.mnScanSettingsClick(Sender: TObject);
// --------------------------
// Show Scan Settings dialog
// --------------------------
begin

     bStopImage.Click ;

     SettingsFrm.Left := MainFrm.Left + 20 ;
     SettingsFrm.Top := MainFrm.Top + 20 ;
     SettingsFrm.ShowModal ;

     // Update Z position limits
     edGotoZPosition.HiLimit := ZStage.ZPositionMax ;
     edGotoZPosition.LoLimit := ZStage.ZPositionMin ;
     edGotoZPosition.Value := edGotoZPosition.Value ;

     SetLensMenu ;
     ClearImageBuffers ;

     Resize ;

     end;


procedure TMainFrm.PageChange(Sender: TObject);
// ----------------
// Tab page changed
// ----------------
begin

     LoadRawImage( RawImagesFileName,scZSection.Position,scTSection.Position,Page.TabIndex) ;

     UpdateDisplay := True ;
     end;


procedure TMainFrm.mnSaveImageClick(Sender: TObject);
// ------------------
// Save image to file
// ------------------
begin
    SaveImage(False);
    end;


procedure TMainFrm.SaveImage( OpenImageJ: boolean ) ;
// -----------------------------
// Save current image(s) to file
// -----------------------------
var
    FileName,s : String ;
    iT,iZ,iPanel,nFrames : Integer ;
    i,iNum,NumFiles,NumFramesInFile : Integer ;
    Exists,FileOpen : boolean ;
    FileNames : TStringList ;
    NewFileRequired : Boolean ;
begin

     SaveDialog.InitialDir := SaveDirectory ;

     // Create an unused file name
     iNum := 1 ;
     repeat
        FileName := SaveDialog.InitialDir + '\'
                    + FormatDateTime('yyyy-mm-dd',Now)
                    + format(' %d.tif',[iNum]) ;
        Exists := false ;
        for iPanel := 0 to NumPanels-1 do
         for iT := 0 to NumTSectionsRequested-1 do
             for iZ := 0 to NumZSectionsRequested-1 do
             begin
             s := SectionFileName(FileName,iPanel,iZ,iT) ;
             Exists := Exists or FileExists(s) ;
             end ;
        Inc(iNum) ;
     until not Exists ;

     // Open save file dialog
     SaveDialog.FileName := ExtractFileName(FileName) ;
     if not SaveDialog.Execute then Exit ;

     // Ensure extension is set
     FileName := ChangeFileExt(SaveDialog.FileName, '.tif' ) ;
     Filename := ReplaceText( FileName, '.ome.tif', '.tif' ) ;
     SaveDirectory := ExtractFilePath(SaveDialog.FileName) ;

     // Check if any files exist already and allow user option to quit
     Exists := False ;
     for iPanel := 0 to NumPanels-1 do
         for iT := 0 to scTSection.Max do
             for iZ := 0 to scZSection.Max do
                 begin
                 s := SectionFileName(FileName,iPanel,iZ,iT) ;
                 Exists := Exists or FileExists(s) ;
                 if Exists then
                           begin
                           if MessageDlg( format(
                           'File %s already exists! Do you want to overwrite it? ',[s]),
                           mtWarning,[mbYes,mbNo], 0 ) = mrNo then Exit ;
                           Break ;
                           end ;
                 end;

     // Save image
     FileNames := TStringList.Create ;
     NumFramesInFile := 0 ;
     NumFiles := 0 ;
     nFrames := 1 ;
     FileOpen := False ;
     for iPanel := 0 to Max(NumPanels,1)-1 do
         begin
         NewFileRequired := True ;
         for iT := 0 to Max(scTSection.Max,0) do
             begin
             if scZSection.Max > 0 then NewFileRequired := True ;
             for iZ := 0 to Max(scZSection.Max,0) do
                 begin

                 // Get image
                 LoadRawImage( RawImagesFileName,iZ,iT,iPanel) ;

                 // Create a new file (if required)
                 if not SaveAsMultipageTIFF then NewFileRequired := True ;
                 if NewFileRequired then
                    begin
                    // Close open file
                    if FileOpen then
                       begin
                       ImageFile.CloseFile ;
                       FileOpen := False ;
                       end;
                    // Add file name to list
                    FileNames.Add(SectionFileName(FileName,iPanel,iZ,iT)) ;
                    // No. of images in file
                    if (not SaveAsMultipageTIFF) then nFrames := 1
                    else if scZSection.Max > 0 then nFrames := scZSection.Max + 1
                    else nFrames := scTSection.Max + 1;
                    // Create new file
                    FileOpen := ImageFile.CreateFile( FileNames.Strings[FileNames.Count-1],
                                                      HRFrameWidth,
                                                      HRFrameHeight,
                                                      NumBitsPerPixel,
                                                      HRNumComponentsPerPixel,
                                                      nFrames ) ;
                    if not FileOpen then Exit ;


                    if SaveAsMultipageTIFF then

                    ImageFile.XResolution := MagnifiedCameraPixelSize / sqrt(NumPixelShiftFrames) ;
                    ImageFile.YResolution := ImageFile.XResolution ;
                    ImageFile.ZResolution := edMicronsPerZStep.Value ;
                    ImageFile.SaveFrame32( 1, PImageBuf ) ;
                    Inc(NumFiles) ;
                    NumFramesInFile := 1 ;
                    NewFileRequired := False ;
                    end
                 else
                    begin
                    // Save subsequent sections of stack
                    Inc(NumFramesInFile) ;
                    ImageFile.SaveFrame32( NumFramesInFile, PImageBuf ) ;
                    end;

                 outputdebugstring(pchar(format('Frame %d written to %s',[NumFramesInFile,FileName])));
//                 edStatus.Text := format('Saving Image To OME.TIF %d/%d',[NumFramesInFile,NumImagesInRawFile]) ;
                 edSaveFileStatus.Visible := True ;
                 edSaveFileStatus.text := 'Saving to ' + FileNames.Strings[FileNames.Count-1] ;
                 if nFrames > 1 then edSaveFileStatus.text := edSaveFileStatus.text +
                                                              format(' (%d/%d)',[NumFramesInFile,nFrames]);

                 application.processmessages ;

                 end ;
             end ;
         end;

     // Close file (if a multipage TIFF)
     if FileOpen then
        begin
        ImageFile.CloseFile ;
        FileOpen := False ;
        end;

     // Open in Image-J window
     if OpenImageJ and FileExists(ImageJPath) then
        begin
        for i := 0 to FileNames.Count-1 do
             begin
             ShellExecute( Handle,
                           PChar('open'),
                           PChar('"'+ImageJPath+'"'),
                           PChar('"'+FileNames.strings[i]+'"'),
                           nil,SW_SHOWNORMAL) ;
             end;
        end ;

     FileNames.Destroy ;
     UnsavedRawImage := False ;
     edStatus.Text := '' ;
     edSaveFileStatus.Visible := False ;

end;


function TMainFrm.SectionFileName(
         FileName : string ;   // Base file name
         iPanel : Integer ;    // Image panel #
         iZSection : Integer ;   // Z section #
         iTSection : Integer     // T section #
         ) : string ;
// ------------------------------------------
// Return file name to of Channel / Z section
// ------------------------------------------
var
    s : string ;
begin

     s := '.' + PanelName[iPanel] + '.' ;
     if ckAcquireTimeLapseSeries.Checked and (not SaveAsMultipageTIFF) then
        s := s + format('T%d.',[iTSection]) ;

     if ckAcquireZStack.Checked and (not SaveAsMultipageTIFF) then
        s := s + format('Z%d.',[iZSection]) ;

     FileName := ANSIReplaceText( FileName, '.tif', s + '.tif' ) ;
     FileName := ANSIReplaceText( FileName, '..','.' ) ;
     FileName := ANSIReplaceText( FileName, '..','.' ) ;
     Result := FileName ;

     end;


procedure TMainFrm.mnSaveToImageJClick(Sender: TObject);
// --------------------------------------
// Save image to file and open in Image-J
// --------------------------------------
begin
    SaveImage(True);
    end;


procedure TMainFrm.edXPixelsKeyPress(Sender: TObject; var Key: Char);
// --------------------------
// No. of X pixels changed
// --------------------------
begin
     if Key = #13 then UpdateDisplay := True ;
     end;

procedure TMainFrm.edYPixelsKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then UpdateDisplay := True ;
     end;


procedure TMainFrm.FormResize(Sender: TObject);
// ---------------------------------
// Resize controls when form resized
// ---------------------------------
var
    iTop : Integer ;
begin

 // Page.Width := Max(ClientWidth - Page.Left - 5,2) ;
  Page.Height := Max(ClientHeight - Page.Top - 5 - SlidersGrp.Height,2) ;

  lbReadout.Top :=  ZSectionPanel.Top ;

  DisplayMaxWidth := tbChan0.ClientWidth - Image0.Left - 5 ;
  DisplayMaxHeight := tbChan0.ClientHeight - Image0.Top - 5 - ZSectionPanel.Height ;

  SetImagePanels ;

  // Image series options

  ImageSizeGrp.ClientHeight := ckSeparateLightSources.Top +
                               ckSeparateLightSources.Height +
                               ckAcquireZStack.Height +
                               ckAcquireTimeLapseSeries.Height + 25 ;

  ckAcquireZStack.Top := ckSeparateLightSources.Top + ckSeparateLightSources.Height + 2 ;
  ZStackGrp.Top := ckAcquireZStack.Top + ckAcquireZStack.Height + 2 ;
  ZStackGrp.Visible := ckAcquireZStack.Checked ;
  if ZStackGrp.Visible then
     begin
     ckAcquireTimeLapseSeries.Top := ZStackGrp.Top + ZStackGrp.Height + 2 ;
     ImageSizeGrp.ClientHeight := ImageSizeGrp.ClientHeight + ZStackGrp.Height + 2 ;
     end
  else ckAcquireTimeLapseSeries.Top := ckAcquireZStack.Top + ckAcquireZStack.Height + 2 ;

  TimeLapseGrp.Top := ckAcquireTimeLapseSeries.Top + ckAcquireTimeLapseSeries.Height + 2 ;
  TimeLapseGrp.Visible := ckAcquireTimeLapseSeries.Checked ;
  if TimeLapseGrp.Visible then ImageSizeGrp.ClientHeight := ImageSizeGrp.ClientHeight + TimeLapseGrp.Height + 2 ;

  // Set light source panels
  iTop := 16 ;
  IgnorePanelControls := True ;
  SetLightSourcePanel(0,pnLightSource0,iTop ) ;
  SetLightSourcePanel(1,pnLightSource1,iTop ) ;
  SetLightSourcePanel(2,pnLightSource2,iTop ) ;
  SetLightSourcePanel(3,pnLightSource3,iTop ) ;
  SetLightSourcePanel(4,pnLightSource4,iTop ) ;
  SetLightSourcePanel(5,pnLightSource5,iTop ) ;
  SetLightSourcePanel(6,pnLightSource6,iTop ) ;
  SetLightSourcePanel(7,pnLightSource7,iTop ) ;
  IgnorePanelControls := False ;
  LightSourceGrp.ClientHeight := iTop + 10 ;

  LightSourceGrp.Top := ImageSizeGrp.Top + ImageSizeGrp.Height + 5 ;
  ZStageGrp.Top := LightSourceGrp.Top + LightSourceGrp.Height + 5 ;
  DisplayGrp.Top := ZStageGrp.Top + ZStageGrp.Height + 5 ;
  StatusGrp.Top := DisplayGrp.Top +DisplayGrp.Height + 5 ;

  SLidersGrp.Top := Page.Top + Page.Height + 1 ;
  SLidersGrp.Left := Page.Left ;

  UpdateDisplay := True ;

  end;


procedure TMainFrm.SetLightSourcePanel(

          Num : Integer ;
          Panel : TPanel;
          var iTop : Integer ) ;
// -------------------------------------------
// Update light source settings panel controls
// -------------------------------------------
var
    i : Integer ;
begin

      Panel.Enabled := False ;
      if (LightSource.ControlLines[Num] < ControlDisabled) and
         (LightSource.SourceType <> lsNone) then Panel.Visible := True
                                            else Panel.Visible := False ;
//      LightSource.Active[Num] := Panel.Visible ;

      if Panel.Visible then begin
         Panel.Top := iTop ;
         iTop := iTop + Panel.Height ;
         end;

      // Set On check box
      for i := 0 to 3 do if Panel.Controls[i].Tag = 0 then
           begin
           TCheckBox(Panel.Controls[i]).Checked := LightSource.Active[Num] ;
           end ;

      // Set name
      for i := 0 to 3 do if Panel.Controls[i].Tag = 1 then
          TEdit(Panel.Controls[i]).Text := LightSource.Names[Num] ;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 2 then
          begin
          TTrackBar(Panel.Controls[i]).Position := Round(LightSource.Intensity[Num]) ;
          end;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 3 then
          TValidatedEdit(Panel.Controls[i]).Value :=LightSource.Intensity[Num] ;

      Panel.Enabled := True ;

      end;


procedure TMainFrm.GetLightSourcePanel(
          Num : Integer ;
          Panel : TPanel ;
          TrackBarChange : Boolean ) ;
// -------------------------------------------
// Read light source settings panel controls
// -------------------------------------------
var
    i : Integer ;
begin

     if IgnorePanelControls then Exit ;
     if LightSource.SourceType = lsNone then Exit ;

      // Set On check box
      for i := 0 to 3 do if Panel.Controls[i].Tag = 0 then
          LightSource.Active[Num] := TCheckBox(Panel.Controls[i]).Checked ;

      if not TrackBarChange then
         begin
         // Get value from edit box & update track bar
         for i := 0 to 3 do if Panel.Controls[i].Tag = 3 then
             LightSource.Intensity[Num] := TValidatedEdit(Panel.Controls[i]).Value ;
         for i := 0 to 3 do if (Panel.Controls[i].Tag = 2) and
             (TTrackBar(Panel.Controls[i]).Position <> Round(LightSource.Intensity[Num])) then
             TTrackBar(Panel.Controls[i]).Position := Round(LightSource.Intensity[Num]) ;
         end
      else
         begin
         // Get value from track bar and update edit box
         for i := 0 to 3 do if Panel.Controls[i].Tag = 2 then
             LightSource.Intensity[Num] := TTrackBar(Panel.Controls[i]).Position ;
         for i := 0 to 3 do if (Panel.Controls[i].Tag = 3) and
          (TValidatedEdit(Panel.Controls[i]).Value <> LightSource.Intensity[Num]) then
             TValidatedEdit(Panel.Controls[i]).Value := Round(LightSource.Intensity[Num]) ;
         end ;

      end;


procedure TMainFrm.sbContrastChange(Sender: TObject);
// --------------------------------------------------------
// Set display grey scale to new contrast slider setting
// --------------------------------------------------------
begin

     if ContrastPage.ActivePage <> SlidersTab then Exit ;

     edDisplayIntensityRange.LoValue := tbBrightness.Position - (tbContrast.Position div 2) ;
     edDisplayIntensityRange.HiValue := tbBrightness.Position + (tbContrast.Position div 2) ;

     if edDisplayIntensityRange.LoValue = edDisplayIntensityRange.HiValue then
        begin
        edDisplayIntensityRange.LoValue := edDisplayIntensityRange.LoValue - 1.0 ;
        edDisplayIntensityRange.HiValue := edDisplayIntensityRange.HiValue + 1.0 ;
        end ;

     GreyLo := Round(edDisplayIntensityRange.LoValue) ;
     GreyHi := Round(edDisplayIntensityRange.HiValue) ;

     SetDisplayIntensityRange( GreyLo, GreyHi ) ;
     UpdateLUT(GreyLevelMax ) ;
     UpdateDisplay := True ;

     end;


procedure TMainFrm.scTSectionChange(Sender: TObject);
// ---------------
// T Section changed
// ---------------
begin
     LoadRawImage( RawImagesFileName,scZSection.Position,scTSection.Position,Page.TabIndex) ;
     UpdateDisplay := True ;
     end;


procedure TMainFrm.scZSectionChange(Sender: TObject);
// ---------------
// Z Section changed
// ---------------
begin
     LoadRawImage( RawImagesFileName,scZSection.Position,scTSection.Position,Page.TabIndex) ;
     UpdateDisplay := True ;
     end;



procedure TMainFrm.SaveRawImage(
          FileName : String ;    // File to save to
          iImage : Integer     // Image Section number
          ) ;
// ----------------------
// Save raw image to file
// ----------------------
var
    FileHandle : THandle ;
    FilePointer : Int64 ;
    pBufW : PWordArray ;
    i : DWORD ;
    NumBytes : Int64 ;
begin
      outputdebugstring(pchar(format('Save Raw %d',[iImage])));
      // Copy into I/O buf
      NumBytes := Int64(HRNumComponentsPerFrame)*Int64(SizeOf(Word)) ;
      pBufW := GetMemory( NumBytes ) ;

      // Copy from image buffer
      for i := 0 to HRNumComponentsPerFrame-1 do pBufW^[i] := WORD(pImageBuf^[i]) ;

      if not FileExists(FileName) then FileHandle := FileCreate( FileName )
                                  else FileHandle := FileOpen( FileName, fmOpenWrite ) ;
      if Integer(FileHandle) < 0 then
         begin
         ShowMessage('Unable to open ' + FileName ) ;
         Exit ;
         end;

      NumImagesInRawFile := Max(NumImagesInRawFile,iImage+1) ;

      FilePointer := FileSeek( FileHandle, 0, 1 ) ;
      FilePointer := FilePointer + Int64(iImage)*NumBytes ;
      FileSeek( FileHandle, FilePointer, 0 ) ;
      FileWrite( FileHandle, pBufW^, NumBytes ) ;
      FileClose(FileHandle) ;

      FreeMem(pBufW) ;

      RawImageAvailable := True ;
      UnsavedRawImage := True ;

      // Save settings to INI file (to preserve raw file data settings)
      SaveSettingsToXMLFile( INIFileName ) ;

      end;


procedure TMainFrm.LoadRawImage(
          FileName : String ;    // File to save to
          ZSection : Integer ;   // Z stack section
          TSection : Integer ;   // T series section
          iPanel : Integer       // Panel
          ) ;
// ------------------------
// Load raw image from file
// ------------------------
var
    FileHandle : THandle ;
    FilePointer,NumBytes : Int64 ;
    iSection : Integer ;
    i : DWORD ;
    pBufW : PWordArray ;
begin

      if not RawImageAvailable then Exit ;

     iSection := TSection*NumZSectionsRequested*Max(NumPanels,1) +
                 ZSection*Max(NumPanels,1) + iPanel  ;

     // Exit with zero image if image not available
     if iSection >= NumImagesInRawFile then
        begin
        for i := 0 to HRNumComponentsPerFrame-1 do  pImageBuf^[i] := 0 ;
        Exit ;
        end;

      FileHandle := FileOpen( FileName, fmOpenRead ) ;
      if Integer(FileHandle) < 0 then
         begin
         ShowMessage('Unable to open ' + FileName ) ;
         Exit ;
         end;

      NumBytes := HRNumComponentsPerFrame*2 ;
      pBufW := GetMemory( NumBytes ) ;

      FilePointer := FileSeek( FileHandle, 0, 1 ) ;
      FilePointer := FilePointer + Int64(iSection)*NumBytes ;
      FileSeek( FileHandle, FilePointer, 0 ) ;
      FileRead( FileHandle, pBufW^, NumBytes) ;

      if PImageBuf = Nil then
         PImageBuf := GetMemory( Int64(HRNumComponentsPerFrame)*SizeOf(Integer)) ;

      // Copy from image buffer
      for i := 0 to HRNumComponentsPerFrame-1 do  pImageBuf^[i] := pBufW^[i] ;

      FileClose(FileHandle) ;

      FreeMem(pBufW) ;
      end;

procedure TMainFrm.SaveSettingsToXMLFile(
           FileName : String
           ) ;
// ------------------------------------------
// Save settings to XML file (public method)
// ------------------------------------------
begin
    CoInitialize(Nil) ;
    SaveSettingsToXMLFile1( FileName ) ;
    CoUnInitialize ;
    end ;


procedure  TMainFrm.SaveSettingsToXMLFile1(
           FileName : String
           ) ;
// ----------------------------------
// Save stimulus protocol to XML file
// ----------------------------------
var
   iNode,ProtNode : IXMLNode;
   s : TStringList ;
   XMLDoc : IXMLDocument ;
  i: Integer;
begin

    if FileName = '' then Exit ;

    XMLDoc := TXMLDocument.Create(Self);
    XMLDoc.Active := True ;

    // Clear document
    XMLDoc.ChildNodes.Clear ;

    // Add record name
    ProtNode := XMLDoc.AddChild( 'MESOSCANSETTINGS' ) ;

    AddElementInt( ProtNode, 'CAMERATYPE', CameraType ) ;
    AddElementInt( ProtNode, 'SELECTEDCAMERA', Cam1.SelectedCamera ) ;
    AddElementInt( ProtNode, 'CAMERAADC', Cam1.CameraADC ) ;
    AddElementInt( ProtNode, 'CAMERAREADOUTSPEED', Cam1.ReadoutSpeed ) ;


    AddElementDouble( ProtNode, 'EXPOSURETIME', edExposureTime.Value ) ;

    CameraGainIndex := cbCameraGain.ItemIndex ;
    AddElementInt( ProtNode, 'CAMERAGAIN', CameraGainIndex ) ;

    AddElementInt( ProtNode, 'LIVEBINSELECTED', LiveBinSelected ) ;

    AddElementInt( ProtNode, 'HRFRAMEWIDTH', HRFrameWidth ) ;
    AddElementInt( ProtNode, 'HRFRAMEHEIGHT', HRFrameHeight ) ;
    AddElementInt( ProtNode, 'HRNUMCOMPONENTSPERPIXEL', HRNumComponentsPerPixel ) ;
    AddElementInt( ProtNode, 'NUMBITSPERPIXEL', NumBitsPerPixel ) ;
    AddElementInt( ProtNode, 'NUMIMAGESINRAWFILE', NumImagesInRawFile ) ;

    AddElementInt( ProtNode, 'CAPTUREMODE', cbCaptureMode.ItemIndex ) ;

    AddElementInt( ProtNode, 'PALETTE', cbPalette.ItemIndex ) ;

//    AddElementDouble( ProtNode, 'LASERINTENSITY', LaserIntensity ) ;
//    AddElementDouble( ProtNode, 'ADCVOLTAGERANGE', ADCVoltageRange ) ;

    AddElementInt( ProtNode, 'CAMERATRIGGEROUTPUT', MainFrm.CameraTriggerOutput ) ;
    AddElementBool( ProtNode, 'CAMERATRIGGERACTIVEHIGH', MainFrm.CameraTriggerActiveHigh ) ;

    // Z stack
    iNode := ProtNode.AddChild( 'ZSTACK' ) ;
    AddElementInt( iNode, 'NUMZSECTIONS', Round(edNUMZSections.Value) ) ;
    AddElementDouble( iNode, 'NUMPIXELSPERZSTEP', Round(edNumPixelsPerZStep.Value) ) ;
    AddElementDouble( iNode, 'MICRONSPERZSTEP', Round(edMicronsPerZStep.Value) ) ;
    AddElementDouble( iNode, 'ZSTEP', edMicronsPerZStep.Value ) ;

    // Light sources

    AddElementInt( ProtNode, 'LIGHTSOURCETYPE', LightSource.SourceType ) ;
    AddElementInt( ProtNode, 'LIGHTSOURCECONTROLPORT', LightSource.ControlPort ) ;
    AddElementDouble( ProtNode, 'LIGHTSOURCECHANGETIME', LightSource.ChangeTime ) ;


//    AddElementInt( ProtNode, 'LIGHTSOURCEBAUDRATE', LightSource.BaudRate ) ;

    for i := 0 to High(LightSource.ControlLines) do begin
        iNode := ProtNode.AddChild( 'LIGHTSOURCE' ) ;
        AddElementInt( iNode, 'NUMBER', i ) ;
        AddElementText( iNode, 'NAME', LightSource.Names[i] ) ;
        AddElementInt( iNode, 'CONTROLLINE', LightSource.ControlLines[i] ) ;
        AddElementDouble( iNode, 'MINLEVEL', LightSource.MinLevel[i] ) ;
        AddElementDouble( iNode, 'MAXLEVEL', LightSource.MaxLevel[i] ) ;
        AddElementBool( iNode,'ACTIVE', LightSource.Active[i] ) ;
        AddElementDouble( iNode, 'INTENSITY', LightSource.Intensity[i] ) ;
        end;

    // Z stage
    iNode := ProtNode.AddChild( 'ZSTAGE' ) ;
    AddElementInt( iNode, 'STAGETYPE', ZStage.StageType ) ;
    AddElementInt( iNode, 'CONTROLPORT', ZStage.ControlPort ) ;
    AddElementText( iNode, 'SERIALNUMBER', ZStage.SerialNumber ) ;
    AddElementDouble( iNode, 'XSCALEFACTOR', ZStage.XScaleFactor ) ;
    AddElementDouble( iNode, 'YSCALEFACTOR', ZStage.YScaleFactor ) ;
    AddElementDouble( iNode, 'ZSCALEFACTOR', ZStage.ZScaleFactor ) ;
    AddElementDouble( iNode, 'ZSTEPTIME', ZStage.ZStepTime ) ;
    AddElementDouble( iNode, 'GOTOXPOSITION', edGotoXPosition.Value ) ;
    AddElementDouble( iNode, 'GOTOYPOSITION', edGotoYPosition.Value ) ;
    AddElementDouble( iNode, 'GOTOZPOSITION', edGotoZPosition.Value ) ;
    AddElementDouble( iNode, 'ZPOSITIONMAX', ZStage.ZPositionMax ) ;
    AddElementDouble( iNode, 'ZPOSITIONMIN', ZStage.ZPositionMin ) ;

    // Time lapse
    iNode := ProtNode.AddChild( 'TIMELAPSE' ) ;
    AddElementInt( iNode, 'NUMPOINTS', Round(edNumTimeLapsePoints.Value) ) ;
    AddElementDouble( iNode, 'TIMEINTERVAL', edTimeLapseInterval.Value ) ;

    // Lenses in use
    AddElementInt( ProtNode, 'NUMLENSES', NumLenses ) ;
    AddElementInt( ProtNode, 'LENSSELECTED', LensSelected ) ;
    for i := 0 to NumLenses-1 do begin
        iNode := ProtNode.AddChild( 'LENS' ) ;
        AddElementInt( iNode, 'NUMBER', i ) ;
        AddElementText( iNode, 'NAME', LensName[i] ) ;
        AddElementDouble( iNode, 'MAGNIFICATION', LensMagnification[i] ) ;
        end;

    AddElementDouble( ProtNode, 'RELAYLENSMAGNIFICATION', RelayLensMagnification ) ;
    AddElementDouble( ProtNode, 'CAMERAPIXELSIZE', CameraPixelSize ) ;
    AddElementDouble( ProtNode, 'CALIBRATIONBARSIZE', CalibrationBarSize ) ;

    AddElementDouble( ProtNode, 'CAMERATEMPERATURESETPOINT', Cam1.CameraTemperatureSetPoint ) ;

    AddElementInt( ProtNode, 'CCDTAPOFFSETLT',Cam1.CCDTapOffsetLT) ;
    AddElementInt( ProtNode, 'CCDTAPOFFSETRT',Cam1.CCDTapOffsetRT) ;
    AddElementInt( ProtNode, 'CCDTAPOFFSETLB',Cam1.CCDTapOffsetLB) ;
    AddElementInt( ProtNode, 'CCDTAPOFFSETRB',Cam1.CCDTapOffsetRB) ;

    AddElementText( ProtNode, 'SAVEDIRECTORY', SaveDirectory ) ;
    AddElementText( ProtNode, 'IMAGEJPATH', ImageJPath ) ;
    AddElementBool( ProtNode, 'SAVEASMULTIPAGETIFF', SaveAsMultipageTIFF ) ;
    AddElementText( ProtNode, 'RAWIMAGESFILENAME', RawImagesFileName ) ;
    AddElementBool( ProtNode, 'UNSAVEDRAWIMAGE', UnsavedRawImage ) ;

    // Images available in raw file
    AddElementInt( ProtNode, 'NUMTSECTIONSAVAILABLE', NumTSectionsAvailable ) ;
    AddElementInt( ProtNode, 'NUMPANELSAVAILABLE', NumPanels ) ;

    AddElementInt( ProtNode, 'NUMZSECTIONSREQUESTED', NumZSectionsRequested ) ;
    AddElementInt( ProtNode, 'NUMTSECTIONSREQUESTED', NumTSectionsRequested ) ;

    // Image acquisition modes
    AddElementBool( ProtNode, 'SEPARATELIGHTSOURCES', ckSeparateLightSources.Checked ) ;
    AddElementBool( ProtNode, 'ACQUIREZSTACK', ckAcquireZStack.Checked ) ;
    AddElementBool( ProtNode, 'ACQUIRETIMELAPSESERIES', ckAcquireTimeLapseSeries.Checked ) ;

     s := TStringList.Create;
     s.Assign(xmlDoc.XML) ;
     //sl.Insert(0,'<!DOCTYPE ns:mys SYSTEM "myXML.dtd">') ;
     s.Insert(0,'<?xml version="1.0"?>') ;
     s.SaveToFile( FileName ) ;
     s.Free ;
     XMLDoc.Active := False ;
     XMLDoc := Nil ;

    end ;


procedure TMainFrm.LoadSettingsFromXMLFile(
          FileName : String                    // XML protocol file
          ) ;
// ----------------------------------
// Load settings from XML file
// ----------------------------------
begin
    CoInitialize(Nil) ;
    LoadSettingsFromXMLFile1( FileName ) ;
    CoUnInitialize ;
    end ;


procedure TMainFrm.LoadSettingsFromXMLFile1(
          FileName : String                    // XML protocol file
          ) ;
// ----------------------------------
// Load settings from XML file
// ----------------------------------
var
   iNode,ProtNode : IXMLNode;
   Num : Integer ;

   NodeIndex : Integer ;
   XMLDoc : IXMLDocument ;
begin

    if not FileExists(FileName) then Exit ;

    XMLDoc := TXMLDocument.Create(Self) ;

    XMLDOC.Active := False ;

    XMLDOC.LoadFromFile( FileName ) ;
    XMLDoc.Active := True ;

    ProtNode := xmldoc.DocumentElement ;

    CameraType := GetElementInt( ProtNode, 'CAMERATYPE', CameraType ) ;
    Cam1.SelectedCamera := GetElementInt( ProtNode, 'SELECTEDCAMERA', Cam1.SelectedCamera ) ;
    Cam1.CameraADC := GetElementInt( ProtNode, 'CAMERAADC', Cam1.CameraADC ) ;
    Cam1.ReadoutSpeed := GetElementInt( ProtNode, 'CAMERAREADOUTSPEED', Cam1.ReadoutSpeed ) ;

    edExposureTime.Value := GetElementDouble( ProtNode, 'EXPOSURETIME', edExposureTime.Value ) ;
    CameraGainIndex := GetElementInt( ProtNode, 'CAMERAGAIN', CameraGainIndex ) ;

    LiveBinSelected := GetElementInt( ProtNode, 'LIVEBINSELECTED', LiveBinSelected ) ;
    cbLiveBin.ItemIndex := LiveBinSelected ;

    HRFrameWidth := GetElementInt( ProtNode, 'HRFRAMEWIDTH', HRFrameWidth ) ;
    HRFrameHeight := GetElementInt( ProtNode, 'HRFRAMEHEIGHT', HRFrameHeight ) ;
    HRNumComponentsPerPixel := GetElementInt( ProtNode, 'HRNUMCOMPONENTSPERPIXEL', HRNumComponentsPerPixel ) ;
    HRNumComponentsPerFrame := HRNumComponentsPerPixel*HRFrameHeight*HRFrameWidth ;
    NumBitsPerPixel := GetElementInt( ProtNode, 'NUMBITSPERPIXEL', NumBitsPerPixel ) ;
    NumImagesInRawFile := GetElementInt( ProtNode, 'NUMIMAGESINRAWFILE', NumImagesInRawFile ) ;
//    NumImagesInRawFile := 0 ;

    cbCaptureMode.ItemIndex := Min(Max(GetElementInt( ProtNode, 'CAPTUREMODE', cbCaptureMode.ItemIndex ),0),cbCaptureMode.Items.Count-1) ;

    cbPalette.ItemIndex := GetElementInt( ProtNode, 'PALETTE', cbPalette.ItemIndex ) ;
    PaletteType := TPaletteType(cbPalette.Items.Objects[cbPalette.ItemIndex]) ;

    CameraTriggerOutput := GetElementInt( ProtNode, 'CAMERATRIGGEROUTPUT', CameraTriggerOutput ) ;
    CameraTriggerActiveHigh := GetElementBool( ProtNode, 'CAMERATRIGGERACTIVEHIGH', CameraTriggerActiveHigh ) ;

    NodeIndex := 0 ;
    While FindXMLNode(ProtNode,'ZSTACK',iNode,NodeIndex) do
       begin
       edNUMZSections.Value := GetElementInt( iNode, 'NUMZSECTIONS', Round(edNUMZSections.Value) ) ;
       edNumPixelsPerZStep.Value := GetElementDouble( iNode, 'NUMPIXELSPERZSTEP', edNumPixelsPerZStep.Value ) ;
       edMicronsPerZStep.Value := GetElementDouble( iNode, 'MICRONSPERZSTEP', edMicronsPerZStep.Value ) ;
       edMicronsPerZStep.Value := GetElementDouble( iNode, 'ZSTEP', edMicronsPerZStep.Value ) ;
       Inc(NodeIndex) ;
       end ;

    // Light source control
    // Note. LightSource.SourceType must be loaded last to avoid port being opened with incorrect serial port
    LightSource.ControlPort := GetElementInt( ProtNode, 'LIGHTSOURCECONTROLPORT', LightSource.ControlPort ) ;
//    LightSource.BaudRate := GetElementInt( ProtNode, 'LIGHTSOURCEBAUDRATE', LightSource.BaudRate ) ;
    LightSource.SourceType := GetElementInt( ProtNode, 'LIGHTSOURCETYPE', LightSource.SourceType ) ;
    LightSource.ChangeTime := GetElementDouble( ProtNode, 'LIGHTSOURCECHANGETIME', LightSource.ChangeTime ) ;

    NodeIndex := 0 ;
    Num := High(LightSource.Name) + 1 ;
    While FindXMLNode(ProtNode,'LIGHTSOURCE',iNode,NodeIndex) do
        begin
        Num := GetElementInt( iNode, 'NUMBER', Num ) ;
        if (Num >=0) and (Num <= High(LightSource.Name)) then
           begin
           LightSource.Names[Num] := GetElementText( iNode, 'NAME', LightSource.Names[Num] ) ;
           LightSource.ControlLines[Num] := GetElementInt( iNode, 'CONTROLLINE', LightSource.ControlLines[Num] ) ;
           LightSource.MinLevel[Num] := GetElementDouble( iNode, 'MINLEVEL', LightSource.MinLevel[Num] ) ;
           LightSource.MaxLevel[Num] := GetElementDouble( iNode, 'MAXLEVEL', LightSource.MaxLevel[Num] ) ;
           LightSource.Active[Num] := GetElementBool( iNode,'ACTIVE', LightSource.Active[Num] ) ;
           LightSource.Intensity[Num] := GetElementDouble( iNode, 'INTENSITY', LightSource.Intensity[Num] ) ;
           end ;
        Inc(NodeIndex);
        end;

    // Z stage
    NodeIndex := 0 ;
    While FindXMLNode(ProtNode,'ZSTAGE',iNode,NodeIndex) do
      begin
      ZStage.StageType := GetElementInt( iNode, 'STAGETYPE', Round(ZStage.StageType) ) ;
      ZStage.ControlPort := GetElementInt( iNode, 'CONTROLPORT', Round(ZStage.ControlPort) ) ;
      ZStage.SerialNumber := GetElementText( iNode, 'SERIALNUMBER', ZStage.SerialNumber ) ;
      ZStage.XScaleFactor := GetElementDouble( iNode, 'XSCALEFACTOR', ZStage.XScaleFactor ) ;
      ZStage.YScaleFactor := GetElementDouble( iNode, 'YSCALEFACTOR', ZStage.YScaleFactor ) ;
      ZStage.ZScaleFactor := GetElementDouble( iNode, 'ZSCALEFACTOR', ZStage.ZScaleFactor ) ;
      ZStage.ZStepTime := GetElementDouble( iNode, 'ZSTEPTIME', ZStage.ZStepTime ) ;
      ZStage.ZPositionMax := GetElementDouble( iNode, 'ZPOSITIONMAX', ZStage.ZPositionMax ) ;
      ZStage.ZPositionMin := GetElementDouble( iNode, 'ZPOSITIONMIN', ZStage.ZPositionMin ) ;
      edGotoXPosition.Value := GetElementDouble( iNode, 'GOTOXPOSITION', edGotoXPosition.Value ) ;
      edGotoYPosition.Value := GetElementDouble( iNode, 'GOTOYPOSITION', edGotoYPosition.Value ) ;
      edGotoZPosition.Value := GetElementDouble( iNode, 'GOTOZPOSITION', edGotoZPosition.Value ) ;

      Inc(NodeIndex) ;
      end ;

    edGotoZPosition.HiLimit := ZStage.ZPositionMax ;
    edGotoZPosition.LoLimit := ZStage.ZPositionMin ;

    // Time lapse
    NodeIndex := 0 ;
    While FindXMLNode(ProtNode,'TIMELAPSE',iNode,NodeIndex) do
      begin
      edNumTimeLapsePoints.Value := GetElementInt( iNode, 'NUMPOINTS', Round(edNumTimeLapsePoints.Value) ) ;
      edTimeLapseInterval.Value := GetElementDouble( iNode, 'TIMEINTERVAL', edTimeLapseInterval.Value ) ;
      Inc(NodeIndex) ;
      end;

    // Lenses in use
    NumLenses := GetElementInt( ProtNode, 'NUMLENSES', NumLenses ) ;
    NumLenses := Min(Max(NumLenses,1),MaxLenses);
    LensSelected := GetElementInt( ProtNode, 'LENSSELECTED', LensSelected ) ;
    NodeIndex := 0 ;
    While FindXMLNode(ProtNode,'LENS',iNode,NodeIndex) do
        begin
        Num := GetElementInt( iNode, 'NUMBER', Num ) ;
        if (Num >=0) and (Num < MaxLenses ) then
           begin
           LensName[Num] := GetElementText( iNode, 'NAME', LensName[Num] ) ;
           LensMagnification[Num] := GetElementDouble( iNode, 'MAGNIFICATION', LensMagnification[Num] ) ;
           end ;
        Inc(NodeIndex);
        end;
    SetLensMenu ;

    RelayLensMagnification := GetElementDouble( ProtNode, 'RELAYLENSMAGNIFICATION', RelayLensMagnification ) ;
    if RelayLensMagnification <= 0.0 then RelayLensMagnification := 1.0 ;

    CameraPixelSize := GetElementDouble( ProtNode, 'CAMERAPIXELSIZE', CameraPixelSize ) ;

    CalibrationBarSize := GetElementDouble( ProtNode, 'CALIBRATIONBARSIZE', CalibrationBarSize ) ;

    MagnifiedCameraPixelSize := CameraPixelSize /
                                Max(RelayLensMagnification*LensMagnification[LensSelected],1E-3) ;

    Cam1.CameraTemperatureSetPoint := GetElementDouble( ProtNode, 'CAMERATEMPERATURESETPOINT', Cam1.CameraTemperatureSetPoint ) ;

    Cam1.CCDTapOffsetLT := GetElementInt( ProtNode, 'CCDTAPOFFSETLT',Cam1.CCDTapOffsetLT) ;
    Cam1.CCDTapOffsetRT := GetElementInt( ProtNode, 'CCDTAPOFFSETRT',Cam1.CCDTapOffsetRT) ;
    Cam1.CCDTapOffsetLB := GetElementInt( ProtNode, 'CCDTAPOFFSETLB',Cam1.CCDTapOffsetLB) ;
    Cam1.CCDTapOffsetRB := GetElementInt( ProtNode, 'CCDTAPOFFSETRB',Cam1.CCDTapOffsetRB) ;

    SaveDirectory := GetElementText( ProtNode, 'SAVEDIRECTORY', SaveDirectory ) ;
    ImageJPath := GetElementText( ProtNode, 'IMAGEJPATH', ImageJPath ) ;
    SaveAsMultipageTIFF := GetElementBool( ProtNode, 'SAVEASMULTIPAGETIFF', SaveAsMultipageTIFF ) ;
    RawImagesFileName := GetElementText( ProtNode, 'RAWIMAGESFILENAME', RawImagesFileName ) ;
    UnsavedRawImage := GetElementBool( ProtNode, 'UNSAVEDRAWIMAGE', UnsavedRawImage ) ;

    NumTSectionsAvailable := GetElementInt( ProtNode, 'NUMTSECTIONSAVAILABLE', NumTSectionsAvailable ) ;
    NumPanels := GetElementInt( ProtNode, 'NUMPANELSAVAILABLE', NumPanels ) ;

    NumZSectionsRequested := Max(GetElementInt( ProtNode, 'NUMZSECTIONSREQUESTED', NumZSectionsRequested ),1) ;
    scZSection.Max := NumZSectionsRequested - 1 ;
    NumTSectionsRequested := Max(GetElementInt( ProtNode, 'NUMTSECTIONSREQUESTED', NumTSectionsRequested ),1) ;
    scTSection.Max := NumTSectionsRequested - 1 ;

    // Image acquisition modes
    ckSeparateLightSources.Checked := GetElementBool( ProtNode, 'SEPARATELIGHTSOURCES', ckSeparateLightSources.Checked ) ;
    ckAcquireZStack.Checked := GetElementBool( ProtNode, 'ACQUIREZSTACK', ckAcquireZStack.Checked ) ;
    ckAcquireTimeLapseSeries.Checked := GetElementBool( ProtNode, 'ACQUIRETIMELAPSESERIES', ckAcquireTimeLapseSeries.Checked ) ;

    XMLDoc.Active := False ;
    XMLDoc := Nil ;

end ;


procedure TMainFrm.FormDestroy(Sender: TObject);
// ------------------------------
// Tidy up when form is destroyed
// ------------------------------
begin
     Bitmap.ReleasePalette ;
     BitMap.Free ;
     BitMap := Nil ;
     if EventList <> Nil then FreeMem(EventList) ;

     end;


procedure TMainFrm.AddElementDouble(
          ParentNode : IXMLNode ;
          NodeName : String ;
          Value : Double
          ) ;
// -------------------------------
// Add element with value to node
// -------------------------------
var
   ChildNode : IXMLNode;
begin

    ChildNode := ParentNode.AddChild( NodeName ) ;
    ChildNode.Text := format('%.10g',[Value]) ;

    end ;


function TMainFrm.GetElementDouble(
         ParentNode : IXMLNode ;
         NodeName : String ;
         Value : Double
          ) : Double ;
// ---------------------
// Get value of element
// ---------------------
var
   ChildNode : IXMLNode;
   OldValue : Single ;
   NodeIndex : Integer ;
   s : string ;
begin
    Result := Value ;
    OldValue := Value ;
    NodeIndex := 0 ;
    if FindXMLNode(ParentNode,NodeName,ChildNode,NodeIndex) then
       begin
       { Correct for use of comma/period as decimal separator }
       s := ChildNode.Text ;
       if (FormatSettings.DECIMALSEPARATOR = '.') then s := ANSIReplaceText(s , ',',FormatSettings.DECIMALSEPARATOR);
       if (FormatSettings.DECIMALSEPARATOR = ',') then s := ANSIReplaceText( s, '.',FormatSettings.DECIMALSEPARATOR);
       try
          Result := StrToFloat(s) ;
       except
          Result :=  OldValue ;
          end ;
       end ;

    end ;


procedure TMainFrm.AddElementInt(
          ParentNode : IXMLNode ;
          NodeName : String ;
          Value : Integer
          ) ;
// -------------------------------
// Add element with value to node
// -------------------------------
var
   ChildNode : IXMLNode;
begin

    ChildNode := ParentNode.AddChild( NodeName ) ;
    ChildNode.Text := format('%d',[Value]) ;

end ;


function TMainFrm.GetElementInt(
          ParentNode : IXMLNode ;
          NodeName : String ;
          Value : Integer
          ) : Integer ;
// ---------------------
// Get value of element
// ---------------------
var
   ChildNode : IXMLNode;
   NodeIndex : Integer ;
   OldValue : Integer ;
begin
    Result := Value ;
    OldValue := Value ;
    NodeIndex := 0 ;
    if FindXMLNode(ParentNode,NodeName,ChildNode,NodeIndex) then
       begin
       try
          Result := StrToInt(ChildNode.Text) ;
       except
          Result := OldValue ;
          end ;
       end ;
    end ;


procedure TMainFrm.AddElementBool(
          ParentNode : IXMLNode ;
          NodeName : String ;
          Value : Boolean
          ) ;
// -------------------------------
// Add element with value to node
// -------------------------------
var
   ChildNode : IXMLNode;
begin

    ChildNode := ParentNode.AddChild( NodeName ) ;
    if Value = True then ChildNode.Text := 'T'
                    else ChildNode.Text := 'F' ;

    end ;


function TMainFrm.GetElementBool(
          ParentNode : IXMLNode ;
          NodeName : String ;
          Value : Boolean
          ) : Boolean ;
// ---------------------
// Get value of element
// ---------------------
var
   ChildNode : IXMLNode;
   NodeIndex : Integer ;
begin
    Result := False ;
    NodeIndex := 0 ;
    if FindXMLNode(ParentNode,NodeName,ChildNode,NodeIndex) then
       begin
       if ANSIContainsText(ChildNode.Text,'T') then Value := True
                                               else Value := False ;
       Result := Value ;
       end ;

    end ;


procedure TMainFrm.AddElementText(
          ParentNode : IXMLNode ;
          NodeName : String ;
          Value : String
          ) ;
// -------------------------------
// Add element with value to node
// -------------------------------
var
   ChildNode : IXMLNode;
begin

    ChildNode := ParentNode.AddChild( NodeName ) ;
    ChildNode.Text := Value ;

    end ;


function TMainFrm.GetElementText(
          ParentNode : IXMLNode ;
          NodeName : String ;
          Value : String
          ) : string ;
// ---------------------
// Get value of element
// ---------------------
var
   ChildNode : IXMLNode;
   NodeIndex : Integer ;
begin

    Result := Value ;
    NodeIndex := 0 ;
    if FindXMLNode(ParentNode,NodeName,ChildNode,NodeIndex) then
       begin
       Result := ChildNode.Text ;
       end ;

    end ;


procedure TMainFrm.File1Click(Sender: TObject);
// ----------------
// File menu opened
// ----------------
begin
    mnSaveImage.Enabled := RawImageAvailable ;
    mnSaveToImageJ.Enabled := RawImageAvailable ;
end;

function TMainFrm.FindXMLNode(
         const ParentNode : IXMLNode ;  // Node to be searched
         NodeName : String ;            // Element name to be found
         var ChildNode : IXMLNode ;     // Child Node of found element
         var NodeIndex : Integer        // ParentNode.ChildNodes Index #
                                        // Starting index on entry, found index on exit
         ) : Boolean ;
// -------------
// Find XML node
// -------------
var
    i : Integer ;
begin

    Result := False ;
    for i := NodeIndex to ParentNode.ChildNodes.Count-1 do
      begin
      if ParentNode.ChildNodes[i].NodeName = WideString(NodeName) then
         begin
         Result := True ;
         ChildNode := ParentNode.ChildNodes[i] ;
         NodeIndex := i ;
         Break ;
         end ;
      end ;
    end ;


function TMainFrm.GetSpecialFolder(const ASpecialFolderID: Integer): string;
// --------------------------
// Get Windows special folder
// --------------------------
var
  vSpecialPath : array[0..MAX_PATH] of Char;
begin

    SHGetFolderPath( 0, ASpecialFolderID, 0,0,vSpecialPath) ;
    Result := StrPas(vSpecialPath);

    end;

end.

