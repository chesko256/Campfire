Scriptname _Frost_WeathersenseScript extends ActiveMagicEffect

import CampUtil
import FrostUtil

Actor property PlayerRef auto
GlobalVariable property _Frost_Setting_DisplayAttributesInWeathersense auto
GlobalVariable property _Frost_Setting_DisplayAttributeValuesInWeathersense auto
GlobalVariable property _Frost_Setting_WeathersenseDisplayMode auto

; Player Status
Message property _Frost_StatusCnd_E1W1 auto
Message property _Frost_StatusCnd_E1W2 auto
Message property _Frost_StatusCnd_E1W3 auto
Message property _Frost_StatusCnd_E1W4 auto
Message property _Frost_StatusCnd_E2W1 auto
Message property _Frost_StatusCnd_E2W2 auto
Message property _Frost_StatusCnd_E2W3 auto
Message property _Frost_StatusCnd_E2W4 auto
Message property _Frost_StatusCnd_E3W1 auto
Message property _Frost_StatusCnd_E3W2 auto
Message property _Frost_StatusCnd_E3W3 auto
Message property _Frost_StatusCnd_E3W4 auto
Message property _Frost_StatusCnd_E4W1 auto
Message property _Frost_StatusCnd_E4W2 auto
Message property _Frost_StatusCnd_E4W3 auto
Message property _Frost_StatusCnd_E4W4 auto
Message property _Frost_StatusCnd_E5W1 auto
Message property _Frost_StatusCnd_E5W2 auto
Message property _Frost_StatusCnd_E5W3 auto
Message property _Frost_StatusCnd_E5W4 auto
Message property _Frost_StatusCnd_E6W1 auto
Message property _Frost_StatusCnd_E6W2 auto
Message property _Frost_StatusCnd_E6W3 auto
Message property _Frost_StatusCnd_E6W4 auto

Message property _Frost_StatusCnd_E1W1_NoValue auto
Message property _Frost_StatusCnd_E1W2_NoValue auto
Message property _Frost_StatusCnd_E1W3_NoValue auto
Message property _Frost_StatusCnd_E1W4_NoValue auto
Message property _Frost_StatusCnd_E2W1_NoValue auto
Message property _Frost_StatusCnd_E2W2_NoValue auto
Message property _Frost_StatusCnd_E2W3_NoValue auto
Message property _Frost_StatusCnd_E2W4_NoValue auto
Message property _Frost_StatusCnd_E3W1_NoValue auto
Message property _Frost_StatusCnd_E3W2_NoValue auto
Message property _Frost_StatusCnd_E3W3_NoValue auto
Message property _Frost_StatusCnd_E3W4_NoValue auto
Message property _Frost_StatusCnd_E4W1_NoValue auto
Message property _Frost_StatusCnd_E4W2_NoValue auto
Message property _Frost_StatusCnd_E4W3_NoValue auto
Message property _Frost_StatusCnd_E4W4_NoValue auto
Message property _Frost_StatusCnd_E5W1_NoValue auto
Message property _Frost_StatusCnd_E5W2_NoValue auto
Message property _Frost_StatusCnd_E5W3_NoValue auto
Message property _Frost_StatusCnd_E5W4_NoValue auto
Message property _Frost_StatusCnd_E6W1_NoValue auto
Message property _Frost_StatusCnd_E6W2_NoValue auto
Message property _Frost_StatusCnd_E6W3_NoValue auto
Message property _Frost_StatusCnd_E6W4_NoValue auto

; Weather Temp
Message property _frost_StatusTemp_Colder_Level1 auto
Message property _frost_StatusTemp_Colder_Level2 auto
Message property _frost_StatusTemp_Colder_Level3 auto
Message property _frost_StatusTemp_Colder_Level4 auto
Message property _frost_StatusTemp_Colder_Level5 auto
Message property _frost_StatusTemp_Colder_Level6 auto
Message property _frost_StatusTemp_Colder_Level7 auto
Message property _frost_StatusTemp_Colder_Level8 auto
Message property _frost_StatusTemp_Colder_Level9 auto
Message property _frost_StatusTemp_Colder_Level10 auto
Message property _frost_StatusTemp_Colder_Indoors auto
Message property _frost_StatusTemp_Colder_Oblivion auto
Message property _frost_StatusTemp_Steady_Level1 auto
Message property _frost_StatusTemp_Steady_Level2 auto
Message property _frost_StatusTemp_Steady_Level3 auto
Message property _frost_StatusTemp_Steady_Level4 auto
Message property _frost_StatusTemp_Steady_Level5 auto
Message property _frost_StatusTemp_Steady_Level6 auto
Message property _frost_StatusTemp_Steady_Level7 auto
Message property _frost_StatusTemp_Steady_Level8 auto
Message property _frost_StatusTemp_Steady_Level9 auto
Message property _frost_StatusTemp_Steady_Level10 auto
Message property _frost_StatusTemp_Steady_Indoors auto
Message property _frost_StatusTemp_Steady_Oblivion auto
Message property _frost_StatusTemp_Warmer_Level1 auto
Message property _frost_StatusTemp_Warmer_Level2 auto
Message property _frost_StatusTemp_Warmer_Level3 auto
Message property _frost_StatusTemp_Warmer_Level4 auto
Message property _frost_StatusTemp_Warmer_Level5 auto
Message property _frost_StatusTemp_Warmer_Level6 auto
Message property _frost_StatusTemp_Warmer_Level7 auto
Message property _frost_StatusTemp_Warmer_Level8 auto
Message property _frost_StatusTemp_Warmer_Level9 auto
Message property _frost_StatusTemp_Warmer_Level10 auto
Message property _frost_StatusTemp_Warmer_Indoors auto
Message property _frost_StatusTemp_Warmer_Oblivion auto

Message property _frost_StatusTemp_Colder_Level1_NoValue auto
Message property _frost_StatusTemp_Colder_Level2_NoValue auto
Message property _frost_StatusTemp_Colder_Level3_NoValue auto
Message property _frost_StatusTemp_Colder_Level4_NoValue auto
Message property _frost_StatusTemp_Colder_Level5_NoValue auto
Message property _frost_StatusTemp_Colder_Level6_NoValue auto
Message property _frost_StatusTemp_Colder_Level7_NoValue auto
Message property _frost_StatusTemp_Colder_Level8_NoValue auto
Message property _frost_StatusTemp_Colder_Level9_NoValue auto
Message property _frost_StatusTemp_Colder_Level10_NoValue auto
Message property _frost_StatusTemp_Colder_Indoors_NoValue auto
Message property _frost_StatusTemp_Colder_Oblivion_NoValue auto
Message property _frost_StatusTemp_Warmer_Level1_NoValue auto
Message property _frost_StatusTemp_Warmer_Level2_NoValue auto
Message property _frost_StatusTemp_Warmer_Level3_NoValue auto
Message property _frost_StatusTemp_Warmer_Level4_NoValue auto
Message property _frost_StatusTemp_Warmer_Level5_NoValue auto
Message property _frost_StatusTemp_Warmer_Level6_NoValue auto
Message property _frost_StatusTemp_Warmer_Level7_NoValue auto
Message property _frost_StatusTemp_Warmer_Level8_NoValue auto
Message property _frost_StatusTemp_Warmer_Level9_NoValue auto
Message property _frost_StatusTemp_Warmer_Level10_NoValue auto
Message property _frost_StatusTemp_Warmer_Indoors_NoValue auto
Message property _frost_StatusTemp_Warmer_Oblivion_NoValue auto

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
	bool displayStatusValues = _Frost_Setting_DisplayAttributeValuesInWeathersense.GetValueInt() == 2
	if displayStatus
		int exposure = Math.Floor(GetPlayerExposure())
		int exposurePct = (exposure * 100) / 120
		int exposureLevel = GetPlayerExposureLevel()
		int wetness = Math.Floor(GetPlayerWetness())
		int wetnessPct = (wetness * 100) / 750
		int wetnessLevel = GetPlayerWetnessLevel()

		if displayStatusValues
			if exposureLevel <= 0
				if wetnessLevel == 0
					_Frost_StatusCnd_E1W1.Show(exposurePct)
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E1W2.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E1W3.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E1W4.Show(exposurePct, wetnessPct)
				endif
			elseif exposureLevel == 1
				if wetnessLevel == 0
					_Frost_StatusCnd_E2W1.Show(exposurePct)
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E2W2.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E2W3.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E2W4.Show(exposurePct, wetnessPct)
				endif
			elseif exposureLevel == 2
				if wetnessLevel == 0
					_Frost_StatusCnd_E3W1.Show(exposurePct)
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E3W2.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E3W3.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E3W4.Show(exposurePct, wetnessPct)
				endif
			elseif exposureLevel == 3
				if wetnessLevel == 0
					_Frost_StatusCnd_E4W1.Show(exposurePct)
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E4W2.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E4W3.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E4W4.Show(exposurePct, wetnessPct)
				endif
			elseif exposureLevel == 4
				if wetnessLevel == 0
					_Frost_StatusCnd_E5W1.Show(exposurePct)
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E5W2.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E5W3.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E5W4.Show(exposurePct, wetnessPct)
				endif
			elseif exposureLevel == 5
				if wetnessLevel == 0
					_Frost_StatusCnd_E6W1.Show(exposurePct)
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E6W2.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E6W3.Show(exposurePct, wetnessPct)
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E6W4.Show(exposurePct, wetnessPct)
				endif
			endif
		else
			if exposureLevel <= 0
				if wetnessLevel == 0
					_Frost_StatusCnd_E1W1_NoValue.Show()
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E1W2_NoValue.Show()
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E1W3_NoValue.Show()
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E1W4_NoValue.Show()
				endif
			elseif exposureLevel == 1
				if wetnessLevel == 0
					_Frost_StatusCnd_E2W1_NoValue.Show()
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E2W2_NoValue.Show()
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E2W3_NoValue.Show()
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E2W4_NoValue.Show()
				endif
			elseif exposureLevel == 2
				if wetnessLevel == 0
					_Frost_StatusCnd_E3W1_NoValue.Show()
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E3W2_NoValue.Show()
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E3W3_NoValue.Show()
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E3W4_NoValue.Show()
				endif
			elseif exposureLevel == 3
				if wetnessLevel == 0
					_Frost_StatusCnd_E4W1_NoValue.Show()
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E4W2_NoValue.Show()
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E4W3_NoValue.Show()
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E4W4_NoValue.Show()
				endif
			elseif exposureLevel == 4
				if wetnessLevel == 0
					_Frost_StatusCnd_E5W1_NoValue.Show()
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E5W2_NoValue.Show()
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E5W3_NoValue.Show()
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E5W4_NoValue.Show()
				endif
			elseif exposureLevel == 5
				if wetnessLevel == 0
					_Frost_StatusCnd_E6W1_NoValue.Show()
				elseif wetnessLevel == 1
					_Frost_StatusCnd_E6W2_NoValue.Show()
				elseif wetnessLevel == 2
					_Frost_StatusCnd_E6W3_NoValue.Show()
				elseif wetnessLevel == 3
					_Frost_StatusCnd_E6W4_NoValue.Show()
				endif
			endif
		endif
	endif
endFunction

function DisplayTemperatureMessage()
	int temp = GetCurrentTemperature()
	int exposure = Math.Floor(GetPlayerExposure())
	int limit = Math.Floor(GetPlayerExposureLimit())
	int limitPct = (limit * 100) / 120

	int GETTING_COLDER = 0
	int HOLDING_STEADY = 1
	int GETTING_WARMER = 2

	bool displayStatus = _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt() == 2
	bool displayStatusValues = _Frost_Setting_DisplayAttributeValuesInWeathersense.GetValueInt() == 2
	int direction = 1
	if exposure < limit && displayStatus
		direction = GETTING_COLDER
	elseif exposure > limit && displayStatus
		direction = GETTING_WARMER
	endif

	if displayStatusValues
		if direction == GETTING_COLDER
			if IsRefInInterior(PlayerRef)
				_frost_StatusTemp_Colder_Indoors.Show(limitPct)
				return
			elseif IsRefInOblivion(PlayerRef)
				_frost_StatusTemp_Colder_Oblivion.Show(limitPct)
				return
			endif
	
			if temp >= 18 						;The sun is radiant.
				_frost_StatusTemp_Colder_Level10.Show(limitPct)
			elseif temp < 18 && temp >= 15		;The air is warm.
				_frost_StatusTemp_Colder_Level9.Show(limitPct)
			elseif temp < 15 && temp > 10		;The air is pleasant.
				_frost_StatusTemp_Colder_Level8.Show(limitPct)
			elseif temp == 10					;The air is temperate.
				_frost_StatusTemp_Colder_Level7.Show(limitPct)
			elseif temp < 10 && temp >= 6		;The air is cool.
				_frost_StatusTemp_Colder_Level6.Show(limitPct)
			elseif temp < 6 && temp >= 1		;The air is chilly.
				_frost_StatusTemp_Colder_Level5.Show(limitPct)
			elseif temp < 1 && temp >= -4		;The air is cold.
				_frost_StatusTemp_Colder_Level4.Show(limitPct)
			elseif temp < -4 && temp >= -9		;The air is biting cold.
				_frost_StatusTemp_Colder_Level3.Show(limitPct)
			elseif temp < -9 && temp >= -14		;The air is bone-chilling.
				_frost_StatusTemp_Colder_Level2.Show(limitPct)
			elseif temp < -14					;The air is frigid and deadly.
				_frost_StatusTemp_Colder_Level1.Show(limitPct)
			endif
		elseif direction == HOLDING_STEADY
			if IsRefInInterior(PlayerRef)
				_frost_StatusTemp_Steady_Indoors.Show()
				return
			elseif IsRefInOblivion(PlayerRef)
				_frost_StatusTemp_Steady_Oblivion.Show()
				return
			endif
	
			if temp >= 18 						;The sun is radiant.
				_frost_StatusTemp_Steady_Level10.Show()
			elseif temp < 18 && temp >= 15		;The air is warm.
				_frost_StatusTemp_Steady_Level9.Show()
			elseif temp < 15 && temp > 10		;The air is pleasant.
				_frost_StatusTemp_Steady_Level8.Show()
			elseif temp == 10					;The air is temperate.
				_frost_StatusTemp_Steady_Level7.Show()
			elseif temp < 10 && temp >= 6		;The air is cool.
				_frost_StatusTemp_Steady_Level6.Show()
			elseif temp < 6 && temp >= 1		;The air is chilly.
				_frost_StatusTemp_Steady_Level5.Show()
			elseif temp < 1 && temp >= -4		;The air is cold.
				_frost_StatusTemp_Steady_Level4.Show()
			elseif temp < -4 && temp >= -9		;The air is biting cold.
				_frost_StatusTemp_Steady_Level3.Show()
			elseif temp < -9 && temp >= -14		;The air is bone-chilling.
				_frost_StatusTemp_Steady_Level2.Show()
			elseif temp < -14					;The air is frigid and deadly.
				_frost_StatusTemp_Steady_Level1.Show()
			endif
		elseif direction == GETTING_WARMER
			if IsRefInInterior(PlayerRef)
				_frost_StatusTemp_Warmer_Indoors.Show(limitPct)
				return
			elseif IsRefInOblivion(PlayerRef)
				_frost_StatusTemp_Warmer_Oblivion.Show(limitPct)
				return
			endif
	
			if temp >= 18 						;The sun is radiant.
				_frost_StatusTemp_Warmer_Level10.Show(limitPct)
			elseif temp < 18 && temp >= 15		;The air is warm.
				_frost_StatusTemp_Warmer_Level9.Show(limitPct)
			elseif temp < 15 && temp > 10		;The air is pleasant.
				_frost_StatusTemp_Warmer_Level8.Show(limitPct)
			elseif temp == 10					;The air is temperate.
				_frost_StatusTemp_Warmer_Level7.Show(limitPct)
			elseif temp < 10 && temp >= 6		;The air is cool.
				_frost_StatusTemp_Warmer_Level6.Show(limitPct)
			elseif temp < 6 && temp >= 1		;The air is chilly.
				_frost_StatusTemp_Warmer_Level5.Show(limitPct)
			elseif temp < 1 && temp >= -4		;The air is cold.
				_frost_StatusTemp_Warmer_Level4.Show(limitPct)
			elseif temp < -4 && temp >= -9		;The air is biting cold.
				_frost_StatusTemp_Warmer_Level3.Show(limitPct)
			elseif temp < -9 && temp >= -14		;The air is bone-chilling.
				_frost_StatusTemp_Warmer_Level2.Show(limitPct)
			elseif temp < -14					;The air is frigid and deadly.
				_frost_StatusTemp_Warmer_Level1.Show(limitPct)
			endif
		endif
	else
		if direction == GETTING_COLDER
			if IsRefInInterior(PlayerRef)
				_frost_StatusTemp_Colder_Indoors_NoValue.Show()
				return
			elseif IsRefInOblivion(PlayerRef)
				_frost_StatusTemp_Colder_Oblivion_NoValue.Show()
				return
			endif
	
			if temp >= 18 						;The sun is radiant.
				_frost_StatusTemp_Colder_Level10_NoValue.Show()
			elseif temp < 18 && temp >= 15		;The air is warm.
				_frost_StatusTemp_Colder_Level9_NoValue.Show()
			elseif temp < 15 && temp > 10		;The air is pleasant.
				_frost_StatusTemp_Colder_Level8_NoValue.Show()
			elseif temp == 10					;The air is temperate.
				_frost_StatusTemp_Colder_Level7_NoValue.Show()
			elseif temp < 10 && temp >= 6		;The air is cool.
				_frost_StatusTemp_Colder_Level6_NoValue.Show()
			elseif temp < 6 && temp >= 1		;The air is chilly.
				_frost_StatusTemp_Colder_Level5_NoValue.Show()
			elseif temp < 1 && temp >= -4		;The air is cold.
				_frost_StatusTemp_Colder_Level4_NoValue.Show()
			elseif temp < -4 && temp >= -9		;The air is biting cold.
				_frost_StatusTemp_Colder_Level3_NoValue.Show()
			elseif temp < -9 && temp >= -14		;The air is bone-chilling.
				_frost_StatusTemp_Colder_Level2_NoValue.Show()
			elseif temp < -14					;The air is frigid and deadly.
				_frost_StatusTemp_Colder_Level1_NoValue.Show()
			endif
		elseif direction == HOLDING_STEADY
			if IsRefInInterior(PlayerRef)
				_frost_StatusTemp_Steady_Indoors.Show()
				return
			elseif IsRefInOblivion(PlayerRef)
				_frost_StatusTemp_Steady_Oblivion.Show()
				return
			endif
	
			if temp >= 18 						;The sun is radiant.
				_frost_StatusTemp_Steady_Level10.Show()
			elseif temp < 18 && temp >= 15		;The air is warm.
				_frost_StatusTemp_Steady_Level9.Show()
			elseif temp < 15 && temp > 10		;The air is pleasant.
				_frost_StatusTemp_Steady_Level8.Show()
			elseif temp == 10					;The air is temperate.
				_frost_StatusTemp_Steady_Level7.Show()
			elseif temp < 10 && temp >= 6		;The air is cool.
				_frost_StatusTemp_Steady_Level6.Show()
			elseif temp < 6 && temp >= 1		;The air is chilly.
				_frost_StatusTemp_Steady_Level5.Show()
			elseif temp < 1 && temp >= -4		;The air is cold.
				_frost_StatusTemp_Steady_Level4.Show()
			elseif temp < -4 && temp >= -9		;The air is biting cold.
				_frost_StatusTemp_Steady_Level3.Show()
			elseif temp < -9 && temp >= -14		;The air is bone-chilling.
				_frost_StatusTemp_Steady_Level2.Show()
			elseif temp < -14					;The air is frigid and deadly.
				_frost_StatusTemp_Steady_Level1.Show()
			endif
		elseif direction == GETTING_WARMER
			if IsRefInInterior(PlayerRef)
				_frost_StatusTemp_Warmer_Indoors_NoValue.Show()
				return
			elseif IsRefInOblivion(PlayerRef)
				_frost_StatusTemp_Warmer_Oblivion_NoValue.Show()
				return
			endif
	
			if temp >= 18 						;The sun is radiant.
				_frost_StatusTemp_Warmer_Level10_NoValue.Show()
			elseif temp < 18 && temp >= 15		;The air is warm.
				_frost_StatusTemp_Warmer_Level9_NoValue.Show()
			elseif temp < 15 && temp > 10		;The air is pleasant.
				_frost_StatusTemp_Warmer_Level8_NoValue.Show()
			elseif temp == 10					;The air is temperate.
				_frost_StatusTemp_Warmer_Level7_NoValue.Show()
			elseif temp < 10 && temp >= 6		;The air is cool.
				_frost_StatusTemp_Warmer_Level6_NoValue.Show()
			elseif temp < 6 && temp >= 1		;The air is chilly.
				_frost_StatusTemp_Warmer_Level5_NoValue.Show()
			elseif temp < 1 && temp >= -4		;The air is cold.
				_frost_StatusTemp_Warmer_Level4_NoValue.Show()
			elseif temp < -4 && temp >= -9		;The air is biting cold.
				_frost_StatusTemp_Warmer_Level3_NoValue.Show()
			elseif temp < -9 && temp >= -14		;The air is bone-chilling.
				_frost_StatusTemp_Warmer_Level2_NoValue.Show()
			elseif temp < -14					;The air is frigid and deadly.
				_frost_StatusTemp_Warmer_Level1_NoValue.Show()
			endif
		endif
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
