Scriptname CampUsableObject extends ObjectReference

import _CampInternal

Event OnInit()
	utility.wait(0.1)		;Make sure that the object is completely initialized
	self.Activate(Game.GetPlayer())
	
	RegisterForSingleUpdate(0.5)
endEvent

Event OnUpdate()
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(1)
	else
		CampDebug(0, "Deleting furniture")
		self.Disable()
		self.Delete()
	endif
endEvent
