scriptname _Camp_Main extends Quest

import CampUtil
import _CampInternal

_Camp_Compatibility property Compatibility auto
Actor property PlayerRef auto
Quest property _Camp_FollowerQuest auto
ReferenceAlias property PlayerAlias auto

event OnInit()
	if !self.IsRunning()
		self.Start()
		return
	endif
	if !_Camp_FollowerQuest.IsRunning()
		_Camp_FollowerQuest.Start()
	endif
	
	PlayerAlias.ForceRefTo(PlayerRef)
	Compatibility.RunCompatibility()
endEvent
