object MainFrm: TMainFrm
  Left = 122
  Top = 357
  Caption = 'to'
  ClientHeight = 1430
  ClientWidth = 1486
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
    Left = 409
    Top = 492
    Width = 5
    Height = 21
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -18
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ControlGrp: TGroupBox
    Left = 14
    Top = 14
    Width = 394
    Height = 356
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Image Capture  '
    TabOrder = 0
    object Label7: TLabel
      Left = 237
      Top = 15
      Width = 84
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
      Left = 236
      Top = 85
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
      Left = 239
      Top = 163
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
      Left = 14
      Top = 108
      Width = 165
      Height = 31
      Hint = 'Capture new image(s)'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Capture Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
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
      Top = 194
      Width = 167
      Height = 32
      Hint = 'Stop Image Capture'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Stop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bStopImageClick
    end
    object bLiveImage: TButton
      Left = 14
      Top = 27
      Width = 165
      Height = 33
      Hint = 'Display live images from camera'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Live Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bLiveImageClick
    end
    object cbCaptureMode: TComboBox
      Left = 14
      Top = 149
      Width = 165
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
      Left = 237
      Top = 42
      Width = 137
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
      Left = 14
      Top = 236
      Width = 365
      Height = 107
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'CCD Capture Area '
      TabOrder = 5
      object bFullFrame: TButton
        Left = 14
        Top = 27
        Width = 144
        Height = 29
        Hint = 'Set CCD readout area to whole of CCD'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Full CCD area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bFullFrameClick
      end
      object bSelectedRegion: TButton
        Left = 14
        Top = 60
        Width = 144
        Height = 28
        Hint = 'Set CCD readout area to rectangle indicated on display '
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Use R.O.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bSelectedRegionClick
      end
      object bEnterCCDArea: TButton
        Left = 165
        Top = 27
        Width = 146
        Height = 29
        Hint = 'Specify coordinates of CCD readout area'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Set CCD area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
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
      Left = 236
      Top = 112
      Width = 135
      Height = 30
      Hint = 'Camera analog gain'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = cbCameraGainChange
    end
    object cbLiveBin: TComboBox
      Left = 14
      Top = 64
      Width = 165
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
      Left = 236
      Top = 191
      Width = 138
      Height = 30
      Hint = 'Camera analog gain'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
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
    Left = 14
    Top = 379
    Width = 394
    Height = 295
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Image Mode'
    TabOrder = 1
    object ZStackGrp: TGroupBox
      Left = 14
      Top = 153
      Width = 364
      Height = 83
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 0
      object Label5: TLabel
        Left = 9
        Top = 4
        Width = 110
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'No. Sections'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 135
        Top = 4
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Z Step Size'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumZSections: TValidatedEdit
        Left = 9
        Top = 33
        Width = 83
        Height = 24
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
        Left = 135
        Top = 33
        Width = 109
        Height = 24
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
        Left = 253
        Top = 33
        Width = 106
        Height = 24
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
      Left = 14
      Top = 27
      Width = 315
      Height = 29
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
      Left = 14
      Top = 51
      Width = 315
      Height = 29
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
      Left = 14
      Top = 80
      Width = 315
      Height = 28
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
      Left = 14
      Top = 209
      Width = 364
      Height = 82
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 4
      object Label3: TLabel
        Left = 10
        Top = 4
        Width = 88
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        Caption = 'No. points'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 139
        Top = 4
        Width = 122
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        Caption = 'At Intervals of'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumTimeLapsePoints: TValidatedEdit
        Left = 9
        Top = 31
        Width = 94
        Height = 24
        Hint = 'No. of images to be captured in time series'
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
        HiLimit = 30000.000000000000000000
      end
      object edTimeLapseInterval: TValidatedEdit
        Left = 135
        Top = 31
        Width = 121
        Height = 24
        Hint = 'Time interval between images'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
    Left = 14
    Top = 714
    Width = 394
    Height = 192
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Stage Position '
    TabOrder = 2
    object lbX: TLabel
      Left = 172
      Top = 80
      Width = 25
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'X='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbY: TLabel
      Left = 172
      Top = 116
      Width = 25
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Y='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbZ: TLabel
      Left = 172
      Top = 152
      Width = 23
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Z='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edGotoXPosition: TValidatedEdit
      Left = 199
      Top = 77
      Width = 180
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
      Left = 50
      Top = 77
      Width = 108
      Height = 29
      Hint = 'Move stage to specified Z axis position'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Go To'
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
      Left = 199
      Top = 115
      Width = 180
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
      Left = 199
      Top = 152
      Width = 180
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
      Left = 14
      Top = 28
      Width = 365
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object LightSourceGrp: TGroupBox
    Left = 14
    Top = 914
    Width = 394
    Height = 286
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Light Source '
    TabOrder = 3
    object pnLightSource0: TPanel
      Left = 4
      Top = 41
      Width = 370
      Height = 40
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 0
      object ckLightSourceOn0: TCheckBox
        Left = 0
        Top = 0
        Width = 56
        Height = 28
        Hint = 'Turn Light Source 0 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object edName: TEdit
        Tag = 1
        Left = 56
        Top = 0
        Width = 97
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
        Left = 158
        Top = 0
        Width = 129
        Height = 42
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
        Left = 295
        Top = 0
        Width = 76
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
      Top = 84
      Width = 370
      Height = 42
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 1
      object ckLightSourceOn1: TCheckBox
        Left = 0
        Top = 0
        Width = 56
        Height = 28
        Hint = 'Turn Light Source 1 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
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
        Left = 56
        Top = 0
        Width = 97
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
        Left = 158
        Top = 0
        Width = 129
        Height = 42
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
        Left = 295
        Top = 0
        Width = 76
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
      Top = 127
      Width = 370
      Height = 45
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 2
      object ckLightSourceOn2: TCheckBox
        Left = 0
        Top = 0
        Width = 56
        Height = 28
        Hint = 'Turn Light Source 2 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
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
        Left = 56
        Top = 0
        Width = 97
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
        Left = 158
        Top = 0
        Width = 129
        Height = 42
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
        Left = 295
        Top = 0
        Width = 76
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
      Top = 165
      Width = 370
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 3
      object ckLightSourceOn3: TCheckBox
        Left = 0
        Top = 0
        Width = 56
        Height = 28
        Hint = 'Turn Light Source 3 On/Off'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
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
        Left = 56
        Top = 0
        Width = 97
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
        Left = 158
        Top = 0
        Width = 129
        Height = 42
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
        Left = 295
        Top = 0
        Width = 76
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
      Top = 210
      Width = 370
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 4
      object ckLightSourceOn4: TCheckBox
        Left = 0
        Top = 0
        Width = 56
        Height = 28
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit4: TEdit
        Tag = 1
        Left = 56
        Top = 0
        Width = 97
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
        Left = 158
        Top = 0
        Width = 129
        Height = 42
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
        Left = 295
        Top = 0
        Width = 76
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
      Top = 256
      Width = 370
      Height = 41
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 5
      object ckLightSourceOn5: TCheckBox
        Left = 0
        Top = 0
        Width = 56
        Height = 28
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit5: TEdit
        Tag = 1
        Left = 56
        Top = 0
        Width = 97
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
        Left = 158
        Top = 0
        Width = 129
        Height = 42
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
        Left = 295
        Top = 0
        Width = 76
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
      Left = 14
      Top = 297
      Width = 327
      Height = 43
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 6
      object ckLightSourceOn6: TCheckBox
        Left = 0
        Top = 0
        Width = 56
        Height = 28
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit6: TEdit
        Tag = 1
        Left = 56
        Top = 0
        Width = 90
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
        Left = 144
        Top = 0
        Width = 100
        Height = 42
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
        Left = 245
        Top = 0
        Width = 75
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
      Left = 14
      Top = 345
      Width = 327
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      TabOrder = 7
      object ckLightSourceOn7: TCheckBox
        Left = 0
        Top = 0
        Width = 56
        Height = 28
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'On'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckLightSourceOn0Click
      end
      object Edit7: TEdit
        Tag = 1
        Left = 56
        Top = 0
        Width = 90
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
        Left = 138
        Top = 1
        Width = 98
        Height = 41
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
        Left = 245
        Top = 0
        Width = 75
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
    Left = 14
    Top = 1006
    Width = 394
    Height = 234
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Display '
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 2
      Top = 18
      Width = 4
      Height = 214
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 3
      ExplicitTop = 20
      ExplicitHeight = 212
    end
    object cbPalette: TComboBox
      Left = 18
      Top = 24
      Width = 353
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
      Left = 18
      Top = 68
      Width = 361
      Height = 143
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
          Width = 118
          Height = 29
          Hint = 'Set display intensity range to cover full camera range'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Full Range'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bFullScaleClick
        end
        object bMaxContrast: TButton
          Left = 127
          Top = 5
          Width = 98
          Height = 29
          Hint = 'Set display range to min. - max.  intensities within image'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Best'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bMaxContrastClick
        end
        object edDisplayIntensityRange: TRangeEdit
          Left = 3
          Top = 41
          Width = 222
          Height = 32
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
          Left = 236
          Top = 5
          Width = 109
          Height = 29
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
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object ckAutoOptimise: TCheckBox
          Left = 236
          Top = 37
          Width = 107
          Height = 47
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Auto adjust'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
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
          Top = 5
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
          Top = 50
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
          Left = 291
          Top = 5
          Width = 16
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -28
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 291
          Top = 50
          Width = 16
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -28
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 123
          Top = 0
          Width = 10
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -28
          Font.Name = 'Bodoni MT Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 123
          Top = 42
          Width = 10
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -28
          Font.Name = 'Bodoni MT Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object tbContrast: TTrackBar
          Tag = 2
          Left = 138
          Top = 5
          Width = 149
          Height = 42
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
          Left = 138
          Top = 47
          Width = 149
          Height = 41
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
    Left = 14
    Top = 1254
    Width = 394
    Height = 320
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Pixel Intensity Histogram '
    TabOrder = 5
    object plHistogram: TXYPlotDisplay
      Left = 14
      Top = 30
      Width = 364
      Height = 231
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
      Left = 14
      Top = 269
      Width = 360
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
    Left = 417
    Top = 14
    Width = 955
    Height = 421
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
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
        Left = 4
        Top = 4
        Width = 949
        Height = 348
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image1: TImage
        Left = 4
        Top = 4
        Width = 949
        Height = 348
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image2: TImage
        Left = 4
        Top = 4
        Width = 949
        Height = 348
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image3: TImage
        Left = -5
        Top = 4
        Width = 948
        Height = 348
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
    Left = 964
    Top = 437
    Width = 356
    Height = 37
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 7
    object lbZSection: TLabel
      Left = 251
      Top = 0
      Width = 28
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'xxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 17
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Z:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object scZSection: TScrollBar
      Left = 33
      Top = 0
      Width = 212
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      PageSize = 0
      TabOrder = 0
      OnChange = scZSectionChange
    end
  end
  object DisplayModeGrp: TGroupBox
    Left = 417
    Top = 444
    Width = 290
    Height = 52
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 8
    object rbZoomMode: TRadioButton
      Left = 14
      Top = 5
      Width = 142
      Height = 41
      Hint = 'Select image zoom/position selection mode'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Zoom Mode'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
    end
    object rbROIMode: TRadioButton
      Left = 164
      Top = 5
      Width = 123
      Height = 41
      Hint = 'Display CCD region of interest selection rectangle'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'ROI Mode'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object TSectionPanel: TPanel
    Left = 925
    Top = 531
    Width = 357
    Height = 36
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 9
    object lbTSection: TLabel
      Left = 251
      Top = 0
      Width = 44
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'xxxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 0
      Top = 0
      Width = 16
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'T:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object scTSection: TScrollBar
      Left = 33
      Top = 0
      Width = 212
      Height = 24
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
