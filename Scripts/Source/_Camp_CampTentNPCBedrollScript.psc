Scriptname _Camp_CampTentNPCBedrollScript extends ObjectReference  

import CampUtil

; Resolved in CK
Actor property PlayerRef auto
message property _Camp_Tent_FollowerBedroll auto

; Set by Tent Object at runtime
CampTent property TentObject auto hidden
int property FollowerBedrollIndex = 0 auto hidden

Event OnInit()
	self.BlockActivation()
endEvent

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef as Actor) == PlayerRef
		_Camp_Tent_FollowerBedroll.Show()
	elseif IsTrackedFollower(akActionRef as Actor)
		self.BlockActivation(false)
		utility.wait(0.2)
		self.Activate(akActionRef)
		DisplayGear(akActionRef as Actor)
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
		TentObject.SetFollowerMainWeapon(FollowerBedrollIndex, akActor.GetEquippedWeapon())
		;Does the Follower have an off-hand weapon?
		int iOffWeaponType = akActor.GetEquippedItemType(0)
		if (iOffWeaponType <= 4 || iOffWeaponType == 8) && iOffWeaponType > 0
			;Follower has an off-hand weapon
			TentObject.SetFollowerOffHandWeapon(FollowerBedrollIndex, akActor.GetEquippedWeapon(true))
		endif
	elseif iWeaponType == 5 || iWeaponType == 6
		;Follower has a two-handed weapon
		TentObject.SetFollowerBigWeapon(FollowerBedrollIndex, akActor.GetEquippedWeapon())
	elseif iWeaponType == 7
		TentObject.SetFollowerBowWeapon(FollowerBedrollIndex, akActor.GetEquippedWeapon())
	endif
	
	TentObject.SetFollowerDisplayMainWeapon(FollowerBedrollIndex)
	TentObject.SetFollowerDisplayOffHandWeapon(FollowerBedrollIndex)
	TentObject.SetFollowerDisplayBigWeapon(FollowerBedrollIndex)
	TentObject.SetFollowerDisplayBowWeapon(FollowerBedrollIndex)

	if TentObject.GetFollowerMainWeapon(FollowerBedrollIndex)
		akActor.UnequipItem(TentObject.GetFollowerMainWeapon(FollowerBedrollIndex), abSilent = true)

		TentObject.myDisplayMainWeapon =  PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_MainWeapon, TentObject.myMainWeapon, bDisableInteraction = true)
	endif
	
	if TentObject.myOffHandWeapon
		TentObject.myDisplayOffHandWeapon = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_OffHandWeapon, TentObject.myOffHandWeapon, bDisableInteraction = true)
	endif
	
	if TentObject.myBigWeapon
		UnequipUsingDummyWeapon()
		TentObject.myDisplayBigWeapon = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_BigWeapon, TentObject.myBigWeapon, bDisableInteraction = true)
	endif
	
	if TentObject.myBow
		UnequipUsingDummyWeapon()
		TentObject.myDisplayBow = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_Bow, TentObject.myBow, bDisableInteraction = true)
	endif
endFunction

function UnDisplayGear()

endFunction