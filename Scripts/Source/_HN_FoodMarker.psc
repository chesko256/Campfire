scriptname _HN_FoodMarker extends ObjectReference

import Utility

Actor property PlayerRef auto

int property FoodType auto
{The type of food. See _HN_FoodSpawnSystem.}

Potion property FoodToSpawn auto
{The food to spawn.}

Faction property OwnerFactionOverride auto
{Manually override the faction owner of the spawned reference.}

ActorBase property OwnerActorOverride auto
{Manually override the actor owner of the spawned reference.}

bool property ProducedByOwner auto
{Whether or not this food is produced by the owner. Helps override regional shortages.}

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
		bool success = ShouldFoodSpawn(FoodType, ProducedByOwner, PlayerRef.GetCurrentLocation())
		if success
			ref = self.PlaceAtMe(FoodToSpawn, abInitiallyDisabled = true)
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