Scriptname _DE_Visualize_EnchantingScript extends _DE_Visualize

import debug 
import utility

;Visualization prompt
message property _DE_CampVisPrompt_Enchanting auto

;Visualization trigger
ObjectReference property _DE_CampVisTrigger_EnchantingREF auto

;Inventory item
MiscObject property _DE_EnchantingMISC auto

;Placed item
furniture property _DE_Enchanting auto

;Special
message property _DE_Enchanting_BoneMealError auto
ingredient property BoneMeal auto

Event OnInit()
	myVisPrompt = _DE_CampVisPrompt_Enchanting
	myTrigger = _DE_CampVisTrigger_EnchantingREF
	myInvItem = _DE_EnchantingMISC
	myPlacedItem = _DE_Enchanting
	myRequirementErrorMsg = _DE_Enchanting_BoneMealError
	myPlacementRequirement = BoneMeal
	
	StartPlacement()
	
endEvent

Event OnUpdate()
	
	PerformPlacement(150.0)
	
endEvent