scriptname FrostUtil hidden

FrostfallAPI function GetAPI() global
    return (Game.GetFormFromFile(0x00064590, "Frostfall.esp") as Quest) as FrostfallAPI
endFunction

_Frost_ExposureSystem function GetExposureSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Exposure
endFunction

_Frost_ClothingSystem function GetClothingSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Clothing
endFunction

_Frost_InterfaceHandler function GetInterfaceHandler() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Interface
endFunction

_Frost_ArmorProtectionDatastoreHandler function GetClothingDatastoreHandler() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.ClothingDatastoreHandler
endFunction

_Frost_Compatibility function GetCompatibilitySystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Compatibility
endFunction

_Frost_HeatSourceSystem function GetHeatSourceSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.HeatSource
endFunction

_Frost_WetnessSystem function GetWetnessSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Wetness
endFunction

_Frost_ClimateSystem function GetClimateSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Climate
endFunction

_Frost_WarmthSystem function GetWarmthSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Warmth
endFunction

_Frost_CoverageSystem function GetCoverageSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Coverage
endFunction

_Frost_RescueSystem function GetRescueSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Rescue
endFunction

_Frost_ShelterSystem function GetShelterSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.Shelter
endFunction

bool function IsWarmEnoughToRemoveGearInTent() global
    return true
endFunction

function Event_LegacyWoodHarvest() global
    ;pass
endFunction

bool function IsPlayerNearFire() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif

    int near_fire = GetHeatSourceSystem()._Frost_NearFire.GetValueInt()
    if near_fire == 2
        return true
    else
        return false
    endif
endFunction

int function GetPlayerHeatSourceLevel() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return GetHeatSourceSystem()._Frost_CurrentHeatSourceSize.GetValueInt()
endFunction

float function GetPlayerHeatSourceDistance() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif

    return GetHeatSourceSystem()._Frost_CurrentHeatSourceDistance.GetValue()
endFunction

bool function IsPlayerTakingShelter() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif

    int taking_shelter = Frostfall._Frost_IsTakingShelter.GetValueInt()
    if taking_shelter == 2
        return true
    else
        return false
    endif
endFunction


bool function IsNearFastTravelException() global
	
endFunction

int function GetCurrentTemperature() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif
    return Frostfall._Frost_CurrentTemperature.GetValueInt()
endFunction

Weather function GetCurrentWeatherActual() global
    Weather current_weather
    bool transitioning = !(Weather.GetCurrentWeatherTransition() >= 1.0)
    if transitioning
        current_weather = Weather.GetOutgoingWeather()
    else
        current_weather = Weather.GetCurrentWeather()
    endif
    return current_weather
endFunction

int function GetWeatherClassificationActual(Weather akWeather) global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    if !akWeather
        return -1
    endif
    
    if Frostfall._Frost_OvercastWeatherList.HasForm(akWeather)
        return 0
    endif
    
    int classification = akWeather.GetClassification()
    
    _Frost_Compatibility Compatibility = GetCompatibilitySystem()
    if classification == 3
        if Compatibility.isDLC2Loaded && akWeather == Compatibility.DLC2AshStorm
            return 1
        else
            return 3
        endif
    else
        return classification
    endif
    return 0
endFunction

bool function IsWeatherSevere(Weather akWeather) global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    if !akWeather
        return false
    endif

    if Frostfall._Frost_SevereWeatherList.HasForm(akWeather)
        return true
    else
        return false
    endif
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
    return false
endFunction


;@TODO: Convert to Undead
;/********f* FrostUtil/IsPlayerVampire
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Whether or not the player is a vampire.
*
* SYNTAX
*/;
bool function IsPlayerVampire() global
;/*
* PARAMETERS
* * None.
*
* RETURN VALUE
* True if the player is a vampire, false otherwise.
*
* EXAMPLES
;Is the player a vampire?
if IsPlayerVampire()
    Debug.Trace("Player is a bloodsucker!")
endif
* NOTES
/;
    return false
endFunction

float function GetPlayerWetness() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif
    return Frostfall._Frost_AttributeWetness.GetValue()
endFunction

int function GetPlayerWetnessLevel() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return Frostfall._Frost_WetLevel.GetValueInt()
endFunction

float function GetPlayerExposure() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif
    return Frostfall._Frost_AttributeExposure.GetValue()
endFunction

int function GetPlayerExposureLevel() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return Frostfall._Frost_ExposureLevel.GetValueInt()
endFunction

function ModPlayerExposure(float amount, float limit = -1.0) global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    Frostfall.Exposure.ModExposure(amount, limit)
endFunction

int function GetPlayerWarmth() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return Frostfall._Frost_AttributeWarmth.GetValueInt()
endFunction

int function GetPlayerCoverage() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return Frostfall._Frost_AttributeCoverage.GetValueInt()
endFunction

int function GetPlayerArmorWarmth() global
    _Frost_ClothingSystem clothing_system = GetClothingSystem()
    return clothing_system.GetArmorWarmth()
endFunction

int function GetPlayerArmorCoverage() global
    _Frost_ClothingSystem clothing_system = GetClothingSystem()
    return clothing_system.GetArmorCoverage()
endFunction

function SendEvent_OnPlayerStartSwimming() global
    _FrostInternal.FrostDebug(0, "Sending event Frostfall_OnPlayerStartSwimming")
    int handle = ModEvent.Create("Frostfall_OnPlayerStartSwimming")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_OnPlayerStopSwimming() global
    _FrostInternal.FrostDebug(0, "Sending event Frostfall_OnPlayerStopSwimming")
    int handle = ModEvent.Create("Frostfall_OnPlayerStopSwimming")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function RaiseFrostAPIError() global
    debug.trace("[Frostfall][ERROR] Fatal Frostfall API error occurred.")
endFunction