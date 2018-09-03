scriptname _Camp_QuickLightMethod extends ObjectReference

import Utility
import _CampInternal
import CampUtil

int property requiredLightingMethod auto
{1 = Stone. 2 = Magic.}
int property requiredFuelType auto
{1 = Deadwood. 2 = Firewood.}

Actor property PlayerRef auto
Book property this_item auto
Activator property _Camp_Fuel_Crackling_DeadwoodLit auto
Activator property _Camp_Fuel_Crackling_FirewoodLit auto
Activator property _Camp_Fuel_Crackling_DeadwoodUnlit auto
Activator property _Camp_Fuel_Crackling_FirewoodUnlit auto
Furniture property _Camp_CampfireQuickLightStoneMarker auto
Furniture property _Camp_CampfireQuickLightFlamesMarker auto
Light property _Camp_Campfire_Light_4 auto
GlobalVariable property _Camp_LastUsedCampfireSize auto

; enum - Lighting Method
int STONE = 1
int MAGIC = 2

; enum - Fuel Type
int DEADWOOD = 1
int FIREWOOD = 2

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference lastUsedCampfire = GetLastUsedCampfire()
		lastUsedCampfire.Activate(PlayerRef)

		int i = 0
		while lastUsedCampfire.IsFurnitureInUse() && i < 50
			Utility.Wait(0.1)
			i += 1
		endWhile

		; Set the fuel
		if requiredFuelType == DEADWOOD
			(lastUsedCampfire as CampCampfire).supplied_deadwood = 4
			(lastUsedCampfire as CampCampfire).SetFuel(_Camp_Fuel_Crackling_DeadwoodLit,	\
										_Camp_Fuel_Crackling_DeadwoodUnlit,					\
										_Camp_Campfire_Light_4, 6)
		elseif requiredFuelType == FIREWOOD
			(lastUsedCampfire as CampCampfire).supplied_firewood = 4
			(lastUsedCampfire as CampCampfire).SetFuel(_Camp_Fuel_Crackling_FirewoodLit, 	\
										_Camp_Fuel_Crackling_FirewoodUnlit, 				\
										_Camp_Campfire_Light_4, 6)
		endif

		(lastUsedCampfire as CampCampfire).campfire_size = 3
		_Camp_LastUsedCampfireSize.SetValueInt(3)
		(lastUsedCampfire as CampCampfire).SetBonusLevel(1)

		; Select the lighting method
		if requiredLightingMethod == STONE
			ObjectReference light_marker = PlayerRef.PlaceAtMe(_Camp_CampfireQuickLightStoneMarker)
			if GetCompatibilitySystem().isSkyrimVR
				ExitMenus()
			else
				light_marker.Activate(PlayerRef)
			endif
		elseif requiredLightingMethod == MAGIC
			ObjectReference light_marker = PlayerRef.PlaceAtMe(_Camp_CampfireQuickLightFlamesMarker)
			if GetCompatibilitySystem().isSkyrimVR
				ExitMenus()
			else
				light_marker.Activate(PlayerRef)
			endif
		endif

		PlayerRef.RemoveItem(this_item, 1, true)
	endif
EndEvent