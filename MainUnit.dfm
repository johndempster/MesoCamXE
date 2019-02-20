object MainFrm: TMainFrm
  Left = 122
  Top = 357
  Caption = 'to'
  ClientHeight = 1274
  ClientWidth = 1554
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
  PixelsPerInch = 96
  TextHeight = 13
  object lbReadout: TLabel
    Left = 782
    Top = 524
    Width = 6
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSaveFilename: TLabel
    Left = 819
    Top = 484
    Width = 4
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object ControlGrp: TGroupBox
    Left = 10
    Top = 2
    Width = 428
    Height = 282
    Caption = ' Image Capture  '
    TabOrder = 0
    object Label7: TLabel
      Left = 257
      Top = 20
      Width = 78
      Height = 38
      Caption = 'Exposure Time'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label8: TLabel
      Left = 259
      Top = 75
      Width = 35
      Height = 19
      Alignment = taRightJustify
      Caption = 'Gain'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Tag = 112
      Left = 256
      Top = 137
      Width = 38
      Height = 19
      Alignment = taRightJustify
      Caption = 'Lens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bCaptureImage: TButton
      Left = 9
      Top = 88
      Width = 218
      Height = 32
      Hint = 'Capture new image(s)'
      Caption = 'Capture Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bCaptureImageClick
    end
    object bStopImage: TButton
      Left = 9
      Top = 163
      Width = 218
      Height = 34
      Hint = 'Stop Image Capture'
      Caption = 'Stop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bStopImageClick
    end
    object bLiveImage: TButton
      Left = 9
      Top = 13
      Width = 218
      Height = 36
      Hint = 'Display live images from camera'
      Caption = 'Live Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bLiveImageClick
    end
    object cbCaptureMode: TComboBox
      Left = 9
      Top = 127
      Width = 218
      Height = 21
      Hint = 'Select image superresolution mode (pixel-shifting  cameras only)'
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = cbCaptureModeChange
    end
    object edExposureTime: TValidatedEdit
      Left = 257
      Top = 41
      Width = 149
      Height = 21
      Hint = 'Exposure time (ms)'
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
      Left = 10
      Top = 204
      Width = 396
      Height = 66
      Caption = 'CCD Capture Area '
      TabOrder = 5
      object bFullFrame: TButton
        Left = 10
        Top = 22
        Width = 68
        Height = 32
        Hint = 'Set CCD readout area to whole of CCD'
        Caption = 'Full '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bFullFrameClick
      end
      object bSelectedRegion: TButton
        Left = 85
        Top = 22
        Width = 148
        Height = 32
        Hint = 'Set CCD readout area to rectangle indicated on display '
        Caption = 'Use R.O.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bSelectedRegionClick
      end
      object bEnterCCDArea: TButton
        Left = 241
        Top = 22
        Width = 145
        Height = 32
        Hint = 'Specify coordinates of CCD readout area'
        Caption = 'Set Area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
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
      Left = 257
      Top = 96
      Width = 146
      Height = 33
      Hint = 'Camera analog gain'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = cbCameraGainChange
    end
    object cbLiveBin: TComboBox
      Left = 9
      Top = 55
      Width = 218
      Height = 21
      Hint = 'Live image binning mode'
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnChange = cbLiveBinChange
    end
    object cbLens: TComboBox
      Left = 257
      Top = 159
      Width = 150
      Height = 33
      Hint = 'Camera analog gain'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
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
    Left = 10
    Top = 298
    Width = 428
    Height = 249
    Caption = ' Image Mode'
    TabOrder = 1
    object ZStackGrp: TGroupBox
      Left = 15
      Top = 108
      Width = 404
      Height = 58
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 10
        Top = 15
        Width = 62
        Height = 18
        Caption = 'Sections'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 141
        Top = 15
        Width = 33
        Height = 18
        Caption = 'Step'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumZSections: TValidatedEdit
        Left = 78
        Top = 15
        Width = 55
        Height = 27
        Hint = 'No. of sections in Z stack'
        ShowHint = True
        Text = ' 1 '
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        NumberFormat = '%.0f'
        LoLimit = 1.000000000000000000
        HiLimit = 20000.000000000000000000
      end
      object edNumPixelsPerZStep: TValidatedEdit
        Left = 180
        Top = 15
        Width = 118
        Height = 27
        Hint = 'Z increment between sections (pixels)'
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
        Left = 302
        Top = 15
        Width = 92
        Height = 27
        Hint = 'Z position increment between sections (microns)'
        OnKeyPress = edMicronsPerZStepKeyPress
        ShowHint = True
        Text = ' 0.00 um'
        Scale = 1.000000000000000000
        Units = 'um'
        NumberFormat = '%.2f'
        LoLimit = -200.000000000000000000
        HiLimit = 200.000000000000000000
      end
    end
    object ckSeparateLightSources: TCheckBox
      Left = 15
      Top = 20
      Width = 340
      Height = 24
      Hint = 
        'Check to produce separate, sequentially acquired  images for eac' +
        'h light source in use. '
      Caption = 'Acquire Multi-wavelength Images'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ckSeparateLightSourcesClick
    end
    object ckAcquireZStack: TCheckBox
      Left = 15
      Top = 46
      Width = 340
      Height = 25
      Hint = 
        'Check to acquire a series of image at incremental Z axis positio' +
        'ns'
      Caption = 'Acquire Z Stack'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ckAcquireZStackClick
    end
    object ckAcquireTimeLapseSeries: TCheckBox
      Left = 15
      Top = 71
      Width = 340
      Height = 23
      Hint = 'Check to a acquire a series of images at timed intervals'
      Caption = 'Acquire Time Lapse Series'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ckAcquireTimeLapseSeriesClick
    end
    object TimeLapseGrp: TGroupBox
      Left = 15
      Top = 181
      Width = 404
      Height = 52
      TabOrder = 4
      object Label3: TLabel
        Left = 6
        Top = 10
        Width = 72
        Height = 18
        Alignment = taRightJustify
        Caption = 'No. points'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 143
        Top = 10
        Width = 98
        Height = 18
        Alignment = taRightJustify
        Caption = 'At Intervals of'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumTimeLapsePoints: TValidatedEdit
        Left = 85
        Top = 10
        Width = 52
        Height = 28
        Hint = 'No. of images to be captured in time series'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 249
        Top = 10
        Width = 102
        Height = 28
        Hint = 'Time interval between images'
        OnKeyPress = edNumPixelsPerZStepKeyPress
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
    Left = 10
    Top = 566
    Width = 428
    Height = 168
    Caption = ' Stage Position '
    TabOrder = 2
    object edGotoXPosition: TValidatedEdit
      Left = 215
      Top = 65
      Width = 195
      Height = 21
      Hint = 'Z axis position to move to'
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
      Left = 117
      Top = 128
      Width = 95
      Height = 25
      Hint = 'Move stage to specified Z axis position'
      Caption = 'Go to Z='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bGotoZPositionClick
    end
    object edGotoYPosition: TValidatedEdit
      Left = 215
      Top = 97
      Width = 195
      Height = 21
      Hint = 'Z axis position to move to'
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
      Left = 215
      Top = 128
      Width = 195
      Height = 21
      Hint = 'Z axis position to move to'
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
      Left = 15
      Top = 24
      Width = 395
      Height = 32
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object bGoToXPosition: TButton
      Left = 117
      Top = 65
      Width = 95
      Height = 24
      Hint = 'Move stage to specified X axis position'
      Caption = 'Go to X='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bGoToXPositionClick
    end
    object bGoToYPosition: TButton
      Left = 117
      Top = 97
      Width = 95
      Height = 24
      Hint = 'Move stage to specified Y axis position'
      Caption = 'Go to Y='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
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
    Left = 9
    Top = 740
    Width = 428
    Height = 310
    Caption = ' Light Source '
    TabOrder = 3
    object pnLightSource0: TPanel
      Left = 3
      Top = 46
      Width = 403
      Height = 34
      BevelOuter = bvNone
      TabOrder = 0
      object ckLightSourceOn0: TCheckBox
        Left = 0
        Top = 0
        Width = 60
        Height = 31
        Hint = 'Turn Light Source 0 On/Off'
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object edName: TEdit
        Tag = 1
        Left = 60
        Top = 0
        Width = 106
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar1: TTrackBar
        Tag = 2
        Left = 171
        Top = 0
        Width = 140
        Height = 46
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit1: TValidatedEdit
        Tag = 3
        Left = 320
        Top = 0
        Width = 83
        Height = 21
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
      Left = 3
      Top = 91
      Width = 403
      Height = 33
      BevelOuter = bvNone
      TabOrder = 1
      object ckLightSourceOn1: TCheckBox
        Left = 0
        Top = 0
        Width = 60
        Height = 31
        Hint = 'Turn Light Source 1 On/Off'
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
        Left = 60
        Top = 0
        Width = 106
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar2: TTrackBar
        Tag = 2
        Left = 171
        Top = 0
        Width = 140
        Height = 46
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit2: TValidatedEdit
        Tag = 3
        Left = 320
        Top = 0
        Width = 83
        Height = 21
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
      Left = 3
      Top = 137
      Width = 403
      Height = 34
      BevelOuter = bvNone
      TabOrder = 2
      object ckLightSourceOn2: TCheckBox
        Left = 0
        Top = 0
        Width = 60
        Height = 31
        Hint = 'Turn Light Source 2 On/Off'
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
        Left = 60
        Top = 0
        Width = 106
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar3: TTrackBar
        Tag = 2
        Left = 171
        Top = 0
        Width = 140
        Height = 46
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit3: TValidatedEdit
        Tag = 3
        Left = 320
        Top = 0
        Width = 83
        Height = 21
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
      Left = 3
      Top = 178
      Width = 403
      Height = 34
      BevelOuter = bvNone
      TabOrder = 3
      object ckLightSourceOn3: TCheckBox
        Left = 0
        Top = 0
        Width = 60
        Height = 31
        Hint = 'Turn Light Source 3 On/Off'
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
        Left = 60
        Top = 0
        Width = 106
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar4: TTrackBar
        Tag = 2
        Left = 171
        Top = 0
        Width = 140
        Height = 46
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit4: TValidatedEdit
        Tag = 3
        Left = 320
        Top = 0
        Width = 83
        Height = 21
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
      Left = 3
      Top = 229
      Width = 403
      Height = 34
      BevelOuter = bvNone
      TabOrder = 4
      object ckLightSourceOn4: TCheckBox
        Left = 0
        Top = 0
        Width = 60
        Height = 31
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit4: TEdit
        Tag = 1
        Left = 60
        Top = 0
        Width = 106
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar5: TTrackBar
        Tag = 2
        Left = 171
        Top = 0
        Width = 140
        Height = 46
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit5: TValidatedEdit
        Tag = 3
        Left = 320
        Top = 0
        Width = 83
        Height = 21
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
      Left = 3
      Top = 277
      Width = 403
      Height = 34
      BevelOuter = bvNone
      TabOrder = 5
      object ckLightSourceOn5: TCheckBox
        Left = 0
        Top = 0
        Width = 60
        Height = 31
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit5: TEdit
        Tag = 1
        Left = 60
        Top = 0
        Width = 106
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar6: TTrackBar
        Tag = 2
        Left = 171
        Top = 0
        Width = 140
        Height = 46
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit6: TValidatedEdit
        Tag = 3
        Left = 320
        Top = 0
        Width = 83
        Height = 21
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
      Left = 15
      Top = 321
      Width = 355
      Height = 34
      BevelOuter = bvNone
      TabOrder = 6
      object ckLightSourceOn6: TCheckBox
        Left = 0
        Top = 0
        Width = 60
        Height = 31
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit6: TEdit
        Tag = 1
        Left = 60
        Top = 0
        Width = 98
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar7: TTrackBar
        Tag = 2
        Left = 155
        Top = 0
        Width = 109
        Height = 46
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit7: TValidatedEdit
        Tag = 3
        Left = 265
        Top = 0
        Width = 80
        Height = 21
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
      Left = 15
      Top = 373
      Width = 355
      Height = 34
      BevelOuter = bvNone
      TabOrder = 7
      object ckLightSourceOn7: TCheckBox
        Left = 0
        Top = 0
        Width = 60
        Height = 31
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit7: TEdit
        Tag = 1
        Left = 60
        Top = 0
        Width = 98
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar8: TTrackBar
        Tag = 2
        Left = 151
        Top = 1
        Width = 104
        Height = 45
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit8: TValidatedEdit
        Tag = 3
        Left = 265
        Top = 0
        Width = 80
        Height = 21
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
    Left = 10
    Top = 1060
    Width = 428
    Height = 191
    Caption = ' Display Contrast '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object cbPalette: TComboBox
      Left = 15
      Top = 23
      Width = 395
      Height = 21
      Hint = 'Display colour palette'
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = cbPaletteChange
    end
    object ContrastPage: TPageControl
      Left = 15
      Top = 55
      Width = 391
      Height = 122
      ActivePage = RangeTab
      MultiLine = True
      TabOrder = 1
      object RangeTab: TTabSheet
        Caption = 'Display Contrast'
        object bFullScale: TButton
          Left = 1
          Top = 4
          Width = 127
          Height = 33
          Hint = 'Set display intensity range to cover full camera range'
          Caption = 'Full Range'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bFullScaleClick
        end
        object bMaxContrast: TButton
          Left = 137
          Top = 4
          Width = 106
          Height = 33
          Hint = 'Set display range to min. - max.  intensities within image'
          Caption = 'Best'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bMaxContrastClick
        end
        object edDisplayIntensityRange: TRangeEdit
          Left = 2
          Top = 46
          Width = 243
          Height = 34
          Hint = 'Range of intensities displayed within image'
          OnKeyPress = edDisplayIntensityRangeKeyPress
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
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
          Left = 252
          Top = 4
          Width = 118
          Height = 26
          Hint = 
            'Set maximum contrast range to 6 standard deviations rather than ' +
            'min-max range'
          Caption = '6 x s.d.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object ckAutoOptimise: TCheckBox
          Left = 252
          Top = 25
          Width = 117
          Height = 25
          Caption = 'Auto adjust'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          WordWrap = True
        end
      end
      object SlidersTab: TTabSheet
        Caption = 'Sliders'
        ImageIndex = 1
        object Label9: TLabel
          Left = 3
          Top = 7
          Width = 80
          Height = 22
          Caption = 'Contrast'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 3
          Top = 44
          Width = 102
          Height = 22
          Caption = 'Brightness'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 314
          Top = 4
          Width = 14
          Height = 27
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 314
          Top = 41
          Width = 14
          Height = 27
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 133
          Top = 4
          Width = 14
          Height = 27
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 133
          Top = 44
          Width = 14
          Height = 27
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object tbContrast: TTrackBar
          Tag = 2
          Left = 151
          Top = 7
          Width = 160
          Height = 47
          Max = 100
          Position = 100
          TabOrder = 0
          ThumbLength = 14
          TickStyle = tsManual
          OnChange = tbContrastChange
        end
        object tbBrightness: TTrackBar
          Tag = 2
          Left = 151
          Top = 44
          Width = 160
          Height = 47
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
    Left = 10
    Top = 1258
    Width = 428
    Height = 239
    Caption = ' Pixel Intensity Histogram '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object plHistogram: TXYPlotDisplay
      Left = 15
      Top = 27
      Width = 395
      Height = 144
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
      Left = 15
      Top = 180
      Width = 395
      Height = 33
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Page: TPageControl
    Left = 444
    Top = 15
    Width = 1035
    Height = 455
    ActivePage = tbChan3
    TabOrder = 6
    OnChange = PageChange
    object tbChan0: TTabSheet
      Caption = 'Channel 0'
      object Image0: TImage
        Left = 3
        Top = 3
        Width = 1029
        Height = 376
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan1: TTabSheet
      Caption = 'Channel 1'
      ImageIndex = 1
      object Image1: TImage
        Left = 3
        Top = 3
        Width = 1029
        Height = 376
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan2: TTabSheet
      Caption = 'Channel 2'
      ImageIndex = 2
      object Image2: TImage
        Left = 3
        Top = 3
        Width = 1029
        Height = 376
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan3: TTabSheet
      Caption = 'tbChan3'
      ImageIndex = 3
      object Image3: TImage
        Left = -3
        Top = 0
        Width = 1025
        Height = 376
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
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
    Left = 468
    Top = 483
    Width = 327
    Height = 34
    BevelOuter = bvNone
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 7
    object lbZSection: TLabel
      Left = 230
      Top = 0
      Width = 40
      Height = 25
      Caption = 'xxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 19
      Height = 24
      Caption = 'Z:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object scZSection: TScrollBar
      Left = 24
      Top = 0
      Width = 199
      Height = 27
      PageSize = 0
      TabOrder = 0
      OnChange = scZSectionChange
    end
  end
  object TSectionPanel: TPanel
    Left = 460
    Top = 524
    Width = 327
    Height = 34
    BevelOuter = bvNone
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 8
    object lbTSection: TLabel
      Left = 230
      Top = 0
      Width = 40
      Height = 25
      Caption = 'xxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 0
      Top = 0
      Width = 18
      Height = 24
      Caption = 'T:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object scTSection: TScrollBar
      Left = 25
      Top = 0
      Width = 198
      Height = 27
      PageSize = 0
      TabOrder = 0
      OnChange = scTSectionChange
    end
  end
  object edSaveFileStatus: TEdit
    Left = 801
    Top = 476
    Width = 679
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Text = 'edSaveFileStatus'
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
    CCDTapOffsetLT = 0
    CCDTapOffsetRT = 0
    CCDTapOffsetLB = 0
    CCDTapOffsetRB = 0
    LightSpeedMode = False
    Left = 688
    Top = 560
  end
end
