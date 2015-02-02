scriptname CampCookingPot extends CampPlaceableObjectEx

import CampUtil

bool enable_update = false

FormList property _Camp_HeatSources_Fire auto
message property _Camp_CookingPotError auto

Event OnCellAttach()
	enable_update = true
	RegisterForSingleUpdate(3)
endEvent

Event OnCellDetach()
	enable_update = false
EndEvent

;myExtraActivator1 = _Camp_CookingPot_Steam
Event OnUpdate()
	ObjectReference heat = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HeatSources_Fire, self, 300.0)
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
		_Camp_CookingPotError.Show()
	endif
endFunction

;Overrides CampPlaceableObject
function PlaceObject_ExtraActivator1(CampPlaceableObjectEx Extended)
	myExtraActivator1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator1, Extended.PositionRef_ExtraActivator1, initially_disabled = true)
endFunction