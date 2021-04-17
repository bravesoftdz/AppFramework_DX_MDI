unit ATApp.Attributes.Vcl.Utils;

interface

uses
  Vcl.Forms, ATApp.Types;

function GetFormSingleInstanceAttrValue(AForm: TForm): Boolean; overload;
function GetFormSingleInstanceAttrValue(AFormClass: TFormClass): Boolean; overload;
function GetFormSingleInstanceAttrValue(AClassInfo: Pointer): Boolean; overload;
function GetFormTypeAttrValue(AForm: TForm): TATFormTypeEnum;


implementation

uses
  System.Rtti,
  AT.Automate, AT.Rtti.Automate, ATApp.Attributes;

function GetFormSingleInstanceAttrValue(AForm: TForm): Boolean;
begin

  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AForm.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //Exit, return unspecified...
      Exit(False);
    end;

  var AAttribs := AType.GetAttributes;

  Result := False;

  for var AAttrib in AAttribs do
    begin

      if (AAttrib IS TATFormSingleInstanceAttribute) then
        begin

          var AFTAttrib := (AAttrib AS TATFormSingleInstanceAttribute);

          exit(AFTAttrib.IsSingleInstance);

        end;

    end;

end;

function GetFormSingleInstanceAttrValue(AFormClass: TFormClass): Boolean;
begin

  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AFormClass.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //Exit, return unspecified...
      Exit(False);
    end;

  var AAttribs := AType.GetAttributes;

  Result := False;

  for var AAttrib in AAttribs do
    begin

      if (AAttrib IS TATFormSingleInstanceAttribute) then
        begin

          var AFTAttrib := (AAttrib AS TATFormSingleInstanceAttribute);

          exit(AFTAttrib.IsSingleInstance);

        end;

    end;

end;

function GetFormSingleInstanceAttrValue(AClassInfo: Pointer): Boolean;
begin

  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //Exit, return unspecified...
      Exit(False);
    end;

  var AAttribs := AType.GetAttributes;

  Result := False;

  for var AAttrib in AAttribs do
    begin

      if (AAttrib IS TATFormSingleInstanceAttribute) then
        begin

          var AFTAttrib := (AAttrib AS TATFormSingleInstanceAttribute);

          exit(AFTAttrib.IsSingleInstance);

        end;

    end;

end;

function GetFormTypeAttrValue(AForm: TForm): TATFormTypeEnum;
begin

  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AForm.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //Exit, return unspecified...
      Exit(TATFormTypeEnum.fteUnspecified);
    end;

  var AAttribs := AType.GetAttributes;

  Result := TATFormTypeEnum.fteUnspecified;

  for var AAttrib in AAttribs do
    begin

      if (AAttrib IS TATFormTypeAttribute) then
        begin

          var AFTAttrib := (AAttrib AS TATFormTypeAttribute);

          exit(AFTAttrib.FormType);

        end;

    end;

end;

end.
