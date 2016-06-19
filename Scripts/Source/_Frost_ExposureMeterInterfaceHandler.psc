scriptname _Frost_ExposureMeterInterfaceHandler extends CommonMeterInterfaceHandler

function RegisterForEvents()
	RegisterForModEvent("Frostfall_ForceExposureMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("Frostfall_RemoveExposureMeter", "RemoveMeter")
	RegisterForModEvent("Frostfall_UpdateExposureMeter", "UpdateMeterDelegate")
	RegisterForModEvent("Frostfall_CheckMeterRequirements", "CheckMeterRequirements")
endFunction
