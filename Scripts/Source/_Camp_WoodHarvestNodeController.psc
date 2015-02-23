scriptname _Camp_WoodHarvestNodeController extends ObjectReference

import Utility

MiscObject property _Camp_Tinder auto
MiscObject property _Camp_DeadwoodBranch auto
MiscObject property _Camp_DeadwoodLog auto
Actor property PlayerRef auto
ObjectReference property my_wood_object auto hidden
int property remaining_yields auto hidden
float property tinder_yield_chance auto hidden
int property hit_count auto hidden
int property min_yield_branch auto hidden
int property max_yield_branch auto hidden
int property min_yield_deadwood auto hidden
int property max_yield_deadwood auto hidden
bool property is_stump auto hidden
bool property disable_on_depleted auto hidden

function HitWithAxe()
	hit_count += 1
	if hit_count >= 3
		hit_count = 0
		YieldResources()
	endif
endFunction

function YieldResources()
	if remaining_yields > 0
		remaining_yields -= 1

		int branch_count = RandomInt(min_yield_branch, max_yield_branch)
		int deadwood_count = RandomInt(min_yield_deadwood, max_yield_deadwood)
		float tinder_roll = RandomFloat(0.0, 1.0)

		if branch_count > 0
			PlayerRef.AddItem(_Camp_DeadwoodBranch, branch_count)
		endif
		if deadwood_count > 0
			PlayerRef.AddItem(_Camp_DeadwoodLog, deadwood_count)
		endif
		if tinder_roll <= tinder_yield_chance
			PlayerRef.AddItem(_Camp_Tinder)
		endif

		if remaining_yields <= 0
			ShowDepleteMessage()
			self.Disable()
			if disable_on_depleted && my_wood_object
				my_wood_object.DisableNoWait(true)
			endif
			RegisterForSingleUpdateGameTime(120)
		endif
	endif
endFunction

function ShowDepleteMessage()
	if is_stump
		if disable_on_depleted
			debug.notification("You successfully harvest the stump.")
		else
			debug.notification("This stump is depleted of useful material.")
		endif
	else
		if disable_on_depleted
			debug.notification("You successfully harvest the log.")
		else
			debug.notification("This log is depleted of useful material.")
		endif
	endif
endFunction

Event OnUpdateGameTime()
	debug.trace("[Campfire] Wood Harvest Node Controller resetting object.")
	if my_wood_object && my_wood_object.IsDisabled()
		my_wood_object.Enable()
	endif
	self.Delete()
EndEvent