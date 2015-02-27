Scriptname _Camp_WoodAliasScript extends ReferenceAlias

import math
import _CampInternal

Activator property _Camp_WoodHarvestNode auto
Actor property PlayerRef auto
ObjectReference property required_activator_aspen_stump auto
ObjectReference property required_activator_aspen_log auto
ObjectReference property required_activator_small_pine_log auto
ObjectReference property required_activator_small_pine_stump auto
ObjectReference property my_activator auto hidden
ObjectReference property woodref auto hidden
FormList property _Camp_HarvestableWood_AspenStumps auto
FormList property _Camp_HarvestableWood_AspenLogs auto
FormList property _Camp_HarvestableWood_SmallPineLogs auto
FormList property _Camp_HarvestableWood_SmallPineStumps auto
FormList property woodChoppingAxes auto
Message property WoodChoppingFailureMessage auto

int remaining_yields
float tinder_yield_chance
int min_yield_branch
int max_yield_branch
int min_yield_deadwood
int max_yield_deadwood
bool is_stump
bool should_stand
bool disable_on_depleted

Event OnInit()
	woodref = self.GetRef()
	Form woodform
	if woodref
		woodform = woodref.GetBaseObject()
		;debug.trace("[Campfire] Alias " + self + " assigned new reference " + woodref)

		if _Camp_HarvestableWood_AspenStumps.HasForm(woodform)
			Handle_AspenStump(woodref)
		elseif _Camp_HarvestableWood_AspenLogs.HasForm(woodform)
			Handle_AspenLog(woodref)
		elseif _Camp_HarvestableWood_SmallPineLogs.HasForm(woodform)
			Handle_SmallPineLog(woodref)
		elseif _Camp_HarvestableWood_SmallPineStumps.HasForm(woodform)
			Handle_SmallPineStump(woodref)
		endif
	endif
EndEvent

float[] function GetGlobalOffset(ObjectReference akSource, Float afDistance, float afOffset = 0.0)
    Float A = akSource.GetAngleZ() + afOffset
    Float YDist = Sin(A)
    Float XDist = Cos(A)

    XDist *= afDistance
    YDist *= afDistance

    Float[] Offsets = New Float[2]
    Offsets[0] = YDist
    Offsets[1] = XDist
    Return Offsets
EndFunction

function MoveActivatorIfActiveNode(ObjectReference akActivator, ObjectReference akTarget)
	_Camp_WoodHarvestNodeController my_controller = GetNearestNodeController()
	if !my_controller || (my_controller && !IsDepletedNodeController(my_controller))
		my_activator = akActivator
		if my_controller
			my_controller.current_activator = my_activator
		endif
		(my_activator as _Camp_WoodActivatorScript).my_wood_alias = self
		my_activator.MoveTo(akTarget)
	endif
endFunction

function Handle_AspenStump(ObjectReference akReference)
	remaining_yields = 3
	tinder_yield_chance = 0.05
	min_yield_branch = 0
	max_yield_branch = 0
	min_yield_deadwood = 1
	max_yield_deadwood = 3
	is_stump = true
	should_stand = true
	disable_on_depleted = true

	;@TODO: -4 Y Adj
	MoveActivatorIfActiveNode(required_activator_aspen_stump, akReference)
endFunction

function Handle_AspenLog(ObjectReference akReference)
	remaining_yields = 3
	tinder_yield_chance = 0.1
	min_yield_branch = 0
	max_yield_branch = 2
	min_yield_deadwood = 2
	max_yield_deadwood = 4
	is_stump = false
	should_stand = false
	disable_on_depleted = true

	MoveActivatorIfActiveNode(required_activator_aspen_log, akReference)
endFunction

function Handle_SmallPineLog(ObjectReference akReference)
	remaining_yields = 3
	tinder_yield_chance = 0.1
	min_yield_branch = 0
	max_yield_branch = 2
	min_yield_deadwood = 2
	max_yield_deadwood = 4
	is_stump = false
	should_stand = false
	disable_on_depleted = true

	;@TODO: -20 Z Adj
	MoveActivatorIfActiveNode(required_activator_small_pine_log, akReference)
endFunction

function Handle_SmallPineStump(ObjectReference akReference)
	remaining_yields = 3
	tinder_yield_chance = 0.05
	min_yield_branch = 0
	max_yield_branch = 0
	min_yield_deadwood = 1
	max_yield_deadwood = 3
	is_stump = true
	should_stand = false
	disable_on_depleted = true

	MoveActivatorIfActiveNode(required_activator_small_pine_stump, akReference)
endFunction

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if akAggressor == PlayerRef && woodChoppingAxes.HasForm(akSource)
		ControllerInterface_HitWithAxe()
	endif
EndEvent

function Activated()
	if PlayerRef.GetItemCount(woodChoppingAxes) == 0
		WoodChoppingFailureMessage.Show()
		return
	endif
	ControllerInterface_ActivatedWithAxe()
endFunction

function ControllerInterface_HitWithAxe()
	_Camp_WoodHarvestNodeController my_controller = GetNodeController()
	if my_controller
		my_controller.HitWithAxe()
	endif
endFunction

function ControllerInterface_ActivatedWithAxe()
	_Camp_WoodHarvestNodeController my_controller = GetNodeController()
	if my_controller
		my_controller.ActivatedWithAxe()
	endif
endFunction

_Camp_WoodHarvestNodeController function GetNearestNodeController()
	ObjectReference my_node = Game.FindClosestReferenceOfTypeFromRef(_Camp_WoodHarvestNode, self.GetRef(), 1.0)
	_Camp_WoodHarvestNodeController my_controller = None
	if my_node
		my_controller = my_node as _Camp_WoodHarvestNodeController
		if my_controller
			return my_controller
		else
			return None
		endif
	else
		return None
	endif
endFunction

bool function IsDepletedNodeController(_Camp_WoodHarvestNodeController my_controller)
	if my_controller.remaining_yields <= 0
		return true
	else
		return false
	endif
endFunction

_Camp_WoodHarvestNodeController function GetNodeController()
	ObjectReference my_node = Game.FindClosestReferenceOfTypeFromRef(_Camp_WoodHarvestNode, self.GetRef(), 1.0)
	_Camp_WoodHarvestNodeController my_controller = None
	if !my_node
		my_node = PlaceAndWaitFor3DLoaded(self.GetRef(), _Camp_WoodHarvestNode)
		if my_node
			my_controller = my_node as _Camp_WoodHarvestNodeController
			my_controller.Setup(remaining_yields, tinder_yield_chance, min_yield_branch, max_yield_branch, 	\
							min_yield_deadwood, max_yield_deadwood, is_stump, should_stand, disable_on_depleted, 		\
							my_activator, woodref)
			return my_controller
		else
			return None
		endif
	else
		my_controller = my_node as _Camp_WoodHarvestNodeController
		my_controller.current_activator = my_activator
		return my_controller
	endif
endFunction

;/float[] dist = GetGlobalOffset(self.GetRef(), -64.0, -90.0)
	_Camp_HarvestLogActivatorRef.MoveTo(self.GetRef(), dist[1], dist[0])
	debug.trace("[Campfire] x dist " + dist[1] + " y dist " + dist[0])
/;