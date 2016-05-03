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
	if aiTimer == INIT_TIMER_ID && \
		          !self.IsRunning() && \
		          PlayerRef.GetWorldSpace() == Commonwealth
		self.Start()
		debug.trace("[Campfire] Performing first-time setup.")	
		PlayerAlias.ForceRefTo(PlayerRef)
		Compatibility.OnPlayerLoadGame()
	else
		StartTimer(5, INIT_TIMER_ID)
	endif
endEvent