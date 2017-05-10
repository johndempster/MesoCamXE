unit SettingsUnit;
// ------------------------------------
// MesoScan - Scan Settings dialog box
// ------------------------------------
// 1-6-12 MinPixelDwellTimeAdded
// 29.11.16 Lens table added
// 16.01.17 ZStage.XScaleFactor and ZStage.YScaleFactor added
// 22.03.17 USB-controlled CoolLED pE-x support added
// 10.05.17 ZPositionMin, ZPositionMax limits added

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ValidatedEdit, math,
  Vcl.ExtCtrls,LabIOUnit,LightSourceUnit, Vcl.ComCtrls, Vcl.Grids ;

type
  TSettingsFrm = class(TForm)
    bOK: TButton;
    bCancel: TButton;
    Page: TPageControl;
    CameraTab: TTabSheet;
    GroupBox4: TGroupBox;
    Label41: TLabel;
    cbCamera: TComboBox;
    ModePanel: TPanel;
    lbCameraMode: TLabel;
    cbCameraMode: TComboBox;
    ComPanel: TPanel;
    lbComPort: TLabel;
    cbCameraPort: TComboBox;
    ReadoutSpeedPanel: TPanel;
    Label1: TLabel;
    cbReadoutSpeed: TComboBox;
    edTemperatureSetPoint: TValidatedEdit;
    ADCPanel: TPanel;
    Label48: TLabel;
    cbCameraADC: TComboBox;
    CameraPanel: TPanel;
    Label77: TLabel;
    cbCameraNames: TComboBox;
    ckDisableExposureIntervalLimit: TCheckBox;
    CamTriggerPanel: TPanel;
    LightSourceTab: TTabSheet;
    LEDGrp: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ZStageTab: TTabSheet;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    cbZStagePort: TComboBox;
    edZScaleFactor: TValidatedEdit;
    cbZStageType: TComboBox;
    edZStepTime: TValidatedEdit;
    Label6: TLabel;
    pnLightSource0: TPanel;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    ValidatedEdit3: TValidatedEdit;
    ValidatedEdit4: TValidatedEdit;
    Label7: TLabel;
    pnLightSource1: TPanel;
    Edit3: TEdit;
    ComboBox3: TComboBox;
    ValidatedEdit5: TValidatedEdit;
    ValidatedEdit6: TValidatedEdit;
    pnLightSource2: TPanel;
    Edit4: TEdit;
    ComboBox4: TComboBox;
    ValidatedEdit7: TValidatedEdit;
    ValidatedEdit8: TValidatedEdit;
    pnLightSource3: TPanel;
    Edit5: TEdit;
    ComboBox5: TComboBox;
    ValidatedEdit9: TValidatedEdit;
    ValidatedEdit10: TValidatedEdit;
    pnLightSource4: TPanel;
    Edit6: TEdit;
    ComboBox6: TComboBox;
    ValidatedEdit11: TValidatedEdit;
    ValidatedEdit12: TValidatedEdit;
    pnLightSource5: TPanel;
    Edit7: TEdit;
    ComboBox7: TComboBox;
    ValidatedEdit13: TValidatedEdit;
    ValidatedEdit14: TValidatedEdit;
    pnLightSource6: TPanel;
    Edit8: TEdit;
    ComboBox8: TComboBox;
    ValidatedEdit15: TValidatedEdit;
    ValidatedEdit16: TValidatedEdit;
    pnLightSource7: TPanel;
    Edit9: TEdit;
    ComboBox9: TComboBox;
    ValidatedEdit17: TValidatedEdit;
    ValidatedEdit18: TValidatedEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    cbCameraTrigger: TComboBox;
    rbCameraTriggerActiveHigh: TRadioButton;
    rbCameraTriggerActiveLow: TRadioButton;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    edImageJPath: TEdit;
    ckSaveAsMultipageTIFF: TCheckBox;
    Label9: TLabel;
    edCameraPixelSize: TValidatedEdit;
    LensTab: TTabSheet;
    CalibrationGrp: TGroupBox;
    Label2: TLabel;
    Label11: TLabel;
    edNumLenses: TValidatedEdit;
    sgLensTable: TStringGrid;
    edRelayLensMagnification: TValidatedEdit;
    udNumLenses: TUpDown;
    edXScalefactor: TValidatedEdit;
    Label12: TLabel;
    edYScaleFactor: TValidatedEdit;
    Label14: TLabel;
    CoolLEDGrp: TGroupBox;
    cbLightSourceControlPort: TComboBox;
    Label15: TLabel;
    cbSourceType: TComboBox;
    lbSourceType: TLabel;
    Label16: TLabel;
    edZpositionMin: TValidatedEdit;
    Label17: TLabel;
    edZPositionMax: TValidatedEdit;
    procedure FormShow(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure cbZStageTypeChange(Sender: TObject);
    procedure cbCameraChange(Sender: TObject);
    procedure cbCameraNamesChange(Sender: TObject);
    procedure cbCameraADCChange(Sender: TObject);
    procedure cbCameraModeChange(Sender: TObject);
    procedure udNumLensesChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Integer; Direction: TUpDownDirection);
    procedure edNumLensesKeyPress(Sender: TObject; var Key: Char);
    procedure cbSourceTypeChange(Sender: TObject);
  private
    { Private declarations }
    procedure ShowLightSourcePanel ;
    procedure SetLightSourcePanel(
              Num : Integer ;
              Panel : TPanel ) ;
    procedure GetLightSourcePanel(
              Num : Integer ;
              Panel : TPanel ) ;

    procedure NewCamera(Reopen : Boolean) ;
  public
    { Public declarations }
  end;

var
  SettingsFrm: TSettingsFrm;

implementation

{$R *.dfm}

uses MainUnit, ZStageUnit;


procedure TSettingsFrm.FormShow(Sender: TObject);
// --------------------------
// Initialise form on display
// --------------------------
var
    i : Integer ;
    s : string ;
begin

     if MainFrm.Cam1.CameraActive then MainFrm.Cam1.StopCapture ;

     // Get camera library list
     MainFrm.Cam1.GetCameraLibList( cbCamera.Items ) ;
     cbCamera.ItemIndex := MainFrm.CameraType ;

     // Get names of available cameras
     MainFrm.Cam1.GetCameraNameList( cbCameraNames.Items ) ;
     cbCameraNames.ItemIndex := MainFrm.Cam1.SelectedCamera ;

     // Get camera COM port
     cbCameraPort.ItemIndex := MainFrm.Cam1.ComPort - 1 ;

     // Reset camera
     NewCamera(false) ;

    // Camera trigger output channel
    cbCameraTrigger.Clear ;
    cbCameraTrigger.Items.AddObject('Internal',TObject(MaxResources+1)) ;
    for i := 0 to LabIO.NumResources-1 do
        begin
        if (LabIO.Resource[i].ResourceType = DIGOut) then
           begin
           // Digital outputs
           s := format('Dev%d: PO.%d',[LabIO.Resource[i].Device,LabIO.Resource[i].StartChannel]) ;
           cbCameraTrigger.Items.AddObject(s,TObject(i))
           end ;
        end;

     cbCameraTrigger.ItemIndex := Max( 0,
     cbCameraTrigger.Items.IndexOfObject(TObject(MainFrm.CameraTriggerOutput))) ;
     rbCameraTriggerActiveHigh.Checked := MainFrm.CameraTriggerActiveHigh ;
     rbCameraTriggerActiveLow.Checked := not rbCameraTriggerActiveHigh.Checked ;

    // Z stage control
    ZStage.GetZStageTypes(cbZStageType.Items);
    cbZStageType.ItemIndex := Min(Max(ZStage.StageType,0),cbZStageType.Items.Count-1) ;

    ZStage.GetControlPorts(cbZStagePort.Items);
    cbZStagePort.ItemIndex := Min(Max(ZStage.ControlPort,0),cbZStagePort.Items.Count-1) ;

    // Light Sources
    LightSource.GetSourceTypes(cbSourceType.Items);
    cbSourceType.ItemIndex := LightSource.SourceType ;
    ShowLightSourcePanel ;

    // COM port list
    LightSource.GetControlPorts(cbLightSourceControlPort.Items);
    cbLightSourceControlPort.ItemIndex := Min(Max(LightSource.ControlPort,0),
                                          cbLightSourceControlPort.Items.Count-1) ;

    SetLightSourcePanel( 0, pnLightSource0 ) ;
    SetLightSourcePanel( 1, pnLightSource1 ) ;
    SetLightSourcePanel( 2, pnLightSource2 ) ;
    SetLightSourcePanel( 3, pnLightSource3 ) ;
    SetLightSourcePanel( 4, pnLightSource4 ) ;
    SetLightSourcePanel( 5, pnLightSource5 ) ;
    SetLightSourcePanel( 6, pnLightSource6 ) ;
    SetLightSourcePanel( 7, pnLightSource7 ) ;

    // Stage control

    edXScaleFactor.Units := ZStage.ScaleFactorUnits ;
    edXScaleFactor.Value := ZStage.XScaleFactor ;
    edYScaleFactor.Units := ZStage.ScaleFactorUnits ;
    edYScaleFactor.Value := ZStage.YScaleFactor ;
    edZScaleFactor.Units := ZStage.ScaleFactorUnits ;
    edZScaleFactor.Value := ZStage.ZScaleFactor ;
    edZStepTime.Value := ZStage.ZStepTime ;
    edZPositionMin.Value := ZStage.ZPositionMin ;
    edZPositionMax.Value := ZStage.ZPositionMax ;

    edNumLenses.Value := MainFrm.NumLenses ;
    sgLensTable.RowCount := MainFrm.NumLenses+1 ;
    sgLensTable.Cells[0,0] := ' Name  ' ;
    sgLensTable.ColWidths[0] := 90 ; //sgLensTable.Canvas.TextWidth(sgLensTable.Cells[0,0]);
    sgLensTable.Cells[1,0] := ' Magnification  ' ;
    sgLensTable.ColWidths[1] := 90 ;//sgLensTable.Canvas.TextWidth(sgLensTable.Cells[1,0]);

    for I := 0 to MainFrm.NumLenses-1 do
        begin
        sgLensTable.Cells[0,i+1] := MainFrm.LensName[i] ;
        sgLensTable.Cells[1,i+1] := format('%.4g',[MainFrm.LensMagnification[i]]);
        end;

    edRelayLensMagnification.Value := MainFrm.RelayLensMagnification ;
    edCameraPixelSize.Value := MainFrm.CameraPixelSize ;

    edImageJPath.Text := MainFrm.ImageJPath ;
    ckSaveAsMultipageTIFF.Checked := MainFrm.SaveAsMultipageTIFF ;

end;

procedure TSettingsFrm.ShowLightSourcePanel ;
// -----------------------------------------
// Show settings panel for light source type
// -----------------------------------------
begin
    // Select panel
    LEDGrp.Visible := False ;
    CoolLEDGrp.Visible := False ;
    case LightSource.SourceType of
         lsLED : LEDGrp.Visible := True ;
         lsCoolLED : CoolLEDGrp.Visible := True ;
         end ;
    end ;


procedure TSettingsFrm.bCancelClick(Sender: TObject);
// ---------------------
// Cancel and close form
// ---------------------
begin
     Close
     end;

procedure TSettingsFrm.bOKClick(Sender: TObject);
// --------------------------
// Update program settings
// --------------------------
var
  i,Code : Integer ;
begin

    // Light source
    GetLightSourcePanel( 0, pnLightSource0 ) ;
    GetLightSourcePanel( 1, pnLightSource1 ) ;
    GetLightSourcePanel( 2, pnLightSource2 ) ;
    GetLightSourcePanel( 3, pnLightSource3 ) ;
    GetLightSourcePanel( 4, pnLightSource4 ) ;
    GetLightSourcePanel( 5, pnLightSource5 ) ;
    GetLightSourcePanel( 6, pnLightSource6 ) ;
    GetLightSourcePanel( 7, pnLightSource7 ) ;

    MainFrm.CameraTriggerOutput := Integer(cbCameraTrigger.Items.Objects[cbCameraTrigger.ItemIndex]) ;
    MainFrm.CameraTriggerActiveHigh := rbCameraTriggerActiveHigh.Checked ;

    ZStage.ControlPort := cbZStagePort.ItemIndex ;
    ZStage.XScaleFactor := edXScaleFactor.Value ;
    ZStage.YScaleFactor := edYScaleFactor.Value ;
    ZStage.ZScaleFactor := edZScaleFactor.Value ;
    ZStage.ZStepTime := edZStepTime.Value ;
    ZStage.ZPositionMin := edZPositionMin.Value ;
    ZStage.ZPositionMax := edZPositionMax.Value ;

    LightSource.ControlPort := cbLightSourceControlPort.ItemIndex ;

    MainFrm.SetScanZoomToFullField ;
    MainFrm.NumLenses := Round(edNumLenses.Value);
    MainFrm.RelayLensMagnification := Max(edRelayLensMagnification.Value,0.001) ;
    for I := 0 to MainFrm.NumLenses-1 do
        begin
        MainFrm.LensName[i] := sgLensTable.Cells[0,i+1] ;
        Val(sgLensTable.Cells[1,i+1],MainFrm.LensMagnification[i],Code) ;
        end;

    MainFrm.CameraPixelSize := edCameraPixelSize.Value ;
    MainFrm.MagnifiedCameraPixelSize := MainFrm.CameraPixelSize/
                                        (MainFrm.RelayLensMagnification) ;

    // Update camera gain list
    MainFrm.Cam1.GetCameraGainList( MainFrm.cbCameraGain.Items );
    MainFrm.cbCameraGain.ItemIndex := 0 ;

    // Camera readout speed
    MainFrm.Cam1.ReadoutSpeed := cbReadoutSpeed.ItemIndex ;

    MainFrm.ImageJPath := edImageJPath.Text ;
    MainFrm.SaveAsMultipageTIFF := ckSaveAsMultipageTIFF.Checked ;

    Close ;
    end;


procedure TSettingsFrm.cbCameraADCChange(Sender: TObject);
begin
     MainFrm.Cam1.CameraADC := cbCameraADC.ItemIndex ;
     NewCamera(true) ;
     end;

procedure TSettingsFrm.cbCameraChange(Sender: TObject);
// --------------
// Camera changed
// --------------
begin

     NewCamera(true) ;

     // Set camera readout speed to maximum
     if cbReadoutSpeed.Visible then
        begin
        cbReadoutSpeed.ItemIndex := MainFrm.Cam1.DefaultReadoutSpeed ;
        end ;

end;

procedure TSettingsFrm.cbCameraModeChange(Sender: TObject);
begin
     MainFrm.Cam1.CameraMode := cbCameraMode.ItemIndex ;
//     MainFrm.Cam1.CameraADC := MainFrm.Cam1.CameraADC ;
     NewCamera(true) ;
end;

procedure TSettingsFrm.cbCameraNamesChange(Sender: TObject);
begin
    MainFrm.Cam1.SelectedCamera := cbCameraNames.ItemIndex ;
    NewCamera(true) ;
end;

procedure TSettingsFrm.cbSourceTypeChange(Sender: TObject);
// -------------------------
// Light source type changed
// -------------------------
begin
    LightSource.SourceType := cbSourceType.ItemIndex ;
    ShowLightSourcePanel ;
    end;

procedure TSettingsFrm.cbZStageTypeChange(Sender: TObject);
//
// Zstage type changed
//
begin
    ZStage.StageType := cbZStageType.ItemIndex ;
    ZStage.GetControlPorts(cbZStagePort.Items);
    cbZStagePort.ItemIndex := Min(Max(ZStage.ControlPort,0),cbZStagePort.Items.Count-1) ;

    edZScaleFactor.Units := ZStage.ScaleFactorUnits ;
    edZScaleFactor.Value := ZStage.ZScaleFactor ;

end;


procedure TSettingsFrm.edNumLensesKeyPress(Sender: TObject; var Key: Char);
// -------------------------------
// No. of available lenses changed
// -------------------------------
begin
    if Key = #13 then sgLensTable.RowCount := Round(edNumLenses.Value) + 1 ;
end;

procedure TSettingsFrm.SetLightSourcePanel(
          Num : Integer ;
          Panel : TPanel ) ;
//
// Update light source settings panel controls
// -------------------------------------------
var
    i : Integer ;
begin
      for i := 0 to 3 do if Panel.Controls[i].Tag = 0 then
          TEdit(Panel.Controls[i]).Text := LightSource.Names[Num] ;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 1 then
          begin
          LightSource.GetControlLineNames( TComboBox(Panel.Controls[i]).Items ) ;
          TComboBox(Panel.Controls[i]).ItemIndex :=
             TComboBox(Panel.Controls[i]).Items.IndexOfObject(TObject(LightSource.ControlLines[Num])) ;
          end ;
      for i := 0 to 3 do if Panel.Controls[i].Tag = 2 then
          TValidatedEdit(Panel.Controls[i]).Value := LightSource.MinLevel[Num] ;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 3 then
          TValidatedEdit(Panel.Controls[i]).Value := LightSource.MaxLevel[Num] ;

end;



procedure TSettingsFrm.udNumLensesChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
begin
     case Direction of
          updUp : edNumLenses.Value := edNumLenses.Value + 1.0 ;
          updDown : edNumLenses.Value := edNumLenses.Value - 1.0 ;
     end;
     sgLensTable.RowCount := Round(edNumLenses.Value) + 1 ;
end;



procedure TSettingsFrm.GetLightSourcePanel(
          Num : Integer ;
          Panel : TPanel ) ;
// -----------------------------------------
// Read light source settings panel controls
// -----------------------------------------
var
    i : Integer ;
begin
      for i := 0 to 3 do if Panel.Controls[i].Tag = 0 then
          LightSource.Names[Num] := TEdit(Panel.Controls[i]).Text ;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 1 then
          LightSource.ControlLines[Num] := Integer(
             TComboBox(Panel.Controls[i]).Items.Objects[TComboBox(Panel.Controls[i]).ItemIndex]) ;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 2 then
          LightSource.MinLevel[Num] := TValidatedEdit(Panel.Controls[i]).Value;

      for i := 0 to 3 do if Panel.Controls[i].Tag = 3 then
          LightSource.MaxLevel[Num] := TValidatedEdit(Panel.Controls[i]).Value ;

      end;


procedure TSettingsFrm.NewCamera(Reopen : Boolean) ;
// ---------------------------------------------
// Setup up dialog box for newly selected camera
// ---------------------------------------------
var
    i : Integer ;
    iTop : Integer ;
begin

     // Close existing camera and re-open new if required

     if Reopen then
        begin

        Screen.Cursor := crHourglass ;
        MainFrm.edStatus.Text := ' WAIT: Initialising camera ... ' ;
        MainFrm.Cam1.CloseCamera ;

        // Update main camera type

        MainFrm.CameraType := cbCamera.ItemIndex ;

        // Open new camera
        MainFrm.Cam1.ComPort := cbCameraPort.ItemIndex + 1 ;
        MainFrm.Cam1.OpenCamera( MainFrm.CameraType ) ;

        MainFrm.Cam1.FrameInterval := 0.1 ;
        MainFrm.edStatus.Text := ' Camera Initialised ' ;

        Screen.Cursor := crDefault ;

        end ;

     // Get list of available camera operating modes

     iTop := cbCamera.Top + cbCamera.Height + 5 ;

     // Show camera selection panel if more than one camera available
     CameraPanel.Top := iTop ;
     if MainFrm.Cam1.NumCameras > 1 then
        begin
        CameraPanel.Visible := True ;
        iTop := iTop + CameraPanel.Height ;
        end
     else CameraPanel.Visible := False ;

     // Initialise look-up tables
     MainFrm.GreyLo := 0 ;
     MainFrm.GreyHi := MainFrm.Cam1.GreyLevelMax ;
     MainFrm.GreyLevelMax := MainFrm.Cam1.GreyLevelMax ;
     MainFrm.UpdateLUT( MainFrm.Cam1.GreyLevelMax ) ;

     ModePanel.Top := iTop ;
     MainFrm.Cam1.GetCameraModeList( cbCameraMode.Items );

     if cbCameraMode.Items.Count > 1 then ModePanel.Visible := True
                                     else ModePanel.Visible := False ;
     cbCameraMode.ItemIndex := Min(MainFrm.Cam1.CameraMode,cbCameraMode.Items.Count-1) ;
     if ModePanel.Visible then iTop := iTop + ModePanel.Height ;

     // Get list of available camera A/D converters
     ADCPanel.Top := iTop ;
     MainFrm.Cam1.GetCameraADCList( cbCameraADC.Items );
     cbCameraADC.ItemIndex := MainFrm.Cam1.CameraADC ;
     if cbCameraADC.Items.Count > 1 then ADCPanel.Visible := True
                                    else ADCPanel.Visible := False ;
     if ADCPanel.Visible then iTop := iTop + ADCPanel.Height ;

     // Get list of available camera readout speeds
     ReadoutSpeedPanel.Top := iTop ;
     MainFrm.Cam1.GetCameraReadoutSpeedList( cbReadoutSpeed.Items );
     cbReadoutSpeed.ItemIndex := MainFrm.Cam1.ReadoutSpeed ;
     if cbReadoutSpeed.Items.Count > 0 then ReadoutSpeedPanel.Visible := True
                                       else ReadoutSpeedPanel.Visible := False ;
     if ReadoutSpeedPanel.Visible then iTop := iTop + ReadoutSpeedPanel.Height ;

     // Display camera control COM port (if present)
     ComPanel.Top := iTop ;
     if MainFrm.Cam1.ComPortUsed then
        begin
        ComPanel.Visible := True ;
        iTop := iTop + ComPanel.Height ;
        cbCameraPort.ItemIndex := MainFrm.Cam1.ComPort - 1 ;
        end
     else
        begin
        cbCameraPort.ItemIndex := -1 ;
        ComPanel.Visible := False ;
        end ;

     //edCameraTriggerOffset.Value := MainFrm.CameraTriggerOffset ;
     //edCameraReadoutTime.Value := MainFrm.Cam1.AdditionalReadoutTime ;

     CamTriggerPanel.Top := iTop ;

end ;



end.
