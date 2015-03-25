scriptname _Camp_Main extends Quest

import CampUtil

Actor property PlayerRef auto
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
	;if !_Camp_CampingCrimeTracking.IsRunning()
	;	_Camp_CampingCrimeTracking.Start()
	;endif

	PlayerAlias.ForceRefTo(PlayerRef)
	Compatibility.RunCompatibility()

	utility.wait(1.0)
	;/debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	debug.trace("[Campfire] Guard alias set to " + Guard)
	/;

	;debug.trace("[Campfire] Waiting 45 seconds before reverting all nodes...")
	;utility.wait(45.0)
	;debug.trace("[Campfire] Reverting all nodes.")
endEvent

function CheckFollowerPolling()
	;Calling on game start-up. Set update loop and begin polling for followers if necessary.
	;if _Camp_Setting_FollowerPolling.GetValueInt() != 0
	;	SyncFollowers()
	;	RegisterForSingleUpdate(8)
	;endif
endFunction

function RegisterForEventsOnLoad()
	debug.trace("[Campfire] Registering for modevent Campfire_CampfireOnPlaceableObjectUsed.")
	RegisterForModEvent("Campfire_CampfireOnPlaceableObjectUsed", "CampfireOnPlaceableObjectUsed")
endFunction

function RegisterForControlsOnLoad()
	debug.trace("[Campfire] Registering for control!")
	RegisterForControl("Jump")
endFunction

Event OnControlDown(string control)
	if control == "Jump"
		debug.trace("[Campfire] I got a jump!")
		int i = GetCurrentTentType()
		debug.trace("[Campfire] GetCurrentTentType: " + i)
		debug.trace("[Campfire] Current sit state: " + PlayerRef.GetSitState())
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
	debug.trace("[Campfire] Activating tent!")
	ObjectReference myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_TentActivators, PlayerRef, 150.0)
	if myTent
		myTent.Activate(PlayerRef)
	endif
endFunction

Event OnUpdate()

endEvent