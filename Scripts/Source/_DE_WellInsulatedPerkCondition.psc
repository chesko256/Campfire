scriptname _DE_WellInsulatedPerkCondition extends ActiveMagicEffect

import debug

GlobalVariable property _DE_WellInsulatedApplied auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;trace("[Frostfall]Well insulated perk applied")
	_DE_WellInsulatedApplied.SetValue(2.0)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;trace("[Frostfall]Well insulated perk removed")
	_DE_WellInsulatedApplied.SetValue(1.0)
endEvent
