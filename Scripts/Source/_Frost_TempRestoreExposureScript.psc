Scriptname _Frost_TempRestoreExposureScript extends ActiveMagicEffect

float property exposure_restore_amount auto
{The amount to decrease the player's exposure by when this effect starts.}

float property exposure_penalty_amount auto
{The amount to increase the player's exposure by when this effect wears off.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FrostUtil.GetExposureSystem().DecreaseExposure(exposure_restore_amount)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	FrostUtil.GetExposureSystem().IncreaseExposure(exposure_penalty_amount)
endEvent
