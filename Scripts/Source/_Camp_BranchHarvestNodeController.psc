scriptname _Camp_BranchHarvestNodeController extends ObjectReference

import Utility

float RESET_TIME = 24.0
float BACKOFF_TIME
MiscObject property _Camp_DeadwoodBranch auto
Actor property PlayerRef auto
ObjectReference property my_wood_ref auto hidden
bool property harvested = false auto hidden
bool eligible_for_deletion = false

function Setup(ObjectReference _my_wood_ref)
	;debug.trace("[Campfire] Setting up new branch harvesting node " + self)
	my_wood_ref = _my_wood_ref

	;Store a random back-off value for use during reset
	BACKOFF_TIME = RandomFloat(0.0, 3.0)
	if !my_wood_ref.GetEnableParent()
		my_wood_ref.DisableNoWait()
	endif
	
	RegisterForModEvent("Campfire_WoodHarvestNodeReset", "WoodHarvestNodeReset")
	float _reset_time = RESET_TIME - RandomInt(-3, 3)
	;debug.trace("[Campfire] Tree respawning in " + _reset_time + " hours")
	RegisterForSingleUpdateGameTime(_reset_time)
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
	debug.trace("[Campfire] Branch node " + self + " received global reset signal for wood harvest node, reverting...")
	RegisterForSingleUpdateGameTime(0.0)
endEvent

Event OnUpdateGameTime()
	;debug.trace("[Campfire] Branch node resetting after prescribed game time.")
	eligible_for_deletion = true
	if !self.Is3DLoaded()
		NodeReset()
	else
		;debug.trace("[Campfire] Still attached; waiting for unload.")
	endif
EndEvent

Event OnCellDetach()
	;debug.trace("[Campfire] Detached from cell, checking deletion eligibility...")
	if eligible_for_deletion || !harvested
		NodeReset()
	endif
EndEvent

function NodeReset()
	utility.wait(BACKOFF_TIME)
	debug.trace("[Campfire] Branch Harvest Node Controller resetting object.")
	UnregisterForModEvent("Campfire_WoodHarvestNodeReset")
	if my_wood_ref && my_wood_ref.IsDisabled()
		my_wood_ref.EnableNoWait()
	endif
	self.Disable()
	self.Delete()
endFunction