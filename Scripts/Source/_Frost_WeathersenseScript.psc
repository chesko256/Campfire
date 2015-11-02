Scriptname _Frost_WeathersenseScript extends ActiveMagicEffect

import CampUtil
import FrostUtil

Actor property PlayerRef auto
Quest property FrostfallStrings auto
GlobalVariable property _Frost_Setting_DisplayAttributesInWeathersense auto
GlobalVariable property _Frost_Setting_WeathersenseDisplayMode auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DisplayPowerMessage()
EndEvent

function DisplayPowerMessage()
	_Frost_Strings str = (FrostfallStrings as _Frost_Strings)

	if _Frost_Setting_WeathersenseDisplayMode.GetValue() > 3
		return
	endif
	
	bool warm = false
	int temp = GetCurrentTemperature()
	int exposure = (Math.Floor(GetPlayerExposure()) - 20)
	int wetness = Math.Floor(GetPlayerWetness())
	int wetness_pct = (wetness * 100) / 750
	if exposure < 0
		warm = true
	endif

	bool display_status = _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt() == 2
	string attribute_header = ""
	if display_status
		string exp_val
		string wet_val
		if warm
			exp_val = "+" + (Math.Abs(exposure) as Int)
		else
			exp_val = exposure
		endif
		wet_val = wetness_pct + "%"
		attribute_header = str.ExposurePrompt + exp_val + " " + str.WetnessPrompt + wet_val + " - "
	endif

	if IsRefInInterior(PlayerRef)
		debug.notification(attribute_header + str.LevelIndoors)
		return
	elseif IsRefInOblivion(PlayerRef)
		debug.notification(attribute_header + str.LevelOblivion)
		return
	endif
	
	int temp_level
	if temp >= 18 						;Brilliant Emerald		;The sun is radiant.
		debug.notification(attribute_header + str.Level10)
		temp_level = 10
	elseif temp < 18 && temp >= 15		;Bright Green			;The air is warm.
		debug.notification(attribute_header + str.Level9)
		temp_level = 9
	elseif temp < 15 && temp > 10		;Faintly Green			;The air is pleasant.
		debug.notification(attribute_header + str.Level8)
		temp_level = 8
	elseif temp == 10					;Crystal Clear			;The air is temperate.
		debug.notification(attribute_header + str.Level7)
		temp_level = 7
	elseif temp < 10 && temp >= 6		;Faintly Blue			;The air is cool.
		debug.notification(attribute_header + str.Level6)
		temp_level = 6
	elseif temp < 6 && temp >= 1		;Pale Blue				;The air is chilly.
		debug.notification(attribute_header + str.Level5)
		temp_level = 5
	elseif temp < 1 && temp >= -4		;Azure Blue				;The air is cold.
		debug.notification(attribute_header + str.Level4)
		temp_level = 4
	elseif temp < -4 && temp >= -9		;Dark Blue				;The air is biting cold.
		debug.notification(attribute_header + str.Level3)
		temp_level = 3
	elseif temp < -9 && temp >= -14		;Midnight Blue			;The air is bone-chilling.
		debug.notification(attribute_header + str.Level2)
		temp_level = 2
	elseif temp < -14					;Pure Black				;The air is frigid and deadly.
		debug.notification(attribute_header + str.Level1)
		temp_level = 1
	endif

	int display_mode = _Frost_Setting_WeathersenseDisplayMode.GetValueInt()
	if display_mode >= 1 && display_mode < 6 && display_mode != 3
		SendEvent_ForceWeathersenseMeterDisplay(temp_level)
	endif
	if display_mode == 2 || display_mode == 3 || display_mode == 4 || display_mode == 6
		SendEvent_ForceExposureMeterDisplay()
		SendEvent_ForceWetnessMeterDisplay()
	endif
endFunction

Event SendEvent_ForceWeathersenseMeterDisplay(int temp_level)
	int handle = ModEvent.Create("Frost_ForceWeathersenseMeterDisplay")
	if handle
		ModEvent.PushInt(handle, temp_level)
		ModEvent.PushBool(handle, false)
		ModEvent.Send(handle)
	endif
endEvent

Event SendEvent_ForceExposureMeterDisplay()
	int handle = ModEvent.Create("Frost_ForceExposureMeterDisplay")
	if handle
		ModEvent.PushBool(handle, false)
		ModEvent.Send(handle)
	endif
endEvent

Event SendEvent_ForceWetnessMeterDisplay()
	int handle = ModEvent.Create("Frost_ForceWetnessMeterDisplay")
	if handle
		ModEvent.PushBool(handle, false)
		ModEvent.Send(handle)
	endif
endEvent