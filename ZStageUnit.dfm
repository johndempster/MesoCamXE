object ZStage: TZStage
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 451
  Width = 621
  object Timer: TTimer
    Interval = 50
    OnTimer = TimerTimer
    Left = 16
    Top = 384
  end
end
