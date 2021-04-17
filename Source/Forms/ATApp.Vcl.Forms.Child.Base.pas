unit ATApp.Vcl.Forms.Child.Base;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dxSkinsCore, dxSkinBasic, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxRibbonSkins, dxRibbonCustomizationForm,
  dxRibbon, dxBar, dxRibbonForm,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, EventBus,
  ATApp.Attributes, ATApp.Types, dxSkinBlack, dxSkinBlue, dxSkinSilver,
  ATApp.DEB.UISkin, System.Actions, Vcl.ActnList, ATApp.Vcl.DM.Images,
  ATApp.DEB.IconSets, dxStatusBar, dxRibbonStatusBar, ATApp.DEB.UI,
  dxCore;

type
  [TATFormType(fteChild)]
  TfrmBaseChild = class(TdxRibbonForm)
    actFileClose: TAction;
    alstChild: TActionList;
    barFile: TdxBar;
    barInfoBar: TdxBar;
    barKeyState: TdxBar;
    barmgrChild: TdxBarManager;
    barPageInfo: TdxBar;
    barQAT: TdxBar;
    barSearchBar: TdxBar;
    barZoomLevel: TdxBar;
    cmdFileClose: TdxBarLargeButton;
    ribChild: TdxRibbon;
    ribtabHome: TdxRibbonTab;
    sbChild: TdxRibbonStatusBar;
    barmgrChildBar1: TdxBar;
    cmd1: TdxBarLargeButton;
    procedure cmd1Click(Sender: TObject);
    procedure ExecuteFileCloseAction(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  strict private
    FTouchMode: Boolean;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
  strict protected
    procedure ActivateChildForm; virtual;
    procedure DeactivateChildForm; virtual;
    procedure MergeBars; virtual;
    procedure UnmergeBars; virtual;
    procedure UpdateBSVIconSet; virtual;
    procedure UpdateIconSets; virtual;
    procedure UpdateInfoBarIconSet; virtual;
    procedure UpdateMainIconSet; virtual;
    procedure UpdateQATIconSet; virtual;
    procedure UpdateSBIconSet; virtual;
    procedure UpdateSearchBarIconSet; virtual;
    procedure UpdateSearchBoxIconSet; virtual;
    procedure _MergeBar(AMainBar, AChildBar: TdxBar); virtual;
    procedure _UnmergeBar(AMainBar, AChildBar: TdxBar); virtual;
    property TouchMode: Boolean read FTouchMode;
  public
    [Subscribe(TThreadMode.Main)]
    procedure OnIconSetsChanged(AEvent: IEvtIconSetsChanged);
    [Subscribe(TThreadMode.Main)]
    procedure OnTouchModeChanged(AEvent: IEvtUITouchModeChanged);
    [Subscribe(TThreadMode.Main)]
    procedure OnUISkinChanged(AEvent: IEvtUISkinChanged);
  end;

var
  frmBaseChild: TfrmBaseChild;

implementation

{$R *.dfm}

uses
  AT.DEB.Events.StdDialogs, Vcl.ImgList, ATApp.DEB.MainForm,
  AT.Automate;

procedure TfrmBaseChild.ActivateChildForm;
begin

  MergeBars;

end;

procedure TfrmBaseChild.cmd1Click(Sender: TObject);
begin

  var AResult := TStdDialogsEventPost.ShowYesNoDialog(
      'This is a really long message from the child form. It should wrap to another line. I hope!',
      'App Framework - DX MDI',
      'Title text goes here!',
      'Yes, please!', 'This will perform a ShowMessage.',
      'No, thank you!', 'This will perform a ShowWarning.',
      450, 300);

  if (AResult = mrYes) then
    TStdDialogsEventPost.ShowMessage('You clicked yes!')
  else if (AResult = mrNo) then
    TStdDialogsEventPost.ShowWarning('You said no!')
  else if (AResult = mrCancel) then
    TStdDialogsEventPost.ShowError('You canceled the dialog!')
  else
    TStdDialogsEventPost.ShowError('I have no idea what you did!');

end;

procedure TfrmBaseChild.DeactivateChildForm;
begin

  UnmergeBars;

end;

procedure TfrmBaseChild.ExecuteFileCloseAction(Sender: TObject);
begin

  Self.Close;

end;

procedure TfrmBaseChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Action := caFree;

end;

procedure TfrmBaseChild.FormCreate(Sender: TObject);
begin

  ribChild.Visible := False;

  GlobalEventBus.RegisterSubscriberForEvents( Self );

  var ARibbonSkin := TUISkinEventPost.QueryRibbonSkin;

  ribChild.ColorSchemeName := ARibbonSkin;

  FTouchMode := TUIEventPost.QueryTouchMode;

end;

procedure TfrmBaseChild.FormDestroy(Sender: TObject);
begin

  GlobalEventBus.UnregisterForEvents( Self );

end;

procedure TfrmBaseChild.MergeBars;
begin

  var ABarMgr := TMainFormEventPost.QueryMainFormBarManager;

  if (Assigned(ABarMgr)) then
    begin

      ABarMgr.BeginUpdate;

      var AutoClean := TATAutoCleanupP.Create( procedure
          begin
            ABarMgr.EndUpdate(True);
          end);

    end;

  _MergeBar( TMainFormEventPost.QueryMainFormBarKeyState,
      barKeyState);

  _MergeBar( TMainFormEventPost.QueryMainFormBarPageInfo,
      barPageInfo);

  _MergeBar( TMainFormEventPost.QueryMainFormBarZoomLevel,
      barZoomLevel);

end;

procedure TfrmBaseChild.OnIconSetsChanged(
  AEvent: IEvtIconSetsChanged);
begin

  UpdateIconSets;

end;

procedure TfrmBaseChild.OnTouchModeChanged(
  AEvent: IEvtUITouchModeChanged);
begin
  FTouchMode := AEvent.TouchModeEnabled;
end;

procedure TfrmBaseChild.OnUISkinChanged(AEvent: IEvtUISkinChanged);
begin

  var ARibbonSkin := AEvent.RibbonSkin;

  ribChild.ColorSchemeName := ARibbonSkin;

end;

procedure TfrmBaseChild.UnmergeBars;
begin

  var ABarMgr := TMainFormEventPost.QueryMainFormBarManager;

  if (Assigned(ABarMgr)) then
    begin

      ABarMgr.BeginUpdate;

      var AutoClean := TATAutoCleanupP.Create( procedure
          begin
            ABarMgr.EndUpdate(True);
          end);

    end;

  _UnmergeBar( TMainFormEventPost.QueryMainFormBarKeyState,
      barKeyState);

  _UnmergeBar( TMainFormEventPost.QueryMainFormBarPageInfo,
      barPageInfo);

  _UnmergeBar( TMainFormEventPost.QueryMainFormBarZoomLevel,
      barZoomLevel);

end;

procedure TfrmBaseChild.UpdateBSVIconSet;
begin

  //Do nothing here...

end;

procedure TfrmBaseChild.UpdateIconSets;
begin

  UpdateMainIconSet;

  UpdateBSVIconSet;
  UpdateInfoBarIconSet;
  UpdateQATIconSet;
  UpdateSBIconSet;
  UpdateSearchBarIconSet;
  UpdateSearchBoxIconSet;

end;

procedure TfrmBaseChild.UpdateInfoBarIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QueryInfoBarIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    barInfoBar.Images := ASmall;

end;

procedure TfrmBaseChild.UpdateMainIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QueryMainIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    begin
      alstChild.Images := ASmall;
      barmgrChild.ImageOptions.Images := ASmall;
    end;

  if (Assigned(ALarge)) then
    barmgrChild.ImageOptions.LargeImages := ALarge;

end;

procedure TfrmBaseChild.UpdateQATIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  case ribChild.QuickAccessToolbar.Position of
    qtpAboveRibbon: TIconSetsEventPost.QueryQATAboveIconSet(ASmall, ALarge);
    qtpBelowRibbon: TIconSetsEventPost.QueryQATBelowIconSet(ASmall, ALarge);
  end;

  if (Assigned(ASmall)) then
    barQAT.Images := ASmall;

end;

procedure TfrmBaseChild.UpdateSBIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QuerySBIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    begin
        barKeyState.Images := ASmall;
        barPageInfo.Images := ASmall;
        barZoomLevel.Images := ASmall;
    end;

end;

procedure TfrmBaseChild.UpdateSearchBarIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QuerySearchBarIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    begin

      barSearchBar.Images := ASmall;

    end;

end;

procedure TfrmBaseChild.UpdateSearchBoxIconSet;
begin

  //Do nothing here...

end;

procedure TfrmBaseChild.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
begin

  var bActivating := (Self.Handle = msg.ActiveWnd);
  var bDeactivating := (Self.Handle = msg.DeactiveWnd);

  if (bActivating) then
    begin
      ActivateChildForm;
    end
  else if (bDeactivating) then
    begin
      DeactivateChildForm;
    end;
end;

procedure TfrmBaseChild._MergeBar(AMainBar, AChildBar: TdxBar);
begin

  if ( (NOT Assigned(AMainBar)) OR (NOT Assigned(AChildBar)) ) then
    exit;

  AMainBar.Merge( AChildBar );

end;

procedure TfrmBaseChild._UnmergeBar(AMainBar, AChildBar: TdxBar);
begin

  if ( (NOT Assigned(AMainBar)) OR (NOT Assigned(AChildBar)) ) then
    exit;

  AMainBar.Unmerge( AChildBar );

end;

end.
