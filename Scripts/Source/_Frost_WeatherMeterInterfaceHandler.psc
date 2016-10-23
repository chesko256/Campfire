scriptname _Frost_WeatherMeterInterfaceHandler extends CommonMeterInterfaceHandler

import CampUtil

function RegisterForEvents()
	if !GetSKSELoaded()
		return
	endif
	
	RegisterForModEvent("Frostfall_ForceWeathersenseMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("Frostfall_RemoveWeathersenseMeter", "RemoveMeter")
	RegisterForModEvent("Frostfall_UpdateWeathersenseMeter", "UpdateMeterDelegate")
	RegisterForModEvent("Frostfall_CheckMeterRequirements", "CheckMeterRequirements")
endFunction