unit ATApp.DEB.UISkin;

interface

uses
  System.Classes;

type
  TEvtUIColorMode = ( uicmDark, uicmLight );

  TEvtQueryUISkinProc = reference to procedure( const ASkinName
    : string; const ASkinPalette: string; const ARibbonSkin: string;
    AColorMode: TEvtUIColorMode );

  IEvtChangeUIPalette = interface
    ['{2A4581E1-BC5B-4A1C-8A72-C78500E782E8}']
    function GetSkinPalette: string;
    procedure SetSkinPalette( const Value: string );
    property SkinPalette: string
      read   GetSkinPalette
      write  SetSkinPalette;
  end;

  IEvtChangeUISkin = interface
    [ '{23386D42-1CD4-4270-A65B-21DD8E2311D3}' ]
    function GetSkinName: string;
    procedure SetSkinName( const Value: string );
    property SkinName: string
      read   GetSkinName
      write  SetSkinName;
  end;

  IEvtColorModeChanged = interface
    [ '{C5AE3771-8F3A-4638-B6F1-DA868FF75ECA}' ]
    function GetColorMode: TEvtUIColorMode;
    procedure SetColorMode( const Value: TEvtUIColorMode );
    property ColorMode: TEvtUIColorMode
      read   GetColorMode
      write  SetColorMode;
  end;

  IEvtPopulatePaletteList = interface
  ['{29CFC6CE-D105-47B6-88D5-C2591E3C4396}']
    function GetPaletteList: TStrings;
    procedure SetPaletteList(const Value: TStrings);
    property PaletteList: TStrings read GetPaletteList write SetPaletteList;
  end;

  IEvtQueryUISkin = interface
    [ '{389B9A7A-C39C-4E06-A1DE-BEA91DE59984}' ]
    function GetCallback: TEvtQueryUISkinProc;
    procedure SetCallback( const Value: TEvtQueryUISkinProc );
    property Callback: TEvtQueryUISkinProc
      read   GetCallback
      write  SetCallback;
  end;

  IEvtUISkinChanged = interface
    [ '{61CDBCFB-DC51-4770-A281-5061586DB4A3}' ]
    function GetRibbonSkin: string;
    function GetSkinName: string;
    function GetSkinPalette: string;
    procedure SetRibbonSkin( const Value: string );
    procedure SetSkinName( const Value: string );
    procedure SetSkinPalette( const Value: string );
    property RibbonSkin: string
      read   GetRibbonSkin
      write  SetRibbonSkin;
    property SkinName: string
      read   GetSkinName
      write  SetSkinName;
    property SkinPalette: string
      read   GetSkinPalette
      write  SetSkinPalette;
  end;

  TUISkinEventPost = class( TObject )
  public
    class procedure ChangeUIPalette(const ASkinPalette: string);
    class procedure ChangeUISkin(const ASkinName: string);
    class procedure ColorModeChanged( AColorMode: TEvtUIColorMode );
    class function CreateChangeUIPaletteEvent(const ASkinPalette: string):
        IEvtChangeUIPalette;
    class function CreateChangeUISkinEvent(const ASkinName: string):
        IEvtChangeUISkin;
    class function CreateColorModeChangedEvent( AColorMode
      : TEvtUIColorMode ): IEvtColorModeChanged;
    class function CreatePopulatePaletteListEvent(APaletteList: TStrings):
        IEvtPopulatePaletteList;
    class function CreateQueryUISkinEvent( ACallback
      : TEvtQueryUISkinProc ): IEvtQueryUISkin;
    class function CreateUISkinChangedEvent( const ASkinName,
      ASkinPalette, ARibbonSkin: string ): IEvtUISkinChanged;
    class procedure PopulatePaletteList(APaletteList: TStrings);
    class function QueryColorMode: TEvtUIColorMode;
    class function QueryRibbonSkin: string;
    class function QuerySkinName: string;
    class function QuerySkinPalette: string;
    class procedure QueryUISkin( out ASkinName, ASkinPalette,
      ARibbonSkin: string; out AColorMode: TEvtUIColorMode );
    class procedure UISkinChanged( const ASkinName, ASkinPalette,
      ARibbonSkin: string );
  end;

implementation

uses
  EventBus;

type
  TEvtChangeUIPalette = class( TInterfacedObject,
                            IEvtChangeUIPalette )
  strict private
    FSkinPalette: string;
  strict protected
    function GetSkinPalette: string;
    procedure SetSkinPalette( const Value: string );
  public
    property SkinPalette: string
      read   GetSkinPalette
      write  SetSkinPalette;
  end;

  TEvtChangeUISkin = class( TInterfacedObject,
                            IEvtChangeUISkin )
  strict private
    FSkinName: string;
  strict protected
    function GetSkinName: string;
    procedure SetSkinName( const Value: string );
  public
    property SkinName: string
      read   GetSkinName
      write  SetSkinName;
  end;

  TEvtColorModeChanged = class( TInterfacedObject,
                                IEvtColorModeChanged )
  strict private
    FColorMode: TEvtUIColorMode;
  strict protected
    function GetColorMode: TEvtUIColorMode;
    procedure SetColorMode( const Value: TEvtUIColorMode );
  public
    property ColorMode: TEvtUIColorMode
      read   GetColorMode
      write  SetColorMode;
  end;

  TEvtPopulatePaletteList = class(TInterfacedObject, IEvtPopulatePaletteList)
  strict private
    FPaletteList: TStrings;
  strict protected
    function GetPaletteList: TStrings;
    procedure SetPaletteList(const Value: TStrings);
  public
    property PaletteList: TStrings read GetPaletteList write SetPaletteList;
  end;

  TEvtQueryUISkin = class( TInterfacedObject,
                           IEvtQueryUISkin )
  strict private
    FCallback: TEvtQueryUISkinProc;
  strict protected
    function GetCallback: TEvtQueryUISkinProc;
    procedure SetCallback( const Value: TEvtQueryUISkinProc );
  public
    property Callback: TEvtQueryUISkinProc
      read   GetCallback
      write  SetCallback;
  end;

  TEvtUISkinChanged = class( TInterfacedObject,
                             IEvtUISkinChanged )
  strict private
    FRibbonSkin: string;
    FSkinName: string;
    FSkinPalette: string;
  strict protected
    function GetRibbonSkin: string;
    function GetSkinName: string;
    function GetSkinPalette: string;
    procedure SetRibbonSkin( const Value: string );
    procedure SetSkinName( const Value: string );
    procedure SetSkinPalette( const Value: string );
  public
    property RibbonSkin: string
      read   GetRibbonSkin
      write  SetRibbonSkin;
    property SkinName: string
      read   GetSkinName
      write  SetSkinName;
    property SkinPalette: string
      read   GetSkinPalette
      write  SetSkinPalette;
  end;

function TEvtChangeUIPalette.GetSkinPalette: string;
begin
  Result := FSkinPalette;
end;

procedure TEvtChangeUIPalette.SetSkinPalette( const Value: string );
begin
  FSkinPalette := Value;
end;

function TEvtChangeUISkin.GetSkinName: string;
begin
  Result := FSkinName;
end;

procedure TEvtChangeUISkin.SetSkinName( const Value: string );
begin
  FSkinName := Value;
end;

function TEvtColorModeChanged.GetColorMode: TEvtUIColorMode;
begin
  Result := FColorMode;
end;

procedure TEvtColorModeChanged.SetColorMode( const Value
  : TEvtUIColorMode );
begin
  FColorMode := Value;
end;

function TEvtPopulatePaletteList.GetPaletteList: TStrings;
begin

  Result := FPaletteList;

end;

procedure TEvtPopulatePaletteList.SetPaletteList(const Value: TStrings);
begin

  FPaletteList := Value;

end;

function TEvtQueryUISkin.GetCallback: TEvtQueryUISkinProc;
begin
  Result := FCallback;
end;

procedure TEvtQueryUISkin.SetCallback( const Value
  : TEvtQueryUISkinProc );
begin
  FCallback := Value;
end;

function TEvtUISkinChanged.GetRibbonSkin: string;
begin
  Result := FRibbonSkin;
end;

function TEvtUISkinChanged.GetSkinName: string;
begin
  Result := FSkinName;
end;

function TEvtUISkinChanged.GetSkinPalette: string;
begin
  Result := FSkinPalette;
end;

procedure TEvtUISkinChanged.SetRibbonSkin( const Value: string );
begin
  FRibbonSkin := Value;
end;

procedure TEvtUISkinChanged.SetSkinName( const Value: string );
begin
  FSkinName := Value;
end;

procedure TEvtUISkinChanged.SetSkinPalette( const Value: string );
begin
  FSkinPalette := Value;
end;

class procedure TUISkinEventPost.ChangeUIPalette(const ASkinPalette: string);
begin

  var
  AEvent := CreateChangeUIPaletteEvent( ASkinPalette );

  GlobalEventBus.Post( AEvent );

end;

class procedure TUISkinEventPost.ChangeUISkin(const ASkinName: string);
begin

  var
  AEvent := CreateChangeUISkinEvent( ASkinName );

  GlobalEventBus.Post( AEvent );

end;

class procedure TUISkinEventPost.ColorModeChanged
  ( AColorMode: TEvtUIColorMode );
begin

  var
  AEvent := CreateColorModeChangedEvent( AColorMode );

  GlobalEventBus.Post( AEvent );

end;

class function TUISkinEventPost.CreateChangeUIPaletteEvent(const ASkinPalette:
    string): IEvtChangeUIPalette;
begin

  Result := TEvtChangeUIPalette.Create;

  Result.SkinPalette := ASkinPalette;

end;

class function TUISkinEventPost.CreateChangeUISkinEvent(const ASkinName:
    string): IEvtChangeUISkin;
begin

  Result := TEvtChangeUISkin.Create;

  Result.SkinName := ASkinName;

end;

class function TUISkinEventPost.CreateColorModeChangedEvent
  ( AColorMode: TEvtUIColorMode ): IEvtColorModeChanged;
begin

  Result := TEvtColorModeChanged.Create;

  Result.ColorMode := AColorMode;

end;

class function TUISkinEventPost.CreatePopulatePaletteListEvent(APaletteList:
    TStrings): IEvtPopulatePaletteList;
begin

  Result := TEvtPopulatePaletteList.Create;

  Result.PaletteList := APaletteList;

end;

class function TUISkinEventPost.CreateQueryUISkinEvent
  ( ACallback: TEvtQueryUISkinProc ): IEvtQueryUISkin;
begin

  Result := TEvtQueryUISkin.Create;

  Result.Callback := ACallback;

end;

class function TUISkinEventPost.CreateUISkinChangedEvent
  ( const ASkinName, ASkinPalette, ARibbonSkin: string )
  : IEvtUISkinChanged;
begin
  Result := TEvtUISkinChanged.Create;

  Result.RibbonSkin := ARibbonSkin;
  Result.SkinName := ASkinName;
  Result.SkinPalette := ASkinPalette;

end;

class procedure TUISkinEventPost.PopulatePaletteList(APaletteList: TStrings);
begin

  var AEvent := CreatePopulatePaletteListEvent(APaletteList);

  GlobalEventBus.Post( AEvent );

end;

class function TUISkinEventPost.QueryColorMode: TEvtUIColorMode;
begin

  var
    AResult: TEvtUIColorMode;

  var
ACallback:
  TEvtQueryUISkinProc :=
      procedure( const ASkinName: string; const ASkinPalette: string;
      const ARibbonSkin: string; AColorMode: TEvtUIColorMode )
    begin

      AResult := AColorMode;

    end;

  var
  AEvent := CreateQueryUISkinEvent( ACallback );

  GlobalEventBus.Post( AEvent );

  Result := AResult;

end;

class function TUISkinEventPost.QueryRibbonSkin: string;
begin

  var
    AResult: string;

  var
ACallback:
  TEvtQueryUISkinProc :=
      procedure( const ASkinName: string; const ASkinPalette: string;
      const ARibbonSkin: string; AColorMode: TEvtUIColorMode )
    begin

      AResult := ARibbonSkin;

    end;

  var
  AEvent := CreateQueryUISkinEvent( ACallback );

  GlobalEventBus.Post( AEvent );

  Result := AResult;

end;

class function TUISkinEventPost.QuerySkinName: string;
begin

  var
    AResult: string;

  var
ACallback:
  TEvtQueryUISkinProc :=
      procedure( const ASkinName: string; const ASkinPalette: string;
      const ARibbonSkin: string; AColorMode: TEvtUIColorMode )
    begin

      AResult := ASkinName;

    end;

  var
  AEvent := CreateQueryUISkinEvent( ACallback );

  GlobalEventBus.Post( AEvent );

  Result := AResult;

end;

class function TUISkinEventPost.QuerySkinPalette: string;
begin

  var
    AResult: string;

  var
ACallback:
  TEvtQueryUISkinProc :=
      procedure( const ASkinName: string; const ASkinPalette: string;
      const ARibbonSkin: string; AColorMode: TEvtUIColorMode )
    begin

      AResult := ASkinPalette;

    end;

  var
  AEvent := CreateQueryUISkinEvent( ACallback );

  GlobalEventBus.Post( AEvent );

  Result := AResult;

end;

class procedure TUISkinEventPost.QueryUISkin( out ASkinName,
  ASkinPalette, ARibbonSkin: string;
  out AColorMode: TEvtUIColorMode );
begin

  var
    AColorModeRes: TEvtUIColorMode;
  var
    ARibbonSkinRes: string;
  var
    ASkinNameRes: string;
  var
    ASkinPaletteRes: string;

  var
ACallback:
  TEvtQueryUISkinProc :=
      procedure( const ASkinName: string; const ASkinPalette: string;
      const ARibbonSkin: string; AColorMode: TEvtUIColorMode )
    begin

      AColorModeRes := AColorMode;
      ARibbonSkinRes := ARibbonSkin;
      ASkinNameRes := ASkinName;
      ASkinPaletteRes := ASkinPalette;

    end;

  var
  AEvent := CreateQueryUISkinEvent( ACallback );

  GlobalEventBus.Post( AEvent );

  AColorMode := AColorModeRes;
  ARibbonSkin := ARibbonSkinRes;
  ASkinName := ASkinNameRes;
  ASkinPalette := ASkinPaletteRes;

end;

class procedure TUISkinEventPost.UISkinChanged( const ASkinName,
  ASkinPalette, ARibbonSkin: string );
begin

  var
  AEvent := CreateUISkinChangedEvent( ASkinName, ASkinPalette,
    ARibbonSkin );

  GlobalEventBus.Post( AEvent );

end;

end.
