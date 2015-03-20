scriptname _Camp_BranchTreeHarvestNodeController extends ObjectReference

import Utility

float RESET_TIME = 12.0
float BACKOFF_TIME
MiscObject property _Camp_Tinder auto
MiscObject property _Camp_DeadwoodBranch auto
Activator property _Camp_HarvestBranchTree_Node auto
Activator property _Camp_ZTestReceiver auto
Spell property _Camp_BranchZTestSpell auto
Actor property PlayerRef auto
FormList property _Camp_HarvestableBranchTrees auto
bool property harvested = false auto hidden
float property tinder_yield_chance auto hidden
int property yield_branch auto hidden
float property bonus_chance auto hidden
bool eligible_for_reset = false

function Setup(float _tinder_yield_chance, 								\
			   int _yield_branch, float _bonus_chance)

	;debug.trace("[Campfire] Setting up new branch / tree harvesting node " + self)
	tinder_yield_chance = _tinder_yield_chance
	yield_branch = _yield_branch
	bonus_chance = _bonus_chance
	
	;Store a random back-off value for use during reset
	BACKOFF_TIME = RandomFloat(0.0, 3.0)

	;@TODO: SKSE
	RegisterForModEvent("Campfire_WoodHarvestNodeReset", "WoodHarvestNodeReset")
endFunction

function Handle_Tree(ObjectReference akReference)
	ObjectReference tr = akReference.PlaceAtMe(_Camp_ZTestReceiver)
	tr.MoveTo(tr, afZOffset = -2000.0)
	debug.trace("[Campfire] Firing...")
	_Camp_BranchZTestSpell.Cast(akReference, tr)
endFunction

Event OnActivate(ObjectReference akActionRef)
	YieldResources(akActionRef)
EndEvent

function YieldResources(ObjectReference akActionRef)
	if !harvested
		harvested = true

		int branch_count = yield_branch
		float bonus_roll = RandomFloat(0.01, 1.0)
		if bonus_roll <= bonus_chance
			branch_count += 1
		endif
		;float tinder_roll = RandomFloat(0.01, 1.0)

		if branch_count > 0
			akActionRef.AddItem(_Camp_DeadwoodBranch, branch_count)
		endif
		;if tinder_roll <= tinder_yield_chance
		;	akActionRef.AddItem(_Camp_Tinder)
		;endif

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
	;@TODO: SKSE
	UnregisterForModEvent("Campfire_WoodHarvestNodeReset")
	self.Disable()
	self.Delete()
endFunction