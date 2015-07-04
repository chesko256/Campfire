scriptname _Seed_PlayerEventMonitor extends ReferenceAlias

; Bug - can't always determine between consumption and dropping into world because script-spawned item keeps reference.

Quest property _Seed_SpoilSystemQuest auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace("[Seed] Player OnItemAdded akBaseItem=" + akBaseItem + ", aiItemCount=" + aiItemCount + ", akItemReference=" + akItemReference + ", akSourceContainer=" + akSourceContainer)
	if IsTrackableFood(akBaseItem)
		(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToContainer(akBaseItem, aiItemCount, akSourceContainer, self.GetActorRef(), akItemReference)
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	debug.trace("[Seed] Player OnItemRemoved akBaseItem=" + akBaseItem + ", aiItemCount=" + aiItemCount + ", akItemReference=" + akItemReference + ", akDestContainer=" + akDestContainer)
	if IsTrackableFood(akBaseItem)
		if (!akItemReference && !akDestContainer) || (akItemReference && !akItemReference.Is3DLoaded())
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
					world_refs[i] = akItemReference.PlaceAtMe(akBaseItem, 1, abInitiallyDisabled = true)
					world_refs[i].Enable()
					i += 1
				endWhile
				akItemReference.Delete()
				(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToWorld(akBaseItem, self.GetActorRef(), world_refs)
			endif
		endif
	endif
EndEvent

bool function IsTrackableFood(Form akBaseItem)
	if (akBaseItem as Potion) && (akBaseItem as Potion).IsFood() && !(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HasSpoilStage4Name(akBaseItem.GetName())
		return true
	else
		return false
	endif
endFunction