scriptname _Frost_ClimateSystem extends _Frost_BaseSystem

import _FrostInternal

Actor property PlayerRef auto

GlobalVariable property _Frost_CurrentTemperature auto hidden
FormList property _Frost_WorldspacesExteriorPineForest auto
FormList property _Frost_WorldspacesExteriorVolcanicTundra auto
FormList property _Frost_WorldspacesExteriorFallForest auto
FormList property _Frost_WorldspacesExteriorWhiterun auto
FormList property _Frost_WorldspacesExteriorTundraMarsh auto
FormList property _Frost_WorldspacesExteriorCoast auto
FormList property _Frost_WorldspacesExteriorSnowy auto
FormList property _Frost_WorldspacesExteriorOblivion auto

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
int property REGION_OBLIVION 				= 9 	autoReadOnly 		;@TODO: ???

bool in_region_1 = false
bool in_region_2 = false
bool in_region_3 = false
bool in_region_4 = false
bool in_region_5 = false
bool in_region_6 = false
bool in_region_7 = false
bool in_region_8 = false

float pos_x
float pos_y
float pos_z
Worldspace ws



; Public functions
bool function IsRaining()

endFunction

bool function IsSnowing()

endFunction

function UpdateClimateState()
	
	pos_x = PlayerRef.GetPositionX()
	pos_y = PlayerRef.GetPositionY()
	pos_z = PlayerRef.GetPositionZ()
	ws = PlayerRef.GetWorldSpace()

	int region = GetPlayerRegion()
	int current_temperature = GetCurrentTemperature()



	if temp == -1
		int base_temp = GetBaseTemperature()
		temp = GetWeatherTemperature(base_temp)
	endif
endFunction

Event OnTamrielRegionChange(int region, bool in_region)
	if region == 1
		in_region_1 = in_region
	elseif region == 2
		in_region_2 = in_region
	elseif region == 3
		in_region_3 = in_region
	elseif region == 4
		in_region_4 = in_region
	elseif region == 5
		in_region_5 = in_region
	elseif region == 6
		in_region_6 = in_region
	elseif region == 7
		in_region_7 = in_region
	elseif region == 8
		in_region_8 = in_region
	endif
endEvent

int function GetCurrentTemperature()
	if CampUtil.IsRefInInterior(PlayerRef)
		return 10
	endif

	weather current_weather
	int current_temperature = 10
	int base_temperature = GetRegionBaselineTemperature(GetPlayerRegion())
	int current_weather_class
	
	if current_weather_class == WEATHERCLASS_UNKNOWN
		current_temperature = (base_temperature - 2) - RandomInt(-1, 1)

	elseif current_weather_class == WEATHERCLASS_PLEASANT
		current_temperature = base_temperature - RandomInt(-1, 2)

	elseif current_weather_class == WEATHERCLASS_CLOUDY_OR_FOGGY
		current_temperature = (base_temperature - 3) - RandomInt(-1, 1)

	elseif current_weather_class == WEATHERCLASS_RAIN
		if IsWeatherSevere(current_weather)
			current_temperature = (base_temperature - 7) - RandomInt(-1, 3)
		else
			current_temperature = (base_temperature - 5) - RandomInt(-1, 1)
		endif

	elseif current_weather_class == WEATHERCLASS_SNOW
		if IsWeatherSevere(current_weather)
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

	max_temperature = GetMaxTemperatureByLocation()
	if current_temperature > max_temperature
		current_temperature = max_temperature
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
	elseif region == 10					;DLC1 Worldspace
		return Compatibility.GetPlayerRegionTempDLC1(flvLastPosX, flvLastPosY)
	elseif region == 11
		return Compatibility.GetPlayerRegionTempDLC2(flvLastPosX, flvLastPosY)
	elseif region == 12
		return Compatibility.GetPlayerRegionTempDLC3(flvLastPosX, flvLastPosY)
	elseif region == 13
		return Compatibility.GetPlayerRegionTempDLC4(flvLastPosX, flvLastPosY)
	
	;			####Landmass Mod Compatibility####
	elseif region == 20
		return Compatibility.GetPlayerRegionTempMod1(flvLastPosX, flvLastPosY)
	elseif region == 21
		return Compatibility.GetPlayerRegionTempMod2(flvLastPosX, flvLastPosY)
	elseif region == 22
		return Compatibility.GetPlayerRegionTempMod3(flvLastPosX, flvLastPosY)
	elseif region == 23
		return Compatibility.GetPlayerRegionTempMod4(flvLastPosX, flvLastPosY)
	elseif region == 24
		return Compatibility.GetPlayerRegionTempMod5(flvLastPosX, flvLastPosY)
	elseif region == 25
		return Compatibility.GetPlayerRegionTempMod6(flvLastPosX, flvLastPosY)
	endif
endFunction

int function GetPlayerRegion()
	if in_region_1
		return 1
	elseif in_region_2
		return 2
	elseif in_region_3
		return 3
	elseif in_region_4
		return 4
	elseif in_region_5
		return 5
	elseif in_region_6
		return 6
	elseif in_region_7
		return 7
	elseif in_region_8
		return 8
	elseif _Frost_WorldspacesExteriorPineForest.HasForm(ws)
		return 1
	elseif _Frost_WorldspacesExteriorVolcanicTundra.HasForm(ws)
		return 2
	elseif _Frost_WorldspacesExteriorFallForest.HasForm(ws)
		return 3
	elseif _Frost_WorldspacesExteriorWhiterun.HasForm(ws)
		return 4
	elseif _Frost_WorldspacesExteriorTundraMarsh.HasForm(ws)
		return 6
	elseif _Frost_WorldspacesExteriorCoast.HasForm(ws)
		return 7
	elseif _Frost_WorldspacesExteriorSnowy.HasForm(ws)
		return 8
	elseif _Frost_WorldspacesExteriorOblivion.HasForm(ws)
		return 9
	elseif Compatibility.isDLC1Loaded && ws == Compatibility.DLC1WS
		return 10
	elseif Compatibility.isDLC2Loaded && ws == Compatibility.DLC2WS
		return 11
	elseif Compatibility.isDLC3Loaded && ws == Compatibility.DLC3WS
		return 12
	elseif Compatibility.isDLC4Loaded && ws == Compatibility.DLC4WS
		return 13
	elseif Compatibility.isMod1Loaded && ws == Compatibility.Mod1WS
		return 20
	elseif Compatibility.isMod2Loaded && ws == Compatibility.Mod2WS
		return 21
	elseif Compatibility.isMod3Loaded && ws == Compatibility.Mod3WS
		return 22
	elseif Compatibility.isMod4Loaded && ws == Compatibility.Mod4WS
		return 23
	elseif Compatibility.isMod5Loaded && ws == Compatibility.Mod5WS
		return 24
	elseif Compatibility.isMod6Loaded && ws == Compatibility.Mod6WS
		return 25
	else
		return -1
	endif
endFunction

int function GetWeatherClassificationActual(Weather myWeather)	
	if !myWeather
		return -1
	endif
	
	if _DE_OvercastWeatherList.HasForm(myWeather)
		return 0
	endif
	
	int iClass = myWeather.GetClassification()
	
	if iClass == 3
		if Compatibility.isDLC2Loaded
			if myWeather == Compatibility.DLC2AshStorm
				return 1
			else
				return 3
			endif
		else
			return 3
		endif
	else
		return iClass
	endif
endFunction

;================================================================ Old code
int Function GetWeatherTemp()
	Weather myIncomingWeather
	int myCurrWeatherClass
	int myIncomingWeatherClass
	bool bSevereWeather = false
	bool bIncomingSevere = false
	int myWeatherTemp
	int myBaseTemp
	bool bTransitioning
	
	if Weather.GetCurrentWeatherTransition() >= 1.0								;No incoming weather.
		bTransitioning = false
		myIncomingWeather = none
		myCurrWeatherClass = GetWeatherClassificationActual(wMyWeather)
	else																		;Incoming weather.
		bTransitioning = true
		myIncomingWeather = wMyWeather
		wMyWeather = Weather.GetOutgoingWeather()
		myCurrWeatherClass = GetWeatherClassificationActual(wMyWeather)
		myIncomingWeatherClass = GetWeatherClassificationActual(myIncomingWeather)
	endif
	
	int myRegion = GetPlayerRegion()
	
	if myRegion == 9
		myCurrWeatherClass = 0				;Reset the weather class to 0 to avoid losing EP in planes of Oblivion (Soul Cairn, Apocrypha, etc)
	endif
	
	myBaseTemp = GetBaseTemp(myRegion)
	
	;Is the current weather severe?
	if wMyWeather != none
		if _DE_SevereWeatherList.HasForm(wMyWeather)
			bSevereWeather = true
		endif
	endif
	
	;Is the incoming weather severe?
	if myIncomingWeather != none
		if _DE_SevereWeatherList.HasForm(myIncomingWeather)
			bIncomingSevere = true
		endif
	endif	
	
	if myIncomingWeather != myLastIncomingWeather && myIncomingWeather != none
		ShowWeatherTransitionMsg(myCurrWeatherClass, myIncomingWeatherClass, myRegion, bSevereWeather, bIncomingSevere, myMaxTemp)
	endif
		
	myLastIncomingWeather = myIncomingWeather
	
	;Switch the Current Weather Class to the Incoming Weather Class if necessary for determining temperature.
	if bTransitioning
		wMyWeather = myIncomingWeather
		myCurrWeatherClass = myIncomingWeatherClass
	endif
	
	;Is this the same weather and region from the previous update? If so, don't recalculate
	if wMyWeather == myLastWeather && myRegion == myLastRegion
		return myLastWeatherTemp
	endif	
	
	;Check for Worldspace Exception; if none, determine weather temperature
	if myCurrWeatherClass == -1 											;no classification
		myWeatherTemp = (myBaseTemp - 2) - RandomInt(-1, 1)
		_DE_BadWeather.SetValue(0.0)
	elseif myCurrWeatherClass == 0 											;pleasant
		myWeatherTemp = myBaseTemp - RandomInt(-1, 2)
		_DE_BadWeather.SetValue(0.0)
	elseif myCurrWeatherClass == 1 											;cloudy (foggy)
		myWeatherTemp = (myBaseTemp - 3) - RandomInt(-1, 1)
		_DE_BadWeather.SetValue(0.0)
	elseif myCurrWeatherClass == 2 											;rainy
		if bSevereWeather == false											;mild rain
			myWeatherTemp = (myBaseTemp - 5) - RandomInt(-1, 1)
			_DE_BadWeather.SetValue(1.0)
		else																;severe rain
			myWeatherTemp = (myBaseTemp - 7) - RandomInt(-1, 3)
			_DE_BadWeather.SetValue(2.0)
		endif
	elseif myCurrWeatherClass == 3										 	;snowy
		if bSevereWeather == false											;mild snow
			myWeatherTemp = (myBaseTemp - 5) - RandomInt(-2, 2)
			if myWeatherTemp > -5
				myWeatherTemp = -5
			endif
			_DE_BadWeather.SetValue(3.0)
		else																;snowstorm
			myWeatherTemp = (myBaseTemp - 15) - RandomInt(-2, 2)
			if myWeatherTemp > -10
				myWeatherTemp = -10
			endif
			_DE_BadWeather.SetValue(4.0)
		endif
	endif

	;Store the last weather and temperature
	myLastWeather = wMyWeather
	myLastWeatherTemp = myWeatherTemp
	myLastRegion = myRegion
	
	;notification("Returning new weather temp " + myWeatherTemp)
	return myWeatherTemp
endFunction



function ShowWeatherTransitionMsg(int myCurrWeatherClass, int myIncomingWeatherClass, int myRegion, bool bSevereWeather, bool bIncomingSevere, int myMaxTemp)
	if !bInInterior && pSetting_MsgWeather
		if myIncomingWeatherClass == -1 || myIncomingWeatherClass == 0
			if myCurrWeatherClass == 2											;Clear weather is incoming, rainy weather is outgoing
				if bSevereWeather == false
					FrostfallDebug(4, "Weather Transition INCOMING: CLEAR     OUTGOING: RAIN")
					_DE_Weather_RainToClear.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: CLEAR     OUTGOING: STORM")
					_DE_Weather_StormToClear.Show()
				endif
			elseif myCurrWeatherClass == 3										;Clear weather is incoming, snowy weather is outgoing
				if bSevereWeather == false
					FrostfallDebug(4, "Weather Transition INCOMING: CLEAR     OUTGOING: SNOW")
					_DE_Weather_SnowToClear.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: CLEAR     OUTGOING: BLIZZARD")
					_DE_Weather_BlizzardToClear.Show()
				endif
			endif
		elseif myIncomingWeatherClass == 1
			if myCurrWeatherClass == -1 || myCurrWeatherClass == 0 				;fog incoming, clear outgoing
				if myRegion == -1
					_DE_Weather_ClearToFog1.Show()
				elseif myRegion == 1	;Pine Forest
					_DE_Weather_ClearToFog2.Show()
				elseif myRegion == 2	;Volcanic Tundra
					_DE_Weather_ClearToFog3.Show()
				elseif myRegion == 3	;Fall Forest
					_DE_Weather_ClearToFog4.Show()
				elseif myRegion == 4	;Reach
					_DE_Weather_ClearToFog5.Show()
				elseif myRegion == 6	;Tundra Marsh
					_DE_Weather_ClearToFog6.Show()
				elseif myRegion == 7	;Coast
					_DE_Weather_ClearToFog7.Show()
				endif
				;#Region Debug Message
				if _DE_EPDebug.GetValueInt() == 1
					FrostfallDebug(4, "Weather Transition INCOMING: FOG     OUTGOING: CLEAR")
				endif
				;#EndRegion
			elseif myCurrWeatherClass == 2										;Fog incoming, rain outgoing
				;#Region Debug Message
				if _DE_EPDebug.GetValueInt() == 1
					FrostfallDebug(4, "Weather Transition INCOMING: FOG     OUTGOING: RAIN")
				endif
				;#EndRegion
				_DE_Weather_RainToFog.Show()
			endif
		elseif myIncomingWeatherClass == 2
			if myCurrWeatherClass == -1 || myCurrWeatherClass == 0 				;Rain incoming, clear outgoing
				if bIncomingSevere == false
					FrostfallDebug(4, "Weather Transition INCOMING: RAIN     OUTGOING: CLEAR")
					_DE_Weather_ClearToRain.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: STORM     OUTGOING: CLEAR")
					_DE_Weather_ClearToStorm.Show()
				endif
			elseif myCurrWeatherClass == 1										;Rain incoming, fog outgoing
				if bIncomingSevere == false
					FrostfallDebug(4, "Weather Transition INCOMING: RAIN     OUTGOING: FOG")
					_DE_Weather_FogToRain.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: STORM     OUTGOING: FOG")
					_DE_Weather_FogToStorm.Show()
				endif
			elseif myCurrWeatherClass == 3										;Rain incoming, snow outgoing
				;#Region Debug Message
				if _DE_EPDebug.GetValueInt() == 1
					FrostfallDebug(4, "Weather Transition INCOMING: RAIN     OUTGOING: SNOW")
				endif
				;#EndRegion
				_DE_Weather_SnowToRain.Show()
			endif
		elseif myIncomingWeatherClass == 3
			if myCurrWeatherClass == -1 || myCurrWeatherClass == 0 				;Snow incoming, clear outgoing
				if bIncomingSevere == false
					FrostfallDebug(4, "Weather Transition INCOMING: SNOW     OUTGOING: CLEAR")
					_DE_Weather_ClearToSnow.Show()
				else
					if myMaxTemp != 100
						FrostfallDebug(4, "Weather Transition INCOMING: MOUNTAIN BLIZZARD    OUTGOING: CLEAR")
						_DE_Weather_ClearToSnowMountain.Show()
					else
						FrostfallDebug(4, "Weather Transition INCOMING: BLIZZARD     OUTGOING: CLEAR")
						_DE_Weather_ClearToSnowSevere.Show()
					endif
				endif
			elseif myCurrWeatherClass == 3										;Snow incoming, rain outgoing
				if bIncomingSevere == false
					FrostfallDebug(4, "Weather Transition INCOMING: SNOW     OUTGOING: RAIN")
					_DE_Weather_RainToSnow.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: BLIZZARD     OUTGOING: RAIN")
					_DE_Weather_RainToSnowSevere.Show()
				endif
			endif
		endif
	endif
endFunction

