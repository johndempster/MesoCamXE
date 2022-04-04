object SettingsFrm: TSettingsFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Camera/Microscope Settings '
  ClientHeight = 490
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bOK: TButton
    Left = 8
    Top = 459
    Width = 59
    Height = 23
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = bOKClick
  end
  object bCancel: TButton
    Left = 72
    Top = 459
    Width = 66
    Height = 18
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
    OnClick = bCancelClick
  end
  object Page: TPageControl
    Left = 8
    Top = 8
    Width = 532
    Height = 447
    ActivePage = LightSourceTab
    TabOrder = 2
    object CameraTab: TTabSheet
      Caption = 'Camera'
      object GroupBox4: TGroupBox
        Left = 8
        Top = 2
        Width = 229
        Height = 415
        Caption = ' Camera '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cbCamera: TComboBox
          Left = 8
          Top = 16
          Width = 205
          Height = 22
          TabOrder = 0
          Text = 'cbCamera'
          OnChange = cbCameraChange
        end
        object ModePanel: TPanel
          Left = 8
          Top = 36
          Width = 212
          Height = 41
          BevelOuter = bvNone
          TabOrder = 1
          object lbCameraMode: TLabel
            Left = -1
            Top = 3
            Width = 31
            Height = 14
            Alignment = taRightJustify
            Caption = 'Mode'
          end
          object cbCameraMode: TComboBox
            Left = 0
            Top = 19
            Width = 205
            Height = 22
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbCameraModeChange
          end
        end
        object ComPanel: TPanel
          Left = 8
          Top = 113
          Width = 191
          Height = 28
          BevelOuter = bvNone
          TabOrder = 2
          object lbComPort: TLabel
            Left = 44
            Top = 3
            Width = 52
            Height = 14
            Alignment = taRightJustify
            Caption = 'COM Port'
          end
          object cbCameraPort: TComboBox
            Left = 103
            Top = 3
            Width = 87
            Height = 22
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
          Left = 8
          Top = 86
          Width = 212
          Height = 27
          BevelOuter = bvNone
          TabOrder = 3
          object Label1: TLabel
            Left = 25
            Top = 8
            Width = 83
            Height = 14
            Alignment = taRightJustify
            Caption = 'Readout Speed'
          end
          object cbReadoutSpeed: TComboBox
            Left = 113
            Top = 0
            Width = 89
            Height = 22
            Style = csDropDownList
            TabOrder = 0
          end
        end
        object ADCPanel: TPanel
          Left = 3
          Top = 141
          Width = 213
          Height = 27
          BevelOuter = bvNone
          TabOrder = 4
          object Label48: TLabel
            Left = 11
            Top = 6
            Width = 77
            Height = 14
            Alignment = taRightJustify
            Caption = 'A/D Converter'
          end
          object cbCameraADC: TComboBox
            Left = 94
            Top = 3
            Width = 111
            Height = 22
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbCameraADCChange
          end
        end
        object CameraPanel: TPanel
          Left = 13
          Top = 174
          Width = 213
          Height = 44
          BevelOuter = bvNone
          TabOrder = 5
          object Label77: TLabel
            Left = 0
            Top = 4
            Width = 102
            Height = 14
            Caption = 'Available Cameras'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbCameraNames: TComboBox
            Left = 0
            Top = 20
            Width = 205
            Height = 22
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnChange = cbCameraNamesChange
          end
        end
        object BlackLevelOffsetsGrp: TGroupBox
          Left = 8
          Top = 306
          Width = 212
          Height = 102
          Caption = ' Black Level CCD Tap Offsets '
          TabOrder = 6
          object Label19: TLabel
            Left = 7
            Top = 20
            Width = 46
            Height = 14
            Alignment = taRightJustify
            Caption = 'Left-Top'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 122
            Top = 19
            Width = 52
            Height = 14
            Alignment = taRightJustify
            Caption = 'Right-Top'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 8
            Top = 59
            Width = 66
            Height = 14
            Caption = 'Left-Bottom'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label22: TLabel
            Left = 124
            Top = 59
            Width = 72
            Height = 14
            Caption = 'Right-Bottom'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCCDTapOffsetLT: TValidatedEdit
            Left = 8
            Top = 35
            Width = 73
            Height = 18
            Hint = 'Black level offset adjustment of top-left CCD tap'
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
            Left = 124
            Top = 35
            Width = 72
            Height = 18
            Hint = 'Black level offset adjustment of right-top CCD tap'
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
            Left = 124
            Top = 72
            Width = 72
            Height = 19
            Hint = 'Black level offset adjustment of top-left CCD tap'
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
            Left = 8
            Top = 72
            Width = 73
            Height = 19
            Hint = 'Black level offset adjustment of right-top CCD tap'
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
          Left = 8
          Top = 217
          Width = 212
          Height = 87
          TabOrder = 7
          object Label3: TLabel
            Left = 11
            Top = 59
            Width = 124
            Height = 14
            Alignment = taRightJustify
            Caption = 'Temperature Set Point'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 37
            Top = 12
            Width = 98
            Height = 14
            Alignment = taRightJustify
            Caption = 'Camera Pixel Size'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label41: TLabel
            Left = 29
            Top = 35
            Width = 106
            Height = 14
            Alignment = taRightJustify
            Caption = 'Calibration Bar SIze'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCalibrationBarSize: TValidatedEdit
            Left = 141
            Top = 35
            Width = 63
            Height = 18
            Hint = 'Size (microns) of display calibration bar'
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
            Left = 141
            Top = 12
            Width = 63
            Height = 18
            Hint = 'Pixel size (microns) of camera CCD sensor'
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
            Left = 141
            Top = 59
            Width = 63
            Height = 19
            Hint = 'Target temperature (degrees C) of camera CCD cooler'
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
        Left = 243
        Top = 3
        Width = 267
        Height = 167
        TabOrder = 1
        object Label25: TLabel
          Left = 8
          Top = 8
          Width = 107
          Height = 13
          Caption = 'Image-J Program Path'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 8
          Top = 78
          Width = 99
          Height = 13
          Caption = 'Raw Data File Folder'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edImageJPath: TEdit
          Left = 8
          Top = 25
          Width = 254
          Height = 21
          TabOrder = 0
          Text = 'edImageJPath'
        end
        object ckSaveAsMultipageTIFF: TCheckBox
          Left = 78
          Top = 51
          Width = 182
          Height = 15
          Alignment = taLeftJustify
          Caption = 'Save stacks as multipage TIFF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object edRawFileFolder: TEdit
          Left = 8
          Top = 95
          Width = 254
          Height = 21
          TabOrder = 2
          Text = 'edImageJPath'
        end
      end
    end
    object LightSourceTab: TTabSheet
      Caption = 'Light Source'
      ImageIndex = 1
      object lbSourceType: TLabel
        Left = 8
        Top = 8
        Width = 26
        Height = 15
        Caption = 'Type'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CoolLEDGrp: TGroupBox
        Left = 8
        Top = 90
        Width = 344
        Height = 202
        Caption = ' CoolLED (USB Control) '
        TabOrder = 1
        object Label15: TLabel
          Left = 183
          Top = 17
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Control Port'
        end
        object cbLightSourceControlPort: TComboBox
          Left = 246
          Top = 16
          Width = 88
          Height = 21
          Style = csDropDownList
          TabOrder = 0
        end
      end
      object cbSourceType: TComboBox
        Left = 40
        Top = 7
        Width = 191
        Height = 21
        TabOrder = 2
        Text = 'cbZStageType'
        OnChange = cbSourceTypeChange
      end
      object LEDGrp: TGroupBox
        Left = 8
        Top = 80
        Width = 376
        Height = 247
        Caption = ' LED (Digital/Analogue Control) '
        TabOrder = 0
        object Label4: TLabel
          Left = 4
          Top = 17
          Width = 31
          Height = 14
          Alignment = taRightJustify
          Caption = 'Name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 100
          Top = 17
          Width = 68
          Height = 14
          Alignment = taRightJustify
          Caption = 'Control Line'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 223
          Top = 17
          Width = 52
          Height = 14
          Caption = 'Off Level '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 292
          Top = 17
          Width = 61
          Height = 14
          Caption = 'Max. Level '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnLightSource0: TPanel
          Left = 8
          Top = 33
          Width = 352
          Height = 24
          BevelOuter = bvNone
          TabOrder = 0
          object Edit2: TEdit
            Left = 0
            Top = 0
            Width = 86
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox2: TComboBox
            Tag = 1
            Left = 96
            Top = 0
            Width = 98
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit3: TValidatedEdit
            Tag = 2
            Left = 215
            Top = 0
            Width = 56
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit4: TValidatedEdit
            Tag = 3
            Left = 284
            Top = -1
            Width = 55
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource1: TPanel
          Left = 8
          Top = 58
          Width = 352
          Height = 22
          BevelOuter = bvNone
          TabOrder = 1
          object Edit3: TEdit
            Left = 0
            Top = 0
            Width = 86
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox3: TComboBox
            Tag = 1
            Left = 96
            Top = 0
            Width = 98
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit5: TValidatedEdit
            Tag = 2
            Left = 215
            Top = 0
            Width = 54
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit6: TValidatedEdit
            Tag = 3
            Left = 284
            Top = 0
            Width = 55
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource2: TPanel
          Left = 8
          Top = 82
          Width = 352
          Height = 23
          BevelOuter = bvNone
          TabOrder = 2
          object Edit4: TEdit
            Left = 0
            Top = 0
            Width = 86
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox4: TComboBox
            Tag = 1
            Left = 96
            Top = 0
            Width = 98
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit7: TValidatedEdit
            Tag = 2
            Left = 215
            Top = 0
            Width = 54
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit8: TValidatedEdit
            Tag = 3
            Left = 284
            Top = 0
            Width = 55
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource3: TPanel
          Left = 8
          Top = 105
          Width = 352
          Height = 25
          BevelOuter = bvNone
          TabOrder = 3
          object Edit5: TEdit
            Left = 0
            Top = 0
            Width = 86
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox5: TComboBox
            Tag = 1
            Left = 96
            Top = 0
            Width = 98
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit9: TValidatedEdit
            Tag = 2
            Left = 215
            Top = 0
            Width = 54
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit10: TValidatedEdit
            Tag = 3
            Left = 284
            Top = 0
            Width = 55
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource4: TPanel
          Left = 8
          Top = 132
          Width = 352
          Height = 22
          BevelOuter = bvNone
          TabOrder = 4
          object Edit6: TEdit
            Left = 0
            Top = 0
            Width = 86
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox6: TComboBox
            Tag = 1
            Left = 96
            Top = 0
            Width = 98
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit11: TValidatedEdit
            Tag = 2
            Left = 215
            Top = 0
            Width = 54
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit12: TValidatedEdit
            Tag = 3
            Left = 284
            Top = 0
            Width = 55
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource5: TPanel
          Left = 8
          Top = 157
          Width = 352
          Height = 22
          BevelOuter = bvNone
          TabOrder = 5
          object Edit7: TEdit
            Left = 0
            Top = 0
            Width = 86
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox7: TComboBox
            Tag = 1
            Left = 96
            Top = 0
            Width = 98
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit13: TValidatedEdit
            Tag = 2
            Left = 215
            Top = 0
            Width = 54
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit14: TValidatedEdit
            Tag = 3
            Left = 284
            Top = 0
            Width = 55
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource6: TPanel
          Left = 8
          Top = 182
          Width = 352
          Height = 22
          BevelOuter = bvNone
          TabOrder = 6
          object Edit8: TEdit
            Left = 0
            Top = 0
            Width = 86
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox8: TComboBox
            Tag = 1
            Left = 96
            Top = 0
            Width = 98
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit15: TValidatedEdit
            Tag = 2
            Left = 215
            Top = 0
            Width = 54
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit16: TValidatedEdit
            Tag = 3
            Left = 284
            Top = 0
            Width = 55
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
        object pnLightSource7: TPanel
          Left = 8
          Top = 205
          Width = 352
          Height = 25
          BevelOuter = bvNone
          TabOrder = 7
          object Edit9: TEdit
            Left = 0
            Top = 0
            Width = 86
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox9: TComboBox
            Tag = 1
            Left = 96
            Top = 0
            Width = 98
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit17: TValidatedEdit
            Tag = 2
            Left = 215
            Top = 3
            Width = 54
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
          object ValidatedEdit18: TValidatedEdit
            Tag = 3
            Left = 284
            Top = 3
            Width = 55
            Height = 21
            Text = ' 0 V'
            Scale = 1.000000000000000000
            Units = 'V'
            NumberFormat = '%.4g'
            LoLimit = -1.000000015047466E30
            HiLimit = 1.000000015047466E30
          end
        end
      end
      object LSCommonGrp: TGroupBox
        Left = 8
        Top = 34
        Width = 376
        Height = 41
        TabOrder = 3
        object Label24: TLabel
          Left = 215
          Top = 8
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Change time'
        end
        object edLightSourceChangeTime: TValidatedEdit
          Tag = 3
          Left = 281
          Top = 8
          Width = 66
          Height = 21
          Hint = 'Time to change light source emission intensity/wavelength (ms)'
          ShowHint = True
          Text = ' 0 ms'
          Scale = 1000.000000000000000000
          Units = 'ms'
          NumberFormat = '%.4g'
          HiLimit = 1.000000015047466E30
        end
      end
    end
    object ZStageTab: TTabSheet
      Caption = 'Z Stage'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 215
        Height = 256
        Caption = ' Z Position Control'
        TabOrder = 0
        object Label10: TLabel
          Left = 35
          Top = 113
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Z Scale Factor'
        end
        object Label13: TLabel
          Left = 46
          Top = 140
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Z Step Rate'
        end
        object Label12: TLabel
          Left = 35
          Top = 64
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'X Scale Factor'
        end
        object Label14: TLabel
          Left = 35
          Top = 90
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Y Scale Factor'
        end
        object Label16: TLabel
          Left = 1
          Top = 166
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = 'Z Position Lower Limit'
        end
        object Label17: TLabel
          Left = 1
          Top = 193
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = 'Z Position Upper Limit'
        end
        object edZScaleFactor: TValidatedEdit
          Left = 111
          Top = 113
          Width = 87
          Height = 21
          Text = ' 1 steps/um'
          Value = 1.000000000000000000
          Scale = 1.000000000000000000
          Units = 'steps/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object cbZStageType: TComboBox
          Left = 8
          Top = 16
          Width = 190
          Height = 21
          TabOrder = 1
          Text = 'cbZStageType'
          OnChange = cbZStageTypeChange
        end
        object edZStepTime: TValidatedEdit
          Left = 111
          Top = 140
          Width = 87
          Height = 21
          Text = ' 100 ms/um'
          Value = 0.100000001490116100
          Scale = 1000.000000000000000000
          Units = 'ms/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edXScalefactor: TValidatedEdit
          Left = 111
          Top = 64
          Width = 87
          Height = 21
          Text = ' 1 steps/um'
          Value = 1.000000000000000000
          Scale = 1.000000000000000000
          Units = 'steps/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edYScaleFactor: TValidatedEdit
          Left = 108
          Top = 90
          Width = 90
          Height = 21
          Text = ' 1 steps/um'
          Value = 1.000000000000000000
          Scale = 1.000000000000000000
          Units = 'steps/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edZpositionMin: TValidatedEdit
          Left = 111
          Top = 166
          Width = 87
          Height = 21
          Text = ' -10000 um'
          Value = -10000.000000000000000000
          Scale = 1.000000000000000000
          Units = 'um'
          NumberFormat = '%.0f'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edZPositionMax: TValidatedEdit
          Left = 111
          Top = 193
          Width = 87
          Height = 21
          Text = ' 10000 um'
          Value = 10000.000000000000000000
          Scale = 1.000000000000000000
          Units = 'um'
          NumberFormat = '%.0f'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object ControlPortPanel: TPanel
          Left = 39
          Top = 39
          Width = 159
          Height = 24
          BevelOuter = bvNone
          TabOrder = 7
          object Label8: TLabel
            Left = 6
            Top = 0
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Control Port'
          end
          object cbZStagePort: TComboBox
            Left = 69
            Top = 0
            Width = 88
            Height = 21
            Style = csDropDownList
            TabOrder = 0
          end
        end
        object SerialNumberPanel: TPanel
          Left = 39
          Top = 39
          Width = 159
          Height = 24
          BevelOuter = bvNone
          TabOrder = 8
          object Label23: TLabel
            Left = 18
            Top = 0
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serial No.'
          end
          object edSerialNumber: TEdit
            Left = 72
            Top = 0
            Width = 87
            Height = 21
            TabOrder = 0
            Text = 'edSerialNumber'
          end
        end
      end
    end
    object LensTab: TTabSheet
      HelpType = htKeyword
      HelpKeyword = 'Lenses'
      Caption = 'Lenses'
      ImageIndex = 3
      object CalibrationGrp: TGroupBox
        Left = 8
        Top = 3
        Width = 220
        Height = 326
        Caption = ' Lens Table '
        TabOrder = 0
        object Label2: TLabel
          Left = 76
          Top = 16
          Width = 76
          Height = 14
          Alignment = taRightJustify
          Caption = 'No. of Lenses'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 25
          Top = 299
          Width = 136
          Height = 14
          Alignment = taRightJustify
          Caption = 'Relay Lens Magnification'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edNumLenses: TValidatedEdit
          Left = 157
          Top = 16
          Width = 37
          Height = 17
          OnKeyPress = edNumLensesKeyPress
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
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
          Left = 8
          Top = 37
          Width = 202
          Height = 256
          ColCount = 2
          FixedCols = 0
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ParentFont = False
          TabOrder = 1
          ColWidths = (
            64
            64)
          RowHeights = (
            24
            24
            24
            24
            24)
        end
        object edRelayLensMagnification: TValidatedEdit
          Left = 165
          Top = 299
          Width = 40
          Height = 18
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
          Left = 190
          Top = 14
          Width = 17
          Height = 19
          Min = -100
          Position = 1
          TabOrder = 3
          OnChangingEx = udNumLensesChangingEx
        end
      end
    end
  end
end
