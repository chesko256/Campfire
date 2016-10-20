scriptname _Frost_WarmHandsLogic extends Quest

import Utility
import _FrostInternal

Actor property PlayerRef auto
Idle property IdleWarmHandsCrouched auto
Idle property IdleWarmHandsStanding auto
Idle property IdleBowHeadAtGrave_01 auto
Idle property IdleStop_Loose auto
ObjectReference property _Frost_HandWarmingInteractTriggerREF auto
ObjectReference property _Frost_HandWarmingExitTriggerREF auto
GlobalVariable property _Frost_CurrentHeatSourceSize auto
GlobalVariable property _Frost_Setting_Animation auto
Quest property _Frost_System_Follower auto
ReferenceAlias property HeatSource auto

int valid_cycles = 0
bool effect_running = false
bool animation_playing = false
bool was_first_person = false

function EffectStart()
	effect_running = true
	FrostDebug(0, ")))) ANIMATION ::: The hand-warming effect conditions are met.")

	if _Frost_Setting_Animation.GetValueInt() == 3
		_Frost_HandWarmingInteractTriggerREF.EnableNoWait()
		_Frost_HandWarmingInteractTriggerREF.MoveTo(PlayerRef)
	endif
endFunction

Event OnUpdate()
	if effect_running
		if _Frost_Setting_Animation.GetValueInt() == 2
			valid_cycles += 1
			CheckAutoPlay()
		endif
	else
		if !animation_playing && _Frost_HandWarmingExitTriggerREF.IsEnabled()
			_Frost_HandWarmingExitTriggerREF.DisableNoWait()
		endif
	endif
EndEvent

function EffectFinish()
	effect_running = false
	FrostDebug(0, ")))) ANIMATION ::: The hand-warming effect conditions are no longer met.")
	if !Game.IsCamSwitchControlsEnabled()
		Game.EnablePlayerControls(false, false, true, false, false, false, false)
	endif

	_Frost_System_Follower.Stop()
	_Frost_HandWarmingInteractTriggerREF.DisableNoWait()
	valid_cycles = 0
endFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if akSource == PlayerRef
		if animation_playing && (asEventName == "FootLeft" || asEventName == "JumpUp")
			WarmHandsEnd()
		endif
	endif
EndEvent

function CheckAutoPlay()
	if !animation_playing && valid_cycles >= 2 && !PlayerRef.GetAnimationVariableBool("IsFirstPerson")
		FrostDebug(0, ")))) ANIMATION ::: Auto-playing!")
		WarmHandsStart()
	endif
endFunction

function WarmHandsStart()
	FrostDebug(0, ")))) ANIMATION ::: Not playing animation; pick one")
	_Frost_HandWarmingInteractTriggerREF.DisableNoWait()
	Game.DisablePlayerControls(false, false, true, false, false, false, false)

	if PlayerRef.GetAnimationVariableBool("IsFirstPerson")
		was_first_person = true
		Game.ForceThirdPerson()
		Wait(0.5)
	else
		was_first_person = false
	endif
	
	PickAnimation()

	_Frost_HandWarmingExitTriggerREF.EnableNoWait()
	_Frost_HandWarmingExitTriggerREF.MoveTo(PlayerRef)
	
	; Register for movement that can cancel the effect.
	RegisterForAnimationEvent(PlayerRef, "FootLeft")
	RegisterForAnimationEvent(PlayerRef, "JumpUp")		
	
	animation_playing = true
endFunction

function WarmHandsEnd()
	FrostDebug(0, ")))) ANIMATION ::: Stop Animation")

	_Frost_HandWarmingExitTriggerREF.DisableNoWait()
	valid_cycles = 0
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

	if _Frost_Setting_Animation.GetValueInt() == 3 && effect_running
		_Frost_HandWarmingInteractTriggerREF.EnableNoWait()
	endif

	animation_playing = false
endFunction

function PickAnimation()
	; High chance to crouch near small fires (sconces, etc)
	; Medium chance to crouch near medium fires (campfires, etc)
	; Always stand near larger fires (bonfires, etc)
	; Always stand near fires placed higher than you
	float crouchChance
	
	ObjectReference hs
	if HeatSource
		hs = HeatSource.GetRef()
	endif

	if hs && (hs.GetPositionZ() - PlayerRef.GetPositionZ()) >= 50.0
		crouchChance = 0.0
	else
		if _Frost_CurrentHeatSourceSize.GetValueInt() <= 1
			crouchChance = 0.65
		elseif _Frost_CurrentHeatSourceSize.GetValueInt() == 2
			crouchChance = 0.25
		else
			crouchChance = 0.0
		endif
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