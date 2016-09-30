object ScanImageFrm: TScanImageFrm
  Left = 0
  Top = 0
  Caption = 'Scan Image'
  ClientHeight = 452
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 38
    Width = 649
    Height = 371
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object ROIPanel: TPanel
    Left = 8
    Top = -1
    Width = 417
    Height = 41
    BevelOuter = bvNone
    TabOrder = 0
    object lbReadout: TLabel
      Left = 78
      Top = 13
      Width = 55
      Height = 14
      Caption = 'lbReadout'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bZoomIn: TButton
      Left = 39
      Top = 8
      Width = 33
      Height = 25
      Caption = '(+)'
      TabOrder = 0
      OnClick = bZoomInClick
    end
    object bZoomOut: TButton
      Left = 0
      Top = 8
      Width = 33
      Height = 25
      Caption = '(-)'
      TabOrder = 1
      OnClick = bZoomOutClick
    end
  end
end
