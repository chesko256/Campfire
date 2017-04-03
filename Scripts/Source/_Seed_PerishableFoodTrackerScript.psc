scriptname _Seed_PerishableFoodTrackerScript extends ObjectReference

import Utility
import _SeedInternal


Form property Food auto hidden
Form property SpoiledFood auto hidden
int property Quantity auto hidden
float property CurrentPerishHours = 0.0 auto hidden
float property MaxPerishHours auto hidden
ObjectReference property TrackedContainer auto hidden

float lastGameTimeHoursPassed = 0.0


Event OnInit()
	RegisterForSingleUpdateGameTime(1)
EndEvent

Event OnUpdateGameTime()
	; Random back-off for load reduction
	Wait(RandomFloat(1.0, 3.0))

	; @TEST
	; Does the Food still exist? (Mod that adds this food
	; could have been uninstalled)
	if !Food
		DeleteTracker()
		return
	endif

	AdvanceSpoilage()

	if CurrentPerishHours >= MaxPerishHours
		SpoilFood()
		return
	endif

	; Update again on the next whole hour
	float updateNext = 1.0 - (CurrentPerishHours - (CurrentPerishHours as int))
	RegisterForSingleUpdateGameTime(updateNext)
EndEvent

function AdvanceSpoilage()
	float totalHoursPassed = GetCurrentGameTime() * 24.0
	float gameTimeHoursPassedSinceLastUpdate = totalHoursPassed - lastGameTimeHoursPassed
	CurrentPerishHours += gameTimeHoursPassedSinceLastUpdate
endFunction

function SpoilFood()
	if TrackedContainer && Food && SpoiledFood
		TrackedContainer.RemoveItem(Food, Quantity, true)
		TrackedContainer.AddItem(SpoiledFood, Quantity, true)
		DeleteTracker()
	else
		if !TrackedContainer
			SeedDebug(3, "A perishable food tracker lost (or never knew) the container it was tracking.")
		endif
		if !Food
			SeedDebug(3, "A perishable food tracker lost (or never knew) the food it was tracking.")
		endif
		if !SpoiledFood
			SeedDebug(3, "A perishable food tracker lost (or never knew) the result food to grant the tracked container.")
		endif
		SeedDebug(3, "Deleting the tracker.")
		DeleteTracker()
	endif
endFunction

function DeleteTracker()
	TrackedContainer = None
	self.Disable()
	self.Delete()
endFunction

int function ReduceQuantity(int aiAmountRequested)
	; Returns the amount actually removed.
	
	if aiAmountRequested >= Quantity
		int amountRemoved = Quantity
		Quantity = 0

		; We have zeroed out the quantity of this container.
		DeleteTracker()

		return amountRemoved
	else
		Quantity -= aiAmountRequested
		return aiAmountRequested
	endif
endFunction