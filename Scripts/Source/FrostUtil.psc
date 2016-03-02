;/********s* Form/CampUtil
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


;@TODO: Not used
bool function IsPlayerVampire() global
    return false
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
    return clothing_system.GetArmorWarmth()
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
    return clothing_system.GetArmorCoverage()
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
    int handle = ModEvent.Create("Frostfall_OnPlayerStartSwimming")
    if handle
        ModEvent.Send(handle)
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
    int handle = ModEvent.Create("Frostfall_OnPlayerStopSwimming")
    if handle
        ModEvent.Send(handle)
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

bool function IsWarmEnoughToRemoveGearInTent() global
    ; This feature is currently unimplemented in Campfire
    return true
endFunction

bool function IsWarmEnoughToHarvestWood() global
    ; This feature was deprecated, always return true
    return true
endFunction

function Event_LegacyWoodHarvest() global
    ;pass
endFunction