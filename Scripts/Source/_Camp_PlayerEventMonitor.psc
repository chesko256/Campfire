scriptname _Camp_PlayerEventMonitor extends ReferenceAlias

import CampUtil
import _CampInternal

Actor property PlayerRef auto
_Camp_ConditionValues property Conditions auto
Spell property _Camp_SurvivalVisionPower auto

bool wasInInterior = false

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	SetCurrentTent(none)
	GetPlacementSystem().locked = false
	if IsRefInInterior(PlayerRef)
		Conditions.IsPlayerInInterior = true
		if !wasInInterior
			wasInInterior = true
			PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
		endif
	else
		Conditions.IsPlayerInInterior = false
		if wasInInterior
			wasInInterior = false
			PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
		endif
	endif
EndEvent
