scriptname _Frost_SwimEvent extends ActiveMagicEffect

import FrostUtil

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SendEvent_OnPlayerStartSwimming()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; Wait to ensure that this is sent last, the Start event
	; can send many duplicates.
	utility.wait(1.0)
	SendEvent_OnPlayerStopSwimming()
EndEvent