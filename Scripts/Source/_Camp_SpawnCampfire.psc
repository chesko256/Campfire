Scriptname _Camp_SpawnCampfire extends activemagiceffect

import CampUtil

Activator property _Camp_Indicator_Campfire auto
GlobalVariable property _Camp_Setting_CampfireMode auto
Message property _Camp_CampfireModeSelect auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if PlayerCanPlaceObjects()
		int mode = _Camp_Setting_CampfireMode.GetValueInt()
		if mode < 0 || mode > 1
			int i = _Camp_CampfireModeSelect.Show()
			if i == 0
				; Quick
				_Camp_Setting_CampfireMode.SetValueInt(0)
			elseif i == 1
				; Realistic
				_Camp_Setting_CampfireMode.SetValueInt(1)
			endif

			SendEvent_SaveSettingToProfile("campfire_mode", _Camp_Setting_CampfireMode.GetValueInt())
		endif

		ObjectReference f = Game.GetPlayer().PlaceAtMe(_Camp_Indicator_Campfire)
		(f as CampPlacementIndicator).Ready()
	endif
EndEvent

; @NOFALLBACK
function SendEvent_SaveSettingToProfile(string asSettingName, int aiSettingValue)
	if GetCompatibilitySystem().isSKYUILoaded
		int handle = ModEvent.Create("Campfire_SaveSettingToProfile")
		if handle
			ModEvent.PushString(handle, asSettingName)
			ModEvent.PushInt(handle, aiSettingValue)
			ModEvent.Send(handle)
		endif
	endif
endFunction