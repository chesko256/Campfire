scriptname _Seed_IntensityVitalityFinish extends ActiveMagicEffect

import SeedUtil

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Utility.Wait(1)
	GetVitalitySystem().DecreaseAttribute(30.0)
EndEvent