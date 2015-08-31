Scriptname _Camp_TinderTypeScript extends ObjectReference  

import CampUtil

float property light_chance auto
{The chance (0.0 to 1.0) that the player has of successfully lighting a fire with this tinder.}

Book property this_item auto
Furniture property _Camp_Campfire auto
Actor property PlayerRef auto

GlobalVariable property _Camp_LastUsedCampfireSize auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference f = GetLastUsedCampfire()
		if f
			(f as CampCampfire).SetTinder(light_chance)
		endif
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
endEvent