scriptname _Frost_WarmHandsScript extends ActiveMagicEffect

import Utility
import FrostUtil
import _FrostInternal

Actor property PlayerRef auto
Message property _Frost_Help_WarmHands auto
Message property _Frost_Help_WarmHandsExit auto
Idle property IdleWarmHandsCrouched auto
Idle property IdleWarmHandsStanding auto
Idle property IdleBowHeadAtGrave_01 auto
Idle property IdleStop_Loose auto
Quest property _Frost_System_Follower auto
GlobalVariable property _Frost_CurrentHeatSourceSize auto
GlobalVariable property _Frost_Setting_DisplayTutorials auto
GlobalVariable property _Frost_HelpDone_WarmHands auto

bool animation_playing = false
bool was_first_person = false
float last_animation_time = 0.0

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FrostDebug(0, ")))) ANIMATION ::: The hand-warming effect conditions are met.")
	FallbackEventEmitter emitter = GetEventEmitter_OnSneak()
	emitter.RegisterActiveMagicEffectForModEventWithFallback("Frost_OnSneak", "OnSneak", self)
	ShowTutorial_WarmHands()
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	FrostDebug(0, ")))) ANIMATION ::: The hand-warming effect conditions are no longer met.")
	if !Game.IsCamSwitchControlsEnabled()
		Game.EnablePlayerControls(false, false, true, false, false, false, false)
	endif
	_Frost_System_Follower.Stop()
	last_animation_time = Game.GetRealHoursPassed() * 3600.0
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if akSource == PlayerRef
		if animation_playing && (asEventName == "FootLeft" || asEventName == "JumpUp")
			WarmHandsEnd()
		endif
	endif
EndEvent

function WarmHandsStart()
	FrostDebug(0, ")))) ANIMATION ::: Not playing animation; pick one")
	Game.DisablePlayerControls(false, false, true, false, false, false, false)

	if PlayerRef.GetAnimationVariableBool("IsFirstPerson")
		was_first_person = true
		Game.ForceThirdPerson()
		Wait(0.5)
	endif
	
	if PlayerRef.IsSneaking()
		PlayerRef.StartSneaking()
	endif
	
	PickAnimation()
	
	; Register for movement that can cancel the effect.
	RegisterForAnimationEvent(PlayerRef, "FootLeft")
	RegisterForAnimationEvent(PlayerRef, "JumpUp")		
	
	animation_playing = true
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
	last_animation_time = Game.GetRealHoursPassed() * 3600.0

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
			Utility.Wait(7)
			Message.ResetHelpMessage("Activate")
			_Frost_Help_WarmHandsExit.ShowAsHelpMessage("Activate", 3, 30, 1)
			_Frost_HelpDone_WarmHands.SetValueInt(2)
		endif
	endif
endFunction

Event OnSneak()
	if !animation_playing
		if (Game.GetRealHoursPassed() * 3600.0) - last_animation_time >= 3.0
			WarmHandsStart()
			ShowTutorial_WarmHands(true)
		endif
	elseif animation_playing
		WarmHandsEnd()
	endif
endEvent

; DEPRECATED
GlobalVariable property _Frost_Setting_1PAnimationAllowed auto
{This setting is deprecated as of Frostfall 3.0.1.}