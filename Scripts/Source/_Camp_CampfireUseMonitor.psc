Scriptname _Camp_CampfireUseMonitor extends ReferenceAlias  

Actor property PlayerRef auto
Furniture property _Camp_Campfire auto
MiscObject property _Camp_CampfireItem_Campfire auto
MiscObject property _Camp_CampfireItem_RuinedBook auto
MiscObject property RuinedBook auto
MiscObject property RuinedBook02 auto

Event OnSit(ObjectReference akFurniture)
	if akFurniture.GetBaseObject() == _Camp_Campfire
		PlayerRef.AddItem(_Camp_CampfireItem_Campfire, 1, true)

		int rb1 = PlayerRef.GetItemCount(RuinedBook)
		int rb2 = PlayerRef.GetItemCount(RuinedBook02)
		PlayerRef.AddItem(_Camp_CampfireItem_RuinedBook, (rb1 + rb2), true)

	endif
EndEvent

Event OnGetUp(ObjectReference akFurniture)
	if akFurniture.GetBaseObject() == _Camp_Campfire
		int ca = PlayerRef.GetItemCount(_Camp_CampfireItem_Campfire)
		int cb = PlayerRef.GetItemCount(_Camp_CampfireItem_RuinedBook)
		
		PlayerRef.RemoveItem(_Camp_CampfireItem_Campfire, ca, true)
		PlayerRef.RemoveItem(_Camp_CampfireItem_RuinedBook, cb, true)
	endif
EndEvent