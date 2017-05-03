object SettingsFrm: TSettingsFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Camera/System Settings '
  ClientHeight = 449
  ClientWidth = 488
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
    Top = 420
    Width = 61
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
    Left = 74
    Top = 420
    Width = 67
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
    Width = 464
    Height = 406
    ActivePage = CameraTab
    TabOrder = 2
    object CameraTab: TTabSheet
      Caption = 'Camera'
      object GroupBox4: TGroupBox
        Left = 8
        Top = 3
        Width = 210
        Height = 373
        Caption = ' Camera '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label41: TLabel
          Left = 15
          Top = 319
          Width = 90
          Height = 14
          Alignment = taRightJustify
          Caption = 'Tempr. Set Point'
        end
        object Label9: TLabel
          Left = 20
          Top = 295
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
        object cbCamera: TComboBox
          Left = 8
          Top = 16
          Width = 194
          Height = 22
          TabOrder = 0
          Text = 'cbCamera'
          OnChange = cbCameraChange
        end
        object ModePanel: TPanel
          Left = 8
          Top = 37
          Width = 196
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
            Width = 194
            Height = 22
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbCameraModeChange
          end
        end
        object ComPanel: TPanel
          Left = 8
          Top = 116
          Width = 196
          Height = 28
          BevelOuter = bvNone
          TabOrder = 2
          object lbComPort: TLabel
            Left = 46
            Top = 3
            Width = 52
            Height = 14
            Alignment = taRightJustify
            Caption = 'COM Port'
          end
          object cbCameraPort: TComboBox
            Left = 105
            Top = 3
            Width = 89
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
          Top = 88
          Width = 196
          Height = 28
          BevelOuter = bvNone
          TabOrder = 3
          object Label1: TLabel
            Left = 15
            Top = 3
            Width = 83
            Height = 14
            Alignment = taRightJustify
            Caption = 'Readout Speed'
          end
          object cbReadoutSpeed: TComboBox
            Left = 103
            Top = 2
            Width = 91
            Height = 22
            Style = csDropDownList
            TabOrder = 0
          end
        end
        object edTemperatureSetPoint: TValidatedEdit
          Left = 124
          Top = 319
          Width = 75
          Height = 20
          AutoSize = False
          Text = ' 0 DEGC'
          Scale = 1.000000000000000000
          Units = 'DEGC'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1.000000015047466E30
        end
        object ADCPanel: TPanel
          Left = 7
          Top = 144
          Width = 195
          Height = 28
          BevelOuter = bvNone
          TabOrder = 5
          object Label48: TLabel
            Left = -2
            Top = 3
            Width = 77
            Height = 14
            Alignment = taRightJustify
            Caption = 'A/D Converter'
          end
          object cbCameraADC: TComboBox
            Left = 80
            Top = 1
            Width = 114
            Height = 22
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbCameraADCChange
          end
        end
        object CameraPanel: TPanel
          Left = 13
          Top = 178
          Width = 194
          Height = 45
          BevelOuter = bvNone
          TabOrder = 6
          object Label77: TLabel
            Left = 4
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
            Width = 194
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
        object ckDisableExposureIntervalLimit: TCheckBox
          Left = 6
          Top = 345
          Width = 192
          Height = 23
          Hint = 
            'Q Imaging cameras only: Tick to allow exposure intervals less th' +
            'an reported readout time of camera '
          Alignment = taLeftJustify
          Caption = 'Disable Exposure Time Checking'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object CamTriggerPanel: TPanel
          Left = 13
          Top = 229
          Width = 194
          Height = 47
          BevelOuter = bvNone
          TabOrder = 8
        end
        object edCameraPixelSize: TValidatedEdit
          Left = 124
          Top = 295
          Width = 75
          Height = 19
          AutoSize = False
          Text = ' 10 um'
          Value = 10.000000000000000000
          Scale = 1.000000000000000000
          Units = 'um'
          NumberFormat = '%.4g'
          LoLimit = 0.100000001490116100
          HiLimit = 1000000.000000000000000000
        end
      end
      object GroupBox3: TGroupBox
        Left = 224
        Top = 6
        Width = 224
        Height = 75
        Caption = ' Camera Trigger '
        TabOrder = 1
        object Label3: TLabel
          Left = 11
          Top = 20
          Width = 116
          Height = 14
          Alignment = taRightJustify
          Caption = 'Exposure Trigger O/P'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbCameraTrigger: TComboBox
          Left = 133
          Top = 20
          Width = 82
          Height = 21
          TabOrder = 0
          Text = 'cbLaserControlComPort'
        end
        object rbCameraTriggerActiveHigh: TRadioButton
          Left = 47
          Top = 42
          Width = 75
          Height = 17
          Caption = 'Active High'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          TabStop = True
        end
        object rbCameraTriggerActiveLow: TRadioButton
          Left = 133
          Top = 42
          Width = 83
          Height = 17
          Caption = 'Active Low'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox5: TGroupBox
        Left = 224
        Top = 94
        Width = 225
        Height = 84
        TabOrder = 2
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
        object edImageJPath: TEdit
          Left = 8
          Top = 25
          Width = 202
          Height = 21
          TabOrder = 0
          Text = 'edImageJPath'
        end
        object ckSaveAsMultipageTIFF: TCheckBox
          Left = 24
          Top = 50
          Width = 186
          Height = 16
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
      object LEDGrp: TGroupBox
        Left = 8
        Top = 35
        Width = 352
        Height = 252
        Caption = ' LED (Digital/Analogue Control) '
        TabOrder = 0
        object Label4: TLabel
          Left = 5
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
          Left = 104
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
          Left = 194
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
          Left = 262
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
          Width = 323
          Height = 25
          BevelOuter = bvNone
          TabOrder = 0
          object Edit2: TEdit
            Left = 0
            Top = 0
            Width = 88
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox2: TComboBox
            Tag = 1
            Left = 98
            Top = 0
            Width = 75
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit3: TValidatedEdit
            Tag = 2
            Left = 186
            Top = 0
            Width = 57
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
            Left = 254
            Top = -1
            Width = 57
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
          Top = 59
          Width = 323
          Height = 23
          BevelOuter = bvNone
          TabOrder = 1
          object Edit3: TEdit
            Left = 0
            Top = 0
            Width = 88
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox3: TComboBox
            Tag = 1
            Left = 98
            Top = 0
            Width = 75
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit5: TValidatedEdit
            Tag = 2
            Left = 186
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
          object ValidatedEdit6: TValidatedEdit
            Tag = 3
            Left = 254
            Top = 0
            Width = 57
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
          Top = 84
          Width = 323
          Height = 24
          BevelOuter = bvNone
          TabOrder = 2
          object Edit4: TEdit
            Left = 0
            Top = 0
            Width = 88
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox4: TComboBox
            Tag = 1
            Left = 98
            Top = 0
            Width = 75
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit7: TValidatedEdit
            Tag = 2
            Left = 186
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
          object ValidatedEdit8: TValidatedEdit
            Tag = 3
            Left = 254
            Top = 0
            Width = 57
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
          Top = 108
          Width = 323
          Height = 25
          BevelOuter = bvNone
          TabOrder = 3
          object Edit5: TEdit
            Left = 0
            Top = 0
            Width = 88
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox5: TComboBox
            Tag = 1
            Left = 98
            Top = 0
            Width = 75
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit9: TValidatedEdit
            Tag = 2
            Left = 186
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
          object ValidatedEdit10: TValidatedEdit
            Tag = 3
            Left = 254
            Top = 0
            Width = 57
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
          Top = 135
          Width = 323
          Height = 22
          BevelOuter = bvNone
          TabOrder = 4
          object Edit6: TEdit
            Left = 0
            Top = 0
            Width = 88
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox6: TComboBox
            Tag = 1
            Left = 98
            Top = 0
            Width = 75
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit11: TValidatedEdit
            Tag = 2
            Left = 186
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
          object ValidatedEdit12: TValidatedEdit
            Tag = 3
            Left = 254
            Top = 0
            Width = 57
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
          Top = 161
          Width = 323
          Height = 22
          BevelOuter = bvNone
          TabOrder = 5
          object Edit7: TEdit
            Left = 0
            Top = 0
            Width = 88
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox7: TComboBox
            Tag = 1
            Left = 98
            Top = 0
            Width = 75
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit13: TValidatedEdit
            Tag = 2
            Left = 186
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
          object ValidatedEdit14: TValidatedEdit
            Tag = 3
            Left = 254
            Top = 0
            Width = 57
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
          Top = 186
          Width = 323
          Height = 22
          BevelOuter = bvNone
          TabOrder = 6
          object Edit8: TEdit
            Left = 0
            Top = 0
            Width = 88
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox8: TComboBox
            Tag = 1
            Left = 98
            Top = 0
            Width = 75
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit15: TValidatedEdit
            Tag = 2
            Left = 186
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
          object ValidatedEdit16: TValidatedEdit
            Tag = 3
            Left = 254
            Top = 0
            Width = 57
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
          Top = 210
          Width = 323
          Height = 25
          BevelOuter = bvNone
          TabOrder = 7
          object Edit9: TEdit
            Left = 0
            Top = 0
            Width = 88
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox9: TComboBox
            Tag = 1
            Left = 98
            Top = 0
            Width = 75
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit17: TValidatedEdit
            Tag = 2
            Left = 186
            Top = 2
            Width = 55
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
            Left = 254
            Top = 2
            Width = 57
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
      object CoolLEDGrp: TGroupBox
        Left = 8
        Top = 34
        Width = 352
        Height = 206
        Caption = ' CoolLED (USB Control) '
        TabOrder = 1
        object Label15: TLabel
          Left = 188
          Top = 17
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Control Port'
        end
        object cbLightSourceControlPort: TComboBox
          Left = 252
          Top = 16
          Width = 90
          Height = 21
          Style = csDropDownList
          TabOrder = 0
        end
      end
      object cbSourceType: TComboBox
        Left = 39
        Top = 8
        Width = 195
        Height = 21
        TabOrder = 2
        Text = 'cbZStageType'
        OnChange = cbSourceTypeChange
      end
    end
    object ZStageTab: TTabSheet
      Caption = 'Z Stage'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 3
        Top = 3
        Width = 219
        Height = 207
        Caption = ' Z position Control'
        TabOrder = 0
        object Label8: TLabel
          Left = 47
          Top = 40
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Control Port'
        end
        object Label10: TLabel
          Left = 40
          Top = 116
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Z scale factor'
        end
        object Label13: TLabel
          Left = 52
          Top = 143
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Z step time'
        end
        object Label12: TLabel
          Left = 40
          Top = 66
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'X scale factor'
        end
        object Label14: TLabel
          Left = 40
          Top = 92
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Y scale factor'
        end
        object cbZStagePort: TComboBox
          Left = 111
          Top = 39
          Width = 90
          Height = 21
          Style = csDropDownList
          TabOrder = 0
        end
        object edZScaleFactor: TValidatedEdit
          Left = 113
          Top = 116
          Width = 89
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
          Width = 194
          Height = 21
          TabOrder = 2
          Text = 'cbZStageType'
          OnChange = cbZStageTypeChange
        end
        object edZStepTime: TValidatedEdit
          Left = 113
          Top = 143
          Width = 89
          Height = 21
          Text = ' 100 ms'
          Value = 0.100000001490116100
          Scale = 1000.000000000000000000
          Units = 'ms'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edXScalefactor: TValidatedEdit
          Left = 113
          Top = 66
          Width = 89
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
          Left = 111
          Top = 92
          Width = 91
          Height = 21
          Text = ' 1 steps/um'
          Value = 1.000000000000000000
          Scale = 1.000000000000000000
          Units = 'steps/um'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
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
        Width = 225
        Height = 334
        Caption = ' Lens Table '
        TabOrder = 0
        object Label2: TLabel
          Left = 79
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
          Left = 29
          Top = 306
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
          Left = 161
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
          Top = 38
          Width = 207
          Height = 261
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
        end
        object edRelayLensMagnification: TValidatedEdit
          Left = 169
          Top = 306
          Width = 41
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
          Left = 194
          Top = 14
          Width = 18
          Height = 20
          Min = -100
          Position = 1
          TabOrder = 3
          OnChangingEx = udNumLensesChangingEx
        end
      end
    end
  end
end
