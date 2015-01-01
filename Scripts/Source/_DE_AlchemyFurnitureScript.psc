Scriptname _DE_AlchemyFurnitureScript extends ObjectReference

Actor property PlayerRef auto

Event OnInit()
	utility.wait(0.1)		;Make sure that the object is completely initialized
	self.Activate(PlayerRef)
	
	RegisterForSingleUpdate(0.5)
endEvent

Event OnUpdate()
	
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(0.5)
	else
		;debug.notification("Deleting furniture")
		self.Disable()
		self.Delete()
	endif
endEvent
