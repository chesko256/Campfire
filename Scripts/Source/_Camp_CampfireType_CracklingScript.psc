Scriptname _Camp_CampfireType_CracklingScript extends ObjectReference  

import CampUtil

int burn_duration = 6

bool property isDeadwood = false auto
bool property isFirewood = false auto
bool property Setting_IsFuelRefresh = false auto
{Is this a fuel refresh item?}

int property count_books = 0 auto
int property count_branches = 0 auto
int property count_kindling = 0 auto
int property count_deadwood = 0 auto
int property count_firewood = 0 auto

Furniture property _Camp_Campfire auto
Activator property _Camp_Fuel_Crackling_DeadwoodLit auto
Activator property _Camp_Fuel_Crackling_FirewoodLit auto
Activator property _Camp_Fuel_Crackling_DeadwoodUnlit auto
Activator property _Camp_Fuel_Crackling_FirewoodUnlit auto
Light property _Camp_Campfire_Light_4 auto
Book property this_item auto
Actor property PlayerRef auto
GlobalVariable property _Camp_LastUsedCampfireSize auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		ObjectReference f = GetLastUsedCampfire()
		if f
			(f as CampCampfire).campfire_size = 3
			(f as CampCampfire).supplied_branches += count_branches
			(f as CampCampfire).supplied_kindling += count_kindling
			(f as CampCampfire).supplied_books += count_books
			(f as CampCampfire).supplied_deadwood += count_deadwood
			(f as CampCampfire).supplied_firewood += count_firewood
			_Camp_LastUsedCampfireSize.SetValueInt(3)
			if isDeadwood
				(f as CampCampfire).SetFuel(_Camp_Fuel_Crackling_DeadwoodLit,		\
											_Camp_Fuel_Crackling_DeadwoodUnlit,		\
											_Camp_Campfire_Light_4, burn_duration, Setting_IsFuelRefresh)
			elseif isFirewood
				(f as CampCampfire).SetFuel(_Camp_Fuel_Crackling_FirewoodLit, 		\
											_Camp_Fuel_Crackling_FirewoodUnlit, 	\
											_Camp_Campfire_Light_4, burn_duration, Setting_IsFuelRefresh)
			endif
			(f as CampCampfire).SetBonusLevel(1)
		endif

		PlayerRef.RemoveItem(this_item, 1, true)
	endif
endEvent