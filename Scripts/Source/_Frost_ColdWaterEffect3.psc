scriptname _Frost_ColdWaterEffect3 extends ActiveMagicEffect

import Utility
import FrostUtil
import CampUtil

Actor property PlayerRef auto
Message property _Frost_WaterTemp3Msg auto
Message property _Frost_WaterTemp3aMsg auto
Message property _Frost_WaterTemp3bMsg auto
Message property _Frost_WaterTemp3cMsg auto
GlobalVariable property _Frost_PerkRank_GlacialSwimmer auto
GlobalVariable property _Frost_Setting_ForceFeedback auto
GlobalVariable property _Frost_Setting_FrigidWaterIsLethal auto
GlobalVariable property _Frost_Setting_ConditionMessages auto
GlobalVariable property _Frost_Setting_MaxExposureMode auto
GlobalVariable property _Frost_Setting_VampireMode auto
Spell property _Frost_ColdWaterDeathSpell auto

bool message_1_shown
bool message_2_shown
bool message_3_shown
bool bOddBeat = true
int survival_time
int update_count = 0

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_Frost_WaterTemp3Msg.Show()
	FrostUtil.ModPlayerExposure(80.0, 80.0)
	HandleFrigidWater()
EndEvent

function HandleFrigidWater()
	int perk_rank = _Frost_PerkRank_GlacialSwimmer.GetValueInt()
	survival_time = (30 + (15 * perk_rank))

	if _Frost_Setting_ForceFeedback.GetValueInt() == 2
		ForceFeedbackQuick()
	endif

	bool isInvulnerableUndead = IsPlayerUndead() && _Frost_Setting_VampireMode.GetValueInt() == 2

	if _Frost_Setting_FrigidWaterIsLethal.GetValueInt() == 2 && !isInvulnerableUndead
		update_count = 0
		message_1_shown = false
		message_2_shown = false
		message_3_shown = false
		RegisterForSingleUpdate(1)
	endif
endFunction

Event OnUpdate()
	float progress = (update_count as float)/(survival_time as float)

	if progress >= 1.0
		HandleMaxWaterExposure()
	elseif progress >= 0.83
		if _Frost_Setting_ConditionMessages.GetValueInt() == 2
			if !message_3_shown
				_Frost_WaterTemp3cMsg.Show()					; You can't feel anything. Darkness engulfs your mind.
				message_3_shown = true
			endif
		endif
		if bOddBeat
			ForceFeedback(progress)
			bOddBeat = false
			RegisterForSingleUpdate(0.4)
		else
			bOddBeat = true
			RegisterForSingleUpdate(1.0)
		endif
	elseif progress >= 0.66
		if _Frost_Setting_ConditionMessages.GetValueInt() == 2
			if !message_2_shown
				_Frost_WaterTemp3bMsg.Show()					; You feel your consciousness slipping.
				message_2_shown = true
			endif
		endif
		if bOddBeat
			ForceFeedback(progress)
			bOddBeat = false
			RegisterForSingleUpdate(0.4)
		else
			bOddBeat = true
			RegisterForSingleUpdate(1.0)
		endif
	elseif progress >= 0.33
		if _Frost_Setting_ConditionMessages.GetValueInt() == 2
			if !message_1_shown
				_Frost_WaterTemp3aMsg.Show()					; Your limbs begin to feel numb.
				message_1_shown = true
			endif
		endif
		ForceFeedback(progress)
		RegisterForSingleUpdate(0.6)
	else
		ForceFeedback(progress)
		RegisterForSingleUpdate(0.8)
	endif
	
	update_count += 1
endEvent

function ForceFeedbackQuick()
	Game.ShakeController(1.0, 1.0, 1.0)
endFunction

function ForceFeedback(float fPercentage)
	if _Frost_Setting_ForceFeedback.GetValueInt() == 2
		if fPercentage >= 1.0
			;no feedback
		elseif fPercentage >= 0.83
			Game.ShakeController(0.0, 0.8, 0.3)
			wait(0.6)
			;Game.ShakeController(0.6, 0.5, 0.2)
		elseif fPercentage >= 0.66
			Game.ShakeController(0.6, 0.0, 0.3)
			wait(0.6)
			Game.ShakeController(0.7, 0.8, 0.2)
		elseif fPercentage >= 0.33
			Game.ShakeController(0.7, 0.0, 0.2)
			wait(0.4)
			Game.ShakeController(0.8, 0.9, 0.2)
		else
			Game.ShakeController(0.8, 0.0, 0.2)
			wait(0.2)
			Game.ShakeController(1.0, 1.0, 0.2)
		endif
	else
		if fPercentage >= 1.0
			;nothing
		elseif fPercentage >= 0.83
			wait(0.6)
		elseif fPercentage >= 0.66
			wait(0.6)
		elseif fPercentage >= 0.33
			wait(0.4)
		else
			wait(0.2)
		endif
	endif
endFunction

function HandleMaxWaterExposure()
	if _Frost_Setting_MaxExposureMode.GetValueInt() == 3
		; Kill the player.
		_Frost_ColdWaterDeathSpell.Cast(PlayerRef, PlayerRef)
	elseif _Frost_Setting_MaxExposureMode.GetValueInt() == 2
		SendEvent_OnRescuePlayer(true)
	else
		; Do nothing.
	endif
endFunction

function SendEvent_OnRescuePlayer(bool in_water)
	FallbackEventEmitter emitter = GetEventEmitter_OnRescuePlayer()
	int handle = emitter.Create("Frost_OnRescuePlayer")
	if handle
		emitter.PushBool(handle, in_water)
		emitter.Send(handle)
	endif
endFunction

GlobalVariable property _Frost_FrigidWater_ForceKillPlayer auto
{This global is deprecated as of Frostfall 3.0.1.}
