scriptname _Frost_WellInsulatedEffectScript extends ActiveMagicEffect

import FrostUtil
import _FrostInternal

Event OnEffectStart(Actor akTarget, Actor akCaster)
	utility.waitmenumode(0.3)
	GetWarmthSystem().well_insulated_perk_active = true
	SendEvent_UpdateWarmth()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	utility.waitmenumode(0.3)
	GetWarmthSystem().well_insulated_perk_active = false
	SendEvent_UpdateWarmth()
EndEvent

function SendEvent_UpdateWarmth()
    FrostDebug(0, "Sending event Frost_UpdateWarmth")
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
endFunction