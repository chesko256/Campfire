scriptname _Camp_TreeAliasScript extends ReferenceAlias

import math
import _CampInternal

Activator property _Camp_TreeHarvestNode auto
Actor property PlayerRef auto
ObjectReference property required_activator_smalltree auto
ObjectReference property required_activator_medtree auto
ObjectReference property my_activator auto hidden
ObjectReference property woodref auto hidden
Formlist property _Camp_HarvestableBranchTrees_Med auto
Formlist property _Camp_HarvestableBranchTrees_Small auto
Formlist property _Camp_HarvestableBranchTrees_Snow auto

float tinder_yield_chance
int min_yield_branch
int max_yield_branch
bool disable_on_depleted

Event OnInit()
	woodref = self.GetRef()
	Form woodform
	if woodref
		woodform = woodref.GetBaseObject()
		;debug.trace("[Campfire] Tree Alias " + self + " assigned new reference " + woodref)

		if _Camp_HarvestableBranchTrees_Small.HasForm(woodform)
			if _Camp_HarvestableBranchTrees_Snow.HasForm(woodform)
				Handle_SmallTree(woodref, true)
			else
				Handle_SmallTree(woodref, false)
			endif
		elseif _Camp_HarvestableBranchTrees_Med.HasForm(woodform)
			if _Camp_HarvestableBranchTrees_Snow.HasForm(woodform)
				Handle_MedTree(woodref, true)
			else
				Handle_MedTree(woodref, false)
			endif
		endif
	endif
EndEvent

function MoveActivatorIfActiveNode(ObjectReference akActivator, ObjectReference akTarget)
	_Camp_BranchTreeHarvestNodeController my_controller = GetNearestNodeController()
	if !my_controller || (my_controller && !IsDepletedNodeController(my_controller))
		my_activator = akActivator
		if my_controller
			my_controller.current_activator = my_activator
		endif
		(my_activator as _Camp_TreeActivatorScript).my_wood_alias = self
		my_activator.MoveTo(akTarget)
	endif
endFunction

function Handle_SmallTree(ObjectReference akReference, bool snow)
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