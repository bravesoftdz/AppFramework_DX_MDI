unit ATApp.DEB.MainForm;

interface

uses
  dxBar;

type
  TEvtMainFormBar = (mfbKeyState, mfbPageInfo, mfbZoomLevel);

  TEvtMainFormQueryBarMgrProc = reference to procedure(
      ABarMgr: TdxBarManager);

  TEvtMainFormQueryBarProc = reference to procedure(
      ABar: TdxBar);

  IEvtMainFormClose = interface
  ['{C62913D5-BF41-49F2-B110-127AB5FF4304}']
  end;

  IEvtMainFormQueryBar = interface
  ['{BF1FB5E4-F176-467B-A094-5ABD55A3AC6F}']
    function GetCallback: TEvtMainFormQueryBarProc;
    function GetMainFormBar: TEvtMainFormBar;
    procedure SetCallback(const Value: TEvtMainFormQueryBarProc);
    procedure SetMainFormBar(const Value: TEvtMainFormBar);
    property Callback: TEvtMainFormQueryBarProc read GetCallback write SetCallback;
    property MainFormBar: TEvtMainFormBar read GetMainFormBar write SetMainFormBar;
  end;

  IEvtMainFormQueryBarManager = interface
  ['{9B28D35C-DBBE-4F10-AA59-B0E9027A5928}']
    function GetCallback: TEvtMainFormQueryBarMgrProc;
    procedure SetCallback(const Value: TEvtMainFormQueryBarMgrProc);
    property Callback: TEvtMainFormQueryBarMgrProc read GetCallback write SetCallback;
  end;

  TMainFormEventPost = class( TObject )
  strict private
    class function _QueryMainFormBar(AMainFormBar: TEvtMainFormBar): TdxBar;
  public
    class procedure CloseMainForm;
    class function CreateMainFormCloseEvent: IEvtMainFormClose;
    class function CreateMainFormQueryBarEvent(AMainFormBar: TEvtMainFormBar;
        ACallback: TEvtMainFormQueryBarProc): IEvtMainFormQueryBar;
    class function CreateMainFormQueryBarMgrEvent(
        ACallback: TEvtMainFormQueryBarMgrProc): IEvtMainFormQueryBarManager;
    class function QueryMainFormBarKeyState: TdxBar;
    class function QueryMainFormBarManager: TdxBarManager;
    class function QueryMainFormBarPageInfo: TdxBar;
    class function QueryMainFormBarZoomLevel: TdxBar;
  end;

implementation

uses
  EventBus;


type
  TEvtMainFormClose = class(TInterfacedObject, IEvtMainFormClose)
  end;

  TEvtMainFormQueryBar = class( TInterfacedObject, IEvtMainFormQueryBar)
  strict private
    FCallback: TEvtMainFormQueryBarProc;
    FMainFormBar: TEvtMainFormBar;
  strict protected
    function GetCallback: TEvtMainFormQueryBarProc;
    function GetMainFormBar: TEvtMainFormBar;
    procedure SetCallback(const Value: TEvtMainFormQueryBarProc);
    procedure SetMainFormBar(const Value: TEvtMainFormBar);
  public
    property Callback: TEvtMainFormQueryBarProc read GetCallback write SetCallback;
    property MainFormBar: TEvtMainFormBar read GetMainFormBar write SetMainFormBar;
  end;

  TEvtMainFormQueryBarMgr = class( TInterfacedObject, IEvtMainFormQueryBarManager)
  strict private
    FCallback: TEvtMainFormQueryBarMgrProc;
  strict protected
    function GetCallback: TEvtMainFormQueryBarMgrProc;
    procedure SetCallback(const Value: TEvtMainFormQueryBarMgrProc);
  public
    property Callback: TEvtMainFormQueryBarMgrProc read GetCallback write SetCallback;
  end;


class procedure TMainFormEventPost.CloseMainForm;
begin

  var AEvent := CreateMainFormCloseEvent;

  GlobalEventBus.Post( AEvent );

end;

class function TMainFormEventPost.CreateMainFormCloseEvent: IEvtMainFormClose;
begin

  Result := TEvtMainFormClose.Create;

end;

class function TMainFormEventPost.CreateMainFormQueryBarEvent(AMainFormBar:
    TEvtMainFormBar; ACallback: TEvtMainFormQueryBarProc): IEvtMainFormQueryBar;
begin

  Result := TEvtMainFormQueryBar.Create;

  Result.Callback := ACallback;
  Result.MainFormBar := AMainFormBar;

end;

class function TMainFormEventPost.CreateMainFormQueryBarMgrEvent(
  ACallback: TEvtMainFormQueryBarMgrProc): IEvtMainFormQueryBarManager;
begin

  Result := TEvtMainFormQueryBarMgr.Create;

  Result.Callback := ACallback;

end;

class function TMainFormEventPost.QueryMainFormBarKeyState: TdxBar;
begin

  Result := _QueryMainFormBar( mfbKeyState );

end;

class function TMainFormEventPost.QueryMainFormBarManager: TdxBarManager;
begin
  var AMFBarMgr: TdxBarManager := NIL;

  var ACallback: TEvtMainFormQueryBarMgrProc := procedure(
      ABarMgr: TdxBarManager)
    begin

      AMFBarMgr := ABarMgr;

    end;

  var AEvent := CreateMainFormQueryBarMgrEvent(ACallback);

  GlobalEventBus.Post( AEvent );

  Result := AMFBarMgr;
end;

class function TMainFormEventPost.QueryMainFormBarPageInfo: TdxBar;
begin

  Result := _QueryMainFormBar( mfbPageInfo );

end;

class function TMainFormEventPost.QueryMainFormBarZoomLevel: TdxBar;
begin

  Result := _QueryMainFormBar( mfbZoomLevel );

end;

class function TMainFormEventPost._QueryMainFormBar(
  AMainFormBar: TEvtMainFormBar): TdxBar;
begin

  var AMFBar: TdxBar := NIL;

  var ACallback: TEvtMainFormQueryBarProc := procedure(
      ABar: TdxBar)
    begin

      AMFBar := ABar;

    end;

  var AEvent := CreateMainFormQueryBarEvent(AMainFormBar, ACallback);

  GlobalEventBus.Post( AEvent );

  Result := AMFBar;

end;

function TEvtMainFormQueryBar.GetCallback: TEvtMainFormQueryBarProc;
begin
  Result := FCallback;
end;

function TEvtMainFormQueryBar.GetMainFormBar: TEvtMainFormBar;
begin
  Result := FMainFormBar;
end;

procedure TEvtMainFormQueryBar.SetCallback(const Value:
    TEvtMainFormQueryBarProc);
begin
  FCallback := Value;
end;

procedure TEvtMainFormQueryBar.SetMainFormBar(const Value: TEvtMainFormBar);
begin
  FMainFormBar := Value;
end;

{ TEvtMainFormQueryBarMgr }

function TEvtMainFormQueryBarMgr.GetCallback: TEvtMainFormQueryBarMgrProc;
begin
  Result := FCallback;
end;

procedure TEvtMainFormQueryBarMgr.SetCallback(
  const Value: TEvtMainFormQueryBarMgrProc);
begin
  FCallback := Value;
end;

end.
