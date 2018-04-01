scriptname _Seed_FocusEffectScript extends ActiveMagicEffect
{If the player is in a stressful situation, the player's needs 
should be suspended.}

import SeedUtil
import _SeedInternal

GlobalVariable property _Seed_Setting_Focus auto
GlobalVariable property _Seed_IsPlayerFocused auto
GlobalVariable property _Seed_HelpDone_Focus auto
GlobalVariable property _Seed_Setting_DisplayTutorials auto
Message property _Seed_FocusOnMsg auto
Message property _Seed_FocusOffMsg auto
Message property _Seed_Help_Focus auto

; @TODO: Toggle focus off
Event OnEffectStart(Actor akTarget, Actor akCaster)
    bool wasFocused = _Seed_IsPlayerFocused.GetValueInt() == 2

	_Seed_IsPlayerFocused.SetValueInt(2)
    if !wasFocused
        _Seed_FocusOnMsg.Show()
        SeedDebug(0, "[Focus] Player is now focused.")
        ShowTutorial_Focus()
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	bool wasFocused = _Seed_IsPlayerFocused.GetValueInt() == 2

	_Seed_IsPlayerFocused.SetValueInt(1)
	if wasFocused
        _Seed_FocusOffMsg.Show()
        GetHungerSystem().RunDelayedCycles()
        SeedDebug(0, "[Focus] Player no longer focused.")
    endif
EndEvent

function ShowTutorial_Focus()
    if _Seed_Setting_DisplayTutorials.GetValueInt() == 2 && _Seed_HelpDone_Focus.GetValueInt() == 1
        _Seed_Help_Focus.Show()
        _Seed_HelpDone_Focus.SetValue(2)
    endif
endFunction