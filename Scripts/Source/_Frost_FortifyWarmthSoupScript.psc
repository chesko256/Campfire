scriptname _Frost_FortifyWarmthSoupScript extends ActiveMagicEffect

import FrostUtil

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FallbackEventEmitter emitter = GetEventEmitter_SoupEffectStart()
	int handle = emitter.Create("Frost_SoupEffectStart")
    if handle
        emitter.Send(handle)
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	FallbackEventEmitter emitter = GetEventEmitter_SoupEffectStop()
	int handle = emitter.Create("Frost_SoupEffectStop")
    if handle
        emitter.Send(handle)
    endif
EndEvent