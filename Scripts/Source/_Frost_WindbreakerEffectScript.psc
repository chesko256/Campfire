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
	FallbackEventEmitter emitter = GetEventEmitter_UpdateCoverage()
    int handle = emitter.Create("Frost_UpdateCoverage")
    if handle
    	emitter.PushBool(handle, false)
        emitter.Send(handle)
    endif
endFunction