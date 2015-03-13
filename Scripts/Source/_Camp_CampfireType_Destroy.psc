scriptname _Camp_CampfireType_Destroy extends ObjectReference

import CampUtil

Actor property PlayerRef auto
Furniture property _Camp_Campfire auto
MiscObject property _Camp_CampfireType_DestroyItem auto

Event OnInit()
	ObjectReference cf = GetLastUsedCampfire()
	if cf
		cf.Activate(PlayerRef)
		int i = 0
		while PlayerRef.GetSitState() != 0 && i < 50
			utility.wait(0.1)
			i += 1
		endWhile
		(cf as CampCampfire).TakeDown()
	endif
	PlayerRef.RemoveItem(_Camp_CampfireType_DestroyItem, 1, true)
endEvent