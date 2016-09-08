Scriptname _Frost_WeathersenseScript extends ActiveMagicEffect

import CampUtil
import FrostUtil

Actor property PlayerRef auto
GlobalVariable property _Frost_Setting_DisplayAttributesInWeathersense auto
GlobalVariable property _Frost_Setting_WeathersenseDisplayMode auto
Message property _Frost_WeatherTempLevelIndoors auto
Message property _Frost_WeatherTempLevelOblivion auto
Message property _Frost_WeatherTempLevel10 auto
Message property _Frost_WeatherTempLevel9 auto
Message property _Frost_WeatherTempLevel8 auto
Message property _Frost_WeatherTempLevel7 auto
Message property _Frost_WeatherTempLevel6 auto
Message property _Frost_WeatherTempLevel5 auto
Message property _Frost_WeatherTempLevel4 auto
Message property _Frost_WeatherTempLevel3 auto
Message property _Frost_WeatherTempLevel2 auto
Message property _Frost_WeatherTempLevel1 auto
Message property _Frost_StatusMsg_Colder auto
Message property _Frost_StatusMsg_Warmer auto
Message property _Frost_StatusMsg_Steady auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	UseWeathersense()
EndEvent

function UseWeathersense()
	; Display Mode
	; 	0 = Message Only, 1 = Meters Only, 2 = Message + Meters
	int display_mode = _Frost_Setting_WeathersenseDisplayMode.GetValueInt()
	if display_mode != 1
		DisplayStatusMessage()
		DisplayTemperatureMessage()
	endif

	if display_mode >= 1
		SendEvent_ForceWeathersenseMeterDisplay()
		SendEvent_ForceExposureMeterDisplay()
		SendEvent_ForceWetnessMeterDisplay()
	endif
endFunction

function DisplayStatusMessage()
	bool displayStatus = _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt() == 2
	if displayStatus
		int exposure = Math.Floor(GetPlayerExposure())
		int exposureLimit = Math.Floor(GetPlayerExposureLimit())
		int exposureLimitPct = (exposureLimit * 100) / 120
		int exposurePct = (exposure * 100) / 120
		int wetness = Math.Floor(GetPlayerWetness())
		int wetnessPct = (wetness * 100) / 750

		if exposure < exposureLimit
			_Frost_StatusMsg_Colder.Show(exposurePct, exposureLimit, wetnessPct)
		elseif exposure > exposureLimit
			_Frost_StatusMsg_Warmer.Show(exposurePct, exposureLimit, wetnessPct)
		else
			_Frost_StatusMsg_Steady.Show(exposurePct, wetnessPct)
		endif
	endif
endFunction

function DisplayTemperatureMessage()
	int temp = GetCurrentTemperature()

	if IsRefInInterior(PlayerRef)
		_Frost_WeatherTempLevelIndoors.Show()
		return
	elseif IsRefInOblivion(PlayerRef)
		_Frost_WeatherTempLevelOblivion.Show()
		return
	endif

	int temp_level
	if temp >= 18 						;Brilliant Emerald		;The sun is radiant.
		_Frost_WeatherTempLevel10.Show()
		temp_level = 10
	elseif temp < 18 && temp >= 15		;Bright Green			;The air is warm.
		_Frost_WeatherTempLevel9.Show()
		temp_level = 9
	elseif temp < 15 && temp > 10		;Faintly Green			;The air is pleasant.
		_Frost_WeatherTempLevel8.Show()
		temp_level = 8
	elseif temp == 10					;Crystal Clear			;The air is temperate.
		_Frost_WeatherTempLevel7.Show()
		temp_level = 7
	elseif temp < 10 && temp >= 6		;Faintly Blue			;The air is cool.
		_Frost_WeatherTempLevel6.Show()
		temp_level = 6
	elseif temp < 6 && temp >= 1		;Pale Blue				;The air is chilly.
		_Frost_WeatherTempLevel5.Show()
		temp_level = 5
	elseif temp < 1 && temp >= -4		;Azure Blue				;The air is cold.
		_Frost_WeatherTempLevel4.Show()
		temp_level = 4
	elseif temp < -4 && temp >= -9		;Dark Blue				;The air is biting cold.
		_Frost_WeatherTempLevel3.Show()
		temp_level = 3
	elseif temp < -9 && temp >= -14		;Midnight Blue			;The air is bone-chilling.
		_Frost_WeatherTempLevel2.Show()
		temp_level = 2
	elseif temp < -14					;Pure Black				;The air is frigid and deadly.
		_Frost_WeatherTempLevel1.Show()
		temp_level = 1
	endif
EndFunction

function SendEvent_ForceExposureMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("Frostfall_ForceExposureMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_ForceWetnessMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("Frostfall_ForceWetnessMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_ForceWeathersenseMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("Frostfall_ForceWeathersenseMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction
