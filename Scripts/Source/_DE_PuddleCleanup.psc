Scriptname _DE_PuddleCleanup extends ObjectReference  

ObjectReference property _DE_Anchor auto

Event OnUnload()
	self.MoveTo(_DE_Anchor)
endEvent