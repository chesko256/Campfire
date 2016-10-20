scriptname _Frost_WarmHandsScript extends ActiveMagicEffect

Quest property _Frost_System_Heat auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	(_Frost_System_Heat as _Frost_WarmHandsLogic).EffectStart()
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	(_Frost_System_Heat as _Frost_WarmHandsLogic).EffectFinish()
endEvent



;/Event OnSneak()
	if !animation_playing
		if (Game.GetRealHoursPassed() * 3600.0) - last_animation_time >= 3.0
			WarmHandsStart()
			; ShowTutorial_WarmHands(true)
		endif
	else
		WarmHandsEnd()
	endif
endEvent
/;

; DEPRECATED
GlobalVariable property _Frost_Setting_1PAnimationAllowed auto
{This setting is deprecated as of Frostfall 3.0.1.}