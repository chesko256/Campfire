scriptname _Frost_BranchHarvestNodeController extends ObjectReference

import Utility

float RESET_TIME = 12.0
float BACKOFF_TIME
int RECURSIVE_SEARCH_COUNT = 5
float RECURSIVE_SEARCH_DISTANCE = 1000.0
bool eligible_for_reset = false
MiscObject property _Camp_DeadwoodBranch auto
Actor property PlayerRef auto
ObjectReference property my_wood_ref auto hidden
bool property harvested = false auto hidden

FormList property _Camp_HarvestableBranches auto
FormList property _Camp_HarvestableBranchActivators auto
Activator property _Camp_BranchHarvestNode1 auto
Activator property _Camp_BranchHarvestNode2 auto
Activator property _Camp_BranchHarvestNode3 auto
Activator property _Camp_BranchHarvestNode4 auto
Activator property _Camp_BranchHarvestNode5 auto
Static property CoastDriftWood01 auto
Static property CoastDriftWood02 auto
Static property CoastDriftWood03 auto
Static property TreeReachBranchPile01 auto
Static property TreeReachBranchPile02 auto

function Setup(ObjectReference _my_wood_ref)
	;debug.trace("[Campfire] Setting up new branch harvesting node " + self)
	my_wood_ref = _my_wood_ref
	RegisterForSingleUpdate(0.1)
endFunction

Event OnUpdate()
	; Use a recursive method to seek out nearby branches and spread.
	int i = 0
	while i < RECURSIVE_SEARCH_COUNT
		SearchForNearbyBranches()
		i += 1
	endWhile

	;Store a random back-off value for use during reset
	BACKOFF_TIME = RandomFloat(0.0, 3.0)
	if !my_wood_ref.GetEnableParent()
		my_wood_ref.DisableNoWait()
	endif
	
	RegisterForModEvent("Campfire_WoodHarvestNodeReset", "WoodHarvestNodeReset")
	float _reset_time = RESET_TIME - RandomInt(-3, 3)
	;debug.trace("[Campfire] Tree respawning in " + _reset_time + " hours")
	RegisterForSingleUpdateGameTime(_reset_time)
endEvent

function SearchForNearbyBranches()
	ObjectReference woodref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_HarvestableBranches, self, RECURSIVE_SEARCH_DISTANCE)
	if woodref
		Form woodform = woodref.GetBaseObject()
		;debug.trace("[Campfire] Woodpile Alias " + self + " assigned new reference " + woodref)
		if woodform == CoastDriftWood01
			PlaceNodeController(_Camp_BranchHarvestNode1, woodref)
		elseif woodform == CoastDriftWood02
			PlaceNodeController(_Camp_BranchHarvestNode2, woodref)
		elseif woodform == CoastDriftWood03
			PlaceNodeController(_Camp_BranchHarvestNode3, woodref)
		elseif woodform == TreeReachBranchPile01
			PlaceNodeController(_Camp_BranchHarvestNode4, woodref)
		elseif woodform == TreeReachBranchPile02
			PlaceNodeController(_Camp_BranchHarvestNode5, woodref)
		endif
	endif
endFunction

function PlaceNodeController(Activator akNodeController, ObjectReference akReference)
	ObjectReference my_node = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HarvestableBranchActivators, akReference, 1.0)
	_Camp_BranchHarvestNodeController my_controller = None
	if !my_node
		my_node = akReference.PlaceAtMe(akNodeController, abInitiallyDisabled = true)
		;debug.trace("[Campfire] Recursively placed branch node " + my_node)
		if my_node
			my_node.SetScale(akReference.GetScale())
			my_node.Enable()
			my_controller = my_node as _Camp_BranchHarvestNodeController
			my_controller.Setup(akReference)
		endif
	endif
endFunction

Event OnActivate(ObjectReference akActionRef)
	if !harvested
		harvested = true
		akActionRef.AddItem(_Camp_DeadwoodBranch, RandomInt(1, 2))
		self.DisableNoWait()

		;Stagger updates every 21 - 27 hours to avoid hammering the system all at once
		float _reset_time = RESET_TIME - RandomInt(-3, 3)
		;debug.trace("[Campfire] Tree respawning in " + _reset_time + " hours")
		RegisterForSingleUpdateGameTime(_reset_time)
	endif
EndEvent

Event WoodHarvestNodeReset()
	;debug.trace("[Campfire] Branch node " + self + " received global reset signal, reverting...")
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
	;debug.trace("[Campfire] Branch node resetting after prescribed game time.")
	eligible_for_reset = true
	if !self.GetParentCell() || !self.GetParentCell().IsAttached()
		utility.wait(BACKOFF_TIME)
		NodeReset()
	endif
EndEvent

function NodeReset()
	;debug.trace("[Campfire] Branch Harvest Node Controller resetting object.")
	UnregisterForModEvent("Campfire_WoodHarvestNodeReset")
	if my_wood_ref && my_wood_ref.IsDisabled()
		my_wood_ref.Enable()
	endif
	self.Disable()
	self.Delete()
endFunction