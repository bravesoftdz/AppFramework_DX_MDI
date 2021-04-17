unit ATApp.DEB.IconSets;

interface

uses
  Vcl.ImgList;

type
  TEvtIconSetFamily = (isfBSV, isfInfoBox, isfMain, isfQATAbove,
      isfQATBelow, isfSB, isfSearchBar, isfSearchBox);

  TEvtIconSetType = (istLight = 1, istDark = 2, istWhite = 3);

  TEvtQueryIconSetProc = reference to procedure(
    ASmallIcons, ALargeIcons: TCustomImageList);

  IEvtIconSetsChanged = interface
  ['{96AB0057-BED5-47D6-89F8-D0BB6F5308BC}']
  end;

  IEvtQueryIconSet = interface
  ['{EFA29EB0-5243-4B1D-8E53-D7714EB1413F}']
    function GetCallback: TEvtQueryIconSetProc;
    function GetFamily: TEvtIconSetFamily;
    procedure SetCallback(const Value: TEvtQueryIconSetProc);
    procedure SetFamily(const Value: TEvtIconSetFamily);
    property Family: TEvtIconSetFamily read GetFamily write SetFamily;
    property Callback: TEvtQueryIconSetProc read GetCallback write SetCallback;
  end;

  TIconSetsEventPost = class( TObject )
  strict private
    class procedure _QueryIconSet(AFamily: TEvtIconSetFamily; out ASmallImgList,
        ALargeImgList: TCustomImageList);
  public
    class function CreateIconSetsChangedEvent: IEvtIconSetsChanged;
    class function CreateQueryIconSetEvent(AFamily: TEvtIconSetFamily; ACallback:
        TEvtQueryIconSetProc): IEvtQueryIconSet;
    class procedure IconSetsChanged;
    class procedure QueryBSVIconSet(out ASmallImgList, ALargeImgList:
        TCustomImageList);
    class procedure QueryInfoBarIconSet(out ASmallImgList, ALargeImgList:
        TCustomImageList);
    class procedure QueryMainIconSet(out ASmallImgList, ALargeImgList:
        TCustomImageList);
    class procedure QueryQATAboveIconSet(out ASmallImgList, ALargeImgList:
        TCustomImageList);
    class procedure QueryQATBelowIconSet(out ASmallImgList, ALargeImgList:
        TCustomImageList);
    class procedure QuerySBIconSet(out ASmallImgList, ALargeImgList:
        TCustomImageList);
    class procedure QuerySearchBarIconSet(out ASmallImgList, ALargeImgList:
        TCustomImageList);
    class procedure QuerySearchBoxIconSet(out ASmallImgList, ALargeImgList:
        TCustomImageList);
  end;


implementation

uses
  EventBus;

type
  TEvtIconSetsChanged = class( TInterfacedObject, IEvtIconSetsChanged)
  end;

  TEvtQueryIconSet = class(TInterfacedObject, IEvtQueryIconSet)
  strict private
    FCallback: TEvtQueryIconSetProc;
    FFamily: TEvtIconSetFamily;
  strict protected
    function GetCallback: TEvtQueryIconSetProc;
    function GetFamily: TEvtIconSetFamily;
    procedure SetCallback(const Value: TEvtQueryIconSetProc);
    procedure SetFamily(const Value: TEvtIconSetFamily);
  public
    property Family: TEvtIconSetFamily read GetFamily write SetFamily;
    property Callback: TEvtQueryIconSetProc read GetCallback write SetCallback;
  end;



function TEvtQueryIconSet.GetCallback: TEvtQueryIconSetProc;
begin
  Result := FCallback;
end;

function TEvtQueryIconSet.GetFamily: TEvtIconSetFamily;
begin
  Result := FFamily;
end;

procedure TEvtQueryIconSet.SetCallback(const Value: TEvtQueryIconSetProc);
begin
  FCallback := Value;
end;

procedure TEvtQueryIconSet.SetFamily(const Value: TEvtIconSetFamily);
begin
  FFamily := Value;
end;

class function TIconSetsEventPost.CreateIconSetsChangedEvent:
    IEvtIconSetsChanged;
begin

  Result := TEvtIconSetsChanged.Create;;

end;

class function TIconSetsEventPost.CreateQueryIconSetEvent(AFamily:
    TEvtIconSetFamily; ACallback: TEvtQueryIconSetProc): IEvtQueryIconSet;
begin

  Result := TEvtQueryIconSet.Create;

  Result.Family := AFamily;
  Result.Callback := ACallback;

end;

class procedure TIconSetsEventPost.IconSetsChanged;
begin

  var AEvent := CreateIconSetsChangedEvent;

  GlobalEventBus.Post( AEvent );

end;

class procedure TIconSetsEventPost.QueryBSVIconSet(out ASmallImgList,
  ALargeImgList: TCustomImageList);
begin

  _QueryIconSet(isfBSV, ASmallImgList, ALargeImgList);

end;

class procedure TIconSetsEventPost.QueryInfoBarIconSet(out ASmallImgList,
    ALargeImgList: TCustomImageList);
begin

  _QueryIconSet(isfInfoBox, ASmallImgList, ALargeImgList);

end;

class procedure TIconSetsEventPost.QueryMainIconSet(out ASmallImgList,
    ALargeImgList: TCustomImageList);
begin

  _QueryIconSet(isfMain, ASmallImgList, ALargeImgList);

end;

class procedure TIconSetsEventPost.QueryQATAboveIconSet(
  out ASmallImgList, ALargeImgList: TCustomImageList);
begin

  _QueryIconSet(isfQATAbove, ASmallImgList, ALargeImgList);

end;

class procedure TIconSetsEventPost.QueryQATBelowIconSet(
  out ASmallImgList, ALargeImgList: TCustomImageList);
begin

  _QueryIconSet(isfQATBelow, ASmallImgList, ALargeImgList);

end;

class procedure TIconSetsEventPost.QuerySBIconSet(out ASmallImgList,
  ALargeImgList: TCustomImageList);
begin

  _QueryIconSet(isfSB, ASmallImgList, ALargeImgList);

end;

class procedure TIconSetsEventPost.QuerySearchBarIconSet(out ASmallImgList,
    ALargeImgList: TCustomImageList);
begin

  _QueryIconSet(isfSearchBar, ASmallImgList, ALargeImgList);

end;

class procedure TIconSetsEventPost.QuerySearchBoxIconSet(
  out ASmallImgList, ALargeImgList: TCustomImageList);
begin

  _QueryIconSet(isfSearchBox, ASmallImgList, ALargeImgList);

end;

class procedure TIconSetsEventPost._QueryIconSet(AFamily: TEvtIconSetFamily;
    out ASmallImgList, ALargeImgList: TCustomImageList);
begin

  var ASmallImgs: TCustomImageList := NIL;
  var ALargeImgs: TCustomImageList := NIL;

  var ACallback: TEvtQueryIconSetProc := procedure(
      ASmall: TCustomImageList; ALarge: TCustomImageList)
    begin

      ASmallImgs := ASmall;
      ALargeImgs := ALarge;

    end;

  var AEvent := CreateQueryIconSetEvent(AFamily, ACallback );

  GlobalEventBus.Post( AEvent );

  ASmallImgList := ASmallImgs;
  ALargeImgList := ALargeImgs;

end;

end.
