scriptname _Frost_SwimEvent extends ActiveMagicEffect

import FrostUtil

GlobalVariable property _Frost_FrigidWater_ForceKillPlayer auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SendEvent_OnPlayerStartSwimming()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; Wait to ensure that this is sent last, the Start event
	; can send many duplicates.
	utility.wait(1.0)
	SendEvent_OnPlayerStopSwimming()

	; Always make sure this is reset when we get out of the water.
	_Frost_FrigidWater_ForceKillPlayer.SetValueInt(1)
EndEvent