scriptname _Camp_LegacyMenu extends ActiveMagicEffect

;Messages
Message property _Camp_legacyconfig_root auto
Message property _Camp_legacyconfig_camping auto
Message property _Camp_legacyconfig_camping2 auto
Message property _Camp_legacyconfig_tents auto
Message property _Camp_legacyconfig_tents2 auto
Message property _Camp_legacyconfig_advanced auto
Message property _Camp_legacyconfig_help auto
Message property _Camp_legacyconfig_troubleshooting auto
Message property _Camp_legacyconfig_removegeartents_on auto
Message property _Camp_legacyconfig_removegeartents_off auto
Message property _Camp_legacyconfig_campingillegal_on auto
Message property _Camp_legacyconfig_campingillegal_off auto
Message property _Camp_legacyconfig_flammableitems_on auto
Message property _Camp_legacyconfig_flammableitems_off auto
Message property _Camp_legacyconfig_showbackpack_on auto
Message property _Camp_legacyconfig_showbackpack_off auto
Message property _Camp_legacyconfig_showarmor_on auto
Message property _Camp_legacyconfig_showarmor_off auto
Message property _Camp_legacyconfig_showweapons_on auto
Message property _Camp_legacyconfig_showweapons_off auto
Message property _Camp_legacyconfig_showshield_on auto
Message property _Camp_legacyconfig_showshield_off auto
Message property _Camp_legacyconfig_showgauntlets_on auto
Message property _Camp_legacyconfig_showgauntlets_off auto
Message property _Camp_legacyconfig_showhelm_on auto
Message property _Camp_legacyconfig_showhelm_off auto
Message property _Camp_legacyconfig_showboots_on auto
Message property _Camp_legacyconfig_showboots_off auto
Message property _Camp_legacyconfig_removeammo_on auto
Message property _Camp_legacyconfig_removeammo_off auto
Message property _Camp_legacyconfig_followersinteract_on auto
Message property _Camp_legacyconfig_followersinteract_off auto
Message property _Camp_legacyconfig_followersremovegear_on auto
Message property _Camp_legacyconfig_followersremovegear_off auto
Message property _Camp_legacyconfig_advancedplacement_on auto
Message property _Camp_legacyconfig_advancedplacement_off auto
Message property _Camp_legacyconfig_placementthreads auto
Message property _Camp_legacyconfig_detectfollowers_on auto
Message property _Camp_legacyconfig_detectfollowers_off auto
Message property _Camp_legacyconfig_tutorials_on auto
Message property _Camp_legacyconfig_tutorials_off auto
Message property _Camp_legacyconfig_tutorials_resetconfirm auto
Message property _Camp_legacyconfig_tutorials_resetdone auto
Message property _Camp_legacyconfig_helpstuckplacement auto
Message property _Camp_TroubleshootingConfirmMsg auto
Message property _Camp_legacyconfig_campingskill auto
Message property _Camp_legacyconfig_campingskillrespec auto
Message property _Camp_legacyconfig_campingskillrestore auto
Message property _Camp_legacyconfig_campingskillrestoredone auto
Message property _Camp_legacyconfig_instincts auto
Message property _Camp_legacyconfig_instincts2 auto
Message property _Camp_legacyconfig_hearcreatures_on auto
Message property _Camp_legacyconfig_hearcreatures_off auto
Message property _Camp_legacyconfig_smelldead_on auto
Message property _Camp_legacyconfig_smelldead_off auto
Message property _Camp_legacyconfig_senseobjective_on auto
Message property _Camp_legacyconfig_senseobjective_off auto
Message property _Camp_legacyconfig_instinctsSFX_on auto
Message property _Camp_legacyconfig_instinctsSFX_off auto
Message property _Camp_legacyconfig_instinctsVFX_on auto
Message property _Camp_legacyconfig_instinctsVFX_off auto
Message property _Camp_legacyconfig_campfiremode_quick auto
Message property _Camp_legacyconfig_campfiremode_realistic auto

;Globals
GlobalVariable property _Camp_Setting_CampingArmorTakeOff auto
GlobalVariable property _Camp_Setting_Legality auto
GlobalVariable property _Camp_Setting_EquipmentFlammable auto
GlobalVariable property _Camp_Setting_TakeOff_Backpack auto
GlobalVariable property _Camp_Setting_TakeOff_Cuirass auto
GlobalVariable property _Camp_Setting_TakeOff_Weapons auto
GlobalVariable property _Camp_Setting_TakeOff_Shield auto
GlobalVariable property _Camp_Setting_TakeOff_Gauntlets auto
GlobalVariable property _Camp_Setting_TakeOff_Helm auto
GlobalVariable property _Camp_Setting_TakeOff_Boots auto
GlobalVariable property _Camp_Setting_TakeOff_Ammo auto
GlobalVariable property _Camp_Setting_FollowersUseCampsite auto
GlobalVariable property _Camp_Setting_FollowersRemoveGearInTents auto
GlobalVariable property _Camp_Setting_AdvancedPlacement auto
GlobalVariable property _Camp_Setting_MaxThreads auto
GlobalVariable property _Camp_Setting_TrackFollowers auto
GlobalVariable property _Camp_Setting_EnableTutorials auto
GlobalVariable property _Camp_Setting_InstinctsHearCreatures auto
GlobalVariable property _Camp_Setting_InstinctsSmellDead auto
GlobalVariable property _Camp_Setting_InstinctsSenseObjective auto
GlobalVariable property _Camp_Setting_InstinctsSFX auto
GlobalVariable property _Camp_Setting_InstinctsVFX auto
GlobalVariable property _Camp_Setting_CampfireMode auto

GlobalVariable property _Camp_CurrentlyPlacingObject auto
GlobalVariable property _Camp_LegacyConfigCampingRestore auto
GlobalVariable property CampingPerkPoints auto
GlobalVariable property CampingPerkPointsEarned auto
GlobalVariable property CampingPerkPointsTotal auto
GlobalVariable property CampingPerkPointProgress auto
GlobalVariable property _Camp_PerkRank_Firecraft auto
GlobalVariable property _Camp_PerkRank_HighSpirits auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto
GlobalVariable property _Camp_PerkRank_Resourceful auto
GlobalVariable property _Camp_PerkRank_Trailblazer auto

GlobalVariable property _Camp_Tutorial_FireBuilding1_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding2_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding3_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding4_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding5_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem1_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem2_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem3_Displayed auto

;References
Actor property PlayerRef auto
ReferenceAlias property Follower1 auto
ReferenceAlias property Follower2 auto
ReferenceAlias property Follower3 auto
ReferenceAlias property Animal auto

;Spells
Spell property _Camp_FollowerDetectSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akCaster == Game.GetPlayer()
        menu_root()
    endif
EndEvent

;Root menu
function menu_root()
    int i = _Camp_legacyconfig_root.Show()
    if i == 0
        menu_camping()
    elseif i == 1
        menu_tents()
    elseif i == 2
        menu_instincts()
    elseif i == 3
        menu_advanced()
    elseif i == 4
        menu_help()
    elseif i == 5
        ;Exit
    endif
endFunction

function menu_camping()
    int i = _Camp_legacyconfig_camping.Show()
    if i == 0
        MenuHandler_Toggle(_Camp_legacyconfig_removegeartents_on, _Camp_legacyconfig_removegeartents_off, _Camp_Setting_CampingArmorTakeOff)
        menu_camping()
    elseif i == 1
        MenuHandler_Toggle(_Camp_legacyconfig_followersremovegear_on, _Camp_legacyconfig_followersremovegear_off, _Camp_Setting_FollowersRemoveGearInTents)
        menu_camping()
    elseif i == 2
        MenuHandler_Toggle(_Camp_legacyconfig_followersinteract_on, _Camp_legacyconfig_followersinteract_off, _Camp_Setting_FollowersUseCampsite)
        menu_camping()
    elseif i == 3
        menu_camping2()
    elseif i == 4
        menu_root()
    endif
endFunction

function menu_camping2()
    int i = _Camp_legacyconfig_camping2.Show()
    if i == 0
        MenuHandler_Toggle(_Camp_legacyconfig_campingillegal_on, _Camp_legacyconfig_campingillegal_off, _Camp_Setting_Legality)
        menu_camping2()
    elseif i == 1
        MenuHandler_Toggle(_Camp_legacyconfig_flammableitems_on, _Camp_legacyconfig_flammableitems_off, _Camp_Setting_EquipmentFlammable)
        menu_camping2()
    elseif i == 2
        MenuHandler_MultiSelect2(_Camp_legacyconfig_campfiremode_quick, _Camp_legacyconfig_campfiremode_realistic, _Camp_Setting_CampfireMode)
        menu_camping2()
    elseif i == 3
        menu_camping()
    elseif i == 4
        menu_root()
    endif
endFunction

function menu_tents()
    int i = _Camp_legacyconfig_tents.Show()
    if i == 0
        MenuHandler_Toggle(_Camp_legacyconfig_showbackpack_on, _Camp_legacyconfig_showbackpack_off, _Camp_Setting_TakeOff_Backpack)
        menu_tents()
    elseif i == 1
        MenuHandler_Toggle(_Camp_legacyconfig_showarmor_on, _Camp_legacyconfig_showarmor_off, _Camp_Setting_TakeOff_Cuirass)
        menu_tents()
    elseif i == 2
        MenuHandler_Toggle(_Camp_legacyconfig_showweapons_on, _Camp_legacyconfig_showweapons_off, _Camp_Setting_TakeOff_Weapons)
        menu_tents()
    elseif i == 3
        MenuHandler_Toggle(_Camp_legacyconfig_showshield_on, _Camp_legacyconfig_showshield_off, _Camp_Setting_TakeOff_Shield)
        menu_tents()
    elseif i == 4
        menu_tents2()
    elseif i == 5
        menu_root()
    endif
endFunction

function menu_tents2()
    int i = _Camp_legacyconfig_tents2.Show()
    if i == 0
        MenuHandler_Toggle(_Camp_legacyconfig_showgauntlets_on, _Camp_legacyconfig_showgauntlets_off, _Camp_Setting_TakeOff_Gauntlets)
        menu_tents2()
    elseif i == 1
        MenuHandler_Toggle(_Camp_legacyconfig_showhelm_on, _Camp_legacyconfig_showhelm_off, _Camp_Setting_TakeOff_Helm)
        menu_tents2()
    elseif i == 2
        MenuHandler_Toggle(_Camp_legacyconfig_showboots_on, _Camp_legacyconfig_showboots_off, _Camp_Setting_TakeOff_Boots)
        menu_tents2()
    elseif i == 3
        MenuHandler_Toggle(_Camp_legacyconfig_removeammo_on, _Camp_legacyconfig_removeammo_off, _Camp_Setting_TakeOff_Ammo)
        menu_tents2()
    elseif i == 4
        menu_tents()
    elseif i == 5
        menu_root()
    endif

endFunction

function menu_instincts()
    int i = _Camp_legacyconfig_instincts.Show()
    if i == 0
        MenuHandler_Toggle(_Camp_legacyconfig_hearcreatures_on, _Camp_legacyconfig_hearcreatures_off, _Camp_Setting_InstinctsHearCreatures)
        menu_instincts()
    elseif i == 1
        MenuHandler_Toggle(_Camp_legacyconfig_smelldead_on, _Camp_legacyconfig_smelldead_off, _Camp_Setting_InstinctsSmellDead)
        menu_instincts()
    elseif i == 2
        MenuHandler_Toggle(_Camp_legacyconfig_senseobjective_on, _Camp_legacyconfig_senseobjective_off, _Camp_Setting_InstinctsSenseObjective)
        menu_instincts()
    elseif i == 3
        menu_instincts2()
    elseif i == 4
        menu_root()
    endif
endFunction

function menu_instincts2()
    int i = _Camp_legacyconfig_instincts2.Show()
    if i == 0
        MenuHandler_Toggle(_Camp_legacyconfig_instinctsSFX_on, _Camp_legacyconfig_instinctsSFX_off, _Camp_Setting_InstinctsSFX)
        menu_instincts2()
    elseif i == 1
        MenuHandler_Toggle(_Camp_legacyconfig_instinctsVFX_on, _Camp_legacyconfig_instinctsVFX_off, _Camp_Setting_InstinctsVFX)
        menu_instincts2()
    elseif i == 2
        menu_instincts()
    elseif i == 3
        menu_root()
    endif
endFunction

function menu_advanced()
    int i = _Camp_legacyconfig_advanced.Show()
    if i == 0
        MenuHandler_Toggle(_Camp_legacyconfig_advancedplacement_on, _Camp_legacyconfig_advancedplacement_off, _Camp_Setting_AdvancedPlacement)
        menu_advanced()
    elseif i == 1
        MenuHandler_UpDown(_Camp_legacyconfig_placementthreads, _Camp_Setting_MaxThreads, 1.0, 30.0, 1.0)
        menu_advanced()
    elseif i == 2
        MenuHandler_Toggle(_Camp_legacyconfig_detectfollowers_on, _Camp_legacyconfig_detectfollowers_off, _Camp_Setting_TrackFollowers)
        if _Camp_Setting_TrackFollowers.GetValueInt() == 2
            PlayerRef.AddSpell(_Camp_FollowerDetectSpell, false)
        else
            PlayerRef.RemoveSpell(_Camp_FollowerDetectSpell)
            Follower1.Clear()
            Follower2.Clear()
            Follower3.Clear()
            Animal.Clear()
        endif
        menu_advanced()
    elseif i == 3
        menu_campingskill()
    elseif i == 4
        menu_root()
    endif
endFunction

function menu_campingskill()
    int i = _Camp_legacyconfig_campingskill.Show()
    if i == 0     ;Respec
        bool b = MenuHandler_Execute(_Camp_legacyconfig_campingskillrespec)
        if b
            RefundCampingSkillPoints()
            _Camp_legacyconfig_campingskillrestoredone.Show()
        endif
        menu_campingskill()
    elseif i == 1 ;Restore
        MenuHandler_UpDown(_Camp_legacyconfig_campingskillrestore, _Camp_LegacyConfigCampingRestore, 0.0, CampingPerkPointsTotal.GetValue(), 1)
        if _Camp_LegacyConfigCampingRestore.GetValueInt() > 0
            CampingPerkPointProgress.SetValue(0.0)
            CampingPerkPoints.SetValue(_Camp_LegacyConfigCampingRestore.GetValueInt())
            CampingPerkPointsEarned.SetValue(_Camp_LegacyConfigCampingRestore.GetValueInt())
            ClearCampingPerks()
            _Camp_LegacyConfigCampingRestore.SetValueInt(0)
            _Camp_legacyconfig_campingskillrestoredone.Show()
        endif
        menu_campingskill()
    else
        menu_advanced()
    endif
endFunction

function menu_help()
    int i = _Camp_legacyconfig_help.Show()
    if i == 0
        menu_troubleshooting()
    elseif i == 1
        MenuHandler_Tutorials(_Camp_legacyconfig_tutorials_on, _Camp_legacyconfig_tutorials_off, _Camp_legacyconfig_tutorials_resetconfirm, _Camp_legacyconfig_tutorials_resetdone, _Camp_Setting_EnableTutorials)
        menu_help()
    elseif i == 2
        menu_root()
    endif
endFunction

function menu_troubleshooting()
    int i = _Camp_legacyconfig_troubleshooting.Show()
    if i == 0
        bool b = MenuHandler_Execute(_Camp_legacyconfig_helpstuckplacement)
        if b
            Troubleshooting_StuckPlacement()
        endif
        menu_troubleshooting()
    elseif i == 1
        menu_help()
    endif
endFunction

function Troubleshooting_StuckPlacement()
    _Camp_CurrentlyPlacingObject.SetValue(1)
    _Camp_TroubleshootingConfirmMsg.Show()
endFunction

;Format: On/Off, Back
;akSetting: 2 = ON, 1 = OFF
function MenuHandler_Toggle(Message akMessageOn, Message akMessageOff, GlobalVariable akSetting)
    if akSetting.GetValueInt() == 2
        int i = akMessageOn.Show()
        if i == 0
            akSetting.SetValueInt(1)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    elseif akSetting.GetValueInt() == 1
        int i = akMessageOff.Show()
        if i == 0
            akSetting.SetValueInt(2)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    endif
endFunction

;Format: On/Off, Execute, Back
;akSetting: 2 = ON, 1 = OFF
function MenuHandler_Tutorials(Message akMessageOn, Message akMessageOff, Message akMessageExecuteConfirm, Message akMessageExecuteDone, GlobalVariable akSetting)
    if akSetting.GetValueInt() == 2
        int i = akMessageOn.Show()
        if i == 0
            akSetting.SetValueInt(1)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            bool b = MenuHandler_Execute(akMessageExecuteConfirm)
            if b
                akMessageExecuteDone.Show()
                ResetTutorials()
            endif
        elseif i == 2
            ;return
        endif
    elseif akSetting.GetValueInt() == 1
        int i = akMessageOff.Show()
        if i == 0
            akSetting.SetValueInt(2)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            bool b = MenuHandler_Execute(akMessageExecuteConfirm)
            if b
                akMessageExecuteDone.Show()
                ResetTutorials()
            endif
        elseif i == 2
            ;return
        endif
    endif
endFunction

;Format: Execute, Back
bool function MenuHandler_Execute(Message akMessage)
    int i = akMessage.Show()
    if i == 0
        return true
    else
        return false
    endif
endFunction

;Format: Down, Up, Back
function MenuHandler_UpDown(Message akMessage, GlobalVariable akSetting, float afMin, float afMax, float afStepSize)
    int i = akMessage.Show(akSetting.GetValueInt())
    if i == 0
        ;Down
        if akSetting.GetValue() > afMin
            akSetting.SetValue(akSetting.GetValue() - afStepSize)
            if akSetting.GetValue() < afMin
                akSetting.SetValue(afMin)
            endif
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        else
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        endif
    elseif i == 1
        ;Up
        if akSetting.GetValue() < afMax
            akSetting.SetValue(akSetting.GetValue() + afStepSize)
            if akSetting.GetValue() > afMax
                akSetting.SetValue(afMax)
            endif
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        else
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        endif
    else
        ;return
    endif
endFunction

function MenuHandler_MultiSelect2(Message akOption1Active, Message akOption2Active, GlobalVariable akSetting, int aiSettingOffset = 0)
    int setting = akSetting.GetValueInt()
    if setting > 1
        setting = 1
    endif

    int i
    if (setting - aiSettingOffset) == 0
        i = akOption1Active.Show()
    elseif (setting - aiSettingOffset) == 1
        i = akOption2Active.Show()
    endif

    if i < 2
        akSetting.SetValueInt(i + aiSettingOffset)
        MenuHandler_MultiSelect2(akOption1Active, akOption2Active, akSetting, aiSettingOffset)
    endif
endFunction

function ClearCampingPerks()
    _Camp_PerkRank_Resourceful.SetValueInt(0)
    _Camp_PerkRank_Trailblazer.SetValueInt(0)
    _Camp_PerkRank_Firecraft.SetValueInt(0)
    _Camp_PerkRank_KeenSenses.SetValueInt(0)
    _Camp_PerkRank_HighSpirits.SetValueInt(0)
endFunction

function RefundCampingSkillPoints()
    ClearCampingPerks()
    CampingPerkPoints.SetValueInt(CampingPerkPointsEarned.GetValueInt())
    CampingPerkPointProgress.SetValue(0.0)
endFunction

function ResetTutorials()
    _Camp_Tutorial_FireBuilding1_Displayed.SetValueInt(1)
    _Camp_Tutorial_FireBuilding2_Displayed.SetValueInt(1)
    _Camp_Tutorial_FireBuilding3_Displayed.SetValueInt(1)
    _Camp_Tutorial_FireBuilding4_Displayed.SetValueInt(1)
    _Camp_Tutorial_FireBuilding5_Displayed.SetValueInt(1)
    _Camp_Tutorial_SkillSystem1_Displayed.SetValueInt(1)
    _Camp_Tutorial_SkillSystem2_Displayed.SetValueInt(1)
    _Camp_Tutorial_SkillSystem3_Displayed.SetValueInt(1)
endFunction

Message property _Camp_legacyconfig_manuallighting_on auto
{This message is deprecated as of Campfire 1.6.}
Message property _Camp_legacyconfig_manuallighting_off auto
{This message is deprecated as of Campfire 1.6.}
GlobalVariable property _Camp_Setting_ManualFireLighting auto
{This setting is deprecated as of Campfire 1.6.}