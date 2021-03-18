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
  OnCreate = FormCreate
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
    TabAreaSearchToolbar.Toolbar = barTAST
    TabAreaToolbar.Toolbar = barTAT
    TabOrder = 0
    TabStop = False
    object ribtabHome: TdxRibbonTab
      Active = True
      Caption = 'Home'
      Groups = <
        item
          ToolbarName = 'barmgrChildBar1'
        end>
      Index = 0
    end
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
          ItemName = 'cmd1'
        end>
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
      FloatLeft = 801
      FloatTop = 730
      FloatClientWidth = 79
      FloatClientHeight = 42
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
    object barmgrChildBar1: TdxBar
      Caption = 'Custom 1'
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
          ItemName = 'cmd1'
        end>
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
    object barPageInfo: TdxBar
      Caption = 'Page Information Toolbar'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
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
      Visible = False
      WholeRow = False
    end
    object barKeyState: TdxBar
      Caption = 'Keyboard State Toolbar'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
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
      Row = 1
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object barZoomLevel: TdxBar
      Caption = 'Zoom Level Toolbar'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
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
      Row = 2
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object cmd1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      OnClick = cmd1Click
    end
  end
end
