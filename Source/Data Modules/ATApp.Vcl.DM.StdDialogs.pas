unit ATApp.Vcl.DM.StdDialogs;

interface

uses
  System.SysUtils, System.Classes, System.UITypes,
//  Vcl.Dialogs,
  AT.DEB.Events.StdDialogs,
  EventBus, ATApp.DEB.UISkin;

type
  TdmStdDialogs = class(TDataModule)
  strict private
    FDarkMode: Boolean;
  protected
    property DarkMode: Boolean read FDarkMode write FDarkMode;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    [Subscribe(TThreadMode.Main)]
    procedure OnColorModeChanged(AEvent: IEvtColorModeChanged);
    [Subscribe(TThreadMode.Main)]
    procedure OnShowError(AEvent: IEvtShowError);
    [Subscribe(TThreadMode.Main)]
    procedure OnShowMessage(AEvent: IEvtShowMessage);
    [Subscribe(TThreadMode.Main)]
    procedure OnShowWarning(AEvent: IEvtShowWarning);
    [Subscribe(TThreadMode.Main)]
    procedure OnShowYesNoDialog(AEvent: IEvtShowYesNoDialog);
    procedure ShowError(const AMessage: string; const ACaption: string = ''; const
        ATitle: string = ''; AWidth: Integer = 400; AHeight: Integer = 250);
    procedure ShowMessage(const AMessage: string; const ACaption: string = '';
        const ATitle: string = ''; AWidth: Integer = 400; AHeight: Integer = 250);
    procedure ShowWarning(const AMessage: string; const ACaption: string = '';
        const ATitle: string = ''; AWidth: Integer = 400; AHeight: Integer = 250);
    function ShowYesNoDialog(const AMessage: string; const ACaption: string = '';
        const ATitle: string = ''; const AYesCaption: string = 'Yes'; const
        AYesBtnHint: string = ''; const ANoCaption: string = 'No'; const
        ANoBtnHint: string = ''; AWidth: Integer = 400; AHeight: Integer = 250):
        TModalResult;
  end;

var
  dmStdDialogs: TdmStdDialogs;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.Threading,
  Vcl.Forms, AT.Vcl.DX.Dialog.Task;


{$R *.dfm}

{ TdmStdDialogs }

constructor TdmStdDialogs.Create(AOwner: TComponent);
begin

  inherited;

  FDarkMode := False;

//  SetSplashMessage(rstrInitDialogs);

  GlobalEventBus.RegisterSubscriberForEvents(Self);

  TTask.Run( procedure
      begin

        repeat

          Sleep(100);

        until (Assigned(Application.MainForm));

        repeat

          Sleep(100);

        until Application.MainForm.Showing;

        TThread.Synchronize( NIL, procedure
            begin

              Sleep(200);

//              Self.HideSplash;

            end);

      end );

  var AColorMode := TUISkinEventPost.QueryColorMode;

  FDarkMode := ( AColorMode = TEvtUIColorMode.uicmDark );

end;

destructor TdmStdDialogs.Destroy;
begin

  GlobalEventBus.UnregisterForEvents( Self );

  inherited;

end;

procedure TdmStdDialogs.OnColorModeChanged(
  AEvent: IEvtColorModeChanged);
begin

  FDarkMode := ( AEvent.ColorMode = TEvtUIColorMode.uicmDark );

end;

procedure TdmStdDialogs.OnShowError(AEvent: IEvtShowError);
begin

  var ACaption: String := AEvent.Caption;
  var AMessage: String := AEvent.Message;
  var ATitle: String := AEvent.Title;
  var AHeight: Integer := AEvent.Height;
  var AWidth: Integer := AEvent.Width;

  ShowError(AMessage, ACaption, ATitle, AWidth, AHeight);

end;

procedure TdmStdDialogs.OnShowMessage(AEvent: IEvtShowMessage);
begin

  var ACaption: String := AEvent.Caption;
  var AMessage: String := AEvent.Message;
  var ATitle: String := AEvent.Title;
  var AHeight: Integer := AEvent.Height;
  var AWidth: Integer := AEvent.Width;

  ShowMessage(AMessage, ACaption, ATitle, AWidth, AHeight);

end;

procedure TdmStdDialogs.OnShowWarning(AEvent: IEvtShowWarning);
begin

  var ACaption: String := AEvent.Caption;
  var AMessage: String := AEvent.Message;
  var ATitle: String := AEvent.Title;
  var AHeight: Integer := AEvent.Height;
  var AWidth: Integer := AEvent.Width;

  ShowWarning(AMessage, ACaption, ATitle, AWidth, AHeight);

end;

procedure TdmStdDialogs.OnShowYesNoDialog(
  AEvent: IEvtShowYesNoDialog);
begin

  var AModalResult := ShowYesNoDialog(AEvent.Message, AEvent.Caption,
      AEvent.Title, AEvent.YesBtnCaption, AEvent.YesBtnHint,
      AEvent.NoBtnCaption, AEvent.NoBtnHint, AEvent.Width,
      AEvent.Height);

  if (Assigned(AEvent.YesNoCallback)) then
    AEvent.YesNoCallback(AModalResult);

end;

procedure TdmStdDialogs.ShowError(const AMessage: string; const ACaption:
    string = ''; const ATitle: string = ''; AWidth: Integer = 400; AHeight:
    Integer = 250);
begin

  var ACapStr := ACaption;

  if (ACapStr.IsEmpty) then
    ACapStr := Application.Title;

  var ATitleStr := ATitle;
  var AMsgStr := AMessage;



  if (ATitleStr.IsEmpty) then
    begin

      ATitleStr := AMessage;
      AMsgStr := EmptyStr;

    end;

  DXTaskDialog(Application.MainForm, AMsgStr, ATitleStr, ACapStr,
      DarkMode, TATDXTaskDialogIcon.dxtdiError, [dxtcbOk], dxtcbOk,
      dxtcbNone, [], AWidth, AHeight);

end;

procedure TdmStdDialogs.ShowMessage(const AMessage: string; const ACaption:
    string = ''; const ATitle: string = ''; AWidth: Integer = 400; AHeight:
    Integer = 250);
begin

  var ACapStr := ACaption;

  if (ACapStr.IsEmpty) then
    ACapStr := Application.Title;

  var ATitleStr := ATitle;
  var AMsgStr := AMessage;



  if (ATitleStr.IsEmpty) then
    begin

      ATitleStr := AMessage;
      AMsgStr := EmptyStr;

    end;

  DXTaskDialog(Application.MainForm, AMsgStr, ATitleStr, ACapStr,
      DarkMode, TATDXTaskDialogIcon.dxtdiInformation, [dxtcbOk], dxtcbOk,
      dxtcbNone, [], AWidth, AHeight);

end;

procedure TdmStdDialogs.ShowWarning(const AMessage: string; const ACaption:
    string = ''; const ATitle: string = ''; AWidth: Integer = 400; AHeight:
    Integer = 250);
begin

  var ACapStr := ACaption;

  if (ACapStr.IsEmpty) then
    ACapStr := Application.Title;

  var ATitleStr := ATitle;
  var AMsgStr := AMessage;



  if (ATitleStr.IsEmpty) then
    begin

      ATitleStr := AMessage;
      AMsgStr := EmptyStr;

    end;

  DXTaskDialog(Application.MainForm, AMsgStr, ATitleStr, ACapStr,
      DarkMode, TATDXTaskDialogIcon.dxtdiWarning, [dxtcbOk], dxtcbOk,
      dxtcbNone, [], AWidth, AHeight);

end;

function TdmStdDialogs.ShowYesNoDialog(const AMessage: string; const ACaption:
    string = ''; const ATitle: string = ''; const AYesCaption: string = 'Yes';
    const AYesBtnHint: string = ''; const ANoCaption: string = 'No'; const
    ANoBtnHint: string = ''; AWidth: Integer = 400; AHeight: Integer = 250):
    TModalResult;
begin

  var ACapStr := ACaption;

  if (ACapStr.IsEmpty) then
    ACapStr := Application.Title;

  var ATitleStr := ATitle;
  var AMsgStr := AMessage;

  if (ATitleStr.IsEmpty) then
    begin

      ATitleStr := AMessage;
      AMsgStr := EmptyStr;

    end;

  var AYesCapStr := AYesCaption;

  if (AYesCapStr.IsEmpty) then
    AYesCapStr := 'Yes';

  var ANoCapStr := ANoCaption;

  if (ANoCapStr.IsEmpty) then
    ANoCapStr := 'No';

  var ACmdLinks: TATDXTaskDialogCommandLinkArray;
  SetLength(ACmdLinks, 2);

  ACmdLinks[0] := TATDXTaskDialogCommandLinkInfo.Create(
      AYesCapStr, mrYes, AYesBtnHint);

  ACmdLinks[1] := TATDXTaskDialogCommandLinkInfo.Create(
      ANoCapStr, mrNo, ANoBtnHint);


  Result := DXTaskDialog(Application.MainForm, AMsgStr, ATitleStr,
      ACapStr, DarkMode, TATDXTaskDialogIcon.dxtdiQuestion, [],
      dxtcbNone, dxtcbNone, ACmdLinks, AWidth, AHeight);

end;

end.
