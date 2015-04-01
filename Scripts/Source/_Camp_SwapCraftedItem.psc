scriptname _Camp_SwapCraftedItem extends ObjectReference

Armor property RealArmor auto
{The item to swap to.}
Armor property FakeArmor auto
{The fake item (the item this script is attached to).}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		Game.GetPlayer().RemoveItem(FakeArmor, 1, true)
		Game.GetPlayer().AddItem(RealArmor, 1, true)
	endif
endEvent