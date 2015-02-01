scriptname CampCookingPot extends CampPlaceableObjectEx

import CampUtil

bool enable_update = false

FormList property _DE_HeatSources_All auto
message property _DE_CookingPotError auto

Event OnCellAttach()
	enable_update = true
	RegisterForSingleUpdate(3)
endEvent

Event OnCellDetach()
	enable_update = false
EndEvent

Event OnUpdate()
	ObjectReference heat = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_All, self, 300.0)
	if heat != none && heat.IsEnabled()
		TryToEnableRef(myExtraActivator1, true)
	else
		TryToDisableRef(myExtraActivator1, true)
	endif
	if enable_update
		RegisterForSingleUpdate(3)
	endif
endEvent

;Overrides CampPlaceableObject
function UseObject(ObjectReference akActionRef)
	if myExtraActivator1.IsEnabled()
		self.BlockActivation(false)
		self.Activate(akActionRef)
		utility.wait(0.1)
		self.BlockActivation(true)
	else
		_DE_CookingPotError.Show()
	endif
endFunction