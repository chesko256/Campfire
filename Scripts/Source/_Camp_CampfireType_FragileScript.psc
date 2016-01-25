Scriptname _Camp_CampfireType_FragileScript extends ObjectReference  

import CampUtil

int burn_duration = 1

bool property isBranches = false auto
bool property isKindling = false auto
bool property isBooks = false auto
bool property Setting_IsFuelRefresh = false auto
{Is this a fuel refresh item?}

int property count_books = 0 auto
int property count_branches = 0 auto
int property count_kindling = 0 auto
int property count_deadwood = 0 auto
int property count_firewood = 0 auto

Furniture property _Camp_Campfire auto
Activator property _Camp_Fuel_Fragile_BranchesLit auto
Activator property _Camp_Fuel_Fragile_BooksLit auto
Activator property _Camp_Fuel_Fragile_KindlingLit auto
Activator property _Camp_Fuel_Fragile_BranchesUnlit auto
Activator property _Camp_Fuel_Fragile_BooksUnlit auto
Activator property _Camp_Fuel_Fragile_KindlingUnlit auto
MiscObject property RuinedBook auto
MiscObject property RuinedBook02 auto
Light property _Camp_Campfire_Light_2 auto
Book property this_item auto
Actor property PlayerRef auto
GlobalVariable property _Camp_LastUsedCampfireSize auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference f = GetLastUsedCampfire()
		if f
			(f as CampCampfire).campfire_size = 1
			(f as CampCampfire).supplied_branches += count_branches
			(f as CampCampfire).supplied_kindling += count_kindling
			(f as CampCampfire).supplied_books += count_books
			(f as CampCampfire).supplied_deadwood += count_deadwood
			(f as CampCampfire).supplied_firewood += count_firewood
			_Camp_LastUsedCampfireSize.SetValueInt(1)
			if isBranches
				(f as CampCampfire).SetFuel(_Camp_Fuel_Fragile_BranchesLit, 	\
											_Camp_Fuel_Fragile_BranchesUnlit, \
											_Camp_Campfire_Light_2, burn_duration, Setting_IsFuelRefresh)
			elseif isKindling
				(f as CampCampfire).SetFuel(_Camp_Fuel_Fragile_KindlingLit, 	\
											_Camp_Fuel_Fragile_KindlingUnlit, \
											_Camp_Campfire_Light_2, burn_duration, Setting_IsFuelRefresh)
			elseif isBooks
				(f as CampCampfire).SetFuel(_Camp_Fuel_Fragile_BooksLit, 	\
											_Camp_Fuel_Fragile_BooksUnlit, \
											_Camp_Campfire_Light_2, burn_duration, Setting_IsFuelRefresh)
				SubtractBooks()
			endif
		endif
		PlayerRef.RemoveItem(this_item, 1, true)
	endif
endEvent

function SubtractBooks()
	bool done = false
	int books_to_subtract = count_books
	while books_to_subtract > 0 && !done
		if PlayerRef.GetItemCount(RuinedBook) > 0
			PlayerRef.RemoveItem(RuinedBook, 1, true)
			books_to_subtract -= 1
		elseif PlayerRef.GetItemCount(RuinedBook02) > 0
			PlayerRef.RemoveItem(RuinedBook02, 1, true)
			books_to_subtract -= 1
		else
			done = true
		endif
	endWhile
endFunction