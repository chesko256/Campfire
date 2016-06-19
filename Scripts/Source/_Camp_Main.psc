scriptname _Camp_Main extends Quest

import CampUtil
import _CampInternal

_Camp_Compatibility property Compatibility auto
Actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto
Worldspace property Commonwealth auto

int INIT_TIMER_ID = 99

event OnInit()
	StartTimer(5, INIT_TIMER_ID)
endEvent

Event OnTimer(int aiTimer)
	Worldspace FarHarbor = Game.GetFormFromFile(0x000B0F, "DLCCoast.esm") as Worldspace
	if aiTimer == INIT_TIMER_ID && !self.IsRunning()
		if PlayerRef.GetWorldSpace() == Commonwealth || (FarHarbor && PlayerRef.GetWorldSpace() == FarHarbor)
			self.Start()
			debug.trace("[Campfire] Performing first-time setup.")	
			PlayerAlias.ForceRefTo(PlayerRef)
			Compatibility.OnPlayerLoadGame()
		else
			StartTimer(5, INIT_TIMER_ID)
		endif
	else
		StartTimer(5, INIT_TIMER_ID)
	endif
endEvent