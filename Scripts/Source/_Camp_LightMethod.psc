scriptname _Camp_LightMethod extends ObjectReference

import Utility
import _CampInternal
import CampUtil

bool property is_flames = false auto
bool property is_stone = false auto

Actor property PlayerRef auto
Book property this_item auto
Furniture property _Camp_CampfireLightStoneMarker auto
Furniture property _Camp_CampfireLightFlamesMarker auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference last_used_campfire = GetLastUsedCampfire()
		last_used_campfire.Activate(PlayerRef)

		int i = 0
		while last_used_campfire.IsFurnitureInUse() && i < 50
			Utility.Wait(0.1)
			i += 1
		endWhile

		if is_stone
			ObjectReference light_marker = PlayerRef.PlaceAtMe(_Camp_CampfireLightStoneMarker)
			if GetCompatibilitySystem().isSkyrimVR
				ExitMenus()
			else
				light_marker.Activate(PlayerRef)
			endif
		elseif is_flames
			ObjectReference light_marker = PlayerRef.PlaceAtMe(_Camp_CampfireLightFlamesMarker)
			if GetCompatibilitySystem().isSkyrimVR
				ExitMenus()
			else
				light_marker.Activate(PlayerRef)
			endif
		endif

		PlayerRef.RemoveItem(this_item, 1, true)
	endif
EndEvent
