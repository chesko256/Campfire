scriptname _Frost_WetnessMeterInterfaceHandler extends CommonMeterInterfaceHandler

import CampUtil

function RegisterForEvents()
	if !GetSKSELoaded()
		return
	endif

	RegisterForModEvent("Frostfall_ForceWetnessMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("Frostfall_RemoveWetnessMeter", "RemoveMeter")
	RegisterForModEvent("Frostfall_UpdateWetnessMeter", "UpdateMeterDelegate")
	RegisterForModEvent("Frostfall_CheckMeterRequirements", "CheckMeterRequirements")
endFunction