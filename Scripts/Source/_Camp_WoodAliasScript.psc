Scriptname _Camp_WoodAliasScript extends ReferenceAlias

import math
import _CampInternal

_Camp_Compatibility property Compatibility auto
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
Static property TreePineForestUprooted01 auto
Tree property TreeReachTreeStump01 auto hidden

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
Activator property _Camp_TreePineForestUprooted01_Act auto
 Activator property _Camp_TreeReachTreeStump01_Act auto

ObjectReference property woodref auto hidden
FormList property _Camp_HarvestableWoodActivators auto
FormList property _Camp_HarvestableWood_Stumps auto
FormList property _Camp_HarvestableWood_Logs auto
FormList property woodChoppingAxes auto
Message property WoodChoppingFailureMessage auto

Event OnInit()
	;Assign Tree form at runtime
	TreeReachTreeStump01 = Compatibility.TreeReachTreeStump01

	woodref = self.GetRef()
	Form woodform
	if woodref
		woodform = woodref.GetBaseObject()
		;debug.trace("[Campfire] Log / Stump Alias " + self + " assigned new reference " + woodref)
		if _Camp_HarvestableWood_Stumps.HasForm(woodform)
			HandleStumps(woodform, woodref)
		elseif _Camp_HarvestableWood_Logs.HasForm(woodform)
			HandleLogs(woodform, woodref)
		endif
	endif
EndEvent

function HandleStumps(Form akBaseObject, ObjectReference akReference)
	;/remaining_yields
	tinder_yield_chance
	min_yield_branch
	max_yield_branch
	min_yield_deadwood
	max_yield_deadwood
	is_stump
	should_stand
	disable_on_depleted /;

	if akBaseObject == TreeAspenStump01
		PlaceNodeController(_Camp_TreeAspenStump01_Act, akReference, \
							3, 0.05, 0, 1, 1, 2, true, true, true)
	elseif akBaseObject == TreePineForestCutStump01
		PlaceNodeController(_Camp_TreePineForestCutStump01_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, true, false, false)
	elseif akBaseObject == TreePineForestCutStump01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestCutStump01Heavy_SN_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, true, false, false)
	elseif akBaseObject == TreePineForestCutStump02
		PlaceNodeController(_Camp_TreePineForestCutStump02_Act, akReference, \
							3, 0.05, 0, 0, 1, 1, true, false, true)
	elseif akBaseObject == TreePineForestCutStump02_HeavySN
		PlaceNodeController(_Camp_TreePineForestCutStump02_HeavySN_Act, akReference, \
							3, 0.05, 0, 0, 1, 1, true, false, true)
	elseif akBaseObject == TreePineForestCutStump02_LightSN
		PlaceNodeController(_Camp_TreePineForestCutStump02_LightSN_Act, akReference, \
							3, 0.05, 0, 0, 1, 1, true, false, true)
	elseif akBaseObject == TreePineForestStump01
		PlaceNodeController(_Camp_TreePineForestStump01_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, true, true, false)
	elseif akBaseObject == TreePineForestStump01_ice
		PlaceNodeController(_Camp_TreePineForestStump01_ice_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, true, true, false)
	elseif akBaseObject == TreePineForestStump01Blank
		PlaceNodeController(_Camp_TreePineForestStump01Blank_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, true, true, false)
	elseif akBaseObject == TreePineForestStump01Snow
		PlaceNodeController(_Camp_TreePineForestStump01Snow_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, true, true, false)
	elseif akBaseObject == TreePineForestStump02A
		PlaceNodeController(_Camp_TreePineForestStump02A_Act, akReference, \
							3, 0.05, 0, 0, 1, 1, true, true, false)
	elseif akBaseObject == TreePineForestStump02B
		PlaceNodeController(_Camp_TreePineForestStump02B_Act, akReference, \
							3, 0.05, 0, 0, 1, 1, true, true, false)
	elseif akBaseObject == TreePineForestUprootedStump01
		PlaceNodeController(_Camp_TreePineForestUprootedStump01_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, true, false, false)
	elseif akBaseObject == TreePineForestUprootedStump01_ice
		PlaceNodeController(_Camp_TreePineForestUprootedStump01_ice_Act, akReference, \
							3, 0.05, 0, 0, 1, 1, true, false, false)
	elseif akBaseObject == TreePineForestUprootedStump01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestUprootedStump01Heavy_SN_Act, akReference, \
							3, 0.05, 0, 0, 1, 1, true, false, false)
	elseif akBaseObject == TreeTundraDriftWood02
		PlaceNodeController(_Camp_TreeTundraDriftWood02_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, false, true, true)
	elseif akBaseObject == TreeTundraDriftWood02Sulfur
		PlaceNodeController(_Camp_TreeTundraDriftWood02Sulfur_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, false, true, true)
	elseif akBaseObject == TreeReachTreeStump01
		PlaceNodeController(_Camp_TreeReachTreeStump01_Act, akReference, \
							3, 0.05, 0, 0, 1, 2, true, false, false)
	endif
endFunction

function HandleLogs(Form akBaseObject, ObjectReference akReference)
	;/remaining_yields
	tinder_yield_chance
	min_yield_branch
	max_yield_branch
	min_yield_deadwood
	max_yield_deadwood
	is_stump
	should_stand
	disable_on_depleted/;

	if akBaseObject == TreeAspenLog01
		PlaceNodeController(_Camp_TreeAspenLog01_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, true)
	elseif akBaseObject == TreePineForestLog01
		PlaceNodeController(_Camp_TreePineForestLog01_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLog01Blank
		PlaceNodeController(_Camp_TreePineForestLog01Blank_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLog01BlankSulfur
		PlaceNodeController(_Camp_TreePineForestLog01BlankSulfur_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLog01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestLog01Heavy_SN_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLog02
		PlaceNodeController(_Camp_TreePineForestLog02_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLog02_ice
		PlaceNodeController(_Camp_TreePineForestLog02_ice_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLog02Blank
		PlaceNodeController(_Camp_TreePineForestLog02Blank_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLog02Heavy_SN
		PlaceNodeController(_Camp_TreePineForestLog02Heavy_SN_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLog02Light_SN
		PlaceNodeController(_Camp_TreePineForestLog02Light_SN_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	elseif akBaseObject == TreePineForestLogSm01
		PlaceNodeController(_Camp_TreePineForestLogSm01_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, true)
	elseif akBaseObject == TreePineForestLogSm01_HeavySN
		PlaceNodeController(_Camp_TreePineForestLogSm01_HeavySN_Act, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, true)
	elseif akBaseObject == TreePineForestUprooted01
		PlaceNodeController(_Camp_TreePineForestUprooted01_Act, akReference, \
							3, 0.1, 0, 2, 2, 3, false, false, false)
	endif
endFunction

function PlaceNodeController(Activator akActivator, ObjectReference woodref,										\
											int remaining_yields, float tinder_yield_chance, 						\
											int min_yield_branch, int max_yield_branch, 							\
											int min_yield_deadwood, int max_yield_deadwood, 						\
											bool is_stump, bool should_stand, bool disable_on_depleted)
	ObjectReference my_node = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HarvestableWoodActivators, woodref, 1.0)
	_Camp_WoodHarvestNodeController my_controller = None
	if !my_node
		my_node = woodref.PlaceAtMe(akActivator, abInitiallyDisabled = True)
		if my_node
			my_node.SetScale(woodref.GetScale())
			my_node.Enable()
			my_controller = my_node as _Camp_WoodHarvestNodeController
			my_controller.Setup(remaining_yields, tinder_yield_chance, min_yield_branch, max_yield_branch, 	\
							min_yield_deadwood, max_yield_deadwood, is_stump, should_stand, disable_on_depleted, 		\
							woodref)
		endif
	else
		;debug.trace("[Campfire] my_node " + my_node + " for ref " + woodref + " already exists.")
	endif
endFunction