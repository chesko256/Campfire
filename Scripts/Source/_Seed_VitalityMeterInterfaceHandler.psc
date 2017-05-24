scriptname _Seed_VitalityMeterInterfaceHandler extends CommonMeterInterfaceHandler

import CampUtil

function RegisterForEvents()
	if !GetSKSELoaded()
		return
	endif
	
	RegisterForModEvent("LastSeed_ForceVitalityMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("LastSeed_RemoveVitalityMeter", "RemoveMeter")
	RegisterForModEvent("LastSeed_UpdateVitalityMeter", "UpdateMeterDelegate")
	RegisterForModEvent("LastSeed_CheckMeterRequirements", "CheckMeterRequirements")

	; Special Last Seed indicator element
	RegisterForModEvent("LastSeed_UpdateVitalityMeterIndicator", "UpdateMeterIndicator")
endFunction

Event UpdateMeterIndicator(float percent)
	(Meter as _Seed_Meter).SetIndicatorPercent(percent)
endEvent
