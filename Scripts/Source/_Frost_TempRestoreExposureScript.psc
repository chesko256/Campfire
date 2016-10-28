Scriptname _Frost_TempRestoreExposureScript extends ActiveMagicEffect

import CampUtil

float property exposure_restore_amount auto
{The amount to decrease the player's exposure by when this effect starts.}

float property exposure_penalty_amount auto
{The amount to increase the player's exposure by when this effect wears off.}

bool property is_alcohol = false auto
{Whether or not this effect is from alcohol.}

bool property is_spell = false auto
{Whether or not this effect is from a spell.}

Message property _Frost_WearOffExp_Alcohol auto
Message property _Frost_WearOffExp_Spell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FrostUtil.ModPlayerExposure(-exposure_restore_amount)
	SendEvent_ForceExposureMeterDisplay()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	FrostUtil.ModPlayerExposure(exposure_penalty_amount)
	SendEvent_ForceExposureMeterDisplay()
	if is_alcohol
		_Frost_WearOffExp_Alcohol.Show()
	elseif is_spell
		_Frost_WearOffExp_Spell.Show()
	endif
endEvent

function SendEvent_ForceExposureMeterDisplay(bool flash = false)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frost_ForceExposureMeterDisplay")
		if handle
			ModEvent.PushBool(handle, flash)
			ModEvent.Send(handle)
		endif
	endif
endFunction