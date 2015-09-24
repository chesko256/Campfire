scriptname FrostUtil hidden

_Frost_ClothingSystem function GetClothingSystem() global
    Quest delete_me = none
    return (delete_me as _Frost_ClothingSystem)
endFunction

bool function IsWarmEnoughToRemoveGearInTent() global
    return true
endFunction

bool function IsWarmEnoughToHarvestWood() global
    ; Responsible for displaying error, if too cold.
    return true
endFunction

function Event_LegacyWoodHarvest() global
    ;pass
endFunction

bool function IsRefNearFire(ObjectReference akReference)
    return false
endFunction

int function GetCurrentHeatLevel()
    return 0
endFunction

bool function IsNearFastTravelException() global
	;if Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_FastTravelExceptions, pPlayer,  600.0) != None
	;	return true
	;else
	;	return false
	;endif
endFunction

int function GetWeatherClassificationActual(Weather akWeather) global
    ;/if !akWeather
        return -1
    endif
    
    if FrostAPI._Frost_OvercastWeatherList.HasForm(akWeather)
        return 0
    endif
    
    int classification = akWeather.GetClassification()
    
    _Frost_Compatibility Compatibility = GetCompatibilitySystem()
    if classification == 3
        if Compatibility.isDLC2Loaded
            if akWeather == Compatibility.DLC2AshStorm
                return 1
            else
                return 3
            endif
        else
            return 3
        endif
    else
        return classification
    endif/;
endFunction

;/********f* FrostUtil/IsRefInOblivion
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Whether or not the reference is in a base game or DLC Oblivion worldspace.
*
* SYNTAX
*/;
bool function IsRefInOblivion(ObjectReference akReference) global
;/*
* PARAMETERS
* * akReference: The object reference to check.
*
* RETURN VALUE
* True if the reference is in Oblivion.
*
* EXAMPLES
;Is the box in Oblivion?
if IsRefInOblivion(Box)
    Debug.Trace("Box is in Oblivion!")
endif
* NOTES
* The following Worldspaces are considered Oblivion worldspaces:
* Soul Cairn
* Apocrypha
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return False
    endif

    if Frostfall._Frost_WorldspacesExteriorOblivion.HasForm(akReference.GetWorldSpace())
        return true
    else
        return false
    endif
endFunction