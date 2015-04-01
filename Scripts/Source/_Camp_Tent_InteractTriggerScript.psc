Scriptname _Camp_Tent_InteractTriggerScript extends ObjectReference

Actor property PlayerRef auto
Formlist property _Camp_TentActivators auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		ObjectReference myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_TentActivators, PlayerRef, 150.0)
		if myTent
			myTent.Activate(PlayerRef)
			return
		endif	
	endif
endEvent
