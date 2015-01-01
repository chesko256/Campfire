scriptname _DE_BackpackReclaim extends ObjectReference

Armor property thisBackpack auto
Armor property outputBackpack auto
Armor property outputAmulet auto
MiscObject property outputItem auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		Game.GetPlayer().RemoveItem(thisBackpack, 1, true)
		Game.GetPlayer().AddItem(outputBackpack, 1)
		if outputAmulet
			Game.GetPlayer().AddItem(outputAmulet, 1)
		elseif outputItem
			Game.GetPlayer().AddItem(outputItem, 1)
		endif
	endif
endEvent