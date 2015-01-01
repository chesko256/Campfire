Scriptname _DE_Visualize_CampTentLeatherLarge_3BR extends _DE_Visualize

import debug 
import utility

;Visualization prompt
message property _DE_CampVisPrompt_Tent auto

;Visualization trigger
ObjectReference property _DE_CampVisTrigger_CampTentHideSmallREF auto

;Inventory item
MiscObject property _DE_CampTentLeatherLarge_3BR auto

;Placed item
Activator property _DE_CampTent2_LargeLeather3BRACT auto

;Warmth formlist
FormList property _DE_HeatSources_All auto

Event OnInit()
	myVisPrompt = _DE_CampVisPrompt_Tent
	myTrigger = _DE_CampVisTrigger_CampTentHideSmallREF
	myInvItem = _DE_CampTentLeatherLarge_3BR
	myPlacedItem = _DE_CampTent2_LargeLeather3BRACT
	
	StartPlacement()
	
endEvent

Event OnUpdate()
	
	PerformPlacement(400.0, _DE_HeatSources_All, -46.8232, -90.0, 400.0)
	
endEvent