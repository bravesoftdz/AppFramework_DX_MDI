unit ATApp.Vcl.DM.Themeing;

interface

uses
  System.SysUtils, System.Classes, dxSkinsCore, dxSkinBasic,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
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
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringtime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxClasses, cxLookAndFeels, dxSkinsForm,
  dxSkinBlack, dxSkinBlue, dxSkinSilver, Data.DB, cxStyles,
  dxLayoutLookAndFeels, MemDS, VirtualTable, EventBus,
  ATApp.DEB.UISkin, ATApp.DEB.UI, dxCore;

type
  TdmThemeing = class(TDataModule)
    cxstylStatusBarText: TcxStyle;
    fldSkinMapColorMode: TStringField;
    fldSkinMapRibbonSkin: TStringField;
    fldSkinMapSkinName: TStringField;
    fldSkinMapSkinPalette: TStringField;
    llfBSVSubCaption: TdxLayoutCxLookAndFeel;
    llflstMain: TdxLayoutLookAndFeelList;
    llfMain: TdxLayoutSkinLookAndFeel;
    sknctlMain: TdxSkinController;
    stylrepoMain: TcxStyleRepository;
    vtblSkinMap: TVirtualTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  strict private
    FColorMode: TEvtUIColorMode;
    FRibbonSkin: string;
    FSkinName: string;
    FSkinPalette: string;
    function _GetColorMode: TEvtUIColorMode;
    function _GetRibbonSkinName: string;
  public
    [Subscribe(TThreadMode.Main)]
    procedure OnChangeTouchMode(AEvent: IEvtUIChangeTouchMode);
    [Subscribe(TThreadMode.Main)]
    procedure OnChangeUIPalette(AEvent: IEvtChangeUIPalette);
    [Subscribe(TThreadMode.Main)]
    procedure OnChangeUISkin(AEvent: IEvtChangeUISkin);
    [Subscribe(TThreadMode.Main)]
    procedure OnPopulatePaletteList(AEvent: IEvtPopulatePaletteList);
    [Subscribe(TThreadMode.Main)]
    procedure OnQueryUISkin(AEvent: IEvtQueryUISkin);
    [Subscribe(TThreadMode.Main)]
    procedure OnQueryUITouchMode(AEvent: IEvtUIQueryTouchMode);
  end;

var
  dmThemeing: TdmThemeing;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.Variants;

{$R *.dfm}

procedure TdmThemeing.DataModuleCreate(Sender: TObject);
begin

  vtblSkinMap.Open;

  FSkinName := sknctlMain.SkinName;
  FSkinPalette := sknctlMain.SkinPaletteName;

  FRibbonSkin := _GetRibbonSkinName;
  FColorMode := _GetColorMode;

  GlobalEventBus.RegisterSubscriberForEvents( Self );

  TUISkinEventPost.UISkinChanged(FSkinName, FSkinPalette, FRibbonSkin);
  TUISkinEventPost.ColorModeChanged(FColorMode);

end;

procedure TdmThemeing.DataModuleDestroy(Sender: TObject);
begin

  GlobalEventBus.UnregisterForEvents( Self );

  vtblSkinMap.Close;

end;

procedure TdmThemeing.OnChangeTouchMode(
  AEvent: IEvtUIChangeTouchMode);
begin

  var AEnable := AEvent.EnableTouchMode;

  sknctlMain.TouchMode := AEnable;

  TUIEventPost.TouchModeChanged( AEnable );

end;

procedure TdmThemeing.OnChangeUIPalette(AEvent: IEvtChangeUIPalette);
begin

  FSkinPalette := AEvent.SkinPalette;

  sknctlMain.SkinPaletteName := FSkinPalette;

  FRibbonSkin := _GetRibbonSkinName;
  FColorMode := _GetColorMode;

  TUISkinEventPost.UISkinChanged(FSkinName, FSkinPalette, FRibbonSkin);
  TUISkinEventPost.ColorModeChanged(FColorMode);

end;

procedure TdmThemeing.OnChangeUISkin(AEvent: IEvtChangeUISkin);
begin

  FSkinName := AEvent.SkinName;

  sknctlMain.SkinName := FSkinName;

  FSkinPalette := sknctlMain.SkinPaletteName;
  FRibbonSkin := _GetRibbonSkinName;
  FColorMode := _GetColorMode;

  TUISkinEventPost.UISkinChanged(FSkinName, FSkinPalette, FRibbonSkin);
  TUISkinEventPost.ColorModeChanged(FColorMode);

end;

procedure TdmThemeing.OnPopulatePaletteList(AEvent: IEvtPopulatePaletteList);
begin

  var AList := AEvent.PaletteList;

  if (NOT Assigned(AList)) then
    exit;

  sknctlMain.PopulateSkinColorPalettes(AList);

end;

procedure TdmThemeing.OnQueryUISkin(AEvent: IEvtQueryUISkin);
begin

  var ACallback := AEvent.Callback;

  if (NOT Assigned(ACallback)) then
    exit;

  var ASkinName := sknctlMain.SkinName;
  var ASkinPalette := sknctlMain.SkinPaletteName;

  var ARibbonSkin := ASkinName;
  var AColorMode := TEvtUIColorMode.uicmLight;

  ACallback(ASkinName, ASkinPalette, ARibbonSkin, AColorMode);

end;

procedure TdmThemeing.OnQueryUITouchMode(AEvent: IEvtUIQueryTouchMode);
begin

  var ACallback := AEvent.Callback;

  if (NOT Assigned(ACallback)) then
    exit;

  var ATouchMode := sknctlMain.TouchMode;

  ACallback(ATouchMode);

end;

function TdmThemeing._GetColorMode: TEvtUIColorMode;
begin

  const ALUFields = 'SkinName;SkinPalette';
  const ALUOpts: TLocateOptions = [TLocateOption.loCaseInsensitive];

  var ALUValues := VarArrayOf([FSkinName, FSkinPalette]);

  var bFound := vtblSkinMap.Locate(ALUFields, ALUValues, ALUOpts);

  var ACMStr: string := 'L';

  if ( bFound ) then
    ACMStr := vtblSkinMap.FieldByName('ColorMode').AsString;

  if (SameText(ACMStr, 'D')) then
    Result := TEvtUIColorMode.uicmDark
  else if (SameText(ACMStr, 'L')) then
    Result := TEvtUIColorMode.uicmLight
  else
    Result := TEvtUIColorMode.uicmLight

end;

function TdmThemeing._GetRibbonSkinName: string;
begin

  const ALUFields = 'SkinName;SkinPalette';
  const ALUOpts: TLocateOptions = [TLocateOption.loCaseInsensitive];

  var ALUValues := VarArrayOf([FSkinName, FSkinPalette]);

  var bFound := vtblSkinMap.Locate(ALUFields, ALUValues, ALUOpts);

  if ( bFound ) then
    Result := vtblSkinMap.FieldByName('RibbonSkin').AsString
  else
    Result := FSkinName;

end;

end.
