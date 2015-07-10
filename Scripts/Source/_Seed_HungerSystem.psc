scriptname _Seed_HungerSystem extends Quest

import Utility

GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_AttributeHunger auto
GlobalVariable property _Seed_HungerRate auto 				; Default - 1.25
GlobalVariable property _Seed_HungerActionRate auto 		; Default - 0.25
GlobalVariable property _Seed_VampireBehavior auto
Actor property PlayerRef auto
Keyword property ActorTypeUndead auto
Keyword property ImmuneParalysis auto

float property MAX_HUNGER = 120.0 autoReadOnly
float property MIN_HUNGER = 0.0 autoReadOnly

float property update_interval = 0.5 auto hidden
float property last_update_time auto hidden
bool property was_sleeping = false auto hidden

function Initialize()
    RegisterForSingleUpdateGameTime(update_interval)
    last_update_time = GetCurrentGameTime() * 24.0
    RegisterForSleep()

    ; Register for weapon swings and bow attacks.
    RegisterForActorAction(0)
    RegisterForActorAction(6)
endFunction

Event OnUpdateGameTime()
	if _Seed_VampireBehavior.GetValueInt() == 2 && IsUndead()
		return
	endif

	float rate = _Seed_HungerRate.GetValue()
	float this_time = GetCurrentGameTime() * 24.0
	int cycles = Math.Floor((this_time - last_update_time) * 2)
	float hunger_increase
	if !was_sleeping
		hunger_increase = rate * cycles
	else
		was_sleeping = false
		hunger_increase = (rate * cycles) / 4
	endif

    IncreaseHunger(hunger_increase)
    last_update_time = this_time
    if _Seed_VitalitySystemEnabled.GetValueInt() == 2
        RegisterForSingleUpdateGameTime(update_interval)
    endif
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	was_sleeping = true
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	; Increase Hunger when the player attacks.
	IncreaseHunger(_Seed_HungerActionRate.GetValue())
EndEvent

function IncreaseHunger(float amount)
	float current_hunger = _Seed_AttributeHunger.GetValue()
	if current_hunger + amount >= MAX_HUNGER
		_Seed_AttributeHunger.SetValue(MAX_HUNGER)
	else
		_Seed_AttributeHunger.SetValue(current_hunger + amount)
	endif
endFunction

function DecreaseHunger(float amount)
	float current_hunger = _Seed_AttributeHunger.GetValue()
	if current_hunger - amount <= MIN_HUNGER
		_Seed_AttributeHunger.SetValue(MIN_HUNGER)
	else
		_Seed_AttributeHunger.SetValue(current_hunger - amount)
	endif
endFunction

function ModHunger(float amount)
	float current_hunger = _Seed_AttributeHunger.GetValue()
	if current_hunger + amount >= MAX_HUNGER
		_Seed_AttributeHunger.SetValue(MAX_HUNGER)
	elseif current_hunger + amount <= MIN_HUNGER
		_Seed_AttributeHunger.SetValue(MIN_HUNGER)
	else
		_Seed_AttributeHunger.SetValue(current_hunger + amount)
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