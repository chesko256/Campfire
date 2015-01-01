scriptname _DE_Region1EffectScript extends ActiveMagicEffect

_DE_EPMonitor_1_6 property MainQuest auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MainQuest.IsInRegion1 = true
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	MainQuest.IsInRegion1 = false
endEvent