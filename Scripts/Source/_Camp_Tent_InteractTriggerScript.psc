Scriptname _Camp_Tent_InteractTriggerScript extends ObjectReference

import CampUtil
Actor property PlayerRef auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		ObjectReference myTent = GetCurrentTent()
		if myTent
			myTent.Activate(PlayerRef)
		endif
	endif
endEvent
