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

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ValidatedEdit, LabIOUnit, RangeEdit, math,
  ExtCtrls, ImageFile, xmldoc, xmlintf, ActiveX, Vcl.Menus, system.types, strutils, UITypes,
  SESCam, mmsystem, Vcl.ToolWin, Vcl.Buttons, LightSourceUnit, shellapi,shlobj ;

const
    VMax = 10.0 ;
    MaxFrameType = 2 ;
    GreyScalePalette = 0 ;
    LUTSize = $10000 ;
    iLUTGrey = 0 ;
    iLUTRed = 1 ;
    iLUTGreen = 2 ;
    iLUTBlue = 3 ;
    iLUTFalseColour = 4 ;
    GreyLevelLimit = $FFFF ;
    FalseColourPalette = 1 ;
    MaxZoomFactors = 100 ;
    MaxPanels = 4 ;

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
    Label1: TLabel;
    edMicronsPerZStep: TValidatedEdit;
    ZStageGrp: TGroupBox;
    edZTop: TValidatedEdit;
    edGotoZPosition: TValidatedEdit;
    bGotoZPosition: TButton;
    LightSourceGrp: TGroupBox;
    DisplayGrp: TGroupBox;
    Splitter1: TSplitter;
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
    Cam1: TSESCam;
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
    ckLightSourceOn: TCheckBox;
    edName: TEdit;
    TrackBar1: TTrackBar;
    ValidatedEdit1: TValidatedEdit;
    pnLightSource1: TPanel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    TrackBar2: TTrackBar;
    ValidatedEdit2: TValidatedEdit;
    pnLightSource2: TPanel;
    CheckBox2: TCheckBox;
    Edit2: TEdit;
    TrackBar3: TTrackBar;
    ValidatedEdit3: TValidatedEdit;
    pnLightSource3: TPanel;
    CheckBox3: TCheckBox;
    Edit3: TEdit;
    TrackBar4: TTrackBar;
    ValidatedEdit4: TValidatedEdit;
    pnLightSource4: TPanel;
    CheckBox4: TCheckBox;
    Edit4: TEdit;
    TrackBar5: TTrackBar;
    ValidatedEdit5: TValidatedEdit;
    pnLightSource5: TPanel;
    CheckBox5: TCheckBox;
    Edit5: TEdit;
    TrackBar6: TTrackBar;
    ValidatedEdit6: TValidatedEdit;
    pnLightSource6: TPanel;
    CheckBox6: TCheckBox;
    Edit6: TEdit;
    TrackBar7: TTrackBar;
    ValidatedEdit7: TValidatedEdit;
    pnLightSource7: TPanel;
    CheckBox7: TCheckBox;
    Edit7: TEdit;
    TrackBar8: TTrackBar;
    ValidatedEdit8: TValidatedEdit;
    Page: TPageControl;
    tbChan0: TTabSheet;
    tbChan1: TTabSheet;
    tbChan2: TTabSheet;
    Image0: TImage;
    ZSectionPanel: TPanel;
    lbZSection: TLabel;
    scZSection: TScrollBar;
    lbReadout: TLabel;
    Image1: TImage;
    Image2: TImage;
    DisplayModeGrp: TGroupBox;
    rbZoomMode: TRadioButton;
    rbROIMode: TRadioButton;
    mnSaveToImageJ: TMenuItem;
    tbContrast: TTrackBar;
    tbBrightness: TTrackBar;
    ckSeparateLightSources: TCheckBox;
    ckAcquireZStack: TCheckBox;
    tbChan3: TTabSheet;
    Image3: TImage;
    edZStatus: TEdit;
    cbLiveBin: TComboBox;
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
    procedure edGotoZPositionKeyPress(Sender: TObject; var Key: Char);
    procedure Image0DblClick(Sender: TObject);
    procedure sbContrastChange(Sender: TObject);
    procedure bLiveImageClick(Sender: TObject);
    procedure mnSaveImageClick(Sender: TObject);
    procedure edExposureTimeKeyPress(Sender: TObject; var Key: Char);
    procedure cbCameraGainChange(Sender: TObject);
    procedure bFullFrameClick(Sender: TObject);
    procedure cbCaptureModeChange(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure ValidatedEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ckLightSourceOnClick(Sender: TObject);
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
  private

    { Private declarations }
        BitMap : TBitMap ;  // Image internal bitmaps
        procedure DisplayROI( BitMap : TBitmap ) ;
        procedure DisplaySquare(
                  X : Integer ;
                  Y : Integer ) ;

        procedure FixRectangle( var Rect : TRect ) ;
        function GetSpecialFolder(const ASpecialFolderID: Integer): string;

  public
    { Public declarations }
    CameraType : Integer ;
//    PixelWidth : Double ;                 // Camera pixel size (um)
    LensMagnification : Double ;          // Lens magnification
    CameraPixelSize : double ;            // Camera pixel size (microns)
    MagnifiedCameraPixelSize : double ;             // Image pixel size (microns)
    CameraTriggerOutput : Integer ;       // Camera trigger digital output line
    CameraTriggerActiveHigh : Boolean ;   // TTL high level triggers camera
    CameraTriggerBit : Integer ;
    CameraGainIndex : Integer ;
    Initialising : Boolean ;
    ShowCapturedImage : Boolean ;
    LiveImagingInProgress : Boolean ;
    ShowCameraImage : Boolean ;
    RawImageAvailable : Boolean ;
    DeviceNum : Integer ;
    pFrameBuf : Pointer ;
    TempBuf : PBig16bitArray ;

    FramePointer : Integer ;
    MostRecentFrame : Integer ;
    LastFrameDisplayed : Integer ;
    GetImageInProgress : Boolean ;
    TStart : Integer  ;
    NumFramesAcquired : Integer ;     // No. of frames acquired by camera
    NumFramesCaptured : Integer ;     // No. of frames transferred to capture buffer
    NumFramesRequired : Integer ;     //  No. of frames required to be captured
    OldNumFramesAcquired : Integer ;
    PulseCounter : Integer ;
    NextCameraTrigger : Integer ;

    BufSize : Integer ;
    XCentre : Double ;
    XWidth : Double ;
    YCentre : Double ;
    YHeight : Double ;
    PixelsToMicronsX : Double ;                // Image pixel X# to micron scaling factor
    PixelsToMicronsY : Double ;                // Image pixel Y# to micron scaling factor
    Images : Array[0..3] of TImage ;           // Image pointers

    CCDRegion : TDoubleRect ;                    // CCD image area
    SelectedRect : TDoubleRect ;                     // Selected sub-area within displayed image (image pixels)
    SelectedRectBM : TRect ;                   // Selected sub-area (bitmap pixels)
    SelectedEdge : TRect ;                     // Selection rectangle edges selected
    MouseDown : Boolean ;                      // TRUE = image cursor mouse is depressed
    CursorPos : TPoint ;                       // Position of cursor within image
    TopLeftDown : TPoint ;
    MouseDownAt : TPoint ;                     // Mouse position when button depressed
    MouseDownButton : TMouseButton ;           // Button pressed
    MouseUpCursor : Integer ;                  // Cursor icon when button released

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

    ScanInfo : String ;
    SlidersDisabled : Boolean ;

    // Z axis control
    ZSection : Integer ;                // Current Z Section being acquired
    ZStep : Double ;                  // Spacing between Z Sections (microns)
 //   NumZSections : Integer ;            // No. of Sections in Z stack
    NumZSectionsAvailable : Integer ;   // No. of Sections in Z stack
    NumLinesPerZStep : Integer ;      // No. lines per Z step in XZ mode
    XZLine : Integer ;                // XZ mode line counter
    XZAverageLine : Integer ;         // XZ mode averaged line counter
    XZLineAverageStart : Integer ;    // XZ mode start averaging at line
    XZLineAverageEnd : Integer ;    // XZ mode end averaging at line
    ZStartingPosition : Double ;      // Z position at start of scanning
    EmptyFlag : Integer ;
    UpdateDisplay : Boolean ;

    DisplayMaxWidth : Integer ;
    DisplayMaxHeight : Integer ;
    NumFrameTypes : Integer ;

    XScale : Single ;
    YScale : Single ;
    XLeft : Integer ;
    YTop : Integer ;
    XDown : Integer ;
    YDown : Integer ;
    XScaleToBM : Double ;
    ROIMode : Boolean ;

    YScaleToBM : Double ;

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
    pImageBuf : PIntArray ; // Pointer to image buffers
    pLiveImageBuf : PIntArray ; // Pointer to live image buffer
    pDisplayBuf : PIntArray ;

    PanelName : Array[0..MaxPanels-1] of string ; // Names of display panels in use
    NumPanels : Integer ;                         // No. of display panels in use

    ScanRequested : Boolean ;
    ScanningInProgress : Boolean ;

    INIFileName : String ;
    ProgDirectory : String ;
    SaveDirectory : String ;
    SettingsDirectory : String ;
    RawImagesFileName : String ;
    iImage : Integer ;
    NumImagesInFile : Integer ;        // Num images in file

    UnsavedRawImage : Boolean ;    // TRUE indicates raw images file contains an unsaved hi res. image
    SaveAsMultipageTIFF : Boolean ;  // TRUE = save as multi-page TIFF, FALSE=separate files
    ImageJPath : String ;            // Path to Image-J program

    MemUsed : Integer ;
    procedure InitialiseImage ;
    procedure SetImagePanels ;
    procedure StartNewScan ;
    procedure StartCamera ;
    procedure StopCamera ;
    procedure GetImage ;
    function SelectNextLightSource( Initialise : Boolean ) : Boolean ;

    procedure SetDisplayIntensityRange(
          LoValue : Integer ;
          HiValue : Integer
          ) ;

    procedure UpdateLUT( GreyMax : Integer ) ;

    procedure UpdateImage ;

    procedure CalculateMaxContrast ;

    procedure SetScanZoomToFullField ;

procedure SaveRawImage(
          FileName : String ;    // File to save to
          iImage : Integer     // Image Section number
          ) ;

function SectionFileName(
         FileName : string ;   // Base file name
         iPanel : Integer ;    // Image panel #
         iSection : Integer    // Z section #
         ) : string ;


procedure LoadRawImage(
          FileName : String ;    // File to save to
          iSection : Integer     // Image Section number
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


uses SettingsUnit, ZStageUnit, SetCCDReadoutUnit;

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

     end;


procedure TMainFrm.FormShow(Sender: TObject);
// --------------------------------------
// Initialisations when form is displayed
// --------------------------------------
var
    i,iDev,iChan : Integer ;
    NumPix : Cardinal ;
begin

     Initialising := False ;
     LiveImagingInProgress := False ;
     ShowCapturedImage := False ;

     Caption := 'MesoCam V1.5.4 ';
     {$IFDEF WIN32}
     Caption := Caption + '(32 bit)';
    {$ELSE}
     Caption := Caption + '(64 bit)';
    {$IFEND}
     Caption := Caption + ' 30/09/16';

     TempBuf := Nil ;
     DeviceNum := 1 ;

     LabIO.NIDAQAPI := NIDAQMX ;
     LabIO.Open ;

     // Open camera
//     CameraType := IMAQ ;

     Cam1.BinFactor := 1 ;
   //  PixelWidth := Cam1.PixelWidth ;

     edStatus.Text := LabIO.DeviceName[1] + ': ' + LabIO.DeviceBoardName[1] ;

     LabIO.ADCInputMode := imDifferential ;
     if cam1.NumBytesPerPixel = 1 then EmptyFlag := 255
                                  else EmptyFlag := 32000 ;

     NumLinesPerZStep := 1 ;

     XZLine := 0 ;
     XZAverageLine := 0 ;

     DeviceNum := 1 ;
     GreyLo := 0 ;
     GreyLevelMax := Cam1.GreyLevelMax ;
     GreyHi := GreyLevelMax ;

     //StatusBar.SimpleText := LabIO.DeviceName[1] ;
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

     cbCaptureMode.Clear ;
     cbCaptureMode.Items.AddObject('Standard (X1)',TObject(1));
     cbCaptureMode.Items.AddObject('High Res. (X4)',TObject(4));
     cbCaptureMode.Items.AddObject('High Res. (X9)',TObject(9));
     cbCaptureMode.ItemIndex := 0 ;

     // Imaging mode
     ckAcquireZStack.Checked := False ;
     ZStackGrp.Visible := False ;

     // Intensity display palette
     cbPalette.Clear ;
     cbPalette.Items.AddObject(' Grey scale', TObject(palGrey)) ;
     cbPalette.Items.AddObject(' False colour', TObject(palFalseColor)) ;
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

//     SnapNum := 1 ;

     FrameWidth := Cam1.FrameWidthMax ;
     FrameHeight := Cam1.FrameHeightMax ;

     if BitMap <> Nil then BitMap.Free ;
     BitMap := TBitMap.Create ;
     BitMap.Width := FrameWidth ;
     BitMap.Height := FrameHeight ;
     BitMap.PixelFormat := pf24bit ;

     edNumPixelsPerZStep.Value := 1.0 ;
     edNumZSections.Value := 10.0 ;


     LensMagnification := 1.0 ;
     CameraPixelSize := 1.0 ;
     MagnifiedCameraPixelSize := CameraPixelSize / LensMagnification ;

     // Image-J program path
     ImageJPath := 'C:\ImageJ\imagej.exe';

     ProgDirectory := ExtractFilePath(ParamStr(0)) ;

     // Create settings directory path
     SettingsDirectory := GetSpecialFolder(CSIDL_COMMON_DOCUMENTS) + '\MesoCam\';
     if not SysUtils.DirectoryExists(SettingsDirectory) then begin
        if not SysUtils.ForceDirectories(SettingsDirectory) then
           ShowMessage( 'Unable to create settings folder' + SettingsDirectory) ;
        end ;

     // Load last used settings
     INIFileName := SettingsDirectory + 'mesocam settings.xml' ;
     LoadSettingsFromXMLFile( INIFileName ) ;

     // Help file
     Application.HelpFile := ProgDirectory + 'mesocam.chm';


     Cam1.OpenCamera(CameraType);

     // Set camera gain list
     Cam1.GetCameraGainList( cbCameraGain.Items );
     cbCameraGain.ItemIndex := CameraGainIndex ;

     RawImagesFileName := ProgDirectory + 'mesocam.raw' ;


     UpdateDisplay := False ;
     ScanRequested := False ;
     ScanningInProgress := False ;

    // (re)allocate image buffer
    NumPix := FrameWidth*FrameHeight*Max(NumComponentsPerPixel,1) ;
    if PImageBuf <> Nil then FreeMem(PImageBuf) ;
    PImageBuf := GetMemory( Int64(NumPix)*Sizeof(integer)) ;
    for i := 0 to NumPix-1 do pImageBuf^[i] := 0 ;

    if PLiveImageBuf <> Nil then FreeMem(PLiveImageBuf) ;
    PLiveImageBuf := GetMemory( Int64(NumPix)*SizeOf(Integer)) ;

    SetImagePanels ;
    InitialiseImage ;
    MouseUpCursor := crCross ;

    SetScanZoomToFullField ;


    iDev := LabIO.Resource[CameraTriggerOutput].Device ;
    iChan := LabIO.Resource[CameraTriggerOutput].StartChannel ;
    LabIO.SetBit(LabIO.DigOutState[iDev],iChan,CameraTriggerBit);
    CameraTriggerBit := 0 ;
    // Initialise digital outputs
    for iDev := 1 to LabIO.NumDevices do begin
        LabIO.WriteToDigitalOutPutPort( iDev, LabIO.DigOutState[iDev] ) ;
        end;

     Timer.Enabled := True ;
     UpdateDisplay := True ;
     bStopImage.Enabled := False ;
     image0.ControlStyle := image0.ControlStyle + [csOpaque] ;
     tbChan0.ControlStyle := tbChan0.ControlStyle + [csOpaque] ;
     lbreadout.ControlStyle := lbreadout.ControlStyle + [csOpaque] ;

     Left := 10 ;
     Top := 10 ;
     Width := Screen.Width - 10 - Left ;
     Height := Screen.Height - 50 - Top ;

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


procedure TMainFrm.Image0DblClick(Sender: TObject);
// -----------------------------
// Mouse double clicked on image
// -----------------------------
begin
      ROIMode := True ;
      // Set top-left of ROI box to current cursor position
      SelectedRectBM.Left := MouseDownAt.X ;
      SelectedRect.Left := ((SelectedRectBM.Left/XScaleToBM) + XLeft)/FrameWidth ;
      SelectedRectBM.Top := MouseDownAt.Y ;
      SelectedRect.Top := ((SelectedRectBM.Top/YScaleToBM) + YTop)/FrameHeight ;
      UpdateDisplay := True ;
      end;


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
     XDown := X ;
     YDown := Y ;
     MouseDownAt.X := X ;
     MouseDownAt.Y := Y ;
     TopLeftDown.X := XLeft ;
     TopLeftDown.Y := YTop ;

     MouseUpCursor := Image0.Cursor ;
     if (Image0.Cursor = crCross) and (not ROIMode) then Image0.Cursor := crHandPoint ;

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
    XRight,YBottom,XShift,YShift : Integer ;
    XImage,YImage : Integer ;
begin

     if pDisplayBuf = Nil then Exit ;

     XImage := Round(X/XScaleToBM) + XLeft ;
     YImage := Round(Y/YScaleToBM) + YTop ;
     i := YImage*FrameWidth + XImage ;


     PixelsToMicronsX := Cam1.BinFactor*MagnifiedCameraPixelSize/sqrt(Cam1.NumPixelShiftFrames) ;
     PixelsToMicronsY := PixelsToMicronsX ;

     if (i > 0) and (i < FrameWidth*FrameHeight) then
        begin
        lbReadout.Caption := format('X=%.6g um, Y=%.6g um, I=%d',
                           [XImage*PixelsToMicronsX,
                            YImage*PixelsToMicronsY,
                            pDisplayBuf[i]]) ;
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
        CursorPos.X := X ;
        CursorPos.Y := Y ;
        end
     else
        begin
        if Image0.Cursor = crCRoss then Image0.Cursor := crHandPoint ;
        XShift := X - CursorPos.X ;
        CursorPos.X := X ;
        YShift := Y - CursorPos.Y ;
        CursorPos.Y := Y ;
        if SelectedEdge.Left = 1 then
           begin
           // Move left edge
           SelectedRectBM.Left := Max(SelectedRectBM.Left + XShift,0);
           SelectedRectBM.Left := Min(SelectedRectBM.Left,Min(BitMap.Width-1,SelectedRectBM.Right-1)) ;
           SelectedRect.Left := ((SelectedRectBM.Left/XScaleToBM) + XLeft)/FrameWidth ;
           end ;
        if SelectedEdge.Right = 1 then
           begin
           // Move right edge
           SelectedRectBM.Right := Max(SelectedRectBM.Right + XShift,Max(0,SelectedRectBM.Left));
           SelectedRectBM.Right := Min(SelectedRectBM.Right,BitMap.Width-1) ;
           SelectedRect.Right := ((SelectedRectBM.Right/XScaleToBM) + XLeft)/FrameWidth ;
           end;
        if SelectedEdge.Top = 1 then
           begin
           // Move top edge
           SelectedRectBM.Top := Max(SelectedRectBM.Top + YShift,0);
           SelectedRectBM.Top := Min(SelectedRectBM.Top,Min(BitMap.Height-1,SelectedRectBM.Bottom-1)) ;
           SelectedRect.Top := ((SelectedRectBM.Top/YScaleToBM) + YTop)/FrameHeight ;
           end;

        if SelectedEdge.Bottom = 1 then
           begin
           // Move bottom edge
           SelectedRectBM.Bottom := Max(SelectedRectBM.Bottom + YShift,SelectedRectBM.Top+1);
           SelectedRectBM.Bottom := Min(SelectedRectBM.Bottom,BitMap.Height-1) ;
           SelectedRect.Bottom := ((SelectedRectBM.Bottom/YScaleToBM) + YTop)/FrameHeight ;
           end;

        if ROIMode then
           begin
           // If in ROI mode, set bottom,right edge of ROI to current cursor position
           SelectedRectBM.Right := X ;
           SelectedRectBM.Bottom := Y ;
           SelectedRect.Right := ((SelectedRectBM.Right/XScaleToBM) + XLeft)/FrameWidth ;
           SelectedRect.Bottom := ((SelectedRectBM.Bottom/YScaleToBM) + YTop)/FrameHeight ;
           end
        else if (SelectedEdge.Left or SelectedEdge.Right or
            SelectedEdge.Top or SelectedEdge.Bottom) = 0 then
            begin
            // Move display window
            XLeft := TopLeftDown.X - Round((X - MouseDownAt.X)/XScaleToBM) ;
            XRight := Min(XLeft + Round(Bitmap.Width/XScaleToBM),FrameWidth) ;
            XLeft := Max( XRight - Round(Bitmap.Width/XScaleToBM), 0 ) ;
            YTop := TopLeftDown.Y - Round((Y - MouseDownAt.Y)/YScaleToBM) ;
            YBottom := Min(YTop + Round(Bitmap.Height/YScaleToBM),FrameHeight) ;
            YTop := Max( YBottom - Round(Bitmap.Height/YScaleToBM),0) ;
            end;
         end ;

       UpdateDisplay := True ;
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

    if rbZoomMode.Checked and
       (CursorPos.X = MouseDownAt.X) and (CursorPos.Y = MouseDownAt.Y) then
       begin
       MagnificationOld := Magnification[iZoom] ;
       if Button = mbLeft then
          begin
          iZoom := Min(iZoom + 1,High(Magnification));
          end
       else
          begin
          iZoom := Max(iZoom - 1,0);
          end;

       NewWidth := Round(BitMap.Width*(MagnificationOld/Magnification[iZoom])) ;
       NewHeight := Round(BitMap.Height*(MagnificationOld/Magnification[iZoom])) ;

       XLeft := Max(XLeft + Round((CursorPos.X-(NewWidth div 2))/XScaleToBM),0);
       XLeft := Min(XLeft,FrameWidth - Round(NewWidth/XScaleToBM)) ;
       YTop := Max(YTop + Round((CursorPos.Y-(NewHeight div 2))/YScaleToBM),0);
       YTop := Min(YTop,FrameHeight - Round(NewHeight/YScaleToBM)) ;

       Resize ;
       UpdateDisplay := True ;
       end;

     MouseDown := False ;
     Image0.Cursor := MouseUpCursor ;
     //Screen.Cursor :=crDefault ;
     if rbZoomMode.Checked then Image0.Cursor := crSizeAll
                           else Image0.Cursor :=crDefault ;

     ROIMode := False ;                   // Turn ROI mode off
     FixRectangle(SelectedRectBM);
     //FixRectangle(SelectedRect);

end;


procedure TMainFrm.InitialiseImage ;
// ------------------------------------------------------
// Re-initialise size of memory buffers and image bitmaps
// ------------------------------------------------------
begin

     // Set size and location of image display panels
     SetImagePanels ;

     // Indicate selected frame type selected for contrast update
     DisplayGrp.Caption := ' Contrast ' ;

     // Set intensity range and sliders
     SetDisplayIntensityRange( GreyLo, GreyHi ) ;

     // Update display look up tables
     UpdateLUT( GreyLevelMax );

end ;


procedure TMainFrm.SetImagePanels ;
// -------------------------------------------
// Set size and number of image display panels
// -------------------------------------------
const
    MarginPixels = 16 ;
var
    HeightWidthRatio : Double ;
    i : Integer ;

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
     XScaleToBM := (BitMap.Width*Magnification[iZoom]) / Max(FrameWidth,1) ;
     YScaleToBM := (BitMap.Width*Magnification[iZoom]) / Max(FrameWidth,1) ;
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
        Images[i].Canvas.Font.Size := 8 ;
        Images[i].Canvas.Font.Color := clBlue ;
        end ;

     // Assign image panel captions
     NumPanels := 0 ;
     tbChan0.Caption := '' ;
     tbChan1.TabVisible := False ;
     tbChan2.TabVisible := False ;
     tbChan3.TabVisible := False ;
     //GetAllLightSourcePanels ;
     for i := 0 to High(LightSource.Active) do if LightSource.Active[i] then
         begin
         case NumPanels of
              0 : begin
                  tbChan0.Caption := tbChan0.Caption + LightSource.Names[i] + ' ';
                  PanelName[NumPanels] := tbChan0.Caption ;
                  end;
              1 : begin
                  tbChan1.Caption := LightSource.Names[i] ;
                  PanelName[NumPanels] := tbChan1.Caption ;
                  tbChan1.TabVisible := True ;
                  end;
              2 : begin
                  tbChan2.Caption := LightSource.Names[i] ;
                  PanelName[NumPanels] := tbChan2.Caption ;
                  tbChan2.TabVisible := True ;
                  end ;
              3 : begin
                  tbChan3.Caption := LightSource.Names[i] ;
                  PanelName[NumPanels] := tbChan3.Caption ;
                  tbChan3.TabVisible := True ;
                  end ;
              end;
         if ckSeparateLightSources.Checked and ShowCapturedImage then Inc(NumPanels) ;
         end;
     NumPanels := Max(NumPanels,1);
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

     SelectedRectBM.Left := Round((SelectedRect.Left*FrameWidth - XLeft)*XScaletoBM) ;
     SelectedRectBM.Right := Round((SelectedRect.Right*FrameWidth - XLeft)*XScaletoBM) ;
     SelectedRectBM.Top := Round((SelectedRect.Top*FrameHeight - YTop)*YScaletoBM) ;
     SelectedRectBM.Bottom := Round((SelectedRect.Bottom*FrameHeight - YTop)*YScaletoBM) ;

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
    YBottom,XRight : Integer ;
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

    //SetImagePanels ;
    Images[Page.TabIndex].Width := BitMap.Width ;
    Images[Page.TabIndex].Height := BitMap.Height ;

    DisplayMaxWidth := tbCHan0.ClientWidth - Image0.Left - 5 ;
    DisplayMaxHeight := tbCHan0.ClientHeight - Image0.Top - 5  ;

    // Adjust left,top edge of displayed region of image when bottom,right is off image
    XRight := Min(XLeft + Round(Bitmap.Width/XScaleToBM),FrameWidth) ;
    XLeft := Max( XRight - Round(Bitmap.Width/XScaleToBM), 0 ) ;
    YBottom := Min(YTop + Round(Bitmap.Height/YScaleToBM),FrameHeight) ;
    YTop := Max( YBottom - Round(Bitmap.Height/YScaleToBM),0) ;

    //  X axis pixel mapping
    X := XLeft ;
    dX := 1.0/XScaleToBM ;
    GetMem( XMap, BitMap.Width*4 ) ;
    for i := 0 to BitMap.Width-1 do
        begin
        XMap^[i] := Min(Max(Round(X),0),FrameWidth-1) ;
        X := X + dX ;
        end;

    // Y axis line mapping
    //YScaleToBM := (BitMap.Width*Magnification*FrameHeightScale) / FrameWidth ;
    GetMem( YMap, BitMap.Height*4 ) ;
    Y := YTop ;
    dY := 1.0/YScaleToBM ;
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

     // Display ROI in XY and XYZ modde
     if not rbZoomMode.Checked then DisplayROI(BitMap) ;

     Images[Page.TabIndex].Picture.Assign(BitMap) ;
     Images[Page.TabIndex].Width := BitMap.Width ;
     Images[Page.TabIndex].Height := BitMap.Height ;

     // Show Z section slider bar
     if (NumZSectionsAvailable > 1) and (not bStopImage.Enabled)  then
        begin
        ZSectionPanel.Visible := True ;
        lbZSection.Caption := format('Section %d/%d',[ZSection+1,NumZSectionsAvailable]) ;
        end
     else ZSectionPanel.Visible := False ;

     FreeMem(XMap) ;
     FreeMem(YMap) ;

     SetImagePanels ;

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

     case cbPalette.ItemIndex of

          iLUTGrey :
              begin
                 for i := 0 to High(RedLUT) do
                 begin
                 y := Min(Max(Round((i-GreyLo)*GreyScale),0),DisplayGreyMax) ;
                 RedLUT[i] := y ;
                 GreenLUT[i] := y ;
                 BlueLUT[i] := y ;
                 end ;
              end;

          iLUTRed :
             begin
             for i := 0 to High(RedLUT) do
                 begin
                 y := Min(Max(Round((i-GreyLo)*GreyScale),0),DisplayGreyMax) ;
                 RedLUT[i] := y ;
                 GreenLUT[i] := 0 ;
                 BlueLUT[i] := 0 ;
                 end ;
             end;

          iLUTGreen :
             begin
             for i := 0 to High(RedLUT) do
                 begin
                 y := Min(Max(Round((i-GreyLo)*GreyScale),0),DisplayGreyMax) ;
                 RedLUT[i] := 0 ;
                 GreenLUT[i] := y ;
                 BlueLUT[i] := 0 ;
                 end ;
             end;

          iLUTBlue :
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
      LightSource.Update ;
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
    ShowCapturedImage := False ;
    ShowCameraImage := True ;
    StartNewScan ;
end ;

procedure TMainFrm.bCaptureImageClick(Sender: TObject);
// ----------------------------
// Scan currently selected area
// ----------------------------
begin
    bCaptureImage.Enabled := False ;
    if LiveImagingInProgress then
       begin
       StopCamera ;
       LiveImagingInProgress := False ;
       end;

    bLiveImage.Enabled := True ;
    bStopImage.Enabled := True ;
    NumFramesRequired := 1 ;
    ShowCameraImage := True ;
    StartNewScan ;
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

     if LiveImagingInProgress then ScanRequested := True ;
end;

procedure TMainFrm.StartNewScan ;
// ----------------------------------
// Start new immage capture sequence
// ----------------------------------
begin

    if UnsavedRawImage then
       begin
       if MessageDlg( 'Current Image not saved! Do you want to overwrite image?',
           mtWarning,[mbYes,mbNo], 0 ) = mrNo then Exit ;
       end;

    ScanRequested := True ;

    FixRectangle( SelectedRectBM ) ;

    // Image pixel to microns scaling factor
    PixelsToMicronsX := 1.0 ;
    PixelsToMicronsY := PixelsToMicronsX ;

    // Z sections
    ZSection := 0 ;
    NumZSectionsAvailable := 0 ;
    NumImagesInFile := 0 ;
    RawImageAvailable := False ;
//    ZStep := edNumPixelsPerZStep.Value*(Cam1.PixelWidth/Cam1.BinFactor) ;
    ZStep := edNumPixelsPerZStep.Value*MagnifiedCameraPixelSize ;
    edMicronsPerZStep.Value := ZStep ;
    //NumZSections := Round(edNumZSections.Value) ;

    // Initialise light source used in SeparateLightSources mode
    SelectNextLightSource(true) ;

    SetImagePanels ;

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
    i,nShifts : Integer ;
begin

    if Initialising then Exit ;

    // Stop A/D & D/A
    MemUsed := 0 ;
    XZLine := 0 ;
    XZAverageLine := 0 ;

    Cam1.StopCapture ;

    LightSource.Update ;

    // Save current positoion of Z stage
    ZStartingPosition := ZStage.ZPosition ;

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
       if Cam1.NumPixelShiftFrames > 0 then Cam1.TriggerMode := CamExtTrigger
                                       else Cam1.TriggerMode := camFreeRun ;
       end;
    NumFramesRequired := Cam1.NumPixelShiftFrames ;

    InitialiseImage ;

     // Set to full frame
    Cam1.SetCCDArea( Round(CCDRegion.Left*MainFrm.Cam1.FrameWidthMax),
                     Round(CCDRegion.Top*MainFrm.Cam1.FrameHeightMax),
                     Round(CCDRegion.Right*MainFrm.Cam1.FrameWidthMax)-1,
                     Round(CCDRegion.Bottom*MainFrm.Cam1.FrameHeightMax)-1);

    Cam1.FrameInterval := edExposureTime.Value / (Cam1.BinFactor*Cam1.BinFactor) ;
    Cam1.GetFrameBufferPointer( pFrameBuf ) ;
    Cam1.AmpGain := cbCameraGain.ItemIndex ;

    if Cam1.NumComponentsPerFrame <> NumComponentsPerFrame then
       begin
       if pLiveImageBuf <> Nil then FreeMem(pLiveImageBuf);
       NumComponentsPerFrame := Cam1.NumComponentsPerFrame ;
       NumComponentsPerPixel := Cam1.NumComponentsPerPixel ;
       pLiveImageBuf := GetMemory(Cam1.NumComponentsPerFrame*SizeOf(Integer)) ;
       for i := 0 to Cam1.NumComponentsPerFrame-1 do pLiveImageBuf^[i] := 0 ;
//       FrameWidth := Cam1.FrameWidth ;
//       FrameHeight := Cam1.FrameHeight ;
       NumBitsPerPixel := Cam1.PixelDepth ;
       GreyLevelMax := Cam1.GreyLevelMax ;
       end;

//       FrameWidth := Cam1.FrameWidth ;
//       FrameHeight := Cam1.FrameHeight ;
       NumBitsPerPixel := Cam1.PixelDepth ;
       GreyLevelMax := Cam1.GreyLevelMax ;
    nShifts := Round(sqrt(Cam1.NumPixelShiftFrames)) ;

    Cam1.NumFramesInBuffer := 18 ;
//    Cam1.TriggerMode := CamExtTrigger ;//camFreeRun ;

    //InitialiseImage ;
    Cam1.GetFrameBufferPointer( pFrameBuf ) ;
    Cam1.StartCapture ;
    FramePointer := 0 ;
    MostRecentFrame := -1 ;
    LastFrameDisplayed := MostRecentFrame ;
    GetImageInProgress := false ;

    bStopImage.Enabled := True ;

    TStart := TimeGetTime ;
    NumFramesAcquired := 0 ;
    NumFramesCaptured := 0 ;
    OldNumFramesAcquired := 0 ;
    PulseCounter := 5 ;

    SetImagePanels ;

    CameraTriggerBit := 1 ;

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

     if LiveImagingInProgress then ScanRequested := True ;
     bFullFrame.Enabled := True ;

     end;


procedure TMainFrm.bFullScaleClick(Sender: TObject);
// --------------------------------------------------------
// Set display grey scale to full intensity range of camera
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
       ScanRequested := True ;
       StopCamera ;
       end;

    end;

procedure TMainFrm.edGotoZPositionKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
       begin
       ZStage.MoveTo( edGoToZPosition.Value ) ;
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
         NumSubPixels := sqrt(Integer(cbCaptureMode.Items.Objects[cbCaptureMode.ItemIndex])) ;
         edNumPixelsPerZStep.Value := Max(Round((edMicronsPerZStep.Value*NumSubPixels)/MagnifiedCameraPixelSize),1);
         edMicronsPerZStep.Value := (edNumPixelsPerZStep.Value*MagnifiedCameraPixelSize)/NumSubPixels ;
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
         NumSubPixels := sqrt(Integer(cbCaptureMode.Items.Objects[cbCaptureMode.ItemIndex])) ;
         edMicronsPerZStep.Value := (edNumPixelsPerZStep.Value*MagnifiedCameraPixelSize)/NumSubPixels ;
         end;
end;


procedure TMainFrm.bGotoZPositionClick(Sender: TObject);
// -------------------------
// Go to specified Z position
// --------------------------
begin
    ZStage.MoveTo( edGoToZPosition.Value ) ;
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
     i,NumPixels,iStep : Integer ;
     z,zMean,zSD,zSum : Single ;
     iz,ZMin,ZMax,ZLo,ZHi,ZThreshold : Integer ;
     FrameType : Integer ;
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

    NumPixels := FrameWidth*FrameHeight - 4 ;
    FrameType := 0 ;
    if NumPixels < 2 then Exit ;

    iStep := Max(NumPixels div MaxPoints,1) ;

    if ckContrast6SDOnly.Checked then
       begin
       // Set contrast range to +/- 3 x standard deviation
       ZSum := 0.0 ;
       for i := 0 to NumPixels - 1 do
          begin
          ZSum := ZSum + pImBuf^[i] ;
          end ;
       ZMean := ZSum / NumPixels ;

       ZSum := 0.0 ;
       i := 0 ;
       repeat
          Z :=pImBuf^[i] ;
          ZSum := ZSum + (Z - ZMean)*(Z - ZMean) ;
          i := i + iStep ;
       until i >= NumPixels ;
       ZSD := Sqrt( ZSum / (NumPixels-1) ) ;

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


procedure TMainFrm.TimerTimer(Sender: TObject);
// -------------------------
// Regular timed operations
// --------------------------
var
    iDev,iChan : Integer ;
begin
    //if pImageBuf = Nil then Exit ;

    // Camera exposure trigger
    if timegettime >= NextCameraTrigger then
       begin
       if Cam1.CameraActive and (not LiveImagingInProgress) then Cam1.SoftwareTriggerCapture ;
       NextCameraTrigger := timegettime + 1000 + Round(edExposureTime.Value*1000) ;
       end;
    iDev := LabIO.Resource[CameraTriggerOutput].Device ;
    iChan := LabIO.Resource[CameraTriggerOutput].StartChannel ;
//    LabIO.SetBit(LabIO.DigOutState[iDev],iChan,CameraTriggerBit) ;
 //   if CameraTriggerBit <> 0 then Cam1.SoftwareTriggerCapture ;
    CameraTriggerBit := 0 ;

{    if TriggerCameraExposure then
       begin
       LabIO.SetBit(LabIO.DigOutState[iDev],iChan,1) ;
       TriggerCameraExposure := False ;
       end
    else
    if PulseCounter <= 0 then begin
//       LabIO.SetBit(LabIO.DigOutState[iDev],iChan,1) ;
       PulseCounter := Round((0.5 + edExposureTime.Value)*1000.0) div Timer.Interval ;
       end
    else begin
       Dec(PulseCounter) ;
//       LabIO.SetBit(LabIO.DigOutState[iDev],iChan,0) ;
       end ;}

    for iDev := 1 to LabIO.NumDevices do begin
        LabIO.WriteToDigitalOutPutPort( iDev, LabIO.DigOutState[iDev] ) ;
        end;

    // Re-start image acquisition
    if ScanRequested then
       begin
       ScanRequested := False ;
    //   StartCamera ;
       StartCamera ;
       NextCameraTrigger := timegettime + 2000 ;
       UpdateImage ;
    end ;

    if UpdateDisplay then
       begin ;
       UpdateImage ;
       UpdateDisplay := False ;
       end ;

    GetImage ;

    if ZStage.Enabled then
       begin
       ZStage.UpdateZPosition ;
       edZTop.Text := format('%.2f um',[ZStage.ZPosition]) ;
       end;

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
    LightSource.Update ;
    end;


procedure TMainFrm.GetImage ;
// ---------------------
// Get and process image
// ---------------------
var
    i,j,iFrame,nTemp : Integer ;
    nShifts,x,y,ifrom,ito,iComp : Integer ;
    FrameRate : single ;
    t1 : Integer ;
    pBuf : Pointer ;
    xshift : array[0..8] of Integer ;
    yshift : array[0..8] of Integer ;
begin

    if GetImageInProgress then Exit ;
    if not Cam1.CameraActive then Exit ;
    GetImageInProgress := True ;
    ScanningInProgress := True ;

    // Read images from camera
    Cam1.ReadCamera ;

    t1 := TimeGetTime ;

    // Find latest unfilled frame
    if Cam1.FrameCount > 0 then
       begin
       MostRecentFrame := (Cam1.FrameCount-1) mod Cam1.NumFramesInBuffer ;
 //     if  NumFramesAcquired <> Cam1.FrameCount then Cam1.SoftwareTriggerCapture ;//CameraTriggerBit := 1 ;
       NumFramesAcquired := Cam1.FrameCount ;
       end;

    if MostRecentFrame <> LastFrameDisplayed then
       begin
       // Copy image from circular buffer into 32 bit display buffer
       j := MostRecentFrame*Cam1.NumComponentsPerFrame ;
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
       LastFrameDisplayed := MostRecentFrame ;
       end ;

    // Copy to capture buffer
    if (not bCaptureImage.Enabled) and (NumFramesCaptured < NumFramesAcquired) then
       begin
       while NumFramesCaptured < NumFramesAcquired do
           begin
           Inc(NumFramesCaptured) ;
           end;
       end;

    if TimeGetTime <> TStart then FrameRate := (1000.0*NumFramesAcquired) /(TimeGetTime-TStart)
                             else FrameRate := 0.0 ;

    if LiveImagingInProgress then
       begin
       edStatus.Text := format('Live: Frame %2d/%2d (%5.2f FPS)',[Cam1.FrameCount mod Cam1.NumFramesInBuffer,Cam1.NumFramesInBuffer,FrameRate]);
       edZStatus.Text := '' ;
       end
    else
       begin

       if ckAcquireZStack.Checked then
          begin
          edStatus.Text := format('Capture: Frame %2d/%2d',[Cam1.FrameCount,Cam1.NumPixelShiftFrames]);
          edZStatus.Text := format('Z Section: %2d/%2d',[NumZSectionsAvailable+1,Round(edNumZSections.Value)]);
          end
       else
          begin
          edStatus.Text := format('Capture: Frame %2d/%2d',[Cam1.FrameCount,Cam1.NumPixelShiftFrames]);
          edZStatus.Text := '' ;
          end ;
       end ;

    if (not bCaptureImage.Enabled) and (Cam1.FrameCount >= NumFramesRequired) then
       begin

       edStatus.Text := 'Capture: Processing' ;
       Application.ProcessMessages ;

       Cam1.StopCapture ;
       nTemp := Cam1.NumPixelShiftFrames ;
       Cam1.NumPixelShiftFrames := 1 ;
       Cam1.NumPixelShiftFrames := nTemp ;

       nShifts := Round(sqrt(Cam1.NumPixelShiftFrames)) ;
       HRFrameWidth := Cam1.FrameWidth*nShifts ;
       HRFrameHeight := Cam1.FrameHeight*nShifts ;
   //    HRFrameWidth := FrameWidth ;
   //    HRFrameHeight := FrameHeight ;
       HRNumComponentsPerPixel := Cam1.NumComponentsPerPixel ;
       HRNumComponentsPerFrame := HRFrameWidth*HRFrameHeight*HRNumComponentsPerPixel ;

       if PImageBuf <> Nil then FreeMem(PImageBuf) ;
       PImageBuf := GetMemory( Int64(HRNumComponentsPerFrame)*SizeOf(Integer)) ;
       outputdebugstring(pchar(format('numpix=%d',[HRNumComponentsPerFrame])));
       //InitialiseImage ;

       // Copy to display buffer
       case Cam1.NumPixelShiftFrames of
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

       for iFrame := 0 to Cam1.NumPixelShiftFrames-1 do
           begin
           pBuf := Pointer(NativeUInt(PByte(pFrameBuf)) + NativeUInt(Cam1.NumBytesPerFrame)*NativeUInt(iFrame)) ;
           for y := 0 to Cam1.FrameHeight-1 do
               begin
               ifrom := y*Cam1.FrameWidth*Cam1.NumComponentsPerPixel ;
               ito := ((y*nShifts + yShift[iFrame])*HRFrameWidth + xShift[iFrame])*Cam1.NumComponentsPerPixel ;
               if Cam1.NumBytesPerPixel = 1 then
                  begin
                  for x := 0 to Cam1.FrameWidth-1 do
                      begin
                      for iComp := 0 to Cam1.NumComponentsPerPixel-1 do
                          pImageBuf^[ito+iComp] := PByteArray(pBuf)^[ifrom+iComp] ;
                      ifrom := ifrom + Cam1.NumComponentsPerPixel ;
                      ito := ito + nShifts*Cam1.NumComponentsPerPixel ;
                      end;
                  end
               else
                  begin
                  for x := 0 to Cam1.FrameWidth-1 do begin
                      for iComp := 0 to Cam1.NumComponentsPerPixel-1 do
                          pImageBuf^[ito+iComp] := PWordArray(pBuf)^[ifrom+iComp] ;
                      ifrom := ifrom + Cam1.NumComponentsPerPixel ;
                      ito := ito + nShifts*Cam1.NumComponentsPerPixel ;
                      end;
                  end;
               end;
           end ;

{      if Cam1.NumPixelShiftFrames = 9 then
         begin

         // Interleave 3x3 pixel shifted LR images into HR image

         for y := 0 to HRFrameHeight-1 do
             begin
             j := HRFrameWidth*y ;
             PWordArray(pFrameBuf)[j] := pImageBuf^[j] ;
             PWordArray(pFrameBuf)[j+1] := pImageBuf^[j+1] ;
             end ;
         for x := 0 to HRFrameWidth-1 do
             begin
             PWordArray(pFrameBuf)[x] := pImageBuf^[x] ;
             PWordArray(pFrameBuf)[x+HRFrameWidth] := pImageBuf^[x+HRFrameWidth] ;
             end ;

         for y := 2 to HRFrameHeight-3 do
             begin
             for x := 2 to HRFrameWidth-3 do
                 begin
                 j := HRFrameWidth*y + x ;
                 Sum := 0 ;
                 for dy  := -2 to 2 do
                     for dx  := -2 to 2 do Sum := Sum + pImageBuf^[j+dy*HRFrameWidth+dx] ;
                 PWordArray(pFrameBuf)[j] := Sum div 25 ;
                 end;
             end ;
         for i := 0 to HRFrameHeight*HRFrameWidth-1 do pImageBuf^[i] := PWordArray(pFrameBuf)[i] ;

         end
       else if Cam1.NumPixelShiftFrames = 4 then
         begin

         // Interleave 2x2 pixel shifted LR images into HR image

         for y := 0 to HRFrameHeight-1 do
             begin
             j := HRFrameWidth*y ;
             PWordArray(pFrameBuf)[j] := pImageBuf^[j] ;
             end ;
         for x := 0 to HRFrameWidth-1 do
             begin
             PWordArray(pFrameBuf)[x] := pImageBuf^[x] ;
             end ;

         for y := 1 to HRFrameHeight-2 do
              begin
              for x := 1 to HRFrameWidth-2 do
                  begin
                  j := HRFrameWidth*y + x ;
                  PWordArray(pFrameBuf)[j] := pImageBuf^[j] +
                      (pImageBuf^[j-HRFrameWidth] + pImageBuf^[j+HRFrameWidth] + pImageBuf^[j+1] + pImageBuf^[j-1]) div 2 +
                      (pImageBuf^[(j-HRFrameWidth)-1] + pImageBuf^[(j-HRFrameWidth)+1]) div 4 +
                      (pImageBuf^[(j+HRFrameWidth)-1] + pImageBuf^[(j+HRFrameWidth)+1]) div 4 ;
                  end;
              end ;

         for i := 0 to HRFrameHeight*HRFrameWidth-1 do pImageBuf^[i] := PWordArray(pFrameBuf)[i] div 4 ;
         end ;  }

      // Save to raw image file
       edStatus.Text := 'Capture: Saving' ;
       Application.ProcessMessages ;
       Inc(NumImagesInFile) ;
       SaveRawImage( RawImagesFileName, NumImagesInFile-1 ) ;

       InitialiseImage ;

       edStatus.Text := 'Capture: Done' ;

       // Light source control
       // (Image capture request is made if not at end of light source list)
       ScanRequested := not SelectNextLightSource(false) ;

       // Z stage control
       if (not ScanRequested) and ckAcquireZStack.Checked then
         begin
         scZSection.Max := NumZSectionsAvailable ;
         scZSection.Position := NumZSectionsAvailable ;
         Inc(NumZSectionsAvailable) ;
         lbZSection.Caption := Format('Section %d/%d',[NumZSectionsAvailable,Round(edNumZSections.Value)]);

         if NumZSectionsAvailable < Round(edNumZSections.Value) then
            begin
            // Increment Z position to next section
            ZStage.MoveTo( ZStage.ZPosition + ZStep );
            ScanRequested := True ;
            end ;
         end ;

       if not ScanRequested then
         begin
         // All images captured - stop
         ShowCameraImage := False ;
         ShowCapturedImage := True ;
         UpdateImage ;
         bStopImage.Click ;
         UpdateDisplay := True ;
         end;
       end ;

GetImageInProgress := False ;
UpdateDisplay := True ;

end ;


function TMainFrm.SelectNextLightSource( Initialise : Boolean ) : Boolean ;
// -----------------------------------------------------------
// Select next light source in separate light sources sequence
// Return TRUE if last light source in sequence done
// -----------------------------------------------------------
var
    i : Integer ;
begin

    // Get light source settings from panel
    GetAllLightSourcePanels ;

    // No. of light sources in
    LightSource.NumList := 0 ;
    for i := 0 to High(LightSource.Active) do if LightSource.Active[i] then
        begin
        LightSource.List[LightSource.NumList] := i ;
        Inc(LightSource.NumList) ;
        end;

    if not Initialise then LightSource.ListIndex := LightSource.ListIndex + 1
                      else LightSource.ListIndex := 0 ;

    if not ckSeparateLightSources.Checked then
       begin
       // Turn all selected on and exit
       Result := True ;
       LightSource.ListIndex := 0 ;
       LightSource.NumList := 1 ;
       LightSource.Update ;
       exit ;
       end;

    // Return TRUE if at end of sequence
    if LightSource.ListIndex = LightSource.NumList then Result := True
                                                   else Result := False ;
    // Keep cycle to start of list
    if LightSource.ListIndex >= LightSource.NumList then LightSource.ListIndex := 0 ;

    // Update selected light source
    for i := 0 to High(LightSource.Active) do LightSource.Active[i] := False ;
    LightSource.Active[LightSource.ListIndex] := True ;
    LightSource.Update ;

    end;


procedure TMainFrm.bSelectedRegionClick(Sender: TObject);
// ---------------------------
// Set new frame capture area
// ---------------------------
begin


    if LiveImagingInProgress then StopCamera ;

     bSelectedRegion.Enabled := False ;

     CCDRegion.Right := (SelectedRectBM.Right/XScaletoBM + XLeft +1)*(CCDRegion.Width/FrameWidth) + CCDRegion.Left ;
     CCDRegion.Left := (SelectedRectBM.Left/XScaletoBM + XLeft)*(CCDRegion.Width/FrameWidth) + CCDRegion.Left;
     CCDRegion.Width := CCDRegion.Right - CCDRegion.Left ;

     CCDRegion.Bottom := (SelectedRectBM.Bottom/YScaletoBM - YTop +1)*(CCDRegion.Height/FrameHeight) + CCDRegion.Top ;
     CCDRegion.Top := (SelectedRectBM.Top/YScaletoBM - YTop)*(CCDRegion.Height/FrameHeight) + CCDRegion.Top ;
//     if LiveImagingInProgress then CCDRegion.Top := 0.0 ;
     CCDRegion.Height := CCDRegion.Bottom - CCDRegion.Top ;

     SelectedRect.Left := 0 ;
     SelectedRect.Right := 1.0 ;
     SelectedRect.Width := 1.0 ;
     SelectedRect.Top := 0.0 ;
     SelectedRect.Bottom := 1.0 ;
     SelectedRect.Height := 1.0 ;

     if LiveImagingInProgress then ScanRequested := True ;
     bSelectedRegion.Enabled := True  ;

end;


procedure TMainFrm.bStopImageClick(Sender: TObject);
// -------------
// Stop scanning
// -------------
//var
//    FileHandle : Integer ;
begin

    if LabIO.ADCActive[DeviceNum] then LabIO.StopADC(DeviceNum) ;
    if LabIO.DACActive[DeviceNum] then LabIO.StopDAC(DeviceNum) ;

    Cam1.StopCapture ;

    // Move Z stage back to starting position
    if ckAcquireZStack.Checked then
       begin
       ZStage.MoveTo( ZStartingPosition );
       scZSection.Position := 0 ;
       end;

    GetAllLightSourcePanels ;
    SetImagePanels ;

    // Reload image
    if not LiveImagingInProgress then
       begin
       LoadRawImage( RawImagesFileName, (scZSection.Position*LightSource.NumList) + Page.TabIndex ) ;
       UpdateDisplay := True ;
       end;

    bStopImage.Enabled := False ;
    bLiveImage.Enabled := True ;
    bCaptureImage.Enabled := True ;
    LiveImagingInProgress := False ;
    ScanRequested := False ;
    ScanningInProgress := False ;

    end;



procedure TMainFrm.cbCameraGainChange(Sender: TObject);
// ---------------------
// Gain changed
// ---------------------
begin
    if LiveImagingInProgress then
       begin
       ScanRequested := True ;
       StopCamera ;
       end;
    CameraGainIndex := cbCameraGain.ItemIndex
    end;

procedure TMainFrm.cbCaptureModeChange(Sender: TObject);
var
    NumSubPixels : Double ;
begin
    NumSubPixels := sqrt(Integer(cbCaptureMode.Items.Objects[cbCaptureMode.ItemIndex])) ;
    edNumPixelsPerZStep.Value := Max(Round((edMicronsPerZStep.Value*NumSubPixels)/MagnifiedCameraPixelSize),1) ;
    edMicronsPerZStep.Value := (edNumPixelsPerZStep.Value*MagnifiedCameraPixelSize)/NumSubPixels ;
    end;


procedure TMainFrm.cbLiveBinChange(Sender: TObject);
// -------------------------
// Live binning mode changed
// -------------------------
begin
   if LiveImagingInProgress then
      begin
      StopCamera ;
      ScanRequested := True ;
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



procedure TMainFrm.ckAcquireZStackClick(Sender: TObject);
// -------------------------------
// Acquire Z stack setting changed
// -------------------------------
begin
    ZStackGrp.Visible := ckAcquireZStack.Checked ;
    resize ;
    end;


procedure TMainFrm.ckLightSourceOnClick(Sender: TObject);
// -------------------------------------
// Light source on/off check box changed
// -------------------------------------
begin
    GetAllLightSourcePanels ;
    LightSource.Update ;
    SetImagePanels ;
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

     SettingsFrm.Left := MainFrm.Left + 20 ;
     SettingsFrm.Top := MainFrm.Top + 20 ;
     SettingsFrm.ShowModal ;

     end;


procedure TMainFrm.PageChange(Sender: TObject);
// ----------------
// Tab page changed
// ----------------
begin
     ZSection := scZSection.Position ;
     LoadRawImage( RawImagesFileName, (ZSection*LightSource.NumList) + Page.TabIndex ) ;
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
    iSection,iPanel,nFrames : Integer ;
    iNum : Integer ;
    Exists : boolean ;
begin

     SaveDialog.InitialDir := SaveDirectory ;

     // Create an unused file name
     iNum := 1 ;
     repeat
        Exists := False ;
        FileName := SaveDialog.InitialDir + '\'
                    + FormatDateTime('yyyy-mm-dd',Now)
                    + format(' %d.tif',[iNum]) ;
        Exists := false ;
        for iPanel := 0 to NumPanels-1 do
            for iSection := 0 to Max(NumZSectionsAvailable,1)-1 do
                begin
                s := SectionFileName(FileName,iPanel,iSection) ;
                Exists := Exists or FileExists(SectionFileName(FileName,iPanel,iSection)) ;
                end;
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
         for iSection := 0 to Max(NumZSectionsAvailable,1)-1 do
             begin
             Exists := Exists or FileExists(SectionFileName(FileName,iPanel,iSection)) ;
             if Exists then
                begin
                if MessageDlg( format(
                   'File %s already exists! Do you want to overwrite it? ',[SectionFileName(FileName,iPanel,iSection)]),
                   mtWarning,[mbYes,mbNo], 0 ) = mrNo then Exit ;
                Break ;
                end ;
             end;

     // Save image
     for iPanel := 0 to NumPanels-1 do
         begin
         for iSection  := 0 to Max(NumZSectionsAvailable,1)-1 do
             begin

             // Load image
             LoadRawImage( RawImagesFileName, iSection*NumPanels + iPanel ) ;

             // Create file
             if (not SaveAsMultipageTIFF) or (iSection = 0) then
                begin

                // Save individual (or first) section in stack
                if SaveAsMultipageTIFF then nFrames := Max(NumZSectionsAvailable,1)
                                       else nFrames := 1 ;

                if not ImageFile.CreateFile( SectionFileName(FileName,iPanel,iSection),
                                             HRFrameWidth,
                                             HRFrameHeight,
                                             NumBitsPerPixel,
                                             HRNumComponentsPerPixel,
                                             nFrames ) then Exit ;
                ImageFile.XResolution := MagnifiedCameraPixelSize / sqrt(Cam1.NumPixelShiftFrames) ;
                ImageFile.YResolution := ImageFile.XResolution ;
                ImageFile.ZResolution := ZStep ;
                ImageFile.SaveFrame32( 1, PImageBuf ) ;
                if not SaveAsMultipageTIFF then ImageFile.CloseFile ;
                end
             else
                begin
                // Save subsequent sections of stack
                ImageFile.SaveFrame32( iSection+1, PImageBuf ) ;
                end;
             end ;

         // Close file (if a multipage TIFF)
         if SaveAsMultipageTIFF then ImageFile.CloseFile ;

         end;

     // Open in Image-J window
     if OpenImageJ and FileExists(ImageJPath) then
        begin
        if SaveAsMultipageTIFF then nFrames := 1
                               else nFrames := Max(NumZSectionsAvailable,1) ;
        for iPanel := 0 to NumPanels-1 do
            for iSection := 0 to nFrames-1 do
                ShellExecute( Handle,
                      PChar('open'),
                      PChar('"'+ImageJPath+'"'),
                      PChar('"'+SectionFileName(FileName,iPanel,iSection)+'"'),
                      nil,
                      SW_SHOWNORMAL) ;
        end ;

     UnsavedRawImage := False ;

end;


function TMainFrm.SectionFileName(
         FileName : string ;   // Base file name
         iPanel : Integer ;    // Image panel #
         iSection : Integer    // Z section #
         ) : string ;
// ------------------------------------------
// Return file name to of Channel / Z section
// ------------------------------------------
begin

     if (NumZSectionsAvailable > 1) and (not SaveAsMultipageTIFF) then
        begin
        Result := ANSIReplaceText( FileName, '.tif',
                  format('.%s.%d.ome.tif',[PanelName[iPanel],iSection+1])) ;
        end
     else
        begin
        Result := ANSIReplaceText( FileName, '.tif',
                  format('.%s.%d.ome.tif',[PanelName[iPanel],iSection+1])) ;
        end;
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

  Page.Width := Max(ClientWidth - Page.Left - 5,2) ;
  Page.Height := Max(ClientHeight - Page.Top - 5 - ZSectionPanel.Height,2) ;

  ZSectionPanel.Top := Page.Top + Page.Height + 2 ;
  ZSectionPanel.Left := Page.Left + Page.Width - ZSectionPanel.Width ;

  DisplayModeGrp.Left := Page.Left ;
  DisplayModeGrp.Top := ZSectionPanel.Top ;
  lbReadout.Top :=  ZSectionPanel.Top ;
  lbReadout.Left := DisplayModeGrp.Left + DisplayModeGrp.Width + 5 ;

  DisplayMaxWidth := tbChan0.ClientWidth - Image0.Left - 5 ;
  DisplayMaxHeight := tbChan0.ClientHeight - Image0.Top - 5 - ZSectionPanel.Height ;

  SetImagePanels ;

  // Image type group
  if ZStackGrp.Visible then begin
     ImageSizeGrp.ClientHeight := ZStackGrp.Top + ZStackGrp.Height + 5 ;
     end
  else ImageSizeGrp.ClientHeight := ZStackGrp.Top ;

  // Set light source panels
  iTop := 16 ;
  SetLightSourcePanel(0,pnLightSource0,iTop ) ;
  SetLightSourcePanel(1,pnLightSource1,iTop ) ;
  SetLightSourcePanel(2,pnLightSource2,iTop ) ;
  SetLightSourcePanel(3,pnLightSource3,iTop ) ;
  SetLightSourcePanel(4,pnLightSource4,iTop ) ;
  SetLightSourcePanel(5,pnLightSource5,iTop ) ;
  SetLightSourcePanel(6,pnLightSource6,iTop ) ;
  SetLightSourcePanel(7,pnLightSource7,iTop ) ;
  LightSourceGrp.ClientHeight := iTop + 10 ;

  ZStageGrp.Top := ImageSizeGrp.Top + ImageSizeGrp.Height + 5 ;
  LightSourceGrp.Top := ZStageGrp.Top + ZStageGrp.Height + 5 ;
  DisplayGrp.Top := LightSourceGrp.Top + LightSourceGrp.Height + 5 ;
  StatusGrp.Top := DisplayGrp.Top +DisplayGrp.Height + 5 ;

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

      if LightSource.ControlLines[Num] < LineDisabled then Panel.Visible := True
                                                      else Panel.Visible := False ;
      if Panel.Visible then begin
         Panel.Top := iTop ;
         iTop := iTop + Panel.Height ;
         end;

      // Set On check box
      for i := 0 to 3 do if Panel.Controls[i].Tag = 0 then
           TCheckBox(Panel.Controls[i]).Checked := LightSource.Active[Num] ;

      // Set name
      for i := 0 to 3 do if Panel.Controls[i].Tag = 1 then
          TEdit(Panel.Controls[i]).Text := LightSource.Names[Num] ;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 2 then
          TTrackBar(Panel.Controls[i]).Position := Round(LightSource.Intensity[Num]) ;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 3 then
          TValidatedEdit(Panel.Controls[i]).Value :=LightSource.Intensity[Num]

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


procedure TMainFrm.scZSectionChange(Sender: TObject);
// ---------------
// Z Section changed
// ---------------
begin
     ZSection := scZSection.Position ;
     LoadRawImage( RawImagesFileName, (ZSection*LightSource.NumList) + Page.TabIndex ) ;
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

      // Copy into I/O buf
      NumBytes := Int64(HRNumComponentsPerFrame)*Int64(SizeOf(Word)) ;
      pBufW := GetMemory( NumBytes ) ;

      // Copy from image buffer
      for i := 0 to HRNumComponentsPerFrame-1 do pBufW^[i] := WORD(pImageBuf^[i]) ;

      if not FileExists(FileName) then FileHandle := FileCreate( FileName )
                                  else FileHandle := FileOpen( FileName, fmOpenWrite ) ;

      NumImagesInFile := Max(NumImagesInFile,iImage+1) ;

      FileWrite( FileHandle, NumImagesInFile, Sizeof(NumImagesInFile)) ;
      FileWrite( FileHandle, HRFrameWidth, Sizeof(HRFrameWidth)) ;
      FileWrite( FileHandle, HRFrameHeight, Sizeof(HRFrameHeight)) ;
      FileWrite( FileHandle, HRNumComponentsPerFrame, Sizeof(HRNumComponentsPerFrame)) ;
      FileWrite( FileHandle, NumBitsPerPixel, Sizeof(NumBitsPerPixel)) ;

      FileWrite( FileHandle, ZStep, Sizeof(ZStep)) ;

      FilePointer := FileSeek( FileHandle, 0, 1 ) ;
      FilePointer := FilePointer + Int64(iImage)*NumBytes ;
      FileSeek( FileHandle, FilePointer, 0 ) ;
      FileWrite( FileHandle, pBufW^, NumBytes ) ;
      FileClose(FileHandle) ;

      FreeMem(pBufW) ;

      RawImageAvailable := True ;

      end;


procedure TMainFrm.LoadRawImage(
          FileName : String ;    // File to save to
          iSection : Integer     // Image Section number
          ) ;
// ----------------------
// Load raw image to file
// ----------------------
var
    FileHandle : THandle ;
    FilePointer,NumBytes : Int64 ;
    i : DWORD ;
    pBufW : PWordArray ;
begin

      if not RawImageAvailable then Exit ;

      FileHandle := FileOpen( FileName, fmOpenRead ) ;

      FileRead( FileHandle, NumImagesInFile, Sizeof(NumImagesInFile)) ;
      FileRead( FileHandle, HRFrameWidth, Sizeof(HRFrameWidth)) ;
      FileRead( FileHandle, HRFrameHeight, Sizeof(HRFrameHeight)) ;
      FileRead( FileHandle, HRNumComponentsPerFrame, Sizeof(HRNumComponentsPerFrame)) ;
      FileRead( FileHandle, NumBitsPerPixel, Sizeof(NumBitsPerPixel)) ;
      FileRead( FileHandle, ZStep, Sizeof(ZStep)) ;

      NumBytes := HRNumComponentsPerFrame*2 ;
      pBufW := GetMemory( NumBytes ) ;

      FilePointer := FileSeek( FileHandle, 0, 1 ) ;
      FilePointer := FilePointer + Int64(iSection)*NumBytes ;
      FileSeek( FileHandle, FilePointer, 0 ) ;
      FileRead( FileHandle, pBufW^, NumBytes) ;

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

    AddElementDouble( ProtNode, 'EXPOSURETIME', edExposureTime.Value ) ;

    CameraGainIndex := cbCameraGain.ItemIndex ;
    AddElementInt( ProtNode, 'CAMERAGAIN', CameraGainIndex ) ;

    AddElementInt( ProtNode, 'HRFRAMEWIDTH', HRFrameWidth ) ;
    AddElementBool( ProtNode,'ROIMODE', rbROIMode.Checked ) ;

    AddElementInt( ProtNode, 'PALETTE', cbPalette.ItemIndex ) ;

//    AddElementDouble( ProtNode, 'LASERINTENSITY', LaserIntensity ) ;
//    AddElementDouble( ProtNode, 'ADCVOLTAGERANGE', ADCVoltageRange ) ;

    AddElementInt( ProtNode, 'CAMERATRIGGEROUTPUT', MainFrm.CameraTriggerOutput ) ;
    AddElementBool( ProtNode, 'CAMERATRIGGERACTIVEHIGH', MainFrm.CameraTriggerActiveHigh ) ;

    // Z stack
    iNode := ProtNode.AddChild( 'ZSTACK' ) ;
    AddElementInt( iNode, 'NUMZSECTIONS', Round(edNUMZSections.Value) ) ;
    AddElementInt( iNode, 'NUMPIXELSPERZSTEP', Round(edNumPixelsPerZStep.Value) ) ;

    // Light sources

    for i := 0 to High(LightSource.ControlLines) do begin
        iNode := ProtNode.AddChild( 'LIGHTSOURCE' ) ;
        AddElementInt( iNode, 'NUMBER', i ) ;
        AddElementText( iNode, 'NAME', LightSource.Names[i] ) ;
        AddElementInt( iNode, 'CONTROLLINE', LightSource.ControlLines[i] ) ;
        AddElementDouble( iNode, 'MINLEVEL', LightSource.MinLevel[i] ) ;
        AddElementDouble( iNode, 'MAXLEVEL', LightSource.MaxLevel[i] ) ;
        end;

    // Z stage
    iNode := ProtNode.AddChild( 'ZSTAGE' ) ;
    AddElementInt( iNode, 'STAGETYPE', ZStage.StageType ) ;
    AddElementBool( iNode, 'ENABLED', ZStage.Enabled ) ;
    AddElementInt( iNode, 'CONTROLPORT', ZStage.ControlPort ) ;
    AddElementInt( iNode, 'BAUDRATE', ZStage.BaudRate ) ;
    AddElementDouble( iNode, 'ZSCALEFACTOR', ZStage.ZScaleFactor ) ;
    AddElementDouble( iNode, 'ZSTEPTIME', ZStage.ZStepTime ) ;

    AddElementDouble( ProtNode, 'LENSMAGNIFICATION', LensMagnification ) ;
    AddElementDouble( ProtNode, 'CAMERAPIXELSIZE', CameraPixelSize ) ;

    AddElementText( ProtNode, 'SAVEDIRECTORY', SaveDirectory ) ;
    AddElementText( ProtNode, 'IMAGEJPATH', ImageJPath ) ;
    AddElementBool( ProtNode, 'SAVEASMULTIPAGETIFF', SaveAsMultipageTIFF ) ;

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

    edExposureTime.Value := GetElementDouble( ProtNode, 'EXPOSURETIME', edExposureTime.Value ) ;
    CameraGainIndex := GetElementInt( ProtNode, 'CAMERAGAIN', CameraGainIndex ) ;

    HRFrameWidth := GetElementInt( ProtNode, 'HRFRAMEWIDTH', HRFrameWidth ) ;
    rbROIMode.Checked := GetElementBool( ProtNode,'ROIMODE', rbROIMode.Checked ) ;
    rbZoomMode.Checked := not rbROIMode.Checked ;

    cbPalette.ItemIndex := GetElementInt( ProtNode, 'PALETTE', cbPalette.ItemIndex ) ;
    PaletteType := TPaletteType(cbPalette.Items.Objects[cbPalette.ItemIndex]) ;

//    LaserIntensity := GetElementDouble( ProtNode, 'LASERINTENSITY', LaserIntensity ) ;

    CameraTriggerOutput := GetElementInt( ProtNode, 'CAMERATRIGGEROUTPUT', CameraTriggerOutput ) ;
    CameraTriggerActiveHigh := GetElementBool( ProtNode, 'CAMERATRIGGERACTIVEHIGH', CameraTriggerActiveHigh ) ;

    NodeIndex := 0 ;
    While FindXMLNode(ProtNode,'ZSTACK',iNode,NodeIndex) do
       begin
       edNUMZSections.Value := GetElementInt( iNode, 'NUMZSECTIONS', Round(edNUMZSections.Value) ) ;
       edNumPixelsPerZStep.Value := GetElementInt( iNode, 'NUMPIXELSPERZSTEP', Round(edNumPixelsPerZStep.Value) ) ;
       Inc(NodeIndex) ;
       end ;

    // Light source control
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
           end ;
        Inc(NodeIndex);
        end;

    // Z stage
    NodeIndex := 0 ;
    While FindXMLNode(ProtNode,'ZSTAGE',iNode,NodeIndex) do
      begin
      ZStage.StageType := GetElementInt( iNode, 'STAGETYPE', Round(ZStage.StageType) ) ;
      ZStage.Enabled := GetElementBool( iNode, 'ENABLED', ZStage.Enabled ) ;
      ZStage.ControlPort := GetElementInt( iNode, 'CONTROLPORT', Round(ZStage.ControlPort) ) ;
      ZStage.BaudRate := GetElementInt( iNode, 'BAUDRATE', Round(ZStage.BaudRate)  ) ;
      ZStage.ZScaleFactor := GetElementDouble( iNode, 'ZSCALEFACTOR', ZStage.ZScaleFactor ) ;
      ZStage.ZStepTime := GetElementDouble( iNode, 'ZSTEPTIME', ZStage.ZStepTime ) ;
      Inc(NodeIndex) ;
      end ;

    LensMagnification := GetElementDouble( ProtNode, 'LENSMAGNIFICATION', LensMagnification ) ;
    CameraPixelSize := GetElementDouble( ProtNode, 'CAMERAPIXELSIZE', CameraPixelSize ) ;
    MagnifiedCameraPixelSize := CameraPixelSize / Max(LensMagnification,1E-3) ;

    SaveDirectory := GetElementText( ProtNode, 'SAVEDIRECTORY', SaveDirectory ) ;
    ImageJPath := GetElementText( ProtNode, 'IMAGEJPATH', ImageJPath ) ;
    SaveAsMultipageTIFF := GetElementBool( ProtNode, 'SAVEASMULTIPAGETIFF', SaveAsMultipageTIFF ) ;

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

