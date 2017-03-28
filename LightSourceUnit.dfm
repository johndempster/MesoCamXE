object LightSource: TLightSource
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Timer: TTimer
    Interval = 100
    OnTimer = TimerTimer
    Left = 8
    Top = 104
  end
end
