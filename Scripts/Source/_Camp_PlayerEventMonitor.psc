scriptname _Camp_PlayerEventMonitor extends ReferenceAlias

import CampUtil

Actor property PlayerRef auto
_Camp_ConditionValues property Conditions auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if IsRefInInterior(PlayerRef)
		Conditions.IsPlayerInInterior = true
	else
		Conditions.IsPlayerInInterior = false
	endif
EndEvent