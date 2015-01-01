Scriptname _DE_WerewolfSwimStateScript extends activemagiceffect  

_DE_WaterDetect property WaterScript auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	WaterScript.SetSwimState(true)
endEvent
Event OnEffectFinish(Actor akTarget, Actor akCaster)
	WaterScript.SetSwimState(false)
endEvent