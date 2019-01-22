object ZStage: TZStage
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 263
  Width = 306
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 168
    Top = 200
  end
end
