program MesoCam;

uses
  Forms,
  Winapi.Windows,System.SysUtils,VCL.Dialogs,   { Required for CreateMutex 27.3.24}
  MainUnit in 'MainUnit.pas' {MainFrm},
  nidaqmxlib in 'nidaqmxlib.pas',
  SettingsUnit in 'SettingsUnit.pas' {SettingsFrm},
  ZStageUnit in 'ZStageUnit.pas' {ZStage: TDataModule},
  LightSourceUnit in 'LightSourceUnit.pas' {LightSource: TDataModule},
  SetCCDReadoutUnit in 'SetCCDReadoutUnit.pas' {SetCCDReadoutFrm},
  about in 'about.pas' {AboutBox},
  LightSourceComThreadUnit in 'LightSourceComThreadUnit.pas',
  ZStageComThreadUnit in 'ZStageComThreadUnit.pas',
  LabIOUnit in 'LabIOUnit.pas' {LabIO: TDataModule};

{$R *.res}

begin

  // Prevent multiple instances
  if CreateMutex(nil, True, 'Dempster.MesoCam') = 0 then RaiseLastOSError ;
  if GetLastError = ERROR_ALREADY_EXISTS then
     begin
     ShowMessage('MesoCam - Program alreading running! Unable to start another.');
     Exit;
     end;

  Application.Initialize;
  Application.Title := 'MesoCam';
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TSettingsFrm, SettingsFrm);
  Application.CreateForm(TZStage, ZStage);
  Application.CreateForm(TLightSource, LightSource);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TLabIO, LabIO);
  Application.Run;
end.
