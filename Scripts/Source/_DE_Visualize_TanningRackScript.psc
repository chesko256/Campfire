Scriptname _DE_Visualize_TanningRackScript extends _DE_Visualize

import debug 
import utility

;Visualization prompt
message property _DE_CampVisPrompt_TanningRack auto

;Visualization trigger
ObjectReference property _DE_CampVisTrigger_TanningRackREF auto

;Inventory item
MiscObject property _DE_CampTanningRack auto

;Placed item
Furniture property _DE_TanningRack auto

Event OnInit()
	myVisPrompt = _DE_CampVisPrompt_TanningRack
	myTrigger = _DE_CampVisTrigger_TanningRackREF
	myInvItem = _DE_CampTanningRack
	myPlacedItem = _DE_TanningRack
	
	StartPlacement()
	
endEvent

Event OnUpdate()
	
	PerformPlacement(150.0)
	
endEvent