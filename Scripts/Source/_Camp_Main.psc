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
	debug.trace("[Campfire] Performing first-time setup.")
	if !_Camp_FollowerQuest.IsRunning()
		_Camp_FollowerQuest.Start()
	endif
	
	PlayerAlias.ForceRefTo(PlayerRef)
	Compatibility.OnPlayerLoadGame()
endEvent

function RegisterForControlsOnLoad()
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
			ObjectReference player_lighting_marker = (campfire as CampCampfire).FireLightingReference
			if player_sit_marker && player_sit_marker.IsFurnitureInUse() && PlayerRef.GetSitState() == 3
				CampDebug(0, "Activating campfire " + campfire)
				campfire.Activate(PlayerRef)
			elseif player_lighting_marker && player_lighting_marker.IsFurnitureInUse() && PlayerRef.GetSitState() == 3
				CampDebug(0, "Cancelling lighting attempt with marker " + player_lighting_marker + " with campfire " + campfire)
				(player_lighting_marker as _Camp_LightFireFurnScript).StopLighting()
			endif
		endif
	endif
endEvent 