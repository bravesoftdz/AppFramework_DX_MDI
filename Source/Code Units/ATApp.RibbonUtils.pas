unit ATApp.RibbonUtils;

interface

uses
  Vcl.ImgList,
  dxBar, dxRibbon, dxRibbonBackstageView,
  cxBarEditItem, cxGeometry;

procedure UpdateBarGlyph( ABar: TdxBar; AImgList: TCustomImageList;
  AImgIndex: Integer = -1 );
procedure UpdateBarItemGlyph( AItem: TdxBarItem;
  ASmallImgList, ALargeImgList: TCustomImageList;
  AImgIndex: Integer = -1 );
procedure UpdateBSVTabGlyph( ATabSheet
  : TdxRibbonBackstageViewTabSheet; ASmall: TCustomImageList;
  AImgIndex: Integer = -1 );
procedure UpdateCommandSearchGlyph(AItem: TcxBarEditItem; AImgList:
    TCustomImageList; AImgIndex: Integer);
procedure UpdateQATPositionAction(Sender: TObject; AQATPosition, ATestPosition:
    TdxQuickAccessToolbarPosition; AQATVisible: Boolean);

implementation

uses
  System.Rtti, System.SysUtils, System.Classes,
  Vcl.Graphics,
  dxGDIPlusClasses, AT.dxOfficeSearchBox2,
  cxGraphics,
  AT.Rtti, AT.Automate, AT.Props.Consts, AT.DEB.Events.StdDialogs;

procedure UpdateBarGlyph( ABar: TdxBar; AImgList: TCustomImageList;
  AImgIndex: Integer = -1 );
begin

  if ( NOT Assigned( ABar ) ) then
    exit;

  if ( AImgIndex < 0 ) then
    begin
      ABar.Glyph.Clear;
      exit;
    end;

  if ( NOT Assigned( AImgList ) ) then
    exit;

  if ( AImgList IS TcxImageList ) then
    begin

      var
      AIList := ( AImgList AS TcxImageList );

      var
      AImage := TdxSmartImage.Create;
      var
      AImgAF := TATAutoFree.Create( AImage );

      AIList.GetImage( AImgIndex, AImage );
      ABar.Glyph.Assign( AImage );

    end
  else
    begin

      var
      AImage := TBitmap.Create;
      var
      AImgAF := TATAutoFree.Create( AImage );

      AImgList.GetBitmap( AImgIndex, AImage );

      ABar.Glyph.Assign( AImage );

    end;

end;

procedure UpdateBarItemGlyph( AItem: TdxBarItem;
  ASmallImgList, ALargeImgList: TCustomImageList;
  AImgIndex: Integer = -1 );
begin

  if ( NOT Assigned( AItem ) ) then
    exit;

  if ( AImgIndex < 0 ) then
    begin
      AItem.Glyph.Clear;
      AItem.LargeGlyph.Clear;
      exit;
    end;

  if ( Assigned( ASmallImgList ) ) then
    begin

      if ( ASmallImgList IS TcxImageList ) then
        begin

          var
          AIList := ( ASmallImgList AS TcxImageList );

          var
          AImage := TdxSmartImage.Create;
          var
          AImgAF := TATAutoFree.Create( AImage );

          AIList.GetImage( AImgIndex, AImage );
          AItem.Glyph.Assign( AImage );

        end
      else
        begin

          var
          AImage := TBitmap.Create;
          var
          AImgAF := TATAutoFree.Create( AImage );

          ASmallImgList.GetBitmap( AImgIndex, AImage );

          AItem.Glyph.Assign( AImage );

        end;

    end;

  if ( Assigned( ALargeImgList ) ) then
    begin

      if ( ALargeImgList IS TcxImageList ) then
        begin

          var
          AIList := ( ALargeImgList AS TcxImageList );

          var
          AImage := TdxSmartImage.Create;
          var
          AImgAF := TATAutoFree.Create( AImage );

          AIList.GetImage( AImgIndex, AImage );
          AItem.LargeGlyph.Assign( AImage );

        end
      else
        begin

          var
          AImage := TBitmap.Create;
          var
          AImgAF := TATAutoFree.Create( AImage );

          ALargeImgList.GetBitmap( AImgIndex, AImage );

          AItem.LargeGlyph.Assign( AImage );

        end;

    end;

end;

procedure UpdateBSVTabGlyph( ATabSheet
  : TdxRibbonBackstageViewTabSheet; ASmall: TCustomImageList;
  AImgIndex: Integer = -1 );
begin

  if ( NOT Assigned( ATabSheet ) ) then
    exit;

  if ( AImgIndex < 0 ) then
    begin
      ATabSheet.Glyph.Clear;
      exit;
    end;

  if ( Assigned( ASmall ) ) then
    begin

      if ( ASmall IS TcxImageList ) then
        begin

          var
          AIList := ( ASmall AS TcxImageList );

          var
          AImage := TdxSmartImage.Create;
          var
          AImgAF := TATAutoFree.Create( AImage );

          AIList.GetImage( AImgIndex, AImage );
          ATabSheet.Glyph.Assign( AImage );

        end
      else
        begin

          var
          AImage := TBitmap.Create;
          var
          AImgAF := TATAutoFree.Create( AImage );

          ASmall.GetBitmap( AImgIndex, AImage );

          ATabSheet.Glyph.Assign( AImage );

        end;

    end;

end;

procedure UpdateCommandSearchGlyph(AItem: TcxBarEditItem; AImgList:
    TCustomImageList; AImgIndex: Integer);
begin

  if ( NOT Assigned( AItem ) ) then
    exit;

  var APropsRef := AItem.Properties;

  if (NOT (APropsRef IS TdxOfficeSearchBox2Properties)) then
    exit;

  var AProps := (APropsRef AS TdxOfficeSearchBox2Properties);

  if ( AImgIndex < 0 ) then
    begin
      AProps.Glyph.Clear;
      exit;
    end;

  if ( Assigned( AImgList ) ) then
    begin

      if ( AImgList IS TcxImageList ) then
        begin

          var AIList := ( AImgList AS TcxImageList );

          var AImage := TdxSmartImage.Create;
          var AImgAF := TATAutoFree.Create( AImage );

          AIList.GetImage( AImgIndex, AImage );

          AProps.Glyph.Assign( AImage );

        end
      else
        begin

          var
          AImage := TBitmap.Create;
          var
          AImgAF := TATAutoFree.Create( AImage );

          AImgList.GetBitmap( AImgIndex, AImage );

          AProps.Glyph.Assign( AImage );

        end;

    end;

end;

procedure UpdateQATPositionAction(Sender: TObject; AQATPosition, ATestPosition:
    TdxQuickAccessToolbarPosition; AQATVisible: Boolean);
begin

  var bChk := (AQATPosition = ATestPosition);
  var bEnable := AQATVisible;

  SetPropertyValue(Sender, cPropChecked, bChk);
  SetPropertyValue(Sender, cPropEnabled, bEnable);

end;

end.
