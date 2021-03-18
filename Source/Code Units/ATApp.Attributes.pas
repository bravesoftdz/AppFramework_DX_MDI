unit ATApp.Attributes;

interface

uses
  Vcl.Forms,
  ATApp.Types;

type
  TATFormSingleInstanceAttribute = class(TCustomAttribute)
  strict private
    FIsSingleInstance: Boolean;
  public
    constructor Create(AIsSingleInstance: Boolean = False);
    property IsSingleInstance: Boolean read FIsSingleInstance write
        FIsSingleInstance;
  end;

  TATFormTypeAttribute = class(TCustomAttribute)
  strict private
    FFormType: TATFormTypeEnum;
  public
    constructor Create(AFormType: TATFormTypeEnum);
    property FormType: TATFormTypeEnum read FFormType write FFormType;
  end;

implementation

constructor TATFormSingleInstanceAttribute.Create(AIsSingleInstance: Boolean =
    False);
begin

  FIsSingleInstance := AIsSingleInstance;

end;

constructor TATFormTypeAttribute.Create(AFormType: TATFormTypeEnum);
begin

  FFormType := AFormType;

end;

end.
