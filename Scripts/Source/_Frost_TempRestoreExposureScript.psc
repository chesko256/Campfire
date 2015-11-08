Scriptname _Frost_TempRestoreExposureScript extends ActiveMagicEffect

float property exposure_restore_amount auto
{The amount to decrease the player's exposure by when this effect starts.}

float property exposure_penalty_amount auto
{The amount to increase the player's exposure by when this effect wears off.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FrostUtil.ModPlayerExposure(-exposure_restore_amount)
	SendEvent_ForceExposureMeterDisplay()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	FrostUtil.ModPlayerExposure(exposure_penalty_amount)
	SendEvent_ForceExposureMeterDisplay()
endEvent

function SendEvent_ForceExposureMeterDisplay(bool flash = false)
	int handle = ModEvent.Create("Frost_ForceExposureMeterDisplay")
	if handle
		ModEvent.PushBool(handle, flash)
		ModEvent.Send(handle)
	endif
endFunction