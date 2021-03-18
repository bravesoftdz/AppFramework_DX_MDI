program AppFwk_DXMDI;

uses
  Vcl.Forms,
  ATApp.Vcl.Forms.Main in 'Forms\ATApp.Vcl.Forms.Main.pas' {frmMain},
  ATApp.Types in 'Code Units\ATApp.Types.pas',
  ATApp.Attributes in 'Code Units\ATApp.Attributes.pas',
  ATApp.Vcl.Forms.Child.Base in 'Forms\ATApp.Vcl.Forms.Child.Base.pas' {frmBaseChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmBaseChild, frmBaseChild);
  Application.Run;
end.
