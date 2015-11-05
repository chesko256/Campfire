scriptname _Frost_WarmHandsScript extends ActiveMagicEffect

import debug
import Utility
import _FrostInternal
Actor property PlayerRef auto
Idle property IdleWarmHandsCrouched auto
Idle property IdleWarmHandsStanding auto
Idle property IdleBowHeadAtGrave_01 auto
Idle property IdleStop_Loose auto
GlobalVariable property _Frost_WarmingHandsToggle auto
GlobalVariable property _Frost_HandWarmingControlTime auto
GlobalVariable property _Frost_CurrentHeatSourceSize auto
GlobalVariable property _Frost_PlayingWarmHands auto
GlobalVariable property _Frost_Setting_Animation1PAllowed auto
bool animation_playing = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FrostDebug(0, ")))) ANIMATION ::: The hand-warming effect was applied.")
	bool no_recent_animation = ((Game.GetRealHoursPassed() * 3600) - _Frost_HandWarmingControlTime.GetValue() >= 6.0)
	if no_recent_animation && (!PlayerRef.GetAnimationVariableBool("IsFirstPerson") || _Frost_Setting_Animation1PAllowed.GetValueInt() == 2)
		FrostDebug(0, ")))) ANIMATION ::: Animation control time was " + _Frost_HandWarmingControlTime.GetValue())
		PickIdle()
		Game.DisablePlayerControls(false, false, true, false, false, false, false)
		RegisterForKeys()
	else
		FrostDebug(0, ")))) ANIMATION ::: Current time is " + (Game.GetRealHoursPassed() * 3600) + ", control time was " + _Frost_HandWarmingControlTime.GetValue() + ", waiting...")
		_Frost_WarmingHandsToggle.SetValue(2)
	endif
endEvent

function PickIdle()
	if _Frost_CurrentHeatSourceSize.GetValueInt() <= 2
		;High chance to crouch near small fires (campfires, etc)
		float fRandom = RandomFloat()
		FrostDebug(0, ")))) ANIMATION ::: Picked " + fRandom)
		if fRandom <= 0.75
			PlayerRef.Playidle(IdleWarmHandsCrouched)	
		else
			if PlayerRef.GetEquippedShield()
				PlayerRef.Playidle(IdleBowHeadAtGrave_01)
			else
				PlayerRef.Playidle(IdleWarmHandsStanding)
			endif
		endif
		animation_playing = true
		_Frost_PlayingWarmHands.SetValueInt(2)
	else
		;Always stand near larger fires (forges, etc)
		if PlayerRef.GetEquippedShield()
			PlayerRef.Playidle(IdleBowHeadAtGrave_01)
		else
			PlayerRef.Playidle(IdleWarmHandsStanding)	
		endif
		animation_playing = true
		_Frost_PlayingWarmHands.SetValueInt(2)
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
	_Frost_WarmingHandsToggle.SetValue(2)
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if animation_playing
		PlayerRef.PlayIdle(IdleStop_Loose)
		animation_playing = false
		_Frost_PlayingWarmHands.SetValueInt(1)
		_Frost_HandWarmingControlTime.SetValue((Game.GetRealHoursPassed() * 3600))
	endif
	if !Game.IsCamSwitchControlsEnabled()
		Game.EnablePlayerControls(false, false, true, false, false, false, false)
	endif
	FrostDebug(0, ")))) ANIMATION ::: Ending animation and recording control time of " + _Frost_HandWarmingControlTime.GetValue())
	_Frost_WarmingHandsToggle.SetValue(1)
endEvent