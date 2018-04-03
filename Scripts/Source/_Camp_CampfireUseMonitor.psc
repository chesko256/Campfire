Scriptname _Camp_CampfireUseMonitor extends ReferenceAlias  

Actor property PlayerRef auto
Furniture property _Camp_Campfire auto
Furniture property _Camp_CampfireConjuredShelter auto
MiscObject property _Camp_CampfireItem_RuinedBook auto
MiscObject property RuinedBook auto
MiscObject property RuinedBook02 auto
MiscObject property _Camp_ZZCampfireItem_WeatherFavorable auto

Event OnSit(ObjectReference akFurniture)
	if akFurniture.GetBaseObject() == _Camp_Campfire || akFurniture.GetBaseObject() == _Camp_CampfireConjuredShelter
		int rb1 = PlayerRef.GetItemCount(RuinedBook)
		int rb2 = PlayerRef.GetItemCount(RuinedBook02)
		PlayerRef.AddItem(_Camp_CampfireItem_RuinedBook, (rb1 + rb2), true)

		;TODO: For now, just give the player the Favorable Weather item.
		PlayerRef.AddItem(_Camp_ZZCampfireItem_WeatherFavorable, 1, true)
	endif
EndEvent

Event OnGetUp(ObjectReference akFurniture)
	if akFurniture.GetBaseObject() == _Camp_Campfire || akFurniture.GetBaseObject() == _Camp_CampfireConjuredShelter
		int ca = PlayerRef.GetItemCount(_Camp_CampfireItem_RuinedBook)
		int cb = PlayerRef.GetItemCount(_Camp_ZZCampfireItem_WeatherFavorable)
		PlayerRef.RemoveItem(_Camp_CampfireItem_RuinedBook, ca, true)
		PlayerRef.RemoveItem(_Camp_ZZCampfireItem_WeatherFavorable, cb, true)
	endif
EndEvent