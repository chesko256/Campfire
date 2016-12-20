scriptname _Frost_RegionDetectScript extends ActiveMagicEffect

import FrostUtil
int property region_id auto
{The Region ID this effect reports on. See _Frost_ClimateSystem for ID.}
Quest property _Frost_System_Climate auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	(_Frost_System_Climate as _Frost_ClimateSystem).currentRegion = region_id
endEvent
