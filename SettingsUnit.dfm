object SettingsFrm: TSettingsFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Camera/System Settings '
  ClientHeight = 622
  ClientWidth = 676
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
    Top = 581
    Width = 85
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
    Left = 102
    Top = 581
    Width = 93
    Height = 26
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
    Width = 643
    Height = 562
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = LightSourceTab
    TabOrder = 2
    object CameraTab: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Camera'
      object GroupBox4: TGroupBox
        Left = 11
        Top = 4
        Width = 291
        Height = 516
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
        object Label41: TLabel
          Left = 29
          Top = 441
          Width = 117
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Tempr. Set Point'
        end
        object Label9: TLabel
          Left = 36
          Top = 408
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
        object cbCamera: TComboBox
          Left = 11
          Top = 22
          Width = 269
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
          Top = 51
          Width = 271
          Height = 57
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 1
          object lbCameraMode: TLabel
            Left = 1
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
            Width = 269
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
          Top = 160
          Width = 271
          Height = 39
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 2
          object lbComPort: TLabel
            Left = 65
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
            Left = 146
            Top = 4
            Width = 123
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
          Top = 122
          Width = 271
          Height = 38
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 3
          object Label1: TLabel
            Left = 25
            Top = 4
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
            Left = 142
            Top = 3
            Width = 126
            Height = 26
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            TabOrder = 0
          end
        end
        object edTemperatureSetPoint: TValidatedEdit
          Left = 171
          Top = 441
          Width = 105
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          AutoSize = False
          Text = ' 0 DEGC'
          Scale = 1.000000000000000000
          Units = 'DEGC'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1.000000015047466E30
        end
        object ADCPanel: TPanel
          Left = 9
          Top = 199
          Width = 271
          Height = 39
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 5
          object Label48: TLabel
            Left = 3
            Top = 4
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
            Left = 111
            Top = 1
            Width = 157
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
          Top = 246
          Width = 269
          Height = 63
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 6
          object Label77: TLabel
            Left = 5
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
            Width = 269
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
        object ckDisableExposureIntervalLimit: TCheckBox
          Left = 8
          Top = 477
          Width = 266
          Height = 32
          Hint = 
            'Q Imaging cameras only: Tick to allow exposure intervals less th' +
            'an reported readout time of camera '
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taLeftJustify
          Caption = 'Disable Exposure Time Checking'
          Ctl3D = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object CamTriggerPanel: TPanel
          Left = 18
          Top = 317
          Width = 269
          Height = 65
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 8
        end
        object edCameraPixelSize: TValidatedEdit
          Left = 171
          Top = 408
          Width = 105
          Height = 27
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
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
        Left = 310
        Top = 8
        Width = 310
        Height = 104
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Camera Trigger '
        TabOrder = 1
        object Label3: TLabel
          Left = 22
          Top = 27
          Width = 154
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Exposure Trigger O/P'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbCameraTrigger: TComboBox
          Left = 184
          Top = 27
          Width = 114
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 0
          Text = 'cbLaserControlComPort'
        end
        object rbCameraTriggerActiveHigh: TRadioButton
          Left = 65
          Top = 58
          Width = 104
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Active High'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          TabStop = True
        end
        object rbCameraTriggerActiveLow: TRadioButton
          Left = 184
          Top = 58
          Width = 115
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Active Low'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox5: TGroupBox
        Left = 310
        Top = 130
        Width = 312
        Height = 116
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
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
        object edImageJPath: TEdit
          Left = 11
          Top = 34
          Width = 280
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 0
          Text = 'edImageJPath'
        end
        object ckSaveAsMultipageTIFF: TCheckBox
          Left = 33
          Top = 69
          Width = 258
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
      object LEDGrp: TGroupBox
        Left = 11
        Top = 49
        Width = 487
        Height = 349
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' LED (Digital/Analogue Control) '
        TabOrder = 0
        object Label4: TLabel
          Left = 10
          Top = 24
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
          Left = 150
          Top = 24
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
          Left = 268
          Top = 24
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
          Left = 363
          Top = 24
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
          Top = 46
          Width = 447
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
            Width = 122
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
            Left = 135
            Top = 0
            Width = 105
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
            Left = 257
            Top = 0
            Width = 80
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
            Left = 352
            Top = -1
            Width = 79
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
          Top = 81
          Width = 447
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 1
          object Edit3: TEdit
            Left = 0
            Top = 0
            Width = 122
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
            Left = 135
            Top = 0
            Width = 105
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
            Left = 257
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
          object ValidatedEdit6: TValidatedEdit
            Tag = 3
            Left = 352
            Top = 0
            Width = 79
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
          Top = 116
          Width = 447
          Height = 34
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 2
          object Edit4: TEdit
            Left = 0
            Top = 0
            Width = 122
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
            Left = 135
            Top = 0
            Width = 105
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
            Left = 257
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
          object ValidatedEdit8: TValidatedEdit
            Tag = 3
            Left = 352
            Top = 0
            Width = 79
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
          Top = 150
          Width = 447
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
            Width = 122
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
            Left = 135
            Top = 0
            Width = 105
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
            Left = 257
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
          object ValidatedEdit10: TValidatedEdit
            Tag = 3
            Left = 352
            Top = 0
            Width = 79
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
          Top = 187
          Width = 447
          Height = 31
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 4
          object Edit6: TEdit
            Left = 0
            Top = 0
            Width = 122
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
            Left = 135
            Top = 0
            Width = 105
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
            Left = 257
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
          object ValidatedEdit12: TValidatedEdit
            Tag = 3
            Left = 352
            Top = 0
            Width = 79
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
          Top = 223
          Width = 447
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
            Width = 122
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
            Left = 135
            Top = 0
            Width = 105
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
            Left = 257
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
          object ValidatedEdit14: TValidatedEdit
            Tag = 3
            Left = 352
            Top = 0
            Width = 79
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
          Top = 257
          Width = 447
          Height = 31
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelOuter = bvNone
          TabOrder = 6
          object Edit8: TEdit
            Left = 0
            Top = 0
            Width = 122
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
            Left = 135
            Top = 0
            Width = 105
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
            Left = 257
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
          object ValidatedEdit16: TValidatedEdit
            Tag = 3
            Left = 352
            Top = 0
            Width = 79
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
          Top = 291
          Width = 447
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
            Width = 122
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
            Left = 135
            Top = 0
            Width = 105
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
            Left = 257
            Top = 3
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
          object ValidatedEdit18: TValidatedEdit
            Tag = 3
            Left = 352
            Top = 3
            Width = 79
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
      object CoolLEDGrp: TGroupBox
        Left = 11
        Top = 47
        Width = 487
        Height = 285
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' CoolLED (USB Control) '
        TabOrder = 1
        object Label15: TLabel
          Left = 265
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
          Left = 349
          Top = 22
          Width = 124
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
        Left = 54
        Top = 11
        Width = 270
        Height = 26
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
        Text = 'cbZStageType'
        OnChange = cbSourceTypeChange
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
        Left = 4
        Top = 4
        Width = 303
        Height = 287
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Z position Control'
        TabOrder = 0
        object Label8: TLabel
          Left = 70
          Top = 56
          Width = 76
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Control Port'
        end
        object Label10: TLabel
          Left = 58
          Top = 161
          Width = 88
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Z scale factor'
        end
        object Label13: TLabel
          Left = 72
          Top = 198
          Width = 74
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Z step time'
        end
        object Label12: TLabel
          Left = 57
          Top = 91
          Width = 89
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'X scale factor'
        end
        object Label14: TLabel
          Left = 56
          Top = 127
          Width = 90
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = 'Y scale factor'
        end
        object cbZStagePort: TComboBox
          Left = 154
          Top = 54
          Width = 124
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          TabOrder = 0
        end
        object edZScaleFactor: TValidatedEdit
          Left = 157
          Top = 161
          Width = 123
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
          Width = 269
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 2
          Text = 'cbZStageType'
          OnChange = cbZStageTypeChange
        end
        object edZStepTime: TValidatedEdit
          Left = 157
          Top = 198
          Width = 123
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ' 100 ms'
          Value = 0.100000001490116100
          Scale = 1000.000000000000000000
          Units = 'ms'
          NumberFormat = '%.4g'
          LoLimit = -1.000000015047466E30
          HiLimit = 1000000.000000000000000000
        end
        object edXScalefactor: TValidatedEdit
          Left = 157
          Top = 91
          Width = 123
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
          Left = 154
          Top = 127
          Width = 126
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
        Width = 311
        Height = 463
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Lens Table '
        TabOrder = 0
        object Label2: TLabel
          Left = 116
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
          Left = 51
          Top = 423
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
          Left = 223
          Top = 22
          Width = 51
          Height = 24
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
          Top = 53
          Width = 287
          Height = 361
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
          Left = 234
          Top = 423
          Width = 57
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
          Left = 269
          Top = 19
          Width = 24
          Height = 28
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
