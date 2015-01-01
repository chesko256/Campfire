scriptname _DE_Region9EffectScript extends ActiveMagicEffect

_DE_EPMonitor_1_6 property MainQuest auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MainQuest.IsInRegion9 = true
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	MainQuest.IsInRegion9 = false
endEvent