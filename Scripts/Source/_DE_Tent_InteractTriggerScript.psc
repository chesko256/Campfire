Scriptname _DE_Tent_InteractTriggerScript extends ObjectReference

Actor property PlayerRef auto
Formlist property _DE_TentActivators auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		ObjectReference myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_TentActivators, PlayerRef, 150.0)
		if myTent
			myTent.Activate(PlayerRef)
			return
		endif	
	endif
endEvent
