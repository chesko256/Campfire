Scriptname _Camp_SpawnCampfire extends activemagiceffect

import CampUtil

Actor property PlayerRef auto
Activator property _Camp_Indicator_Campfire auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if PlayerCanPlaceObjects()
		ObjectReference f = Game.GetPlayer().PlaceAtMe(_Camp_Indicator_Campfire)
		(f as CampPlacementIndicator).Ready()
	endif
EndEvent
