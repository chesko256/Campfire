scriptname _Seed_FocusMonitor extends ReferenceAlias
{Set the Focused state based on current conditions. If the player is in
a stressful situation, the player's needs should be suspended. The Focused
ability (visible to the player) is conditional on the global.}

import CampUtil

Actor property PlayerRef auto
GlobalVariable property _Seed_IsPlayerFocused auto
Keyword property LocTypeDungeon auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if IsRefInInterior(PlayerRef)
        if akNewLoc.HasKeyword(LocTypeDungeon)
            if akNewLoc.IsCleared()
                ; Player entered a hostile but cleared interior.
                SetFocused(false)
            else
                ; Player entered an actively hostile interior.
                SetFocused(true)
            endif
        else
            ; Player entered a non-hostile interior.
            SetFocused(false)
        endif
    else
        ; Player entered an exterior area.
        SetFocused(false)
    endif
endEvent

function SetFocused(bool focused)
    if focused
        _Seed_IsPlayerFocused.SetValueInt(2)
    else
        _Seed_IsPlayerFocused.SetValueInt(1)
    endif
endFunction