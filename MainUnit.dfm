object MainFrm: TMainFrm
  Left = 122
  Top = 287
  Caption = 'to'
  ClientHeight = 894
  ClientWidth = 981
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -7
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesigned
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    981
    894)
  TextHeight = 13
  object lbReadout: TLabel
    Left = 521
    Top = 349
    Width = 4
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -14
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSaveFilename: TLabel
    Left = 546
    Top = 323
    Width = 3
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object ControlGrp: TGroupBox
    Left = 7
    Top = 7
    Width = 300
    Height = 230
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = ' Image Capture  '
    TabOrder = 0
    object Label7: TLabel
      Left = 172
      Top = 13
      Width = 59
      Height = 32
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Exposure Time'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label8: TLabel
      Left = 172
      Top = 58
      Width = 30
      Height = 16
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Gain'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 172
      Top = 105
      Width = 30
      Height = 16
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Alignment = taRightJustify
      Caption = 'Lens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bCaptureImage: TButton
      Left = 8
      Top = 70
      Width = 146
      Height = 22
      Hint = 'Capture new image(s)'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Capture Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bCaptureImageClick
    end
    object bStopImage: TButton
      Left = 8
      Top = 146
      Width = 146
      Height = 22
      Hint = 'Stop Image Capture'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Stop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bStopImageClick
    end
    object bLiveImage: TButton
      Left = 8
      Top = 19
      Width = 146
      Height = 21
      Hint = 'Display live images from camera'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Live Image'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bLiveImageClick
    end
    object cbCaptureMode: TComboBox
      Left = 8
      Top = 117
      Width = 146
      Height = 21
      Hint = 'Select image superresolution mode (pixel-shifting  cameras only)'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = cbCaptureModeChange
    end
    object edExposureTime: TValidatedEdit
      Left = 172
      Top = 32
      Width = 100
      Height = 24
      Hint = 'Exposure time (ms)'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      OnKeyPress = edExposureTimeKeyPress
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
      Left = 8
      Top = 172
      Width = 270
      Height = 48
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'CCD Capture Area '
      TabOrder = 5
      object bFullFrame: TButton
        Left = 7
        Top = 18
        Width = 45
        Height = 21
        Hint = 'Set CCD readout area to whole of CCD'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Full '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bFullFrameClick
      end
      object bSelectedRegion: TButton
        Left = 57
        Top = 18
        Width = 98
        Height = 21
        Hint = 'Set CCD readout area to rectangle indicated on display '
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Use R.O.I.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bSelectedRegionClick
      end
      object bEnterCCDArea: TButton
        Left = 161
        Top = 18
        Width = 101
        Height = 21
        Hint = 'Specify coordinates of CCD readout area'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Set Area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
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
      Left = 172
      Top = 77
      Width = 100
      Height = 24
      Hint = 'Camera analog gain'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = cbCameraGainChange
    end
    object cbLiveBin: TComboBox
      Left = 8
      Top = 42
      Width = 146
      Height = 21
      Hint = 'Live image binning mode'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnChange = cbLiveBinChange
    end
    object cbLens: TComboBox
      Left = 172
      Top = 122
      Width = 100
      Height = 24
      Hint = 'Camera analog gain'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnChange = cbLensChange
    end
    object cbCaptureBin: TComboBox
      Left = 8
      Top = 94
      Width = 146
      Height = 21
      Hint = 'Live image binning mode'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnChange = cbCaptureBinChange
    end
  end
  object ImageModeGrp: TGroupBox
    Left = 7
    Top = 241
    Width = 300
    Height = 164
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = ' Image Mode'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object ZStackGrp: TGroupBox
      Left = 8
      Top = 73
      Width = 282
      Height = 38
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 5
        Top = 8
        Width = 50
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Sections'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 94
        Top = 8
        Width = 26
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Step'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumZSections: TValidatedEdit
        Left = 59
        Top = 8
        Width = 30
        Height = 23
        Hint = 'No. of sections in Z stack'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ShowHint = True
        Text = ' 1 '
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        NumberFormat = '%.0f'
        LoLimit = 1.000000000000000000
        HiLimit = 20000.000000000000000000
      end
      object edNumPixelsPerZStep: TValidatedEdit
        Left = 124
        Top = 8
        Width = 71
        Height = 23
        Hint = 'Z increment between sections (pixels)'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        OnKeyPress = edNumPixelsPerZStepKeyPress
        ShowHint = True
        Text = ' 1 pixels'
        Value = 1.000000000000000000
        Scale = 1.000000000000000000
        Units = 'pixels'
        NumberFormat = '%.0f'
        LoLimit = -1000000.000000000000000000
        HiLimit = 1000000.000000000000000000
      end
      object edMicronsPerZStep: TValidatedEdit
        Left = 202
        Top = 8
        Width = 70
        Height = 23
        Hint = 'Z position increment between sections (microns)'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
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
      Left = 10
      Top = 16
      Width = 227
      Height = 16
      Hint = 
        'Check to produce separate, sequentially acquired  images for eac' +
        'h light source in use. '
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Acquire Multi-wavelength Images'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ckSeparateLightSourcesClick
    end
    object ckAcquireZStack: TCheckBox
      Left = 10
      Top = 34
      Width = 227
      Height = 17
      Hint = 
        'Check to acquire a series of image at incremental Z axis positio' +
        'ns'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Acquire Z Stack'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ckAcquireZStackClick
    end
    object ckAcquireTimeLapseSeries: TCheckBox
      Left = 10
      Top = 53
      Width = 227
      Height = 16
      Hint = 'Check to a acquire a series of images at timed intervals'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Acquire Time Lapse Series'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ckAcquireTimeLapseSeriesClick
    end
    object TimeLapseGrp: TGroupBox
      Left = 8
      Top = 115
      Width = 282
      Height = 38
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 56
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Alignment = taRightJustify
        Caption = 'No. points'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 124
        Top = 8
        Width = 78
        Height = 15
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Alignment = taRightJustify
        Caption = 'At Intervals of'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNumTimeLapsePoints: TValidatedEdit
        Left = 68
        Top = 8
        Width = 34
        Height = 23
        Hint = 'No. of images to be captured in time series'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
        Left = 206
        Top = 8
        Width = 68
        Height = 23
        Hint = 'Time interval between images'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        OnKeyPress = edNumPixelsPerZStepKeyPress
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
    Left = 7
    Top = 400
    Width = 300
    Height = 112
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = ' Stage Position '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object edGotoXPosition: TValidatedEdit
      Left = 8
      Top = 76
      Width = 80
      Height = 23
      Hint = 'Z axis position to move to'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      OnKeyPress = edGotoXPositionKeyPress
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ShowHint = True
      Text = ' 10000.0 um'
      Value = 10000.000000000000000000
      Scale = 1.000000000000000000
      Units = 'um'
      NumberFormat = '%.1f'
      LoLimit = -1000000.000000000000000000
      HiLimit = 1000000.000000000000000000
    end
    object bGotoZPosition: TButton
      Left = 210
      Top = 50
      Width = 80
      Height = 20
      Hint = 'Move stage to specified Z axis position'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Go to Z='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bGotoZPositionClick
    end
    object edGotoYPosition: TValidatedEdit
      Left = 110
      Top = 76
      Width = 80
      Height = 23
      Hint = 'Z axis position to move to'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      OnKeyPress = edGotoYPositionKeyPress
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ShowHint = True
      Text = ' 10000.0 um'
      Value = 10000.000000000000000000
      Scale = 1.000000000000000000
      Units = 'um'
      NumberFormat = '%.1f'
      LoLimit = -1000000.000000000000000000
      HiLimit = 1000000.000000000000000000
    end
    object edGotoZPosition: TValidatedEdit
      Left = 210
      Top = 76
      Width = 80
      Height = 23
      Hint = 'Z axis position to move to'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      OnKeyPress = edGotoZPositionKeyPress
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ShowHint = True
      Text = ' 10000.0 um'
      Value = 10000.000000000000000000
      Scale = 1.000000000000000000
      Units = 'um'
      NumberFormat = '%.1f'
      LoLimit = -1000000.000000000000000000
      HiLimit = 1000000.000000000000000000
    end
    object edXYZPosition: TEdit
      Left = 8
      Top = 20
      Width = 282
      Height = 24
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object bGoToXPosition: TButton
      Left = 8
      Top = 50
      Width = 80
      Height = 20
      Hint = 'Move stage to specified X axis position'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Go to X='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bGoToXPositionClick
    end
    object bGoToYPosition: TButton
      Left = 110
      Top = 50
      Width = 80
      Height = 20
      Hint = 'Move stage to specified Y axis position'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Go to Y='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = bGoToYPositionClick
    end
  end
  object Page: TPageControl
    Left = 316
    Top = 7
    Width = 649
    Height = 564
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ActivePage = tbChan0
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    OnChange = PageChange
    ExplicitWidth = 645
    ExplicitHeight = 563
    object tbChan0: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Channel 0'
      object Image0: TImage
        Left = 2
        Top = 0
        Width = 686
        Height = 251
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan1: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Channel 1'
      ImageIndex = 1
      object Image1: TImage
        Left = 2
        Top = 2
        Width = 686
        Height = 251
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan2: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Channel 2'
      ImageIndex = 2
      object Image2: TImage
        Left = 2
        Top = 2
        Width = 686
        Height = 251
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
    object tbChan3: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'tbChan3'
      ImageIndex = 3
      object Image3: TImage
        Left = -2
        Top = 0
        Width = 683
        Height = 251
        Hint = 
          'Double-click mouse to place and draw zoom region of interest box' +
          '.'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ParentShowHint = False
        ShowHint = True
        Stretch = True
        OnMouseDown = Image0MouseDown
        OnMouseMove = Image0MouseMove
        OnMouseUp = Image0MouseUp
      end
    end
  end
  object SlidersGrp: TGroupBox
    Left = 296
    Top = 1076
    Width = 679
    Height = 32
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    ExplicitTop = 1075
    ExplicitWidth = 675
    object TSectionPanel: TPanel
      Left = 8
      Top = 7
      Width = 218
      Height = 22
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvNone
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      object lbTSection: TLabel
        Left = 153
        Top = 0
        Width = 24
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'xxxx'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 0
        Top = 0
        Width = 10
        Height = 16
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'T:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object scTSection: TScrollBar
        Left = 16
        Top = 0
        Width = 132
        Height = 18
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        PageSize = 0
        TabOrder = 0
        OnChange = scTSectionChange
      end
    end
    object ZSectionPanel: TPanel
      Left = 199
      Top = 7
      Width = 218
      Height = 22
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      BevelOuter = bvNone
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      object lbZSection: TLabel
        Left = 153
        Top = 0
        Width = 24
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'xxxx'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = -1
        Top = 0
        Width = 12
        Height = 16
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Z:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object scZSection: TScrollBar
        Left = 16
        Top = 0
        Width = 133
        Height = 18
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        PageSize = 0
        TabOrder = 0
        OnChange = scZSectionChange
      end
    end
    object edSaveFileStatus: TEdit
      Left = 389
      Top = 9
      Width = 276
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = 'edSaveFileStatus'
    end
  end
  object DisplayPage: TPageControl
    Left = 7
    Top = 520
    Width = 299
    Height = 337
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ActivePage = RangeTab
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 5
    object RangeTab: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Display Contrast'
      object plHistogram: TXYPlotDisplay
        Left = 2
        Top = 27
        Width = 287
        Height = 166
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        OnCursorChange = plHistogramCursorChange
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
      object bFullScale: TButton
        Left = 2
        Top = 211
        Width = 84
        Height = 18
        Hint = 'Set display intensity range to cover full camera range'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Full Range'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bFullScaleClick
      end
      object bMaxContrast: TButton
        Left = 2
        Top = 237
        Width = 82
        Height = 18
        Hint = 'Set display range to min. - max.  intensities within image'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Best'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bMaxContrastClick
      end
      object edDisplayIntensityRange: TRangeEdit
        Left = 157
        Top = 233
        Width = 110
        Height = 19
        Hint = 'Range of intensities displayed within image'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        OnKeyPress = edDisplayIntensityRangeKeyPress
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ShowHint = True
        Text = ' 4096.00 - 4096.00 '
        LoValue = 4096.000000000000000000
        HiValue = 4096.000000000000000000
        HiLimit = 1.000000015047466E30
        Scale = 1.000000000000000000
        NumberFormat = '%.f - %.f'
      end
      object ckContrast6SDOnly: TCheckBox
        Left = 109
        Top = 256
        Width = 89
        Height = 20
        Hint = 
          'Set maximum contrast range to 6 standard deviations rather than ' +
          'min-max range'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '6 x s.d.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object ckAutoOptimise: TCheckBox
        Left = 2
        Top = 259
        Width = 92
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Auto adjust'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        WordWrap = True
      end
      object cbPalette: TComboBox
        Left = 2
        Top = 2
        Width = 287
        Height = 21
        Hint = 'Display colour palette'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnChange = cbPaletteChange
      end
      object edStatus: TEdit
        Left = 2
        Top = 280
        Width = 279
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object bRange: TButton
        Left = 157
        Top = 211
        Width = 110
        Height = 18
        Hint = 'Set display range to min. - max.  intensities within image'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Range'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = bRangeClick
      end
      object bCursors: TButton
        Left = 90
        Top = 211
        Width = 63
        Height = 18
        Hint = 'Set display range to min. - max.  intensities within image'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Cursors'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = bCursorsClick
      end
    end
    object LightSourcesTab: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Light Sources'
      ImageIndex = 1
      object LightSourceGrp: TGroupBox
        Left = 2
        Top = 2
        Width = 286
        Height = 271
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 0
        object pnLightSource0: TPanel
          Left = 8
          Top = 20
          Width = 269
          Height = 22
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          BevelOuter = bvNone
          TabOrder = 0
          object ckLightSourceOn0: TCheckBox
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            Hint = 'Turn Light Source 0 On/Off'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = ckLightSourceOn0Click
          end
          object edName: TEdit
            Tag = 1
            Left = 40
            Top = 0
            Width = 71
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ReadOnly = True
            TabOrder = 1
          end
          object TrackBar1: TTrackBar
            Tag = 2
            Left = 115
            Top = 0
            Width = 93
            Height = 31
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Max = 100
            Position = 100
            TabOrder = 2
            ThumbLength = 9
            TickStyle = tsManual
            OnChange = TrackBar1Change
          end
          object ValidatedEdit1: TValidatedEdit
            Tag = 3
            Left = 213
            Top = 0
            Width = 56
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
          Left = 8
          Top = 48
          Width = 269
          Height = 22
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          BevelOuter = bvNone
          TabOrder = 1
          object ckLightSourceOn1: TCheckBox
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            Hint = 'Turn Light Source 1 On/Off'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
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
            Left = 40
            Top = 0
            Width = 71
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ReadOnly = True
            TabOrder = 1
          end
          object TrackBar2: TTrackBar
            Tag = 2
            Left = 114
            Top = 0
            Width = 93
            Height = 31
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Max = 100
            Position = 100
            TabOrder = 2
            ThumbLength = 9
            TickStyle = tsManual
            OnChange = TrackBar1Change
          end
          object ValidatedEdit2: TValidatedEdit
            Tag = 3
            Left = 213
            Top = 0
            Width = 56
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
          Left = 8
          Top = 76
          Width = 269
          Height = 23
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          BevelOuter = bvNone
          TabOrder = 2
          object ckLightSourceOn2: TCheckBox
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            Hint = 'Turn Light Source 2 On/Off'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
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
            Left = 40
            Top = 0
            Width = 71
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ReadOnly = True
            TabOrder = 1
          end
          object TrackBar3: TTrackBar
            Tag = 2
            Left = 114
            Top = 0
            Width = 93
            Height = 31
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Max = 100
            Position = 100
            TabOrder = 2
            ThumbLength = 9
            TickStyle = tsManual
            OnChange = TrackBar1Change
          end
          object ValidatedEdit3: TValidatedEdit
            Tag = 3
            Left = 213
            Top = 0
            Width = 56
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
          Left = 8
          Top = 104
          Width = 269
          Height = 22
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          BevelOuter = bvNone
          TabOrder = 3
          object ckLightSourceOn3: TCheckBox
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            Hint = 'Turn Light Source 3 On/Off'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
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
            Left = 40
            Top = 0
            Width = 71
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ReadOnly = True
            TabOrder = 1
          end
          object TrackBar4: TTrackBar
            Tag = 2
            Left = 114
            Top = 0
            Width = 93
            Height = 31
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Max = 100
            Position = 100
            TabOrder = 2
            ThumbLength = 9
            TickStyle = tsManual
            OnChange = TrackBar1Change
          end
          object ValidatedEdit4: TValidatedEdit
            Tag = 3
            Left = 213
            Top = 0
            Width = 56
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
          Left = 8
          Top = 132
          Width = 269
          Height = 22
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          BevelOuter = bvNone
          TabOrder = 4
          object ckLightSourceOn4: TCheckBox
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = ckLightSourceOn0Click
          end
          object Edit4: TEdit
            Tag = 1
            Left = 40
            Top = 0
            Width = 71
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ReadOnly = True
            TabOrder = 1
          end
          object TrackBar5: TTrackBar
            Tag = 2
            Left = 114
            Top = 0
            Width = 93
            Height = 31
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Max = 100
            Position = 100
            TabOrder = 2
            ThumbLength = 9
            TickStyle = tsManual
            OnChange = TrackBar1Change
          end
          object ValidatedEdit5: TValidatedEdit
            Tag = 3
            Left = 213
            Top = 0
            Width = 56
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
          Left = 8
          Top = 160
          Width = 269
          Height = 22
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          BevelOuter = bvNone
          TabOrder = 5
          object ckLightSourceOn5: TCheckBox
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = ckLightSourceOn0Click
          end
          object Edit5: TEdit
            Tag = 1
            Left = 40
            Top = 0
            Width = 71
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ReadOnly = True
            TabOrder = 1
          end
          object TrackBar6: TTrackBar
            Tag = 2
            Left = 114
            Top = 0
            Width = 93
            Height = 31
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Max = 100
            Position = 100
            TabOrder = 2
            ThumbLength = 9
            TickStyle = tsManual
            OnChange = TrackBar1Change
          end
          object ValidatedEdit6: TValidatedEdit
            Tag = 3
            Left = 213
            Top = 0
            Width = 56
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
          Left = 8
          Top = 188
          Width = 267
          Height = 23
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          BevelOuter = bvNone
          TabOrder = 6
          object ckLightSourceOn6: TCheckBox
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = ckLightSourceOn0Click
          end
          object Edit6: TEdit
            Tag = 1
            Left = 40
            Top = 0
            Width = 65
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ReadOnly = True
            TabOrder = 1
          end
          object TrackBar7: TTrackBar
            Tag = 2
            Left = 114
            Top = 1
            Width = 93
            Height = 31
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Max = 100
            Position = 100
            TabOrder = 2
            ThumbLength = 9
            TickStyle = tsManual
            OnChange = TrackBar1Change
          end
          object ValidatedEdit7: TValidatedEdit
            Tag = 3
            Left = 213
            Top = 3
            Width = 53
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
          Left = 8
          Top = 216
          Width = 267
          Height = 22
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          BevelOuter = bvNone
          TabOrder = 7
          object ckLightSourceOn7: TCheckBox
            Left = 0
            Top = 0
            Width = 40
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'On'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = ckLightSourceOn0Click
          end
          object Edit7: TEdit
            Tag = 1
            Left = 40
            Top = 0
            Width = 65
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            ReadOnly = True
            TabOrder = 1
          end
          object TrackBar8: TTrackBar
            Tag = 2
            Left = 114
            Top = 1
            Width = 93
            Height = 30
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Max = 100
            Position = 100
            TabOrder = 2
            ThumbLength = 9
            TickStyle = tsManual
            OnChange = TrackBar1Change
          end
          object ValidatedEdit8: TValidatedEdit
            Tag = 3
            Left = 213
            Top = 0
            Width = 53
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 60
    OnTimer = TimerTimer
    Left = 551
    Top = 568
  end
  object ImageFile: TImageFile
    XResolution = 1.000000000000000000
    YResolution = 1.000000000000000000
    ZResolution = 1.000000000000000000
    TResolution = 1.000000000000000000
    Left = 728
    Top = 568
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
    PulseIntervalTriggerMode = False
    Left = 688
    Top = 560
  end
end
