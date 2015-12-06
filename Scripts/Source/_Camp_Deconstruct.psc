scriptname _Camp_Deconstruct extends ObjectReference
{Allows a MiscObject crafting recipe to output two objects. Used for breaking down items.}

Actor property PlayerRef auto
MiscObject property thisItem auto
{This item.}
MiscObject property outputItem1 auto
{The first item to give the player.}
MiscObject property outputItem2 auto
{The second item to give the player.}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		PlayerRef.AddItem(outputItem1, 1, true)
		PlayerRef.AddItem(outputItem2, 1, true)
		PlayerRef.RemoveItem(thisItem, 1, true)
	endif
endEvent