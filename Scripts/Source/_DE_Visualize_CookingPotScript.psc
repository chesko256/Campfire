Scriptname _DE_Visualize_CookingPotScript extends _DE_Visualize

import debug 
import utility

;Visualization prompt
message property _DE_CampVisPrompt_CookingPot auto

;Visualization trigger
ObjectReference property _DE_CampVisTrigger_CookingPotREF2 auto

;Inventory item
MiscObject property _DE_CampCookingPot_MISC auto

;Placed item
Furniture property _DE_CookingPotFurniture auto

;Warmth formlist
Formlist property _DE_HeatSources_All auto

Event OnInit()
	myTrigger = _DE_CampVisTrigger_CookingPotREF2
	myVisPrompt = _DE_CampVisPrompt_CookingPot
	myInvItem = _DE_CampCookingPot_MISC
	myPlacedItem = _DE_CookingPotFurniture
	
	StartPlacement()
	
endEvent

Event OnUpdate()
	
	PerformPlacement(75.0, _DE_HeatSources_All, -2.0, fHeatDist = 280.0, bLockToPlayer = true)
	
endEvent