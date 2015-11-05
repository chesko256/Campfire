scriptname _Frost_ClimateSystem extends _Frost_BaseSystem

import CampUtil
import FrostUtil
import _FrostInternal
import Utility

Actor property PlayerRef auto

_Frost_Compatibility property Compatibility auto

GlobalVariable property GameHour auto
GlobalVariable property _Frost_CurrentTemperature auto
GlobalVariable property _Frost_Setting_WeatherMessages auto
GlobalVariable property _Frost_RegionDetect_ForceUpdate auto

FormList property _Frost_WorldspacesExteriorPineForest auto
FormList property _Frost_WorldspacesExteriorVolcanicTundra auto
FormList property _Frost_WorldspacesExteriorFallForest auto
FormList property _Frost_WorldspacesExteriorWhiterun auto
FormList property _Frost_WorldspacesExteriorTundraMarsh auto
FormList property _Frost_WorldspacesExteriorCoast auto
FormList property _Frost_WorldspacesExteriorSnowy auto
FormList property _Frost_WorldspacesExteriorOblivion auto
FormList property _Frost_OvercastWeatherList auto

Message property _Frost_WeatherTransMsg_ClearToFog1 auto
Message property _Frost_WeatherTransMsg_ClearToFog2 auto
Message property _Frost_WeatherTransMsg_ClearToFog3 auto
Message property _Frost_WeatherTransMsg_ClearToFog4 auto
Message property _Frost_WeatherTransMsg_ClearToFog5 auto
Message property _Frost_WeatherTransMsg_ClearToFog6 auto
Message property _Frost_WeatherTransMsg_ClearToFog7 auto
Message property _Frost_WeatherTransMsg_RainToClear auto
Message property _Frost_WeatherTransMsg_StormToClear auto
Message property _Frost_WeatherTransMsg_SnowToClear auto
Message property _Frost_WeatherTransMsg_BlizzardToClear auto
Message property _Frost_WeatherTransMsg_RainToFog auto
Message property _Frost_WeatherTransMsg_ClearToRain auto
Message property _Frost_WeatherTransMsg_ClearToStorm auto
Message property _Frost_WeatherTransMsg_FogToRain auto
Message property _Frost_WeatherTransMsg_FogToStorm auto
Message property _Frost_WeatherTransMsg_SnowToRain auto
Message property _Frost_WeatherTransMsg_ClearToSnow auto
Message property _Frost_WeatherTransMsg_ClearToSnowMountain auto
Message property _Frost_WeatherTransMsg_ClearToSnowSevere auto
Message property _Frost_WeatherTransMsg_RainToSnow auto
Message property _Frost_WeatherTransMsg_RainToSnowSevere auto

Worldspace property Tamriel auto

int property WEATHERCLASS_UNKNOWN 			= -1 	autoReadOnly
int property WEATHERCLASS_PLEASANT 			= 0 	autoReadOnly
int property WEATHERCLASS_CLOUDY_OR_FOGGY 	= 1 	autoReadOnly
int property WEATHERCLASS_RAIN 				= 2 	autoReadOnly
int property WEATHERCLASS_SNOW 				= 3 	autoReadOnly

int property REGION_UNKNOWN 				= -1 	autoReadOnly
int property REGION_PINEFOREST 				= 1 	autoReadOnly
int property REGION_VOLCANICTUNDRA 			= 2 	autoReadOnly
int property REGION_FALLFOREST 				= 3 	autoReadOnly
int property REGION_REACH 					= 4 	autoReadOnly
int property REGION_TUNDRA 					= 5 	autoReadOnly
int property REGION_TUNDRAMARSH 			= 6 	autoReadOnly
int property REGION_COAST 					= 7 	autoReadOnly
int property REGION_SNOW 					= 8 	autoReadOnly
int property REGION_OBLIVION 				= 9 	autoReadOnly
int property REGION_FALMERVALLEY 			= 10	autoReadOnly
int property REGION_SOLSTHEIM 				= 11	autoReadOnly
int property REGION_WYRMSTOOTH 				= 20	autoReadOnly
int property REGION_DARKEND 				= 21	autoReadOnly

bool in_region_pineforest = false
bool in_region_volcanictundra = false
bool in_region_fallforest = false
bool in_region_reach = false
bool in_region_tundra = false
bool in_region_tundramarsh = false
bool in_region_coast = false
bool in_region_snow = false

float pos_x
float pos_y
float pos_z
Worldspace ws
int current_max_temperature
int last_region
int last_current_temperature
Weather last_incoming_weather
Weather last_current_weather

; Public functions
bool function IsRaining()

endFunction

bool function IsSnowing()

endFunction

function Update()
	UpdateClimateState()
endFunction

function RegisterForEvents()
	RegisterForModEvent("Frost_OnTamrielRegionChange", "OnTamrielRegionChange")

	; Force the region detect system to fire something on start-up.
	_Frost_RegionDetect_ForceUpdate.SetValueInt(0)
endFunction

function UpdateClimateState()
	Weather current_weather
	Weather incoming_weather
	int current_temperature

	pos_x = PlayerRef.GetPositionX()
	pos_y = PlayerRef.GetPositionY()
	pos_z = PlayerRef.GetPositionZ()
	ws = PlayerRef.GetWorldSpace()
	int region = GetPlayerRegion()

	bool transitioning = IsWeatherTransitioning()
	if transitioning
		incoming_weather = Weather.GetCurrentWeather()
		current_weather = Weather.GetOutgoingWeather()
	else
		incoming_weather = none
		current_weather = Weather.GetCurrentWeather()
	endif

	ShowWeatherTransitionMessage(current_weather, incoming_weather, region)

	current_max_temperature = GetMaxTemperatureByLocation()
	
	; To calculate temperature, always use the incoming weather if present.
	if transitioning
		current_temperature = GetCurrentTemperature(incoming_weather, region)
	else
		current_temperature = GetCurrentTemperature(current_weather, region)
	endif
	
	FrostDebug(0, "%%%% Climate ::: Current Temp: " + current_temperature + ", Region: " + region)
	_Frost_CurrentTemperature.SetValueInt(current_temperature)
	SendEvent_UpdateWeathersenseMeter(current_temperature)

	; Historical values
	last_current_weather = current_weather
	last_incoming_weather = incoming_weather
	last_current_temperature = current_temperature
	last_region = region
endFunction

bool function IsWeatherTransitioning()
	return !(Weather.GetCurrentWeatherTransition() >= 1.0)
endFunction

Event OnTamrielRegionChange(int region, bool in_region)
	if region == 1
		in_region_pineforest = in_region
	elseif region == 2
		in_region_volcanictundra = in_region
	elseif region == 3
		in_region_fallforest = in_region
	elseif region == 4
		in_region_reach = in_region
	elseif region == 5
		in_region_tundra = in_region
	elseif region == 6
		in_region_tundramarsh = in_region
	elseif region == 7
		in_region_coast = in_region
	elseif region == 8
		in_region_snow = in_region
	endif
endEvent

int function GetCurrentTemperature(Weather this_weather, int region)
	; Don't increase exposure when indoors.
	if CampUtil.IsRefInInterior(PlayerRef)
		return 10
	endif

	; Don't increase exposure in Oblivion.
	if region == REGION_OBLIVION
		return 10
	endif

	; Don't recalculate if the weather or region hasn't changed.
	if this_weather == last_current_weather && region == last_region
		return last_current_temperature
	endif

	int current_temperature = 10
	int base_temperature = GetRegionBaselineTemperature(region)
	int current_weather_class = GetWeatherClassificationActual(this_weather)
	
	if current_weather_class == WEATHERCLASS_UNKNOWN
		current_temperature = (base_temperature - 2) - RandomInt(-1, 1)

	elseif current_weather_class == WEATHERCLASS_PLEASANT
		current_temperature = base_temperature - RandomInt(-1, 2)

	elseif current_weather_class == WEATHERCLASS_CLOUDY_OR_FOGGY
		current_temperature = (base_temperature - 3) - RandomInt(-1, 1)

	elseif current_weather_class == WEATHERCLASS_RAIN
		if IsWeatherSevere(this_weather)
			current_temperature = (base_temperature - 7) - RandomInt(-1, 3)
		else
			current_temperature = (base_temperature - 5) - RandomInt(-1, 1)
		endif

	elseif current_weather_class == WEATHERCLASS_SNOW
		if IsWeatherSevere(this_weather)
			current_temperature = (base_temperature - 15) - RandomInt(-2, 2)
			if current_temperature > -10
				current_temperature = -10
			endif
		else
			current_temperature = (base_temperature - 5) - RandomInt(-2, 2)
			if current_temperature > -5
				current_temperature = -5
			endif
		endif
	endif

	if GameHour.GetValue() > 19 || GameHour.GetValue() < 7
		current_temperature -= 5
	endif

	if current_temperature > current_max_temperature
		current_temperature = current_max_temperature
	endif

	return current_temperature
endFunction

int function GetMaxTemperatureByLocation()
	int max_temp = 100
	if ws != Tamriel
		return max_temp
	endif	
	
	; High Hrothgar
	if (pos_x <= 74340 && pos_x >= 32000) && (pos_y <= -21000 && pos_y >= -66600)
								;						~~~~    _  ~~~~
		if pos_z >= 34000		;Elevation 4                ~~/~~\~~~~~~
			max_temp = -20      ;                        ~~~ /  ~~\~~~
		elseif pos_z >= 27500	;Elevation 3               /   ??  \
			max_temp = -15      ;                        / . ~~   ?? \
		elseif pos_z >= 21300	;Elevation 2           .  .  ~~~~   ??\        			<----High Hrothgar
			max_temp = -10		;					  /  .  .  ~~ ??   \
		elseif pos_z >= 15750	;Elevation 1		 / .   .    ??      \
			max_temp = -5		;					/########  ??########\
		endif					;							o    ))))FUS RO DAH))))
								;						 [ ]|/={===>           			<----Dovahkiin
								;						   / \
								;
		FrostDebug(0, "%%%% Climate ::: Override Area: High Hrothgar | Max Temp: " + max_temp)
	; The Rift
	elseif (pos_x <= 210000 &&  pos_x >= 53800) && (pos_y <= -66600 && pos_y >= -150000)
		if pos_z >= 16600
			max_temp = -10
		endif
		FrostDebug(0, "%%%% Climate ::: Override Area: Rift | Max Temp: " + max_temp)
	; Falkreath Hold
	elseif (pos_x <= 53800 &&  pos_x >= -42500) && (pos_y <= -66600 && pos_y >= -150000)
		if pos_z >= 7300
			max_temp = -10
		endif
		FrostDebug(0, "%%%% Climate ::: Override Area: Falkreath Hold | Max Temp: " + max_temp)
	; Bleak Falls Barrow
	elseif (pos_x <= 19400 &&  pos_x >= -42500) && (pos_y <= -15000 && pos_y >= -60900)
		if pos_z >= 1500
			max_temp = -10
		endif
		FrostDebug(0, "%%%% Climate ::: Override Area: Bleak Falls Barrow | Max Temp: " + max_temp)
	; Brittleshin Pass
	elseif (pos_x <= 15300 &&  pos_x >= -42500) && (pos_y <= -60900 && pos_y >= -80000)
		if pos_z >= 2000
			max_temp = -10
		endif
		FrostDebug(0, "%%%% Climate ::: Override Area: Brittleshin Pass | Max Temp: " + max_temp)
	; Haafingar (Dawnguard: catches Castle Volkihar)
	elseif (pos_x <= -71000 &&  pos_x >= -185000) && (pos_y <= 163000 && pos_y >= 78000)
		if pos_z >= -7000
			max_temp = -10
		else
			max_temp = -5
		endif
		FrostDebug(0, "%%%% Climate ::: Override Area: Haafingar | Max Temp: " + max_temp)
	endif
	
	return max_temp
endFunction

int function GetRegionBaselineTemperature(int region)
	if region == REGION_UNKNOWN
		return 9
	elseif region == REGION_PINEFOREST
		return 20
	elseif region == REGION_VOLCANICTUNDRA
		return 18
	elseif region == REGION_FALLFOREST
		return 12
	elseif region == REGION_REACH || region == REGION_TUNDRA
		return 10
	elseif region == REGION_TUNDRAMARSH
		return 1
	elseif region == REGION_COAST
		return -5
	elseif region == REGION_SNOW
		return -10
	elseif region == REGION_OBLIVION
		return 16
	
	;			####Official DLC Compatibility####
	elseif region == REGION_FALMERVALLEY
		return Compatibility.GetPlayerRegionTemp_FalmerValley(pos_x, pos_y)
	elseif region == REGION_SOLSTHEIM
		return Compatibility.GetPlayerRegionTemp_Solstheim(pos_x, pos_y)
	
	;			####Landmass Mod Compatibility####
	elseif region == REGION_WYRMSTOOTH
		return Compatibility.GetPlayerRegionTemp_Wyrmstooth(pos_x, pos_y)
	elseif region == REGION_DARKEND
		return Compatibility.GetPlayerRegionTemp_Darkend(pos_x, pos_y)
	endif
endFunction

int function GetPlayerRegion()
	if in_region_pineforest || _Frost_WorldspacesExteriorPineForest.HasForm(ws)
		return REGION_PINEFOREST
	elseif in_region_volcanictundra || _Frost_WorldspacesExteriorVolcanicTundra.HasForm(ws)
		return REGION_VOLCANICTUNDRA
	elseif in_region_fallforest || _Frost_WorldspacesExteriorFallForest.HasForm(ws)
		return REGION_FALLFOREST
	elseif in_region_reach
		return REGION_REACH
	elseif in_region_tundra || _Frost_WorldspacesExteriorWhiterun.HasForm(ws)
		return REGION_TUNDRA
	elseif in_region_tundramarsh || _Frost_WorldspacesExteriorTundraMarsh.HasForm(ws)
		return REGION_TUNDRAMARSH
	elseif in_region_coast || _Frost_WorldspacesExteriorCoast.HasForm(ws)
		return REGION_COAST
	elseif in_region_snow || _Frost_WorldspacesExteriorSnowy.HasForm(ws)
		return REGION_SNOW
	elseif _Frost_WorldspacesExteriorOblivion.HasForm(ws)
		return REGION_OBLIVION
	elseif Compatibility.isDLC1Loaded && ws == Compatibility.WS_FalmerValley
		return REGION_FALMERVALLEY
	elseif Compatibility.isDLC2Loaded && ws == Compatibility.WS_Solstheim
		return REGION_SOLSTHEIM
	elseif Compatibility.isWTHLoaded && ws == Compatibility.WS_Wyrmstooth
		return REGION_WYRMSTOOTH
	elseif Compatibility.isDRKLoaded && ws == Compatibility.WS_Darkend
		return REGION_DARKEND
	else
		return -1
	endif
endFunction

int function GetWeatherClassificationActual(Weather akWeather)	
	if !akWeather
		return -1
	endif
	
	if _Frost_OvercastWeatherList.HasForm(akWeather)
		return 0
	endif
	
	int weather_class = akWeather.GetClassification()
	if weather_class == 3
		if Compatibility.isDLC2Loaded && akWeather == Compatibility.DLC2AshStorm
			return 1
		else
			return 3
		endif
	else
		return weather_class
	endif
endFunction

function ShowWeatherTransitionMessage(Weather current_weather, Weather incoming_weather, int region)
	if IsRefInInterior(PlayerRef) || _Frost_Setting_WeatherMessages.GetValueInt() != 2
		return
	endif

	if incoming_weather == last_incoming_weather || incoming_weather == none
		return
	endif

	int current_weatherclass = GetWeatherClassificationActual(current_weather)
	int incoming_weatherclass = GetWeatherClassificationActual(incoming_weather)
	bool current_weather_severe = IsWeatherSevere(current_weather)
	bool incoming_weather_severe = IsWeatherSevere(incoming_weather)

	if incoming_weatherclass == WEATHERCLASS_UNKNOWN || incoming_weatherclass == WEATHERCLASS_PLEASANT
		if current_weatherclass == WEATHERCLASS_RAIN
			if current_weather_severe
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: CLEAR     OUTGOING: STORM")
				_Frost_WeatherTransMsg_StormToClear.Show()
			else
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: CLEAR     OUTGOING: RAIN")
				_Frost_WeatherTransMsg_RainToClear.Show()
			endif
		elseif current_weatherclass == WEATHERCLASS_SNOW
			if current_weather_severe
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: CLEAR     OUTGOING: BLIZZARD")
				_Frost_WeatherTransMsg_BlizzardToClear.Show()
			else
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: CLEAR     OUTGOING: SNOW")
				_Frost_WeatherTransMsg_SnowToClear.Show()
			endif
		endif

	elseif incoming_weatherclass == WEATHERCLASS_CLOUDY_OR_FOGGY
		if current_weatherclass == WEATHERCLASS_UNKNOWN || current_weatherclass == WEATHERCLASS_PLEASANT
			if region == REGION_UNKNOWN
				_Frost_WeatherTransMsg_ClearToFog1.Show()
			elseif region == REGION_PINEFOREST
				_Frost_WeatherTransMsg_ClearToFog2.Show()
			elseif region == REGION_VOLCANICTUNDRA
				_Frost_WeatherTransMsg_ClearToFog3.Show()
			elseif region == REGION_FALLFOREST
				_Frost_WeatherTransMsg_ClearToFog4.Show()
			elseif region == REGION_REACH
				_Frost_WeatherTransMsg_ClearToFog5.Show()
			elseif region == REGION_TUNDRAMARSH
				_Frost_WeatherTransMsg_ClearToFog6.Show()
			elseif region == REGION_COAST
				_Frost_WeatherTransMsg_ClearToFog7.Show()
			endif
			FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: FOG     OUTGOING: CLEAR")
		elseif current_weatherclass == WEATHERCLASS_RAIN
			_Frost_WeatherTransMsg_RainToFog.Show()
			FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: FOG     OUTGOING: RAIN")
		endif

	elseif incoming_weatherclass == WEATHERCLASS_RAIN
		if current_weatherclass == WEATHERCLASS_UNKNOWN || current_weatherclass == WEATHERCLASS_PLEASANT
			if incoming_weather_severe
				_Frost_WeatherTransMsg_ClearToStorm.Show()
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: STORM     OUTGOING: CLEAR")
			else
				_Frost_WeatherTransMsg_ClearToRain.Show()
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: RAIN     OUTGOING: CLEAR")
			endif
		elseif current_weatherclass == WEATHERCLASS_CLOUDY_OR_FOGGY
			if incoming_weather_severe
				_Frost_WeatherTransMsg_FogToStorm.Show()
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: STORM     OUTGOING: FOG")
			else
				_Frost_WeatherTransMsg_FogToRain.Show()
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: RAIN     OUTGOING: FOG")
			endif
		elseif current_weatherclass == WEATHERCLASS_SNOW
			_Frost_WeatherTransMsg_SnowToRain.Show()
			FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: RAIN     OUTGOING: SNOW")
		endif
	elseif incoming_weatherclass == WEATHERCLASS_SNOW
		if current_weatherclass == WEATHERCLASS_UNKNOWN || current_weatherclass == WEATHERCLASS_PLEASANT
			if incoming_weather_severe
				if current_max_temperature != 100
					_Frost_WeatherTransMsg_ClearToSnowMountain.Show()
					FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: MOUNTAIN BLIZZARD    OUTGOING: CLEAR")
				else
					_Frost_WeatherTransMsg_ClearToSnowSevere.Show()
					FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: BLIZZARD     OUTGOING: CLEAR")
				endif
			else
				_Frost_WeatherTransMsg_ClearToSnow.Show()
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: SNOW     OUTGOING: CLEAR")
			endif
		elseif current_weatherclass == WEATHERCLASS_SNOW
			if incoming_weather_severe
				_Frost_WeatherTransMsg_RainToSnowSevere.Show()
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: BLIZZARD     OUTGOING: RAIN")
			else
				_Frost_WeatherTransMsg_RainToSnow.Show()
				FrostDebug(1, "%%%% Climate ::: Weather Transition INCOMING: SNOW     OUTGOING: RAIN")
			endif
		endif
	endif
endFunction

function SendEvent_UpdateWeathersenseMeter(int temp)
	int temp_level
	if temp >= 18
		temp_level = 10
	elseif temp < 18 && temp >= 15
		temp_level = 9
	elseif temp < 15 && temp > 10
		temp_level = 8
	elseif temp == 10
		temp_level = 7
	elseif temp < 10 && temp >= 6
		temp_level = 6
	elseif temp < 6 && temp >= 1
		temp_level = 5
	elseif temp < 1 && temp >= -4
		temp_level = 4
	elseif temp < -4 && temp >= -9
		temp_level = 3
	elseif temp < -9 && temp >= -14
		temp_level = 2
	elseif temp < -14
		temp_level = 1
	endif
	int handle = ModEvent.Create("Frost_UpdateWeathersenseMeter")
	if handle
		ModEvent.PushInt(handle, temp_level)
		ModEvent.Send(handle)
	endif
endFunction