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
Message property _Camp_legacyconfig_manuallighting_on auto
Message property _Camp_legacyconfig_manuallighting_off auto
Message property _Camp_legacyconfig_campingillegal_on auto
Message property _Camp_legacyconfig_campingillegal_off auto
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
Message property _Camp_legacyconfig_displaytutorials_on auto
Message property _Camp_legacyconfig_displaytutorials_off auto
Message property _Camp_legacyconfig_helpstuckplacement auto
Message property _Camp_legacyconfig_tutorialreset auto
Message property _Camp_TroubleshootingConfirmMsg auto

;Globals
GlobalVariable property _Camp_Setting_CampingArmorTakeOff auto
GlobalVariable property _Camp_Setting_ManualFireLighting auto
GlobalVariable property _Camp_Setting_Legality auto
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
GlobalVariable property _Camp_Setting_Tutorials auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto

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
        menu_advanced()
    elseif i == 3
        menu_help()
    elseif i == 4
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
        MenuHandler_Toggle(_Camp_legacyconfig_manuallighting_on, _Camp_legacyconfig_manuallighting_off, _Camp_Setting_ManualFireLighting)
        menu_camping2()
    elseif i == 1
        MenuHandler_Toggle(_Camp_legacyconfig_campingillegal_on, _Camp_legacyconfig_campingillegal_off, _Camp_Setting_Legality)
        menu_camping2()
    elseif i == 2
        menu_camping()
    elseif i == 3
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
        menu_root()
    endif
endFunction

function menu_help()
    int i = _Camp_legacyconfig_help.Show()
    if i == 0
        bool b = MenuHandler_Toggle_Tutorials(_Camp_legacyconfig_displaytutorials_on, _Camp_legacyconfig_displaytutorials_off, _Camp_Setting_Tutorials)
        if b
            reset_tutorials()
        endif
        menu_help()
    elseif i == 1
        menu_troubleshooting()
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

function reset_tutorials()
    _Camp_legacyconfig_tutorialreset.Show()
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

;Format: On/Off, Execute, Back (Tutorials special case)
;akSetting: 2 = ON, 1 = OFF
bool function MenuHandler_Toggle_Tutorials(Message akMessageOn, Message akMessageOff, GlobalVariable akSetting)
    if akSetting.GetValueInt() == 2
        int i = akMessageOn.Show()
        if i == 0
            akSetting.SetValueInt(1)
            bool b = MenuHandler_Toggle_Tutorials(akMessageOn, akMessageOff, akSetting)
            return b
        elseif i == 1
            return true
        elseif i == 2
            return false
        endif
    elseif akSetting.GetValueInt() == 1
        int i = akMessageOff.Show()
        if i == 0
            akSetting.SetValueInt(2)
            bool b = MenuHandler_Toggle_Tutorials(akMessageOn, akMessageOff, akSetting)
            return b
        elseif i == 1
            return true
        elseif i == 2
            return false
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