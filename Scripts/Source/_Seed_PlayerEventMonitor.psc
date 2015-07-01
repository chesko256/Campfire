scriptname _Seed_PlayerEventMonitor extends ReferenceAlias

Quest property _Seed_SpoilSystemQuest auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace("[Seed] Player OnItemAdded")
	if (akBaseItem as Potion) && (akBaseItem as Potion).IsFood()
		(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransfer(akBaseItem, aiItemCount, akSourceContainer, self.GetActorRef(), akItemReference, None)
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	debug.trace("[Seed] Player OnItemRemoved")
	if (akBaseItem as Potion) && (akBaseItem as Potion).IsFood()
		(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransfer(akBaseItem, aiItemCount, self.GetActorRef(), akDestContainer, None, akItemReference)
	endif
EndEvent