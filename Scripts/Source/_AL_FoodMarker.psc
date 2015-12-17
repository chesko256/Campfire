scriptname _AL_FoodMarker extends ObjectReference

import Utility

Potion property FoodType auto
{The type of food to spawn.}

FormList property _AL_WealthyLocations auto
{The wealthy locations formlist.}

GlobalVariable property SpawnChanceGlobal auto
{The global that determines if this food should spawn.}

GlobalVariable property _AL_MaxScriptBackOffTime auto
{How long to wait, maximum, during the randomized back-off period.}

float property SpawnChanceOverride = 0.0 auto
{Manually override the chance the reference will spawn.}

Faction property OwnerFactionOverride auto
{Manually override the faction owner of the spawned reference.}

ActorBase property OwnerActorOverride auto
{Manually override the actor owner of the spawned reference.}

ObjectReference ref
bool ready = true
bool attached = false
bool queued_for_removal = false
Cell this_cell
Faction owner_faction
ActorBase owner_actor

Event OnCellAttach()
	attached = true
	; debug.trace(self + " attached to cell.")
	if ready
		Wait(RandomFloat(0.0, _AL_MaxScriptBackOffTime.GetValue()))
		float roll = RandomFloat()
		float chance
		if SpawnChanceOverride != 0.0
			chance = SpawnChanceOverride
		else
			chance = SpawnChanceGlobal.GetValue()
		endif
		if roll <= chance ; plus wealthy bonus, etc
			ref = self.PlaceAtMe(FoodType, abInitiallyDisabled = true)
			debug.trace(self + " spawned " + ref)
			this_cell = self.GetParentCell()
			owner_faction = GetFoodFactionOwner(this_cell)
			if owner_faction
				ref.SetFactionOwner(owner_faction)
			else
				owner_actor = GetFoodActorOwner(this_cell)
				if owner_actor
					ref.SetActorOwner(owner_actor)
				endif
			endif
			ref.EnableNoWait()
		endif
		ready = false
		RegisterForSingleUpdateGameTime(4)	;504 (3 weeks)
	endif
EndEvent

Event OnCellDetach()
	; debug.trace(self + " detatched from cell.")
	attached = false
	if queued_for_removal
		RemoveFood()
	endif
EndEvent

Event OnUpdateGameTime()
	if ref 
		if !attached
			RemoveFood()
		else
			; debug.trace(self + " queued for reset.")
			queued_for_removal = true
		endif
	else
		ready = true
		queued_for_removal = false
	endif
EndEvent

function RemoveFood()
	debug.trace(self + " resetting.")
	ref.Disable()
	ref.Delete()
	ref = None
	ready = true
	queued_for_removal = false
endFunction

Faction function GetFoodFactionOwner(Cell akCell)
	if OwnerFactionOverride
		return OwnerFactionOverride
	else
		return akCell.GetFactionOwner()
	endif
endFunction

ActorBase function GetFoodActorOwner(Cell akCell)
	if OwnerActorOverride
		return OwnerActorOverride
	else
		return akCell.GetActorOwner()
	endif
endFunction