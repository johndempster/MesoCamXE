object MainFrm: TMainFrm
  Left = 122
  Top = 357
  Caption = 'to'
  ClientHeight = 1568
  ClientWidth = 1739
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 130
  TextHeight = 16
  object lbReadout: TLabel
    Left = 875
    Top = 586
    Width = 6
    Height = 26
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -22
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ControlGrp: TGroupBox
    Left = 11
    Top = 11
    Width = 479
    Height = 315
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Image Capture  '
    TabOrder = 0
    object Label7: TLabel
      Left = 287
      Top = 22
      Width = 89
      Height = 42
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Exposure Time'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label8: TLabel
      Left = 288
      Top = 84
      Width = 40
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taRightJustify
      Caption = 'Gain'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Tag = 112
      Left = 285
      Top = 154
      Width = 43
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taRightJustify
      Caption = 'Lens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bCaptureImage: TButton
      Left = 11
      Top = 106
      Width = 244
      Height = 36
      Hint = 'Capture new image(s)'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Capture Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bCaptureImageClick
    end
    object bStopImage: TButton
      Left = 11
      Top = 181
      Width = 244
      Height = 38
      Hint = 'Stop Image Capture'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Stop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bStopImageClick
    end
    object bLiveImage: TButton
      Left = 11
      Top = 22
      Width = 244
      Height = 40
      Hint = 'Display live images from camera'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Live Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bLiveImageClick
    end
    object cbCaptureMode: TComboBox
      Left = 11
      Top = 141
      Width = 244
      Height = 24
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
      Left = 287
      Top = 46
      Width = 167
      Height = 24
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
      Left = 11
      Top = 228
      Width = 443
      Height = 74
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'CCD Capture Area '
      TabOrder = 5
      object bFullFrame: TButton
        Left = 11
        Top = 24
        Width = 76
        Height = 36
        Hint = 'Set CCD readout area to whole of CCD'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Full '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -22
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bFullFrameClick
      end
      object bSelectedRegion: TButton
        Left = 95
        Top = 24
        Width = 166
        Height = 36
        Hint = 'Set CCD readout area to rectangle indicated on display '
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Use R.O.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -22
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bSelectedRegionClick
      end
      object bEnterCCDArea: TButton
        Left = 269
        Top = 24
        Width = 163
        Height = 36
        Hint = 'Specify coordinates of CCD readout area'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Set Area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -22
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
      Left = 287
      Top = 107
      Width = 164
      Height = 34
      Hint = 'Camera analog gain'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = cbCameraGainChange
    end
    object cbLiveBin: TComboBox
      Left = 11
      Top = 61
      Width = 244
      Height = 24
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
    object cbLens: TComboBox
      Left = 287
      Top = 179
      Width = 168
      Height = 34
      Hint = 'Camera analog gain'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnChange = cbLensChange
    end
  end
  object ImageSizeGrp: TGroupBox
    Left = 11
    Top = 334
    Width = 479
    Height = 278
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Image Mode'
    TabOrder = 1
    object ZStackGrp: TGroupBox
      Left = 16
      Top = 121
      Width = 453
      Height = 65
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 11
        Top = 16
        Width = 67
        Height = 19
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Sections'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 158
        Top = 16
        Width = 35
        Height = 19
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Step'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumZSections: TValidatedEdit
        Left = 87
        Top = 16
        Width = 62
        Height = 29
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
        Left = 200
        Top = 16
        Width = 133
        Height = 29
        Hint = 'Z increment between sections (pixels)'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        OnKeyPress = edNumPixelsPerZStepKeyPress
        ShowHint = True
        Text = ' 1.00 pixels'
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        Units = 'pixels'
        NumberFormat = '%.2f'
        LoLimit = -1000000.000000000000000000
        HiLimit = 1000000.000000000000000000
      end
      object edMicronsPerZStep: TValidatedEdit
        Left = 339
        Top = 16
        Width = 101
        Height = 29
        Hint = 'Z position increment between sections (microns)'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        OnKeyPress = edMicronsPerZStepKeyPress
        ShowHint = True
        Text = ' 0.00 um'
        Scale = 1.000000000000000000
        Units = 'um'
        NumberFormat = '%.2f'
        LoLimit = -100.000000000000000000
        HiLimit = 100.000000000000000000
      end
    end
    object ckSeparateLightSources: TCheckBox
      Left = 16
      Top = 22
      Width = 382
      Height = 27
      Hint = 
        'Check to produce separate, sequentially acquired  images for eac' +
        'h light source in use. '
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Acquire Multi-wavelength Images'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ckSeparateLightSourcesClick
    end
    object ckAcquireZStack: TCheckBox
      Left = 16
      Top = 51
      Width = 382
      Height = 28
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
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ckAcquireZStackClick
    end
    object ckAcquireTimeLapseSeries: TCheckBox
      Left = 16
      Top = 79
      Width = 382
      Height = 27
      Hint = 'Check to a acquire a series of images at timed intervals'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Acquire Time Lapse Series'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ckAcquireTimeLapseSeriesClick
    end
    object TimeLapseGrp: TGroupBox
      Left = 16
      Top = 203
      Width = 453
      Height = 58
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 4
      object Label3: TLabel
        Left = 9
        Top = 11
        Width = 78
        Height = 19
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        Caption = 'No. points'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 165
        Top = 11
        Width = 104
        Height = 19
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        Caption = 'At Intervals of'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumTimeLapsePoints: TValidatedEdit
        Left = 95
        Top = 11
        Width = 57
        Height = 32
        Hint = 'No. of images to be captured in time series'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ShowHint = True
        Text = ' 1 '
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        NumberFormat = '%.0f'
        LoLimit = 1.000000000000000000
        HiLimit = 30000.000000000000000000
      end
      object edTimeLapseInterval: TValidatedEdit
        Left = 278
        Top = 11
        Width = 115
        Height = 32
        Hint = 'Time interval between images'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        OnKeyPress = edNumPixelsPerZStepKeyPress
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ShowHint = True
        Text = ' 1.00 s'
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        Units = 's'
        NumberFormat = '%.2f'
        LoLimit = 0.001000000047497451
        HiLimit = 1000000.000000000000000000
      end
    end
  end
  object ZStageGrp: TGroupBox
    Left = 11
    Top = 632
    Width = 479
    Height = 189
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Stage Position '
    TabOrder = 2
    object edGotoXPosition: TValidatedEdit
      Left = 240
      Top = 73
      Width = 218
      Height = 24
      Hint = 'Z axis position to move to'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnKeyPress = edGotoXPositionKeyPress
      ShowHint = True
      Text = ' 0.00 um'
      Scale = 1.000000000000000000
      Units = 'um'
      NumberFormat = '%.2f'
      LoLimit = -1000000.000000000000000000
      HiLimit = 1000000.000000000000000000
    end
    object bGotoZPosition: TButton
      Left = 130
      Top = 144
      Width = 108
      Height = 27
      Hint = 'Move stage to specified Z axis position'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Go to Z='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bGotoZPositionClick
    end
    object edGotoYPosition: TValidatedEdit
      Left = 240
      Top = 108
      Width = 218
      Height = 24
      Hint = 'Z axis position to move to'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnKeyPress = edGotoYPositionKeyPress
      ShowHint = True
      Text = ' 0.00 um'
      Scale = 1.000000000000000000
      Units = 'um'
      NumberFormat = '%.2f'
      LoLimit = -1000000.000000000000000000
      HiLimit = 1000000.000000000000000000
    end
    object edGotoZPosition: TValidatedEdit
      Left = 241
      Top = 144
      Width = 218
      Height = 24
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
    object edXYZPosition: TEdit
      Left = 16
      Top = 27
      Width = 443
      Height = 34
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object bGoToXPosition: TButton
      Left = 130
      Top = 73
      Width = 108
      Height = 27
      Hint = 'Move stage to specified X axis position'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Go to X='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bGoToXPositionClick
    end
    object bGoToYPosition: TButton
      Left = 130
      Top = 108
      Width = 108
      Height = 27
      Hint = 'Move stage to specified Y axis position'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Go to Y='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = bGoToYPositionClick
    end
  end
  object LightSourceGrp: TGroupBox
    Left = 11
    Top = 829
    Width = 479
    Height = 346
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Light Source '
    TabOrder = 3
    object pnLightSource0: TPanel
      Left = 4
      Top = 50
      Width = 450
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 0
      object ckLightSourceOn0: TCheckBox
        Left = 0
        Top = 0
        Width = 68
        Height = 34
        Hint = 'Turn Light Source 0 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object edName: TEdit
        Tag = 1
        Left = 68
        Top = 0
        Width = 118
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar1: TTrackBar
        Tag = 2
        Left = 191
        Top = 0
        Width = 157
        Height = 50
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit1: TValidatedEdit
        Tag = 3
        Left = 358
        Top = 0
        Width = 92
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      Left = 4
      Top = 102
      Width = 450
      Height = 37
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 1
      object ckLightSourceOn1: TCheckBox
        Left = 0
        Top = 0
        Width = 68
        Height = 34
        Hint = 'Turn Light Source 1 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit1: TEdit
        Tag = 1
        Left = 68
        Top = 0
        Width = 118
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar2: TTrackBar
        Tag = 2
        Left = 191
        Top = 0
        Width = 157
        Height = 50
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit2: TValidatedEdit
        Tag = 3
        Left = 358
        Top = 0
        Width = 92
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      Left = 4
      Top = 153
      Width = 450
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 2
      object ckLightSourceOn2: TCheckBox
        Left = 0
        Top = 0
        Width = 68
        Height = 34
        Hint = 'Turn Light Source 2 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit2: TEdit
        Tag = 1
        Left = 68
        Top = 0
        Width = 118
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar3: TTrackBar
        Tag = 2
        Left = 191
        Top = 0
        Width = 157
        Height = 50
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit3: TValidatedEdit
        Tag = 3
        Left = 358
        Top = 0
        Width = 92
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      Left = 4
      Top = 199
      Width = 450
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 3
      object ckLightSourceOn3: TCheckBox
        Left = 0
        Top = 0
        Width = 68
        Height = 34
        Hint = 'Turn Light Source 3 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit3: TEdit
        Tag = 1
        Left = 68
        Top = 0
        Width = 118
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar4: TTrackBar
        Tag = 2
        Left = 191
        Top = 0
        Width = 157
        Height = 50
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit4: TValidatedEdit
        Tag = 3
        Left = 358
        Top = 0
        Width = 92
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      Left = 4
      Top = 256
      Width = 450
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 4
      object ckLightSourceOn4: TCheckBox
        Left = 0
        Top = 0
        Width = 68
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit4: TEdit
        Tag = 1
        Left = 68
        Top = 0
        Width = 118
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar5: TTrackBar
        Tag = 2
        Left = 191
        Top = 0
        Width = 157
        Height = 50
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit5: TValidatedEdit
        Tag = 3
        Left = 358
        Top = 0
        Width = 92
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      Left = 4
      Top = 310
      Width = 450
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 5
      object ckLightSourceOn5: TCheckBox
        Left = 0
        Top = 0
        Width = 68
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -22
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit5: TEdit
        Tag = 1
        Left = 68
        Top = 0
        Width = 118
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar6: TTrackBar
        Tag = 2
        Left = 191
        Top = 0
        Width = 157
        Height = 50
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit6: TValidatedEdit
        Tag = 3
        Left = 358
        Top = 0
        Width = 92
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      Left = 16
      Top = 359
      Width = 397
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 6
      object ckLightSourceOn6: TCheckBox
        Left = 0
        Top = 0
        Width = 68
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -22
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit6: TEdit
        Tag = 1
        Left = 68
        Top = 0
        Width = 109
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar7: TTrackBar
        Tag = 2
        Left = 173
        Top = 0
        Width = 122
        Height = 50
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit7: TValidatedEdit
        Tag = 3
        Left = 297
        Top = 0
        Width = 90
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      Left = 16
      Top = 417
      Width = 397
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 7
      object ckLightSourceOn7: TCheckBox
        Left = 0
        Top = 0
        Width = 68
        Height = 34
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -22
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit7: TEdit
        Tag = 1
        Left = 68
        Top = 0
        Width = 109
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar8: TTrackBar
        Tag = 2
        Left = 168
        Top = 1
        Width = 118
        Height = 49
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit8: TValidatedEdit
        Tag = 3
        Left = 297
        Top = 0
        Width = 90
        Height = 24
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
    Left = 11
    Top = 1185
    Width = 479
    Height = 214
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Display Contrast '
    TabOrder = 4
    object cbPalette: TComboBox
      Left = 16
      Top = 26
      Width = 443
      Height = 24
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
      Left = 16
      Top = 62
      Width = 438
      Height = 136
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
          Top = 5
          Width = 143
          Height = 37
          Hint = 'Set display intensity range to cover full camera range'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Full Range'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bFullScaleClick
        end
        object bMaxContrast: TButton
          Left = 152
          Top = 5
          Width = 120
          Height = 37
          Hint = 'Set display range to min. - max.  intensities within image'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Best'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bMaxContrastClick
        end
        object edDisplayIntensityRange: TRangeEdit
          Left = 3
          Top = 50
          Width = 271
          Height = 38
          Hint = 'Range of intensities displayed within image'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          OnKeyPress = edDisplayIntensityRangeKeyPress
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Arial Narrow'
          Font.Style = []
          ShowHint = True
          Text = ' 4096.00 - 4096.00 '
          LoValue = 4096.000000000000000000
          HiValue = 4096.000000000000000000
          HiLimit = 1.000000015047466E30
          Scale = 1.000000000000000000
          NumberFormat = '%.f - %.f'
        end
        object ckContrast6SDOnly: TCheckBox
          Left = 282
          Top = 5
          Width = 131
          Height = 28
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
          Font.Height = -18
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object ckAutoOptimise: TCheckBox
          Left = 282
          Top = 28
          Width = 130
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Auto adjust'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          WordWrap = True
        end
      end
      object SlidersTab: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Sliders'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label9: TLabel
          Left = 4
          Top = 9
          Width = 82
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Contrast'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 4
          Top = 49
          Width = 103
          Height = 24
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Brightness'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 352
          Top = 5
          Width = 16
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 352
          Top = 46
          Width = 16
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 149
          Top = 5
          Width = 16
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 149
          Top = 49
          Width = 16
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object tbContrast: TTrackBar
          Tag = 2
          Left = 168
          Top = 9
          Width = 180
          Height = 51
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Max = 100
          Position = 100
          TabOrder = 0
          ThumbLength = 14
          TickStyle = tsManual
          OnChange = tbContrastChange
        end
        object tbBrightness: TTrackBar
          Tag = 2
          Left = 168
          Top = 49
          Width = 180
          Height = 53
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
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
    Left = 11
    Top = 1463
    Width = 479
    Height = 268
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Pixel Intensity Histogram '
    TabOrder = 5
    object plHistogram: TXYPlotDisplay
      Left = 16
      Top = 30
      Width = 442
      Height = 162
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      MaxPointsPerLine = 4096
      XAxisMax = 1.000000000000000000
      XAxisTick = 0.200000002980232200
      XAxisLaw = axLinear
      XAxisLabel = 'X Axis'
      XAxisAutoRange = False
      YAxisMax = 1.000000000000000000
      YAxisTick = 0.200000002980232200
      YAxisLaw = axLinear
      YAxisLabel = 'Y Axis'
      YAxisAutoRange = False
      YAxisLabelAtTop = False
      ScreenFontName = 'Arial'
      ScreenFontSize = 10
      LineWidth = 1
      MarkerSize = 6
      ShowLines = True
      ShowMarkers = False
      HistogramFullBorders = False
      HistogramFillColor = clWhite
      HistogramFillStyle = bsClear
      HistogramCumulative = False
      HistogramPercentage = False
      PrinterFontSize = 10
      PrinterFontName = 'Arial'
      PrinterLineWidth = 1
      PrinterMarkerSize = 5
      PrinterLeftMargin = 0
      PrinterRightMargin = 0
      PrinterTopMargin = 0
      PrinterBottomMargin = 0
      PrinterDisableColor = False
      MetafileWidth = 500
      MetafileHeight = 400
    end
    object edStatus: TEdit
      Left = 16
      Top = 200
      Width = 442
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -26
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Page: TPageControl
    Left = 505
    Top = 16
    Width = 1157
    Height = 509
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tbChan2
    TabOrder = 6
    OnChange = PageChange
    object tbChan0: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Channel 0'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image0: TImage
        Left = 4
        Top = 4
        Width = 1150
        Height = 421
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image1: TImage
        Left = 4
        Top = 4
        Width = 1150
        Height = 421
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
        Left = 4
        Top = 4
        Width = 1150
        Height = 421
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image3: TImage
        Left = -5
        Top = 4
        Width = 1147
        Height = 421
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
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
  end
  object ZSectionPanel: TPanel
    Left = 515
    Top = 540
    Width = 365
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 7
    object lbZSection: TLabel
      Left = 257
      Top = 0
      Width = 40
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'xxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 19
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Z:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object scZSection: TScrollBar
      Left = 27
      Top = 0
      Width = 222
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      PageSize = 0
      TabOrder = 0
      OnChange = scZSectionChange
    end
  end
  object TSectionPanel: TPanel
    Left = 515
    Top = 586
    Width = 365
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 8
    object lbTSection: TLabel
      Left = 257
      Top = 0
      Width = 40
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'xxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 0
      Top = 0
      Width = 20
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'T:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object scTSection: TScrollBar
      Left = 27
      Top = 0
      Width = 222
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      PageSize = 0
      TabOrder = 0
      OnChange = scTSectionChange
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 60
    OnTimer = TimerTimer
    Left = 560
    Top = 568
  end
  object ImageFile: TImageFile
    XResolution = 1.000000000000000000
    YResolution = 1.000000000000000000
    ZResolution = 1.000000000000000000
    TResolution = 1.000000000000000000
    Left = 280
    Top = 272
  end
  object SaveDialog: TSaveDialog
    Left = 616
    Top = 560
  end
  object MainMenu1: TMainMenu
    Left = 496
    Top = 552
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
    object mnHelp: TMenuItem
      Caption = '&Help'
      object mnContents: TMenuItem
        Caption = '&Contents'
        OnClick = mnContentsClick
      end
      object mnABout: TMenuItem
        Caption = '&About'
        OnClick = mnABoutClick
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
    Left = 688
    Top = 560
  end
end
