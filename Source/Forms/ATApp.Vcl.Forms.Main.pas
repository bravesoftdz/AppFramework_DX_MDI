// ******************************************************************
//
// Program Name   : AppFwk
// Platform(s)    : Win32, Win64
// Framework      : VCL
//
// Filename       : ATApp.Vcl.Forms.Main.pas/.dfm
// Date Created   : 17-Mar-2021
// Author         : Matthew Vesperman
//
// Description:
//
// Defines the application's main form class.
//
// Revision History:
//
// v1.00   :   Initial version
//
// ******************************************************************
//
// COPYRIGHT © 2021 - PRESENT Angelic Technology
// ALL RIGHTS RESERVED WORLDWIDE
//
// ******************************************************************

unit ATApp.Vcl.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.ImgList,
  dxSkinsCore, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinsForm, dxBar, dxRibbon, dxRibbonForm,
  dxRibbonSkins, dxRibbonBackstageView, dxSkinBasic, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxRibbonCustomizationForm, dxStatusBar, dxRibbonStatusBar,
  dxGallery, dxGalleryControl, dxRibbonBackstageViewGalleryControl,
  dxBarBuiltInMenu, dxTabbedMDI, dxRibbonGallery,
  dxSkinChooserGallery, dxSkinBlack, dxSkinBlue, dxSkinSilver,
  dxOfficeSearchBox,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, cxBarEditItem, cxTextEdit, cxContainer, cxEdit, cxLabel,
  cxPC,
  ATApp.Attributes, ATApp.Types, ATApp.DEB.UISkin, ATApp.DEB.IconSets,
  ATApp.DEB.MainForm, ATApp.DEB.UI,
  EventBus, AT.Vcl.Actions.Data, dxCore, dxBarExtItems,
  AT.dxOfficeSearchBox2;

type
  /// <summary>
  ///   Defines the application's main form class.
  /// </summary>
  [TATFormType(fteMainForm)]
  TfrmMain = class(TdxRibbonForm)
    actInfoBarVisible: TATMultiDataAction;
    actQATAbove: TAction;
    actQATBelow: TAction;
    actQATVisible: TATMultiDataAction;
    actSBVisible: TATMultiDataAction;
    actSearchBarVisible: TATMultiDataAction;
    actUIPalette: TAction;
    alstMain: TActionList;
    barApp: TdxBar;
    barFile: TdxBar;
    barInfoBar: TdxBar;
    barKeyState: TdxBar;
    barmgrMain: TdxBarManager;
    barmgrMainBar1: TdxBar;
    barPageInfo: TdxBar;
    barQAT: TdxBar;
    barQATLayout: TdxBar;
    barSearchBar: TdxBar;
    barUITheme: TdxBar;
    barUITouch: TdxBar;
    barUIVisibility: TdxBar;
    barZoomLevel: TdxBar;
    bsvMain: TdxRibbonBackstageView;
    bsvtabHome: TdxRibbonBackstageViewTabSheet;
    cmdAppExit: TdxBarLargeButton;
    cmdBSVAppExit: TdxBarLargeButton;
    cmdCommandSearch: TcxBarEditItem;
    cmdInfoBarVisible: TdxBarLargeButton;
    cmdQATAbove: TdxBarLargeButton;
    cmdQATVisible: TdxBarLargeButton;
    cmdQATBelow: TdxBarLargeButton;
    cmdSBVisible: TdxBarLargeButton;
    cmdSearchBarVisible: TdxBarLargeButton;
    cmdTouchMode: TdxBarLargeButton;
    cmdUIPalette: TdxBarListItem;
    mdimgrMain: TdxTabbedMDIManager;
    ribMain: TdxRibbon;
    ribtabHome: TdxRibbonTab;
    ribtabUI: TdxRibbonTab;
    sbMain: TdxRibbonStatusBar;
    skngalUISkin: TdxSkinChooserGalleryItem;
    procedure ExecuteInfoBarVisibleAction(Sender: TObject);
    procedure ExecuteQATAboveAction(Sender: TObject);
    procedure ExecuteQATBelowAction(Sender: TObject);
    procedure ExecuteQATVisibleAction(Sender: TObject);
    procedure ExecuteSBVisibleAction(Sender: TObject);
    procedure ExecuteSearchBarVisibleAction(Sender: TObject);
    procedure ExecuteUIPaletteAction(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RibbonResizeHandler(Sender: TObject);
    procedure SkinChangedHandler(Sender: TObject; const ASkinName: string);
    procedure UpdateInfoBarVisibleAction(Sender: TObject);
    procedure UpdateQATAboveAction(Sender: TObject);
    procedure UpdateQATBelowAction(Sender: TObject);
    procedure UpdateQATVisibleAction(Sender: TObject);
    procedure UpdateSBVisibleAction(Sender: TObject);
    procedure UpdateSearchBarVisibleAction(Sender: TObject);
    procedure UpdateUIPaletteAction(Sender: TObject);
  strict private
    FTouchMode: Boolean;
    FUpdatingSkinProps: Boolean;
    procedure _UpdateBarGlyphs(AImgList: TCustomImageList);
    procedure _UpdateBSVIconSet;
    procedure _UpdateIconSets;
    procedure _UpdateInfoBarIconSet;
    procedure _UpdateMainIconSet;
    procedure _UpdateQATIconSet;
    procedure _UpdateSBIconSet;
    procedure _UpdateSearchBarIconSet;
    procedure _UpdateSearchBoxIconSet;
    procedure _UpdateSkinProps(const ASkinName, ASkinPalette, ARibbonSkin: string);
  strict protected
    function GetInfoBarVisible: Boolean;
    function GetQATPosition: TdxQuickAccessToolbarPosition;
    function GetQATVisible: Boolean;
    function GetSearchBarVisible: Boolean;
    function GetStatusBarVisible: Boolean;
    function GetStatusText: string;
    procedure SetInfoBarVisible(const Value: Boolean);
    procedure SetQATPosition(const Value: TdxQuickAccessToolbarPosition);
    procedure SetQATVisible(const Value: Boolean);
    procedure SetSearchBarVisible(const Value: Boolean);
    procedure SetStatusBarVisible(const Value: Boolean);
    procedure SetStatusText(const Value: string);
  public
    [Subscribe(TThreadMode.Main)]
    procedure OnCloseMainForm(AEvent: IEvtMainFormClose);
    [Subscribe(TThreadMode.Main)]
    procedure OnIconSetsChanged(AEvent: IEvtIconSetsChanged);
    [Subscribe(TThreadMode.Main)]
    procedure OnMainFormQueryBar(AEvent: IEvtMainFormQueryBar);
    [Subscribe(TThreadMode.Main)]
    procedure OnMainFormQueryBarMgr(AEvent: IEvtMainFormQueryBarManager);
    [Subscribe(TThreadMode.Main)]
    procedure OnTouchModeChanged(AEvent: IEvtUITouchModeChanged);
    [Subscribe(TThreadMode.Main)]
    procedure OnUISkinChanged(AEvent: IEvtUISkinChanged);
    property TouchMode: Boolean read FTouchMode;
  published
    property InfoBarVisible: Boolean read GetInfoBarVisible write SetInfoBarVisible;
    property QATPosition: TdxQuickAccessToolbarPosition read GetQATPosition write
        SetQATPosition;
    property QATVisible: Boolean read GetQATVisible write SetQATVisible;
    property SearchBarVisible: Boolean read GetSearchBarVisible write
        SetSearchBarVisible;
    property StatusBarVisible: Boolean read GetStatusBarVisible write
        SetStatusBarVisible;
    property StatusText: string read GetStatusText write SetStatusText;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.Rtti,
  AT.Automate, AT.Rtti, dxGDIPlusClasses,
  ATApp.Vcl.DM.Themeing, ATApp.Vcl.DM.StdDialogs, ATApp.Vcl.DM.Images,
  AT.Props.Consts, ATApp.ImgIndex.Consts, ATApp.Vcl.DM.AppActions,
  ATApp.RibbonUtils, ATApp.ActionUtils, ATApp.StatusBar.Consts;

procedure TfrmMain.ExecuteInfoBarVisibleAction(Sender: TObject);
begin

  InfoBarVisible := (NOT InfoBarVisible);

end;

procedure TfrmMain.ExecuteQATAboveAction(Sender: TObject);
begin

  QATPosition := qtpAboveRibbon;

end;

procedure TfrmMain.ExecuteQATBelowAction(Sender: TObject);
begin

  QATPosition := qtpBelowRibbon;

end;

procedure TfrmMain.ExecuteQATVisibleAction(Sender: TObject);
begin

  QATVisible := (NOT QATVisible);

end;

procedure TfrmMain.ExecuteSBVisibleAction(Sender: TObject);
begin

  StatusBarVisible := (NOT StatusBarVisible);

end;

procedure TfrmMain.ExecuteSearchBarVisibleAction(Sender: TObject);
begin

  SearchBarVisible := (NOT SearchBarVisible);

end;

procedure TfrmMain.ExecuteUIPaletteAction(Sender: TObject);
begin

  if (FUpdatingSkinProps) then
    exit;

  var Idx := cmdUIPalette.ItemIndex;
  var APalette := 'Default';

  if (Idx >= 0) then
    APalette := cmdUIPalette.Items[Idx];

  TUISkinEventPost.ChangeUIPalette( APalette );

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  DisableAero := True;

  GlobalEventBus.RegisterSubscriberForEvents( Self );

  var ARibbonSkin := TUISkinEventPost.QueryRibbonSkin;
  var ASkinName := TUISkinEventPost.QuerySkinName;
  var ASkinPalette := TUISkinEventPost.QuerySkinPalette;

  FTouchMode := TUIEventPost.QueryTouchMode;

  _UpdateSkinProps(ASkinName, ASkinPalette, ARibbonSkin);

  _UpdateIconSets;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin

  GlobalEventBus.UnregisterForEvents( Self );

end;

function TfrmMain.GetInfoBarVisible: Boolean;
begin

  Result := barInfoBar.Visible;

end;

function TfrmMain.GetQATPosition: TdxQuickAccessToolbarPosition;
begin

  Result := ribMain.QuickAccessToolbar.Position;

end;

function TfrmMain.GetQATVisible: Boolean;
begin

  Result := barQAT.Visible;

end;

function TfrmMain.GetSearchBarVisible: Boolean;
begin

  Result := barSearchBar.Visible;

end;

function TfrmMain.GetStatusBarVisible: Boolean;
begin

  Result := sbMain.Visible;

end;

function TfrmMain.GetStatusText: string;
begin

  var APanel := sbMain.Panels.Items[cSBPnl_Status];

  Result := APanel.Text;

end;

procedure TfrmMain.OnCloseMainForm(AEvent: IEvtMainFormClose);
begin

  if (Self.CloseQuery) then
    Self.Close;

end;

procedure TfrmMain.OnIconSetsChanged(AEvent: IEvtIconSetsChanged);
begin

  _UpdateIconSets;

end;

procedure TfrmMain.OnMainFormQueryBar(AEvent: IEvtMainFormQueryBar);
begin

  var ACallback := AEvent.Callback;

  if (NOT Assigned(ACallback)) then
    exit;

  var ABar: TdxBar := NIL;

  case AEvent.MainFormBar of
    mfbKeyState  : ABar := barKeyState;
    mfbPageInfo  : ABar := barPageInfo;
    mfbZoomLevel : ABar := barZoomLevel;
  end;

  ACallback(ABar);

end;

procedure TfrmMain.OnMainFormQueryBarMgr(
  AEvent: IEvtMainFormQueryBarManager);
begin

  var ACallback := AEvent.Callback;

  if (NOT Assigned(ACallback)) then
    exit;

  ACallback(barmgrMain);

end;

procedure TfrmMain.OnTouchModeChanged(AEvent: IEvtUITouchModeChanged);
begin
  FTouchMode := AEvent.TouchModeEnabled;
end;

procedure TfrmMain.OnUISkinChanged(AEvent: IEvtUISkinChanged);
begin

  var ASkinName := AEvent.SkinName;
  var ASkinPalette := AEvent.SkinPalette;
  var ARibbonSkin := AEvent.RibbonSkin;

  _UpdateSkinProps(ASkinName, ASkinPalette, ARibbonSkin);

end;

procedure TfrmMain.RibbonResizeHandler(Sender: TObject);
begin
  _UpdateQATIconSet;

  var Ahgt := ScaleFactor.Apply(24);

  sbMain.Height := AHgt;
end;

procedure TfrmMain.SetInfoBarVisible(const Value: Boolean);
begin

  barInfoBar.Visible := Value;

end;

procedure TfrmMain.SetQATPosition(const Value: TdxQuickAccessToolbarPosition);
begin

  ribMain.QuickAccessToolbar.Position := Value;

end;

procedure TfrmMain.SetQATVisible(const Value: Boolean);
begin

  barQAT.Visible := Value;

end;

procedure TfrmMain.SetSearchBarVisible(const Value: Boolean);
begin

  barSearchBar.Visible := Value;

end;

procedure TfrmMain.SetStatusBarVisible(const Value: Boolean);
begin

  sbMain.Visible := Value;

end;

procedure TfrmMain.SetStatusText(const Value: string);
begin

  var APanel := sbMain.Panels.Items[cSBPnl_Status];

  APanel.Text := Value;

end;

procedure TfrmMain.SkinChangedHandler(Sender: TObject; const ASkinName: string);
begin

  if (FUpdatingSkinProps) then
    exit;

  TUISkinEventPost.ChangeUISkin(ASkinName);

end;

procedure TfrmMain.UpdateInfoBarVisibleAction(Sender: TObject);
begin

  var bChecked := InfoBarVisible;

  SetPropertyValue(Sender, cPropChecked, bChecked);

  UpdateVisibilityAction(Sender);

end;

procedure TfrmMain.UpdateQATAboveAction(Sender: TObject);
begin

  ATApp.RibbonUtils.UpdateQATPositionAction(
      Sender, QATPosition, qtpAboveRibbon, QATVisible);

end;

procedure TfrmMain.UpdateQATBelowAction(Sender: TObject);
begin


  ATApp.RibbonUtils.UpdateQATPositionAction(
      Sender, QATPosition, qtpBelowRibbon, QATVisible);

end;

procedure TfrmMain.UpdateQATVisibleAction(Sender: TObject);
begin

  var bChecked := QATVisible;

  SetPropertyValue(Sender, cPropChecked, bChecked);

  UpdateVisibilityAction(Sender);

end;

procedure TfrmMain.UpdateSBVisibleAction(Sender: TObject);
begin

  var bChecked := StatusBarVisible;

  SetPropertyValue(Sender, cPropChecked, bChecked);

  UpdateVisibilityAction(Sender);

end;

procedure TfrmMain.UpdateSearchBarVisibleAction(Sender: TObject);
begin

  var bChecked := SearchBarVisible;

  SetPropertyValue(Sender, cPropChecked, bChecked);

  UpdateVisibilityAction(Sender);

end;

procedure TfrmMain.UpdateUIPaletteAction(Sender: TObject);
begin

  var bVisible := (cmdUIPalette.Items.Count > 1);

  AT.Rtti.SetPropertyValue(Sender, cPropEnabled, True);
  AT.Rtti.SetPropertyValue(Sender, cPropVisible, bVisible);

end;

procedure TfrmMain._UpdateBarGlyphs(AImgList: TCustomImageList);
begin

  UpdateBarGlyph(barApp, AImgList, cImgIdx_App);
  UpdateBarGlyph(barFile, AImgList, cImgIdx_File);
  UpdateBarGlyph(barQATLayout, AImgList, cImgIdx_UIQAT);
  UpdateBarGlyph(barUITheme, AImgList, cImgIdx_UITheme);
  UpdateBarGlyph(barUITouch, AImgList, cImgIdx_TouchMode);
  UpdateBarGlyph(barUIVisibility, AImgList, cImgIdx_Visible);

end;

procedure TfrmMain._UpdateBSVIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QueryBSVIconSet(ASmall, ALarge);

  UpdateBSVTabGlyph(bsvtabHome, ASmall, cImgIdx_Home);

  UpdateBarItemGlyph(cmdBSVAppExit, ASmall, ALarge, cImgIdx_AppExit);

end;

procedure TfrmMain._UpdateIconSets;
begin

  _UpdateMainIconSet;

  _UpdateBSVIconSet;
  _UpdateInfoBarIconSet;
  _UpdateQATIconSet;
  _UpdateSBIconSet;
  _UpdateSearchBarIconSet;
  _UpdateSearchBoxIconSet;

end;

procedure TfrmMain._UpdateInfoBarIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QueryInfoBarIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    barInfoBar.Images := ASmall;

end;

procedure TfrmMain._UpdateMainIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QueryMainIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    begin
      alstMain.Images := ASmall;
      barmgrMain.ImageOptions.Images := ASmall;

      _UpdateBarGlyphs(ASmall);
    end;

  if (Assigned(ALarge)) then
    barmgrMain.ImageOptions.LargeImages := ALarge;

end;

procedure TfrmMain._UpdateQATIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  case ribMain.QuickAccessToolbar.Position of
    qtpAboveRibbon: TIconSetsEventPost.QueryQATAboveIconSet(ASmall, ALarge);
    qtpBelowRibbon: TIconSetsEventPost.QueryQATBelowIconSet(ASmall, ALarge);
  end;

  if (Assigned(ASmall)) then
    barQAT.Images := ASmall;

end;

procedure TfrmMain._UpdateSBIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QuerySBIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    begin
        sbMain.Images := ASmall;
        barKeyState.Images := ASmall;
        barPageInfo.Images := ASmall;
        barZoomLevel.Images := ASmall;
    end;

end;

procedure TfrmMain._UpdateSearchBarIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QuerySearchBarIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    begin

      barSearchBar.Images := ASmall;

    end;

end;

procedure TfrmMain._UpdateSearchBoxIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QuerySearchBoxIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    begin

      UpdateCommandSearchGlyph(cmdCommandSearch, ASmall, cImgIdx_CommandSearch);

    end;

end;

procedure TfrmMain._UpdateSkinProps(const ASkinName, ASkinPalette, ARibbonSkin:
    string);
begin

  FUpdatingSkinProps := True;
  ribMain.BeginUpdate;
  var AAutoClean := TATAutoCleanupP.Create(procedure
      begin
        ribMain.EndUpdate;
        FUpdatingSkinProps := False;
      end);

  skngalUISkin.SelectedSkinName := ASkinName;

  ribMain.ColorSchemeName := ARibbonSkin;

  TUISkinEventPost.PopulatePaletteList(cmdUIPalette.Items);

  var Idx := cmdUIPalette.Items.IndexOf(ASkinPalette);

  cmdUIPalette.ItemIndex := Idx;

end;

end.
