Scriptname _Camp_CampfireType_FlickeringScript extends ObjectReference  

import CampUtil

int burn_duration = 3

bool property isWood = false auto
bool property isBooks = false auto

int property count_books = 0 auto
int property count_branches = 0 auto
int property count_kindling = 0 auto
int property count_deadwood = 0 auto
int property count_firewood = 0 auto

Furniture property _Camp_Campfire auto
Activator property _Camp_Fuel_Flickering_BranchesLit auto
Activator property _Camp_Fuel_Flickering_BooksLit auto
Activator property _Camp_Fuel_Flickering_BranchesUnlit auto
Activator property _Camp_Fuel_Flickering_BooksUnlit auto
Light property _Camp_Campfire_Light_3 auto
Book property this_item auto
Actor property PlayerRef auto
GlobalVariable property _Camp_LastUsedCampfireSize auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference f = GetLastUsedCampfire()
		if f
			(f as CampCampfire).campfire_size = 2
			(f as CampCampfire).supplied_branches += count_branches
			(f as CampCampfire).supplied_kindling += count_kindling
			(f as CampCampfire).supplied_books += count_books
			(f as CampCampfire).supplied_deadwood += count_deadwood
			(f as CampCampfire).supplied_firewood += count_firewood
			_Camp_LastUsedCampfireSize.SetValueInt(2)
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