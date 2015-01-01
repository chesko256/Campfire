Scriptname _DE_Tent_StopWaitScript extends ObjectReference  

Actor property PlayerRef auto
GlobalVariable property _DE_bContinueToWait auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		_DE_bContinueToWait.SetValue(1)
	endif
endEvent
