Scriptname _Camp_SpawnCampfire extends activemagiceffect

import CampUtil

_Camp_SkyUIConfigPanelScript property CampConfig Auto
Activator property _Camp_Indicator_Campfire auto
GlobalVariable property _Camp_Setting_CampfireMode auto
Message property _Camp_CampfireModeSelect auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if PlayerCanPlaceObjects()
		if _Camp_Setting_CampfireMode.GetValueInt() > 1
			int i = _Camp_CampfireModeSelect.Show()
			if i == 0
				; Quick
				_Camp_Setting_CampfireMode.SetValueInt(0)
			elseif i == 1
				; Realistic
				_Camp_Setting_CampfireMode.SetValueInt(1)
			endif

			if GetCompatibilitySystem().isSKYUILoaded
				CampConfig.SaveSettingToCurrentProfile("campfire_mode", _Camp_Setting_CampfireMode.GetValueInt())
			endif
		endif

		ObjectReference f = Game.GetPlayer().PlaceAtMe(_Camp_Indicator_Campfire)
		(f as CampPlacementIndicator).Ready()
	endif
EndEvent
