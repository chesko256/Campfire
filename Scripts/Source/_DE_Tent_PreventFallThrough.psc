scriptname _DE_Tent_PreventFallThrough extends ObjectReference

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if !akNewContainer && akOldContainer == Game.GetPlayer() && Game.GetPlayer().IsInInterior()
		float myZ = self.GetPositionZ()
		self.MoveTo(self, afZOffset = 100.0)
	endif
endEvent