scriptname _Camp_SetLegality extends ActiveMagicEffect

_Camp_LegalAreaCheck property Legal Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Legal.InIllegalArea = true
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Legal.InIllegalArea = false
EndEvent