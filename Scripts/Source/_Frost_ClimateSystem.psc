scriptname _Frost_ClimateSystem extends _Frost_BaseSystem


; Old code
int function GetExceptionBlockTemp()				;Approved 2.5
	;Location exception check
	float myX = flvLastPosX							;Re-used from GetDistanceMoved()
	float myY = flvLastPosY							;Re-used from GetDistanceMoved()
	float myZ = pPlayer.GetPositionZ()
	int maxTemp = 100
	
	;notification("Found weather!")
	;Ensure that the player is in the Tamriel WorldSpace so we can check for location blocks
	if pPlayer.GetWorldSpace() == Tamriel
	
		;High Hrothgar
		if (myX <= 74340 &&  myX >= 32000) && (myY <= -21000 && myY >= -66600)
			;I am near High Hrothgar, set maximum temperature values based on altitude
								;						~~~~    _  ~~~~
			if myZ >= 34000			;Elevation 4                ~~/~~\~~~~~~
				maxTemp = -20       ;                        ~~~ /  ~~\~~~
			elseif myZ >= 27500		;Elevation 3               /   ??  \
				maxTemp = -15       ;                        / . ~~   ?? \
			elseif myZ >= 21300		;Elevation 2           .  .  ~~~~   ??\        			<----High Hrothgar
				maxTemp = -10		;					  /  .  .  ~~ ??   \
			elseif myZ >= 15750		;Elevation 1		 / .   .    ??      \
				maxTemp = -5		;					/########  ??########\
			endif					;							o    ))))FUS RO DAH))))
									;						 [ ]|/={===>           			<----Dovahkiin
									;						   / \
									;
		;The Rift Block
		elseif (myX <= 210000 &&  myX >= 53800) && (myY <= -66600 && myY >= -150000)
			;notification("I'm in The Rift Block")
			if myZ >= 16600
				maxTemp = -10
			endif
		;Falkreath Hold Block
		elseif (myX <= 53800 &&  myX >= -42500) && (myY <= -66600 && myY >= -150000)
			;notification("I'm in Falkreath Hold Block")
			if myZ >= 7300
				maxTemp = -10
			endif
		;Bleak Falls Barrow Block
		elseif (myX <= 19400 &&  myX >= -42500) && (myY <= -15000 && myY >= -60900)
			;notification("I'm in Black Falls Barrow Block")
			if myZ >= 1500
				maxTemp = -10
			endif
		;Brittleshin Pass Block
		elseif (myX <= 15300 &&  myX >= -42500) && (myY <= -60900 && myY >= -80000)
			;notification("I'm in Brittleshin Pass Block")
			if myZ >= 2000
				maxTemp = -10
			endif
		;Haafingar Block (Dawnguard: catches Castle Volkihar)
		elseif (myX <= -71000 &&  myX >= -185000) && (myY <= 163000 && myY >= 78000)
			;notification("I'm in Haafingar Block")
			if myZ >= -7000
				maxTemp = -10
			else
				maxTemp = -5
			endif
		endif
	else
		;notification("I'm not in Tamriel")
	endif
	
	return maxTemp
endFunction

int Function GetWeatherTemp(int myMaxTemp)			;Approved 2.5
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

int function GetBaseTemp(int myRegion)
	;Determine weather base temperature based on region
	if myRegion == -1						;Region lookup failed
		return 9
	elseif myRegion == 1					;Pine Forest
		return 20
	elseif myRegion == 2					;Volcanic Tundra
		return 18
	elseif myRegion == 3					;Fall Forest	
		return 12
	elseif myRegion == 4 || myRegion == 5	;Reach, Tundra
		return 10
	elseif myRegion == 6					;Tundra Marsh
		return 1
	elseif myRegion == 7					;Coast
		return -5
	elseif myRegion == 8					;Snow
		return -10
	elseif myRegion == 9					;Oblivion
		return 16
	
	;			####Official DLC Compatibility####
	elseif myRegion == 10					;DLC1 Worldspace
		return Compatibility.GetPlayerRegionTempDLC1(flvLastPosX, flvLastPosY)
	elseif myRegion == 11
		return Compatibility.GetPlayerRegionTempDLC2(flvLastPosX, flvLastPosY)
	elseif myRegion == 12
		return Compatibility.GetPlayerRegionTempDLC3(flvLastPosX, flvLastPosY)
	elseif myRegion == 13
		return Compatibility.GetPlayerRegionTempDLC4(flvLastPosX, flvLastPosY)
	
	;			####Landmass Mod Compatibility####
	elseif myRegion == 20
		return Compatibility.GetPlayerRegionTempMod1(flvLastPosX, flvLastPosY)
	elseif myRegion == 21
		return Compatibility.GetPlayerRegionTempMod2(flvLastPosX, flvLastPosY)
	elseif myRegion == 22
		return Compatibility.GetPlayerRegionTempMod3(flvLastPosX, flvLastPosY)
	elseif myRegion == 23
		return Compatibility.GetPlayerRegionTempMod4(flvLastPosX, flvLastPosY)
	elseif myRegion == 24
		return Compatibility.GetPlayerRegionTempMod5(flvLastPosX, flvLastPosY)
	elseif myRegion == 25
		return Compatibility.GetPlayerRegionTempMod6(flvLastPosX, flvLastPosY)
	elseif myRegion == 26
		return Compatibility.GetPlayerRegionTempMod7(flvLastPosX, flvLastPosY)
	elseif myRegion == 27
		return Compatibility.GetPlayerRegionTempMod8(flvLastPosX, flvLastPosY)
	elseif myRegion == 28
		return Compatibility.GetPlayerRegionTempMod9(flvLastPosX, flvLastPosY)
	elseif myRegion == 29
		return Compatibility.GetPlayerRegionTempMod10(flvLastPosX, flvLastPosY)
	elseif myRegion == 30
		return Compatibility.GetPlayerRegionTempMod11(flvLastPosX, flvLastPosY)
	elseif myRegion == 31
		return Compatibility.GetPlayerRegionTempMod12(flvLastPosX, flvLastPosY)
	elseif myRegion == 32
		return Compatibility.GetPlayerRegionTempMod13(flvLastPosX, flvLastPosY)
	elseif myRegion == 33
		return Compatibility.GetPlayerRegionTempMod14(flvLastPosX, flvLastPosY)
	elseif myRegion == 34
		return Compatibility.GetPlayerRegionTempMod15(flvLastPosX, flvLastPosY)
	elseif myRegion == 35
		return Compatibility.GetPlayerRegionTempMod16(flvLastPosX, flvLastPosY)
	elseif myRegion == 36
		return Compatibility.GetPlayerRegionTempMod17(flvLastPosX, flvLastPosY)
	elseif myRegion == 37
		return Compatibility.GetPlayerRegionTempMod18(flvLastPosX, flvLastPosY)
	elseif myRegion == 38
		return Compatibility.GetPlayerRegionTempMod19(flvLastPosX, flvLastPosY)
	elseif myRegion == 39
		return Compatibility.GetPlayerRegionTempMod20(flvLastPosX, flvLastPosY)
	endif
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

int function GetPlayerRegion()						;Approved 2.5	
	WorldSpace myWS = pPlayer.GetWorldspace()
	
	if IsInRegion1
		return 1
	elseif IsInRegion2
		return 2
	elseif IsInRegion3
		return 3
	elseif IsInRegion4
		return 4
	elseif IsInRegion5
		return 5
	elseif IsInRegion6
		return 6
	elseif IsInRegion7
		return 7
	elseif IsInRegion8
		return 8
	elseif _DE_WorldspacesExteriorPineForest.HasForm(myWS)
		return 1
	elseif _DE_WorldspacesExteriorVolcanicTundra.HasForm(myWS)
		return 2
	elseif _DE_WorldspacesExteriorFallForest.HasForm(myWS)
		return 3
	elseif _DE_WorldspacesExteriorWhiterun.HasForm(myWS)
		return 4
	elseif _DE_WorldspacesExteriorTundraMarsh.HasForm(myWS)
		return 6
	elseif _DE_WorldspacesExteriorCoast.HasForm(myWS)
		return 7
	elseif _DE_WorldspacesExteriorSnowy.HasForm(myWS)
		return 8
	elseif _DE_WorldspacesExteriorOblivion.HasForm(myWS)
		return 9
	elseif Compatibility.isDLC1Loaded && myWS == Compatibility.DLC1WS
		return 10
	elseif Compatibility.isDLC2Loaded && myWS == Compatibility.DLC2WS
		return 11
	elseif Compatibility.isDLC3Loaded && myWS == Compatibility.DLC3WS
		return 12
	elseif Compatibility.isDLC4Loaded && myWS == Compatibility.DLC4WS
		return 13
	elseif Compatibility.isMod1Loaded && myWS == Compatibility.Mod1WS
		return 20
	elseif Compatibility.isMod2Loaded && myWS == Compatibility.Mod2WS
		return 21
	elseif Compatibility.isMod3Loaded && myWS == Compatibility.Mod3WS
		return 22
	elseif Compatibility.isMod4Loaded && myWS == Compatibility.Mod4WS
		return 23
	elseif Compatibility.isMod5Loaded && myWS == Compatibility.Mod5WS
		return 24
	elseif Compatibility.isMod6Loaded && myWS == Compatibility.Mod6WS
		return 25
	elseif Compatibility.isMod7Loaded && myWS == Compatibility.Mod7WS
		return 26
	elseif Compatibility.isMod8Loaded && myWS == Compatibility.Mod8WS
		return 27
	elseif Compatibility.isMod9Loaded && myWS == Compatibility.Mod9WS
		return 28
	elseif Compatibility.isMod10Loaded && myWS == Compatibility.Mod10WS
		return 29
	elseif Compatibility.isMod11Loaded && myWS == Compatibility.Mod11WS
		return 30
	elseif Compatibility.isMod12Loaded && myWS == Compatibility.Mod12WS
		return 31
	elseif Compatibility.isMod13Loaded && myWS == Compatibility.Mod13WS
		return 32
	elseif Compatibility.isMod14Loaded && myWS == Compatibility.Mod14WS
		return 33
	elseif Compatibility.isMod15Loaded && myWS == Compatibility.Mod15WS
		return 34
	elseif Compatibility.isMod16Loaded && myWS == Compatibility.Mod16WS
		return 35
	elseif Compatibility.isMod17Loaded && myWS == Compatibility.Mod17WS
		return 36
	elseif Compatibility.isMod18Loaded && myWS == Compatibility.Mod18WS
		return 37
	elseif Compatibility.isMod19Loaded && myWS == Compatibility.Mod19WS
		return 38
	elseif Compatibility.isMod20Loaded && myWS == Compatibility.Mod20WS
		return 39
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