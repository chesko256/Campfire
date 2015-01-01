Scriptname _DE_Visualize_CampTentLeatherSmall2BR extends _DE_Visualize

;Visualization prompt
message property _DE_CampVisPrompt_Tent auto

;Visualization trigger
ObjectReference property _DE_CampVisTrigger_TentREF auto

;Inventory item
MiscObject property _DE_CampTent2_LeatherSmall2BR_MISC auto

;Placed item
Activator property _DE_CampTent2_SmallLeather2BRACT auto

;Warmth formlist
Formlist property _DE_HeatSources_All auto

Event OnInit()
	myVisPrompt = _DE_CampVisPrompt_Tent
	myTrigger = _DE_CampVisTrigger_TentREF
	myInvItem = _DE_CampTent2_LeatherSmall2BR_MISC
	myPlacedItem = _DE_CampTent2_SmallLeather2BRACT
	
	StartPlacement()
	
endEvent

Event OnUpdate()
	
	PerformPlacement(300.0, _DE_HeatSources_All, fHeatDist = 400.0)
	
endEvent