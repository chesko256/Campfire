scriptname _Seed_CheckNeeds extends ActiveMagicEffect

import SeedUtil

Event OnEffectStart(Actor akTarget, Actor akCaster)
	GetHungerSystem().DisplayCurrentStatus()
	;GetThirstSystem().DisplayCurrentStatus()
	;GetFatigueSystem().DisplayCurrentStatus()
	GetVitalitySystem().DisplayCurrentStatus()
EndEvent