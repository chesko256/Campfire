scriptname _Frost_WoodpileAliasScript extends ReferenceAlias

import _CampInternal
import CampUtil

Container property _Camp_WoodHarvestFirewoodPile_Small auto
Container property _Camp_WoodHarvestFirewoodPile_Medium auto
Container property _Camp_WoodHarvestFirewoodPile_Large auto
Container property _Camp_WoodHarvestFirewoodPile_Huge auto

FormList property _Camp_FirewoodPileNodes auto
FormList property _Camp_FirewoodPiles_Small auto
FormList property _Camp_FirewoodPiles_Medium auto
FormList property _Camp_FirewoodPiles_Large auto
FormList property _Camp_FirewoodPiles_Huge auto

Actor property PlayerRef auto
ObjectReference property woodref auto hidden

Event OnInit()
	woodref = self.GetRef()
	Form woodform
	if woodref
		woodform = woodref.GetBaseObject()
		;debug.trace("[Campfire] Woodpile Alias " + self + " assigned new reference " + woodref)
		
		if _Camp_FirewoodPiles_Small.HasForm(woodform)
			PlaceNodeController(_Camp_WoodHarvestFirewoodPile_Small, woodref, 0.8)
		elseif _Camp_FirewoodPiles_Medium.HasForm(woodform)
			PlaceNodeController(_Camp_WoodHarvestFirewoodPile_Medium, woodref)
		elseif _Camp_FirewoodPiles_Large.HasForm(woodform)
			PlaceNodeController(_Camp_WoodHarvestFirewoodPile_Large, woodref)
		elseif _Camp_FirewoodPiles_Huge.HasForm(woodform)
			PlaceNodeController(_Camp_WoodHarvestFirewoodPile_Huge, woodref, 1.6)
		endif
	endif
EndEvent

function PlaceNodeController(Container akNodeController, ObjectReference akReference, float afScaleOverride = 1.0)
	ObjectReference my_node = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_FirewoodPileNodes, akReference, 1.0)
	_Camp_WoodpileNodeController my_controller = None
	if !my_node
		my_node = akReference.PlaceAtMe(akNodeController, abInitiallyDisabled = true)
		if my_node
			if afScaleOverride != 1.0
				my_node.SetScale(afScaleOverride)
			endif
			;debug.trace("[Campfire] Placed woodpile node " + my_node)
			my_controller = my_node as _Camp_WoodpileNodeController
			my_controller.Setup(woodref)
		endif
	endif
endFunction