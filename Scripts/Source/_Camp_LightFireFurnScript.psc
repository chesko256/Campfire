scriptname _Camp_LightFireFurnScript extends ObjectReference

import CampUtil
import _CampInternal

bool property is_stone auto
bool property is_flamespell auto

Actor property PlayerRef auto
ReferenceAlias property _Camp_PlayerAlias auto
message property _Camp_Help_CampfireLightingCancel auto
ImpactDataSet property WPNzBluntImpactSet auto
Activator property FXSparkFountainToggleLight auto
float property total_required_seconds = 30.0 auto hidden
float remaining_required_seconds
float old_percentage = 1.0
ObjectReference parent_campfire
ObjectReference sparks

bool in_use = false
int stone_fx_counter = 0

Event OnActivate(ObjectReference akActionRef)
	if !in_use
		in_use = true
		Game.DisablePlayerControls(true, true, true, false, true, false, false, false)
		(_Camp_PlayerAlias as _Camp_PlayerHitMonitor).FireLightingReference = self
		parent_campfire = GetLastUsedCampfire()
		(parent_campfire as CampCampfire).FireLightingReference = self
		Message.ResetHelpMessage("Activate")
		_Camp_Help_CampfireLightingCancel.ShowAsHelpMessage("Activate", 5, 30, 1)
		; remaining_required_seconds = total_required_seconds

		if is_stone
			sparks = parent_campfire.PlaceAtMe(FXSparkFountainToggleLight, abInitiallyDisabled = true)
			sparks.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
			sparks.SetScale(2)
		endif
		remaining_required_seconds = 30.0
		RegisterForSingleUpdate(1)
	endif
EndEvent

Event OnUpdate()
	remaining_required_seconds -= 1.0
	CampDebug(1, "Trying to light campfire, " + remaining_required_seconds + " secs remaining...")
	float percentage = (remaining_required_seconds / total_required_seconds)
	
	if was_hit
		TakeDown()
	endif

	if self.IsFurnitureInUse()	
		if percentage <= 0.33 && old_percentage > 0.33
			(parent_campfire as CampCampfire).mySteam.Enable()
			RegisterForSingleUpdate(1)
		elseif percentage <= 0.0
			CampDebug(1, "Campfire lit!")
			(parent_campfire as CampCampfire).mySteam.DisableNoWait(true)
			(parent_campfire as CampCampfire).LightFire()
			; Advance camping skill
			self.Activate(PlayerRef)

			int i = 0
			while self.IsFurnitureInUse() && i < 50
				Utility.Wait(0.1)
				i += 1
			endWhile
			(parent_campfire as CampCampfire).PlayerUseCampfire()
			TakeDown()
		else
			if is_stone
				stone_fx_counter += 1
				StoneFX()
			endif
			; else is_flamespell
			RegisterForSingleUpdate(1)
		endif
	else
		TakeDown()
	endif
	old_percentage = percentage
EndEvent

bool was_hit = false
function PlayerHitEvent(ObjectReference akAggressor, Form akSource, Projectile akProjectile)
    was_hit = true
endFunction

function StoneFX()
	if stone_fx_counter >= 3
		sparks.Enable()
		parent_campfire.PlayImpactEffect(WPNzBluntImpactSet)
		stone_fx_counter = 0
	else
		sparks.Disable()
	endif
endFunction

function TakeDown()
	Game.EnablePlayerControls()
	(_Camp_PlayerAlias as _Camp_PlayerHitMonitor).FireLightingReference = none
	(parent_campfire as CampCampfire).FireLightingReference = none
	parent_campfire = none
	sparks.Disable()
	sparks.Delete()
	self.Disable()
	self.Delete()
endFunction
