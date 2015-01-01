scriptname _DE_WarmHandsScript extends ActiveMagicEffect

import debug
import Utility
Actor property PlayerRef auto
Idle property IdleWarmHandsCrouched auto
Idle property IdleWarmHandsStanding auto
Idle property IdleBowHeadAtGrave_01 auto
Idle property IdleStop_Loose auto
GlobalVariable property _DE_WarmingHandsToggle auto
GlobalVariable property _DE_HandWarmingControlTime auto
GlobalVariable property _DE_NearSmallFire auto
GlobalVariable property _DE_PlayingWarmHands auto
GlobalVariable property _DE_EPDebug auto
FormList property _DE_SmallFires auto
_DE_EPMonitor_1_6 property Frostfall auto
bool bAnimationPlaying = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FrostfallDebug(3, "[Frostfall] The hand-warming effect was applied.")
	bool bNoRecentAnimation = ((Game.GetRealHoursPassed() * 3600) - _DE_HandWarmingControlTime.GetValue() >= 6.0)
	if bNoRecentAnimation && !PlayerRef.GetAnimationVariableBool("IsFirstPerson")
		if Frostfall.bIsVampire == true && Frostfall.pSetting_VampireImmunity == true
			return
		endif
		FrostfallDebug(3, "[Frostfall] Result of GetRealHoursPassed is " + Game.GetRealHoursPassed())
		FrostfallDebug(3, "[Frostfall] Control time was " + _DE_HandWarmingControlTime.GetValue())
		PickIdle()
		Game.DisablePlayerControls(false, false, true, false, false, false, false)
		RegisterForKeys()
	else
		FrostfallDebug(3, "[Frostfall] Current time is " + (Game.GetRealHoursPassed() * 3600) + ", control time was " + _DE_HandWarmingControlTime.GetValue() + ", waiting...")
		_DE_WarmingHandsToggle.SetValue(2)
	endif
endEvent

function PickIdle()
	if _DE_NearSmallFire.GetValue() == 2
		;High chance to crouch near small fires (campfires, etc)
		float fRandom = RandomFloat()
		FrostfallDebug(3, "[Frostfall] ANIMATION: Picked " + fRandom)
		if fRandom <= 0.75
			PlayerRef.Playidle(IdleWarmHandsCrouched)	
		else
			if PlayerRef.GetEquippedShield()
				PlayerRef.Playidle(IdleBowHeadAtGrave_01)
			else
				PlayerRef.Playidle(IdleWarmHandsStanding)
			endif
		endif
		bAnimationPlaying = true
		_DE_PlayingWarmHands.SetValueInt(2)
	else
		;Always stand near larger fires (forges, etc)
		if PlayerRef.GetEquippedShield()
			PlayerRef.Playidle(IdleBowHeadAtGrave_01)
		else
			PlayerRef.Playidle(IdleWarmHandsStanding)	
		endif
		bAnimationPlaying = true
		_DE_PlayingWarmHands.SetValueInt(2)
	endif
endFunction	

function RegisterForKeys()
	RegisterForControl("Forward")
	RegisterForControl("Back")
	RegisterForControl("Strafe Left")
	RegisterForControl("Strafe Right")
	RegisterForControl("Left Attack/Block")
	RegisterForControl("Right Attack/Block")
	RegisterForControl("Jump")
	RegisterForControl("Ready Weapon")
	RegisterForControl("Activate")
endFunction
	
Event OnControlDown(string control)
	FrostfallDebug(3, "[FROSTFALL] Control received: " + control)
	_DE_WarmingHandsToggle.SetValue(2)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if bAnimationPlaying
		PlayerRef.PlayIdle(IdleStop_Loose)
		bAnimationPlaying = false
		_DE_PlayingWarmHands.SetValueInt(1)
		_DE_HandWarmingControlTime.SetValue((Game.GetRealHoursPassed() * 3600))
	endif
	if !Game.IsCamSwitchControlsEnabled()
		Game.EnablePlayerControls(false, false, true, false, false, false, false)
	endif
	FrostfallDebug(3, "[Frostfall] Ending animation and recording fControlTime of " + _DE_HandWarmingControlTime.GetValue())
	_DE_WarmingHandsToggle.SetValue(1)
endEvent

function FrostfallDebug(int iClassification, string sDebugMessage)
	;1 = Primary exposure system messages.
	;2 = Quest state data
	;3 = Misc info
	;4 = Weather-related
	if _DE_EPDebug.GetValueInt() == iClassification
		debug.trace(sDebugMessage)
	endif
endFunction