scriptname _Camp_BranchAliasScript extends ReferenceAlias

import math
import _CampInternal

Activator property _Camp_TreeHarvestNode auto
Actor property PlayerRef auto
ObjectReference property required_activator_branch auto
ObjectReference property my_activator auto hidden
ObjectReference property woodref auto hidden

float tinder_yield_chance
int min_yield_branch
int max_yield_branch
bool disable_on_depleted

Event OnInit()
	woodref = self.GetRef()
	Form woodform
	if woodref
		woodform = woodref.GetBaseObject()
		debug.trace("[Campfire] Branch Alias " + self + " assigned new reference " + woodref)

		;No need to check _Camp_HarvestableBranches
		Handle_Branch(woodref)
	endif
EndEvent

function MoveActivatorIfActiveNode(ObjectReference akActivator, ObjectReference akTarget)
	_Camp_BranchTreeHarvestNodeController my_controller = GetNearestNodeController()
	if !my_controller || (my_controller && !IsDepletedNodeController(my_controller))
		my_activator = akActivator
		if my_controller
			my_controller.current_activator = my_activator
		endif
		(my_activator as _Camp_BranchActivatorScript).my_wood_alias = self
		my_activator.MoveTo(akTarget)
	endif
endFunction

function Handle_Branch(ObjectReference akReference)
	tinder_yield_chance = 0.0
	min_yield_branch = 1
	max_yield_branch = 1
	disable_on_depleted = true
	
	MoveActivatorIfActiveNode(required_activator_branch, akReference)
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