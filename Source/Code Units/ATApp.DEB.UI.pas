unit ATApp.DEB.UI;

interface

type
  TEvtUIQueryTouchModeProc = reference to procedure (ATouch: Boolean);

  IEvtUIChangeTouchMode = interface
  ['{A091BDEE-738F-4407-9185-BB62018B5A23}']
    function GetEnableTouchMode: Boolean;
    procedure SetEnableTouchMode(const Value: Boolean);
    property EnableTouchMode: Boolean read GetEnableTouchMode write
        SetEnableTouchMode;
  end;

  IEvtUIQueryTouchMode = interface
  ['{9DD38C76-09C5-4C5F-8A39-181BFD774DF8}']
    function GetCallback: TEvtUIQueryTouchModeProc;
    procedure SetCallback(const Value: TEvtUIQueryTouchModeProc);
    property Callback: TEvtUIQueryTouchModeProc read GetCallback write SetCallback;
  end;

  IEvtUITouchModeChanged = interface
  ['{4CCFC051-375F-4037-9BA0-1FDF1EAD0866}']
    function GetTouchModeEnabled: Boolean;
    procedure SetTouchModeEnabled(const Value: Boolean);
    property TouchModeEnabled: Boolean read GetTouchModeEnabled write
        SetTouchModeEnabled;
  end;

  TUIEventPost = class( TObject )
  public
    class procedure ChangeTouchMode(AEnableTouchMode: Boolean);
    class function CreateChangeTouchModeEvent(AEnableTouchMode: Boolean):
        IEvtUIChangeTouchMode;
    class function CreateQueryTouchModeEvent(ACallback: TEvtUIQueryTouchModeProc):
        IEvtUIQueryTouchMode;
    class function CreateTouchModeChangedEvent(ATouchModeEnabled: Boolean):
        IEvtUITouchModeChanged;
    class function QueryTouchMode: Boolean;
    class procedure TouchModeChanged(ATouchModeEnabled: Boolean);
  end;

implementation

uses
  EventBus;

type
  TEvtUIChangeTouchMode = class(TInterfacedObject, IEvtUIChangeTouchMode)
  strict private
    FEnableTouchMode: Boolean;
  strict protected
    function GetEnableTouchMode: Boolean;
    procedure SetEnableTouchMode(const Value: Boolean);
  public
    property EnableTouchMode: Boolean read GetEnableTouchMode write
        SetEnableTouchMode;
  end;

  TEvtUIQueryTouchMode = class( TInterfacedObject, IEvtUIQueryTouchMode )
  strict private
    FCallback: TEvtUIQueryTouchModeProc;
  strict protected
    function GetCallback: TEvtUIQueryTouchModeProc;
    procedure SetCallback(const Value: TEvtUIQueryTouchModeProc);
  public
    property Callback: TEvtUIQueryTouchModeProc read GetCallback write SetCallback;
  end;

  TEvtUITouchModeChanged = class( TInterfacedObject, IEvtUITouchModeChanged )
  strict private
    FTouchModeEnabled: Boolean;
  strict protected
    function GetTouchModeEnabled: Boolean;
    procedure SetTouchModeEnabled(const Value: Boolean);
  public
    property TouchModeEnabled: Boolean read GetTouchModeEnabled write
        SetTouchModeEnabled;
  end;


class procedure TUIEventPost.ChangeTouchMode(AEnableTouchMode: Boolean);
begin

  var AEvent := CreateChangeTouchModeEvent(AEnableTouchMode);

  GlobalEventBus.Post( AEvent );

end;

class function TUIEventPost.CreateChangeTouchModeEvent(AEnableTouchMode:
    Boolean): IEvtUIChangeTouchMode;
begin

  Result := TEvtUIChangeTouchMode.Create;

  Result.EnableTouchMode := AEnableTouchMode;

end;

class function TUIEventPost.CreateQueryTouchModeEvent(ACallback:
    TEvtUIQueryTouchModeProc): IEvtUIQueryTouchMode;
begin

  Result := TEvtUIQueryTouchMode.Create;

  Result.Callback := ACallback;

end;

class function TUIEventPost.CreateTouchModeChangedEvent(ATouchModeEnabled:
    Boolean): IEvtUITouchModeChanged;
begin

  Result := TEvtUITouchModeChanged.Create;

  Result.TouchModeEnabled := ATouchModeEnabled;

end;

class function TUIEventPost.QueryTouchMode: Boolean;
begin

  var AResult := False;

  var ACallback: TEvtUIQueryTouchModeProc := procedure(
      ATouch: Boolean)
    begin

      AResult := ATouch;

    end;

  var AEvent := CreateQueryTouchModeEvent(ACallback );

  GlobalEventBus.Post( AEvent );

  Result := AResult;

end;

class procedure TUIEventPost.TouchModeChanged(ATouchModeEnabled: Boolean);
begin

  var AEvent := CreateTouchModeChangedEvent(ATouchModeEnabled);

  GlobalEventBus.Post( AEvent );

end;

function TEvtUIChangeTouchMode.GetEnableTouchMode: Boolean;
begin
  Result := FEnableTouchMode;
end;

procedure TEvtUIChangeTouchMode.SetEnableTouchMode(const Value: Boolean);
begin
  FEnableTouchMode := Value;
end;


function TEvtUIQueryTouchMode.GetCallback: TEvtUIQueryTouchModeProc;
begin
  Result := FCallback;
end;

procedure TEvtUIQueryTouchMode.SetCallback(const Value:
    TEvtUIQueryTouchModeProc);
begin
  FCallback := Value;
end;

function TEvtUITouchModeChanged.GetTouchModeEnabled: Boolean;
begin
  Result := FTouchModeEnabled;
end;

procedure TEvtUITouchModeChanged.SetTouchModeEnabled(const Value: Boolean);
begin
  FTouchModeEnabled := Value;
end;

end.
