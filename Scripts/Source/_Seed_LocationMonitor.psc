scriptname _Seed_LocationMonitor extends ReferenceAlias

_Seed_ConditionValues property conditions auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akNewLoc && akNewLoc.IsCleared()
		conditions.CurrentLocationCleared = true
	else
		conditions.CurrentLocationCleared = false
	endif
endEvent