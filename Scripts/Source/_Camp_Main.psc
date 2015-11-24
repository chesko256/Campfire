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

function RegisterForControlsOnLoad()
	CampDebug(0, "Registering for controls!")
	RegisterForControl("Jump")
endFunction

Event OnControlDown(string control)
	if control == "Jump"
		CampDebug(0, "Got jump press, checking for tent or campfire.")
		ObjectReference tent = GetCurrentTent()
		ObjectReference campfire = GetLastUsedCampfire()
		if tent && PlayerRef.GetSitState() == 3
			CampDebug(0, "Activating tent " + tent)
			tent.Activate(PlayerRef)
		elseif campfire
			ObjectReference player_sit_marker = (campfire as CampCampfire).mySitFurniture2
			if player_sit_marker && player_sit_marker.IsFurnitureInUse() && PlayerRef.GetSitState() == 3
				CampDebug(0, "Activating campfire " + campfire)
				campfire.Activate(PlayerRef)
			endif
		endif
	endif
endEvent 