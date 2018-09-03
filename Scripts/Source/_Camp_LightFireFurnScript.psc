scriptname _Camp_LightFireFurnScript extends ObjectReference

import CampUtil
import _CampInternal
import Math

bool property is_stone auto
{ Set to TRUE if this lighting furniture is for Strike Stone. }
bool property is_flamespell auto
{ Set to TRUE if this lighting furniture is for Flame Spell. }

Actor property PlayerRef auto
GlobalVariable property _Camp_LastUsedCampfireStage auto
GlobalVariable property _Camp_PerkRank_Firecraft auto
ReferenceAlias property _Camp_PlayerAlias auto
ImpactDataSet property _Camp_SparkIDS auto
Explosion property _Camp_LightWithOilExplosion auto
static property XMarker auto
Sound property MAGCloakFireLP auto
Spell property _Camp_LightFireFXFlamesSpell auto

float old_percentage = 1.0
float total_required_seconds
float remaining_seconds
bool was_hit = false
bool in_use = false
int stone_fx_counter = 0
ObjectReference parent_campfire
ObjectReference spark_marker
int sound_id = 0
float currentX
float currentY

; Skyrim VR
Event OnInit()
	if !in_use && GetCompatibilitySystem().isSkyrimVR
		currentX = PlayerRef.GetPositionX()
    	currentY = PlayerRef.GetPositionY()
		in_use = true
		SetUpLightingCampfire()
		AddFireLightingFX()
		RegisterForSingleUpdate(1)
	endif
endEvent

Event OnActivate(ObjectReference akActionRef)
	if !in_use
		in_use = true
		Game.DisablePlayerControls(true, true, true, false, true, false, false, false)
		SetUpLightingCampfire()
		
		int j = 0
		while !self.IsFurnitureInUse() && j < 50
			j += 1
			Utility.Wait(0.1)
		endWhile

		AddFireLightingFX()
		RegisterForSingleUpdate(1)
	endif
EndEvent

function SetUpLightingCampfire()
	(_Camp_PlayerAlias as _Camp_PlayerHitMonitor).FireLightingReference = self
	parent_campfire = GetLastUsedCampfire()
	(parent_campfire as CampCampfire).FireLightingReference = self
	
	int modifier_rank
	if is_stone
		modifier_rank = _Camp_PerkRank_Firecraft.GetValueInt()
	elseif is_flamespell
		modifier_rank = Math.Floor(PlayerRef.GetAV("Destruction") / 20)
		if modifier_rank > 4
			modifier_rank = 4
		endif
	endif
	total_required_seconds = (parent_campfire as CampCampfire).base_time_to_light - (modifier_rank * 10)
	if total_required_seconds <= 0
		total_required_seconds = 1
	endif
	remaining_seconds = total_required_seconds
	CampDebug(0, "Campfire lighting modifier rank " + modifier_rank)
	CampDebug(0, "Campfire lighting total seconds " + total_required_seconds)
endFunction

function AddFireLightingFX()
	if is_stone
		spark_marker = PlayerRef.PlaceAtMe(XMarker)
		float[] dist = new float[2]
		dist = GetOffsets(PlayerRef, 130.0)
		spark_marker.MoveTo(PlayerRef, afXOffset = dist[0], afYOffset = dist[1], afZOffset = 10.0)
	elseif is_flamespell
		FlameFX()
	endif
endFunction

Event OnUpdate()
	remaining_seconds -= 1.0
	CampDebug(1, "Trying to light campfire, " + remaining_seconds + " secs remaining...")
	float percentage = (remaining_seconds / total_required_seconds)
	
	if was_hit
		StopLighting()
		return
	endif

	if self.IsFurnitureInUse() || (GetCompatibilitySystem().isSkyrimVR && (PlayerRef.GetPositionX() == currentX && PlayerRef.GetPositionY() == currentY))
		if is_stone
			stone_fx_counter += 1
			StoneFX()
		endif
		if percentage <= 0.33 && old_percentage > 0.33
			if !(parent_campfire as CampCampfire).is_tinder_oil
				(parent_campfire as CampCampfire).mySteam.Enable()
			endif
			RegisterForSingleUpdate(1)
		elseif percentage <= 0.0
			CampDebug(1, "Campfire lit!")
			(parent_campfire as CampCampfire).mySteam.DisableNoWait(true)
			if (parent_campfire as CampCampfire).is_tinder_oil
				; dramatic pause...
				Utility.Wait(1.0)
				parent_campfire.PlaceAtMe(_Camp_LightWithOilExplosion)
			endif
			(parent_campfire as CampCampfire).LightFire()
			
			if is_stone
				(parent_campfire as CampCampfire).AdvanceCampingSkill()
			elseif is_flamespell
				Game.AdvanceSkill("Destruction", 66.0)	; Equivalent to 1x cast of Fireball
			endif

			if !GetCompatibilitySystem().isSkyrimVR
				self.Activate(PlayerRef)

				int i = 0
				while self.IsFurnitureInUse() && i < 50
					Utility.Wait(0.1)
					i += 1
				endWhile
			endif

			(parent_campfire as CampCampfire).RegisterForCampfireCallback(0.1)
			
			TakeDown()
		else
			RegisterForSingleUpdate(1)
		endif
	else
		(parent_campfire as CampCampfire).campfire_stage = 3
		_Camp_LastUsedCampfireStage.SetValueInt(3)
		TakeDown()
	endif
	old_percentage = percentage
EndEvent

function PlayerHitEvent(ObjectReference akAggressor, Form akSource, Projectile akProjectile)
    was_hit = true
endFunction

function StoneFX()
	if stone_fx_counter <= 3
		spark_marker.PlayImpactEffect(_Camp_SparkIDS)
	endif
	if stone_fx_counter >= 5
		stone_fx_counter = 0
	endif
endFunction

function FlameFX()
	sound_id = MAGCloakFireLP.Play(PlayerRef)
	Sound.SetInstanceVolume(sound_id, 0.65)
	if !GetCompatibilitySystem().isSkyrimVR
		PlayerRef.AddSpell(_Camp_LightFireFXFlamesSpell, false)
	endif
endFunction

function StopLighting()
	if !GetCompatibilitySystem().isSkyrimVR
		self.Activate(PlayerRef)
	endif
endFunction

function TakeDown()
	Game.EnablePlayerControls()
	if sound_id != 0
		Sound.StopInstance(sound_id)
	endif
	if spark_marker
		spark_marker.Disable()
		spark_marker.Delete()
	endif
	if !GetCompatibilitySystem().isSkyrimVR
		PlayerRef.RemoveSpell(_Camp_LightFireFXFlamesSpell)
	endif
	(_Camp_PlayerAlias as _Camp_PlayerHitMonitor).FireLightingReference = none
	(parent_campfire as CampCampfire).FireLightingReference = none
	(parent_campfire as CampCampfire).mySteam.DisableNoWait(true)
	parent_campfire = none
	self.Disable()
	self.Delete()
endFunction


float[] function GetOffsets(Actor akSource, Float afDistance = 100.0, float afOffset = 0.0)
	Float A = akSource.GetAngleZ() + afOffset
	Float YDist = Sin(A)
	Float XDist = Cos(A)

	XDist *= afDistance
	YDist *= afDistance

	Float[] Offsets = New Float[2]
	Offsets[0] = YDist
	Offsets[1] = XDist
	Return Offsets
EndFunction