scriptname _Frost_WellInsulatedEffectScript extends ActiveMagicEffect

import FrostUtil
import _FrostInternal

Event OnEffectStart(Actor akTarget, Actor akCaster)
	utility.waitmenumode(0.3)
	GetWarmthSystem().well_insulated_perk_active = true
	SendEvent_UpdateWarmth(false)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	utility.waitmenumode(0.3)
	GetWarmthSystem().well_insulated_perk_active = false
	SendEvent_UpdateWarmth(false)
EndEvent

function SendEvent_UpdateWarmth(bool abDisplayTextUpdate)
	FallbackEventEmitter emitter = GetEventEmitter_UpdateWarmth()
    int handle = emitter.Create("Frost_UpdateWarmth")
    if handle
    	emitter.PushBool(handle, abDisplayTextUpdate)
        emitter.Send(handle)
    endif
endFunction