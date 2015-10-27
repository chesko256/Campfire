scriptname _Frost_WellInsulatedEffectScript extends ActiveMagicEffect

import FrostUtil
import _FrostInternal

Event OnEffectStart(Actor akTarget, Actor akCaster)
	utility.waitmenumode(0.3)
	int warmth = GetClothingSystem().GetArmorWarmth()
	GetWarmthSystem().current_wellinsulated_bonus = Math.Ceiling(warmth * 0.25)
	SendEvent_UpdateWarmth()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	utility.waitmenumode(0.3)
	GetWarmthSystem().current_wellinsulated_bonus = 0
	SendEvent_UpdateWarmth()
EndEvent

function SendEvent_UpdateWarmth()
    FrostDebug(0, "Sending event Frost_UpdateWarmth")
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
endFunction