scriptname _DE_DeleteFirewoodPile extends ObjectReference

MiscObject property myFuel auto

Event OnInit()
	RegisterForSingleUpdateGameTime(48)
	;debug.notification("I just initialized")
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	;Delete this pile if the player takes all of the wood from it.
	if akBaseItem == myFuel
		if self.GetItemCount(myFuel) == 0
			Game.DisablePlayerControls()			;Force player out of the wood inventory
			Game.EnablePlayerControls()
			self.Disable()
			self.Delete()
		else
			RegisterForSingleUpdateGameTime(48)
		endif
	endif
endEvent

Event OnUpdateGameTime()
	;Age out this wood pile, and remove any wood in the central container.
	;debug.notification("Aging out firewood...")
	int myWoodCount = self.GetItemCount(myFuel)
	self.RemoveItem(myFuel, myWoodCount)
	self.Disable()
	self.Delete()
endEvent
	
	