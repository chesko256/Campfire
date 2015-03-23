scriptname _Frost_BranchAliasScript extends ReferenceAlias

import _CampInternal

FormList property _Camp_HarvestableBranchActivators auto
Static property CoastDriftWood01 auto
Static property CoastDriftWood02 auto
Static property CoastDriftWood03 auto
Static property TreeReachBranchPile01 auto
Static property TreeReachBranchPile02 auto
Activator property _Camp_BranchHarvestNode1 auto
Activator property _Camp_BranchHarvestNode2 auto
Activator property _Camp_BranchHarvestNode3 auto
Activator property _Camp_BranchHarvestNode4 auto
Activator property _Camp_BranchHarvestNode5 auto

Actor property PlayerRef auto
ObjectReference property woodref auto hidden

Event OnInit()
	woodref = self.GetRef()
	Form woodform
	if woodref
		woodform = woodref.GetBaseObject()
		;debug.trace("[Campfire] Branch Alias " + self + " assigned new reference " + woodref)
		Handle_Branch(woodform, woodref)
	endif
EndEvent

function Handle_Branch(Form akBaseObject, ObjectReference akReference)
	if akBaseObject == CoastDriftWood01
		PlaceNodeController(_Camp_BranchHarvestNode1, akReference)
	elseif akBaseObject == CoastDriftWood02
		PlaceNodeController(_Camp_BranchHarvestNode2, akReference)
	elseif akBaseObject == CoastDriftWood03
		PlaceNodeController(_Camp_BranchHarvestNode3, akReference)
	elseif akBaseObject == TreeReachBranchPile01
		PlaceNodeController(_Camp_BranchHarvestNode4, akReference)
	elseif akBaseObject == TreeReachBranchPile02
		PlaceNodeController(_Camp_BranchHarvestNode5, akReference)
	endif
endFunction

function PlaceNodeController(Activator akNodeController, ObjectReference akReference)
	ObjectReference my_node = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HarvestableBranchActivators, akReference, 1.0)
	_Camp_BranchHarvestNodeController my_controller = None
	if !my_node
		my_node = akReference.PlaceAtMe(akNodeController, abInitiallyDisabled = true)
		if my_node
			;debug.trace("[Campfire] Placed branch node " + my_node)
			my_node.SetScale(akReference.GetScale())
			my_node.Enable()
			my_controller = my_node as _Camp_BranchHarvestNodeController
			my_controller.Setup(woodref)
		endif
	endif
endFunction