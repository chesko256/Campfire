scriptname CampCookingPot extends CampPlaceableObjectEx

import CampUtil
import _CampInternal

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
function Update()
	;@TODO: Rework into 'heat link' system
	ObjectReference heat = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HeatSources_Fire, self, 300.0)
	if heat != none && heat.IsEnabled()
		TryToEnableRef(myExtraActivator1, true)
	else
		TryToDisableRef(myExtraActivator1, true)
	endif
	if enable_update
		RegisterForSingleUpdate(3)
	endif
endFunction

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if myExtraActivator1.IsDisabled()
			_Camp_CookingPotError.Show()
			return
		else
			UseObject(akActionRef)
		endif
	endif
EndEvent

;@Overrides CampPlaceableObject
function PlaceObject_ExtraActivator1(CampPlaceableObjectEx Extended)
	myExtraActivator1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator1, Extended.PositionRef_ExtraActivator1, initially_disabled = true)
endFunction