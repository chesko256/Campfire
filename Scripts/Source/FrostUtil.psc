;/********s* Form/FrostUtil
* SCRIPTNAME
*/;
scriptname FrostUtil hidden
{
* OVERVIEW
* The `FrostUtil` script is the primary way most mods should interact with Frostfall and contains many helpful functions. To call any of the following functions, download the SDK and in your script include the line:
* <pre>import FrostUtil</pre>
* Alternatively, you can call `FrostUtil.FunctionName()` without importing FrostUtil. }
;*********/;

FrostfallAPI function GetAPI() global
    return (Game.GetFormFromFile(0x00064590, "Frostfall.esp") as Quest) as FrostfallAPI
endFunction

; System Access ===================================================================================

; These are not intended for public use and are therefore undocumented.

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

_Frost_ExposureMeterInterfaceHandler function GetExposureMeterHandler() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.ExposureMeterHandler
endFunction

_Frost_WetnessMeterInterfaceHandler function GetWetnessMeterHandler() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.WetnessMeterHandler
endFunction

_Frost_WeatherMeterInterfaceHandler function GetWeathersenseMeterHandler() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.WeathersenseMeterHandler
endFunction

_Frost_ArmorProtectionDatastoreHandler function GetClothingDatastoreHandler() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.ClothingDatastoreHandler
endFunction

_Frost_LegacyArmorDatastore function GetLegacyArmorDatastore() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.LegacyArmorDatastore
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

_Frost_PlayerStateSystem function GetPlayerStateSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.PlayerState
endFunction

_Frost_FrostResistSystem function GetFrostResistSystem() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.FrostResist
endFunction

FallbackEventEmitter function GetEventEmitter_UpdateWarmth() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_UpdateWarmth as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_UpdateCoverage() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_UpdateCoverage as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnTamrielRegionChange() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_OnTamrielRegionChange as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnConjuredObjectIDUpdated() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_OnConjuredObjectIDUpdated as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnRescuePlayer() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_OnRescuePlayer as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_DispelBoundCloaks() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_DispelBoundCloaks as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnInnerFireMeditate() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_OnInnerFireMeditate as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnPlayerStartSwimming() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_OnPlayerStartSwimming as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnPlayerStopSwimming() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_OnPlayerStopSwimming as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_SoupEffectStart() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_SoupEffectStart as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_SoupEffectStop() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_SoupEffectStop as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_FrostfallLoaded() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_FrostfallLoaded as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_StartFrostfall() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_StartFrostfall as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_StopFrostfall() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif
    return Frostfall.EventEmitter_StopFrostfall as FallbackEventEmitter
endFunction

bool function IsArmorShield(Armor akArmor) global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif
    return akArmor.HasKeyword(Frostfall.ArmorShield)
endFunction

bool function IsArmorCloak(Armor akArmor) global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return none
    endif

    if Frostfall.LegacyArmorDatastore.FindCustomCloakProtectionLevels(akArmor)[2] == 5
        return true
    elseif Frostfall.LegacyArmorDatastore.FindCloakProtectionLevels(akArmor)[2] == 5
        return true
    elseif akArmor.HasKeyword(Frostfall.WAF_ClothingCloak)
        return true
    elseif akArmor.HasKeyword(Frostfall.FrostfallEnableKeywordProtection) && (akArmor.HasKeyword(Frostfall.FrostfallIsCloakCloth) || akArmor.HasKeyword(Frostfall.FrostfallIsCloakFur) || akArmor.HasKeyword(Frostfall.FrostfallIsCloakLeather))
        return true
    else
        return false
    endif
endFunction

bool function IsWarmEnoughToRemoveGearInTent() global
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif

    int temp = Frostfall._Frost_CurrentTemperature.GetValueInt()
    if temp > 0.0
        return true
    else
        return false
    endif
endFunction

; Public Functions ================================================================================

;/********f* FrostUtil/GetAPIVersion
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Get the FrostUtil API version number.
*
* SYNTAX
*/;
float function GetAPIVersion() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The FrostUtil API version number. This is NOT the same thing as the version number of Frostfall.
* FrostUtil's API version number will increment only when changes have been made to the API itself.
*
* EXAMPLES
float ver = FrostUtil.GetAPIVersion()
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif
    return Frostfall._Frost_APIVersion.GetValue()
endFunction

;/********f* FrostUtil/GetFrostfallVersion
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Get the Frostfall mod version number.
*
* SYNTAX
*/;
float function GetFrostfallVersion() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The Frostfall version number.
*
* EXAMPLES
float ver = FrostUtil.GetFrostfallVersion()
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif
    return Frostfall._Frost_FrostfallVersion.GetValue()
endFunction

;/********f* FrostUtil/IsPlayerNearFire
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Whether or not the player is currently near a fire.
*
* SYNTAX
*/;
bool function IsPlayerNearFire() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if near a fire; false otherwise.
*
* EXAMPLES
;Is the player near a fire?
bool near_fire = FrostUtil.IsPlayerNearFire()
* NOTES
* This does NOT indicate if the player is near a heat source; there are heat sources
* that are not fires. Fires have special properties in Frostfall and Campfire, which
* include drying the player when wet, and being able to cook food using a cooking pot.
*
* To determine if the player is near a heat source of any kind, use GetPlayerHeatSourceLevel()
* instead.
*
* Keep in mind that Frostfall's Heat Source System only updates every 5 seconds. Therefore,
* the data returned by this function is not real-time.
;*********/;
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

;/********f* FrostUtil/GetPlayerHeatSourceLevel
* API VERSION ADDED
* 1
*
* DESCRIPTION
* The level (size) of the player's current nearby heat source.
*
* SYNTAX
*/;
int function GetPlayerHeatSourceLevel() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* Possible return values:
* * 0 = Player is not near a heat source.
* * 1 = Current heat source is "small" (e.g. bowls of burning embers, "fragile" campfires in Campfire)
* * 2 = Current heat source is "medium" (e.g. most campfires and other fireplaces)
* * 3 = Current heat source is "large" (e.g. giant campfires, "roaring" campfires in Campfire)
*
* EXAMPLES
;Is the player near heat?
int heat = FrostUtil.GetPlayerHeatSourceLevel()
if heat > 0
    debug.notification("Player is near a heat source!")
endif
* NOTES
* This function does NOT determine if the heat source is a fire or not; there are heat sources
* that are not fires. To determine if the player is near a fire, use IsPlayerNearFire().
*
* Keep in mind that Frostfall's Heat Source System only updates every 5 seconds. Therefore,
* the data returned by this function is not real-time.
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return GetHeatSourceSystem()._Frost_CurrentHeatSourceSize.GetValueInt()
endFunction

;/********f* FrostUtil/GetPlayerHeatSourceDistance
* API VERSION ADDED
* 1
*
* DESCRIPTION
* The distance from the player to the player's current nearby heat source.
*
* SYNTAX
*/;
float function GetPlayerHeatSourceDistance() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* * 0.0 to 600.0 - The distance from the player to the heat source. Frostfall does not detect heat sources more than 600 units away.
* * -1.0 - No current heat source detected.
*
* EXAMPLES
;How far away is the heat source?
float dist = FrostUtil.GetPlayerHeatSourceDistance()
if dist <= 300.0
    debug.notification("The player is really close to the heat source!")
endif
* NOTES
* Keep in mind that Frostfall's Heat Source System only updates every 5 seconds. Therefore,
* the data returned by this function is not real-time.
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif

    return GetHeatSourceSystem()._Frost_CurrentHeatSourceDistance.GetValue()
endFunction

;/********f* FrostUtil/IsPlayerTakingShelter
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Whether or not the player is taking shelter underneath an outcropping / building. If the
* player is "sheltered", the player will dry off if wet, regardless of current weather conditions.
*
* SYNTAX
*/;
bool function IsPlayerTakingShelter() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if taking shelter, false if not.
*
* EXAMPLES
;Is the player underneath something?
bool sheltered = FrostUtil.IsPlayerTakingShelter()
* NOTES
* This function does not return true if the player is inside a Campfire-based tent; it only
* returns true if a ray emitting upward from the player's head collides with an obstruction.
* For tent detection, use CampUtil.GetCurrentTent().
;*********/;
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

;/********f* FrostUtil/IsNearFastTravelException
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Whether or not the player near a "fast travel exception". If a player is nearby one of these objects, the
* Exposure System will re-enable the player's Fast Travel controls. This is used in cases where there is an
* expectation for Fast Travel be enabled when near these objects (like Apocrypha's Black Books.)
*
* SYNTAX
*/;
bool function IsNearFastTravelException() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if near a "fast travel exception" object, false if not.
*
* EXAMPLES
;Is the player near a fast travel exception?
bool near_ft_exception = FrostUtil.IsNearFastTravelException()
;*********/;
	FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif
    if Game.FindClosestReferenceOfAnyTypeInListFromRef(Frostfall._Frost_FastTravelExceptions, Frostfall.PlayerRef, 600.0)
        return true
    else
        return false
    endif
endFunction

;/********f* FrostUtil/GetCurrentTemperature
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns the current area temperature, based on location, weather, weather severity, and time of day.
*
* SYNTAX
*/;
int function GetCurrentTemperature() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* * Greater than 10: A "warm" area. Exposure will decrease. The higher the number, the faster it will decrease.
* * 10: A "neutral" area. Exposure will not increase or decrease.
* * Less than 10: A "cold" area. Exposure will increase. The lower the number, the faster it will increase.
*
* EXAMPLES
int temp = FrostUtil.GetCurrentTemperature()
if temp < 10
    debug.notification("It's cold!")
endif
* NOTES
* The return values of this function correspond very roughly with degrees celsius.
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif
    return Frostfall._Frost_CurrentTemperature.GetValueInt()
endFunction

;/********f* FrostUtil/GetCurrentWeatherActual
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns the current weather somewhat more accurately than the default GetCurrentWeather() function.
* This function returns the outgoing weather if the weather is currently transitioning out (and thus is
* still currently visible). Otherwise, returns the current weather.
*
* SYNTAX
*/;
Weather function GetCurrentWeatherActual() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The current weather.
*
* EXAMPLES
;What is the current weather, really?
Weather wthr = FrostUtil.GetCurrentWeatherActual()
;*********/;
    Weather current_weather
    bool transitioning = !(Weather.GetCurrentWeatherTransition() >= 1.0)
    if transitioning
        current_weather = Weather.GetOutgoingWeather()
    else
        current_weather = Weather.GetCurrentWeather()
    endif
    return current_weather
endFunction

;/********f* FrostUtil/GetWeatherClassificationActual
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns the classification of the weather returned by GetCurrentWeatherActual().
*
* SYNTAX
*/;
int function GetWeatherClassificationActual(Weather akWeather) global
;/*
* PARAMETERS
* * akWeather: The Weather to check.
*
* RETURN VALUE
* The current weather classification.
*
* EXAMPLES
;What is the current weather classification, really?
int class = FrostUtil.GetWeatherClassificationActual()
;*********/;
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

;/********f* FrostUtil/IsWeatherSevere
* API VERSION ADDED
* 1
*
* DESCRIPTION
* True if this weather is in the severe weather list that Frostfall maintains, false if not.
*
* SYNTAX
*/;
bool function IsWeatherSevere(Weather akWeather) global
;/*
* PARAMETERS
* * akWeather: The Weather to check.
*
* RETURN VALUE
* Whether or not this weather is severe.
*
* EXAMPLES
if FrostUtil.IsWeatherSevere(FrostUtil.GetCurrentWeatherActual())
    debug.notification("Better stay indoors!")
endif
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
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

;/********f* FrostUtil/AddSevereWeather
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Adds a weather to the severe weather list that Frostfall maintains.
*
* SYNTAX
*/;
function AddSevereWeather(Weather akWeather) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Add my custom blizzard to the severe weather list
FrostUtil.AddSevereWeather(my_crazy_blizzard)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akWeather
        return
    endif

    if Frostfall._Frost_SevereWeatherList.HasForm(akWeather)
        return
    else
        Frostfall._Frost_SevereWeatherList.AddForm(akWeather)
    endif
endFunction

;/********f* FrostUtil/RemoveSevereWeather
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Removes a weather from the severe weather list that Frostfall maintains. Only weather forms added
* to the list via AddSevereWeather can be removed.
*
* SYNTAX
*/;
function RemoveSevereWeather(Weather akWeather) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Remove my custom blizzard to the severe weather list
FrostUtil.RemoveSevereWeather(my_crazy_blizzard)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akWeather
        return
    endif

    if Frostfall._Frost_SevereWeatherList.HasForm(akWeather)
        Frostfall._Frost_SevereWeatherList.RemoveAddedForm(akWeather)
    else
        return
    endif
endFunction

;/********f* FrostUtil/IsWeatherOvercast
* API VERSION ADDED
* 1
*
* DESCRIPTION
* True if this weather is in the overcast weather list that Frostfall maintains, false if not.
*
* SYNTAX
*/;
bool function IsWeatherOvercast(Weather akWeather) global
;/*
* PARAMETERS
* * akWeather: The Weather to check.
*
* RETURN VALUE
* Whether or not this weather is Overcast.
*
* EXAMPLES
if FrostUtil.IsWeatherOvercast(FrostUtil.GetCurrentWeatherActual())
    debug.notification("Man, it's dreary out.")
endif
* NOTES
* Weather in the overcast weather list must be marked with the "Cloudy" classification.
* This list is necessary because the base Skyrim game often uses the "Cloudy" classification to denote
* fog weathers instead of cloudy weathers, and Frostfall needs to be able to differentiate between them.
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif

    if !akWeather
        return false
    endif

    if Frostfall._Frost_OvercastWeatherList.HasForm(akWeather)
        return true
    else
        return false
    endif
endFunction

;/********f* FrostUtil/AddOvercastWeather
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Adds a weather to the overcast weather list that Frostfall maintains.
*
* SYNTAX
*/;
function AddOvercastWeather(Weather akWeather) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Add my custom weather to the overcast weather list
FrostUtil.AddOvercastWeather(my_dreary_weather)
* NOTES
* Weather in the overcast weather list must be marked with the "Cloudy" classification.
* This list is necessary because the base Skyrim game often uses the "Cloudy" classification to denote
* fog weathers instead of cloudy weathers, and Frostfall needs to be able to differentiate between them.
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akWeather
        return
    endif

    if Frostfall._Frost_OvercastWeatherList.HasForm(akWeather)
        return
    else
        Frostfall._Frost_OvercastWeatherList.AddForm(akWeather)
    endif
endFunction

;/********f* FrostUtil/RemoveOvercastWeather
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Removes a weather from the overcast weather list that Frostfall maintains. Only weather forms added
* to the list via AddOvercastWeather can be removed.
*
* SYNTAX
*/;
function RemoveOvercastWeather(Weather akWeather) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Remove my custom weather from the overcast weather list
FrostUtil.RemoveOvercastWeather(my_dreary_weather)
* NOTES
* Weather in the overcast weather list must be marked with the "Cloudy" classification.
* This list is necessary because the base Skyrim game often uses the "Cloudy" classification to denote
* fog weathers instead of cloudy weathers, and Frostfall needs to be able to differentiate between them.
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akWeather
        return
    endif

    if Frostfall._Frost_OvercastWeatherList.HasForm(akWeather)
        Frostfall._Frost_OvercastWeatherList.RemoveAddedForm(akWeather)
    else
        return
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
* * The following Worldspaces are considered Oblivion worldspaces:
* * Soul Cairn
* * Apocrypha
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

;/********f* FrostUtil/IsOblivionWorldspace
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Whether or not the worldspace is a base game or DLC Oblivion worldspace.
*
* SYNTAX
*/;
bool function IsOblivionWorldspace(Worldspace akWorldspace) global
;/*
* PARAMETERS
* * akWorldspace: The worldspace to check.
*
* RETURN VALUE
* True if the worldspace is a plane of Oblivion.
*
* EXAMPLES
;Is the box in Oblivion?
if IsOblivionWorldspace(infernal_realm)
    Debug.Trace("This is a plane of Oblivion!")
endif
* NOTES
* * The following Worldspaces are considered Oblivion worldspaces by default:
* * Soul Cairn
* * Apocrypha
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return False
    endif

    if !akWorldspace
        return false
    endif

    if Frostfall._Frost_WorldspacesExteriorOblivion.HasForm(akWorldspace)
        return true
    else
        return false
    endif
    return false
endFunction

;/********f* FrostUtil/AddOblivionWorldspace
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Adds a worldspace to the Oblivion worldspace list that Frostfall maintains. The player does not gain exposure when in planes of Oblivion.
*
* SYNTAX
*/;
function AddOblivionWorldspace(Worldspace akWorldspace) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Add my custom worldspace to the Oblivion worldspace list
FrostUtil.AddOblivionWorldspace(my_infernal_realm)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akWorldspace
        return
    endif

    if Frostfall._Frost_WorldspacesExteriorOblivion.HasForm(akWorldspace)
        return
    else
        Frostfall._Frost_WorldspacesExteriorOblivion.AddForm(akWorldspace)
    endif
endFunction

;/********f* FrostUtil/RemoveOblivionWorldspace
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Removes a worldspace from the Oblivion worldspace list that Frostfall maintains. The player does not gain exposure when in planes of Oblivion.
* Only Worldspace forms added to the list via AddOblivionWorldspace can be removed.
*
* SYNTAX
*/;
function RemoveOblivionWorldspace(Worldspace akWorldspace) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Remove my custom worldspace from the Oblivion worldspace list
FrostUtil.RemoveOblivionWorldspace(my_infernal_realm)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akWorldspace
        return
    endif

    if Frostfall._Frost_WorldspacesExteriorOblivion.HasForm(akWorldspace)
        Frostfall._Frost_WorldspacesExteriorOblivion.RemoveAddedForm(akWorldspace)
    else
        return
    endif
endFunction

;/********f* FrostUtil/IsExposureException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* True if this form is in the exposure exception list that Frostfall maintains, false if not. When the player goes near this object (600 units or less),
* the player will not gain or lose exposure.
*
* SYNTAX
*/;
bool function IsExposureException(Form akBaseObject) global
;/*
* PARAMETERS
* * akBaseObject: The form to check.
*
* RETURN VALUE
* Whether or not this form is an exposure exception.
*
* EXAMPLES
;Will I turn off exposure mechanics near the dragon?
if FrostUtil.IsExposureException(SuperDragon)
    debug.notification("Guess I won't freeze to death near the Super Dragon.")
endif
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif

    if !akBaseObject
        return false
    endif

    if Frostfall._Frost_ExposureExceptions.HasForm(akBaseObject)
        return true
    else
        return false
    endif
endFunction

;/********f* FrostUtil/AddExposureException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Adds a form to the list of exposure exception objects that Frostfall maintains. When the player goes near this object (600 units or less),
* the player will not gain or lose exposure.
*
* SYNTAX
*/;
function AddExposureException(Form akBaseObject) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Suspend exposure gain and loss near the power stone
FrostUtil.AddExposureException(power_stone)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akBaseObject
        return
    endif

    if Frostfall._Frost_ExposureExceptions.HasForm(akBaseObject)
        return
    else
        Frostfall._Frost_ExposureExceptions.AddForm(akBaseObject)
    endif
endFunction

;/********f* FrostUtil/RemoveExposureException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Removes a form from the list of exposure exception objects that Frostfall maintains.
* Only forms added to the list via AddExposureException can be removed.
*
* SYNTAX
*/;
function RemoveExposureException(Form akBaseObject) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;No longer suspend exposure near the power stone
FrostUtil.RemoveExposureException(power_stone)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akBaseObject
        return
    endif

    if Frostfall._Frost_ExposureExceptions.HasForm(akBaseObject)
        Frostfall._Frost_ExposureExceptions.RemoveAddedForm(akBaseObject)
    else
        return
    endif
endFunction

;/********f* FrostUtil/IsFastTravelException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* True if this form is in the fast travel exception list that Frostfall maintains, false if not. When the player goes near this object (600 units or less),
* fast travel controls will be re-enabled regardless of their fast travel settings.
*
* SYNTAX
*/;
bool function IsFastTravelException(Form akBaseObject) global
;/*
* PARAMETERS
* * akBaseObject: The form to check.
*
* RETURN VALUE
* Whether or not this form is a fast travel exception.
*
* EXAMPLES
;Will I enable fast travel near the carriage?
if FrostUtil.IsFastTravelException(carriage)
    debug.notification("Sally forth!")
endif
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif

    if !akBaseObject
        return false
    endif

    if Frostfall._Frost_FastTravelExceptions.HasForm(akBaseObject)
        return true
    else
        return false
    endif
endFunction

;/********f* FrostUtil/AddFastTravelException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Adds a form to the list of fast travel exception objects that Frostfall maintains. When the player goes near this object (600 units or less),
* fast travel controls will be re-enabled regardless of their fast travel settings.
*
* SYNTAX
*/;
function AddFastTravelException(Form akBaseObject) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Enable fast travel when near the horse.
FrostUtil.AddFastTravelException(my_horse)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akBaseObject
        return
    endif

    if Frostfall._Frost_FastTravelExceptions.HasForm(akBaseObject)
        return
    else
        Frostfall._Frost_FastTravelExceptions.AddForm(akBaseObject)
    endif
endFunction

;/********f* FrostUtil/RemoveFastTravelException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Removes a form from the list of fast travel exception objects that Frostfall maintains.
* Only forms added to the list via AddFastTravelException can be removed.
*
* SYNTAX
*/;
function RemoveFastTravelException(Form akBaseObject) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;No longer enable fast travel near the horse
FrostUtil.RemoveFastTravelException(my_horse)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akBaseObject
        return
    endif

    if Frostfall._Frost_FastTravelExceptions.HasForm(akBaseObject)
        Frostfall._Frost_FastTravelExceptions.RemoveAddedForm(akBaseObject)
    else
        return
    endif
endFunction

;/********f* FrostUtil/IsSleepException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* True if this form is in the sleep exception list that Frostfall maintains, false if not.
*
* SYNTAX
*/;
bool function IsSleepException(Form akBaseObject) global
;/*
* PARAMETERS
* * akBaseObject: The form to check.
*
* RETURN VALUE
* Whether or not this weather is Overcast.
*
* EXAMPLES
if FrostUtil.IsSleepException(my_bedroll)
    debug.notification("Time to hit the sack!")
endif
* NOTES
* When the player goes near this object (600 units or less),
* the player will be able to sleep. This is important if the player has "Disable Waiting Outdoors" enabled, which prevents
* sleeping unless near an object in this list.
*
* Tents created with the Campfire Dev Kit are automatically sleep exception objects. Conjured shelters are not and must
* be added using AddSleepException().
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return false
    endif

    if !akBaseObject
        return false
    endif

    if Frostfall._Frost_SleepObjects.HasForm(akBaseObject)
        return true
    else
        return false
    endif
endFunction

;/********f* FrostUtil/AddSleepException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Adds a form to the list of sleep exception objects that Frostfall maintains. When the player goes near this object (600 units or less),
* the player will be able to sleep. This is important if the player has "Disable Waiting Outdoors" enabled, which prevents
* sleeping unless near an object in this list.
*
* SYNTAX
*/;
function AddSleepException(Form akBaseObject) global
;/*
* PARAMETERS
* * akBaseObject: The form to add.
*
* RETURN VALUE
* None
*
* EXAMPLES
;Enable ability to sleep near my bedroll.
FrostUtil.AddSleepException(my_bedroll)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akBaseObject
        return
    endif

    if Frostfall._Frost_SleepObjects.HasForm(akBaseObject)
        return
    else
        Frostfall._Frost_SleepObjects.AddForm(akBaseObject)
    endif
endFunction

;/********f* FrostUtil/RemoveSleepException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Removes a form from the list of sleep exception objects that Frostfall maintains.
* Only forms added to the list via AddSleepException can be removed.
*
* SYNTAX
*/;
function RemoveSleepException(Form akBaseObject) global
;/*
* PARAMETERS
* * akBaseObject: The form to remove.
*
* RETURN VALUE
* None
*
* EXAMPLES
;No longer enable fast travel near the horse
FrostUtil.RemoveSleepException(my_horse)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akBaseObject
        return
    endif

    if Frostfall._Frost_SleepObjects.HasForm(akBaseObject)
        Frostfall._Frost_SleepObjects.RemoveAddedForm(akBaseObject)
    else
        return
    endif
endFunction

;/********f* FrostUtil/AddFastTravelWorldspaceException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Adds a worldspace to the list of worldspaces that Frostfall maintains where fast travel controls should always be enabled.
*
* SYNTAX
*/;
function AddFastTravelWorldspaceException(Worldspace akWorldspace) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Add my custom worldspace to the fast travel exception worldspace list
FrostUtil.AddFastTravelWorldspaceException(my_realm)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akWorldspace
        return
    endif

    if Frostfall._Frost_WorldspacesFTException.HasForm(akWorldspace)
        return
    else
        Frostfall._Frost_WorldspacesFTException.AddForm(akWorldspace)
    endif
endFunction

;/********f* FrostUtil/RemoveFastTravelWorldspaceException
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Adds a worldspace to the list of worldspaces that Frostfall maintains where fast travel controls should always be enabled.
* Only Worldspace forms added to the list via AddFastTravelWorldspaceException can be removed.
*
* SYNTAX
*/;
function RemoveFastTravelWorldspaceException(Worldspace akWorldspace) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* None
*
* EXAMPLES
;Remove my custom worldspace from the fast travel exception worldspace list
FrostUtil.RemoveFastTravelWorldspaceException(my_realm)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    if !akWorldspace
        return
    endif

    if Frostfall._Frost_WorldspacesFTException.HasForm(akWorldspace)
        Frostfall._Frost_WorldspacesFTException.RemoveAddedForm(akWorldspace)
    else
        return
    endif
endFunction

;/********f* FrostUtil/GetPlayerWetness
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Return the player's current wetness value.
*
* SYNTAX
*/;
float function GetPlayerWetness() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* * The player's current wetness value.
* * 0.0 = Not wet
* * >0.0 - 199.9 = Damp
* * 200.0 - 549.9 = Wet
* * 550.0 - 750.0 = Drenched
*
* EXAMPLES
float wetness = FrostUtil.GetPlayerWetness()
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif
    return Frostfall._Frost_AttributeWetness.GetValue()
endFunction

;/********f* FrostUtil/GetPlayerWetnessLevel
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Return the player's current wetness level. May be easier to use than GetPlayerWetness() if you don't
* need to know the actual wetness value.
*
* SYNTAX
*/;
int function GetPlayerWetnessLevel() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* * The player's current wetness level.
* * 0 = Not wet
* * 1 = Damp
* * 2 = Wet
* * 3 = Drenched
*
* EXAMPLES
;Is the player drenched?
int wet_level = FrostUtil.GetPlayerWetnessLevel()
if wet_level == 3
    debug.notification("You're soaked!")
endif
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return Frostfall._Frost_WetLevel.GetValueInt()
endFunction

;/********f* FrostUtil/ModPlayerWetness
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Modify the player's current wetness by the given amount. Using this
* function will correctly process the wetness change and notify the UI layer
* (meters, etc) of the change and display them as appropriate. Using this function
* is the only safe method of directly modifying the player's wetness value.
*
* SYNTAX
*/;
function ModPlayerWetness(float amount, float limit = -1.0) global
;/*
* PARAMETERS
* * amount: The amount to modify the player's wetness by. Positive numbers increase wetness, negative values decrease wetness.
* * limit (optional): The value at which you should stop the wetness change, if this value is reached. A value of -1.0 indicates that there is no limit. (Example: calling FrostUtil.ModPlayerWetness(35.0, 50.0) when the player's current wetness is 40.0 will increase the player's wetness to 50.0, not 75.0)
*
* RETURN VALUE
* None
*
* EXAMPLES
;The player did something that should make them dry off.
FrostUtil.ModPlayerWetness(-15.0)
;The player did something that should make them dry off, but not below "Wet".
FrostUtil.ModPlayerWetness(-15.0, 200.0)
;The player did something that should make them wetter.
FrostUtil.ModPlayerWetness(20.0)
;The player did something that should make them wetter, but not above "Wet".
FrostUtil.ModPlayerWetness(20.0, 200.0)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    Frostfall.Wetness.ModWetness(amount, limit)
endFunction

;/********f* FrostUtil/GetPlayerExposure
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Return the player's current exposure value.
*
* SYNTAX
*/;
float function GetPlayerExposure() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* * The player's current exposure.
* * 0.0 - 19.9 = Warm
* * 20.0 - 39.9 = Comfortable
* * 40.0 - 59.9 = Cold
* * 60.0 - 79.9 = Very Cold
* * 80.0 - 99.9 = Freezing
* * 100.0 - 120.0 = Freezing to Death
*
* EXAMPLES
;Is the player cold?
float exp = FrostUtil.GetPlayerExposure()
if exp >= 40.0
    debug.notification("Brrr!")
endif
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif
    return Frostfall._Frost_AttributeExposure.GetValue()
endFunction

;/********f* FrostUtil/GetPlayerExposureLevel
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Return the player's current exposure level. May be easier to use than GetPlayerExposure() if you don't
* need to know the actual exposure value.
*
* SYNTAX
*/;
int function GetPlayerExposureLevel() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* * The player's current exposure level.
* * -1 = Completely Warm
* * 0 = Warm
* * 1 = Comfortable
* * 2 = Cold
* * 3 = Very Cold
* * 4 = Freezing
* * 5 = Freezing to Death
* * 6 = Maximum Exposure
*
* EXAMPLES
;Is the player cold?
float exp_level = FrostUtil.GetPlayerExposureLevel()
if exp_level >= 2
    debug.notification("Brrr!")
endif
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return Frostfall._Frost_ExposureLevel.GetValueInt()
endFunction

;/********f* FrostUtil/GetPlayerExposureLimit
* API VERSION ADDED
* 3
*
* DESCRIPTION
* Return the player's current exposure limit value, the value that exposure will be attracted to over time.
*
* SYNTAX
*/;
float function GetPlayerExposureLimit() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* * The player's current exposure limit.
* * 0.0 - 19.9 = Warm
* * 20.0 - 39.9 = Comfortable
* * 40.0 - 59.9 = Cold
* * 60.0 - 79.9 = Very Cold
* * 80.0 - 99.9 = Freezing
* * 100.0 - 120.0 = Freezing to Death
*
* EXAMPLES
;Is the player going to eventually be cold?
float limit = FrostUtil.GetPlayerExposureLimit()
if limit >= 40.0
    debug.notification("Player will be chilly, eventually!")
endif
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1.0
    endif
    return Frostfall._Frost_ExposureTarget.GetValue()
endFunction

;/********f* FrostUtil/ModPlayerExposure
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Modify the player's current exposure by the given amount. Using this
* function will correctly process the exposure change and notify the UI layer
* (meters, etc) of the change and display them as appropriate. Using this function
* is the only safe method of directly modifying the player's exposure value.
*
* SYNTAX
*/;
function ModPlayerExposure(float amount, float limit = -1.0) global
;/*
* PARAMETERS
* * amount: The amount to modify the player's exposure by. Positive numbers increase exposure, negative values decrease exposure.
* * limit (optional): The value at which you should stop the exposure change, if this value is reached. A value of -1.0 indicates that there is no limit. (Example: calling FrostUtil.ModPlayerExposure(35.0, 50.0) when the player's current exposure is 40.0 will increase the player's exposure to 50.0, not 75.0)
*
* RETURN VALUE
* None
*
* EXAMPLES
;The player did something that should make them warmer.
FrostUtil.ModPlayerExposure(-15.0)
;The player did something that should make them warmer, but not below "Cold".
FrostUtil.ModPlayerExposure(-15.0, 40.0)
;The player did something that should make them colder.
FrostUtil.ModPlayerExposure(20.0)
;The player did something that should make them colder, but not above "Freezing".
FrostUtil.ModPlayerExposure(20.0, 80.0)
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return
    endif

    Frostfall.Exposure.ModExposure(amount, limit)
endFunction

;/********f* FrostUtil/GetPlayerWarmth
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns the player's total Warmth value.
*
* SYNTAX
*/;
int function GetPlayerWarmth() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The player's Warmth value.
*
* EXAMPLES
;How bundled up is the player?
int warmth = FrostUtil.GetPlayerWarmth()
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return Frostfall._Frost_AttributeWarmth.GetValueInt()
endFunction

;/********f* FrostUtil/GetPlayerCoverage
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns the player's total Coverage value.
*
* SYNTAX
*/;
int function GetPlayerCoverage() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The player's Coverage value.
*
* EXAMPLES
;How covered is the player?
int coverage = FrostUtil.GetPlayerCoverage()
;*********/;
    FrostfallAPI Frostfall = GetAPI()
    if Frostfall == none
        RaiseFrostAPIError()
        return -1
    endif

    return Frostfall._Frost_AttributeCoverage.GetValueInt()
endFunction

;/********f* FrostUtil/GetPlayerArmorWarmth
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns the sum of the Warmth values of all gear worn by the player.
*
* SYNTAX
*/;
int function GetPlayerArmorWarmth() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The total Warmth of all player worn gear.
*
* EXAMPLES
;How warm are the player's clothes?
int gear_warmth = FrostUtil.GetPlayerArmorWarmth()
* NOTES
* There are many different sources of Warmth, so this function does not return
* the player's total Warmth value. If you want the total Warmth, use GetPlayerWarmth() instead.
;*********/;
    _Frost_ClothingSystem clothing_system = GetClothingSystem()
    return clothing_system.GetArmorWarmth(clothing_system.WornGearValues)
endFunction

;/********f* FrostUtil/GetPlayerArmorCoverage
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Returns the sum of the Coverage values of all gear worn by the player.
*
* SYNTAX
*/;
int function GetPlayerArmorCoverage() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The total Coverage of all player worn gear.
*
* EXAMPLES
;How warm are the player's clothes?
int gear_coverage = FrostUtil.GetPlayerArmorCoverage()
* NOTES
* There are many different sources of Coverage, so this function does not return
* the player's total Coverage value. If you want the total Coverage, use GetPlayerCoverage() instead.
;*********/;
    _Frost_ClothingSystem clothing_system = GetClothingSystem()
    return clothing_system.GetArmorCoverage(clothing_system.WornGearValues)
endFunction

;/********f* FrostUtil/ArmorProtectionDataExists
* API VERSION ADDED
* 3
*
* DESCRIPTION
* Whether or not the player's current profile (or the default values profile) contains data about this armor.
*
* SYNTAX
*/;
bool function ArmorProtectionDataExists(Armor akArmor) global
;/*
* PARAMETERS
* akArmor:
*
* RETURN VALUE
* True if data exists; False otherwise.
*
* EXAMPLES
;Does the player have warmth and coverage data for my cool armor?
bool data_exists = FrostUtil.ArmorProtectionDataExists(MyCoolArmor)
* NOTES
* This function only looks at profile data, and not other factors that could determine
* the protection data of this gear (like keywords).
;*********/;
    _Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
    string dskey = handler.GetDatastoreKeyFromForm(akArmor)
    return handler.DatastoreHasKey(dskey)
endFunction

;/********f* FrostUtil/ArmorProtectionDataExistsByKey
* API VERSION ADDED
* 3
*
* DESCRIPTION
* Whether or not the player's current profile (or the default values profile) contains data about this armor, by datastore key.
*
* SYNTAX
*/;
bool function ArmorProtectionDataExistsByKey(string asKey) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if data exists; False otherwise.
*
* EXAMPLES
;Does the player have warmth and coverage data for my cool armor?
bool data_exists = FrostUtil.ArmorProtectionDataExistsByKey("20258___MyCoolMod.esp")
* NOTES
* This function only looks at profile data, and not other factors that could determine
* the protection data of this gear (like keywords).
;*********/;
    _Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
    return handler.DatastoreHasKey(asKey)
endFunction

; Events ==========================================================================================

;/********e* FrostUtil/Frostfall_OnPlayerStartSwimming
* API VERSION ADDED
* 1
*
* DESCRIPTION
* An SKSE Mod Event that is raised when the player begins swimming.
*
* SYNTAX
Event Frostfall_OnPlayerStartSwimming()
*
* PARAMETERS
* None
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Frostfall_OnPlayerStartSwimming", "Frostfall_OnPlayerStartSwimming")
endEvent

Event Frostfall_OnPlayerStartSwimming()
    debug.notification("The player started swimming!")
endEvent
;*********/;
function SendEvent_OnPlayerStartSwimming() global
    _FrostInternal.FrostDebug(0, "Sending event Frostfall_OnPlayerStartSwimming")
    FallbackEventEmitter emitter = GetEventEmitter_OnPlayerStartSwimming()
    int handle = emitter.Create("Frostfall_OnPlayerStartSwimming")
    if handle
        emitter.Send(handle)
    endif
endFunction

;/********e* FrostUtil/Frostfall_OnPlayerStopSwimming
* API VERSION ADDED
* 1
*
* DESCRIPTION
* An SKSE Mod Event that is raised when the player stops swimming.
*
* SYNTAX
Event Frostfall_OnPlayerStopSwimming()
*
* PARAMETERS
* None
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Frostfall_OnPlayerStopSwimming", "Frostfall_OnPlayerStopSwimming")
endEvent

Event Frostfall_OnPlayerStopSwimming()
    debug.notification("The player stopped swimming!")
endEvent
;*********/;
function SendEvent_OnPlayerStopSwimming() global
    _FrostInternal.FrostDebug(0, "Sending event Frostfall_OnPlayerStopSwimming")
    FallbackEventEmitter emitter = GetEventEmitter_OnPlayerStopSwimming()
    int handle = emitter.Create("Frostfall_OnPlayerStopSwimming")
    if handle
        emitter.Send(handle)
    endif
endFunction

function RaiseFrostAPIError() global
    debug.trace("[Frostfall][ERROR] Fatal Frostfall API error occurred.")
endFunction


; Mod Event Documentation =========================================================================

;/********e* FrostUtil/Frostfall_Loaded
* API VERSION ADDED
* 1
*
* DESCRIPTION
* An SKSE Mod Event that is raised when Frostfall is finished starting up, or after loading a save game with Frostfall enabled.
*
* SYNTAX
Event Frostfall_Loaded()
*
* PARAMETERS
* None
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Frostfall_Loaded", "Frostfall_Loaded")
endEvent

Event Frostfall_Loaded()
    debug.notification("Frostfall has finished starting up!")
endEvent
* NOTES
* This event will only be raised if Frostfall is enabled. Therefore, don't rely
* on this event at game start-up for a critical function as you will not receive it
* until the player starts up Frostfall or loads a game with Frostfall already enabled.
;*********/;

;/********e* FrostUtil/Frost_OnRescuePlayer
* API VERSION ADDED
* 1
*
* DESCRIPTION
* An SKSE Mod Event that is raised when the player is rescued when using the Max Exposure Rescue mechanic.
*
* SYNTAX
Event Frost_OnRescuePlayer(bool in_water)
*
* PARAMETERS
* * in_water: Whether or not the player was swimming when they were rescued (mainly used by the rescue system to select a suitable destination).
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Frost_OnRescuePlayer", "Frost_OnRescuePlayer")
endEvent

Event Frost_OnRescuePlayer(bool in_water)
    debug.notification("The player was just rescued!")
endEvent
;*********/;

;/********e* FrostUtil/Frost_OnTamrielRegionChange
* API VERSION ADDED
* 1
*
* DESCRIPTION
* An SKSE Mod Event that is raised when the player moves from one tracked region to another.
*
* SYNTAX
Event OnTamrielRegionChange(int region, bool in_region)
*
* PARAMETERS
* * region: The ID of the region. See Notes for region IDs.
* * in_region: If True, the player is entering this region. If False, the player is leaving it.
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Frost_OnTamrielRegionChange", "Frost_OnTamrielRegionChange")
endEvent

Event Frost_OnTamrielRegionChange(int region, bool in_region)
    if in_region && region == 11
        debug.notification("The player just entered Solstheim!")
    endif
endEvent
* NOTES
* The following are possible region IDs:
* * REGION_UNKNOWN = -1
* * REGION_PINEFOREST = 1
* * REGION_VOLCANICTUNDRA = 2
* * REGION_FALLFOREST = 3
* * REGION_REACH = 4
* * REGION_TUNDRA = 5
* * REGION_TUNDRAMARSH = 6
* * REGION_COAST = 7
* * REGION_SNOW = 8
* * REGION_OBLIVION = 9
* * REGION_FALMERVALLEY = 10
* * REGION_SOLSTHEIM = 11
* * REGION_WYRMSTOOTH = 20
* * REGION_DARKEND = 21
;*********/;

;/********e* FrostUtil/Frost_OnInnerFireMeditate
* API VERSION ADDED
* 1
*
* DESCRIPTION
* An SKSE Mod Event that is raised when the player begins or ends using the Inner Fire ability.
*
* SYNTAX
Event Frost_OnInnerFireMeditate(bool abMeditating)
*
* PARAMETERS
* * abMeditating: If True, the player entered the Inner Fire state. If False, they have just left it.
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Frost_OnInnerFireMeditate", "Frost_OnInnerFireMeditate")
endEvent

Event Frost_OnInnerFireMeditate(bool abMeditating)
    if abMeditating
        debug.notification("The player began meditating using Inner Fire!")
    endif
endEvent
;*********/;

; Deprecated / Unused Functions ===================================================================

bool function IsWarmEnoughToHarvestWood() global
    ; This feature was deprecated, always return true
    return true
endFunction

function Event_LegacyWoodHarvest() global
    ;pass
endFunction
