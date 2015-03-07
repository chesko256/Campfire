scriptname _Camp_BranchTreeHarvestNodeController extends ObjectReference

import Utility

float RESET_TIME = 24.0
float BACKOFF_TIME
MiscObject property _Camp_Tinder auto
MiscObject property _Camp_DeadwoodBranch auto
Actor property PlayerRef auto
ObjectReference property my_wood_ref auto hidden
ObjectReference property current_activator auto hidden
bool property harvested = false auto hidden
float property tinder_yield_chance auto hidden
int property min_yield_branch auto hidden
int property max_yield_branch auto hidden
bool property disable_on_depleted auto hidden
bool eligible_for_reset = false

function Setup(float _tinder_yield_chance, 								\
			   int _min_yield_branch, int _max_yield_branch,	 		\
			   bool _disable_on_depleted,								\
			   ObjectReference _current_activator, ObjectReference _my_wood_ref)

	;debug.trace("[Campfire] Setting up new branch / tree harvesting node " + self)
	tinder_yield_chance = _tinder_yield_chance
	min_yield_branch = _min_yield_branch
	max_yield_branch = _max_yield_branch
	disable_on_depleted = _disable_on_depleted
	current_activator = _current_activator
	my_wood_ref = _my_wood_ref

	;Store a random back-off value for use during reset
	BACKOFF_TIME = RandomFloat(0.0, 3.0)

	RegisterForModEvent("Campfire_WoodHarvestNodeReset", "WoodHarvestNodeReset")
endFunction

function YieldResources()
	if !harvested
		harvested = true

		int branch_count = RandomInt(min_yield_branch, max_yield_branch)
		float tinder_roll = RandomFloat(0.1, 1.0)

		if branch_count > 0
			PlayerRef.AddItem(_Camp_DeadwoodBranch, branch_count)
		endif
		if tinder_roll <= tinder_yield_chance
			PlayerRef.AddItem(_Camp_Tinder)
		endif

		if current_activator
			(current_activator as _Camp_TreeActivatorScript).GoHome()
		endif
		if disable_on_depleted && my_wood_ref
			my_wood_ref.DisableNoWait(true)
		endif

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
	if my_wood_ref && my_wood_ref.IsDisabled()
		my_wood_ref.Enable()
	endif
	self.Disable()
	self.Delete()
endFunction