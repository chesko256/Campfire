scriptname _DE_Region6EffectScript extends ActiveMagicEffect

_DE_EPMonitor_1_6 property MainQuest auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MainQuest.IsInRegion6 = true
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	MainQuest.IsInRegion6 = false
endEvent