Scriptname _Frost_WeathersenseScript extends ActiveMagicEffect

import CampUtil
import FrostUtil
import _FrostInternal

Actor property PlayerRef auto
GlobalVariable property _Frost_Setting_DisplayAttributesInWeathersense auto
GlobalVariable property _Frost_Setting_WeathersenseDisplayMode auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DisplayPowerMessage()
EndEvent

function DisplayPowerMessage()
	_Frost_Strings str = GetFrostfallStrings()
	
	bool warm = false
	int temp = GetCurrentTemperature()
	int exposure = (Math.Floor(GetPlayerExposure()) - 20)
	int wetness = Math.Floor(GetPlayerWetness())
	int wetness_pct = (wetness * 100) / 750
	if exposure < 0
		warm = true
	endif

	; Display Mode
	; 	0 = Message Only, 1 = Meters Only, 2 = Message + Meters
	int display_mode = _Frost_Setting_WeathersenseDisplayMode.GetValueInt()
	if display_mode != 1
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
		
		;@TODO - This approach won't work on consoles
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
	endif

	

	if display_mode >= 1
		SendEvent_ForceWeathersenseMeterDisplay()
		SendEvent_ForceExposureMeterDisplay()
		SendEvent_ForceWetnessMeterDisplay()
	endif
endFunction

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
