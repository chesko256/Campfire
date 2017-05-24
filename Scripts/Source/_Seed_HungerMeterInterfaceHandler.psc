scriptname _Seed_HungerMeterInterfaceHandler extends CommonMeterInterfaceHandler

import CampUtil

function RegisterForEvents()
	if !GetSKSELoaded()
		return
	endif

	RegisterForModEvent("LastSeed_ForceHungerMeterDisplay", "ForceMeterDisplay")
	RegisterForModEvent("LastSeed_RemoveHungerMeter", "RemoveMeter")
	RegisterForModEvent("LastSeed_UpdateHungerMeter", "UpdateMeterDelegate")
	RegisterForModEvent("LastSeed_CheckMeterRequirements", "CheckMeterRequirements")
endFunction