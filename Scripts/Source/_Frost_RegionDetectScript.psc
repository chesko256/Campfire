scriptname _Frost_RegionDetectScript extends ActiveMagicEffect

import FrostUtil
int property region_id auto
{The Region ID this effect reports on. See _Frost_ClimateSystem for ID.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SendEvent_OnTamrielRegionChange(region_id, true)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	SendEvent_OnTamrielRegionChange(region_id, false)
endEvent

function SendEvent_OnTamrielRegionChange(int region, bool in_region)
	FallbackEventEmitter emitter = GetEventEmitter_OnTamrielRegionChange()
	int handle = emitter.Create("Frost_OnTamrielRegionChange")
	if handle
		emitter.PushInt(handle, region)
		emitter.PushBool(handle, in_region)
		emitter.Send(handle)
	endif
endFunction
