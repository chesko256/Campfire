Scriptname _Frost_WeathersenseScript extends ActiveMagicEffect

import CampUtil

Quest property _Frost_MainQuest auto
GlobalVariable property _Frost_Setting_WeathersenseDisplayMode auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	UseWeathersense()
EndEvent

function UseWeathersense()
	; Display Mode
	; 	0 = Message Only, 1 = Meters Only, 2 = Message + Meters
	int display_mode = _Frost_Setting_WeathersenseDisplayMode.GetValueInt()
	_Frost_WeathersenseMessages messages = _Frost_MainQuest as _Frost_WeathersenseMessages
	if display_mode != 1
		messages.DisplayStatusMessage()
		messages.DisplayTemperatureMessage()
	endif

	if display_mode >= 1
		SendEvent_ForceWeathersenseMeterDisplay()
		SendEvent_ForceExposureMeterDisplay()
		SendEvent_ForceWetnessMeterDisplay()
	endif
endFunction

;@NOFALLBACK
function SendEvent_ForceExposureMeterDisplay(bool abFlash = false)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frostfall_ForceExposureMeterDisplay")
		if handle
			ModEvent.PushBool(handle, abFlash)
			ModEvent.Send(handle)
		endif
	endif
endFunction

;@NOFALLBACK
function SendEvent_ForceWetnessMeterDisplay(bool abFlash = false)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frostfall_ForceWetnessMeterDisplay")
		if handle
			ModEvent.PushBool(handle, abFlash)
			ModEvent.Send(handle)
		endif
	endif
endFunction

;@NOFALLBACK
function SendEvent_ForceWeathersenseMeterDisplay(bool abFlash = false)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frostfall_ForceWeathersenseMeterDisplay")
		if handle
			ModEvent.PushBool(handle, abFlash)
			ModEvent.Send(handle)
		endif
	endif
endFunction
