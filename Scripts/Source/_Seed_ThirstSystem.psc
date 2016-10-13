scriptname _Seed_ThirstSystem extends Quest

;@TODO: Catch frost spell damage, which reduces stamina
;@TODO: Look for other sources of stamina damage

import Utility
import CampUtil

GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_ThirstSystemEnabled auto
GlobalVariable property _Seed_AttributeThirst auto
GlobalVariable property _Seed_ThirstRate auto                 ; Default - 1.25
GlobalVariable property _Seed_ThirstActionRate auto         ; Default - 0.25
GlobalVariable property _Seed_Setting_VampireBehavior auto
GlobalVariable property _Seed_Setting_Notifications auto
GlobalVariable property _Seed_Setting_NeedsMeterDisplayMode auto
GlobalVariable property _Seed_Setting_NeedsSFX auto
GlobalVariable property _Seed_Setting_NeedsVFX auto
GlobalVariable property _Seed_Setting_NeedsForceFeedback auto

Spell property _Seed_ThirstSpell1 auto
Spell property _Seed_ThirstSpell2 auto
Spell property _Seed_ThirstSpell3 auto
Spell property _Seed_ThirstSpell4 auto
Spell property _Seed_ThirstSpell5 auto
Spell property _Seed_ThirstSpell6 auto

Message property _Seed_ThirstLevel1Msg auto
Message property _Seed_ThirstLevel2Msg auto
Message property _Seed_ThirstLevel3Msg auto
Message property _Seed_ThirstLevel4Msg auto
Message property _Seed_ThirstLevel5Msg auto
Message property _Seed_ThirstLevel6Msg auto

Quest property _Seed_ThirstMeterQuest auto

Actor property PlayerRef auto

float property MAX_THIRST = 120.0 autoReadOnly
float property THIRST_LEVEL_5 = 100.0 autoReadOnly
float property THIRST_LEVEL_4 = 80.0 autoReadOnly
float property THIRST_LEVEL_3 = 60.0 autoReadOnly
float property THIRST_LEVEL_2 = 40.0 autoReadOnly
float property THIRST_LEVEL_1 = 20.0 autoReadOnly
float property MIN_THIRST = 0.0 autoReadOnly

float property update_interval = 0.25 auto hidden
float property last_update_time auto hidden
bool property was_sleeping = false auto hidden
float last_thirst = 0.0

Event OnInit()
    Initialize()
EndEvent

function Initialize()
    RegisterForSingleUpdateGameTime(update_interval)
    last_update_time = GetCurrentGameTime() * 24.0
    RegisterForSleep()

    ; Register for sprinting and jumping.
    RegisterForControl("Sprint")
    RegisterForAnimationEvent(PlayerRef, "PowerAttackStop")
    RegisterForAnimationEvent(PlayerRef, "00NextClip")

    ; Apply initial condition.
    IncreaseThirst(0.01)
endFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "PowerAttackStop" || asEventName == "00NextClip"
        debug.trace("[Seed] (Thirst) Player PowerAttacked")
        IncreaseThirst(0.25)
        int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
        if mode >= 1 && mode <= 3
            (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
        endif
    endif
EndEvent

function PlayerHit()
        debug.trace("[Seed] (Thirst) Player Blocked Attack")
        IncreaseThirst(0.1)
        int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
        if mode >= 1 && mode <= 2
                (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
        endif
endFunction

Event OnControlDown(string control)
    ; Increase Thirst while sprinting or when jumping.
    debug.trace("[Seed] (Thirst) Player Sprinting")
    RegisterForSingleUpdate(2)
    IncreaseThirst(_Seed_ThirstActionRate.GetValue())
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 3
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
    endif
EndEvent

Event OnUpdate()
    if PlayerRef.IsSprinting()
		    IncreaseThirst(_Seed_ThirstActionRate.GetValue())
        int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
        if mode >= 1 && mode <= 2
		        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
        endif
        RegisterForSingleUpdate(2)
    else
		    debug.trace("[Seed] (Thirst) Player Sprinting End")
    endif
EndEvent

Event OnUpdateGameTime()
    float rate = _Seed_ThirstRate.GetValue()
    float this_time = GetCurrentGameTime() * 24.0
    int cycles = Math.Floor((this_time - last_update_time) * 4)
    float thirst_increase
    if !was_sleeping
        thirst_increase = rate * cycles
    else
        was_sleeping = false
        thirst_increase = (rate * cycles) / 4
    endif

    if _Seed_Setting_VampireBehavior.GetValueInt() == 2 && IsPlayerUndead()
        thirst_increase /= 2
    endif

    IncreaseThirst(thirst_increase)
    last_update_time = this_time

    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode == 1
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
    endif

    if _Seed_VitalitySystemEnabled.GetValueInt() == 2
        RegisterForSingleUpdateGameTime(update_interval)
    endif
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
    was_sleeping = true
EndEvent

function IncreaseThirst(float amount)
    float current_thirst = _Seed_AttributeThirst.GetValue()
    if current_thirst + amount >= MAX_THIRST
        _Seed_AttributeThirst.SetValue(MAX_THIRST)
    else
        _Seed_AttributeThirst.SetValue(current_thirst + amount)
    endif
    (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).UpdateMeter((120.0 - _Seed_AttributeThirst.GetValue()) / 120)
endFunction

function DecreaseThirst(float amount)
    float current_thirst = _Seed_AttributeThirst.GetValue()
    if current_thirst - amount <= MIN_THIRST
        _Seed_AttributeThirst.SetValue(MIN_THIRST)
    else
        _Seed_AttributeThirst.SetValue(current_thirst - amount)
    endif
    (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).UpdateMeter((120.0 - _Seed_AttributeThirst.GetValue()) / 120)
endFunction

function ModThirst(float amount)
    float current_thirst = _Seed_AttributeThirst.GetValue()
    if current_thirst + amount >= MAX_THIRST
        _Seed_AttributeThirst.SetValue(MAX_THIRST)
    elseif current_thirst + amount <= MIN_THIRST
        _Seed_AttributeThirst.SetValue(MIN_THIRST)
    else
        _Seed_AttributeThirst.SetValue(current_thirst + amount)
    endif
    (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).UpdateMeter((120.0 - _Seed_AttributeThirst.GetValue()) / 120)
endFunction

function ApplyThirstEffects()
    float thirst = _Seed_AttributeThirst.GetValue()
    bool increasing = false
    if thirst > last_thirst
        increasing = true
    endif

    if !(IsBetween(last_thirst, 20.0, MIN_THIRST)) && (IsBetween(thirst, 20.0, MIN_THIRST))
        ApplyThirstLevel1()
    elseif !(IsBetween(last_thirst, 40.0, 20.0)) && (IsBetween(thirst, 40.0, 20.0))
        ApplyThirstLevel2(increasing)
    elseif !(IsBetween(last_thirst, 60.0, 40.0)) && (IsBetween(thirst, 60.0, 40.0))
        ApplyThirstLevel3()
    elseif !(IsBetween(last_thirst, 80.0, 60.0)) && (IsBetween(thirst, 80.0, 60.0))
        ApplyThirstLevel4()
    elseif !(IsBetween(last_thirst, 100.0, 80.0)) && (IsBetween(thirst, 100.0, 80.0))
        ApplyThirstLevel5()
    elseif !(IsBetween(last_thirst, 120.0, 100.0)) && (IsBetween(thirst, 120.0, 100.0))
        ApplyThirstLevel6()
    endif

    last_thirst = thirst
endFunction

function RemoveAllThirstEffects()
    PlayerRef.RemoveSpell(_Seed_ThirstSpell1)
    PlayerRef.RemoveSpell(_Seed_ThirstSpell2)
    PlayerRef.RemoveSpell(_Seed_ThirstSpell3)
    PlayerRef.RemoveSpell(_Seed_ThirstSpell4)
    PlayerRef.RemoveSpell(_Seed_ThirstSpell5)
    PlayerRef.RemoveSpell(_Seed_ThirstSpell6)
endFunction

function ApplyThirstLevel1()
    RemoveAllThirstEffects()
    PlayerRef.AddSpell(_Seed_ThirstSpell1, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_ThirstLevel1Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 4
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
    endif
endFunction

function ApplyThirstLevel2(bool increasing)
    RemoveAllThirstEffects()
    PlayerRef.AddSpell(_Seed_ThirstSpell2, false)
    ; suppress this message if thirst is increasing
    if _Seed_Setting_Notifications.GetValueInt() == 2 && increasing
        _Seed_ThirstLevel2Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 4
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
    endif
endFunction

function ApplyThirstLevel3()
    RemoveAllThirstEffects()
    PlayerRef.AddSpell(_Seed_ThirstSpell3, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_ThirstLevel3Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 4
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
    endif
endFunction

function ApplyThirstLevel4()
    RemoveAllThirstEffects()
    PlayerRef.AddSpell(_Seed_ThirstSpell4, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_ThirstLevel4Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 4
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
    endif
endFunction

function ApplyThirstLevel5()
    RemoveAllThirstEffects()
    PlayerRef.AddSpell(_Seed_ThirstSpell5, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_ThirstLevel5Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 4
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter(true)
    endif
endFunction

function ApplyThirstLevel6()
    RemoveAllThirstEffects()
    PlayerRef.AddSpell(_Seed_ThirstSpell6, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_ThirstLevel6Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 4
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter(true)
    endif
endFunction


bool function IsBetween(float fValue, float fUpperBound, float fLowerBound)
    if fValue <= fUpperBound && fValue > fLowerBound
        return true
    else
        return false
    endif
endFunction
