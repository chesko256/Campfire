scriptname _Camp_LightMethod extends ObjectReference

import Utility
import CampUtil

bool property always_light auto
{Whether or not to always light the fire and discard the tinder light chance.}

bool property is_flames = false auto
bool property is_torch = false auto
bool property is_stone = false auto

Actor property PlayerRef auto
Book property this_item auto
Light property Torch01 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		if is_flames
			;vfx
		elseif is_torch
			ObjectReference t = GetLastUsedCampfire().PlaceAtMe(Torch01, 1, true)
			t.MoveTo(t, afZOffset = 75.0)
			t.Enable()

			int i = 0
			while !t.Is3DLoaded() && i > 50
				i += 1
				Wait(0.1)
			endWhile

			;bump the torch
			t.ApplyHavokImpulse(0.0, 0.0, -1.0, 3.0)

			Wait(2)
			t.Disable()
			t.Delete()
		elseif is_stone
			;vfx
		endif

		(GetLastUsedCampfire() as CampCampfire).LightFire(always_light)
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
EndEvent