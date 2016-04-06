Scriptname _Camp_CampfireUseMonitor extends ReferenceAlias  

Actor property PlayerRef auto
Furniture property _Camp_Campfire auto
MiscObject property _Camp_CampfireItem_BookBurnt auto
MiscObject property BookBurnt01 auto
MiscObject property BookBurnt02 auto
MiscObject property _Camp_ZZCampfireItem_WeatherFavorable auto

Event OnSit(ObjectReference akFurniture)
	if akFurniture.GetBaseObject() == _Camp_Campfire
		int rb1 = PlayerRef.GetItemCount(BookBurnt01)
		int rb2 = PlayerRef.GetItemCount(BookBurnt02)
		PlayerRef.AddItem(_Camp_CampfireItem_BookBurnt, (rb1 + rb2), true)

		;TODO: For now, just give the player the Favorable Weather item.
		PlayerRef.AddItem(_Camp_ZZCampfireItem_WeatherFavorable, 1, true)
	endif
EndEvent

Event OnGetUp(ObjectReference akFurniture)
	if akFurniture.GetBaseObject() == _Camp_Campfire
		int ca = PlayerRef.GetItemCount(_Camp_CampfireItem_BookBurnt)
		int cb = PlayerRef.GetItemCount(_Camp_ZZCampfireItem_WeatherFavorable)
		PlayerRef.RemoveItem(_Camp_CampfireItem_BookBurnt, ca, true)
		PlayerRef.RemoveItem(_Camp_ZZCampfireItem_WeatherFavorable, cb, true)
	endif
EndEvent