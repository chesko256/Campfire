scriptname _Frost_WarmHandsScript extends ActiveMagicEffect

import Utility
import _FrostInternal

Actor property PlayerRef auto
Spell property _Frost_HandWarmingPower auto
Message property _Frost_Help_WarmHands auto
Message property _Frost_Help_WarmHandsExit auto
Idle property IdleWarmHandsCrouched auto
Idle property IdleWarmHandsStanding auto
Idle property IdleBowHeadAtGrave_01 auto
Idle property IdleStop_Loose auto
Quest property _Frost_System_Follower auto
GlobalVariable property _Frost_PlayingWarmHands auto
GlobalVariable property _Frost_CurrentHeatSourceSize auto
GlobalVariable property _Frost_Setting_DisplayTutorials auto
GlobalVariable property _Frost_HelpDone_WarmHands auto

bool animation_playing = false
bool was_first_person = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FrostDebug(0, ")))) ANIMATION ::: The hand-warming effect conditions are met.")
	RegisterForAnimationEvent(PlayerRef, "tailSneakIdle")
	RegisterForAnimationEvent(PlayerRef, "tailSneakLocomotion")
	ShowTutorial_WarmHands()
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	FrostDebug(0, ")))) ANIMATION ::: The hand-warming effect conditions are no longer met.")
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if akSource == PlayerRef
		if asEventName == "tailSneakIdle" || asEventName == "tailSneakLocomotion"
			WarmHandsStart()
			ShowTutorial_WarmHands(true)
			RegisterForSingleUpdate(1)
		elseif animation_playing && (asEventName == "FootLeft" || asEventName == "JumpUp")
			WarmHandsEnd()
		endif
	endif
EndEvent

Event OnUpdate()
	if animation_playing
		if PlayerRef.IsSneaking()
			WarmHandsEnd()
		else
			RegisterForSingleUpdate(1)
		endif
	endif
EndEvent

function WarmHandsStart()
	if _Frost_PlayingWarmHands.GetValueInt() == 1
		FrostDebug(0, ")))) ANIMATION ::: Not playing animation; pick one")
		Game.DisablePlayerControls(false, false, true, false, false, false, false)
		
		if PlayerRef.GetAnimationVariableBool("IsFirstPerson")
			was_first_person = true
			Game.ForceThirdPerson()
			Wait(1)
		endif

		if PlayerRef.IsSneaking()
			PlayerRef.StartSneaking()
		endif

		_Frost_PlayingWarmHands.SetValueInt(2)
		
		PickAnimation()

		; Register for movement that can cancel the effect.
		RegisterForAnimationEvent(PlayerRef, "FootLeft")
		RegisterForAnimationEvent(PlayerRef, "JumpUp")
		
		animation_playing = true
	endif
endFunction

function WarmHandsEnd()
	FrostDebug(0, ")))) ANIMATION ::: Stop Animation")
	if PlayerRef.IsSneaking()
		PlayerRef.StartSneaking()
	endif

	StopAnimation()

	if was_first_person
		Wait(2)
		Game.ForceFirstPerson()
	else
		Wait(1)
	endif

	if !Game.IsCamSwitchControlsEnabled()
		Game.EnablePlayerControls(false, false, true, false, false, false, false)
	endif

	_Frost_PlayingWarmHands.SetValueInt(1)
	animation_playing = false
endFunction

function PickAnimation()
	; High chance to crouch near small fires (sconces, etc)
	; Medium chance to crouch near medium fires (campfires, etc)
	; Always stand near larger fires (bonfires, etc)
	float crouchChance
	if _Frost_CurrentHeatSourceSize.GetValueInt() <= 1
		crouchChance = 0.75
	elseif _Frost_CurrentHeatSourceSize.GetValueInt() == 2
		crouchChance = 0.50
	else
		crouchChance = 0.0
	endif

	float random = RandomFloat()
	FrostDebug(0, ")))) ANIMATION ::: Picked " + random)
	if random <= crouchChance
		PlayerRef.Playidle(IdleWarmHandsCrouched)	
	else
		if PlayerRef.GetEquippedShield()
			PlayerRef.Playidle(IdleBowHeadAtGrave_01)
		else
			PlayerRef.Playidle(IdleWarmHandsStanding)
		endif
	endif

	_Frost_System_Follower.Start()
endFunction

function StopAnimation()
	bool exitSuccess = false
	int attempts = 0	
	while !exitSuccess && attempts < 3
		exitSuccess = PlayerRef.PlayIdle(IdleStop_Loose)
		if !exitSuccess
			Wait(1)
			attempts += 1
		endif
	endWhile

	FrostDebug(0, ")))) ANIMATION ::: Ending animation.")
	_Frost_System_Follower.Stop()
endFunction

function ShowTutorial_WarmHands(bool exit = false)
	if _Frost_Setting_DisplayTutorials.GetValueInt() == 2 && _Frost_HelpDone_WarmHands.GetValueInt() == 1
		if !exit
			Message.ResetHelpMessage("Activate")
			_Frost_Help_WarmHands.ShowAsHelpMessage("Activate", 5, 30, 1)
		else
			Message.ResetHelpMessage("Activate")
			_Frost_Help_WarmHandsExit.ShowAsHelpMessage("Activate", 5, 30, 1)
			_Frost_HelpDone_WarmHands.SetValueInt(2)
		endif
	endif
endFunction

; DEPRECATED
GlobalVariable property _Frost_Setting_1PAnimationAllowed auto
{This setting is deprecated as of Frostfall 3.0.1.}