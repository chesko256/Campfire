Scriptname _Camp_BookToPaperScript extends ObjectReference

MiscObject property this_item auto
Actor property PlayerRef auto
MiscObject property RuinedBook auto
MiscObject property RuinedBook02 auto
MiscObject property PaperRoll auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		; Remove a book from the player's inventory.
		int book_1_count = PlayerRef.GetItemCount(RuinedBook)
		int book_2_count = PlayerRef.GetItemCount(RuinedBook02)
		if book_1_count > 0
			PlayerRef.RemoveItem(RuinedBook, 1, true)
		elseif book_2_count > 0
			PlayerRef.RemoveItem(RuinedBook02, 1, true)
		endif

		; Give the player the paper.
		PlayerRef.AddItem(PaperRoll, 4, true)

		PlayerRef.RemoveItem(this_item, 1, true)
	endif
endEvent