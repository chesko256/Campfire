scriptname _Seed_AliasFoodMonitor extends ReferenceAlias
{ Tracks the food that goes into, and out of, a given alias for the purposes of tracking. }

import SeedUtil
import _SeedInternal

LastSeedAPI property LastSeed auto
ObjectReference property _Seed_TrackerAnchorRef auto
Activator property _Seed_PerishableFoodTracker auto
FormList property TrackingList auto
{ The formlist that tracks this container/actor alias. }
bool property isActor = true auto
{ Default: true }

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem as Potion
		Potion food = akBaseItem as Potion
		int foodType = LastSeed.FoodDatastore.IdentifyFood(food)
		bool isPreserved = LastSeed.FoodDatastore.IsFoodPreserved(food)
		if foodType > 0 && !isPreserved
			Form spoiled = LastSeed.FoodDatastore.GetSpoiledVersion(food, foodType)
			if !spoiled
				return
			endif

			int spoilDuration = GetFoodMaxPerishDurationByType(foodType)
			if spoilDuration == -1
				return
			endif

			ObjectReference ref = _Seed_TrackerAnchorRef.PlaceAtMe(_Seed_PerishableFoodTracker)
			_Seed_PerishableFoodTrackerScript tracker = ref as _Seed_PerishableFoodTrackerScript

			tracker.Food = akBaseItem
			tracker.SpoiledFood = spoiled
			tracker.Quantity = aiItemCount
			tracker.MaxPerishHours = spoilDuration
			if isActor
				tracker.TrackedContainer = self.GetActorRef()
			else
				tracker.TrackedContainer = self.GetRef()
			endif

			TrackingList.AddForm(tracker)
			SeedDebug(0, "Added " + tracker + " to the list " + TrackingList)
		endif
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if akBaseItem as Potion
		int foodType = LastSeed.FoodDatastore.IdentifyFood(akBaseItem as Potion)
		bool isPreserved = LastSeed.FoodDatastore.IsFoodPreserved(akBaseItem as Potion)
		if foodType > 0 && !isPreserved
			int remaining = aiItemCount
			int i = TrackingList.GetSize() - 1
			while remaining > 0 && i > 0
				ObjectReference ref = TrackingList.GetAt(i) as ObjectReference
				if (ref as _Seed_PerishableFoodTrackerScript).Food == akBaseItem
					_Seed_PerishableFoodTrackerScript tracker = ref as _Seed_PerishableFoodTrackerScript

					int amountRemoved = tracker.ReduceQuantity(remaining) ; remove the quantity (the function returns the number actually removed and deletes itself if necessary)
					remaining -= amountRemoved
					if remaining <= 0
					; remove the tracker from the list(?)
					else
						i -= 1
					endif
				else
					i -= 1
				endif
			endWhile

			SeedDebug(0, "State of the FormList is " + TrackingList)
		endif
	endif
EndEvent

