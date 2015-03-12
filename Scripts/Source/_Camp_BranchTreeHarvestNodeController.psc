scriptname _Camp_BranchTreeHarvestNodeController extends ObjectReference

import Utility

float RESET_TIME = 24.0
float BACKOFF_TIME
int RECURSIVE_SEARCH_COUNT = 5
float RECURSIVE_SEARCH_DISTANCE = 1000.0
MiscObject property _Camp_Tinder auto
MiscObject property _Camp_DeadwoodBranch auto
Activator property _Camp_HarvestBranchTree_Node auto
Activator property _Camp_ZTestReceiver auto
Spell property _Camp_BranchZTestSpell auto
Actor property PlayerRef auto
;ObjectReference property my_wood_ref auto hidden
FormList property _Camp_HarvestableBranchTrees auto
FormList property _Camp_HarvestableBranchTrees_Snow auto
;ObjectReference property current_activator auto hidden
bool property harvested = false auto hidden
float property tinder_yield_chance auto hidden
int property min_yield_branch auto hidden
int property max_yield_branch auto hidden
;bool property disable_on_depleted auto hidden
bool eligible_for_reset = false
int current_recursion_depth = 0

function Setup(float _tinder_yield_chance, 								\
			   int _min_yield_branch, int _max_yield_branch)

	;debug.trace("[Campfire] Setting up new branch / tree harvesting node " + self)
	tinder_yield_chance = _tinder_yield_chance
	min_yield_branch = _min_yield_branch
	max_yield_branch = _max_yield_branch
	;disable_on_depleted = _disable_on_depleted
	;current_activator = _current_activator
	;my_wood_ref = _my_wood_ref
	;current_recursion_depth = _current_recursion_depth
	RegisterForSingleUpdate(0.1)
endFunction

Event OnUpdate()
	current_recursion_depth += 1
	; Use a recursive method to seek out nearby trees and spread.
	int i = 0
	;/while i < RECURSIVE_SEARCH_COUNT
		SearchForNearbyTrees()
		i += 1
	endWhile
	/;

	;Store a random back-off value for use during reset
	BACKOFF_TIME = RandomFloat(0.0, 3.0)

	RegisterForModEvent("Campfire_WoodHarvestNodeReset", "WoodHarvestNodeReset")
EndEvent

;/function SearchForNearbyTrees()
	ObjectReference woodref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_HarvestableBranchTrees, self, RECURSIVE_SEARCH_DISTANCE)
	if woodref && self.GetDistance(woodref) > 300.0
		;debug.trace("[Campfire] Woodpile Alias " + self + " assigned new reference " + woodref)
		
		;;;if _Camp_HarvestableBranchTrees_Snow.HasForm(woodform)
			Handle_Tree(woodref, true)
		else
			Handle_Tree(woodref, false)
		endif
		
		Handle_Tree(woodref)
		;;;
	endif
endFunction
/;


function Handle_Tree(ObjectReference akReference)
	;/if snow
		PlaceNodeController(_Camp_HarvestBranchTree_Node, akReference, 0.05, 1, 2)
	else
		PlaceNodeController(_Camp_HarvestBranchTree_Node, akReference, 0.10, 1, 3)
	endif
	/;
	ObjectReference tr = akReference.PlaceAtMe(_Camp_ZTestReceiver)
	tr.MoveTo(tr, afZOffset = -2000.0)
	debug.trace("[Campfire] Firing...")
	_Camp_BranchZTestSpell.Cast(akReference, tr)
endFunction

	

;/function PlaceNodeController(Activator akActivator, ObjectReference woodref,										\
											float tinder_yield_chance, 												\
											int min_yield_branch, int max_yield_branch)
	ObjectReference my_node = Game.FindClosestReferenceOfTypeFromRef(_Camp_HarvestBranchTree_Node, woodref, 1.0)
	_Camp_BranchTreeHarvestNodeController my_controller = None
	if !my_node
		my_node = woodref.PlaceAtMe(akActivator, abInitiallyDisabled = True)
		if my_node
			debug.trace("[Campfire] (Depth " + current_recursion_depth + ") Recursively placed tree branch node " + my_node)
			float tree_scale = woodref.GetScale()
			float my_scale = (tree_scale * 0.65)
			my_node.SetScale(my_scale)
			my_node.Enable()
			my_controller = my_node as _Camp_BranchTreeHarvestNodeController
			my_controller.Setup(tinder_yield_chance, min_yield_branch, max_yield_branch, woodref, current_recursion_depth)
		endif
	endif
endFunction
/;

Event OnActivate(ObjectReference akActionRef)
	YieldResources(akActionRef)
EndEvent

function YieldResources(ObjectReference akActionRef)
	if !harvested
		harvested = true

		int branch_count = RandomInt(min_yield_branch, max_yield_branch)
		float tinder_roll = RandomFloat(0.01, 1.0)

		if branch_count > 0
			akActionRef.AddItem(_Camp_DeadwoodBranch, branch_count)
		endif
		if tinder_roll <= tinder_yield_chance
			akActionRef.AddItem(_Camp_Tinder)
		endif

		;/if current_activator
			(current_activator as _Camp_TreeActivatorScript).GoHome()
		endif
		if disable_on_depleted && my_wood_ref
			my_wood_ref.DisableNoWait(true)
		endif
		/;
		self.DisableNoWait()

		;Stagger updates every 21 - 27 hours to avoid hammering the system all at once
		float _reset_time = RESET_TIME - RandomInt(-3, 3)
		;debug.trace("[Campfire] Tree respawning in " + _reset_time + " hours")
		RegisterForSingleUpdateGameTime(_reset_time)
	endif
endFunction

Event WoodHarvestNodeReset()
	debug.trace("[Campfire] " + self + " received global reset signal for wood harvest node, reverting...")
	RegisterForSingleUpdateGameTime(0.0)
endEvent

Event OnCellDetach()
	;debug.trace("[Campfire] Detached from cell, checking deletion eligibility...")
	if eligible_for_reset || !harvested
		utility.wait(BACKOFF_TIME)
		RegisterForSingleUpdateGameTime(0.0)
	endif
EndEvent

Event OnUpdateGameTime()
	;debug.trace("[Campfire] Node resetting after prescribed game time.")
	eligible_for_reset = true
	if !self.GetParentCell() || !self.GetParentCell().IsAttached()
		utility.wait(BACKOFF_TIME)
		NodeReset()
	else
		;debug.trace("[Campfire] Still attached; waiting for unload.")
	endif
EndEvent

function NodeReset()
	;debug.trace("[Campfire] Tree Harvest Node Controller resetting object.")
	UnregisterForModEvent("Campfire_WoodHarvestNodeReset")
	;if my_wood_ref && my_wood_ref.IsDisabled()
	;	my_wood_ref.Enable()
	;endif
	self.Disable()
	self.Delete()
endFunction