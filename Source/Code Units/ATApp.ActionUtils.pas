unit ATApp.ActionUtils;

interface

procedure UpdateVisibilityAction(Sender: TObject);


implementation

uses
  System.Rtti, System.SysUtils,
  AT.Rtti, AT.Props.Consts;

procedure UpdateVisibilityAction(Sender: TObject);
begin
  var ACheckVal: TValue;

  if (NOT GetPropertyValue(Sender, cPropChecked, ACheckVal)) then
    exit;

  var ACapProp := EmptyStr;
  var AImgProp := EmptyStr;

  if (ACheckVal.AsBoolean) then
    begin
      ACapProp := cPropStringData;
      AImgProp := cPropInt32Data;
    end
  else
    begin
      ACapProp := cPropVariantData;
      AImgProp := cPropInt64Data;
    end;

  var ACapValue: TValue;
  if (GetPropertyValue(Sender, ACapProp, ACapValue)) then
    SetPropertyValue(Sender, cPropCaption, ACapValue);

  var AImgValue: TValue;
  if (GetPropertyValue(Sender, AImgProp, AImgValue)) then
    SetPropertyValue(Sender, cPropImageIndex, AImgValue);
end;

end.
