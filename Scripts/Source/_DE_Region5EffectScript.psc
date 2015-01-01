scriptname _DE_Region5EffectScript extends ActiveMagicEffect

_DE_EPMonitor_1_6 property MainQuest auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MainQuest.IsInRegion5 = true
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	MainQuest.IsInRegion5 = false
endEvent