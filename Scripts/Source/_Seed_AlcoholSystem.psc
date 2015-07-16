scriptname _Seed_AlcoholSystem extends Quest

import Utility

GlobalVariable property _Seed_AlcoholSystemEnabled auto
GlobalVariable property _Seed_AttributeDrunk auto

Spell property _Seed_DrunkSpell1 auto
Spell property _Seed_DrunkSpell2 auto
Spell property _Seed_DrunkSpell3 auto
Spell property _Seed_DrunkSpell4 auto
Spell property _Seed_DrunkSpell5 auto
Spell property _Seed_DrunkSpell6 auto

Actor property PlayerRef auto
Keyword property ActorTypeUndead auto
Keyword property ImmuneParalysis auto

float property MAX_DRUNK = 120.0 autoReadOnly
float property MIN_DRUNK = 0.0 autoReadOnly

int DRINKTYPE_ALE = 1
int DRINKTYPE_WINE = 2
int DRINKTYPE_LIQUOR = 3

float ALE_AMOUNT = 20.0
float WINE_AMOUNT = 30.0
float LIQUOR_AMOUNT = 40.0

float SOBER_RATE = 20.0

float property update_interval = 0.5 auto hidden
float property last_update_time auto hidden
float last_drunk = 0.0

function AlcoholConsumed(int drinktype)
    if _Seed_Setting_VampireBehavior.GetValueInt() == 2 && IsUndead()
        return
    endif

    if drinktype == DRINKTYPE_ALE
        IncreaseDrunk(ALE_AMOUNT)
    elseif drinktype == DRINKTYPE_WINE
        IncreaseDrunk(WINE_AMOUNT)
    elseif drinktype == DRINKTYPE_LIQUOR
        IncreaseDrunk(LIQUOR_AMOUNT)
    endif
    if _Seed_AttributeDrunk.GetValue() > 20.0
        RegisterForSingleUpdateGameTime(0.5)
    endif
endFunction

Event OnUpdateGameTime()
    float this_time = GetCurrentGameTime() * 24.0
    int cycles = Math.Floor((this_time - last_update_time) * 2)
    float drunk_decrease = (SOBER_RATE * cycles)

    DecreaseDrunk(drunk_decrease)
    last_update_time = this_time

    if _Seed_VitalitySystemEnabled.GetValueInt() == 2 && _Seed_AttributeDrunk.GetValue() > 0.0
        RegisterForSingleUpdateGameTime(update_interval)
    endif
EndEvent

function IncreaseDrunk(float amount)
    float current_drunk = _Seed_AttributeDrunk.GetValue()
    if current_drunk + amount >= MAX_DRUNK
        _Seed_AttributeDrunk.SetValue(MAX_DRUNK)
    else
        _Seed_AttributeDrunk.SetValue(current_drunk + amount)
    endif
    ApplyDrunkEffects()
endFunction

function DecreaseDrunk(float amount)
    float current_drunk = _Seed_AttributeDrunk.GetValue()
    if current_drunk - amount <= MIN_DRUNK
        _Seed_AttributeDrunk.SetValue(MIN_DRUNK)
    else
        _Seed_AttributeDrunk.SetValue(current_drunk - amount)
    endif
    ApplyDrunkEffects()
endFunction

function ModDrunk(float amount)
    float current_drunk = _Seed_AttributeDrunk.GetValue()
    if current_drunk + amount >= MAX_DRUNK
        _Seed_AttributeDrunk.SetValue(MAX_DRUNK)
    elseif current_drunk + amount <= MIN_DRUNK
        _Seed_AttributeDrunk.SetValue(MIN_DRUNK)
    else
        _Seed_AttributeDrunk.SetValue(current_drunk + amount)
    endif
    ApplyDrunkEffects()
endFunction

bool function IsUndead()
    ; Is player humanoid Vampire, undead, or transformed Vampire Lord?
    if PlayerRef.GetRace().HasKeyword(ActorTypeUndead) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
        return true
    else
        return false
    endif
endFunction

function ApplyDrunkEffects()
    float drunk = _Seed_AttributeDrunk.GetValue()
    bool increasing = false
    if drunk > last_drunk
        increasing = true
    endif

    if !(IsBetween(last_drunk, 20.0, 0.0)) && (IsBetween(drunk, 20.0, 0.0))
        ApplyDrunkLevel1()
    elseif !(IsBetween(last_drunk, 40.0, 20.0)) && (IsBetween(drunk, 40.0, 20.0))
        ApplyDrunkLevel2(increasing)
    elseif !(IsBetween(last_drunk, 60.0, 40.0)) && (IsBetween(drunk, 60.0, 40.0))
        ApplyDrunkLevel3()
    elseif !(IsBetween(last_drunk, 80.0, 60.0)) && (IsBetween(drunk, 80.0, 60.0))
        ApplyDrunkLevel4()
    elseif !(IsBetween(last_drunk, 100.0, 80.0)) && (IsBetween(drunk, 100.0, 80.0))
        ApplyDrunkLevel5()
    elseif !(IsBetween(last_drunk, 120.0, 100.0)) && (IsBetween(drunk, 120.0, 100.0))
        ApplyDrunkLevel6()
    endif

    last_drunk = drunk
endFunction

function RemoveAllDrunkEffects()
    PlayerRef.RemoveSpell(_Seed_DrunkSpell1)
    PlayerRef.RemoveSpell(_Seed_DrunkSpell2)
    PlayerRef.RemoveSpell(_Seed_DrunkSpell3)
    PlayerRef.RemoveSpell(_Seed_DrunkSpell4)
    PlayerRef.RemoveSpell(_Seed_DrunkSpell5)
    PlayerRef.RemoveSpell(_Seed_DrunkSpell6)
endFunction

function ApplyDrunkLevel1()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell1, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_DrunkLevel1Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play drunk SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
endFunction

function ApplyDrunkLevel2(bool increasing)
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell2, false)
    ; suppress this message if hunger is increasing
    if _Seed_Setting_Notifications.GetValueInt() == 2 && increasing
        _Seed_DrunkLevel2Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play drunk SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
endFunction

function ApplyDrunkLevel3()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell3, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_DrunkLevel3Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play drunk SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
endFunction

function ApplyDrunkLevel4()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell4, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_DrunkLevel4Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play drunk SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
endFunction

function ApplyDrunkLevel5()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell5, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_DrunkLevel5Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play drunk SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
endFunction

function ApplyDrunkLevel6()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell6, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_DrunkLevel6Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play drunk SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
endFunction


bool function IsBetween(float fValue, float fUpperBound, float fLowerBound)
    if fValue <= fUpperBound && fValue > fLowerBound
        return true
    else
        return false
    endif
endFunction