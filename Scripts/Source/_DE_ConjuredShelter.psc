scriptname _DE_ConjuredShelter extends ObjectReference
{Generic Conjured Shelter class that other shelter activators extend.}

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_ConjuredShelter
; Attached To (EditorID)..: 
; Description ............: Generic Conjured Shelter class that other shelter activators extend.
; Author .................: Chesko
; Last Approved (version) : 2.5
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

import math
import utility
import debug

bool bTryingToSleep = false
bool bTryingToDispel = false

;Misc
float property ShelterID auto hidden
int property mySoundID auto hidden
static property XMarker auto

;Object locations
float[] property myOriginAng auto hidden
float[] property mySphere_Pos auto hidden
float[] property myLight_Pos auto hidden
float[] property myLightSource_Pos auto hidden
float[] property myPlate_Pos auto hidden
float[] property myCup_Pos auto hidden
float[] property myTable_Pos auto hidden
float[] property myChest_Pos auto hidden
float[] property myTanningRack_Pos auto hidden
float[] property myEnchanting_Pos auto hidden
float[] property myEnchantingTable_Pos auto hidden
float[] property myAlchemy_Pos auto hidden
float[] property myAlchemyTable_Pos auto hidden
float[] property myFireplace_Pos auto hidden				;Manages his own graphics and fuel
float[] property myPotHolder_Pos auto hidden
float[] property myCookingPot_Pos auto hidden				;Manages his own graphics and functionality
float[] property myBase1_Pos auto hidden
float[] property myBase2_Pos auto hidden
float[] property myBase3_Pos auto hidden
float[] property myBase4_Pos auto hidden
float[] property myBase5_Pos auto hidden
float[] property myBase6_Pos auto hidden
float[] property myBase7_Pos auto hidden
float[] property myChair_Pos auto hidden
float[] property myFirewood_Pos auto hidden
float[] property myDeadwood_Pos auto hidden
float[] property myBooks_Pos auto hidden
float[] property myEmbers_Pos auto hidden
float[] property myFireLightSource_Pos auto hidden

float[] property mySelf_Pos auto hidden

;Player and actors
Actor property PlayerRef auto

;Globals
GlobalVariable property GameHour auto
GlobalVariable property _DE_Setting_Help auto
GlobalVariable property _DE_HelpDone_Tents auto
GlobalVariable property _DE_CurrentShelterID auto

;Messages
message property _DE_ConjuredShelterMenu auto
message property _DE_Shelter_PickUpError auto
message property _DE_Combat_Error auto

;Run-time objects
ObjectReference property mySphere auto hidden
ObjectReference property myLight auto hidden
ObjectReference property myLightSource auto hidden
ObjectReference property myPlate auto hidden
ObjectReference property myCup auto hidden
ObjectReference property myTable auto hidden
ObjectReference property myTanningRack auto hidden
ObjectReference property myEnchanting auto hidden
ObjectReference property myEnchantingTable auto hidden
ObjectReference property myAlchemy auto hidden
ObjectReference property myAlchemyTable auto hidden
ObjectReference property myFireplace auto hidden
ObjectReference property myPotHolder auto hidden
ObjectReference property myCookingPot auto hidden
ObjectReference property myCookingPotSteam auto hidden
ObjectReference property myBase1 auto hidden
ObjectReference property myBase2 auto hidden
ObjectReference property myBase3 auto hidden
ObjectReference property myBase4 auto hidden
ObjectReference property myBase5 auto hidden
ObjectReference property myBase6 auto hidden
ObjectReference property myBase7 auto hidden
ObjectReference property myChair auto hidden
ObjectReference property mySteam auto hidden
ObjectReference property myFirewoodLit auto hidden
ObjectReference property myFirewoodUnlit auto hidden
ObjectReference property myDeadwoodLit auto hidden
ObjectReference property myDeadwoodUnlit auto hidden
ObjectReference property myBooksLit auto hidden
ObjectReference property myBooksUnlit auto hidden
ObjectReference property myEmbers auto hidden
ObjectReference property myAshes auto hidden
ObjectReference property myFireLightSource auto hidden

ObjectReference property _DE_Shelter_L_Sphere auto
ObjectReference property _DE_Shelter_G_Sphere auto
ObjectReference property _DE_Shelter_Trigger auto

;Furniture and clutter objects
ObjectReference property _DE_ConjurationMasterChest auto
Activator property SummonTargetFXActivator auto
Activator property _DE_Shelter_FirepitACT auto
Activator property _DE_CookingPot_Steam_Shelter auto
Activator property _DE_Campfire_Simple_Books_Lit auto
Activator property _DE_Campfire_Simple_Books_Unlit auto
Activator property _DE_Campfire_Simple_Deadwood_Lit auto
Activator property _DE_Campfire_Simple_Deadwood_Unlit auto
Activator property _DE_Campfire_Simple_Firewood_Lit_Shelter auto
Activator property _DE_Campfire_Simple_Firewood_Unlit_Shelter auto
Activator property _DE_Campfire_Simple_Embers auto
Activator property _DE_Campfire_Simple_Ashes auto
Activator property _DE_Campfire_Simple_Steam auto
furniture property _DE_Shelter_L_Controller auto
furniture property _DE_Shelter_G_Controller auto
furniture property CraftingTanningRackMarker auto
furniture property CraftingAlchemyWorkbenchTabletop auto
furniture property CraftingEnchantingWorkbenchTabletop auto
furniture property _DE_CookingPotFurniture_Shelter auto
furniture property _DE_ShelterChairCommon auto
furniture property NobleChair02FrontIgnoreSandbox auto
Light property _DE_LanternLight auto
Light property _DE_Campfire_Light_3 auto
Static property NorEnchantedDias01 auto
Static property DweAstrolabeExteriorDome01 auto
Static property _DE_MageSphere1 auto
Static property CommonTableRound01 auto
Static property NobleTableSquare01 auto
Static property UpperTableRound01 auto
Static property CookingSpitFarmhouse01 auto
Static property _DE_Tent_LanternOnGround auto
Static property SilverCandleStick02 auto
Static property ImpPillarBrokenTop01 auto
Static property MineScaffoldBase4Sided01 auto
Static property MineScaffoldTop0Sided01 auto
MiscObject property BasicPlate01 auto
MiscObject property BasicTankard01 auto
MiscObject property SilverPlate01 auto
MiscObject property SilverGoblet02 auto
Sound property _DE_ShelterWarpInSound auto
Sound property _DE_ShelterWarpInSoundStart auto

;Misc
Formlist property _DE_WorldspacesInteriors auto
Formlist property _DE_HeatSources_All auto
Message property _DE_Help_Tents auto
ObjectReference property _DE_Anchor auto
EffectShader property ShockDisintegrate01FXS auto
VisualEffect property MGTeleportInEffect auto


Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		if (akActionRef as Actor).IsInCombat()
			_DE_Combat_Error.Show()
		else
			if bTryingToSleep
				bTryingToSleep = false
				self.BlockActivation()
			else
				ShowMainMenu()
			endif
		endif
	endif
endEvent

Event OnUpdate()
	if _DE_CurrentShelterID.GetValue() != ShelterID
		DispelShelter(1)
	elseif bTryingToDispel
		;Stop updating
	else
		ObjectReference myref = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_All, myCookingPot, 260.0)
		if myref != none && myref.IsEnabled()
			if myCookingPotSteam
				myCookingPotSteam.Enable(true)
			endif
		else
			if myCookingPotSteam
				myCookingPotSteam.Disable(true)
			endif
		endif
		RegisterForSingleUpdate(2)
	endif
endEvent

Event OnUpdateGameTime()
	DispelShelter(2)
endEvent

function ShowMainMenu()
	int i = _DE_ConjuredShelterMenu.Show()
	if i == 0										;Sleep
		bTryingToSleep = true
		self.BlockActivation(false)
		self.Activate(PlayerRef)					;Spawns sleep menu
	elseif i == 1									;Dispel Shelter
		bTryingToDispel = true
		DispelShelter()
	else
		;exit
	endif
endFunction

function CreatePositionArrays()
	mySphere_Pos = new float[6]
	myLight_Pos = new float[6]
	myLightSource_Pos = new float[6]
	myPlate_Pos = new float[6]
	myCup_Pos = new float[6]
	myTable_Pos = new float[6]
	myChest_Pos = new float[6]
	myTanningRack_Pos = new float[6]
	myEnchanting_Pos = new float[6]
	myEnchantingTable_Pos = new float[6]
	myAlchemy_Pos = new float[6]
	myAlchemyTable_Pos = new float[6]
	myFireplace_Pos = new float[6]
	myPotHolder_Pos = new float[6]
	myCookingPot_Pos = new float[6]
	myBase1_Pos = new float[6]
	myBase2_Pos = new float[6]
	myBase3_Pos = new float[6]
	myBase4_Pos = new float[6]
	myBase5_Pos = new float[6]
	myBase6_Pos = new float[6]
	myBase7_Pos = new float[6]
	myChair_Pos = new float[6]
	myFirewood_Pos = new float[6]
	myDeadwood_Pos = new float[6]
	myBooks_Pos = new float[6]
	myEmbers_Pos = new float[6]
	myFireLightSource_Pos = new float[6]
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

float[] function GetPosXYZRotateAroundRef(ObjectReference akOrigin, ObjectReference akObject, float fAngleX, float fAngleY, float fAngleZ)

	;-----------\
	;Description \ Author: Chesko
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

function DispelShelter(int iLimited = 0)

	;Are any of the bed rolls in use?
	if iLimited == 0   								;Chose the Dispel option from the menu
		if self.IsFurnitureInUse()
			_DE_Shelter_PickUpError.Show()
			return
		endif
		if self.IsFurnitureInUse()
			_DE_Shelter_PickUpError.Show()
			return
		endif
	elseif iLimited == 1 || iLimited == 2			;Conjured another shelter elsewhere OR the shelter timed out
		while self.IsFurnitureInUse()
			wait(0.1)
		endWhile
		while myChair.IsFurnitureInUse()
			wait(0.1)
		endWhile
	endif

	if iLimited == 0 || iLimited == 2
		_DE_Shelter_Trigger.MoveTo(_DE_Anchor)
	endif

	;Destroy fuel objects and other state-based effects
	if myCookingPotSteam
		myCookingPotSteam.Disable()
		myCookingPotSteam.Delete()
	endif
	if myFirewoodLit
		myFirewoodLit.Disable()
		myFirewoodLit.Delete()
	endif
	if myFirewoodUnlit
		myFirewoodUnlit.Disable()
		myFirewoodUnlit.Delete()
	endif
	if myDeadwoodLit
		myDeadwoodLit.Disable()
		myDeadwoodLit.Delete()
	endif
	if myDeadwoodUnlit
		myDeadwoodUnlit.Disable()
		myDeadwoodUnlit.Delete()
	endif
	if myBooksLit
		myBooksLit.Disable()
		myBooksLit.Delete()
	endif
	if myBooksUnlit
		myBooksUnlit.Disable()
		myBooksUnlit.Delete()
	endif
	if mySteam
		mySteam.Disable()
		mySteam.Delete()
	endif
	if myEmbers
		myEmbers.Disable()
		myEmbers.Delete()
	endif
	if myAshes
		myAshes.Disable()
		myAshes.Delete()
	endif
	if myFireLightSource
		myFireLightSource.Disable()
		myFireLightSource.Delete()
	endif

	;Disintegrate everything!
	if myLight
		PlayWarpOutEffect(myLight)
	endif
	wait(0.1)
	if myPlate
		PlayWarpOutEffect(myPlate)
	endif
	wait(0.1)	;0.2 sec
	if myCup
		PlayWarpOutEffect(myCup)
	endif
	wait(0.2)	;0.4 sec
	if myTable
		PlayWarpOutEffect(myTable)
	endif
	if myChair
		PlayWarpOutEffect(myChair)
	endif
	wait(0.1)	;0.5 sec
	if myPotHolder
		PlayWarpOutEffect(myPotHolder)
	endif
	if mySteam
		mySteam.Disable()
		mySteam.Delete()
	endif
	if myCookingPot
		PlayWarpOutEffect(myCookingPot)
	endif
	wait(0.1)	;0.6 sec
	if myTanningRack
		PlayWarpOutEffect(myTanningRack)
	endif
	if myEnchanting
		PlayWarpOutEffect(myEnchanting)
	endif
	wait(0.2)	;0.8 sec
	if myAlchemy
		PlayWarpOutEffect(myAlchemy)
	endif
	wait(0.1)	;0.9 sec
	if myFireplace
		PlayWarpOutEffect(myFireplace)
	endif
	wait(0.1)	;1.0 sec
	if myEnchantingTable
		PlayWarpOutEffect(myEnchantingTable)
	endif
	if myAlchemyTable
		PlayWarpOutEffect(myAlchemyTable)
	endif
	if iLimited == 0 || iLimited == 2
		PlayWarpOutEffect(_DE_ConjurationMasterChest)
	endif
	wait(0.2)	;1.2 sec
	PlayWarpOutEffect(self)
	wait(0.1)	;1.3 sec
	if myBase1
		PlayWarpOutEffect(myBase1)
	endif
	if myBase2
		PlayWarpOutEffect(myBase2)
	endif
	if myBase3
		PlayWarpOutEffect(myBase3)
	endif
	if myBase4
		PlayWarpOutEffect(myBase4)
	endif
	if myBase5
		PlayWarpOutEffect(myBase5)
	endif
	if myBase6
		PlayWarpOutEffect(myBase6)
	endif
	if myBase7
		PlayWarpOutEffect(myBase7)
	endif

	wait(1.2)	;2.5 sec - Effect is over, start disabling things in order

	if myLightSource
		myLightSource.Disable()
		myLightSource.Delete()
	endif
	if myLight
		myLight.Disable()
		myLight.Delete()
	endif
	wait(0.1)
	if myPlate
		myPlate.Disable()
		myPlate.Delete()
	endif
	wait(0.1)
	if myCup
		myCup.Disable()
		myCup.Delete()
	endif
	wait(0.2)
	if myTable
		myTable.Disable()
		myTable.Delete()
	endif
	if myChair
		myChair.Disable()
		myChair.Delete()
	endif
	wait(0.1)
	if myPotHolder
		myPotHolder.Disable()
		myPotHolder.Delete()
	endif
	if myCookingPot
		myCookingPot.Disable()
		myCookingPot.Delete()
	endif
	wait(0.1)

	if myTanningRack
		myTanningRack.Disable()
		myTanningRack.Delete()
	endif
	if myEnchanting
		myEnchanting.Disable()
		myEnchanting.Delete()
	endif
	wait(0.2)
	if myAlchemy
		myAlchemy.Disable()
		myAlchemy.Delete()
	endif
	wait(0.1)
	if myFireplace
		myFireplace.Disable()
		myFireplace.Delete()
	endif
	wait(0.1)
	if myEnchantingTable
		myEnchantingTable.Disable()
		myEnchantingTable.Delete()
	endif
	if myAlchemyTable
		myAlchemyTable.Disable()
		myAlchemyTable.Delete()
	endif

	wait(0.3)
	if myBase1
		myBase1.Disable()
		myBase1.Delete()
	endif
	if myBase2
		myBase2.Disable()
		myBase2.Delete()
	endif
	if myBase3
		myBase3.Disable()
		myBase3.Delete()
	endif
	if myBase4
		myBase4.Disable()
		myBase4.Delete()
	endif
	if myBase5
		myBase5.Disable()
		myBase5.Delete()
	endif
	if myBase6
		myBase6.Disable()
		myBase6.Delete()
	endif
	if myBase7
		myBase7.Disable()
		myBase7.Delete()
	endif

	if iLimited == 0 || iLimited == 2
		;Move the chest back to the holding cell
		_DE_ConjurationMasterChest.MoveTo(_DE_Anchor)
	endif
	
	if mySoundID != 0
		Sound.StopInstance(mySoundID)
	endif

	if mySphere
		;Suck in the sphere
		mySphere.PlaceAtMe(SummonTargetFXActivator)
		wait(1.0)
		float mySphereScale = _DE_Shelter_L_Sphere.GetScale()
		float fDivisor = 1.0
		while fDivisor < 1.6
			mySphere.SetScale(mySphereScale / fDivisor)
			fDivisor += 0.01
		endWhile

		fDivisor = 1.5
		while fDivisor < 20.0
			mySphere.SetScale(mySphereScale / fDivisor)
			fDivisor += 1.0
		endWhile
		mySphere.Disable()
		mySphere.Delete()
	endif

	;Finally, delete myself
	self.Disable()
	self.Delete()
endFunction

bool function IsPlayerInInterior()
	if PlayerRef.IsInInterior()
		return true
	else
		if _DE_WorldspacesInteriors.HasForm(PlayerRef.GetWorldSpace())
			return true
		else
			return false
		endif
	endif
endFunction

bool function Is3DLoadedFinite(ObjectReference akObject)
	;Prevents an infinite loop waiting for an object that may
	;never load correctly.
	int i = 0
	while !akObject.Is3DLoaded() && i < 500
		i += 1
	endWhile
	if i >= 500
		return false
	else
		return true
	endif
endFunction

function PlayWarpInEffect(ObjectReference akObject)
	if Is3DLoadedFinite(akObject)
		MGTeleportInEffect.Play(akObject, 3.0)
	endif
endFunction

function PlayWarpOutEffect(ObjectReference akObject)
	if Is3DLoadedFinite(akObject)
		ShockDisintegrate01FXS.Play(akObject)
	endif
endFunction