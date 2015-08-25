Scriptname _Camp_CampfireType_CracklingScript extends ObjectReference  

import CampUtil

int burn_duration = 6

bool property isDeadwood = false auto
bool property isFirewood = false auto

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
GlobalVariable property _Camp_PerkRank_HighSpirits auto
Spell property _Camp_InspiredSpell1 auto
Spell property _Camp_InspiredSpell1_Perk1 auto
Spell property _Camp_InspiredSpell1_Perk2 auto
Message property _Camp_Inspired1Message auto

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
											_Camp_Campfire_Light_4, burn_duration)
			elseif isFirewood
				(f as CampCampfire).SetFuel(_Camp_Fuel_Crackling_FirewoodLit, 		\
											_Camp_Fuel_Crackling_FirewoodUnlit, 	\
											_Camp_Campfire_Light_4, burn_duration)
			endif
		endif
		PlayerRef.RemoveItem(this_item, 1, true)

		;Set the inspired spell
		int perk_rank = _Camp_PerkRank_HighSpirits.GetValueInt()
		if perk_rank == 0
			PlayerRef.AddSpell(_Camp_InspiredSpell1, false)
		elseif perk_rank == 1
			PlayerRef.AddSpell(_Camp_InspiredSpell1_Perk1, false)
		elseif perk_rank == 2
			PlayerRef.AddSpell(_Camp_InspiredSpell1_Perk2, false)
		endif
		_Camp_Inspired1Message.Show()
	endif
endEvent