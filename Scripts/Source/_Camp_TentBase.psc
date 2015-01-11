scriptname _Camp_TentBase extends ObjectReference
{@TODO}

; #SUMMARY# =====================================================================================================================
; Name ...................: _Camp_TentBase
; Attached To (EditorID)..: 
; Description ............: 
; Author .................: Chesko
; Last Approved (version) : 
; Status .................: 
; Remarks ................: 
; ===============================================================================================================================

import math
import utility
import debug
import CampUtil

;Scripts
;@TODO: Resolve at startup
;_DE_EPMonitor_1_6 property Frostfall auto
;@TODO: Resolve at startup

; TO KEEP IN UTIL
_Camp_Compatibility property Compatibility auto
weapon property _Camp_DummyWeapon auto
static property XMarker auto
Actor property PlayerRef auto
GlobalVariable property _DE_Setting_CampingArmorTakeOff auto
GlobalVariable property _Camp_Setting_TakeOff_Helm auto
GlobalVariable property _Camp_Setting_TakeOff_Cuirass auto
GlobalVariable property _Camp_Setting_TakeOff_Gauntlets auto
GlobalVariable property _Camp_Setting_TakeOff_Boots auto
GlobalVariable property _Camp_Setting_TakeOff_Backpack auto
GlobalVariable property _Camp_Setting_TakeOff_Weapons auto
GlobalVariable property _Camp_Setting_TakeOff_Shield auto
GlobalVariable property _Camp_Setting_TakeOff_Ammo auto
;GlobalVariable property _DE_CurrentTemp auto
;GlobalVariable property _DE_ExposurePoints auto
GlobalVariable property _Camp_HelpDone_TentActivate auto
GlobalVariable property _Camp_Setting_Help auto
GlobalVariable property _DE_TentSeeThru auto
GlobalVariable property _DE_FollowersUseBedrollAI auto
message property _DE_CampTent_Placed_ACT_Menu auto
message property _DE_CampTent2_SitMenu auto
message property _DE_CampTent2_SitMenu_Positive auto
message property _DE_CampTent2_LayMenu auto
message property _DE_CampTent2_LayMenu_Positive auto
message property _DE_CampTent2_PickUpError auto
message property _Camp_Tent_Combat auto
message property _DE_Combat_Error auto
message property _Camp_Help_TentActivate auto
Quest property DBEntranceQuest auto
ReferenceAlias property StaticFollower1 auto
ReferenceAlias property StaticFollower2 auto
ReferenceAlias property StaticFollower3 auto
pDBEntranceQuestScript property DBEntranceQuestScript auto
Message property _DE_Help_Tents auto
Message property _DE_TentSeeThruError auto
static property _Camp_Tent_LanternOnGround auto
static property _Camp_Tent_LanternOffGround auto
static property _Camp_Tent_LanternOnHang auto
static property _Camp_Tent_LanternOffHang auto
Light property _Camp_LanternLight auto
static property _Camp_Tent_BedrollHayNoGround01 auto
static property _Camp_Tent_BedrollHayNoGround02 auto
static property _Camp_Tent_BedrollHayNoGround03 auto
static property _Camp_TentWard auto
ObjectReference property _DE_Anchor auto
ImageSpaceModifier property _Camp_FadeDown auto
ImageSpaceModifier property _Camp_FadeUp auto
ImageSpaceModifier property _Camp_Black auto
Sound property ITMGenericArmorUp auto
Armor property _Camp_WalkingStickShield auto
keyword property ClothingBody auto
keyword property ArmorCuirass auto
furniture property _Camp_TentSitMarker auto
furniture property _Camp_TentLayDownMarker auto
furniture property _Camp_TentLayDownMarkerL auto
furniture property _Camp_TentLayDownMarkerR auto
furniture property _Camp_Bedroll_ActualF auto
furniture property _Camp_Bedroll_ActualL auto
furniture property _Camp_Bedroll_ActualR auto
furniture property _Camp_Bedroll_NPC_F auto
furniture property _Camp_Bedroll_NPC_FL auto
furniture property _Camp_Bedroll_NPC_FR auto
furniture property _Camp_Bedroll_NPC_L auto
furniture property _Camp_Bedroll_NPC_R auto

;@From OnUpdate on CampTent / CampTentEx
bool function UpdateTentUseState(ObjectReference myExitFront = None)
	;@TODO: Might need to reintroduce some idea of myActor in order to maintain async state
	;@TODO: Check hit, not combat!
	if PlayerRef.IsInCombat()
		;Player entered combat, kick them out of the tent
		_Camp_FadeDown.Apply()
		wait(0.5)
		_Camp_FadeDown.PopTo(_Camp_Black)
		if myExitFront && PlayerRef.GetDistance(myExitFront) < 1000.0
			PlayerRef.MoveTo(myExitFront)
		else
			;@TODO: Test this
			PlayerRef.MoveTo(PlayerRef)
		endif
		_Camp_Black.PopTo(_Camp_FadeUp)
		_Camp_Tent_Combat.Show()
		return false
	elseif !(PlayerRef.GetSitState() == 2 || PlayerRef.GetSitState() == 3) && !bGettingUp
		;Player getting up from sitting
		if myExitFront && PlayerRef.GetDistance(myExitFront) < 1000.0
			PlayerRef.SplineTranslateToRef(myExitFront, 1.0, 65.0)
		endif
		return false
	else
		return true
	endif
endEvent

;@From OnActivate on CampTent / CampTentEx
Event ActivateTent(ObjectReference akActionRef, ObjectReference myPlayerSitMarker, ObjectReference myPlayerLayDownMarker)	
	if akActionRef == PlayerRef
		int iSitState = (akActionRef as Actor).GetSitState()
		if iSitState == 0
			ShowMainMenu(akActionRef)
		elseif iSitState == 3 && myPlayerSitMarker.IsFurnitureInUse()
			ShowSitMenu(akActionRef)
		elseif iSitState == 3 && myPlayerLayDownMarker.IsFurnitureInUse()
			ShowLayMenu(akActionRef)
		endif
	endif
endEvent

function ShowMainMenu(ObjectReference akActionRef)
	int i = _DE_CampTent_Placed_ACT_Menu.Show()
	if i == 0										;Sit
		if _Camp_Setting_Help.GetValueInt() == 2 && _Camp_HelpDone_TentActivate.GetValueInt() == 1
			;@TODO: Move to Frostfall
			;_DE_Help_Tents.Show()
			Message.ResetHelpMessage("Activate")
			_Camp_Help_TentActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
			_Camp_HelpDone_TentActivate.SetValueInt(2)
		endif
		PlayerSit(akActionRef)
	elseif i == 1									;Lie Down
		if _Camp_Setting_Help.GetValueInt() == 2 && _Camp_HelpDone_TentActivate.GetValueInt() == 1
			;@TODO: Move to Frostfall
			;_DE_Help_Tents.Show()
			Message.ResetHelpMessage("Activate")
			_Camp_Help_TentActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
			_Camp_HelpDone_TentActivate.SetValueInt(2)
		endif
		PlayerLieDown(akActionRef)
	elseif i == 2									;Pack
		PackTent()
	elseif i == 3									;Lantern
		ToggleLantern()
	else
		;exit
	endif
endFunction

function ShowSitMenu(ObjectReference akActionRef)
	;float myEP
	;@TODO: Wrap in IsFrostfallLoaded, otherwise display alternate message
	;/if _DE_ExposurePoints.GetValueInt() > 120.0				;Don't show the player that it is greater than 120 - will self-correct next cycle
		myEP = 120
	else
		myEP = _DE_ExposurePoints.GetValueInt()
	endif

	int i 
	if myEP > 100
		i = _DE_CampTent2_SitMenu_Positive.Show(myEP - 100, ((Frostfall.pWetPoints/750) * 100))
	else
		i = _DE_CampTent2_SitMenu.Show(myEP - 100, ((Frostfall.pWetPoints/750) * 100))
	endif/;
	int i
	i = _DE_CampTent2_SitMenu.Show(0, 0)
	if i == 0										;Wait
		ToggleLantern()
	elseif i == 1
		if IsRefInInterior(PlayerRef)
			_DE_TentSeeThruError.Show()
		else
			if myTentExterior.IsDisabled()
				_DE_TentSeeThru.SetValue(1)
				if myTentExterior
					myTentExterior.Enable(true)
				endif
			else
				_DE_TentSeeThru.SetValue(2)
				if myTentExterior
					myTentExterior.Disable(true)
				endif
			endif
		endif
	elseif i == 2
		myPlayerSitMarker.Activate(PlayerRef)
		StopFollowerUse()
	elseif i == 3
		;do nothing
	endif
endFunction

function ShowLayMenu(ObjectReference akActionRef)
	;float myEP
	;@TODO: Wrap in IsFrostfallLoaded, otherwise display alternate message
	;/if _DE_ExposurePoints.GetValueInt() > 120.0				;Don't show the player that it is greater than 120 - will self-correct next cycle
		myEP = 120
	else
		myEP = _DE_ExposurePoints.GetValueInt()
	endif		
	int i
	if myEP > 100
		i = _DE_CampTent2_LayMenu_Positive.Show(myEP - 100, ((Frostfall.pWetPoints/750) * 100))
	else
		i = _DE_CampTent2_LayMenu.Show(myEP - 100, ((Frostfall.pWetPoints/750) * 100))
	endif/;
	int i
	i = _DE_CampTent2_LayMenu.Show(0, 0)
	if i == 0										;Sleep
		bGettingUp = true
		_Camp_FadeDown.Apply()
		wait(1.0)
		_Camp_FadeDown.PopTo(_Camp_Black)
		if PlayerRef
			PlayerRef.MoveTo(self)			;Get up
			wait(0.4)
			myBedRoll.Activate(PlayerRef)		;Spawns sleep menu
			wait(0.4)
			myPlayerLayDownMarker.Activate(PlayerRef)				
			wait(3.5)
			ApplySnow()
			_Camp_Black.PopTo(_Camp_FadeUp)
		else
			;Something went wrong, make sure that the player's vision is restored!
			_Camp_Black.PopTo(_Camp_FadeUp)
		endif
		bGettingUp = false
	elseif i == 1									;Lantern
		ToggleLantern()
	elseif i == 2 									;Toggle View
		if IsRefInInterior(PlayerRef)
			_DE_TentSeeThruError.Show()
		else
			if myTentExterior.IsDisabled()
				_DE_TentSeeThru.SetValue(1)
				if myTentExterior
					myTentExterior.Enable(true)
				endif
			else
				_DE_TentSeeThru.SetValue(2)
				if myTentExterior
					myTentExterior.Disable(true)
				endif
			endif
		endif
	elseif i == 3									;Get Up
		myPlayerLayDownMarker.Activate(PlayerRef)
		StopFollowerUse()
	elseif i == 3									;Nothing
		;do nothing
	endif
endFunction

function ToggleLantern()
	if bLanternLit
		TryToDisableRef(myLanternLit)
		TryToDisableRef(myLanternLit2)
		TryToDisableRef(myLanternLit3)

		TryToEnableRef(myLanternUnlit)
		TryToEnableRef(myLanternUnlit2)
		TryToEnableRef(myLanternUnlit3)
		
		TryToDisableRef(myLanternLight)
		TryToDisableRef(myLanternLight2)
		TryToDisableRef(myLanternLight3)
		bLanternLit = false
	else
		TryToEnableRef(myLanternLit)
		TryToEnableRef(myLanternLit2)
		TryToEnableRef(myLanternLit3)

		TryToDisableRef(myLanternUnlit)
		TryToDisableRef(myLanternUnlit2)
		TryToDisableRef(myLanternUnlit3)
		
		TryToEnableRef(myLanternLight)
		TryToEnableRef(myLanternLight2)
		TryToEnableRef(myLanternLight3)
		bLanternLit = true
	endif
endFunction

function PlayerSit(ObjectReference akActionRef)

	TryToMakeFollowersUse()

	Game.ForceThirdPerson()
	myPlayerSitMarker.Activate(PlayerRef)
	if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
		;@TODO: Use new gear processing function	
		;if Frostfall.GetFireState() || _DE_CurrentTemp.GetValue() >= 6.0 || Frostfall.bInInterior
			DisplayPlayerTentEquipment()
		;else
		;	DisplayPlayerTentEquipment(true)
		;endif
	endif
	if _DE_TentSeeThru.GetValueInt() == 2 && myTentExterior
		myTentExterior.Disable(true)
	endif
	Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
	;wait(3.0)
	;if !(PlayerRef.IsInCombat())
	;	ShowSitMenu(akActionRef)
	;endif
	RegisterForSingleUpdate(0.5)
endFunction

function DisplayPlayerTentEquipment(bool bLimited = false)
	if bLimited == false
		if _Camp_Setting_TakeOff_Helm.GetValueInt() == 1
			DisplayHelm_Player()
		endif
		if _Camp_Setting_TakeOff_Cuirass.GetValueInt() == 1
			DisplayCuirass_Player()
		endif
		if _Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 1
			DisplayGauntlets_Player()
		endif
		if _Camp_Setting_TakeOff_Boots.GetValueInt() == 1
			DisplayBoots_Player()
		endif
	endif
	if _Camp_Setting_TakeOff_Weapons.GetValueInt() == 1
		DisplayWeapons_Player()
	endif
	if _Camp_Setting_TakeOff_Shield.GetValueInt() == 1
		DisplayShield_Player()
	endif
	if _Camp_Setting_TakeOff_Ammo.GetValueInt() == 1
		DisplayQuiver_Player()
	endif
	if _Camp_Setting_TakeOff_Backpack.GetValueInt() == 1
		DisplayBackpack_Player()
	endif
endFunction

function PlayerLieDown(ObjectReference akActionRef)

	;===============================Frostfall 2.3 / Skyrim 1.9 Update===================================
	;
	;  Skyrim 1.9 has broken the player's eyes from re-opening if you lie down (sleepstate = 4).
	;  Using alternative lie down animation.
	;
	;===================================================================================================
	
	;Don't lie down in tent if on the Dark Brotherhood entrance quest
	if DBEntranceQuest.GetStage() == 20 && DBEntranceQuestScript.pSleepyTime == 1
		myBedRoll.Activate(akActionRef)
		return
	endif

	;Don't lie down in tent if DLC2 is loaded, the player is in Solstheim, and DLC2MQ03B isn't complete yet
	if Compatibility.isDLC2Loaded
		Quest DLC2MQ03B = Game.GetFormFromFile(0x02035440, "Dragonborn.esm") as Quest
		Location DLC2SolstheimLocation = Game.GetFormFromFile(0x02016E2A, "Dragonborn.esm") as Location
		Worldspace DLC2SolstheimWorld = Game.GetFormFromFile(0x02000800, "Dragonborn.esm") as Worldspace

		if DLC2MQ03B.IsCompleted() == false && PlayerRef.IsInLocation(DLC2SolstheimLocation)
			if PlayerRef.GetWorldspace() == DLC2SolstheimWorld
				myBedRoll.Activate(akActionRef)
				return
			endif
		endif
	endif

	TryToMakeFollowersUse()

	Game.ForceThirdPerson()
	myPlayerLayDownMarker.Activate(PlayerRef)
	if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
		;@TODO: Wrap in IsFrostfallLoaded
		
		;if Frostfall.GetFireState() || _DE_CurrentTemp.GetValue() >= 10.0 || Frostfall.bInInterior
			DisplayPlayerTentEquipment()
		;else
		;	DisplayPlayerTentEquipment(true)
		;endif
	endif
	if _DE_TentSeeThru.GetValueInt() == 2 && myTentExterior
		myTentExterior.Disable(true)
	endif
	Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
	;wait(3.0)
	;if !(PlayerRef.IsInCombat())
	;	ShowLayMenu(akActionRef)
	;endif
	RegisterForSingleUpdate(0.5)
	
endFunction

function ApplySnow()
	
	Weather myWeather = Weather.GetCurrentWeather()

	bool bShowExterior = false
	if myTentExterior == none
		bShowExterior = true
	endif

	if myWeather.GetClassification() == 3
		if Compatibility.isDLC2Loaded
			if myWeather == Compatibility.DLC2AshStorm
				myTentExterior = myAshTent
			else
				myTentExterior = mySnowTent
			endif
		else
			myTentExterior = mySnowTent
		endif
	else
		if myTentExterior == mySnowTent || myTentExterior == myAshTent
			return
		endif
		myTentExterior = myNormalTent
	endif

	if bShowExterior
		myNormalTent.Disable()
		mySnowTent.Disable()
		myAshTent.Disable()
		if myTentExterior
			myTentExterior.Enable(true)
		endif
	endif

endFunction

function TryToMakeFollowersUse()
	;debug.trace("[Frostfall] Trying to make NPC sleep...")
	;Move bedroll out of range of NPCs, so they won't path here
	myBedRoll.SetPosition(myBedRoll.GetPositionX(), myBedRoll.GetPositionY(), myBedRoll.GetPositionZ() + 3000.0)
	_DE_FollowersUseBedrollAI.SetValueInt(1)
endFunction

function StopFollowerUse()
	;debug.trace("[Frostfall] Trying to make NPC stop sleeping...")
	;Move bedroll back in range
	myBedRoll.SetPosition(self.GetPositionX(), self.GetPositionY(), self.GetPositionZ())
	_DE_FollowersUseBedrollAI.SetValueInt(0)
endFunction

float[] function GetPosXYZRotateAroundRef(ObjectReference akOrigin, ObjectReference akObject, float fAngleX, float fAngleY, float fAngleZ)

	;-----------\
	;Description \ 
	;----------------------------------------------------------------
	;Rotates a point (akObject) offset from the center of 
	;rotation (akOrigin) by the supplied degrees fAngleX, fAngleY,
	;fAngleZ, and returns the new position of the point.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		fNewPos[0]	= 	The new X position of the point
	;		fNewPos[1]	= 	The new Y position of the point
	;		fNewPos[2]	= 	The new Z position of the point

	;				|1			0			0		|
	;Rx(t) = 		|0			cos(t)		-sin(t)	|
	;				|0			sin(t)		cos(t)	|
	;
	;				|cos(t)		0			sin(t)	|
	;Ry(t) =		|0			1			0		|
	;				|-sin(t)	0			cos(t)	|
	;
	;				|cos(t)		-sin(t)		0		|
	;Rz(t) = 		|sin(t)		cos(t)		0		|
	;				|0			0			1		|
	
	;R * v = Rv, where R = rotation matrix, v = column vector of point [ x y z ], Rv = column vector of point after rotation
		
	fAngleX = -(fAngleX)
	fAngleY = -(fAngleY)
	fAngleZ = -(fAngleZ)
	
	float myOriginPosX = akOrigin.GetPositionX()
	float myOriginPosY = akOrigin.GetPositionY()
	float myOriginPosZ = akOrigin.GetPositionZ()
	
	float fInitialX = akObject.GetPositionX() - myOriginPosX
	float fInitialY = akObject.GetPositionY() - myOriginPosY
	float fInitialZ = akObject.GetPositionZ() - myOriginPosZ
	
	float fNewX
	float fNewY
	float fNewZ
	
	;Objects in Skyrim are rotated in order of Z, Y, X, so we will do that here as well.
	
	;Z-axis rotation matrix
	float fVectorX = fInitialX
	float fVectorY = fInitialY
	float fVectorZ = fInitialZ
	fNewX = (fVectorX * cos(fAngleZ)) + (fVectorY * sin(-fAngleZ)) + (fVectorZ * 0)
	fNewY = (fVectorX * sin(fAngleZ)) + (fVectorY * cos(fAngleZ)) + (fVectorZ * 0)
	fNewZ = (fVectorX * 0) + (fVectorY * 0) + (fVectorZ * 1)	
	
	;Y-axis rotation matrix
	fVectorX = fNewX
	fVectorY = fNewY
	fVectorZ = fNewZ
	fNewX = (fVectorX * cos(fAngleY)) + (fVectorY * 0) + (fVectorZ * sin(fAngleY))
	fNewY = (fVectorX * 0) + (fVectorY * 1) + (fVectorZ * 0)
	fNewZ = (fVectorX * sin(-fAngleY)) + (fVectorY * 0) + (fVectorZ * cos(fAngleY))
	
	;X-axis rotation matrix
	fVectorX = fNewX
	fVectorY = fNewY
	fVectorZ = fNewZ	
	fNewX = (fVectorX * 1) + (fVectorY * 0) + (fVectorZ * 0)
	fNewY = (fVectorX * 0) + (fVectorY * cos(fAngleX)) + (fVectorZ * sin(-fAngleX))
	fNewZ = (fVectorX * 0) + (fVectorY * sin(fAngleX)) + (fVectorZ * cos(fAngleX))
	
	;Return result
	float[] fNewPos = new float[3]
	fNewPos[0] = fNewX
	fNewPos[1] = fNewY
	fNewPos[2] = fNewZ
	return fNewPos 
endFunction

float[] function GetAngleData(ObjectReference akObjectReference)
	float[] myReturnArray = new float[3]
    myReturnArray[0] = akObjectReference.GetAngleX()
    myReturnArray[1] = akObjectReference.GetAngleY()
    myReturnArray[2] = akObjectReference.GetAngleZ()
	return myReturnArray
endFunction

float[] function GetRelativePosition(ObjectReference akOrigin, ObjectReference akObject)
	float[] myRelativePosition = new float[6]
	myRelativePosition[0] = akObject.GetPositionX() - akOrigin.GetPositionX()
	myRelativePosition[1] = akObject.GetPositionY() - akOrigin.GetPositionY()
	myRelativePosition[2] = akObject.GetPositionZ() - akOrigin.GetPositionZ()
	myRelativePosition[3] = akObject.GetAngleX()
	myRelativePosition[4] = akObject.GetAngleY()
	myRelativePosition[5] = akObject.GetAngleZ()
	
	;trace("[FROSTFALL] My relative position is XPos:" + myRelativePosition[0] + ", YPos:" + myRelativePosition[1] + ", ZPos:" + myRelativePosition[2] + "XRot:" + myRelativePosition[3] + ", YRot:" + myRelativePosition[4] + ", ZRot:" + myRelativePosition[5])
	return myRelativePosition
endFunction

ObjectReference function PlaceAtMeRelative(ObjectReference akOrigin, Form akFormToPlace, float[] fOriginAng, float[] fRelativePos, float fZGlobalAngAdjust = 0.0, float fXLocalAngAdjust = 0.0, float fYLocalAngAdjust = 0.0, float fZLocalAngAdjust = 0.0, float fZHangingOffset = 0.0, bool abInvertedLocalY = false, bool abInitiallyDisabled = false, bool abIsPropped = false, bool abIsHanging = false)
	
	ObjectReference myObject
    ObjectReference myTempMarker = akOrigin.PlaceAtMe(XMarker)
	
	myTempMarker.MoveTo(myTempMarker, fRelativePos[0], fRelativePos[1], fRelativePos[2])
    
	float[] myNewPos = new float[3]
    myNewPos = GetPosXYZRotateAroundRef(akOrigin, myTempMarker, fOriginAng[0], fOriginAng[1], fOriginAng[2] + fZGlobalAngAdjust)
    myTempMarker.MoveTo(akOrigin, myNewPos[0], myNewPos[1], myNewPos[2])
	
	if abIsPropped
		if abInvertedLocalY
			myTempMarker.SetAngle(fXLocalAngAdjust, -(fOriginAng[2] + fYLocalAngAdjust), fZLocalAngAdjust)
		else
			myTempMarker.SetAngle(fXLocalAngAdjust, fOriginAng[2] + fYLocalAngAdjust, fZLocalAngAdjust)
		endif
	elseif abIsHanging
		myTempMarker.MoveTo(myTempMarker, afZOffset = fZHangingOffset)
		myTempMarker.SetAngle(0.0, 0.0, myTempMarker.GetAngleZ() + fRelativePos[5] + fZLocalAngAdjust)
	else
		myTempMarker.SetAngle(myTempMarker.GetAngleX() + fRelativePos[3] + fXLocalAngAdjust, myTempMarker.GetAngleY() + fRelativePos[4] + fYLocalAngAdjust, myTempMarker.GetAngleZ() + fRelativePos[5] + fZLocalAngAdjust)
	endif
	
	if abInitiallyDisabled
		myObject = myTempMarker.PlaceAtMe(akFormToPlace, abInitiallyDisabled = true)
	else
		myObject = myTempMarker.PlaceAtMe(akFormToPlace)
	endif
    
	myTempMarker.Disable()
    myTempMarker.Delete()
	
    return myObject
endFunction

function DisplayShield_Player()
	myShield = PlayerRef.GetEquippedShield()
	if myShield == _Camp_WalkingStickShield
		myShield = None
	endif

	if myShield
		PlayerRef.UnequipItem(myShield, abSilent = true)
		if IsRefInInterior(PlayerRef)
			myDisplayShield = PlaceAndWaitFor3DLoaded(myPlayerMarker_ShieldInterior, myShield, bDisableInteraction = true)
		else
			myDisplayShield = PlaceAndWaitFor3DLoaded(myPlayerMarker_Shield, myShield, bDisableInteraction = true)
		endif
	endif
endFunction

function UnDisplayShield_Player()
	if myShield
		PlayerRef.EquipItem(myShield, abSilent = true)
	endif
	TryToDisableAndDeleteRef(myDisplayShield)
endFunction

function DisplayWeapons_Player()
	int iWeaponType = PlayerRef.GetEquippedItemType(1)
	if (iWeaponType <= 4 || iWeaponType == 8) && iWeaponType > 0
		;Player has a one-handed weapon
		myMainWeapon = PlayerRef.GetEquippedWeapon()
		;Does the player have an off-hand weapon?
		int iOffWeaponType = PlayerRef.GetEquippedItemType(0)
		if (iOffWeaponType <= 4 || iOffWeaponType == 8) && iOffWeaponType > 0
			;Player has an off-hand weapon
			myOffHandWeapon = PlayerRef.GetEquippedWeapon(true)
		endif
	elseif iWeaponType == 5 || iWeaponType == 6
		;Player has a two-handed weapon
		myBigWeapon = PlayerRef.GetEquippedWeapon()
	elseif iWeaponType == 7
		myBow = PlayerRef.GetEquippedWeapon()
	endif
	
	if myMainWeapon
		PlayerRef.UnequipItem(myMainWeapon, abSilent = true)
		myDisplayMainWeapon =  PlaceAndWaitFor3DLoaded(myPlayerMarker_MainWeapon, myMainWeapon, bDisableInteraction = true)
	endif
	
	if myOffHandWeapon
		myDisplayOffHandWeapon = PlaceAndWaitFor3DLoaded(myPlayerMarker_OffHandWeapon, myOffHandWeapon, bDisableInteraction = true)
	endif
	
	if myBigWeapon
		UnequipUsingDummyWeapon()
		myDisplayBigWeapon = PlaceAndWaitFor3DLoaded(myPlayerMarker_BigWeapon, myBigWeapon, bDisableInteraction = true)
	endif
	
	if myBow
		UnequipUsingDummyWeapon()
		myDisplayBow = PlaceAndWaitFor3DLoaded(myPlayerMarker_Bow, myBow, bDisableInteraction = true)
	endif
endfunction

function UnDisplayWeapons_Player()
	
	if myMainWeapon
		PlayerRef.EquipItem(myMainWeapon, abSilent = true)
		myMainWeapon = none
	endif
	TryToDisableAndDeleteRef(myDisplayMainWeapon)
	
	if myOffHandWeapon
		myOffHandWeapon = none
	endif
	TryToDisableAndDeleteRef(myDisplayOffHandWeapon)

	if myBigWeapon
		PlayerRef.EquipItem(myBigWeapon, abSilent = true)
		myBigWeapon = none
	endif
	TryToDisableAndDeleteRef(myDisplayBigWeapon)
	
	if myBow
		PlayerRef.EquipItem(myBow, abSilent = true)
		myBow = none
	endif
	TryToDisableAndDeleteRef(myDisplayBow)
	
endFunction

function DisplayWeapon_Follower()
	;myFollowerAMarker
endFunction

function UnDisplayWeapon_Follower()

endFunction

function DisplayCuirass_Player()
	myCuirass = GetPlayerEquippedBody()
	if myCuirass
		PlayerRef.UnequipItem(myCuirass, abSilent = true)
		myDisplayCuirass = PlaceAndWaitFor3DLoaded(myPlayerMarker_Cuirass, myCuirass, bDisableInteraction = true)
	endif
endFunction

function UnDisplayCuirass_Player()
	if myCuirass
		PlayerRef.EquipItem(myCuirass, abSilent = true)
	endif
	TryToDisableAndDeleteRef(myDisplayCuirass)
endFunction

function DisplayBoots_Player()
	myBoots = GetPlayerEquippedFeet()
	if myBoots && !myBoots.HasKeyword(ClothingBody) && !myBoots.HasKeyword(ArmorCuirass)
		PlayerRef.UnequipItem(myBoots, abSilent = true)
		myDisplayBoots = PlaceAndWaitFor3DLoaded(myPlayerMarker_Boots, myBoots, bDisableInteraction = true)
	endif
endFunction

function UnDisplayBoots_Player()
	if myBoots
		PlayerRef.EquipItem(myBoots, abSilent = true)
	endif
	TryToDisableAndDeleteRef(myDisplayBoots)
endFunction

function DisplayGauntlets_Player()
	myGauntlets = GetPlayerEquippedHands()
	if myGauntlets && !myGauntlets.HasKeyword(ClothingBody) && !myGauntlets.HasKeyword(ArmorCuirass)
		PlayerRef.UnequipItem(myGauntlets, abSilent = true)
		myDisplayGauntlets = PlaceAndWaitFor3DLoaded(myPlayerMarker_Gauntlets, myGauntlets, bDisableInteraction = true)
	endif
endFunction

function UnDisplayGauntlets_Player()
	if myGauntlets
		PlayerRef.EquipItem(myGauntlets, abSilent = true)
	endif
	TryToDisableAndDeleteRef(myDisplayGauntlets)
endFunction

function DisplayHelm_Player()
	myHelm = GetPlayerEquippedHead()
	if myHelm && !myHelm.HasKeyword(ClothingBody) && !myHelm.HasKeyword(ArmorCuirass)
		PlayerRef.UnequipItem(myHelm, abSilent = true)
		myDisplayHelm = PlaceAndWaitFor3DLoaded(myPlayerMarker_Helm, myHelm, bDisableInteraction = true)
	endif
endfunction

function UnDisplayHelm_Player()
	if myHelm
		PlayerRef.EquipItem(myHelm, abSilent = true)
	endif
	TryToDisableAndDeleteRef(myDisplayHelm)
endFunction

function DisplayQuiver_Player()
	;Just unequip the quiver
	myQuiver = GetPlayerEquippedAmmo()
	if myQuiver
		PlayerRef.UnequipItem(myQuiver, abSilent = true)
	endif
endfunction

function UnDisplayQuiver_Player()
	;Just re-equip the quiver
	if myQuiver
		PlayerRef.EquipItem(myQuiver, abSilent = true)
	endif
endFunction

function DisplayBackpack_Player()
	myBackpack = GetPlayerEquippedBackpack()
	if myBackpack
		PlayerRef.UnequipItem(myBackpack, abSilent = true)
		myDisplayBackpack = PlaceAndWaitFor3DLoaded(myPlayerMarker_Backpack, myBackpack, bDisableInteraction = true)
	endif
endfunction

function UnDisplayBackpack_Player()
	if myBackpack
		PlayerRef.EquipItem(myBackpack, abSilent = true)
	endif
	TryToDisableAndDeleteRef(myDisplayBackpack)
endFunction

function PackTent()
	;Are any of the bed rolls in use?
	if myBedRoll
		if myBedRoll.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if mySpareBedRoll1
		if mySpareBedRoll1.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if mySpareBedRoll2
		if mySpareBedRoll2.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if mySpareBedRoll3
		if mySpareBedRoll3.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	
	;Move activation trigger to the anchor
	;@TODO: Remove
	;_DE_Tent_InteractTriggerREF.MoveTo(_DE_Anchor)

	;Delete display models, if any
	UnDisplayShield_Player()
	UnDisplayWeapons_Player()
	UnDisplayCuirass_Player()
	UnDisplayBoots_Player()
	UnDisplayGauntlets_Player()
	UnDisplayHelm_Player()
	UnDisplayQuiver_Player()
	UnDisplayBackpack_Player()	
	
	;Delete markers and furniture
	TryToDisableAndDeleteRef(myPlayerMarker_MainWeapon)
	TryToDisableAndDeleteRef(myPlayerMarker_OffHandWeapon)
	TryToDisableAndDeleteRef(myPlayerMarker_BigWeapon)
	TryToDisableAndDeleteRef(myPlayerMarker_Bow)
	TryToDisableAndDeleteRef(myPlayerMarker_Cuirass)
	TryToDisableAndDeleteRef(myPlayerMarker_Helm)
	TryToDisableAndDeleteRef(myPlayerMarker_Boots)
	TryToDisableAndDeleteRef(myPlayerMarker_Gauntlets)
	TryToDisableAndDeleteRef(myPlayerMarker_Backpack)
	TryToDisableAndDeleteRef(myPlayerMarker_Shield)
	TryToDisableAndDeleteRef(myPlayerMarker_ShieldInterior)
	TryToDisableAndDeleteRef(myClutter1)
	TryToDisableAndDeleteRef(myClutter2)
	TryToDisableAndDeleteRef(myClutter3)
	TryToDisableAndDeleteRef(myClutter4)
	TryToDisableAndDeleteRef(myClutter5)
	TryToDisableAndDeleteRef(myClutter6)
	TryToDisableAndDeleteRef(myClutter7)
	TryToDisableAndDeleteRef(myClutter8)
	TryToDisableAndDeleteRef(myClutter9)
	TryToDisableAndDeleteRef(myClutter10)
	TryToDisableAndDeleteRef(myPlayerSitMarker)
	TryToDisableAndDeleteRef(myPlayerLayDownMarker)
	TryToDisableAndDeleteRef(myExitFront)
	TryToDisableAndDeleteRef(myBedRoll)
	TryToDisableAndDeleteRef(myWard)
	TryToDisableAndDeleteRef(myLanternLit)
	TryToDisableAndDeleteRef(myLanternUnlit)
	TryToDisableAndDeleteRef(myLanternLight)
	TryToDisableAndDeleteRef(myLanternLit2)
	TryToDisableAndDeleteRef(myLanternUnlit2)
	TryToDisableAndDeleteRef(myLanternLight2)
	TryToDisableAndDeleteRef(myLanternLit3)
	TryToDisableAndDeleteRef(myLanternUnlit3)
	TryToDisableAndDeleteRef(myLanternLight3)
	TryToDisableAndDeleteRef(mySpareBedRoll1)
	TryToDisableAndDeleteRef(mySpareBedRoll2)
	TryToDisableAndDeleteRef(mySpareBedRoll3)
	TryToDisableAndDeleteRef(mySnowTent)
	TryToDisableAndDeleteRef(myAshTent)
	TryToDisableAndDeleteRef(myNormalTent)
	TryToDisableAndDeleteRef(myTent)
	
	wait(0.2)
	PlayerRef.AddItem(TentMiscItem, abSilent = true)
	ITMGenericArmorUp.Play(self)

	StopFollowerUse()
	
	;Finally, delete myself
	self.Disable()
	self.Delete()
endFunction

function CleanUpTent(Activator TentActivator)
	CampTentEx TentObject = TentActivator as CampTentEx
	if !TentObject
		TentObject = TentActivator as CampTent
	endif
	StopFollowerUse()
	Game.EnablePlayerControls()
	UnDisplayShield_Player(TentObject.myShield)
	UnDisplayWeapons_Player(TentObject.myMainWeapon, TentObject.myOffHandWeapon, TentObject.myBigWeapon, TentObject.myBow)
	UnDisplayCuirass_Player(TentObject.myCuirass)
	UnDisplayBoots_Player(TentObject.myBoots)
	UnDisplayGauntlets_Player(TentObject.myGauntlets)
	UnDisplayHelm_Player(TentObject.myHelm)
	UnDisplayQuiver_Player(TentObject.myQuiver)
	UnDisplayBackpack_Player(TentObject.myBackpack)

	if TentObject.myTentExterior
		TentObject.myTentExterior.Enable(true)
	endif
	PlayerRef = none
endFunction

function UnequipUsingDummyWeapon()
	PlayerRef.AddItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.EquipItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.UnEquipItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.RemoveItem(_Camp_DummyWeapon, abSilent = true)
endFunction

;@TODO: Settle on Follower support approach
;/ObjectReference property Spare1LastUser auto
ObjectReference property Spare2LastUser auto
ObjectReference property Spare3LastUser auto

function DispatchSpareBedrollEvent(ObjectReference akBedroll, ObjectReference akActionRef, bool InUse)
	if InUse
		debug.trace("[Frostfall] Bedroll " + akBedroll + " in use by " + akActionRef)
		if akBedroll == mySpareBedRoll1
			DoSpareBedroll1Event(akActionRef)
		elseif akBedroll == mySpareBedRoll2
			DoSpareBedroll2Event(akActionRef)
		elseif akBedroll == mySpareBedRoll3
			DoSpareBedroll3Event(akActionRef)
		endif
	else
		debug.trace("[Frostfall] Bedroll " + akBedroll + " no longer in use.")
		if akBedroll == mySpareBedRoll1
			
		elseif akBedroll == mySpareBedRoll2
			
		elseif akBedroll == mySpareBedRoll3
			
		endif
	endif
endFunction

function DoSpareBedroll1Event(ObjectReference akActionRef)
	if akActionRef == Frostfall.StaticFollower1.GetActorRef()
		Spare1LastUser = akActionRef

		int iWeaponType = akActionRef.GetEquippedItemType(1)
		if (iWeaponType <= 4 || iWeaponType == 8) && iWeaponType > 0
			;Follower has a one-handed weapon
			myFollowerAMainWeapon = akActionRef.GetEquippedWeapon()
			;Does the Follower have an off-hand weapon?
			int iOffWeaponType = akActionRef.GetEquippedItemType(0)
			if (iOffWeaponType <= 4 || iOffWeaponType == 8) && iOffWeaponType > 0
				;Follower has an off-hand weapon
				myFollowerAOffHandWeapon = akActionRef.GetEquippedWeapon(true)
			endif
		elseif iWeaponType == 5 || iWeaponType == 6
			;Follower has a two-handed weapon
			myFollowerABigWeapon = akActionRef.GetEquippedWeapon()
		elseif iWeaponType == 7
			myFollowerABow = akActionRef.GetEquippedWeapon()
		endif
	
		if myFollowerAMainWeapon
			akActionRef.UnequipItem(myFollowerAMainWeapon, abSilent = true)
			if Frostfall.bInInterior
				myDisplayFollowerAMainWeapon = myFollowerAMarker_MainWeapon.PlaceAtMe(myFollowerAMainWeapon)
			else
				if myFollowerAMainWeapon != _DE_WalkingStickWarAxe
					myDisplayFollowerAMainWeapon = myPlayerMarker_MainWeapon.PlaceAtMe(myFollowerAMainWeapon)
				endif
			endif
			if myDisplayFollowerAMainWeapon
				while !myDisplayFollowerAMainWeapon.Is3DLoaded()
				endwhile
				myDisplayFollowerAMainWeapon.SetMotionType(Motion_Keyframed)
				myDisplayFollowerAMainWeapon.BlockActivation()
			endif
		endif
	
		if myFollowerAOffHandWeapon
			if Frostfall.bInInterior
				myDisplayFollowerAOffHandWeapon = myFollowerAMarker_OffHandWeapon.PlaceAtMe(myFollowerAOffHandWeapon)
			else
				if myFollowerAOffHandWeapon != _DE_WalkingStickWarAxe
					myDisplayFollowerAOffHandWeapon = myFollowerAMarker_OffHandWeapon.PlaceAtMe(myFollowerAOffHandWeapon)
				endif
			endif
			if myDisplayFollowerAOffHandWeapon
				while !myDisplayFollowerAOffHandWeapon.Is3DLoaded()
				endwhile
				myDisplayFollowerAOffHandWeapon.SetMotionType(Motion_Keyframed)
				myDisplayFollowerAOffHandWeapon.BlockActivation()
			endif
		endif
		
		if myFollowerABigWeapon
			UnequipUsingDummyWeapon()
			myDisplayBigWeapon = myPlayerMarker_BigWeapon.PlaceAtMe(myFollowerABigWeapon)
			if myDisplayBigWeapon
				while !myDisplayBigWeapon.Is3DLoaded()
				endwhile
				myDisplayBigWeapon.SetMotionType(Motion_Keyframed)
				myDisplayBigWeapon.BlockActivation()
			endif
		endif
		
		if myBow
			UnequipUsingDummyWeapon()
			myDisplayBow = myPlayerMarker_Bow.PlaceAtMe(myBow)
			if myDisplayBow
				while !myDisplayBow.Is3DLoaded()
				endwhile
				myDisplayBow.SetMotionType(Motion_Keyframed)
				myDisplayBow.BlockActivation()
			endif
		endif



	;elseif akActionRef == Frostfall.StaticFollower2.GetActorRef()

	;elseif akActionRef == Frostfall.StaticFollower3.GetActorRef()

	endif
endFunction

function DoSpareBedroll2Event(ObjectReference akActionRef)

endFunction

function DoSpareBedroll3Event(ObjectReference akActionRef)

endFunction
/;