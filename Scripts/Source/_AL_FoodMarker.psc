scriptname _AL_FoodMarker extends ObjectReference


Potion property FoodType auto
{The type of food to spawn.}

FormList property _AL_WealthyLocations auto
{The wealthy locations formlist.}

GlobalVariable property SpawnChanceGlobal auto
{The global that determines if this food should spawn.}

ObjectReference ref
bool ready = true
bool attached = false
bool queued_for_removal = false
Cell this_cell
Faction owner_faction
ActorBase owner_actor

Event OnCellAttach()
	attached = true
	debug.trace(self + " attached to cell.")
	if ready
		float roll = Utility.RandomFloat()
		if roll <= SpawnChanceGlobal.GetValue()
			ref = self.PlaceAtMe(FoodType, abInitiallyDisabled = true)
			debug.trace(self + " spawned " + ref)
			this_cell = self.GetParentCell()
			owner_faction = this_cell.GetFactionOwner()
			if owner_faction
				ref.SetFactionOwner(owner_faction)
			else
				owner_actor = this_cell.GetActorOwner()
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
	debug.trace(self + " detatched from cell.")
	attached = false
	if queued_for_removal
		RemoveFood()
	endif
EndEvent

Event OnUpdateGameTime()
	if ref && !attached
		RemoveFood()
	else
		debug.trace(self + " queued for reset.")
		queued_for_removal = true
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