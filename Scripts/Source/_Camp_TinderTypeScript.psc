Scriptname _Camp_TinderTypeScript extends ObjectReference

import CampUtil

float property base_light_time auto
{The number of seconds that the player requires to successfully light a fire with this tinder.}
bool property is_oil = false auto
{Is this tinder oil?}

Book property this_item auto
Actor property PlayerRef auto

GlobalVariable property _Camp_LastUsedCampfireSize auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference f = GetLastUsedCampfire()
		if f
			(f as CampCampfire).SetTinder(base_light_time, is_oil)
		endif
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
endEvent