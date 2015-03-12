scriptname _Camp_TreeAliasScript extends ReferenceAlias

import math
import _CampInternal

;Activator property _Camp_TreeHarvestNode auto
Activator property _Camp_HarvestBranchTree_Node auto
Actor property PlayerRef auto
;ObjectReference property required_activator_smalltree auto
;ObjectReference property required_activator_medtree auto
;ObjectReference property my_activator auto hidden
ObjectReference property woodref auto hidden
Formlist property _Camp_HarvestableBranchTrees auto

Event OnInit()
	woodref = self.GetRef()
	if woodref && !(Game.FindClosestReferenceOfTypeFromRef(_Camp_HarvestBranchTree_Node, woodref, 800.0))
		;debug.trace("[Campfire] Tree Alias " + self + " assigned new reference " + woodref)
		Handle_Tree(woodref)
	endif
EndEvent

;debug
spell property _Camp_BranchZTestSpell auto
Activator property _Camp_ZTestReceiver auto
;debug
function Handle_Tree(ObjectReference akReference)
	ObjectReference tr = self.getref().PlaceAtMe(_Camp_ZTestReceiver)
	debug.trace("[Campfire] Firing...")
	tr.MoveTo(tr, afZOffset = -2000.0)
	_Camp_BranchZTestSpell.Cast(self.GetRef(), tr)
	;PlaceNodeController(_Camp_HarvestBranchTree_Node, akReference, tinder_yield_chance, min_yield_branch, max_yield_branch)
endFunction

;/function Handle_SmallTree(ObjectReference akReference, bool snow)
	if snow
		tinder_yield_chance = 0.1
		min_yield_branch = 1
		max_yield_branch = 1
		disable_on_depleted = false
	else
		tinder_yield_chance = 0.2
		min_yield_branch = 1
		max_yield_branch = 2
		disable_on_depleted = false
	endif

	MoveActivatorIfActiveNode(required_activator_smalltree, akReference)
endFunction

function Handle_MedTree(ObjectReference akReference, bool snow)
	if snow
		tinder_yield_chance = 0.1
		min_yield_branch = 1
		max_yield_branch = 2
		disable_on_depleted = false
	else
		tinder_yield_chance = 0.2
		min_yield_branch = 1
		max_yield_branch = 3
		disable_on_depleted = false
	endif

	MoveActivatorIfActiveNode(required_activator_medtree, akReference)
endFunction

function Activated()
	ControllerInterface_Activated()
endFunction

function ControllerInterface_Activated()
	_Camp_BranchTreeHarvestNodeController my_controller = GetNodeController()
	if my_controller
		my_controller.YieldResources()
	endif
endFunction

_Camp_BranchTreeHarvestNodeController function GetNearestNodeController()
	ObjectReference my_node = Game.FindClosestReferenceOfTypeFromRef(_Camp_TreeHarvestNode, self.GetRef(), 1.0)
	_Camp_BranchTreeHarvestNodeController my_controller = None
	if my_node
		my_controller = my_node as _Camp_BranchTreeHarvestNodeController
		if my_controller
			return my_controller
		else
			return None
		endif
	else
		return None
	endif
endFunction

bool function IsDepletedNodeController(_Camp_BranchTreeHarvestNodeController my_controller)
	if my_controller.harvested
		return true
	else
		return false
	endif
endFunction


_Camp_BranchTreeHarvestNodeController function GetNodeController()
	ObjectReference my_node = Game.FindClosestReferenceOfTypeFromRef(_Camp_TreeHarvestNode, self.GetRef(), 1.0)
	_Camp_BranchTreeHarvestNodeController my_controller = None
	if !my_node
		my_node = PlaceAndWaitFor3DLoaded(self.GetRef(), _Camp_TreeHarvestNode)
		if my_node
			my_controller = my_node as _Camp_BranchTreeHarvestNodeController
			my_controller.Setup(tinder_yield_chance, min_yield_branch, max_yield_branch, 	\
							disable_on_depleted, my_activator, woodref)
			return my_controller
		else
			return None
		endif
	else
		my_controller = my_node as _Camp_BranchTreeHarvestNodeController
		my_controller.current_activator = my_activator
		return my_controller
	endif
endFunction
/;

;/function PlaceNodeController(Activator akActivator, ObjectReference woodref,										\
											float tinder_yield_chance, 												\
											int min_yield_branch, int max_yield_branch)
	ObjectReference my_node = Game.FindClosestReferenceOfTypeFromRef(_Camp_HarvestBranchTree_Node, woodref, 1.0)
	_Camp_BranchTreeHarvestNodeController my_controller = None
	if !my_node
		my_node = woodref.PlaceAtMe(akActivator, abInitiallyDisabled = True)
		if my_node
			debug.trace("[Campfire] (Depth 0) Placed tree branch node " + my_node)
			;float tree_scale = woodref.GetScale()
			;float my_scale = (tree_scale * 0.55)
			;my_node.SetScale()
			my_node.Enable()
			my_controller = my_node as _Camp_BranchTreeHarvestNodeController
			my_controller.Setup(tinder_yield_chance, min_yield_branch, max_yield_branch, woodref, 0)
		endif
	else
		;debug.trace("[Campfire] my_node " + my_node + " for ref " + woodref + " already exists.")
	endif
endFunction
/;