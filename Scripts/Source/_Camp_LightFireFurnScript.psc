scriptname _Camp_LightFireFurnScript extends ObjectReference

import CampUtil
import _CampInternal

bool property is_stone auto
bool property is_flamespell auto

Actor property PlayerRef auto
ReferenceAlias property _Camp_PlayerAlias auto
ImpactDataSet property _Camp_SparkIDS auto
GlobalVariable property _Camp_LastUsedCampfireStage auto
float property total_required_seconds = 30.0 auto hidden
float remaining_iterations
float old_percentage = 1.0
ObjectReference parent_campfire

bool in_use = false
int stone_fx_counter = 0

Event OnActivate(ObjectReference akActionRef)
	if !in_use
		in_use = true
		Game.DisablePlayerControls(true, true, true, false, true, false, false, false)
		(_Camp_PlayerAlias as _Camp_PlayerHitMonitor).FireLightingReference = self
		parent_campfire = GetLastUsedCampfire()
		(parent_campfire as CampCampfire).FireLightingReference = self
		; remaining_iterations = total_required_seconds

		int j = 0
		while !self.IsFurnitureInUse() && j < 50
			j += 1
			Utility.Wait(0.1)
		endWhile

		remaining_iterations = 30.0
		RegisterForSingleUpdate(1)
	endif
EndEvent

Event OnUpdate()
	remaining_iterations -= 1.0
	CampDebug(1, "Trying to light campfire, " + remaining_iterations + " secs remaining...")
	float percentage = (remaining_iterations / total_required_seconds)
	
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
		(parent_campfire as CampCampfire).campfire_stage = 3
		_Camp_LastUsedCampfireStage.SetValueInt(3)
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
		parent_campfire.PlayImpactEffect(_Camp_SparkIDS)
		stone_fx_counter = 0
	endif
endFunction

function StopLighting()
	self.Activate(PlayerRef)
endFunction

function TakeDown()
	Game.EnablePlayerControls()
	(_Camp_PlayerAlias as _Camp_PlayerHitMonitor).FireLightingReference = none
	(parent_campfire as CampCampfire).FireLightingReference = none
	(parent_campfire as CampCampfire).mySteam.DisableNoWait(true)
	parent_campfire = none
	self.Disable()
	self.Delete()
endFunction
