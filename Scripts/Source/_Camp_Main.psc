scriptname _Camp_Main extends Quest

import CampUtil

Actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto
_Camp_Compatibility property Compatibility auto
spell property _DE_SurvivalSkillsCombo_Spell auto
spell property _DE_WalkingStickSpell auto

formlist property _DE_TentActivators auto

GlobalVariable property _Camp_Setting_FollowerPolling auto
GlobalVariable property _Camp_FollowerCount auto
GlobalVariable property _Camp_HasPet auto
ReferenceAlias property StaticFollower1 auto
ReferenceAlias property StaticFollower2 auto
ReferenceAlias property StaticFollower3 auto
ReferenceAlias property StaticDog auto
ReferenceAlias property Follower1 auto
ReferenceAlias property Follower2 auto
ReferenceAlias property Follower3 auto
ReferenceAlias property Dog auto

event OnInit()
	if !self.IsRunning()
		self.Start()
	endif

	PlayerAlias.ForceRefTo(PlayerRef)
	Compatibility.RunStartupCheck()

	PlayerRef.AddSpell(_DE_SurvivalSkillsCombo_Spell, false)		;Survival Skills (multi-select)
	PlayerRef.AddSpell(_DE_WalkingStickSpell, false)
endEvent

function CheckFollowerPolling()
	;Calling on game start-up. Set update loop and begin polling for followers if necessary.
	if _Camp_Setting_FollowerPolling.GetValueInt() != 0
		SyncFollowers()
		RegisterForSingleUpdate(8)
	endif
endFunction

function RegisterForControlsOnLoad()
	debug.trace("[Campfire] Registering for control!")
	RegisterForControl("Activate")
endFunction

Event OnControlDown(string control)
	if control == "Activate"
		debug.trace("[Campfire] I got an activate!")
		int i = GetCurrentTentType()
		debug.trace("[Campfire] GetCurrentTentType " + i)
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
	ObjectReference myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_TentActivators, PlayerRef, 150.0)
	if myTent
		myTent.Activate(PlayerRef)
	endif
endFunction

Event OnUpdate()
	if _Camp_Setting_FollowerPolling.GetValueInt() != 0
		SyncFollowers()
		RegisterForSingleUpdate(8)
	endif
endEvent

function SyncFollowers()
	;The order that the aliases are filled each cycle is not known, so we have to
	;"debounce" by storing the results locally and not clearing out the local
	;variable unless necessary, to prevent a follower's reference from bouncing
	;between variables.

	bool myF1Found = false
	bool myF2Found = false
	bool myF3Found = false

	if StaticFollower1.GetActorRef() != None
		if StaticFollower1.GetActorRef() == Follower1.GetActorRef()
			myF1Found = true
		elseif StaticFollower1.GetActorRef() == Follower2.GetActorRef()
			myF1Found = true
		elseif StaticFollower1.GetActorRef() == Follower3.GetActorRef()
			myF1Found = true
		endif
	endif
	if myF1Found == false
		;I didn't find the locally stored Follower in an alias, remove it
		StaticFollower1.Clear()
	endif

	if StaticFollower2.GetActorRef() != None
		if StaticFollower2.GetActorRef() == Follower1.GetActorRef()
			myF2Found = true
		elseif StaticFollower2.GetActorRef() == Follower2.GetActorRef()
			myF2Found = true
		elseif StaticFollower2.GetActorRef() == Follower3.GetActorRef()
			myF2Found = true
		endif
	endif
	if myF2Found == false
		StaticFollower2.Clear()
	endif

	if StaticFollower3.GetActorRef() != None
		if StaticFollower3.GetActorRef() == Follower1.GetActorRef()
			myF3Found = true
		elseif StaticFollower3.GetActorRef() == Follower2.GetActorRef()
			myF3Found = true
		elseif StaticFollower3.GetActorRef() == Follower3.GetActorRef()
			myF3Found = true
		endif
	endif
	if myF3Found == false
		StaticFollower3.Clear()
	endif

	bool F1Found = false
	bool F2Found = false
	bool F3Found = false
	
	if Follower1.GetActorRef() != None
		if Follower1.GetActorRef() == StaticFollower1.GetActorRef()
			F1Found = true
		elseif Follower1.GetActorRef() == StaticFollower2.GetActorRef()
			F1Found = true
		elseif Follower1.GetActorRef() == StaticFollower3.GetActorRef()
			F1Found = true
		endif
	endif
	if Follower1.GetActorRef() != None && F1Found == false
		;I didn't find the alias stored in a local variable, fill it in somewhere
		if StaticFollower1.GetActorRef() == none
			StaticFollower1.ForceRefTo(Follower1.GetActorRef())
		elseif StaticFollower2.GetActorRef() == none
			StaticFollower2.ForceRefTo(Follower1.GetActorRef())
		elseif StaticFollower3.GetActorRef() == none
			StaticFollower3.ForceRefTo(Follower1.GetActorRef())
		endif
	endif

	if Follower2.GetActorRef() != None
		if Follower2.GetActorRef() == StaticFollower1.GetActorRef()
			F2Found = true
		elseif Follower2.GetActorRef() == StaticFollower2.GetActorRef()
			F2Found = true
		elseif Follower2.GetActorRef() == StaticFollower3.GetActorRef()
			F2Found = true
		endif
	endif
	if Follower2.GetActorRef() != None && F2Found == false
		if StaticFollower1.GetActorRef() == none
			StaticFollower1.ForceRefTo(Follower2.GetActorRef())
		elseif StaticFollower2.GetActorRef() == none
			StaticFollower2.ForceRefTo(Follower2.GetActorRef())
		elseif StaticFollower3.GetActorRef() == none
			StaticFollower3.ForceRefTo(Follower2.GetActorRef())
		endif
	endif

	if Follower3.GetActorRef() != None
		if Follower3.GetActorRef() == StaticFollower1.GetActorRef()
			F3Found = true
		elseif Follower3.GetActorRef() == StaticFollower2.GetActorRef()
			F3Found = true
		elseif Follower3.GetActorRef() == StaticFollower3.GetActorRef()
			F3Found = true
		endif
	endif
	if Follower3.GetActorRef() != None && F3Found == false
		if StaticFollower1.GetActorRef() == none
			StaticFollower1.ForceRefTo(Follower3.GetActorRef())
		elseif StaticFollower2.GetActorRef() == none
			StaticFollower2.ForceRefTo(Follower3.GetActorRef())
		elseif StaticFollower3.GetActorRef() == none
			StaticFollower3.ForceRefTo(Follower3.GetActorRef())
		endif
	endif

	;@TODO: This is probably really crappy, re-do.
	;Update dog alias
	if Dog.GetActorRef() != None
		if Dog.GetActorRef() != StaticDog.GetActorRef()
			;Store the current dog reference
			StaticDog.ForceRefTo(Dog.GetActorRef())
		endif
	else
		StaticDog.Clear()
	endif


	int i = 0
	if StaticFollower1.GetActorRef() != none
		i += 1
	endif
	if StaticFollower2.GetActorRef() != none
		i += 1
	endif
	if StaticFollower3.GetActorRef() != none
		i += 1
	endif
	_Camp_FollowerCount.SetValueInt(i)
	
	if StaticDog.GetActorRef() != none
		_Camp_HasPet.SetValueInt(1)
	else
		_Camp_HasPet.SetValueInt(0)
	endif

	debug.trace("[Campfire] Follower sync complete. Results:")
	debug.trace("[Campfire]     myFollower1: " + StaticFollower1.GetActorRef())
	debug.trace("[Campfire]     myFollower2: " + StaticFollower2.GetActorRef())
	debug.trace("[Campfire]     myFollower3: " + StaticFollower3.GetActorRef())
	debug.trace("[Campfire]     Dog: " + StaticDog.GetActorRef())

endFunction