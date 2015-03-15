Scriptname _Camp_CampfireType_FlickeringScript extends ObjectReference  

import CampUtil

int burn_duration = 3

bool property isWood = false auto
bool property isBooks = false auto

Furniture property _Camp_Campfire auto
Activator property _Camp_Fuel_Flickering_BranchesLit auto
Activator property _Camp_Fuel_Flickering_BooksLit auto
Activator property _Camp_Fuel_Flickering_BranchesUnlit auto
Activator property _Camp_Fuel_Flickering_BooksUnlit auto
Light property _Camp_Campfire_Light_3 auto
MiscObject property this_item auto
Actor property PlayerRef auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference f = Game.FindClosestReferenceOfTypeFromRef(_Camp_Campfire, PlayerRef, 500.0)
		if f
			f.Activate(PlayerRef)
			if isWood
				(f as CampCampfire).SetFuel(_Camp_Fuel_Flickering_BranchesLit,		\
											_Camp_Fuel_Flickering_BranchesUnlit,	\
											_Camp_Campfire_Light_3, burn_duration)
			elseif isBooks
				(f as CampCampfire).SetFuel(_Camp_Fuel_Flickering_BooksLit, 		\
											_Camp_Fuel_Flickering_BooksUnlit, 		\
											_Camp_Campfire_Light_3, burn_duration)
			endif
		endif
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
endEvent