object SettingsFrm: TSettingsFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Camera/Microscope Settings '
  ClientHeight = 678
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 130
  TextHeight = 18
  object bOK: TButton
    Left = 11
    Top = 636
    Width = 82
    Height = 32
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = bOKClick
  end
  object bCancel: TButton
    Left = 100
    Top = 636
    Width = 91
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
    OnClick = bCancelClick
  end
  object Page: TPageControl
    Left = 11
    Top = 11
    Width = 737
    Height = 619
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = ZStageTab
    TabOrder = 2
    object CameraTab: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Camera'
      object GroupBox4: TGroupBox
        Left = 11
        Top = 3
        Width = 317
        Height = 574
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Camera '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cbCamera: TComboBox
          Left = 11
          Top = 22
          Width = 284
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 0
          Text = 'cbCamera'
          OnChange = cbCameraChange
        end
        object ModePanel: TPanel
          Left = 11
          Top = 50
          Width = 294
          Height = 56
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 1
          object lbCameraMode: TLabel
            Left = 2
            Top = 4
            Width = 40
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Mode'
          end
          object cbCameraMode: TComboBox
            Left = 0
            Top = 26
            Width = 284
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbCameraModeChange
          end
        end
        object ComPanel: TPanel
          Left = 11
          Top = 157
          Width = 265
          Height = 38
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 2
          object lbComPort: TLabel
            Left = 63
            Top = 4
            Width = 70
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'COM Port'
          end
          object cbCameraPort: TComboBox
            Left = 142
            Top = 4
            Width = 121
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'cbCameraGain'
            Items.Strings = (
              'COM1'
              'COM2'
              'COM3'
              'COM4')
          end
        end
        object ReadoutSpeedPanel: TPanel
          Left = 11
          Top = 119
          Width = 294
          Height = 38
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 3
          object Label1: TLabel
            Left = 39
            Top = 11
            Width = 110
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Readout Speed'
          end
          object cbReadoutSpeed: TComboBox
            Left = 157
            Top = 0
            Width = 123
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 0
          end
        end
        object ADCPanel: TPanel
          Left = 4
          Top = 195
          Width = 295
          Height = 38
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 4
          object Label48: TLabel
            Left = 21
            Top = 8
            Width = 101
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'A/D Converter'
          end
          object cbCameraADC: TComboBox
            Left = 130
            Top = 4
            Width = 154
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbCameraADCChange
          end
        end
        object CameraPanel: TPanel
          Left = 18
          Top = 241
          Width = 295
          Height = 61
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 5
          object Label77: TLabel
            Left = 0
            Top = 5
            Width = 129
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Available Cameras'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbCameraNames: TComboBox
            Left = 0
            Top = 27
            Width = 284
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnChange = cbCameraNamesChange
          end
        end
        object BlackLevelOffsetsGrp: TGroupBox
          Left = 11
          Top = 424
          Width = 294
          Height = 141
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = ' Black Level CCD Tap Offsets '
          TabOrder = 6
          object Label19: TLabel
            Left = 13
            Top = 27
            Width = 60
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Left-Top'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 171
            Top = 26
            Width = 70
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Right-Top'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 11
            Top = 81
            Width = 84
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Left-Bottom'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label22: TLabel
            Left = 171
            Top = 81
            Width = 94
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Right-Bottom'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCCDTapOffsetLT: TValidatedEdit
            Left = 11
            Top = 49
            Width = 101
            Height = 25
            Hint = 'Black level offset adjustment of top-left CCD tap'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            AutoSize = False
            ShowHint = True
            Text = ' 10 '
            Value = 10.000000000000000000
            Scale = 1.000000000000000000
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 100.000000000000000000
          end
          object edCCDTapOffsetRT: TValidatedEdit
            Left = 171
            Top = 49
            Width = 101
            Height = 25
            Hint = 'Black level offset adjustment of right-top CCD tap'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            AutoSize = False
            ShowHint = True
            Text = ' 10 '
            Value = 10.000000000000000000
            Scale = 1.000000000000000000
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 100.000000000000000000
          end
          object edCCDTapOffsetRB: TValidatedEdit
            Left = 171
            Top = 100
            Width = 101
            Height = 26
            Hint = 'Black level offset adjustment of top-left CCD tap'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            AutoSize = False
            ShowHint = True
            Text = ' 10 '
            Value = 10.000000000000000000
            Scale = 1.000000000000000000
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 100.000000000000000000
          end
          object edCCDTapOffsetLB: TValidatedEdit
            Left = 11
            Top = 100
            Width = 101
            Height = 26
            Hint = 'Black level offset adjustment of right-top CCD tap'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            AutoSize = False
            ShowHint = True
            Text = ' 10 '
            Value = 10.000000000000000000
            Scale = 1.000000000000000000
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 100.000000000000000000
          end
        end
        object GroupBox1: TGroupBox
          Left = 11
          Top = 301
          Width = 294
          Height = 120
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 7
          object Label3: TLabel
            Left = 46
            Top = 81
            Width = 141
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Calibration Bar SIze'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 59
            Top = 16
            Width = 128
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Camera Pixel Size'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label41: TLabel
            Left = 27
            Top = 49
            Width = 160
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Temperature Set Point'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCalibrationBarSize: TValidatedEdit
            Left = 195
            Top = 49
            Width = 88
            Height = 25
            Hint = 'Size (microns) of display calibration bar'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            AutoSize = False
            ShowHint = True
            Text = ' 10 um'
            Value = 10.000000000000000000
            Scale = 1.000000000000000000
            Units = 'um'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1000000.000000000000000000
          end
          object edCameraPixelSize: TValidatedEdit
            Left = 195
            Top = 16
            Width = 88
            Height = 26
            Hint = 'Pixel size (microns) of camera CCD sensor'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            AutoSize = False
            ShowHint = True
            Text = ' 10 um'
            Value = 10.000000000000000000
            Scale = 1.000000000000000000
            Units = 'um'
            NumberFormat = '%.4g'
            LoLimit = 0.100000001490116100
            HiLimit = 1000000.000000000000000000
          end
          object edTemperatureSetPoint: TValidatedEdit
            Left = 195
            Top = 81
            Width = 88
            Height = 27
            Hint = 'Target temperature (degrees C) of camera CCD cooler'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            AutoSize = False
            ShowHint = True
            Text = ' 0 DEGC'
            Scale = 1.000000000000000000
            Units = 'DEGC'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
      end
      object GroupBox5: TGroupBox
        Left = 336
        Top = 4
        Width = 370
        Height = 232
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
        object Label25: TLabel
          Left = 11
          Top = 11
          Width = 148
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Image-J Program Path'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 11
          Top = 108
          Width = 132
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Raw Data File Folder'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edImageJPath: TEdit
          Left = 11
          Top = 34
          Width = 352
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 0
          Text = 'edImageJPath'
        end
        object ckSaveAsMultipageTIFF: TCheckBox
          Left = 108
          Top = 70
          Width = 252
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taLeftJustify
          Caption = 'Save stacks as multipage TIFF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object edRawFileFolder: TEdit
          Left = 11
          Top = 131
          Width = 352
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 2
          Text = 'edImageJPath'
        end
      end
    end
    object LightSourceTab: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Light Source'
      ImageIndex = 1
      object lbSourceType: TLabel
        Left = 11
        Top = 11
        Width = 37
        Height = 19
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Type'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CoolLEDGrp: TGroupBox
        Left = 11
        Top = 46
        Width = 477
        Height = 279
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' CoolLED (USB Control) '
        TabOrder = 1
        object Label15: TLabel
          Left = 257
          Top = 23
          Width = 76
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Control Port'
        end
        object cbLightSourceControlPort: TComboBox
          Left = 341
          Top = 22
          Width = 122
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          TabOrder = 0
        end
      end
      object cbSourceType: TComboBox
        Left = 53
        Top = 11
        Width = 264
        Height = 26
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
        Text = 'cbZStageType'
        OnChange = cbSourceTypeChange
      end
      object LEDGrp: TGroupBox
        Left = 11
        Top = 47
        Width = 521
        Height = 342
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' LED (Digital/Analogue Control) '
        TabOrder = 0
        object Label4: TLabel
          Left = 9
          Top = 23
          Width = 40
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 145
          Top = 23
          Width = 88
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Control Line'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 309
          Top = 23
          Width = 70
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Off Level '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 404
          Top = 23
          Width = 81
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Max. Level '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnLightSource0: TPanel
          Left = 11
          Top = 45
          Width = 487
          Height = 34
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 0
          object Edit2: TEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox2: TComboBox
            Tag = 1
            Left = 133
            Top = 0
            Width = 135
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit3: TValidatedEdit
            Tag = 2
            Left = 298
            Top = 0
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit4: TValidatedEdit
            Tag = 3
            Left = 393
            Top = -1
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource1: TPanel
          Left = 11
          Top = 80
          Width = 487
          Height = 31
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 1
          object Edit3: TEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox3: TComboBox
            Tag = 1
            Left = 133
            Top = 0
            Width = 135
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit5: TValidatedEdit
            Tag = 2
            Left = 298
            Top = 0
            Width = 74
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit6: TValidatedEdit
            Tag = 3
            Left = 393
            Top = 0
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource2: TPanel
          Left = 11
          Top = 114
          Width = 487
          Height = 32
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 2
          object Edit4: TEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox4: TComboBox
            Tag = 1
            Left = 133
            Top = 0
            Width = 135
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit7: TValidatedEdit
            Tag = 2
            Left = 298
            Top = 0
            Width = 74
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit8: TValidatedEdit
            Tag = 3
            Left = 393
            Top = 0
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource3: TPanel
          Left = 11
          Top = 146
          Width = 487
          Height = 34
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 3
          object Edit5: TEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox5: TComboBox
            Tag = 1
            Left = 133
            Top = 0
            Width = 135
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit9: TValidatedEdit
            Tag = 2
            Left = 298
            Top = 0
            Width = 74
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit10: TValidatedEdit
            Tag = 3
            Left = 393
            Top = 0
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource4: TPanel
          Left = 11
          Top = 183
          Width = 487
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 4
          object Edit6: TEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox6: TComboBox
            Tag = 1
            Left = 133
            Top = 0
            Width = 135
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit11: TValidatedEdit
            Tag = 2
            Left = 298
            Top = 0
            Width = 74
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit12: TValidatedEdit
            Tag = 3
            Left = 393
            Top = 0
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource5: TPanel
          Left = 11
          Top = 218
          Width = 487
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 5
          object Edit7: TEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox7: TComboBox
            Tag = 1
            Left = 133
            Top = 0
            Width = 135
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit13: TValidatedEdit
            Tag = 2
            Left = 298
            Top = 0
            Width = 74
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit14: TValidatedEdit
            Tag = 3
            Left = 393
            Top = 0
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource6: TPanel
          Left = 11
          Top = 252
          Width = 487
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 6
          object Edit8: TEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox8: TComboBox
            Tag = 1
            Left = 133
            Top = 0
            Width = 135
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit15: TValidatedEdit
            Tag = 2
            Left = 298
            Top = 0
            Width = 74
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit16: TValidatedEdit
            Tag = 3
            Left = 393
            Top = 0
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource7: TPanel
          Left = 11
          Top = 284
          Width = 487
          Height = 34
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 7
          object Edit9: TEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox9: TComboBox
            Tag = 1
            Left = 133
            Top = 0
            Width = 135
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit17: TValidatedEdit
            Tag = 2
            Left = 298
            Top = 4
            Width = 74
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit18: TValidatedEdit
            Tag = 3
            Left = 393
            Top = 4
            Width = 77
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
      end
    end
    object ZStageTab: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Z Stage'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 297
        Height = 355
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Z Position Control'
        TabOrder = 0
        object Label10: TLabel
          Left = 50
          Top = 157
          Width = 92
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Z Scale Factor'
        end
        object Label13: TLabel
          Left = 65
          Top = 194
          Width = 77
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Z Step Rate'
        end
        object Label12: TLabel
          Left = 49
          Top = 89
          Width = 93
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'X Scale Factor'
        end
        object Label14: TLabel
          Left = 48
          Top = 125
          Width = 94
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Y Scale Factor'
        end
        object Label16: TLabel
          Left = 4
          Top = 230
          Width = 138
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Z Position Lower Limit'
        end
        object Label17: TLabel
          Left = 3
          Top = 267
          Width = 139
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Z Position Upper Limit'
        end
        object edZScaleFactor: TValidatedEdit
          Left = 153
          Top = 157
          Width = 121
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ' 1 steps/um'
          Value = 1.000000000000000000
          Scale = 1.000000000000000000
          Units = 'steps/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object cbZStageType: TComboBox
          Left = 11
          Top = 22
          Width = 263
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
          Text = 'cbZStageType'
          OnChange = cbZStageTypeChange
        end
        object edZStepTime: TValidatedEdit
          Left = 153
          Top = 194
          Width = 121
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ' 100 ms/um'
          Value = 0.100000001490116100
          Scale = 1000.000000000000000000
          Units = 'ms/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edXScalefactor: TValidatedEdit
          Left = 153
          Top = 89
          Width = 121
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ' 1 steps/um'
          Value = 1.000000000000000000
          Scale = 1.000000000000000000
          Units = 'steps/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edYScaleFactor: TValidatedEdit
          Left = 150
          Top = 125
          Width = 124
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ' 1 steps/um'
          Value = 1.000000000000000000
          Scale = 1.000000000000000000
          Units = 'steps/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edZpositionMin: TValidatedEdit
          Left = 153
          Top = 230
          Width = 121
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ' -10000 um'
          Value = -10000.000000000000000000
          Scale = 1.000000000000000000
          Units = 'um'
          NumberFormat = '%.0f'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edZPositionMax: TValidatedEdit
          Left = 153
          Top = 267
          Width = 121
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ' 10000 um'
          Value = 10000.000000000000000000
          Scale = 1.000000000000000000
          Units = 'um'
          NumberFormat = '%.0f'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object ControlPortPanel: TPanel
          Left = 54
          Top = 54
          Width = 220
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 7
          object Label8: TLabel
            Left = 12
            Top = 0
            Width = 76
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Control Port'
          end
          object cbZStagePort: TComboBox
            Left = 96
            Top = 0
            Width = 122
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 0
          end
        end
        object SerialNumberPanel: TPanel
          Left = 54
          Top = 54
          Width = 220
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 8
          object Label23: TLabel
            Left = 27
            Top = 0
            Width = 61
            Height = 18
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Serial No.'
          end
          object edSerialNumber: TEdit
            Left = 100
            Top = 0
            Width = 120
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = 'edSerialNumber'
          end
        end
      end
    end
    object LensTab: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'Lenses'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Lenses'
      ImageIndex = 3
      object CalibrationGrp: TGroupBox
        Left = 11
        Top = 4
        Width = 305
        Height = 452
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Lens Table '
        TabOrder = 0
        object Label2: TLabel
          Left = 112
          Top = 22
          Width = 98
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'No. of Lenses'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 46
          Top = 414
          Width = 177
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Relay Lens Magnification'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edNumLenses: TValidatedEdit
          Left = 218
          Top = 22
          Width = 50
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          OnKeyPress = edNumLensesKeyPress
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Text = ' 10 '
          Value = 10.000000000000000000
          Scale = 1.000000000000000000
          NumberFormat = '%.4g'
          LoLimit = 1.000000000000000000
          HiLimit = 10.000000000000000000
        end
        object sgLensTable: TStringGrid
          Left = 11
          Top = 51
          Width = 280
          Height = 354
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ColCount = 2
          FixedCols = 0
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ParentFont = False
          TabOrder = 1
        end
        object edRelayLensMagnification: TValidatedEdit
          Left = 229
          Top = 414
          Width = 55
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          AutoSize = False
          Text = ' 10 X'
          Value = 10.000000000000000000
          Scale = 1.000000000000000000
          Units = 'X'
          NumberFormat = '%.4g'
          LoLimit = 0.001000000047497451
          HiLimit = 1000.000000000000000000
        end
        object udNumLenses: TUpDown
          Left = 263
          Top = 19
          Width = 24
          Height = 27
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Min = -100
          Position = 1
          TabOrder = 3
          OnChangingEx = udNumLensesChangingEx
        end
      end
    end
  end
end
