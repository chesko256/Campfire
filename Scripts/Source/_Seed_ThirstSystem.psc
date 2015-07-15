scriptname _Seed_ThirstSystem extends Quest

;@TODO: Catch frost spell damage, which reduces stamina
;@TODO: Look for other sources of stamina damage

import Utility

GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_Setting_NeedsMeterDisplayMode auto
GlobalVariable property _Seed_AttributeThirst auto
GlobalVariable property _Seed_ThirstRate auto 				; Default - 1.25
GlobalVariable property _Seed_ThirstActionRate auto 		; Default - 0.25
GlobalVariable property _Seed_Setting_VampireBehavior auto
Actor property PlayerRef auto
Keyword property ActorTypeUndead auto
Keyword property ImmuneParalysis auto

Quest property _Seed_ThirstMeterQuest auto

float property MAX_THIRST = 120.0 autoReadOnly
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

function PlayerHit(bool abBlocked)
	if abBlocked
		debug.trace("[Seed] (Thirst) Player Blocked Attack")
		IncreaseThirst(0.1)
		int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
		if mode >= 1 && mode <= 2
			(_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
		endif
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

	if _Seed_Setting_VampireBehavior.GetValueInt() == 2 && IsUndead()
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

bool function IsUndead()
	; Is player humanoid Vampire, undead, or transformed Vampire Lord?
	if PlayerRef.GetRace().HasKeyword(ActorTypeUndead) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
		return true
	else
		return false
	endif
endFunction