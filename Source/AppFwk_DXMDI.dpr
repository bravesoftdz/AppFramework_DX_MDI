program AppFwk_DXMDI;

uses
  Vcl.Forms,
  ATApp.Vcl.Forms.Main in 'Forms\ATApp.Vcl.Forms.Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
