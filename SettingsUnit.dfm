object SettingsFrm: TSettingsFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Camera/System Settings '
  ClientHeight = 457
  ClientWidth = 521
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
    Top = 415
    Width = 65
    Height = 25
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
    Left = 79
    Top = 415
    Width = 72
    Height = 20
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
    Width = 497
    Height = 401
    ActivePage = LightSourceTab
    TabOrder = 2
    object CameraTab: TTabSheet
      Caption = 'Camera'
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 225
        Height = 354
        Caption = ' Camera '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label41: TLabel
          Left = 33
          Top = 306
          Width = 90
          Height = 14
          Alignment = taRightJustify
          Caption = 'Tempr. Set Point'
        end
        object cbCamera: TComboBox
          Left = 8
          Top = 16
          Width = 209
          Height = 22
          TabOrder = 0
          Text = 'cbCamera'
          OnChange = cbCameraChange
        end
        object ModePanel: TPanel
          Left = 8
          Top = 40
          Width = 210
          Height = 44
          BevelOuter = bvNone
          TabOrder = 1
          object lbCameraMode: TLabel
            Left = 0
            Top = 3
            Width = 31
            Height = 14
            Alignment = taRightJustify
            Caption = 'Mode'
          end
          object cbCameraMode: TComboBox
            Left = 0
            Top = 19
            Width = 209
            Height = 22
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbCameraModeChange
          end
        end
        object ComPanel: TPanel
          Left = 8
          Top = 124
          Width = 210
          Height = 30
          BevelOuter = bvNone
          TabOrder = 2
          object lbComPort: TLabel
            Left = 52
            Top = 3
            Width = 52
            Height = 14
            Alignment = taRightJustify
            Caption = 'COM Port'
          end
          object cbCameraPort: TComboBox
            Left = 112
            Top = 3
            Width = 97
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
          Top = 94
          Width = 210
          Height = 30
          BevelOuter = bvNone
          TabOrder = 3
          object Label1: TLabel
            Left = 21
            Top = 3
            Width = 83
            Height = 14
            Alignment = taRightJustify
            Caption = 'Readout Speed'
          end
          object cbReadoutSpeed: TComboBox
            Left = 112
            Top = 3
            Width = 97
            Height = 22
            Style = csDropDownList
            TabOrder = 0
          end
        end
        object edTemperatureSetPoint: TValidatedEdit
          Left = 127
          Top = 306
          Width = 81
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
          Top = 154
          Width = 210
          Height = 30
          BevelOuter = bvNone
          TabOrder = 5
          object Label48: TLabel
            Left = 3
            Top = 3
            Width = 77
            Height = 14
            Alignment = taRightJustify
            Caption = 'A/D Converter'
          end
          object cbCameraADC: TComboBox
            Left = 86
            Top = 1
            Width = 121
            Height = 22
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbCameraADCChange
          end
        end
        object CameraPanel: TPanel
          Left = 13
          Top = 190
          Width = 209
          Height = 48
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
            Width = 209
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
          Left = 3
          Top = 326
          Width = 205
          Height = 25
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
          Left = 8
          Top = 248
          Width = 209
          Height = 52
          BevelOuter = bvNone
          TabOrder = 8
        end
      end
      object CalibrationGrp: TGroupBox
        Left = 239
        Top = 9
        Width = 240
        Height = 73
        Caption = ' Lens '
        TabOrder = 1
        object Label2: TLabel
          Left = 40
          Top = 16
          Width = 104
          Height = 14
          Alignment = taRightJustify
          Caption = 'Lens Magnification'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 46
          Top = 42
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
        object edLensMagnification: TValidatedEdit
          Left = 150
          Top = 16
          Width = 81
          Height = 20
          AutoSize = False
          Text = ' 10 X'
          Value = 10.000000000000000000
          Scale = 1.000000000000000000
          Units = 'X'
          NumberFormat = '%.4g'
          LoLimit = 0.001000000047497451
          HiLimit = 1000.000000000000000000
        end
        object edCameraPixelSize: TValidatedEdit
          Left = 150
          Top = 42
          Width = 81
          Height = 20
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
        Left = 240
        Top = 88
        Width = 240
        Height = 81
        Caption = ' Camera Trigger '
        TabOrder = 2
        object Label3: TLabel
          Left = 20
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
          Left = 142
          Top = 20
          Width = 88
          Height = 21
          TabOrder = 0
          Text = 'cbLaserControlComPort'
        end
        object rbCameraTriggerActiveHigh: TRadioButton
          Left = 50
          Top = 45
          Width = 81
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
          Left = 142
          Top = 45
          Width = 89
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
    end
    object LightSourceTab: TTabSheet
      Caption = 'Light Source'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 3
        Width = 313
        Height = 270
        Caption = ' Light Sources '
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 20
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
          Left = 90
          Top = 20
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
          Left = 178
          Top = 20
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
          Left = 244
          Top = 20
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
          Top = 36
          Width = 305
          Height = 25
          BevelOuter = bvNone
          TabOrder = 0
          object Edit2: TEdit
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox2: TComboBox
            Tag = 1
            Left = 82
            Top = 0
            Width = 80
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit3: TValidatedEdit
            Tag = 2
            Left = 170
            Top = 0
            Width = 60
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
            Left = 236
            Top = 0
            Width = 60
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
          Top = 63
          Width = 305
          Height = 25
          BevelOuter = bvNone
          TabOrder = 1
          object Edit3: TEdit
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox3: TComboBox
            Tag = 1
            Left = 82
            Top = 0
            Width = 80
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit5: TValidatedEdit
            Tag = 2
            Left = 170
            Top = 0
            Width = 60
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
            Left = 236
            Top = 0
            Width = 60
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
          Top = 90
          Width = 305
          Height = 25
          BevelOuter = bvNone
          TabOrder = 2
          object Edit4: TEdit
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox4: TComboBox
            Tag = 1
            Left = 82
            Top = 0
            Width = 80
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit7: TValidatedEdit
            Tag = 2
            Left = 170
            Top = 0
            Width = 60
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
            Left = 236
            Top = 0
            Width = 60
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
          Top = 117
          Width = 305
          Height = 25
          BevelOuter = bvNone
          TabOrder = 3
          object Edit5: TEdit
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox5: TComboBox
            Tag = 1
            Left = 82
            Top = 0
            Width = 80
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit9: TValidatedEdit
            Tag = 2
            Left = 170
            Top = 0
            Width = 60
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
            Left = 236
            Top = 0
            Width = 60
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
          Top = 144
          Width = 305
          Height = 25
          BevelOuter = bvNone
          TabOrder = 4
          object Edit6: TEdit
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox6: TComboBox
            Tag = 1
            Left = 82
            Top = 0
            Width = 80
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit11: TValidatedEdit
            Tag = 2
            Left = 170
            Top = 0
            Width = 60
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
            Left = 236
            Top = 0
            Width = 60
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
          Top = 171
          Width = 305
          Height = 25
          BevelOuter = bvNone
          TabOrder = 5
          object Edit7: TEdit
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox7: TComboBox
            Tag = 1
            Left = 82
            Top = 0
            Width = 80
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit13: TValidatedEdit
            Tag = 2
            Left = 170
            Top = 0
            Width = 60
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
            Left = 236
            Top = 0
            Width = 60
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
          Top = 198
          Width = 305
          Height = 25
          BevelOuter = bvNone
          TabOrder = 6
          object Edit8: TEdit
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox8: TComboBox
            Tag = 1
            Left = 82
            Top = 0
            Width = 80
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit15: TValidatedEdit
            Tag = 2
            Left = 170
            Top = 0
            Width = 60
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
            Left = 236
            Top = 0
            Width = 60
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
          Top = 225
          Width = 305
          Height = 25
          BevelOuter = bvNone
          TabOrder = 7
          object Edit9: TEdit
            Left = 0
            Top = 0
            Width = 80
            Height = 21
            TabOrder = 0
            Text = 'Name?'
          end
          object ComboBox9: TComboBox
            Tag = 1
            Left = 82
            Top = 0
            Width = 80
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object ValidatedEdit17: TValidatedEdit
            Tag = 2
            Left = 170
            Top = 0
            Width = 60
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
            Left = 236
            Top = 0
            Width = 60
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
    end
    object ZStageTab: TTabSheet
      Caption = 'Z Stage'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 4
        Top = 8
        Width = 234
        Height = 125
        Caption = ' Z position Control'
        TabOrder = 0
        object Label8: TLabel
          Left = 56
          Top = 43
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Control Port'
        end
        object Label10: TLabel
          Left = 49
          Top = 68
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Z scale factor'
        end
        object Label13: TLabel
          Left = 61
          Top = 95
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Z step time'
        end
        object cbZStagePort: TComboBox
          Left = 120
          Top = 43
          Width = 97
          Height = 21
          Style = csDropDownList
          TabOrder = 0
        end
        object edZScaleFactor: TValidatedEdit
          Left = 120
          Top = 68
          Width = 97
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
          Width = 209
          Height = 21
          TabOrder = 2
          Text = 'cbZStageType'
          OnChange = cbZStageTypeChange
        end
        object edZStepTime: TValidatedEdit
          Left = 120
          Top = 95
          Width = 97
          Height = 21
          Text = ' 100 ms'
          Value = 0.100000001490116100
          Scale = 1000.000000000000000000
          Units = 'ms'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
      end
    end
  end
end
