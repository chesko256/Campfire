Scriptname _Frost_WoodAliasScript extends ReferenceAlias

import math
import _CampInternal

_Camp_Compatibility property Compatibility auto
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
Static property TreePineForestHollow01 auto
Static property TreePineForestHollow01Snow auto
Static property TreePineForestHollow01Sulfur auto
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

Activator property _Camp_TreeAspenLog01_Node auto
Activator property _Camp_TreePineForestLog01_Node auto
Activator property _Camp_TreePineForestLog02_Node auto
Activator property _Camp_TreePineForestLogSm01_Node auto
Activator property _Camp_TreeAspenStump01_Node auto
Activator property _Camp_TreePineForestCutStump01_Node auto
Activator property _Camp_TreePineForestCutStump02_Node auto
Activator property _Camp_TreePineForestStump01_Node auto
Activator property _Camp_TreePineForestStump02A_Node auto
Activator property _Camp_TreePineForestStump02B_Node auto
Activator property _Camp_TreePineForestUprootedStump01_Node auto
Activator property _Camp_TreeTundraDriftWood02_Node auto
Activator property _Camp_TreePineForestUprooted01_Node auto
Activator property _Camp_TreePineForestHollow01_Node auto
Activator property _Camp_TreeReachTreeStump01_Node auto

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
		PlaceNodeController(_Camp_TreeAspenStump01_Node, akReference, \
							3, 0.05, 0, 1, 1, 2, true, true, true)

	elseif akBaseObject == TreePineForestCutStump01 ||						\
		   akBaseObject == TreePineForestCutStump01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestCutStump01_Node, akReference, \
							3, 0.05, 0, 0, 1, 2, true, false, false)

	elseif akBaseObject == TreePineForestCutStump02 || 						\
		   akBaseObject == TreePineForestCutStump02_HeavySN || 				\
		   akBaseObject == TreePineForestCutStump02_LightSN
		PlaceNodeController(_Camp_TreePineForestCutStump02_Node, akReference, \
							3, 0.05, 0, 0, 1, 1, true, false, true)
	
	elseif akBaseObject == TreePineForestStump01 ||							\
		   akBaseObject == TreePineForestStump01_ice ||						\
		   akBaseObject == TreePineForestStump01Blank ||					\
		   akBaseObject == TreePineForestStump01Snow
		PlaceNodeController(_Camp_TreePineForestStump01_Node, akReference, \
							3, 0.05, 0, 0, 1, 2, true, true, false)

	elseif akBaseObject == TreePineForestStump02A
		PlaceNodeController(_Camp_TreePineForestStump02A_Node, akReference, \
							3, 0.05, 0, 0, 1, 1, true, true, false)

	elseif akBaseObject == TreePineForestStump02B
		PlaceNodeController(_Camp_TreePineForestStump02B_Node, akReference, \
							3, 0.05, 0, 0, 1, 1, true, true, false)

	elseif akBaseObject == TreePineForestUprootedStump01 ||					\
		   akBaseObject == TreePineForestUprootedStump01_ice ||				\
		   akBaseObject == TreePineForestUprootedStump01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestUprootedStump01_Node, akReference, \
							3, 0.05, 0, 0, 1, 2, true, false, false)
	
	elseif akBaseObject == TreeTundraDriftWood02 ||							\
		   akBaseObject == TreeTundraDriftWood02Sulfur
		PlaceNodeController(_Camp_TreeTundraDriftWood02_Node, akReference, \
							3, 0.05, 0, 0, 1, 2, false, true, true)
	
	elseif akBaseObject == TreeReachTreeStump01
		PlaceNodeController(_Camp_TreeReachTreeStump01_Node, akReference, \
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
		PlaceNodeController(_Camp_TreeAspenLog01_Node, akReference, 	\
							3, 0.1, 0, 1, 1, 2, false, false, true)

	elseif akBaseObject == TreePineForestLog01 ||						\
		   akBaseObject == TreePineForestLog01Blank ||					\ 
		   akBaseObject == TreePineForestLog01BlankSulfur ||			\
		   akBaseObject == TreePineForestLog01Heavy_SN
		PlaceNodeController(_Camp_TreePineForestLog01_Node, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)
	
	elseif akBaseObject == TreePineForestLog02 ||						\
		   akBaseObject == TreePineForestLog02_ice ||					\
		   akBaseObject == TreePineForestLog02Blank ||					\
		   akBaseObject == TreePineForestLog02Heavy_SN ||				\
		   akBaseObject == TreePineForestLog02Light_SN
		PlaceNodeController(_Camp_TreePineForestLog02_Node, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, false)

	elseif akBaseObject == TreePineForestLogSm01 ||						\
		   akBaseObject == TreePineForestLogSm01_HeavySN
		PlaceNodeController(_Camp_TreePineForestLogSm01_Node, akReference, \
							3, 0.1, 0, 1, 1, 2, false, false, true)
	
	elseif akBaseObject == TreePineForestUprooted01
		PlaceNodeController(_Camp_TreePineForestUprooted01_Node, akReference, \
							3, 0.1, 0, 2, 2, 3, false, false, false)

	elseif akBaseObject == TreePineForestHollow01 ||					\
		   akBaseObject == TreePineForestHollow01Snow ||				\
	       akBaseObject == TreePineForestHollow01Sulfur
	    PlaceNodeController(_Camp_TreePineForestHollow01_Node, akReference, \
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