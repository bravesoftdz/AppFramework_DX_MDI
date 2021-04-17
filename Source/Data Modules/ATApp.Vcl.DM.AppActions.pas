unit ATApp.Vcl.DM.AppActions;

interface

uses
  System.SysUtils, System.Classes, EventBus, ATApp.DEB.IconSets,
  System.Actions, Vcl.ActnList, ATApp.DEB.UI;

type
  TdmAppActions = class(TDataModule)
    alstApp: TActionList;
    actTouchMode: TAction;
    actAppExit: TAction;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure ExecuteAppExitAction(Sender: TObject);
    procedure ExecuteTouchModeAction(Sender: TObject);
    procedure UpdateTouchModeAction(Sender: TObject);
  strict private
    FTouchMode: Boolean;
    procedure InitAction(AAction: TAction; const ACaption, AHint: string);
    procedure InitActions;
    procedure UpdateIconSets;
    procedure UpdateMainIconSet;
  public
    [Subscribe(TThreadMode.Main)]
    procedure OnIconSetsChanged(AEvent: IEvtIconSetsChanged);
    [Subscribe(TThreadMode.Main)]
    procedure OnTouchModeChanged(AEvent: IEvtUITouchModeChanged);
  end;

var
  dmAppActions: TdmAppActions;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.Rtti,
  Vcl.ImgList,
  AT.Rtti,
  ATApp.DEB.MainForm, ATApp.Vcl.DM.Images, AT.Props.Consts,
  ATApp.Consts;

{$R *.dfm}

procedure TdmAppActions.DataModuleDestroy(Sender: TObject);
begin

  GlobalEventBus.UnregisterForEvents( Self );

end;

procedure TdmAppActions.DataModuleCreate(Sender: TObject);
begin

  GlobalEventBus.RegisterSubscriberForEvents( Self );

  FTouchMode := TUIEventPost.QueryTouchMode;

  UpdateIconSets;

  InitActions;

end;

procedure TdmAppActions.ExecuteAppExitAction(Sender: TObject);
begin

  TMainFormEventPost.CloseMainForm;

end;

procedure TdmAppActions.ExecuteTouchModeAction(Sender: TObject);
begin

  TUIEventPost.ChangeTouchMode(NOT FTouchMode);

end;

procedure TdmAppActions.InitAction(AAction: TAction; const ACaption, AHint:
    string);
begin

  SetPropertyValue(AAction, cPropCaption, aCaption);
  SetPropertyValue(AAction, cPropHint, aCaption);

end;

procedure TdmAppActions.InitActions;
begin

  var aAppName := cAppShortTitle;
  var aCaption := Format('Exit %s', [aAppName]);
  var aHint := ACaption;

  InitAction(actAppExit, aCaption, aHint);

end;

procedure TdmAppActions.OnIconSetsChanged(
  AEvent: IEvtIconSetsChanged);
begin

  UpdateIconSets;

end;

procedure TdmAppActions.OnTouchModeChanged(
  AEvent: IEvtUITouchModeChanged);
begin

  FTouchMode := AEvent.TouchModeEnabled;

end;

procedure TdmAppActions.UpdateIconSets;
begin

  UpdateMainIconSet;

end;

procedure TdmAppActions.UpdateMainIconSet;
begin

  var ASmall: TCustomImageList := NIL;
  var ALarge: TCustomImageList := NIL;

  TIconSetsEventPost.QueryMainIconSet(ASmall, ALarge);

  if (Assigned(ASmall)) then
    begin
      alstApp.Images := ASmall;
    end;

end;

procedure TdmAppActions.UpdateTouchModeAction(Sender: TObject);
begin

  AT.Rtti.SetPropertyValue(Sender, cPropChecked, FTouchMode);

end;

end.
