scriptname _Camp_Main extends Quest

import CampUtil
import _CampInternal

Actor property PlayerRef auto
Quest property _Camp_FollowerQuest auto
ReferenceAlias property PlayerAlias auto
_Camp_Compatibility property Compatibility auto

formlist property _Camp_TentActivators auto

Quest property _Camp_CampingCrimeTracking auto
ReferenceAlias property Guard auto

Quest property CampfireObjectPlacementSystem auto

event OnInit()
	if !self.IsRunning()
		self.Start()
	endif
	if !_Camp_FollowerQuest.IsRunning()
		_Camp_FollowerQuest.Start()
	endif
	
	PlayerAlias.ForceRefTo(PlayerRef)
	Compatibility.RunCompatibility()
endEvent

function RegisterForEventsOnLoad()
	;pass
endFunction

function RegisterForControlsOnLoad()
	CampDebug(0, "Registering for controls!")
	RegisterForControl("Jump")
endFunction

Event OnControlDown(string control)
	if control == "Jump"
		CampDebug(0, "I got a jump!")
		int i = GetCurrentTentType()
		CampDebug(0, "GetCurrentTentType: " + i)
		CampDebug(0, "Current sit state: " + PlayerRef.GetSitState())
		if i == 1 || i == 3
			;activate on button press in small tents
			ActivateTent()
		elseif (i == 2 || i == 4) && PlayerRef.GetSitState() == 3
			;activate on button press while using large tent
			ActivateTent()
		endif
	endif
endEvent

function ActivateTent()
	CampDebug(0, "Activating tent!")
	ObjectReference myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_TentActivators, PlayerRef, 150.0)
	if myTent
		myTent.Activate(PlayerRef)
	endif
endFunction