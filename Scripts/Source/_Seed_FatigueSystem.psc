scriptname _Seed_FatigueSystem extends Quest

;@TODO: Catch shock spell damage, which reduces magicka
;@TODO: Look for other sources of magicka damage

import Utility
import CampUtil

GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_AttributeFatigue auto
GlobalVariable property _Seed_FatigueRate auto 							; Default - 1.66
GlobalVariable property _Seed_FatigueActionRateMasterSpells auto 		; Default - 10.0
GlobalVariable property _Seed_FatigueActionRateExpertSpells auto 		; Default - 2.0
GlobalVariable property _Seed_FatigueActionRateAdeptSpells auto 		; Default - 1.0
GlobalVariable property _Seed_FatigueActionRateApprenticeSpells auto 	; Default - 0.5
GlobalVariable property _Seed_Setting_VampireBehavior auto
GlobalVariable property _Seed_Setting_Notifications auto
GlobalVariable property _Seed_Setting_NeedsMeterDisplayMode auto
GlobalVariable property _Seed_Setting_NeedsSFX auto
GlobalVariable property _Seed_Setting_NeedsVFX auto
GlobalVariable property _Seed_Setting_NeedsForceFeedback auto

Spell property _Seed_FatigueSpell1 auto
Spell property _Seed_FatigueSpell2 auto
Spell property _Seed_FatigueSpell3 auto
Spell property _Seed_FatigueSpell4 auto
Spell property _Seed_FatigueSpell5 auto
Spell property _Seed_FatigueSpell6 auto

Message property _Seed_FatigueLevel1Msg auto
Message property _Seed_FatigueLevel2Msg auto
Message property _Seed_FatigueLevel3Msg auto
Message property _Seed_FatigueLevel4Msg auto
Message property _Seed_FatigueLevel5Msg auto
Message property _Seed_FatigueLevel6Msg auto

Quest property _Seed_FatigueMeterQuest auto

Actor property PlayerRef auto

float property MAX_FATIGUE = 120.0 autoReadOnly
float property FATIGUE_LEVEL_5 = 100.0 autoReadOnly
float property FATIGUE_LEVEL_4 = 80.0 autoReadOnly
float property FATIGUE_LEVEL_3 = 60.0 autoReadOnly
float property FATIGUE_LEVEL_2 = 40.0 autoReadOnly
float property FATIGUE_LEVEL_1 = 20.0 autoReadOnly
float property MIN_FATIGUE = 0.0 autoReadOnly

float property MAX_FATIGUE = 120.0 autoReadOnly
float property MIN_FATIGUE = 0.0 autoReadOnly
float property SLEEP_RESTORE_RATE = 3.0 autoReadOnly

float property update_interval = 1.0 auto hidden
float property last_update_time auto hidden
bool property was_sleeping = false auto hidden
float last_sleep_duration
int locks_picked

Event OnInit()
	Initialize()
EndEvent

function Initialize()
    RegisterForSingleUpdateGameTime(update_interval)
    last_update_time = GetCurrentGameTime() * 24.0
    RegisterForSleep()

    ; Increase fatigue on archery attacks and lockpicking.
    RegisterForTrackedStatsEvent()
    RegisterForActorAction(6)
endFunction

Event OnTrackedStatsEvent(string arStatName, int aiStatValue)
	if arStatName == "Locks Picked" && aiStatValue > locks_picked
		debug.trace("[Seed] (Fatigue) Lock Picked")
		locks_picked = aiStatValue
		IncreaseFatigue(1.0)
		int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
		if mode >= 1 && mode <= 2
        	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    	endif
	endif
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	if akActor == PlayerRef
		debug.trace("[Seed] (Fatigue) Archery Attack")
		IncreaseFatigue(0.2)
		int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
		if mode >= 1 && mode <= 2
        	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    	endif
	endif
EndEvent

Event OnUpdateGameTime()
	if was_sleeping
		was_sleeping = false
		return
	endif

	if _Seed_Setting_VampireBehavior.GetValueInt() == 2 && IsPlayerUndead()
		return
	endif

	float rate = _Seed_FatigueRate.GetValue()
	float this_time = GetCurrentGameTime() * 24.0
	int cycles = Math.Floor((this_time - last_update_time))
	float fatigue_increase = rate * cycles

    IncreaseFatigue(fatigue_increase)
    last_update_time = this_time

    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode == 1
        (_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    endif

    if _Seed_VitalitySystemEnabled.GetValueInt() == 2
        RegisterForSingleUpdateGameTime(update_interval)
    endif
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	was_sleeping = true
	last_sleep_duration = (afDesiredSleepEndTime - afSleepStartTime) * 24.0
EndEvent

Event OnSleepStop(bool abInterrupted)
	;@TODO: Modify by current hunger and thirst.
	float fatigue_decrease = last_sleep_duration * SLEEP_RESTORE_RATE
	DecreaseFatigue(fatigue_decrease)
EndEvent

function SpellCast(Spell akSpell)
	;@TODO: Increase Fatigue during concentration spell cast
	if akSpell
		int mag_level = (akSpell.GetNthEffectMagicEffect(akSpell.GetCostliestEffectIndex())).GetSkillLevel()
		if mag_level >= 100
			IncreaseFatigue(_Seed_FatigueActionRateMasterSpells.GetValue())
		elseif mag_level >= 75
			IncreaseFatigue(_Seed_FatigueActionRateExpertSpells.GetValue())
		elseif mag_level >= 50
			IncreaseFatigue(_Seed_FatigueActionRateAdeptSpells.GetValue())
		elseif mag_level >= 25
			IncreaseFatigue(_Seed_FatigueActionRateApprenticeSpells.GetValue())
		elseif mag_level < 25
			IncreaseFatigue(_Seed_FatigueActionRateNoviceSpells.GetValue())
		endif
		int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
		if mode >= 1 && mode <= 3
        	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    	endif
	endif
endFunction

function IncreaseFatigue(float amount)
	float current_fatigue = _Seed_AttributeFatigue.GetValue()
	if current_fatigue + amount >= MAX_FATIGUE
		_Seed_AttributeFatigue.SetValue(MAX_FATIGUE)
	else
		_Seed_AttributeFatigue.SetValue(current_fatigue + amount)
	endif
	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).UpdateMeter((120.0 - _Seed_AttributeFatigue.GetValue()) / 120)
endFunction

function DecreaseFatigue(float amount)
	float current_fatigue = _Seed_AttributeFatigue.GetValue()
	if current_fatigue - amount <= MIN_FATIGUE
		_Seed_AttributeFatigue.SetValue(MIN_FATIGUE)
	else
		_Seed_AttributeFatigue.SetValue(current_fatigue - amount)
	endif
	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).UpdateMeter((120.0 - _Seed_AttributeFatigue.GetValue()) / 120)
endFunction

function ModFatigue(float amount)
	float current_fatigue = _Seed_AttributeFatigue.GetValue()
	if current_fatigue + amount >= MAX_FATIGUE
		_Seed_AttributeFatigue.SetValue(MAX_FATIGUE)
	elseif current_fatigue + amount <= MIN_FATIGUE
		_Seed_AttributeFatigue.SetValue(MIN_FATIGUE)
	else
		_Seed_AttributeFatigue.SetValue(current_fatigue + amount)
	endif
	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).UpdateMeter((120.0 - _Seed_AttributeFatigue.GetValue()) / 120)
endFunction

function ApplyFatigueEffects()
    float fatigue = _Seed_AttributeFatigue.GetValue()
    bool increasing = false
    if fatigue > last_fatigue
        increasing = true
    endif

    if !(IsBetween(last_fatigue, FATIGUE_LEVEL_1, MIN_FATIGUE)) && (IsBetween(fatigue, FATIGUE_LEVEL_1, MIN_FATIGUE))
        ApplyFatigueLevel1()
    elseif !(IsBetween(last_fatigue, FATIGUE_LEVEL_2, FATIGUE_LEVEL_1)) && (IsBetween(fatigue, FATIGUE_LEVEL_2, FATIGUE_LEVEL_1))
        ApplyFatigueLevel2(increasing)
    elseif !(IsBetween(last_fatigue, FATIGUE_LEVEL_3, FATIGUE_LEVEL_2)) && (IsBetween(fatigue, FATIGUE_LEVEL_3, FATIGUE_LEVEL_2))
        ApplyFatigueLevel3()
    elseif !(IsBetween(last_fatigue, FATIGUE_LEVEL_4, FATIGUE_LEVEL_3)) && (IsBetween(fatigue, FATIGUE_LEVEL_4, FATIGUE_LEVEL_3))
        ApplyFatigueLevel4()
    elseif !(IsBetween(last_fatigue, FATIGUE_LEVEL_5, FATIGUE_LEVEL_4)) && (IsBetween(fatigue, FATIGUE_LEVEL_5, FATIGUE_LEVEL_4))
        ApplyFatigueLevel5()
    elseif !(IsBetween(last_fatigue, MAX_FATIGUE, FATIGUE_LEVEL_5)) && (IsBetween(fatigue, MAX_FATIGUE, FATIGUE_LEVEL_5))
        ApplyFatigueLevel6()
    endif

    last_fatigue = fatigue
endFunction

function RemoveAllFatigueEffects()
    PlayerRef.RemoveSpell(_Seed_FatigueSpell1)
    PlayerRef.RemoveSpell(_Seed_FatigueSpell2)
    PlayerRef.RemoveSpell(_Seed_FatigueSpell3)
    PlayerRef.RemoveSpell(_Seed_FatigueSpell4)
    PlayerRef.RemoveSpell(_Seed_FatigueSpell5)
    PlayerRef.RemoveSpell(_Seed_FatigueSpell6)
endFunction

function ApplyFatigueLevel1()
    RemoveAllFatigueEffects()
    PlayerRef.AddSpell(_Seed_FatigueSpell1, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_FatigueLevel1Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 4
        (_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    endif
endFunction

function ApplyFatigueLevel2(bool increasing)
    RemoveAllFatigueEffects()
    PlayerRef.AddSpell(_Seed_FatigueSpell2, false)
    ; suppress this message if fatigue is increasing
    if _Seed_Setting_Notifications.GetValueInt() == 2 && increasing
        _Seed_FatigueLevel2Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 4
        (_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    endif
endFunction

function ApplyFatigueLevel3()
    RemoveAllFatigueEffects()
    PlayerRef.AddSpell(_Seed_FatigueSpell3, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_FatigueLevel3Msg.Show()
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
        (_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    endif
endFunction

function ApplyFatigueLevel4()
    RemoveAllFatigueEffects()
    PlayerRef.AddSpell(_Seed_FatigueSpell4, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_FatigueLevel4Msg.Show()
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
        (_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    endif
endFunction

function ApplyFatigueLevel5()
    RemoveAllFatigueEffects()
    PlayerRef.AddSpell(_Seed_FatigueSpell5, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_FatigueLevel5Msg.Show()
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
        (_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter(true)
    endif
endFunction

function ApplyFatigueLevel6()
    RemoveAllFatigueEffects()
    PlayerRef.AddSpell(_Seed_FatigueSpell6, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_FatigueLevel6Msg.Show()
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
        (_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter(true)
    endif
endFunction


bool function IsBetween(float fValue, float fUpperBound, float fLowerBound)
    if fValue <= fUpperBound && fValue > fLowerBound
        return true
    else
        return false
    endif
endFunction
