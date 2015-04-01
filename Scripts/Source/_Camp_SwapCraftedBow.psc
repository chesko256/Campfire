scriptname _Camp_SwapCraftedBow extends ObjectReference

weapon property LongBow auto
weapon property _Camp_LongBow auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		Game.GetPlayer().RemoveItem(_Camp_LongBow, 1, true)
		Game.GetPlayer().AddItem(LongBow, 1, true)
	endif
endEvent