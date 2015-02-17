Scriptname _Camp_DeleteLargeFire extends ObjectReference  

Event OnInit()
	RegisterForSingleUpdate(21)
EndEvent

Event OnUpdate()
	self.Disable(True)
	self.Delete()
endEvent