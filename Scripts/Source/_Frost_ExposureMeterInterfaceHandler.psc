scriptname _Frost_ExposureMeterInterfaceHandler extends CommonMeterInterfaceHandler

import CampUtil

function RegisterForEvents()
	if !GetSKSELoaded()
		return
	endif
	
	RegisterForModEvent("Frostfall_ForceExposureMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("Frostfall_RemoveExposureMeter", "RemoveMeter")
	RegisterForModEvent("Frostfall_UpdateExposureMeter", "UpdateMeterDelegate")
	RegisterForModEvent("Frostfall_CheckMeterRequirements", "CheckMeterRequirements")

	; Special Frostfall indicator element
	RegisterForModEvent("Frostfall_UpdateExposureMeterIndicator", "UpdateMeterIndicator")

	; Special Frostfall glow
	RegisterForModEvent("Frostfall_SetExposureMeterGlow", "SetExposureMeterGlow")
endFunction

Event UpdateMeterIndicator(float percent)
	(Meter as _Frost_Meter).SetIndicatorPercent(percent)
endEvent

Event SetExposureMeterGlow(float percent)
	(Meter as _Frost_Meter).SetGlow(percent)
endEvent