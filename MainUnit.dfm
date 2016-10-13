object MainFrm: TMainFrm
  Left = 794
  Top = 357
  Caption = 'MesoScan V1.5.1 32 bit 8/07/13'
<<<<<<< HEAD
  ClientHeight = 1106
  ClientWidth = 1273
=======
  ClientHeight = 899
  ClientWidth = 1034
>>>>>>> origin/master
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 130
  TextHeight = 16
  object lbReadout: TLabel
<<<<<<< HEAD
    Left = 339
    Top = 406
    Width = 4
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
=======
    Left = 275
    Top = 330
    Width = 3
    Height = 15
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
>>>>>>> origin/master
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ControlGrp: TGroupBox
<<<<<<< HEAD
    Left = 11
    Top = 11
    Width = 294
    Height = 328
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Camera '
    TabOrder = 0
    object Label7: TLabel
      Left = 156
      Top = 22
      Width = 107
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Exposure Time'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
=======
    Left = 9
    Top = 9
    Width = 239
    Height = 266
    Caption = ' Camera '
    TabOrder = 0
    object Label7: TLabel
      Left = 127
      Top = 18
      Width = 85
      Height = 15
      Caption = 'Exposure Time'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label8: TLabel
<<<<<<< HEAD
      Left = 163
      Top = 84
      Width = 28
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 133
      Top = 68
      Width = 22
      Height = 13
>>>>>>> origin/master
      Alignment = taRightJustify
      Caption = 'Gain'
    end
    object bCaptureImage: TButton
<<<<<<< HEAD
      Left = 11
      Top = 92
      Width = 137
      Height = 27
=======
      Left = 9
      Top = 75
      Width = 111
      Height = 22
>>>>>>> origin/master
      Hint = 'Capture new image(s)'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Capture Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -16
=======
      Font.Height = -13
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bCaptureImageClick
    end
    object bStopImage: TButton
<<<<<<< HEAD
      Left = 8
      Top = 160
      Width = 137
      Height = 27
=======
      Left = 7
      Top = 130
      Width = 111
      Height = 22
>>>>>>> origin/master
      Hint = 'Stop Image Capture'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Stop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -16
=======
      Font.Height = -13
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bStopImageClick
    end
    object bLiveImage: TButton
<<<<<<< HEAD
      Left = 11
      Top = 22
      Width = 137
      Height = 27
=======
      Left = 9
      Top = 18
      Width = 111
      Height = 22
>>>>>>> origin/master
      Hint = 'Display live images from camera'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Live Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -16
=======
      Font.Height = -13
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bLiveImageClick
    end
    object cbCaptureMode: TComboBox
<<<<<<< HEAD
      Left = 11
      Top = 123
      Width = 137
      Height = 24
=======
      Left = 9
      Top = 100
      Width = 111
      Height = 21
>>>>>>> origin/master
      Hint = 'Select image superresolution mode (pixel-shifting  cameras only)'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = cbCaptureModeChange
    end
    object edExposureTime: TValidatedEdit
<<<<<<< HEAD
      Left = 156
      Top = 49
      Width = 77
      Height = 24
=======
      Left = 127
      Top = 40
      Width = 62
      Height = 21
>>>>>>> origin/master
      Hint = 'Exposure time (ms)'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnKeyPress = edExposureTimeKeyPress
      ShowHint = True
      Text = ' 1 ms'
      Value = 0.001000000047497451
      Scale = 1000.000000000000000000
      Units = 'ms'
      NumberFormat = '%.4g'
      LoLimit = 0.000009999999747379
      HiLimit = 7.000000000000000000
    end
    object CCDAreaGrp: TGroupBox
<<<<<<< HEAD
      Left = 4
      Top = 195
      Width = 142
      Height = 111
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'CCD Area '
      TabOrder = 5
      object bFullFrame: TButton
        Left = 8
        Top = 22
        Width = 121
        Height = 23
=======
      Left = 3
      Top = 158
      Width = 116
      Height = 91
      Caption = 'CCD Area '
      TabOrder = 5
      object bFullFrame: TButton
        Left = 7
        Top = 18
        Width = 98
        Height = 19
>>>>>>> origin/master
        Hint = 'Set CCD readout area to whole of CCD'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Full CCD area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
<<<<<<< HEAD
        Font.Height = -16
=======
        Font.Height = -13
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bFullFrameClick
      end
      object bSelectedRegion: TButton
<<<<<<< HEAD
        Left = 8
        Top = 49
        Width = 121
        Height = 23
=======
        Left = 7
        Top = 40
        Width = 98
        Height = 19
>>>>>>> origin/master
        Hint = 'Set CCD readout area to rectangle indicated on display '
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Use R.O.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
<<<<<<< HEAD
        Font.Height = -16
=======
        Font.Height = -13
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bSelectedRegionClick
      end
      object bEnterCCDArea: TButton
<<<<<<< HEAD
        Left = 8
        Top = 76
        Width = 121
        Height = 23
=======
        Left = 7
        Top = 62
        Width = 98
        Height = 18
>>>>>>> origin/master
        Hint = 'Specify coordinates of CCD readout area'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Set CCD area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
<<<<<<< HEAD
        Font.Height = -16
=======
        Font.Height = -13
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bEnterCCDAreaClick
      end
    end
    object cbCameraGain: TComboBox
<<<<<<< HEAD
      Left = 156
      Top = 110
      Width = 77
      Height = 28
=======
      Left = 127
      Top = 89
      Width = 62
      Height = 24
>>>>>>> origin/master
      Hint = 'Camera analog gain'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -15
=======
      Font.Height = -12
>>>>>>> origin/master
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = cbCameraGainChange
    end
    object cbLiveBin: TComboBox
<<<<<<< HEAD
      Left = 11
      Top = 49
      Width = 137
      Height = 24
=======
      Left = 9
      Top = 40
      Width = 111
      Height = 21
>>>>>>> origin/master
      Hint = 'Live image binning mode'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnChange = cbLiveBinChange
    end
  end
  object ImageSizeGrp: TGroupBox
<<<<<<< HEAD
    Left = 11
    Top = 347
    Width = 294
    Height = 245
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Image Mode'
    TabOrder = 1
    object ZStackGrp: TGroupBox
      Left = 11
      Top = 79
      Width = 271
      Height = 124
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 0
      object Label5: TLabel
        Left = 82
        Top = 14
        Width = 74
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
    Left = 9
    Top = 282
    Width = 239
    Height = 199
    Caption = ' Image Mode'
    TabOrder = 1
    object ZStackGrp: TGroupBox
      Left = 9
      Top = 64
      Width = 220
      Height = 101
      TabOrder = 0
      object Label5: TLabel
        Left = 68
        Top = 11
        Width = 59
        Height = 13
>>>>>>> origin/master
        Alignment = taRightJustify
        Caption = 'No. sections'
      end
      object Label6: TLabel
<<<<<<< HEAD
        Left = 14
        Top = 49
        Width = 142
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 16
        Top = 40
        Width = 111
        Height = 13
>>>>>>> origin/master
        Alignment = taRightJustify
        Caption = 'Section spacing (pixels)'
      end
      object Label1: TLabel
<<<<<<< HEAD
        Left = 31
        Top = 84
        Width = 125
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 28
        Top = 68
        Width = 99
        Height = 13
>>>>>>> origin/master
        Alignment = taRightJustify
        Caption = 'Section spacing (um)'
      end
      object edNumZSections: TValidatedEdit
<<<<<<< HEAD
        Left = 164
        Top = 14
        Width = 95
        Height = 24
=======
        Left = 133
        Top = 11
        Width = 77
        Height = 21
>>>>>>> origin/master
        Hint = 'No. of sections in Z stack'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        Text = ' 1 '
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        NumberFormat = '%.0f'
        LoLimit = 1.000000000000000000
        HiLimit = 20000.000000000000000000
      end
      object edNumPixelsPerZStep: TValidatedEdit
<<<<<<< HEAD
        Left = 164
        Top = 49
        Width = 95
        Height = 24
=======
        Left = 133
        Top = 40
        Width = 77
        Height = 21
>>>>>>> origin/master
        Hint = 'Z increment between sections'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        OnKeyPress = edNumPixelsPerZStepKeyPress
        Text = ' 1 '
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        NumberFormat = '%.0f'
        LoLimit = -100.000000000000000000
        HiLimit = 100.000000000000000000
      end
      object edMicronsPerZStep: TValidatedEdit
<<<<<<< HEAD
        Left = 164
        Top = 84
        Width = 95
        Height = 24
=======
        Left = 133
        Top = 68
        Width = 77
        Height = 21
>>>>>>> origin/master
        Hint = 'Z position increment between sections'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        OnKeyPress = edMicronsPerZStepKeyPress
        Text = ' 0.00 um'
        Scale = 1.000000000000000000
        Units = 'um'
        NumberFormat = '%.2f'
        LoLimit = -1000.000000000000000000
        HiLimit = 1000.000000000000000000
      end
    end
    object ckSeparateLightSources: TCheckBox
<<<<<<< HEAD
      Left = 11
      Top = 22
      Width = 261
      Height = 23
=======
      Left = 9
      Top = 18
      Width = 212
      Height = 19
>>>>>>> origin/master
      Hint = 
        'Check to produce separate, sequentially acquired  images for eac' +
        'h light source in use. '
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Separate Light Source Images'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -15
=======
      Font.Height = -12
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ckSeparateLightSourcesClick
    end
    object ckAcquireZStack: TCheckBox
<<<<<<< HEAD
      Left = 11
      Top = 47
      Width = 261
      Height = 23
=======
      Left = 9
      Top = 38
      Width = 212
      Height = 19
>>>>>>> origin/master
      Hint = 
        'Check to acquire a series of image at incremental Z axis positio' +
        'ns'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Acquire Z Stack'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -15
=======
      Font.Height = -12
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ckAcquireZStackClick
    end
  end
  object ZStageGrp: TGroupBox
<<<<<<< HEAD
    Left = 11
    Top = 492
    Width = 294
    Height = 101
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Z Position '
    TabOrder = 2
    object edZTop: TValidatedEdit
      Left = 16
      Top = 23
      Width = 260
      Height = 24
=======
    Left = 9
    Top = 400
    Width = 239
    Height = 82
    Caption = 'Z Position '
    TabOrder = 2
    object edZTop: TValidatedEdit
      Left = 13
      Top = 19
      Width = 211
      Height = 21
>>>>>>> origin/master
      Hint = 'Stage position on Z axis'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      Text = ' 0.00 um'
      Scale = 1.000000000000000000
      Units = 'um'
      NumberFormat = '%.2f'
      LoLimit = -10.000000000000000000
      HiLimit = 10.000000000000000000
    end
    object edGotoZPosition: TValidatedEdit
<<<<<<< HEAD
      Left = 139
      Top = 57
      Width = 139
      Height = 24
=======
      Left = 113
      Top = 46
      Width = 113
      Height = 21
>>>>>>> origin/master
      Hint = 'Z axis position to move to'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnKeyPress = edGotoZPositionKeyPress
      ShowHint = True
      Text = ' 0.00 um'
      Scale = 1.000000000000000000
      Units = 'um'
      NumberFormat = '%.2f'
      LoLimit = -1000000.000000000000000000
      HiLimit = 1000000.000000000000000000
    end
    object bGotoZPosition: TButton
<<<<<<< HEAD
      Left = 22
      Top = 60
      Width = 109
      Height = 23
=======
      Left = 18
      Top = 49
      Width = 88
      Height = 18
>>>>>>> origin/master
      Hint = 'Move stage to specified Z axis position'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Go To'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -16
=======
      Font.Height = -13
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bGotoZPositionClick
    end
  end
  object LightSourceGrp: TGroupBox
<<<<<<< HEAD
    Left = 11
    Top = 601
    Width = 294
    Height = 236
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Light Source '
    TabOrder = 3
    object pnLightSource0: TPanel
      Left = 11
      Top = 26
      Width = 271
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
    Left = 9
    Top = 488
    Width = 239
    Height = 192
    Caption = ' Light Source '
    TabOrder = 3
    object pnLightSource0: TPanel
      Left = 9
      Top = 21
      Width = 220
      Height = 29
>>>>>>> origin/master
      BevelOuter = bvNone
      TabOrder = 0
      object ckLightSourceOn: TCheckBox
        Left = 0
        Top = 0
<<<<<<< HEAD
        Width = 45
        Height = 23
=======
        Width = 37
        Height = 19
>>>>>>> origin/master
        Hint = 'Turn Light Source 0 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        TabOrder = 0
        OnClick = ckLightSourceOnClick
      end
      object edName: TEdit
        Tag = 1
<<<<<<< HEAD
        Left = 46
        Top = 0
        Width = 75
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 37
        Top = 0
        Width = 61
        Height = 21
>>>>>>> origin/master
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar1: TTrackBar
        Tag = 2
<<<<<<< HEAD
        Left = 119
        Top = 0
        Width = 81
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 97
        Top = 0
        Width = 66
        Height = 28
>>>>>>> origin/master
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit1: TValidatedEdit
        Tag = 3
<<<<<<< HEAD
        Left = 203
        Top = 0
        Width = 60
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 165
        Top = 0
        Width = 49
        Height = 21
>>>>>>> origin/master
        OnKeyPress = ValidatedEdit1KeyPress
        Text = ' 2 %'
        Value = 2.000000000000000000
        Scale = 1.000000000000000000
        Units = '%'
        NumberFormat = '%.0f'
        LoLimit = 0.000000999999997475
        HiLimit = 100.000000000000000000
      end
    end
    object pnLightSource1: TPanel
<<<<<<< HEAD
      Left = 11
      Top = 62
      Width = 271
      Height = 36
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 9
      Top = 50
      Width = 220
      Height = 30
>>>>>>> origin/master
      BevelOuter = bvNone
      TabOrder = 1
      object CheckBox1: TCheckBox
        Left = 0
        Top = 0
<<<<<<< HEAD
        Width = 45
        Height = 23
=======
        Width = 37
        Height = 19
>>>>>>> origin/master
        Hint = 'Turn Light Source 1 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
<<<<<<< HEAD
        Font.Height = -15
=======
        Font.Height = -12
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ckLightSourceOnClick
      end
      object Edit1: TEdit
        Tag = 1
<<<<<<< HEAD
        Left = 46
        Top = 0
        Width = 75
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 37
        Top = 0
        Width = 61
        Height = 21
>>>>>>> origin/master
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar2: TTrackBar
        Tag = 2
<<<<<<< HEAD
        Left = 119
        Top = 0
        Width = 81
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 97
        Top = 0
        Width = 66
        Height = 28
>>>>>>> origin/master
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit2: TValidatedEdit
        Tag = 3
<<<<<<< HEAD
        Left = 203
        Top = 0
        Width = 60
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 165
        Top = 0
        Width = 49
        Height = 21
>>>>>>> origin/master
        OnKeyPress = ValidatedEdit1KeyPress
        Text = ' 2 %'
        Value = 2.000000000000000000
        Scale = 1.000000000000000000
        Units = '%'
        NumberFormat = '%.0f'
        LoLimit = 0.000000999999997475
        HiLimit = 100.000000000000000000
      end
    end
    object pnLightSource2: TPanel
<<<<<<< HEAD
      Left = 11
      Top = 99
      Width = 271
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 9
      Top = 80
      Width = 220
      Height = 29
>>>>>>> origin/master
      BevelOuter = bvNone
      TabOrder = 2
      object CheckBox2: TCheckBox
        Left = 0
        Top = 0
<<<<<<< HEAD
        Width = 45
        Height = 23
=======
        Width = 37
        Height = 19
>>>>>>> origin/master
        Hint = 'Turn Light Source 2 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
<<<<<<< HEAD
        Font.Height = -15
=======
        Font.Height = -12
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ckLightSourceOnClick
      end
      object Edit2: TEdit
        Tag = 1
<<<<<<< HEAD
        Left = 46
        Top = 0
        Width = 75
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 37
        Top = 0
        Width = 61
        Height = 21
>>>>>>> origin/master
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar3: TTrackBar
        Tag = 2
<<<<<<< HEAD
        Left = 119
        Top = 0
        Width = 81
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 97
        Top = 0
        Width = 66
        Height = 28
>>>>>>> origin/master
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit3: TValidatedEdit
        Tag = 3
<<<<<<< HEAD
        Left = 203
        Top = 0
        Width = 60
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 165
        Top = 0
        Width = 49
        Height = 21
>>>>>>> origin/master
        OnKeyPress = ValidatedEdit1KeyPress
        Text = ' 2 %'
        Value = 2.000000000000000000
        Scale = 1.000000000000000000
        Units = '%'
        NumberFormat = '%.0f'
        LoLimit = 0.000000999999997475
        HiLimit = 100.000000000000000000
      end
    end
    object pnLightSource3: TPanel
<<<<<<< HEAD
      Left = 11
      Top = 130
      Width = 271
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 9
      Top = 106
      Width = 220
      Height = 28
>>>>>>> origin/master
      BevelOuter = bvNone
      TabOrder = 3
      object CheckBox3: TCheckBox
        Left = 0
        Top = 0
<<<<<<< HEAD
        Width = 45
        Height = 23
=======
        Width = 37
        Height = 19
>>>>>>> origin/master
        Hint = 'Turn Light Source 3 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
<<<<<<< HEAD
        Font.Height = -15
=======
        Font.Height = -12
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ckLightSourceOnClick
      end
      object Edit3: TEdit
        Tag = 1
<<<<<<< HEAD
        Left = 46
        Top = 0
        Width = 75
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 37
        Top = 0
        Width = 61
        Height = 21
>>>>>>> origin/master
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar4: TTrackBar
        Tag = 2
<<<<<<< HEAD
        Left = 119
        Top = 0
        Width = 81
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 97
        Top = 0
        Width = 66
        Height = 28
>>>>>>> origin/master
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit4: TValidatedEdit
        Tag = 3
<<<<<<< HEAD
        Left = 203
        Top = 0
        Width = 60
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 165
        Top = 0
        Width = 49
        Height = 21
>>>>>>> origin/master
        OnKeyPress = ValidatedEdit1KeyPress
        Text = ' 2 %'
        Value = 2.000000000000000000
        Scale = 1.000000000000000000
        Units = '%'
        NumberFormat = '%.0f'
        LoLimit = 0.000000999999997475
        HiLimit = 100.000000000000000000
      end
    end
    object pnLightSource4: TPanel
<<<<<<< HEAD
      Left = 11
      Top = 167
      Width = 271
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 9
      Top = 136
      Width = 220
      Height = 28
>>>>>>> origin/master
      BevelOuter = bvNone
      TabOrder = 4
      object CheckBox4: TCheckBox
        Left = 0
        Top = 0
<<<<<<< HEAD
        Width = 45
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
=======
        Width = 37
        Height = 19
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOnClick
      end
      object Edit4: TEdit
        Tag = 1
<<<<<<< HEAD
        Left = 46
        Top = 0
        Width = 75
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 37
        Top = 0
        Width = 61
        Height = 21
>>>>>>> origin/master
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar5: TTrackBar
        Tag = 2
<<<<<<< HEAD
        Left = 114
        Top = 0
        Width = 81
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 93
        Top = 0
        Width = 65
        Height = 28
>>>>>>> origin/master
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit5: TValidatedEdit
        Tag = 3
<<<<<<< HEAD
        Left = 203
        Top = 0
        Width = 60
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 165
        Top = 0
        Width = 49
        Height = 21
>>>>>>> origin/master
        OnKeyPress = ValidatedEdit1KeyPress
        Text = ' 2 %'
        Value = 2.000000000000000000
        Scale = 1.000000000000000000
        Units = '%'
        NumberFormat = '%.0f'
        LoLimit = 0.000000999999997475
        HiLimit = 100.000000000000000000
      end
    end
    object pnLightSource5: TPanel
<<<<<<< HEAD
      Left = 11
      Top = 203
      Width = 271
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 9
      Top = 165
      Width = 220
      Height = 28
>>>>>>> origin/master
      BevelOuter = bvNone
      TabOrder = 5
      object CheckBox5: TCheckBox
        Left = 0
        Top = 0
<<<<<<< HEAD
        Width = 45
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
=======
        Width = 37
        Height = 19
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOnClick
      end
      object Edit5: TEdit
        Tag = 1
<<<<<<< HEAD
        Left = 46
        Top = 0
        Width = 75
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 37
        Top = 0
        Width = 61
        Height = 21
>>>>>>> origin/master
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar6: TTrackBar
        Tag = 2
<<<<<<< HEAD
        Left = 119
        Top = 0
        Width = 81
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 97
        Top = 0
        Width = 66
        Height = 28
>>>>>>> origin/master
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit6: TValidatedEdit
        Tag = 3
<<<<<<< HEAD
        Left = 203
        Top = 0
        Width = 60
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 165
        Top = 0
        Width = 49
        Height = 21
>>>>>>> origin/master
        OnKeyPress = ValidatedEdit1KeyPress
        Text = ' 2 %'
        Value = 2.000000000000000000
        Scale = 1.000000000000000000
        Units = '%'
        NumberFormat = '%.0f'
        LoLimit = 0.000000999999997475
        HiLimit = 100.000000000000000000
      end
    end
    object pnLightSource6: TPanel
<<<<<<< HEAD
      Left = 11
      Top = 245
      Width = 271
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 9
      Top = 199
      Width = 220
      Height = 29
>>>>>>> origin/master
      BevelOuter = bvNone
      TabOrder = 6
      object CheckBox6: TCheckBox
        Left = 0
        Top = 0
<<<<<<< HEAD
        Width = 45
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
=======
        Width = 37
        Height = 19
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOnClick
      end
      object Edit6: TEdit
        Tag = 1
<<<<<<< HEAD
        Left = 46
        Top = 0
        Width = 75
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 37
        Top = 0
        Width = 61
        Height = 21
>>>>>>> origin/master
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar7: TTrackBar
        Tag = 2
<<<<<<< HEAD
        Left = 119
        Top = 0
        Width = 81
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 97
        Top = 0
        Width = 66
        Height = 28
>>>>>>> origin/master
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit7: TValidatedEdit
        Tag = 3
<<<<<<< HEAD
        Left = 203
        Top = 0
        Width = 60
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 165
        Top = 0
        Width = 49
        Height = 21
>>>>>>> origin/master
        OnKeyPress = ValidatedEdit1KeyPress
        Text = ' 2 %'
        Value = 2.000000000000000000
        Scale = 1.000000000000000000
        Units = '%'
        NumberFormat = '%.0f'
        LoLimit = 0.000000999999997475
        HiLimit = 100.000000000000000000
      end
    end
    object pnLightSource7: TPanel
<<<<<<< HEAD
      Left = 11
      Top = 286
      Width = 271
      Height = 35
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 9
      Top = 232
      Width = 220
      Height = 29
>>>>>>> origin/master
      BevelOuter = bvNone
      TabOrder = 7
      object CheckBox7: TCheckBox
        Left = 0
        Top = 0
<<<<<<< HEAD
        Width = 45
        Height = 23
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
=======
        Width = 37
        Height = 19
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
>>>>>>> origin/master
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOnClick
      end
      object Edit7: TEdit
        Tag = 1
<<<<<<< HEAD
        Left = 46
        Top = 0
        Width = 75
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 37
        Top = 0
        Width = 61
        Height = 21
>>>>>>> origin/master
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar8: TTrackBar
        Tag = 2
<<<<<<< HEAD
        Left = 114
        Top = 1
        Width = 81
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 93
        Top = 1
        Width = 65
        Height = 27
>>>>>>> origin/master
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit8: TValidatedEdit
        Tag = 3
<<<<<<< HEAD
        Left = 203
        Top = 0
        Width = 60
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
=======
        Left = 165
        Top = 0
        Width = 49
        Height = 21
>>>>>>> origin/master
        OnKeyPress = ValidatedEdit1KeyPress
        Text = ' 2 %'
        Value = 2.000000000000000000
        Scale = 1.000000000000000000
        Units = '%'
        NumberFormat = '%.0f'
        LoLimit = 0.000000999999997475
        HiLimit = 100.000000000000000000
      end
    end
  end
  object DisplayGrp: TGroupBox
<<<<<<< HEAD
    Left = 11
    Top = 799
    Width = 294
    Height = 196
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
=======
    Left = 9
    Top = 649
    Width = 239
    Height = 159
>>>>>>> origin/master
    Caption = ' Display '
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 2
<<<<<<< HEAD
      Top = 18
      Width = 4
      Height = 176
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 3
      ExplicitTop = 20
      ExplicitHeight = 174
    end
    object cbPalette: TComboBox
      Left = 15
      Top = 20
      Width = 261
      Height = 24
=======
      Top = 15
      Height = 142
      ExplicitHeight = 143
    end
    object cbPalette: TComboBox
      Left = 12
      Top = 16
      Width = 212
      Height = 21
>>>>>>> origin/master
      Hint = 'Display colour palette'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = cbPaletteChange
    end
    object ContrastPage: TPageControl
<<<<<<< HEAD
      Left = 14
      Top = 57
      Width = 265
      Height = 129
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 11
      Top = 46
      Width = 216
      Height = 105
>>>>>>> origin/master
      ActivePage = RangeTab
      MultiLine = True
      TabOrder = 1
      object RangeTab: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Display Contrast'
        object bFullScale: TButton
          Left = 1
<<<<<<< HEAD
          Top = 4
          Width = 97
          Height = 23
=======
          Top = 3
          Width = 79
          Height = 19
>>>>>>> origin/master
          Hint = 'Set display intensity range to cover full camera range'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Full Range'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
<<<<<<< HEAD
          Font.Height = -16
=======
          Font.Height = -13
>>>>>>> origin/master
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bFullScaleClick
        end
        object bMaxContrast: TButton
<<<<<<< HEAD
          Left = 106
          Top = 5
          Width = 80
          Height = 23
=======
          Left = 86
          Top = 4
          Width = 65
          Height = 19
>>>>>>> origin/master
          Hint = 'Set display range to min. - max.  intensities within image'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Best'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
<<<<<<< HEAD
          Font.Height = -16
=======
          Font.Height = -13
>>>>>>> origin/master
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bMaxContrastClick
        end
        object edDisplayIntensityRange: TRangeEdit
<<<<<<< HEAD
          Left = 3
          Top = 33
          Width = 183
          Height = 27
=======
          Left = 2
          Top = 27
          Width = 149
          Height = 22
>>>>>>> origin/master
          Hint = 'Range of intensities displayed within image'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          OnKeyPress = edDisplayIntensityRangeKeyPress
          AutoSize = False
          ShowHint = True
          Text = ' 4096.00 - 4096.00 '
          LoValue = 4096.000000000000000000
          HiValue = 4096.000000000000000000
          HiLimit = 1.000000015047466E30
          Scale = 1.000000000000000000
          NumberFormat = '%.f - %.f'
        end
        object ckContrast6SDOnly: TCheckBox
<<<<<<< HEAD
          Left = 135
          Top = 62
          Width = 93
          Height = 23
=======
          Left = 110
          Top = 50
          Width = 75
          Height = 19
>>>>>>> origin/master
          Hint = 
            'Set maximum contrast range to 6 standard deviations rather than ' +
            'min-max range'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '6 x s.d.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
<<<<<<< HEAD
          Font.Height = -16
=======
          Font.Height = -13
>>>>>>> origin/master
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object ckAutoOptimise: TCheckBox
<<<<<<< HEAD
          Left = 3
          Top = 62
          Width = 124
          Height = 23
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Auto adjust'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
=======
          Left = 2
          Top = 50
          Width = 101
          Height = 19
          Caption = 'Auto adjust'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
>>>>>>> origin/master
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
      end
      object SlidersTab: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Sliders'
        ImageIndex = 1
        object Label9: TLabel
<<<<<<< HEAD
          Left = 4
          Top = 5
          Width = 66
          Height = 19
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Contrast'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
=======
          Left = 3
          Top = 4
          Width = 52
          Height = 16
          Caption = 'Contrast'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
>>>>>>> origin/master
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
<<<<<<< HEAD
          Left = 4
          Top = 41
          Width = 84
          Height = 19
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Brightness'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
=======
          Left = 3
          Top = 33
          Width = 66
          Height = 16
          Caption = 'Brightness'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
>>>>>>> origin/master
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
<<<<<<< HEAD
          Left = 241
          Top = 5
          Width = 13
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
=======
          Left = 196
          Top = 4
          Width = 11
          Height = 22
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
>>>>>>> origin/master
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
<<<<<<< HEAD
          Left = 241
          Top = 41
          Width = 13
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
=======
          Left = 196
          Top = 33
          Width = 11
          Height = 22
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
>>>>>>> origin/master
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
<<<<<<< HEAD
          Left = 102
          Top = 0
          Width = 8
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
=======
          Left = 83
          Top = 0
          Width = 7
          Height = 22
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
>>>>>>> origin/master
          Font.Name = 'Bodoni MT Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
<<<<<<< HEAD
          Left = 102
          Top = 35
          Width = 8
          Height = 26
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
=======
          Left = 83
          Top = 28
          Width = 7
          Height = 22
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
>>>>>>> origin/master
          Font.Name = 'Bodoni MT Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object tbContrast: TTrackBar
          Tag = 2
<<<<<<< HEAD
          Left = 115
          Top = 5
          Width = 122
          Height = 34
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
=======
          Left = 93
          Top = 4
          Width = 100
          Height = 28
>>>>>>> origin/master
          Max = 100
          Position = 100
          TabOrder = 0
          ThumbLength = 14
          TickStyle = tsManual
          OnChange = tbContrastChange
        end
        object tbBrightness: TTrackBar
          Tag = 2
<<<<<<< HEAD
          Left = 115
          Top = 39
          Width = 122
          Height = 34
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
=======
          Left = 93
          Top = 32
          Width = 100
          Height = 27
>>>>>>> origin/master
          Max = 100
          Position = 100
          TabOrder = 1
          ThumbLength = 14
          TickStyle = tsManual
          OnChange = tbBrightnessChange
        end
      end
    end
  end
  object StatusGrp: TGroupBox
<<<<<<< HEAD
    Left = 11
    Top = 1003
    Width = 294
    Height = 82
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 5
    object edStatus: TEdit
      Left = 18
      Top = 4
      Width = 272
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
    Left = 9
    Top = 815
    Width = 239
    Height = 67
    TabOrder = 5
    object edStatus: TEdit
      Left = 15
      Top = 3
      Width = 221
      Height = 21
>>>>>>> origin/master
      ReadOnly = True
      TabOrder = 0
    end
    object edZStatus: TEdit
<<<<<<< HEAD
      Left = 18
      Top = 41
      Width = 272
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Left = 15
      Top = 33
      Width = 221
      Height = 21
>>>>>>> origin/master
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Page: TPageControl
<<<<<<< HEAD
    Left = 313
    Top = 11
    Width = 789
    Height = 348
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
=======
    Left = 254
    Top = 9
    Width = 641
    Height = 283
>>>>>>> origin/master
    ActivePage = tbChan0
    TabOrder = 6
    OnChange = PageChange
    object tbChan0: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Channel 0'
      object Image0: TImage
<<<<<<< HEAD
        Left = 4
        Top = 4
        Width = 784
        Height = 287
=======
        Left = 3
        Top = 3
        Width = 637
        Height = 233
>>>>>>> origin/master
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnDblClick = Image0DblClick
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan1: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Channel 1'
      ImageIndex = 1
      object Image1: TImage
<<<<<<< HEAD
        Left = 4
        Top = 4
        Width = 784
        Height = 287
=======
        Left = 3
        Top = 3
        Width = 637
        Height = 233
>>>>>>> origin/master
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnDblClick = Image0DblClick
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Channel 2'
      ImageIndex = 2
      object Image2: TImage
<<<<<<< HEAD
        Left = 4
        Top = 4
        Width = 784
        Height = 287
=======
        Left = 3
        Top = 3
        Width = 637
        Height = 233
>>>>>>> origin/master
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnDblClick = Image0DblClick
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan3: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'tbChan3'
      ImageIndex = 3
      object Image3: TImage
<<<<<<< HEAD
        Left = -5
        Top = 4
        Width = 784
        Height = 287
=======
        Left = -4
        Top = 3
        Width = 637
        Height = 233
>>>>>>> origin/master
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnDblClick = Image0DblClick
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
  end
  object ZSectionPanel: TPanel
<<<<<<< HEAD
    Left = 802
    Top = 362
    Width = 295
    Height = 29
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
=======
    Left = 652
    Top = 294
    Width = 239
    Height = 24
>>>>>>> origin/master
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 7
    object lbZSection: TLabel
<<<<<<< HEAD
      Left = 207
=======
      Left = 168
>>>>>>> origin/master
      Top = 0
      Width = 24
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'xxxx'
    end
    object scZSection: TScrollBar
      Left = 0
      Top = 0
<<<<<<< HEAD
      Width = 199
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
=======
      Width = 162
      Height = 16
>>>>>>> origin/master
      PageSize = 0
      TabOrder = 0
      OnChange = scZSectionChange
    end
  end
  object DisplayModeGrp: TGroupBox
<<<<<<< HEAD
    Left = 317
    Top = 367
    Width = 240
    Height = 42
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 8
    object rbZoomMode: TRadioButton
      Left = 11
      Top = 5
      Width = 118
      Height = 33
=======
    Left = 258
    Top = 298
    Width = 195
    Height = 34
    TabOrder = 8
    object rbZoomMode: TRadioButton
      Left = 9
      Top = 4
      Width = 96
      Height = 27
>>>>>>> origin/master
      Hint = 'Select image zoom/position selection mode'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Zoom Mode'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -15
=======
      Font.Height = -12
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
    end
    object rbROIMode: TRadioButton
<<<<<<< HEAD
      Left = 135
      Top = 5
      Width = 103
      Height = 33
=======
      Left = 110
      Top = 4
      Width = 83
      Height = 27
>>>>>>> origin/master
      Hint = 'Display CCD region of interest selection rectangle'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'ROI Mode'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
<<<<<<< HEAD
      Font.Height = -15
=======
      Font.Height = -12
>>>>>>> origin/master
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 60
    OnTimer = TimerTimer
    Left = 232
    Top = 392
  end
  object ImageFile: TImageFile
    XResolution = 1.000000000000000000
    YResolution = 1.000000000000000000
    ZResolution = 1.000000000000000000
    TResolution = 1.000000000000000000
    Left = 248
    Top = 432
  end
  object SaveDialog: TSaveDialog
    Left = 304
    Top = 440
  end
  object MainMenu1: TMainMenu
    Left = 240
    Top = 496
    object File1: TMenuItem
      Caption = 'File'
      OnClick = File1Click
      object mnSaveToImageJ: TMenuItem
        Caption = 'Save to Image-J'
        OnClick = mnSaveToImageJClick
      end
      object mnSaveImage: TMenuItem
        Caption = '&Save Image to File'
        OnClick = mnSaveImageClick
      end
      object mnExit: TMenuItem
        Caption = '&Exit'
        OnClick = mnExitClick
      end
    end
    object mnSetup: TMenuItem
      Caption = 'Setup'
      object mnScanSettings: TMenuItem
        Caption = '&Camera/Microscope Settings'
        OnClick = mnScanSettingsClick
      end
    end
  end
  object Cam1: TSESCam
    SelectedCamera = 0
    ComPort = 1
    CCDClearPreExposure = False
    CCDPostExposureReadout = False
    ReadoutSpeed = 0
    FrameInterval = 1.000000000000000000
    TriggerMode = 0
    AmpGain = 0
    NumFramesInBuffer = 20
    LensMagnification = 1.000000000000000000
    CameraTemperatureSetPoint = -50.000000000000000000
    CameraCoolingOn = True
    CameraFanMode = 1
    DisableEMCCD = False
    CameraMode = 0
    CameraADC = 0
    ADCGain = 0
    CCDVerticalShiftSpeed = 0
    NumPixelShiftFrames = 1
    DisableExposureIntervalLimit = False
    MonochromeImage = False
    Left = 352
    Top = 488
  end
end
