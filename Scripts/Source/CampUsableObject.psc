Scriptname CampUsableObject extends ObjectReference

import _CampInternal

bool in_use = false

Event OnInit()
	RegisterForSingleUpdate(0.1)
endEvent

Event OnUpdate()
	if !in_use
		self.Activate(Game.GetPlayer())
		in_use = true
		RegisterForSingleUpdate(1)
	else
		if self.IsFurnitureInUse()
			RegisterForSingleUpdate(1)
		else	
			self.Disable()
			self.Delete()
		endif
	endif
endEvent
