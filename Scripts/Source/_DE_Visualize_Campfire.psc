Scriptname _DE_Visualize_Campfire extends _DE_Visualize

;Visualization prompt
message property _DE_CampVisPrompt_Campfire auto

;Visualization trigger
ObjectReference property _DE_CampVisTrigger_CampfireREF auto

;Inventory item
;none

;Placed item
Activator property _DE_Campfire_Simple auto

;Error formlist
Formlist property _DE_WarmListCampfires auto

Event OnInit()
	myVisPrompt = _DE_CampVisPrompt_Campfire
	myTrigger = _DE_CampVisTrigger_CampfireREF
	myInvItem = none
	myPlacedItem = _DE_Campfire_Simple
	
	StartPlacement()
	
endEvent

Event OnUpdate()
	
	PerformPlacement(300.0, _DE_WarmListCampfires, fHeatDist = 400.0)
	
endEvent