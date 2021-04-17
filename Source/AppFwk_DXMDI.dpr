program AppFwk_DXMDI;

uses
  {$IFDEF EurekaLog}
  EMemLeaks,
  EResLeaks,
  EDebugExports,
  EDebugJCL,
  EFixSafeCallException,
  EMapWin32,
  EAppVCL,
  EDialogWinAPIMSClassic,
  EDialogWinAPIEurekaLogDetailed,
  EDialogWinAPIStepsToReproduce,
  ExceptionLog7,
  {$ENDIF EurekaLog}
  Vcl.Forms,
  AT.Defines.VCL in 'D:\Components\RS27\AngelicTech\Source\Common\AT.Defines.VCL.pas',
  ATApp.Types in 'Code Units\ATApp.Types.pas',
  ATApp.Attributes in 'Code Units\ATApp.Attributes.pas',
  AT.Automate in 'D:\Components\RS27\AngelicTech\Source\Common\AT.Automate.pas',
  AT.Rtti.Automate in 'D:\Components\RS27\AngelicTech\Source\Common\AT.Rtti.Automate.pas',
  AT.Vcl.Automate in 'D:\Components\RS27\AngelicTech\Source\VCL\AT.Vcl.Automate.pas',
  ATApp.Vcl.Forms.Main in 'Forms\ATApp.Vcl.Forms.Main.pas' {frmMain},
  ATApp.Vcl.Forms.Child.Base in 'Forms\ATApp.Vcl.Forms.Child.Base.pas' {frmBaseChild},
  ATApp.Attributes.Vcl.Utils in 'Code Units\ATApp.Attributes.Vcl.Utils.pas',
  ATApp.Config.Section.Consts in 'Code Units\ATApp.Config.Section.Consts.pas',
  ATApp.Config.Consts in 'Code Units\ATApp.Config.Consts.pas',
  ATApp.Config.Keys.Consts in 'Code Units\ATApp.Config.Keys.Consts.pas',
  ATApp.Config.Defaults.Consts in 'Code Units\ATApp.Config.Defaults.Consts.pas',
  ATApp.Config in 'Code Units\ATApp.Config.pas',
  ATApp.Consts in 'Code Units\ATApp.Consts.pas',
  ATApp.UI.Types in 'Code Units\ATApp.UI.Types.pas',
  ATApp.ResourceStrings in 'Code Units\ATApp.ResourceStrings.pas',
  ATApp.Vcl.DM.Themeing in 'Data Modules\ATApp.Vcl.DM.Themeing.pas' {dmThemeing: TDataModule},
  ATApp.Vcl.DM.Splash in 'Data Modules\ATApp.Vcl.DM.Splash.pas' {dmSplash: TDataModule},
  ATApp.Vcl.DM.AppActions in 'Data Modules\ATApp.Vcl.DM.AppActions.pas' {dmAppActions: TDataModule},
  ATApp.Vcl.DM.Images in 'Data Modules\ATApp.Vcl.DM.Images.pas' {dmImages: TDataModule},
  AT.DEB.Events.StdDialogs in 'D:\Components\RS27\AngelicTech\Source\DEB\AT.DEB.Events.StdDialogs.pas',
  ATApp.Vcl.DM.StdDialogs in 'Data Modules\ATApp.Vcl.DM.StdDialogs.pas' {dmStdDialogs: TDataModule},
  AT.Vcl.DX.Dialog.Task in 'D:\Components\RS27\AngelicTech\Source\VCL\AT.Vcl.DX.Dialog.Task.pas' {frmATDXTaskDialog},
  ATApp.DEB.UISkin in 'Code Units\ATApp.DEB.UISkin.pas',
  ATApp.DEB.IconSets in 'Code Units\ATApp.DEB.IconSets.pas',
  ATApp.DEB.MainForm in 'Code Units\ATApp.DEB.MainForm.pas',
  AT.Props.Consts in 'D:\Components\RS27\AngelicTech\Source\Common\AT.Props.Consts.pas',
  ATApp.DEB.UI in 'Code Units\ATApp.DEB.UI.pas',
  ATApp.ImgIndex.Consts in 'Code Units\ATApp.ImgIndex.Consts.pas',
  ATApp.RibbonUtils in 'Code Units\ATApp.RibbonUtils.pas',
  ATApp.ActionUtils in 'Code Units\ATApp.ActionUtils.pas',
  ATApp.StatusBar.Consts in 'Code Units\ATApp.StatusBar.Consts.pas',
  dxRibbonSkins2019 in 'DX Overrides\dxRibbonSkins2019.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmThemeing, dmThemeing);
  Application.CreateForm(TdmSplash, dmSplash);
  Application.CreateForm(TdmStdDialogs, dmStdDialogs);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TdmAppActions, dmAppActions);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmBaseChild, frmBaseChild);
  Application.Run;
end.

