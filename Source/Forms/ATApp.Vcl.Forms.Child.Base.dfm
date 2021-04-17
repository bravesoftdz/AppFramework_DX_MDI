object frmBaseChild: TfrmBaseChild
  Left = 0
  Top = 0
  Caption = 'Base Child Form'
  ClientHeight = 397
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ribChild: TdxRibbon
    Left = 0
    Top = 0
    Width = 553
    Height = 157
    BarManager = barmgrChild
    CapitalizeTabCaptions = bDefault
    Style = rs2019
    ColorSchemeName = 'Office2019Colorful'
    QuickAccessToolbar.Toolbar = barQAT
    SupportNonClientDrawing = True
    Contexts = <>
    TabAreaSearchToolbar.Toolbar = barSearchBar
    TabAreaToolbar.Toolbar = barInfoBar
    TabOrder = 0
    TabStop = False
    object ribtabHome: TdxRibbonTab
      Active = True
      Caption = 'Home'
      Groups = <
        item
          ToolbarName = 'barFile'
        end
        item
          ToolbarName = 'barmgrChildBar1'
        end>
      Index = 0
    end
  end
  object sbChild: TdxRibbonStatusBar
    Left = 0
    Top = 373
    Width = 553
    Height = 24
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'barPageInfo'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'barKeyState'
      end
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'barZoomLevel'
        Bevel = dxpbNone
      end>
    Ribbon = ribChild
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Visible = False
    ExplicitTop = 371
  end
  object barmgrChild: TdxBarManager
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
    ImageOptions.Images = dmImages.ilstLightSm
    ImageOptions.LargeImages = dmImages.ilstLightLg
    ImageOptions.LargeIcons = True
    ImageOptions.MakeDisabledImagesFaded = True
    ImageOptions.SmoothGlyphs = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 120
    Top = 168
    PixelsPerInch = 96
    object barQAT: TdxBar
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 960
      FloatTop = 699
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdFileClose'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barInfoBar: TdxBar
      Caption = 'InfoBar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 801
      FloatTop = 730
      FloatClientWidth = 51
      FloatClientHeight = 54
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdFileClose'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barFile: TdxBar
      Caption = 'File'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 581
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdFileClose'
        end>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barSearchBar: TdxBar
      Caption = 'Search Bar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 581
      FloatTop = 2
      FloatClientWidth = 51
      FloatClientHeight = 54
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdFileClose'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barPageInfo: TdxBar
      Caption = 'Page Information Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 581
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdFileClose'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barKeyState: TdxBar
      Caption = 'Keyboard State Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 581
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdFileClose'
        end>
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
      FloatLeft = 581
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdFileClose'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barmgrChildBar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedLeft = 52
      DockedTop = 0
      FloatLeft = 581
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmd1'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object cmdFileClose: TdxBarLargeButton
      Action = actFileClose
      Category = 0
    end
    object cmd1: TdxBarLargeButton
      Caption = 'Ask Question'
      Category = 0
      Hint = 'Ask Question'
      Visible = ivAlways
      OnClick = cmd1Click
      LargeImageIndex = 0
    end
  end
  object alstChild: TActionList
    Images = dmImages.ilstLightSm
    Left = 272
    Top = 208
    object actFileClose: TAction
      Caption = 'Close'
      ImageIndex = 80
      OnExecute = ExecuteFileCloseAction
    end
  end
end
