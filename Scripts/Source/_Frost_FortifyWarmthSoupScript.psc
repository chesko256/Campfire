scriptname _Frost_FortifyWarmthSoupScript extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int handle = ModEvent.Create("Frost_SoupEffectStart")
    if handle
        ModEvent.Send(handle)
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	int handle = ModEvent.Create("Frost_SoupEffectStop")
    if handle
        ModEvent.Send(handle)
    endif
EndEvent