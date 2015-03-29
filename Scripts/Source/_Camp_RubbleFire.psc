Scriptname _Camp_RubbleFire extends ObjectReference  

Event OnInit()
	RegisterForSingleUpdateGameTime(3.0)
EndEvent

Event OnUpdateGameTime()
	self.Disable()
	self.Delete()
EndEvent