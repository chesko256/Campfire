scriptname _Frost_ArmorSpellUpdateWarmth extends ActiveMagicEffect

import FrostUtil

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SendEvent_UpdateWarmth()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	SendEvent_UpdateWarmth()
EndEvent

function SendEvent_UpdateWarmth()
    FallbackEventEmitter warmthEvent = GetEventEmitter_UpdateWarmth()
    int handle = warmthEvent.Create("Frost_UpdateWarmth")
    if handle
        warmthEvent.Send(handle)
    endif
endFunction