scriptname _Camp_LightMethod extends ObjectReference

import CampUtil

bool property always_light auto
{Whether or not to always light the fire and discard the tinder light chance.}

bool property is_flames = false auto
bool property is_torch = false auto
bool property is_stone = false auto

Actor property PlayerRef auto
Book property this_item auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		if is_flames
			;vfx
		elseif is_torch
			;vfx
		elseif is_stone
			;vfx
		endif

		(GetLastUsedCampfire() as CampCampfire).LightFire(always_light)
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
EndEvent