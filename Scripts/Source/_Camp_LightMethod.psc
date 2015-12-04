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
ImpactDataSet property MAGFirebolt01ImpactSet auto
ImpactDataSet property WPNzBluntImpactSet auto
Activator property FXSparkFountainToggleLight auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		if is_flames
			FlamesVFX()
		elseif is_torch
			TorchVFX()
		elseif is_stone
			StoneVFX()
		endif

		(GetLastUsedCampfire() as CampCampfire).LightFire(always_light)
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
EndEvent

function FlamesVFX()
	GetLastUsedCampfire().PlayImpactEffect(MAGFirebolt01ImpactSet)
	Wait(0.45)
endFunction

function TorchVFX()
	ObjectReference t = GetLastUsedCampfire().PlaceAtMe(Torch01, 1, true)
	t.MoveTo(t, afZOffset = 75.0)
	t.Enable()

	int i = 0
	while !t.Is3DLoaded() && i < 50
		i += 1
		Wait(0.1)
	endWhile

	;bump the torch
	t.ApplyHavokImpulse(0.0, 0.0, -1.0, 5.0)
	Wait(1.0)
	t.DisableNoWait(true)
	t.Delete()
endFunction

function StoneVFX()
	ObjectReference sparks = GetLastUsedCampfire().PlaceAtMe(FXSparkFountainToggleLight, abInitiallyDisabled = true)
	sparks.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
	sparks.SetScale(2)
	sparks.Enable()
	GetLastUsedCampfire().PlayImpactEffect(WPNzBluntImpactSet)
	Wait(0.75)
	sparks.Disable()
	Wait(0.75)
	sparks.Enable()
	GetLastUsedCampfire().PlayImpactEffect(WPNzBluntImpactSet)
	Wait(0.55)
	sparks.Disable()
	sparks.Delete()
endFunction