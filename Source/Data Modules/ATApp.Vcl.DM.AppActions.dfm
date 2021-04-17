object dmAppActions: TdmAppActions
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 384
  Width = 461
  object alstApp: TActionList
    Images = dmImages.ilstLightSm
    Left = 216
    Top = 176
    object actTouchMode: TAction
      Caption = 'Touch Mode'
      ImageIndex = 6
      OnExecute = ExecuteTouchModeAction
      OnUpdate = UpdateTouchModeAction
    end
    object actAppExit: TAction
      Caption = 'Exit <AppName>'
      ImageIndex = 2
      ShortCut = 32856
      OnExecute = ExecuteAppExitAction
    end
  end
end
