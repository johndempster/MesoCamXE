object SetCCDReadoutFrm: TSetCCDReadoutFrm
  Tag = 37
  Left = 777
  Top = 526
  Caption = 'Set CCD Area'
  ClientHeight = 125
  ClientWidth = 211
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AreaGrp: TGroupBox
    Left = 2
    Top = 0
    Width = 191
    Height = 73
    Caption = ' CCD readout area '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 42
      Height = 13
      Caption = 'X Range'
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 42
      Height = 13
      Caption = 'Y Range'
    end
    object edXRange: TRangeEdit
      Left = 88
      Top = 16
      Width = 97
      Height = 21
      Text = ' 0 - 100 %'
      HiValue = 1.000000000000000000
      HiLimit = 1.000000000000000000
      Scale = 100.000000000000000000
      Units = '%'
      NumberFormat = '%.0f - %.0f'
    end
    object edYRange: TRangeEdit
      Left = 88
      Top = 40
      Width = 97
      Height = 21
      Text = ' 0 - 100 %'
      HiValue = 1.000000000000000000
      HiLimit = 1.000000000000000000
      Scale = 100.000000000000000000
      Units = '%'
      NumberFormat = '%.0f - %.0f'
    end
  end
  object bOK: TButton
    Left = 2
    Top = 80
    Width = 40
    Height = 25
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bOKClick
  end
  object bCancel: TButton
    Left = 50
    Top = 80
    Width = 48
    Height = 17
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = bCancelClick
  end
end
