object dmThemeing: TdmThemeing
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 186
  Width = 555
  object sknctlMain: TdxSkinController
    NativeStyle = False
    ScrollbarMode = sbmHybrid
    SkinName = 'Office2019Colorful'
    ShowFormShadow = bTrue
    Left = 309
    Top = 79
  end
  object vtblSkinMap: TVirtualTable
    IndexFieldNames = 'SkinName'
    FieldDefs = <
      item
        Name = 'SkinName'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'SkinPalette'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'RibbonSkin'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'ColorMode'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MainWinIcon'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DocWinIcon'
        DataType = ftString
        Size = 1
      end>
    Left = 401
    Top = 79
    Data = {
      040006000800536B696E4E616D6501008000000000000B00536B696E50616C65
      74746501008000000000000A00526962626F6E536B696E010080000000000009
      00436F6C6F724D6F646501000100000000000B004D61696E57696E49636F6E01
      000100000000000A00446F6357696E49636F6E01000100000000000000720000
      0005000000426173696309000000426C7565204461726B050000004261736963
      010000004400000000000000000500000042617369630700000044656661756C
      74050000004261736963010000004C0000000000000000050000004261736963
      0900000050696E65204461726B05000000426173696301000000440000000000
      0000000500000042617369630A00000050696E65204C69676874050000004261
      736963010000004C00000000000000000500000042617369630B00000056696F
      6C6574204461726B050000004261736963010000004400000000000000000500
      000042617369630C00000056696F6C6574204C69676874050000004261736963
      010000004C000000000000000005000000426C61636B0700000044656661756C
      7405000000426C61636B010000004C000000000000000004000000426C756507
      00000044656661756C7404000000426C7565010000004C000000000000000009
      000000426C75657072696E740700000044656661756C7409000000426C756570
      72696E74010000004C000000000000000007000000436172616D656C07000000
      44656661756C7407000000436172616D656C010000004C000000000000000006
      000000436F666665650700000044656661756C7406000000436F666665650100
      00004C0000000000000000080000004461726B726F6F6D070000004465666175
      6C74080000004461726B726F6F6D010000004400000000000000000800000044
      61726B536964650700000044656661756C74080000004461726B536964650100
      00004C000000000000000013000000446576457870726573734461726B537479
      6C650700000044656661756C7413000000446576457870726573734461726B53
      74796C65010000004400000000000000000F0000004465764578707265737353
      74796C650700000044656661756C740F00000044657645787072657373537479
      6C65010000004C000000000000000005000000466F6767790700000044656661
      756C7405000000466F676779010000004C00000000000000000B000000476C61
      73734F6365616E730700000044656661756C740B000000476C6173734F636561
      6E73010000004C00000000000000000C00000048696768436F6E747261737407
      00000044656661756C740C00000048696768436F6E7472617374010000004C00
      0000000000000009000000694D6167696E6172790700000044656661756C7409
      000000694D6167696E617279010000004C0000000000000000060000004C696C
      69616E0700000044656661756C74060000004C696C69616E010000004C000000
      0000000000090000004C6971756964536B790700000044656661756C74090000
      004C6971756964536B79010000004C00000000000000000F0000004C6F6E646F
      6E4C6971756964536B790700000044656661756C740F0000004C6F6E646F6E4C
      6971756964536B79010000004C0000000000000000060000004D63536B696E07
      00000044656661756C74060000004D63536B696E010000004C00000000000000
      000A0000004D6574726F706F6C69730700000044656661756C740A0000004D65
      74726F706F6C6973010000004C00000000000000000E0000004D6574726F706F
      6C69734461726B0700000044656661756C740E0000004D6574726F706F6C6973
      4461726B010000004400000000000000000A0000004D6F6E65795477696E7307
      00000044656661756C740A0000004D6F6E65795477696E73010000004C000000
      00000000000F0000004F666669636532303037426C61636B0700000044656661
      756C740F0000004F666669636532303037426C61636B010000004C0000000000
      0000000E0000004F666669636532303037426C75650700000044656661756C74
      0E0000004F666669636532303037426C7565010000004C00000000000000000F
      0000004F666669636532303037477265656E0700000044656661756C740F0000
      004F666669636532303037477265656E010000004C00000000000000000E0000
      004F66666963653230303750696E6B0700000044656661756C740E0000004F66
      666963653230303750696E6B010000004C0000000000000000100000004F6666
      6963653230303753696C7665720700000044656661756C74100000004F666669
      63653230303753696C766572010000004C00000000000000000F0000004F6666
      69636532303130426C61636B0700000044656661756C740F0000004F66666963
      6532303130426C61636B010000004400000000000000000E0000004F66666963
      6532303130426C75650700000044656661756C740E0000004F66666963653230
      3130426C7565010000004C0000000000000000100000004F6666696365323031
      3053696C7665720700000044656661756C74100000004F666669636532303130
      53696C766572010000004C0000000000000000120000004F6666696365323031
      334461726B477261790700000044656661756C74120000004F66666963653230
      31334461726B47726179010000004C0000000000000000130000004F66666963
      65323031334C69676874477261790700000044656661756C74130000004F6666
      696365323031334C6967687447726179010000004C00000000000000000F0000
      004F66666963653230313357686974650700000044656661756C740F0000004F
      6666696365323031335768697465010000004C0000000000000000120000004F
      666669636532303136436F6C6F7266756C0700000044656661756C7408000000
      436F6C6F7266756C010000004C00000000000000000E0000004F666669636532
      3031364461726B0700000044656661756C740E0000004F666669636532303136
      4461726B010000004400000000000000000F0000004F66666963653230313942
      6C61636B05000000416D6265720F0000004F666669636532303139426C61636B
      010000004400000000000000000F0000004F666669636532303139426C61636B
      0700000044656661756C740F0000004F666669636532303139426C61636B0100
      00004400000000000000000F0000004F666669636532303139426C61636B0A00
      00004669726520427269636B0F0000004F666669636532303139426C61636B01
      0000004400000000000000000F0000004F666669636532303139426C61636B06
      000000466F726573740F0000004F666669636532303139426C61636B01000000
      4400000000000000000F0000004F666669636532303139426C61636B04000000
      50696E650F0000004F666669636532303139426C61636B010000004400000000
      000000000F0000004F666669636532303139426C61636B04000000506C756D0F
      0000004F666669636532303139426C61636B010000004400000000000000000F
      0000004F666669636532303139426C61636B0400000059616C650F0000004F66
      6669636532303139426C61636B01000000440000000000000000120000004F66
      6669636532303139436F6C6F7266756C05000000416D626572120000004F6666
      69636532303139436F6C6F7266756C010000004C000000000000000012000000
      4F666669636532303139436F6C6F7266756C0700000044656661756C74120000
      004F666669636532303139436F6C6F7266756C010000004C0000000000000000
      120000004F666669636532303139436F6C6F7266756C0A000000466972652042
      7269636B120000004F666669636532303139436F6C6F7266756C010000004C00
      00000000000000120000004F666669636532303139436F6C6F7266756C060000
      00466F72657374120000004F666669636532303139436F6C6F7266756C010000
      004C0000000000000000120000004F666669636532303139436F6C6F7266756C
      0400000050696E65120000004F666669636532303139436F6C6F7266756C0100
      00004C0000000000000000120000004F666669636532303139436F6C6F726675
      6C04000000506C756D120000004F666669636532303139436F6C6F7266756C01
      0000004C0000000000000000120000004F666669636532303139436F6C6F7266
      756C0400000059616C65120000004F666669636532303139436F6C6F7266756C
      010000004C0000000000000000120000004F6666696365323031394461726B47
      72617905000000416D626572120000004F6666696365323031394461726B4772
      617901000000440000000000000000120000004F666669636532303139446172
      6B477261790700000044656661756C74120000004F6666696365323031394461
      726B4772617901000000440000000000000000120000004F6666696365323031
      394461726B477261790A0000004669726520427269636B120000004F66666963
      65323031394461726B4772617901000000440000000000000000120000004F66
      66696365323031394461726B4772617906000000466F72657374120000004F66
      66696365323031394461726B4772617901000000440000000000000000120000
      004F6666696365323031394461726B477261790400000050696E65120000004F
      6666696365323031394461726B47726179010000004400000000000000001200
      00004F6666696365323031394461726B4772617904000000506C756D12000000
      4F6666696365323031394461726B477261790100000044000000000000000012
      0000004F6666696365323031394461726B477261790400000059616C65120000
      004F6666696365323031394461726B4772617901000000440000000000000000
      0F0000004F666669636532303139576869746505000000416D6265720F000000
      4F6666696365323031395768697465010000004C00000000000000000F000000
      4F66666963653230313957686974650700000044656661756C740F0000004F66
      66696365323031395768697465010000004C00000000000000000F0000004F66
      666963653230313957686974650A0000004669726520427269636B0F0000004F
      6666696365323031395768697465010000004C00000000000000000F0000004F
      666669636532303139576869746506000000466F726573740F0000004F666669
      6365323031395768697465010000004C00000000000000000F0000004F666669
      63653230313957686974650400000050696E650F0000004F6666696365323031
      395768697465010000004C00000000000000000F0000004F6666696365323031
      39576869746504000000506C756D0F0000004F66666963653230313957686974
      65010000004C00000000000000000F0000004F66666963653230313957686974
      650400000059616C650F0000004F666669636532303139576869746501000000
      4C00000000000000000700000050756D706B696E0700000044656661756C7407
      00000050756D706B696E0100000044000000000000000005000000536576656E
      0700000044656661756C7405000000536576656E010000004C00000000000000
      000C000000536576656E436C61737369630700000044656661756C740C000000
      536576656E436C6173736963010000004C000000000000000005000000536861
      72700700000044656661756C74050000005368617270010000004C0000000000
      000000090000005368617270506C75730700000044656661756C740900000053
      68617270506C7573010000004400000000000000000600000053696C76657207
      00000044656661756C740600000053696C766572010000004C00000000000000
      000A000000537072696E6774696D650700000044656661756C740A0000005370
      72696E6774696D65010000004C00000000000000000800000053746172647573
      740700000044656661756C74080000005374617264757374010000004C000000
      00000000000A00000053756D6D6572323030380700000044656661756C740A00
      000053756D6D657232303038010000004C00000000000000000F000000546865
      41737068616C74576F726C640700000044656661756C740F0000005468654173
      7068616C74576F726C64010000004C0000000000000000090000005468654265
      7A696572090000004171756172656C6C650900000054686542657A6965720100
      00004C00000000000000000900000054686542657A6965720900000041727420
      486F7573650900000054686542657A6965720100000044000000000000000009
      00000054686542657A69657210000000426C61636B6265727279205368616B65
      0900000054686542657A696572010000004C0000000000000000090000005468
      6542657A6965720B000000426C75652056656C7665740900000054686542657A
      696572010000004400000000000000000900000054686542657A696572020000
      0042570900000054686542657A696572010000004C0000000000000000090000
      0054686542657A6965720A00000043686572727920496E6B0900000054686542
      657A696572010000004400000000000000000900000054686542657A69657206
      0000004372616D62650900000054686542657A69657201000000440000000000
      0000000900000054686542657A6965720E0000004461726B2054757271756F69
      73650900000054686542657A6965720100000044000000000000000009000000
      54686542657A6965720A00000044617465204672756974090000005468654265
      7A696572010000004C00000000000000000900000054686542657A6965720700
      000044656661756C740900000054686542657A696572010000004C0000000000
      0000000900000054686542657A69657209000000447261676F6E666C79090000
      0054686542657A696572010000004C0000000000000000090000005468654265
      7A696572080000004669726562616C6C0900000054686542657A696572010000
      004400000000000000000900000054686542657A6965720B00000047686F7374
      20536861726B0900000054686542657A69657201000000440000000000000000
      0900000054686542657A6965720B000000476C6F6F6D20476C6F6F6D09000000
      54686542657A696572010000004C00000000000000000900000054686542657A
      6965720B0000004772617373686F707065720900000054686542657A69657201
      0000004C00000000000000000900000054686542657A6965720B0000004C6561
      6620527573746C650900000054686542657A696572010000004C000000000000
      00000900000054686542657A6965720B0000004D657263757279204963650900
      000054686542657A696572010000004400000000000000000900000054686542
      657A6965720A0000004D696C6B20536E616B650900000054686542657A696572
      010000004400000000000000000900000054686542657A696572090000004D6F
      7261792045656C0900000054686542657A696572010000004C00000000000000
      000900000054686542657A696572060000004E6562756C610900000054686542
      657A696572010000004C00000000000000000900000054686542657A6965720D
      0000004E656F6E204C6F6C6C69706F700900000054686542657A696572010000
      004C00000000000000000900000054686542657A6965720E0000004E6F727765
      6769616E20576F6F640900000054686542657A696572010000004C0000000000
      0000000900000054686542657A696572080000004F787967656E203309000000
      54686542657A696572010000004C00000000000000000900000054686542657A
      6965720D000000506C61737469632053706163650900000054686542657A6965
      72010000004C00000000000000000900000054686542657A6965720A00000050
      726F6D6574686575730900000054686542657A696572010000004C0000000000
      0000000900000054686542657A69657209000000537461727368696E65090000
      0054686542657A696572010000004C0000000000000000090000005468654265
      7A69657205000000546F6B796F0900000054686542657A696572010000004C00
      000000000000000900000054686542657A6965720600000056616375756D0900
      000054686542657A696572010000004C00000000000000000900000054686542
      657A69657207000000566F6C63616E6F0900000054686542657A696572010000
      004400000000000000000900000054686542657A6965720A0000005769746368
      20526176650900000054686542657A6965720100000044000000000000000009
      00000056616C656E74696E650700000044656661756C740900000056616C656E
      74696E65010000004C00000000000000001400000056697375616C5374756469
      6F32303133426C75650700000044656661756C741400000056697375616C5374
      7564696F32303133426C7565010000004C000000000000000014000000566973
      75616C53747564696F323031334461726B0700000044656661756C7414000000
      56697375616C53747564696F323031334461726B010000004400000000000000
      001500000056697375616C53747564696F323031334C69676874070000004465
      6661756C741500000056697375616C53747564696F323031334C696768740100
      00004C0000000000000000060000005653323031300700000044656661756C74
      06000000565332303130010000004C00000000000000000A0000005768697465
      7072696E740700000044656661756C740A00000057686974657072696E740100
      00004C00000000000000000C000000586D617332303038426C75650700000044
      656661756C740C000000586D617332303038426C7565010000004C0000000000
      000000}
    object fldSkinMapSkinName: TStringField
      FieldName = 'SkinName'
      Size = 128
    end
    object fldSkinMapSkinPalette: TStringField
      FieldName = 'SkinPalette'
      Size = 128
    end
    object fldSkinMapRibbonSkin: TStringField
      FieldName = 'RibbonSkin'
      Size = 128
    end
    object fldSkinMapColorMode: TStringField
      FieldName = 'ColorMode'
      Size = 1
    end
    object fldSkinMapMainWinIcon: TStringField
      FieldName = 'MainWinIcon'
      Size = 1
    end
    object fldSkinMapDocWinIcon: TStringField
      FieldName = 'DocWinIcon'
      Size = 1
    end
  end
  object llflstMain: TdxLayoutLookAndFeelList
    Left = 217
    Top = 79
    object llfMain: TdxLayoutSkinLookAndFeel
      Offsets.ItemOffset = 0
      PixelsPerInch = 96
    end
    object llfBSVSubCaption: TdxLayoutCxLookAndFeel
      ItemOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      ItemOptions.CaptionOptions.Font.Color = clWindowText
      ItemOptions.CaptionOptions.Font.Height = -16
      ItemOptions.CaptionOptions.Font.Name = 'Tahoma'
      ItemOptions.CaptionOptions.Font.Style = [fsBold]
      ItemOptions.CaptionOptions.UseDefaultFont = False
      PixelsPerInch = 96
    end
  end
  object stylrepoMain: TcxStyleRepository
    Left = 125
    Top = 79
    PixelsPerInch = 96
    object cxstylStatusBarText: TcxStyle
    end
  end
end
