scriptname _Seed_HungerSystem extends Quest

import Utility

GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_AttributeHunger auto
GlobalVariable property _Seed_HungerRate auto 				; Default - 1.25
GlobalVariable property _Seed_HungerActionRate auto 		; Default - 0.25

float property MAX_HUNGER = 120.0 autoReadOnly
float property MIN_HUNGER = 0.0 autoReadOnly

float property update_interval = 0.5 auto hidden

float property last_update_time auto hidden

function Initialize()
    RegisterForSingleUpdateGameTime(update_interval)
    last_update_time = GetCurrentGameTime() * 24.0

    ; Increase Hunger when the player attacks.
    RegisterForActorAction(0)
    RegisterForActorAction(6)
endFunction

Event OnUpdateGameTime()
	float rate = _Seed_HungerRate.GetValue()
	float this_time = GetCurrentGameTime() * 24.0
	int cycles = Math.Floor((this_time - last_update_time) * 2)

    IncreaseHunger(rate * cycles)
    if _Seed_VitalitySystemEnabled.GetValueInt() == 2
        RegisterForSingleUpdateGameTime(update_interval)
    endif
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
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