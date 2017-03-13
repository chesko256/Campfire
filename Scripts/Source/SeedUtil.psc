scriptname SeedUtil hidden

LastSeedAPI function GetAPI() global
    return (Game.GetFormFromFile(0x0, "LastSeed.esp") as Quest) as LastSeedAPI
endFunction

; System Access ===================================================================================

; These are not intended for public use and are therefore undocumented.

_Seed_VitalitySystem function GetVitalitySystem() global
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return none
    endif
    return LastSeed.Vitality
endFunction

_Seed_HungerSystem function GetHungerSystem() global
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return none
    endif
    return LastSeed.Hunger
endFunction

_Seed_ThirstSystem function GetThirstSystem() global
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return none
    endif
    return LastSeed.Thirst
endFunction

_Seed_FatigueSystem function GetFatigueSystem() global
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return none
    endif
    return LastSeed.Fatigue
endFunction

_Seed_FoodDatastoreHandler function GetFoodDatastoreHandler() global
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return none
    endif
    return LastSeed.FoodDatastore
endFunction

; Public Functions ================================================================================

;/********f* SeedUtil/GetAPIVersion
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Get the SeedUtil API version number.
*
* SYNTAX
*/;
float function GetAPIVersion() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The SeedUtil API version number. This is NOT the same thing as the version number of Last Seed.
* SeedUtil's API version number will increment only when changes have been made to the API itself.
*
* EXAMPLES
float ver = SeedUtil.GetAPIVersion()
;*********/;
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return -1.0
    endif
    return LastSeed._Seed_APIVersion.GetValue()
endFunction

;/********f* SeedUtil/GetLastSeedVersion
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Get the Last Seed mod version number.
*
* SYNTAX
*/;
float function GetLastSeedVersion() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The Last Seed version number.
*
* EXAMPLES
float ver = SeedUtil.GetFrostfallVersion()
;*********/;
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return -1.0
    endif
    return LastSeed._Seed_LastSeedVersion.GetValue()
endFunction

;/********f* SeedUtil/IsPlayerFocused
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns whether or not the player is 'focused' (e.g. in a dungeon or other qualifying area
* that temporarily delays needs and Vitality).
*
* SYNTAX
*/;
bool function IsPlayerFocused() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if the player is focused; false otherwise.
*
* EXAMPLES
;Is the player focused?
bool isFocused = SeedUtil.IsPlayerFocused()
;*********/;
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return false
    endif

    if LastSeed._Seed_IsPlayerFocused.GetValueInt() == 2
        return true
    else
        return false
    endif
endFunction



;/********f* SeedUtil/IsKnownFood
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns whether the item is a known food.
*
* SYNTAX
*/;
bool function IsKnownFood(Form akBaseObject) global
;/*
* PARAMETERS
* akBaseObject: The form to check.
*
* RETURN VALUE
* True if the form is food; false otherwise.
*
* EXAMPLES
;Is the squibble something I can eat?
bool is_food = SeedUtil.IsItemFood(squibble)
;*********/;
    LastSeedAPI LastSeed = GetAPI()
    if LastSeed == none
        RaiseSeedAPIError()
        return false
    endif

    ;@TODO
endFunction

function RaiseSeedAPIError() global
    debug.trace("[LastSeed][ERROR] Fatal Last Seed API error occurred.")
endFunction























; =============================================================================
;
;
;
;
;            While on this glowing canvas stands
;            The labour of my busy hands
;            It will remain when I am gone
;            For you my friends to look upon
;
;
;
;
;==============================================================================