scriptname _Camp_QuickLightFireFurnScript extends ObjectReference

import CampUtil
import _CampInternal
import Math

bool property is_stone auto
{ Set to TRUE if this lighting furniture is for Strike Stone. }
bool property is_flamespell auto
{ Set to TRUE if this lighting furniture is for Flame Spell. }

Actor property PlayerRef auto
GlobalVariable property _Camp_LastUsedCampfireStage auto
ImpactDataSet property _Camp_SparkIDS auto
static property XMarker auto
Sound property MAGCloakFireLP auto
Spell property _Camp_LightFireFXFlamesSpell auto

float old_percentage = 1.0
float total_required_seconds
float remaining_seconds
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

		parent_campfire = GetLastUsedCampfire()
		(parent_campfire as CampCampfire).FireLightingReference = self
		
		total_required_seconds = 5
		remaining_seconds = total_required_seconds
		CampDebug(0, "Campfire lighting total seconds " + total_required_seconds)

		if is_stone
			spark_marker = PlayerRef.PlaceAtMe(XMarker)
			float[] dist = new float[2]
			dist = GetOffsets(PlayerRef, 130.0)
			spark_marker.MoveTo(PlayerRef, afXOffset = dist[0], afYOffset = dist[1], afZOffset = 10.0)
		elseif is_flamespell
			FlameFX()
		endif

		RegisterForSingleUpdate(1)
	endif
endEvent

Event OnActivate(ObjectReference akActionRef)
	if !in_use
		in_use = true
		Game.DisablePlayerControls(true, true, true, false, true, false, false, false)
		parent_campfire = GetLastUsedCampfire()
		(parent_campfire as CampCampfire).FireLightingReference = self
		
		total_required_seconds = 5
		remaining_seconds = total_required_seconds
		CampDebug(0, "Campfire lighting total seconds " + total_required_seconds)

		int j = 0
		while !self.IsFurnitureInUse() && j < 50
			j += 1
			Utility.Wait(0.1)
		endWhile

		if is_stone
			spark_marker = PlayerRef.PlaceAtMe(XMarker)
			float[] dist = new float[2]
			dist = GetOffsets(PlayerRef, 130.0)
			spark_marker.MoveTo(PlayerRef, afXOffset = dist[0], afYOffset = dist[1], afZOffset = 10.0)
		elseif is_flamespell
			FlameFX()
		endif

		RegisterForSingleUpdate(1)
	endif
EndEvent

Event OnUpdate()
	remaining_seconds -= 1.0
	CampDebug(1, "Trying to light campfire, " + remaining_seconds + " secs remaining...")
	float percentage = (remaining_seconds / total_required_seconds)

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
	PlayerRef.AddSpell(_Camp_LightFireFXFlamesSpell, false)
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
	PlayerRef.RemoveSpell(_Camp_LightFireFXFlamesSpell)
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