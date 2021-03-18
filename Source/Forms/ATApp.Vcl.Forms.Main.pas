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
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
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
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, cxBarEditItem, cxTextEdit, cxContainer, cxEdit, cxLabel,
  ATApp.Attributes, ATApp.Types, cxPC, dxBarBuiltInMenu, dxTabbedMDI;

type
  /// <summary>
  ///   Defines the application's main form class.
  /// </summary>
  [TATFormType(fteMainForm)]
  TfrmMain = class(TdxRibbonForm)
    barmgrMain: TdxBarManager;
    barQAT: TdxBar;
    barTAT: TdxBar;
    bsvMain: TdxRibbonBackstageView;
    dxSkinController1: TdxSkinController;
    ribMain: TdxRibbon;
    ribtabHome: TdxRibbonTab;
    sbMain: TdxRibbonStatusBar;
    mdimgrMain: TdxTabbedMDIManager;
    barTAST: TdxBar;
    barPageInfo: TdxBar;
    barKeyState: TdxBar;
    barZoomLevel: TdxBar;
    procedure FormCreate(Sender: TObject);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

end.
