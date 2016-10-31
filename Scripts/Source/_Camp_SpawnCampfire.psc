Scriptname _Camp_SpawnCampfire extends activemagiceffect

import CampUtil

Actor property PlayerRef auto
Activator property _Camp_Indicator_Campfire auto
GlobalVariable property _Camp_Setting_CampfireMode auto
Message property _Camp_CampfireModeSelect auto
Message property _Camp_CampfireNoFuelMsg auto
MiscObject property Firewood01 auto
MiscObject property _Camp_DeadwoodLog auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if PlayerCanPlaceObjects()
		if _Camp_Setting_CampfireMode.GetValueInt() == 3
			int i = _Camp_CampfireModeSelect.Show()
			if i == 0
				_Camp_Setting_CampfireMode.SetValueInt(1)
			elseif i == 1
				_Camp_Setting_CampfireMode.SetValueInt(2)
			endif
		endif

		if _Camp_Setting_CampfireMode.GetValueInt() == 1
			; What fuel does the player have?
			if PlayerRef.GetItemCount(_Camp_DeadwoodLog) < 4 && PlayerRef.GetItemCount(Firewood01) < 4
				_Camp_CampfireNoFuelMsg.Show()
				return
			endif
		endif

		ObjectReference f = Game.GetPlayer().PlaceAtMe(_Camp_Indicator_Campfire)
		(f as CampPlacementIndicator).Ready()
	endif
EndEvent
