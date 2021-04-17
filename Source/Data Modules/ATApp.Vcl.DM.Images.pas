unit ATApp.Vcl.DM.Images;

interface

uses
  System.SysUtils, System.Classes, System.ImageList,
  Vcl.ImgList, Vcl.Controls,
  Data.DB,
  cxClasses, cxGraphics, cxImageList,
  ATApp.DEB.UISkin, ATApp.DEB.IconSets,
  MemDS, VirtualTable, EventBus;

type
  TdmImages = class(TDataModule)
    ilstDarkLg: TcxImageList;
    ilstDarkSm: TcxImageList;
    ilstLightLg: TcxImageList;
    ilstLightSm: TcxImageList;
    ilstWhiteLg: TcxImageList;
    ilstWhiteSm: TcxImageList;
    vtblIconMap: TVirtualTable;
    fldIconMapSkinName: TStringField;
    fldIconMapSkinPalette: TStringField;
    fldIconMapMainIconSet: TSmallintField;
    fldIconMapQATAboveIconSet: TSmallintField;
    fldIconMapQATBelowIconSet: TSmallintField;
    fldIconMapSBIconSet: TSmallintField;
    fldIconMapSrchBarIconSet: TSmallintField;
    fldIconMapInfoBarIconSet: TSmallintField;
    fldIconMapSrchBoxIconSet: TSmallintField;
    fldIconMapBSVIconSet: TSmallintField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  strict private
    FBSVIconSet: TEvtIconSetType;
    FInfoBarIconSet: TEvtIconSetType;
    FMainIconSet: TEvtIconSetType;
    FQATAboveIconSet: TEvtIconSetType;
    FQATBelowIconSet: TEvtIconSetType;
    FSBIconSet: TEvtIconSetType;
    FSkinName: string;
    FSkinPalette: string;
    FSrchBarIconSet: TEvtIconSetType;
    FSrchBoxIconSet: TEvtIconSetType;
    procedure _CacheIconSets;
    procedure _PostIconSetsChangedEvent;
  public
    [Subscribe(TThreadMode.Main)]
    procedure OnQueryIconSet(AEvent: IEvtQueryIconSet);
    [Subscribe(TThreadMode.Main)]
    procedure OnUISkinChanged(AEvent: IEvtUISkinChanged);
  end;

var
  dmImages: TdmImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.Variants;

{$R *.dfm}

procedure TdmImages.DataModuleDestroy(Sender: TObject);
begin

  GlobalEventBus.UnregisterForEvents( Self );

  vtblIconMap.Close;

end;

procedure TdmImages.DataModuleCreate(Sender: TObject);
begin

  FBSVIconSet := istLight;
  FInfoBarIconSet := istLight;
  FMainIconSet := istLight;
  FQATAboveIconSet := istLight;
  FQATBelowIconSet := istLight;
  FSBIconSet := istLight;
  FSrchBarIconSet := istLight;
  FSrchBoxIconSet := istLight;

  vtblIconMap.Open;

  GlobalEventBus.RegisterSubscriberForEvents( Self );

  FSkinName := TUISkinEventPost.QuerySkinName;
  FSkinPalette := TUISkinEventPost.QuerySkinPalette;

  _CacheIconSets;

  _PostIconSetsChangedEvent;

end;

procedure TdmImages.OnQueryIconSet(AEvent: IEvtQueryIconSet);
begin

  var ACallback := AEvent.Callback;

  if (NOT Assigned(ACallback)) then
    exit;

  var AFamily := AEvent.Family;

  var AImgType := istLight;

  case AFamily of
    isfBSV      : AImgType := FBSVIconSet;
    isfInfoBox  : AImgType := FInfoBarIconSet;
    isfMain     : AImgType := FMainIconSet;
    isfQATAbove : AImgType := FQATAboveIconSet;
    isfQATBelow : AImgType := FQATBelowIconSet;
    isfSB       : AImgType := FSBIconSet;
    isfSearchBar: AImgType := FSrchBarIconSet;
    isfSearchBox: AImgType := FSrchBoxIconSet;
  end;

  var ASmallImgs := ilstLightSm;
  var ALargeImgs := ilstLightLg;

  case AImgType of
    istLight : begin
                 ASmallImgs := ilstLightSm;
                 ALargeImgs := ilstLightLg;
               end;
    istDark  : begin
                 ASmallImgs := ilstDarkSm;
                 ALargeImgs := ilstDarkLg;
               end;
    istWhite : begin
                 ASmallImgs := ilstWhiteSm;
                 ALargeImgs := ilstWhiteLg;
               end;
  end;

  ACallback(ASmallImgs, ALargeImgs);

end;

procedure TdmImages.OnUISkinChanged(AEvent: IEvtUISkinChanged);
begin

  FSkinName := AEvent.SkinName;
  FSkinPalette := AEvent.SkinPalette;

  _CacheIconSets;

  _PostIconSetsChangedEvent;

end;

procedure TdmImages._CacheIconSets;
begin

  const ALUFields = 'SkinName;SkinPalette';
  const ALUOpts: TLocateOptions = [TLocateOption.loCaseInsensitive];

  var ALUValues := VarArrayOf([FSkinName, FSkinPalette]);

  var bFound := vtblIconMap.Locate(ALUFields, ALUValues, ALUOpts);

  if ( NOT bFound ) then
    exit;

  var AField := vtblIconMap.FieldByName('BSVIconSet');
  var AValue := AField.AsInteger;
  FBSVIconSet := TEvtIconSetType(AValue);

  AField := vtblIconMap.FieldByName('InfoBarIconSet');
  AValue := AField.AsInteger;
  FInfoBarIconSet := TEvtIconSetType(AValue);

  AField := vtblIconMap.FieldByName('MainIconSet');
  AValue := AField.AsInteger;
  FMainIconSet := TEvtIconSetType(AValue);

  AField := vtblIconMap.FieldByName('QATAboveIconSet');
  AValue := AField.AsInteger;
  FQATAboveIconSet := TEvtIconSetType(AValue);

  AField := vtblIconMap.FieldByName('QATBelowIconSet');
  AValue := AField.AsInteger;
  FQATBelowIconSet := TEvtIconSetType(AValue);

  AField := vtblIconMap.FieldByName('SBIconSet');
  AValue := AField.AsInteger;
  FSBIconSet := TEvtIconSetType(AValue);

  AField := vtblIconMap.FieldByName('SrchBarIconSet');
  AValue := AField.AsInteger;
  FSrchBarIconSet := TEvtIconSetType(AValue);

  AField := vtblIconMap.FieldByName('SrchBoxIconSet');
  AValue := AField.AsInteger;
  FSrchBoxIconSet := TEvtIconSetType(AValue);

end;

procedure TdmImages._PostIconSetsChangedEvent;
begin

  TIconSetsEventPost.IconSetsChanged;

end;

end.
