Scriptname _Camp_PerkNodeTest extends ObjectReference  

Event OnInit()
	RegisterForSingleUpdate(1)
endEvent

Event OnUpdate()
	while true
		debug.trace("<<<<< START >>>>>")
		debug.trace("Locked")
		self.PlayAnimation("Locked")
		utility.wait(3.0)
		debug.trace("LockedState")
		self.PlayAnimation("LockedState")
		utility.wait(3.0)
		debug.trace("Unlock")
		self.PlayAnimation("Unlock")
		utility.wait(3.0)
		debug.trace("End")
		self.PlayAnimation("End")
		utility.wait(3.0)
	endWhile
EndEvent

