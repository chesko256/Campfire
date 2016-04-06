scriptname _Camp_Main extends Quest

import CampUtil
import _CampInternal

_Camp_Compatibility property Compatibility auto
Actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto

event OnInit()
	if !self.IsRunning()
		self.Start()
		return
	endif
	debug.trace("[Campfire] Performing first-time setup.")
	
	PlayerAlias.ForceRefTo(PlayerRef)
	Compatibility.OnPlayerLoadGame()
endEvent
