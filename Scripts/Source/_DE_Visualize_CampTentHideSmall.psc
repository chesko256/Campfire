Scriptname _DE_Visualize_CampTentHideSmall extends _DE_Visualize

import debug 
import utility

;Visualization prompt
message property _DE_CampVisPrompt_Tent auto

;Visualization trigger
ObjectReference property _DE_CampVisTrigger_CampTentHideSmallREF auto

;Inventory item
MiscObject property _DE_CampTent2_HideSmall_MISC auto

;Placed item
Activator property _DE_CampTent2_SmallHideACT auto

;Warmth formlist
FormList property _DE_HeatSources_All auto

Event OnInit()
	myVisPrompt = _DE_CampVisPrompt_Tent
	myTrigger = _DE_CampVisTrigger_CampTentHideSmallREF
	myInvItem = _DE_CampTent2_HideSmall_MISC
	myPlacedItem = _DE_CampTent2_SmallHideACT
	
	StartPlacement()
	
endEvent

Event OnUpdate()
	
	PerformPlacement(300.0, _DE_HeatSources_All, fHeatDist = 400.0)
	
endEvent