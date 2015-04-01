scriptname _Camp_SwapCraftedTorch extends ObjectReference

light property Torch01 auto
miscobject property _Camp_Torch_MISC auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		Game.GetPlayer().RemoveItem(_Camp_Torch_MISC, 1, true)
		Game.GetPlayer().AddItem(Torch01, 1, true)
	endif
endEvent
