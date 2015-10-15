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
	int handle = ModEvent.Create("Frost_OnTamrielRegionChange")
	if handle
		ModEvent.PushInt(handle, region)
		ModEvent.PushBool(handle, in_region)
		ModEvent.Send(handle)
	endif
endFunction