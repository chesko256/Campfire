scriptname _Frost_SneakEventScript extends ActiveMagicEffect

import FrostUtil

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	SendEvent_OnSneak()
EndEvent

function SendEvent_OnSneak()
	FallbackEventEmitter emitter = GetEventEmitter_OnSneak()
	int handle = emitter.Create("Frost_OnSneak")
	if handle
		emitter.Send(handle)
	endif
endFunction
