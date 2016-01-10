scriptname CampCookingPot extends CampPlaceableObjectEx

import CampUtil
import _CampInternal

bool enable_update = false

FormList property _Camp_HeatSources_Fire auto
FormList property _Camp_HeatSources_Fire_Small auto
message property _Camp_CookingPotError auto
message property _Camp_CookingPotErrorNotification auto

function Initialize()
	parent.Initialize()
	enable_update = true
	RegisterForSingleUpdate(3)
endFunction

Event OnCellAttach()
	CampDebug(0, "Cooking pot attached, updating.")
	enable_update = true
	RegisterForSingleUpdate(3)
endEvent

Event OnCellDetach()
	CampDebug(0, "Cooking pot detached.")
	enable_update = false
EndEvent

function Update()
	if enable_update
		CampDebug(0, "Cooking pot checking for heat...")
		;@TODO: Rework into 'heat link' system
		ObjectReference heat = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HeatSources_Fire, self, 300.0)
		if heat != none  && !(_Camp_HeatSources_Fire_Small.HasForm(heat.GetBaseObject())) && heat.IsEnabled()
			TryToEnableRef(myExtraActivator1, true)
		else
			TryToDisableRef(myExtraActivator1, true)
		endif
		RegisterForSingleUpdate(3)
	endif
endFunction

Event OnActivate(ObjectReference akActionRef)
	if !initialized
		return
	endif
	if akActionRef == Game.GetPlayer()
		if myExtraActivator1.IsDisabled()
			if Setting_BypassMenu
				_Camp_CookingPotErrorNotification.Show()
			else
				int i = _Camp_CookingPotError.Show()
				if i == 0
					PickUp()
				else
					;pass
				endif
			endif
		else
			UseObject(akActionRef)
		endif
	endif
EndEvent

;@Overrides CampPlaceableObjectEx
function PickUp()
	enable_update = false
	UnregisterForUpdate()
	parent.PickUp()
endFunction

;@Overrides CampPlaceableObjectEx
function TakeDown()
	CampDebug(0, "CampCookingPot taking down " + self)
	enable_update = false
	UnregisterForUpdate()
	parent.TakeDown()
endFunction

; myExtraActivator1 = _Camp_CookingPot_Steam
;@Overrides CampPlaceableObject
function PlaceObject_ExtraActivator1(CampPlaceableObjectEx Extended)
	myExtraActivator1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator1, Extended.PositionRef_ExtraActivator1, initially_disabled = true, is_temp = is_temporary)
endFunction