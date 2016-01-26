Scriptname _Camp_TinderTypeScript extends ObjectReference

import CampUtil

int property quality_rank auto
{The quality of this tinder. Ranges from 1 (best) to 5 (worst).}
bool property is_bad_weather = false auto
{Is this the bad weather version of this tinder?}
bool property is_oil = false auto
{Is this tinder oil?}

Book property this_item auto
Actor property PlayerRef auto

GlobalVariable property _Camp_LastUsedCampfireSize auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference f = GetLastUsedCampfire()
		if f
			if is_bad_weather
				quality_rank += 2
			endif
			(f as CampCampfire).SetTinder(quality_rank, is_oil)
		endif
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
endEvent