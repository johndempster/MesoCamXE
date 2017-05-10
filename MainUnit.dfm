object MainFrm: TMainFrm
  Left = 122
  Top = 357
  Caption = 'to'
  ClientHeight = 986
  ClientWidth = 1207
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
    Left = 332
    Top = 400
    Width = 4
    Height = 18
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ControlGrp: TGroupBox
    Left = 11
    Top = 11
    Width = 321
    Height = 290
    Caption = ' Image Capture  '
    TabOrder = 0
    object Label7: TLabel
      Left = 193
      Top = 12
      Width = 68
      Height = 36
      Caption = 'Exposure Time'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label8: TLabel
      Left = 191
      Top = 69
      Width = 33
      Height = 18
      Alignment = taRightJustify
      Caption = 'Gain'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Tag = 112
      Left = 194
      Top = 132
      Width = 35
      Height = 18
      Alignment = taRightJustify
      Caption = 'Lens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bCaptureImage: TButton
      Left = 11
      Top = 88
      Width = 134
      Height = 25
      Hint = 'Capture new image(s)'
      Caption = 'Capture Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bCaptureImageClick
    end
    object bStopImage: TButton
      Left = 7
      Top = 158
      Width = 136
      Height = 26
      Hint = 'Stop Image Capture'
      Caption = 'Stop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
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
      Width = 134
      Height = 27
      Hint = 'Display live images from camera'
      Caption = 'Live Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
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
      Top = 121
      Width = 134
      Height = 21
      Hint = 'Select image superresolution mode (pixel-shifting  cameras only)'
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = cbCaptureModeChange
    end
    object edExposureTime: TValidatedEdit
      Left = 193
      Top = 34
      Width = 111
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
      Left = 11
      Top = 192
      Width = 297
      Height = 87
      Caption = 'CCD Capture Area '
      TabOrder = 5
      object bFullFrame: TButton
        Left = 11
        Top = 22
        Width = 117
        Height = 24
        Hint = 'Set CCD readout area to whole of CCD'
        Caption = 'Full CCD area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bFullFrameClick
      end
      object bSelectedRegion: TButton
        Left = 11
        Top = 49
        Width = 117
        Height = 23
        Hint = 'Set CCD readout area to rectangle indicated on display '
        Caption = 'Use R.O.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bSelectedRegionClick
      end
      object bEnterCCDArea: TButton
        Left = 134
        Top = 22
        Width = 119
        Height = 24
        Hint = 'Specify coordinates of CCD readout area'
        Caption = 'Set CCD area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
      Left = 192
      Top = 91
      Width = 109
      Height = 28
      Hint = 'Camera analog gain'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
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
      Top = 52
      Width = 134
      Height = 21
      Hint = 'Live image binning mode'
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnChange = cbLiveBinChange
    end
    object cbLens: TComboBox
      Left = 192
      Top = 155
      Width = 112
      Height = 28
      Hint = 'Camera analog gain'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
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
    Top = 308
    Width = 321
    Height = 240
    Caption = ' Image Mode'
    TabOrder = 1
    object ZStackGrp: TGroupBox
      Left = 11
      Top = 124
      Width = 296
      Height = 68
      TabOrder = 0
      object Label5: TLabel
        Left = 7
        Top = 3
        Width = 90
        Height = 18
        Caption = 'No. Sections'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 110
        Top = 3
        Width = 80
        Height = 18
        Caption = 'Z Step Size'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumZSections: TValidatedEdit
        Left = 7
        Top = 27
        Width = 68
        Height = 21
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
        Left = 110
        Top = 27
        Width = 88
        Height = 21
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
        Left = 206
        Top = 27
        Width = 86
        Height = 21
        Hint = 'Z position increment between sections (microns)'
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
      Left = 11
      Top = 22
      Width = 256
      Height = 24
      Hint = 
        'Check to produce separate, sequentially acquired  images for eac' +
        'h light source in use. '
      Caption = 'Separate Light Source Images'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ckSeparateLightSourcesClick
    end
    object ckAcquireZStack: TCheckBox
      Left = 11
      Top = 41
      Width = 256
      Height = 24
      Hint = 
        'Check to acquire a series of image at incremental Z axis positio' +
        'ns'
      Caption = 'Acquire Z Stack'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ckAcquireZStackClick
    end
    object ckAcquireTimeLapseSeries: TCheckBox
      Left = 11
      Top = 60
      Width = 256
      Height = 23
      Hint = 'Check to a acquire a series of images at timed intervals'
      Caption = 'Acquire Time Lapse Series'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ckAcquireTimeLapseSeriesClick
    end
    object TimeLapseGrp: TGroupBox
      Left = 11
      Top = 170
      Width = 296
      Height = 66
      TabOrder = 4
      object Label3: TLabel
        Left = 8
        Top = 3
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
        Left = 114
        Top = 3
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
        Left = 7
        Top = 25
        Width = 77
        Height = 21
        Hint = 'No. of images to be captured in time series'
        ShowHint = True
        Text = ' 1 '
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        NumberFormat = '%.0f'
        LoLimit = 1.000000000000000000
        HiLimit = 30000.000000000000000000
      end
      object edTimeLapseInterval: TValidatedEdit
        Left = 110
        Top = 25
        Width = 98
        Height = 21
        Hint = 'Time interval between images'
        OnKeyPress = edNumPixelsPerZStepKeyPress
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
    Top = 580
    Width = 321
    Height = 156
    Caption = ' Stage Position '
    TabOrder = 2
    object lbX: TLabel
      Left = 140
      Top = 65
      Width = 20
      Height = 19
      Caption = 'X='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbY: TLabel
      Left = 140
      Top = 94
      Width = 19
      Height = 19
      Caption = 'Y='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbZ: TLabel
      Left = 140
      Top = 124
      Width = 18
      Height = 19
      Caption = 'Z='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edGotoXPosition: TValidatedEdit
      Left = 162
      Top = 63
      Width = 146
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
      Left = 41
      Top = 63
      Width = 87
      Height = 23
      Hint = 'Move stage to specified Z axis position'
      Caption = 'Go To'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bGotoZPositionClick
    end
    object edGotoYPosition: TValidatedEdit
      Left = 162
      Top = 93
      Width = 146
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
      Left = 162
      Top = 124
      Width = 146
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
      Left = 11
      Top = 23
      Width = 297
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object LightSourceGrp: TGroupBox
    Left = 11
    Top = 743
    Width = 321
    Height = 232
    Caption = ' Light Source '
    TabOrder = 3
    object pnLightSource0: TPanel
      Left = 3
      Top = 33
      Width = 301
      Height = 33
      BevelOuter = bvNone
      TabOrder = 0
      object ckLightSourceOn0: TCheckBox
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Hint = 'Turn Light Source 0 On/Off'
        Caption = 'On'
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object edName: TEdit
        Tag = 1
        Left = 46
        Top = 0
        Width = 78
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar1: TTrackBar
        Tag = 2
        Left = 128
        Top = 0
        Width = 105
        Height = 34
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit1: TValidatedEdit
        Tag = 3
        Left = 240
        Top = 0
        Width = 61
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
      Top = 68
      Width = 301
      Height = 34
      BevelOuter = bvNone
      TabOrder = 1
      object ckLightSourceOn1: TCheckBox
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Hint = 'Turn Light Source 1 On/Off'
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 46
        Top = 0
        Width = 78
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar2: TTrackBar
        Tag = 2
        Left = 128
        Top = 0
        Width = 105
        Height = 34
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit2: TValidatedEdit
        Tag = 3
        Left = 240
        Top = 0
        Width = 61
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
      Top = 103
      Width = 301
      Height = 37
      BevelOuter = bvNone
      TabOrder = 2
      object ckLightSourceOn2: TCheckBox
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Hint = 'Turn Light Source 2 On/Off'
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 46
        Top = 0
        Width = 78
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar3: TTrackBar
        Tag = 2
        Left = 128
        Top = 0
        Width = 105
        Height = 34
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit3: TValidatedEdit
        Tag = 3
        Left = 240
        Top = 0
        Width = 61
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
      Top = 134
      Width = 301
      Height = 36
      BevelOuter = bvNone
      TabOrder = 3
      object ckLightSourceOn3: TCheckBox
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Hint = 'Turn Light Source 3 On/Off'
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 46
        Top = 0
        Width = 78
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar4: TTrackBar
        Tag = 2
        Left = 128
        Top = 0
        Width = 105
        Height = 34
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit4: TValidatedEdit
        Tag = 3
        Left = 240
        Top = 0
        Width = 61
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
      Top = 171
      Width = 301
      Height = 35
      BevelOuter = bvNone
      TabOrder = 4
      object ckLightSourceOn4: TCheckBox
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit4: TEdit
        Tag = 1
        Left = 46
        Top = 0
        Width = 78
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar5: TTrackBar
        Tag = 2
        Left = 128
        Top = 0
        Width = 105
        Height = 34
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit5: TValidatedEdit
        Tag = 3
        Left = 240
        Top = 0
        Width = 61
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
      Top = 208
      Width = 301
      Height = 33
      BevelOuter = bvNone
      TabOrder = 5
      object ckLightSourceOn5: TCheckBox
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit5: TEdit
        Tag = 1
        Left = 46
        Top = 0
        Width = 78
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar6: TTrackBar
        Tag = 2
        Left = 128
        Top = 0
        Width = 105
        Height = 34
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit6: TValidatedEdit
        Tag = 3
        Left = 240
        Top = 0
        Width = 61
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
      Left = 11
      Top = 241
      Width = 266
      Height = 35
      BevelOuter = bvNone
      TabOrder = 6
      object ckLightSourceOn6: TCheckBox
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit6: TEdit
        Tag = 1
        Left = 46
        Top = 0
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar7: TTrackBar
        Tag = 2
        Left = 117
        Top = 0
        Width = 81
        Height = 34
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit7: TValidatedEdit
        Tag = 3
        Left = 199
        Top = 0
        Width = 61
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
      Left = 11
      Top = 280
      Width = 266
      Height = 36
      BevelOuter = bvNone
      TabOrder = 7
      object ckLightSourceOn7: TCheckBox
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit7: TEdit
        Tag = 1
        Left = 46
        Top = 0
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object TrackBar8: TTrackBar
        Tag = 2
        Left = 112
        Top = 1
        Width = 80
        Height = 33
        Max = 100
        Position = 100
        TabOrder = 2
        ThumbLength = 14
        TickStyle = tsManual
        OnChange = TrackBar1Change
      end
      object ValidatedEdit8: TValidatedEdit
        Tag = 3
        Left = 199
        Top = 0
        Width = 61
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
    Left = 11
    Top = 817
    Width = 321
    Height = 161
    Caption = ' Display '
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 2
      Top = 15
      Height = 144
      ExplicitHeight = 174
    end
    object cbPalette: TComboBox
      Left = 15
      Top = 20
      Width = 286
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
      Top = 48
      Width = 293
      Height = 105
      ActivePage = RangeTab
      MultiLine = True
      TabOrder = 1
      object RangeTab: TTabSheet
        Caption = 'Display Contrast'
        object bFullScale: TButton
          Left = 1
          Top = 4
          Width = 96
          Height = 24
          Hint = 'Set display intensity range to cover full camera range'
          Caption = 'Full Range'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bFullScaleClick
        end
        object bMaxContrast: TButton
          Left = 103
          Top = 4
          Width = 80
          Height = 24
          Hint = 'Set display range to min. - max.  intensities within image'
          Caption = 'Best'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bMaxContrastClick
        end
        object edDisplayIntensityRange: TRangeEdit
          Left = 2
          Top = 33
          Width = 181
          Height = 26
          Hint = 'Range of intensities displayed within image'
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
          Left = 192
          Top = 4
          Width = 88
          Height = 24
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
          Left = 192
          Top = 30
          Width = 87
          Height = 38
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
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label9: TLabel
          Left = 3
          Top = 4
          Width = 66
          Height = 19
          Caption = 'Contrast'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 3
          Top = 41
          Width = 84
          Height = 19
          Caption = 'Brightness'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 236
          Top = 4
          Width = 13
          Height = 27
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 236
          Top = 41
          Width = 13
          Height = 27
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 100
          Top = 0
          Width = 8
          Height = 27
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Bodoni MT Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 100
          Top = 34
          Width = 8
          Height = 27
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Bodoni MT Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object tbContrast: TTrackBar
          Tag = 2
          Left = 112
          Top = 4
          Width = 121
          Height = 34
          Max = 100
          Position = 100
          TabOrder = 0
          ThumbLength = 14
          TickStyle = tsManual
          OnChange = tbContrastChange
        end
        object tbBrightness: TTrackBar
          Tag = 2
          Left = 112
          Top = 38
          Width = 121
          Height = 34
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
    Top = 991
    Width = 321
    Height = 225
    Caption = ' Pixel Intensity Histogram '
    TabOrder = 5
    object plHistogram: TXYPlotDisplay
      Left = 11
      Top = 20
      Width = 296
      Height = 160
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
      Left = 11
      Top = 185
      Width = 296
      Height = 32
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Page: TPageControl
    Left = 339
    Top = 11
    Width = 776
    Height = 342
    ActivePage = tbChan0
    TabOrder = 6
    OnChange = PageChange
    object tbChan0: TTabSheet
      Caption = 'Channel 0'
      object Image0: TImage
        Left = 3
        Top = 3
        Width = 771
        Height = 283
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
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
      Caption = 'Channel 1'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image1: TImage
        Left = 3
        Top = 3
        Width = 771
        Height = 283
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
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
      Caption = 'Channel 2'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image2: TImage
        Left = 3
        Top = 3
        Width = 771
        Height = 283
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
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
      Caption = 'tbChan3'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image3: TImage
        Left = -4
        Top = 3
        Width = 770
        Height = 283
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
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
    Left = 783
    Top = 355
    Width = 290
    Height = 30
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 7
    object lbZSection: TLabel
      Left = 204
      Top = 0
      Width = 24
      Height = 20
      Caption = 'xxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 12
      Height = 18
      Caption = 'Z:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object scZSection: TScrollBar
      Left = 27
      Top = 0
      Width = 172
      Height = 20
      PageSize = 0
      TabOrder = 0
      OnChange = scZSectionChange
    end
  end
  object DisplayModeGrp: TGroupBox
    Left = 339
    Top = 361
    Width = 235
    Height = 42
    TabOrder = 8
    object rbZoomMode: TRadioButton
      Left = 11
      Top = 4
      Width = 116
      Height = 33
      Hint = 'Select image zoom/position selection mode'
      Caption = 'Zoom Mode'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
    end
    object rbROIMode: TRadioButton
      Left = 133
      Top = 4
      Width = 100
      Height = 33
      Hint = 'Display CCD region of interest selection rectangle'
      Caption = 'ROI Mode'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object TSectionPanel: TPanel
    Left = 752
    Top = 431
    Width = 290
    Height = 30
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 9
    object lbTSection: TLabel
      Left = 204
      Top = 0
      Width = 32
      Height = 18
      Caption = 'xxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 0
      Top = 0
      Width = 12
      Height = 18
      Caption = 'T:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object scTSection: TScrollBar
      Left = 27
      Top = 0
      Width = 172
      Height = 20
      PageSize = 0
      TabOrder = 0
      OnChange = scTSectionChange
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 60
    OnTimer = TimerTimer
    Left = 288
    Top = 392
  end
  object ImageFile: TImageFile
    XResolution = 1.000000000000000000
    YResolution = 1.000000000000000000
    ZResolution = 1.000000000000000000
    TResolution = 1.000000000000000000
    Left = 264
    Top = 320
  end
  object SaveDialog: TSaveDialog
    Left = 304
    Top = 440
  end
  object MainMenu1: TMainMenu
    Left = 296
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
    Left = 352
    Top = 488
  end
end
