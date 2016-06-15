scriptname _Frost_WeatherMeterInterfaceHandler extends CommonMeterInterfaceHandler

function RegisterForEvents()
	RegisterForModEvent("Frostfall_ForceWeathersenseMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("Frostfall_RemoveWeathersenseMeter", "RemoveMeter")
	RegisterForModEvent("Frostfall_UpdateWeathersenseMeter", "UpdateMeterDelegate")
	RegisterForModEvent("Frostfall_CheckMeterRequirements", "CheckMeterRequirements")
endFunction