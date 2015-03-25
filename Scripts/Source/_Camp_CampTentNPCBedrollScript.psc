Scriptname _Camp_CampTentNPCBedrollScript extends ObjectReference  

import CampUtil
import TentSystem

; Resolved in CK
Actor property PlayerRef auto
message property _Camp_Tent_FollowerBedroll auto
Armor property _Camp_WalkingStickShield auto

; Set by CampTent at runtime
CampTent property TentObject auto hidden
int property FollowerBedrollIndex = 0 auto hidden

Actor my_actor

function Setup(CampTent tent_object, int bedroll_index)
	TentObject = tent_object
	FollowerBedrollIndex = bedroll_index
endFunction

Event OnInit()
	self.BlockActivation()
endEvent

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef as Actor) == PlayerRef
		_Camp_Tent_FollowerBedroll.Show()
	elseif IsTrackedFollower(akActionRef as Actor)
		self.BlockActivation(false)
		utility.wait(0.2)
		my_actor = akActionRef as Actor
		self.Activate(my_actor)
		DisplayGear(my_actor)
		utility.wait(0.5)
		self.BlockActivation()
		RegisterForSingleUpdate(1)
	endif
endEvent

event OnUpdate()
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(1)
	else
		UnDisplayGear()
	endif
endEvent

function DisplayGear(Actor akActor)
	int iWeaponType = akActor.GetEquippedItemType(1)
	if (iWeaponType <= 4 || iWeaponType == 8) && iWeaponType > 0
		;Follower has a one-handed weapon
		TentSystem.SetFollowerMainWeapon(TentObject, FollowerBedrollIndex, akActor.GetEquippedWeapon())
		;Does the Follower have an off-hand weapon?
		int iOffWeaponType = akActor.GetEquippedItemType(0)
		if (iOffWeaponType <= 4 || iOffWeaponType == 8) && iOffWeaponType > 0
			;Follower has an off-hand weapon
			TentSystem.SetFollowerOffHandWeapon(TentObject, FollowerBedrollIndex, akActor.GetEquippedWeapon(true))
		endif
	elseif iWeaponType == 5 || iWeaponType == 6
		;Follower has a two-handed weapon
		TentSystem.SetFollowerBigWeapon(TentObject, FollowerBedrollIndex, akActor.GetEquippedWeapon())
	elseif iWeaponType == 7
		TentSystem.SetFollowerBowWeapon(TentObject, FollowerBedrollIndex, akActor.GetEquippedWeapon())
	endif

	TentObject.myShield = PlayerRef.GetEquippedShield()
	Armor fshield = akActor.GetEquippedShield()
	if !(fshield == _Camp_WalkingStickShield)
		TentSystem.SetFollowerShield(TentObject, FollowerBedrollIndex, akActor.GetEquippedShield())
	endif
	
	TentSystem.SetFollowerDisplayMainWeapon(TentObject, FollowerBedrollIndex)
	TentSystem.SetFollowerDisplayOffHandWeapon(TentObject, FollowerBedrollIndex)
	TentSystem.SetFollowerDisplayBigWeapon(TentObject, FollowerBedrollIndex)
	TentSystem.SetFollowerDisplayBowWeapon(TentObject, FollowerBedrollIndex)

	;Shield should not be visible as part of the animation.
	;akActor.UnequipItem(fshield, abSilent = true)
	if !IsRefInInterior(akActor)
		TentSystem.SetFollowerDisplayShield(TentObject, FollowerBedrollIndex)
	endif
	
endFunction

function UnDisplayGear()
	TentSystem.UnDisplayFollowerMainWeapon(TentObject, FollowerBedrollIndex, my_actor)
	TentSystem.UnDisplayFollowerOffHandWeapon(TentObject, FollowerBedrollIndex, my_actor)
	TentSystem.UnDisplayFollowerBigWeapon(TentObject, FollowerBedrollIndex, my_actor)
	TentSystem.UnDisplayFollowerBowWeapon(TentObject, FollowerBedrollIndex, my_actor)
	TentSystem.UnDisplayFollowerShield(TentObject, FollowerBedrollIndex, my_actor)
	my_actor = none
endFunction

function CleanUp()
	UnDisplayGear()
endFunction