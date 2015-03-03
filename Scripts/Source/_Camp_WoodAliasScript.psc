Scriptname _Camp_WoodAliasScript extends ReferenceAlias

import math
import _CampInternal

Activator property _Camp_WoodHarvestNode auto
Actor property PlayerRef auto

Static property TreeAspenLog01 auto
Static property TreePineForestLog01 auto
Static property TreePineForestLog01Blank auto
Static property TreePineForestLog01BlankSulfur auto
Static property TreePineForestLog01Heavy_SN auto
Static property TreePineForestLog02 auto
Static property TreePineForestLog02_ice auto
Static property TreePineForestLog02Blank auto
Static property TreePineForestLog02Heavy_SN auto
Static property TreePineForestLog02Light_SN auto
Static property TreePineForestLogSm01 auto
Static property TreePineForestLogSm01_HeavySN auto
Static property TreeAspenStump01 auto
Static property TreePineForestCutStump01 auto
Static property TreePineForestCutStump01Heavy_SN auto
Static property TreePineForestCutStump02 auto
Static property TreePineForestCutStump02_HeavySN auto
Static property TreePineForestCutStump02_LightSN auto
Static property TreePineForestStump01 auto
Static property TreePineForestStump01_ice auto
Static property TreePineForestStump01Blank auto
Static property TreePineForestStump01Snow auto
Static property TreePineForestStump02A auto
Static property TreePineForestStump02B auto
Static property TreePineForestUprootedStump01 auto
Static property TreePineForestUprootedStump01_ice auto
Static property TreePineForestUprootedStump01Heavy_SN auto
Static property TreeTundraDriftWood02 auto
Static property TreeTundraDriftWood02Sulfur auto

Activator property _Camp_TreeAspenLog01_Act auto
Activator property _Camp_TreePineForestLog01_Act auto
Activator property _Camp_TreePineForestLog01Blank_Act auto
Activator property _Camp_TreePineForestLog01BlankSulfur_Act auto
Activator property _Camp_TreePineForestLog01Heavy_SN_Act auto
Activator property _Camp_TreePineForestLog02_Act auto
Activator property _Camp_TreePineForestLog02_ice_Act auto
Activator property _Camp_TreePineForestLog02Blank_Act auto
Activator property _Camp_TreePineForestLog02Heavy_SN_Act auto
Activator property _Camp_TreePineForestLog02Light_SN_Act auto
Activator property _Camp_TreePineForestLogSm01_Act auto
Activator property _Camp_TreePineForestLogSm01_HeavySN_Act auto
Activator property _Camp_TreeAspenStump01_Act auto
Activator property _Camp_TreePineForestCutStump01_Act auto
Activator property _Camp_TreePineForestCutStump01Heavy_SN_Act auto
Activator property _Camp_TreePineForestCutStump02_Act auto
Activator property _Camp_TreePineForestCutStump02_HeavySN_Act auto
Activator property _Camp_TreePineForestCutStump02_LightSN_Act auto
Activator property _Camp_TreePineForestStump01_Act auto
Activator property _Camp_TreePineForestStump01_ice_Act auto
Activator property _Camp_TreePineForestStump01Blank_Act auto
Activator property _Camp_TreePineForestStump01Snow_Act auto
Activator property _Camp_TreePineForestStump02A_Act auto
Activator property _Camp_TreePineForestStump02B_Act auto
Activator property _Camp_TreePineForestUprootedStump01_Act auto
Activator property _Camp_TreePineForestUprootedStump01_ice_Act auto
Activator property _Camp_TreePineForestUprootedStump01Heavy_SN_Act auto
Activator property _Camp_TreeTundraDriftWood02_Act auto
Activator property _Camp_TreeTundraDriftWood02Sulfur_Act auto

ObjectReference property woodref auto hidden
FormList property _Camp_HarvestableWood_AspenStumps auto
FormList property _Camp_HarvestableWood_AspenLogs auto
FormList property _Camp_HarvestableWood_SmallPineLogs auto
FormList property _Camp_HarvestableWood_SmallPineStumps auto
FormList property _Camp_HarvestableWood_DeadTrees auto
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
		debug.trace("[Campfire] Log / Stump Alias " + self + " assigned new reference " + woodref)

		if _Camp_HarvestableWood_Stumps.HasForm(woodform)
			HandleStumps(woodform, woodref)
		elseif _Camp_HarvestableWood_Logs.HasForm(woodform)
			HandleLogs(woodform, woodref)
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

function HandleStumps(Form akBaseObject, ObjectReference akReference)
	if akBaseObject == TreeAspenStump01
		PlaceNodeController(_Camp_TreeAspenStump01_Act, akReference)
	elseif akBaseObject == TreePineForestCutStump01
		PlaceNodeController(_Camp_TreePineForestCutStump01_Act, akReference)
	elseif akBaseObject == TreePineForestCutStump01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestCutStump01Heavy_SN_Act, akReference)
	elseif akBaseObject == TreePineForestCutStump02
		PlaceNodeController(_Camp_TreePineForestCutStump02_Act, akReference)
	elseif akBaseObject == TreePineForestCutStump02_HeavySN
		PlaceNodeController(_Camp_TreePineForestCutStump02_HeavySN_Act, akReference)
	elseif akBaseObject == TreePineForestCutStump02_LightSN
		PlaceNodeController(_Camp_TreePineForestCutStump02_LightSN_Act, akReference)
	elseif akBaseObject == TreePineForestStump01
		PlaceNodeController(_Camp_TreePineForestStump01_Act, akReference)
	elseif akBaseObject == TreePineForestStump01_ice
		PlaceNodeController(_Camp_TreePineForestStump01_ice_Act, akReference)
	elseif akBaseObject == TreePineForestStump01Blank
		PlaceNodeController(_Camp_TreePineForestStump01Blank_Act, akReference)
	elseif akBaseObject == TreePineForestStump01Snow
		PlaceNodeController(_Camp_TreePineForestStump01Snow_Act, akReference)
	elseif akBaseObject == TreePineForestStump02A
		PlaceNodeController(_Camp_TreePineForestStump02A_Act, akReference)
	elseif akBaseObject == TreePineForestStump02B
		PlaceNodeController(_Camp_TreePineForestStump02B_Act, akReference)
	elseif akBaseObject == TreePineForestUprootedStump01
		PlaceNodeController(_Camp_TreePineForestUprootedStump01_Act, akReference)
	elseif akBaseObject == TreePineForestUprootedStump01_ice
		PlaceNodeController(_Camp_TreePineForestUprootedStump01_ice_Act, akReference)
	elseif akBaseObject == TreePineForestUprootedStump01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestUprootedStump01Heavy_SN_Act, akReference)
	elseif akBaseObject == TreeTundraDriftWood02
		PlaceNodeController(_Camp_TreeTundraDriftWood02_Act, akReference)
	elseif akBaseObject == TreeTundraDriftWood02Sulfur
		PlaceNodeController(_Camp_TreeTundraDriftWood02Sulfur_Act, akReference)
	endif
endFunction

function HandleLogs(Form akBaseObject, ObjectReference akReference)
	if akBaseObject == TreeAspenLog01
		PlaceNodeController(_Camp_TreeAspenLog01_Act, akReference)
	elseif akBaseObject == TreePineForestLog01
		PlaceNodeController(_Camp_TreePineForestLog01_Act, akReference)
	elseif akBaseObject == TreePineForestLog01Blank
		PlaceNodeController(_Camp_TreePineForestLog01Blank_Act, akReference)
	elseif akBaseObject == TreePineForestLog01BlankSulfur
		PlaceNodeController(_Camp_TreePineForestLog01BlankSulfur_Act, akReference)
	elseif akBaseObject == TreePineForestLog01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestLog01Heavy_SN_Act, akReference)
	elseif akBaseObject == TreePineForestLog02
		PlaceNodeController(_Camp_TreePineForestLog02_Act, akReference)
	elseif akBaseObject == TreePineForestLog02_ice
		PlaceNodeController(_Camp_TreePineForestLog02_ice_Act, akReference)
	elseif akBaseObject == TreePineForestLog02Blank
		PlaceNodeController(_Camp_TreePineForestLog02Blank_Act, akReference)
	elseif akBaseObject == TreePineForestLog02Heavy_SN
		PlaceNodeController(_Camp_TreePineForestLog02Heavy_SN_Act, akReference)
	elseif akBaseObject == TreePineForestLog02Light_SN
		PlaceNodeController(_Camp_TreePineForestLog02Light_SN_Act, akReference)
	elseif akBaseObject == TreePineForestLogSm01
		PlaceNodeController(_Camp_TreePineForestLogSm01_Act, akReference)
	elseif akBaseObject == TreePineForestLogSm01_HeavySN
		PlaceNodeController(_Camp_TreePineForestLogSm01_HeavySN_Act, akReference)
	endif
endFunction

function Handle_AspenStump(ObjectReference akReference)
	remaining_yields = 3
	tinder_yield_chance = 0.05
	min_yield_branch = 0
	max_yield_branch = 1
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
	max_yield_branch = 1
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

function Handle_DeadTree(ObjectReference akReference)
	remaining_yields = 3
	tinder_yield_chance = 0.05
	min_yield_branch = 0
	max_yield_branch = 0
	min_yield_deadwood = 1
	max_yield_deadwood = 2
	is_stump = true
	should_stand = true
	disable_on_depleted = true

	MoveActivatorIfActiveNode(required_activator_dead_tree, akReference)
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