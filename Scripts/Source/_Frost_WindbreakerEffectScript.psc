scriptname _Frost_WindbreakerEffectScript extends ActiveMagicEffect

import FrostUtil
import _FrostInternal

Event OnEffectStart(Actor akTarget, Actor akCaster)
	utility.waitmenumode(0.3)
	GetCoverageSystem().windbreaker_perk_active = true
	SendEvent_UpdateCoverage()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	utility.waitmenumode(0.3)
	GetCoverageSystem().windbreaker_perk_active = false
	SendEvent_UpdateCoverage()
EndEvent

function SendEvent_UpdateCoverage()
    FrostDebug(0, "Sending event Frost_UpdateCoverage")
    int handle = ModEvent.Create("Frost_UpdateCoverage")
    if handle
        ModEvent.Send(handle)
    endif
endFunction