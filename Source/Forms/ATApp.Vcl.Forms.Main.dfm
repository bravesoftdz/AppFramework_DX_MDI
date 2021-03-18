object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'App Framework - DX MDI'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ribMain: TdxRibbon
    Left = 0
    Top = 0
    Width = 640
    Height = 157
    ApplicationButton.Menu = bsvMain
    BarManager = barmgrMain
    CapitalizeTabCaptions = bDefault
    Style = rs2019
    ColorSchemeName = 'Office2019Colorful'
    QuickAccessToolbar.Toolbar = barQAT
    SupportNonClientDrawing = True
    Contexts = <>
    TabAreaSearchToolbar.Toolbar = barTAST
    TabAreaToolbar.Toolbar = barTAT
    TabOrder = 0
    TabStop = False
    object ribtabHome: TdxRibbonTab
      Active = True
      Caption = 'Home'
      Groups = <>
      Index = 0
    end
  end
  object bsvMain: TdxRibbonBackstageView
    Left = 8
    Top = 171
    Width = 577
    Height = 266
    Buttons = <>
    Ribbon = ribMain
  end
  object sbMain: TdxRibbonStatusBar
    Left = 0
    Top = 457
    Width = 640
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'barPageInfo'
      end
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'barKeyState'
      end
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'barZoomLevel'
      end>
    Ribbon = ribMain
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object barmgrMain: TdxBarManager
    AllowCallFromAnotherForm = True
    AlwaysMerge = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 448
    Top = 256
    PixelsPerInch = 96
    object barQAT: TdxBar
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barTAT: TdxBar
      Caption = 'Tab Area Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barTAST: TdxBar
      Caption = 'Tab Area Search Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 668
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barPageInfo: TdxBar
      Caption = 'Page Information Toolbar'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 668
      FloatTop = 2
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barKeyState: TdxBar
      Caption = 'Keyboard State Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1357
      FloatTop = 636
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barZoomLevel: TdxBar
      Caption = 'Zoom Level Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1363
      FloatTop = 730
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    ScrollbarMode = sbmHybrid
    SkinName = 'Office2019Colorful'
    ShowFormShadow = bTrue
    Left = 336
    Top = 256
  end
  object mdimgrMain: TdxTabbedMDIManager
    Active = True
    TabProperties.AllowTabDragDrop = True
    TabProperties.CloseTabWithMiddleClick = True
    TabProperties.CustomButtons.Buttons = <>
    TabProperties.Options = [pcoAlwaysShowGoDialogButton, pcoCloseButton, pcoGoDialog, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    TabProperties.ShowTabHints = True
    TabProperties.Style = 11
    Left = 336
    Top = 328
    PixelsPerInch = 96
  end
end
