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
  cxClasses,
  ATApp.Attributes, ATApp.Types;

type
  [TATFormType(fteChild)]
  TfrmBaseChild = class(TdxRibbonForm)
    barmgrChild: TdxBarManager;
    barQAT: TdxBar;
    barTAT: TdxBar;
    ribChild: TdxRibbon;
    ribtabHome: TdxRibbonTab;
    barmgrChildBar1: TdxBar;
    cmd1: TdxBarLargeButton;
    barTAST: TdxBar;
    barPageInfo: TdxBar;
    barKeyState: TdxBar;
    barZoomLevel: TdxBar;
    procedure FormCreate(Sender: TObject);
    procedure cmd1Click(Sender: TObject);
  end;

var
  frmBaseChild: TfrmBaseChild;

implementation

{$R *.dfm}

procedure TfrmBaseChild.cmd1Click(Sender: TObject);
begin
  ShowMessage('Child Form Says Hello!');
end;

procedure TfrmBaseChild.FormCreate(Sender: TObject);
begin

  ribChild.Visible := False;

end;

end.
