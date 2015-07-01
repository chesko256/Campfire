scriptname _Seed_PlayerEventMonitor extends ReferenceAlias

Quest property _Seed_SpoilSystemQuest auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace("[Seed] Player OnItemAdded")
	if (akBaseItem as Potion) && (akBaseItem as Potion).IsFood()
		(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToContainer(akBaseItem, aiItemCount, akSourceContainer, self.GetActorRef(), akItemReference)
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	debug.trace("[Seed] Player OnItemRemoved")
	if (akBaseItem as Potion) && (akBaseItem as Potion).IsFood()
		if !akItemReference && !akDestContainer
			(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodConsumed(akBaseItem, self.GetActorRef(), aiItemCount)
		else
			; Did I drop the item, or was it moved to another container?
			if !akItemReference && akDestContainer
				; Player to container transfer
				(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToContainer(akBaseItem, aiItemCount, self.GetActorRef(), akDestContainer, None)
			elseif akItemReference && !akDestContainer
				; Player to world transfer
				akItemReference.Disable()
				ObjectReference[] world_refs
				if aiItemCount > 1
					world_refs = new ObjectReference[128]
				else
					world_refs = new ObjectReference[1]
				endif

				int i = 0
				while i < aiItemCount
					world_refs[i] = akItemReference.PlaceAtMe(akBaseItem, 1)
					i += 1
				endWhile
				(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToWorld(akBaseItem, self.GetActorRef(), world_refs)
			endif
		endif
	endif
EndEvent