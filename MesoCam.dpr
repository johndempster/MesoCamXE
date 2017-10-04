program MesoCam;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainFrm},
  nidaqmxlib in 'nidaqmxlib.pas',
  LabIOUnit in 'LabIOUnit.pas' {LabIO: TDataModule},
  SettingsUnit in 'SettingsUnit.pas' {SettingsFrm},
  ZStageUnit in 'ZStageUnit.pas' {ZStage: TDataModule},
  LightSourceUnit in 'LightSourceUnit.pas' {LightSource: TDataModule},
  SetCCDReadoutUnit in 'SetCCDReadoutUnit.pas' {SetCCDReadoutFrm},
  about in 'about.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MesoCam';
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TLabIO, LabIO);
  Application.CreateForm(TSettingsFrm, SettingsFrm);
  Application.CreateForm(TZStage, ZStage);
  Application.CreateForm(TLightSource, LightSource);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
