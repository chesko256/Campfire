scriptname _Seed_ThirstSystem extends Quest

import Utility

GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_AttributeThirst auto
GlobalVariable property _Seed_ThirstRate auto 				; Default - 1.25
GlobalVariable property _Seed_ThirstActionRate auto 		; Default - 0.25
GlobalVariable property _Seed_Setting_VampireBehavior auto
Actor property PlayerRef auto
Keyword property ActorTypeUndead auto
Keyword property ImmuneParalysis auto

float property MAX_THIRST = 120.0 autoReadOnly
float property MIN_THIRST = 0.0 autoReadOnly

float property update_interval = 0.25 auto hidden
float property last_update_time auto hidden
bool property was_sleeping = false auto hidden

Event OnInit()
	Initialize()
EndEvent

function Initialize()
    RegisterForSingleUpdate(update_interval)
    last_update_time = GetCurrentGameTime() * 24.0
    RegisterForSleep()

    ; Register for sprinting and jumping.
    RegisterForControl("Sprint")
    RegisterForAnimationEvent(PlayerRef, "JumpUp")
    RegisterForAnimationEvent(PlayerRef, "PowerAttackStop")
    RegisterForAnimationEvent(PlayerRef, "SoundPlay.NPCHumanCombatShieldBash")
endFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == "JumpUp"
		debug.trace("[Seed] Player Jumped")
		IncreaseThirst(0.1)
	elseif asEventName == "PowerAttackStop"
		debug.trace("[Seed] Player PowerAttacked")
		IncreaseThirst(0.25)
	elseif asEventName == "SoundPlay.NPCHumanCombatShieldBash"
		debug.trace("[Seed] Player Blocked Attack")
		IncreaseThirst(0.1)
	endif
EndEvent

Event OnControlDown(string control)
	; Increase Thirst while sprinting or when jumping.
	if control == "Sprint"
		debug.trace("[Seed] Player Sprinting")
		RegisterForSingleUpdate(2)
	endif
	IncreaseThirst(_Seed_ThirstActionRate.GetValue())
EndEvent

Event OnUpdate()
	if PlayerRef.IsSprinting()
		IncreaseThirst(_Seed_ThirstActionRate.GetValue())
		RegisterForSingleUpdate(2)
	else
		debug.trace("[Seed] Player Sprinting End")
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
endFunction

function DecreaseThirst(float amount)
	float current_thirst = _Seed_AttributeThirst.GetValue()
	if current_thirst - amount <= MIN_THIRST
		_Seed_AttributeThirst.SetValue(MIN_THIRST)
	else
		_Seed_AttributeThirst.SetValue(current_thirst - amount)
	endif
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
endFunction

bool function IsUndead()
	; Is player humanoid Vampire, undead, or transformed Vampire Lord?
	if PlayerRef.GetRace().HasKeyword(ActorTypeUndead) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
		return true
	else
		return false
	endif
endFunction