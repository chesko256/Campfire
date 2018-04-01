scriptname _Seed_IntensityVitalityCheck extends ActiveMagicEffect

import SeedUtil

Message property _Seed_IntensityErrorNoVitality auto
Sound property MAGFail auto
Actor property PlayerRef auto
Spell property _Seed_Intensity auto
Keyword property _Seed_IntensityKeyword auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	float vitality = GetPlayerVitality()

	if vitality < 31.0
		_Seed_IntensityErrorNoVitality.Show()
		GetVitalitySystem().SendEvent_ForceAttributeMeterDisplay(true)
		int i = MAGFail.Play(PlayerRef)
		return
	endif

	if PlayerRef.HasEffectKeyword(_Seed_IntensityKeyword)
		int i = MAGFail.Play(PlayerRef)
		return
	endif

	_Seed_Intensity.Cast(PlayerRef, PlayerRef)
EndEvent
