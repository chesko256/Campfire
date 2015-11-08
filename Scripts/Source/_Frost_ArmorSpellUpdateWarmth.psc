scriptname _Frost_ArmorSpellUpdateWarmth extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SendEvent_UpdateWarmth()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	SendEvent_UpdateWarmth()
EndEvent

function SendEvent_UpdateWarmth()
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
endFunction