scriptname CampTent extends _Camp_PlaceableObjectBase

import CampUtil
import TentSystem

; REQUIRED PROPERTIES
ObjectReference property RequiredPositionRef_PlayerBed auto
{REQUIRED: The player's bed roll (main interactible) position reference.}

ObjectReference property RequiredPositionRef_SitFurniture auto
{REQUIRED: The player's sitting furniture position reference.}

ObjectReference property RequiredPositionRef_LieDownFurniture auto
{REQUIRED: The player's lying down furniture position reference.}

; OPTIONAL PROPERTIES

Static property TentAsset_ShelterModel auto
{Optional: The tent static object.}

Static property TentAsset_ShelterModelExterior auto
{Optional: The tent static object exterior (for use with Toggle View feature).}

Static property TentAsset_ShelterModelMaterialSnow auto
{Optional: The tent (ShelterModel or ShelterModelExterior) with snow directional shader applied.}

Static property TentAsset_ShelterModelMaterialAsh auto
{Optional: The tent (ShelterModel or ShelterModelExterior) with ash directional shader applied (use _Camp_AshMaterialSolstheim1P_2 instead of a direct dependency on Dragonborn.esm)}

Static property TentAsset_ClutterStatic1 auto
{Optional: A static to place in or around the tent.}

Static property TentAsset_ClutterStatic2 auto
{Optional: A static to place in or around the tent.}

Static property TentAsset_ClutterStatic3 auto
{Optional: A static to place in or around the tent.}

Static property TentAsset_ClutterStatic4 auto
{Optional: A static to place in or around the tent.}

Static property TentAsset_ClutterStatic5 auto
{Optional: A static to place in or around the tent.}

ObjectReference property PositionRef_FrontExitMarker auto
{Optional: Position reference of marker to move the player to when exiting a small tent.}

ObjectReference property PositionRef_Shelter auto
{Optional: The shelter (tent, structure) position reference.}

ObjectReference property PositionRef_Ward auto

ObjectReference property PositionRef_Lantern1 auto
{Optional: The first lantern's position reference.}

ObjectReference property PositionRef_ClutterStatic1 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_ClutterStatic2 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_ClutterStatic3 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_ClutterStatic4 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_ClutterStatic5 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Player_Backpack auto
{Optional: Position reference of player's backpack.}

ObjectReference property PositionRef_Player_Shield auto
{Optional: Position reference of player's shield.}

ObjectReference property PositionRef_Player_ShieldInterior auto
{Optional: Position reference of player's shield when in an interior (usually lying flat).}

ObjectReference property PositionRef_Player_WeaponMainHand auto
{Optional: Position reference of player's main hand weapon.}

ObjectReference property PositionRef_Player_WeaponOffHand auto
{Optional: Position reference of player's off hand weapon.}

ObjectReference property PositionRef_Player_WeaponTwoHand auto
{Optional: Position reference of player's two-handed weapon.}

ObjectReference property PositionRef_Player_WeaponBow auto
{Optional: Position reference of player's bow.}

ObjectReference property PositionRef_Player_ArmorHelm auto
{Optional: Position reference of player's head gear.}

ObjectReference property PositionRef_Player_ArmorCuirass auto
{Optional: Position reference of player's body gear.}

ObjectReference property PositionRef_Player_ArmorGauntlets auto
{Optional: Position reference of player's hand gear.}

ObjectReference property PositionRef_Player_ArmorBoots auto
{Optional: Position reference of player's foot gear.}

ObjectReference property PositionRef_CenterObjectOverride auto
{Optional: Set this to specify a different object as the one which all other tent objects "orbit" when rotated. Uses the Shelter or Player Bed if left blank.}

Float property Setting_StartUpRotation = 0.0 auto
{Optional: The amount, in degrees, to rotate the tent on the Z axis on start-up. Helpful if the Shelter asset is not aligned correctly.}

; PRIVATE
;Object locations
float[] property myOriginAng auto hidden
float[] property myPlayerMarker_MainWeapon_Pos auto hidden
float[] property myPlayerMarker_OffHandWeapon_Pos auto hidden
float[] property myPlayerMarker_BigWeapon_Pos auto hidden
float[] property myPlayerMarker_Bow_Pos auto hidden
float[] property myPlayerMarker_Helm_Pos auto hidden
float[] property myPlayerMarker_Boots_Pos auto hidden
float[] property myPlayerMarker_Gauntlets_Pos auto hidden
float[] property myPlayerMarker_Cuirass_Pos auto hidden
float[] property myPlayerMarker_Backpack_Pos auto hidden
float[] property myPlayerMarker_Shield_Pos auto hidden
float[] property myPlayerMarker_ShieldInterior_Pos auto hidden
float[] property myFollowerAMarker_MainWeapon_Pos auto hidden
float[] property myFollowerAMarker_OffHandWeapon_Pos auto hidden
float[] property myFollowerAMarker_BigWeapon_Pos auto hidden
float[] property myFollowerAMarker_Bow_Pos auto hidden
float[] property myFollowerAMarker_Shield_Pos auto hidden
float[] property myFollowerBMarker_MainWeapon_Pos auto hidden
float[] property myFollowerBMarker_OffHandWeapon_Pos auto hidden
float[] property myFollowerBMarker_BigWeapon_Pos auto hidden
float[] property myFollowerBMarker_Bow_Pos auto hidden
float[] property myFollowerBMarker_Shield_Pos auto hidden
float[] property myFollowerCMarker_MainWeapon_Pos auto hidden
float[] property myFollowerCMarker_OffHandWeapon_Pos auto hidden
float[] property myFollowerCMarker_BigWeapon_Pos auto hidden
float[] property myFollowerCMarker_Bow_Pos auto hidden
float[] property myFollowerCMarker_Shield_Pos auto hidden
float[] property myClutterStatic1_Pos auto hidden
float[] property myClutterStatic2_Pos auto hidden
float[] property myClutterStatic3_Pos auto hidden
float[] property myClutterStatic4_Pos auto hidden
float[] property myClutterStatic5_Pos auto hidden
float[] property myClutterActivator1_Pos auto hidden
float[] property myClutterActivator2_Pos auto hidden
float[] property myClutterActivator3_Pos auto hidden
float[] property myClutterActivator4_Pos auto hidden
float[] property myClutterActivator5_Pos auto hidden
float[] property myClutterFurniture1_Pos auto hidden
float[] property myClutterFurniture2_Pos auto hidden
float[] property myClutterFurniture3_Pos auto hidden
float[] property myClutterFurniture4_Pos auto hidden
float[] property myClutterFurniture5_Pos auto hidden
float[] property myTent_Pos auto hidden
float[] property myLanternLit_Pos auto hidden
float[] property myLanternLit2_Pos auto hidden
float[] property myLanternLit3_Pos auto hidden
float[] property myLanternUnlit_Pos auto hidden
float[] property myLanternUnlit2_Pos auto hidden
float[] property myLanternUnlit3_Pos auto hidden
float[] property myLanternLight_Pos auto hidden
float[] property myLanternLight2_Pos auto hidden
float[] property myLanternLight3_Pos auto hidden
float[] property myPlayerSitMarker_Pos auto hidden
float[] property myPlayerLayDownMarker_Pos auto hidden
float[] property myExitFront_Pos auto hidden
float[] property myBedRoll_Pos auto hidden
float[] property mySpareBedRoll1_Pos auto hidden
float[] property mySpareBedRoll2_Pos auto hidden
float[] property mySpareBedRoll3_Pos auto hidden
float[] property myWard_Pos auto hidden
float[] property mySelf_Pos auto hidden

;Run-time objects
ObjectReference property myTent auto hidden
ObjectReference property myTentExterior auto hidden
ObjectReference property myNormalTent auto hidden
ObjectReference property mySnowTent auto hidden
ObjectReference property myAshTent auto hidden
ObjectReference property myLanternLit auto hidden
ObjectReference property myLanternUnlit auto hidden
ObjectReference property myLanternLight auto hidden
ObjectReference property myLanternLit2 auto hidden
ObjectReference property myLanternUnlit2 auto hidden
ObjectReference property myLanternLight2 auto hidden
ObjectReference property myLanternLit3 auto hidden
ObjectReference property myLanternUnlit3 auto hidden
ObjectReference property myLanternLight3 auto hidden
ObjectReference property myPlayerMarker_MainWeapon auto hidden
ObjectReference property myPlayerMarker_OffHandWeapon auto hidden
ObjectReference property myPlayerMarker_BigWeapon auto hidden
ObjectReference property myPlayerMarker_Bow auto hidden
ObjectReference property myPlayerMarker_Helm auto hidden
ObjectReference property myPlayerMarker_Boots auto hidden
ObjectReference property myPlayerMarker_Gauntlets auto hidden
ObjectReference property myPlayerMarker_Cuirass auto hidden
ObjectReference property myPlayerMarker_Backpack auto hidden
ObjectReference property myPlayerMarker_Shield auto hidden
ObjectReference property myPlayerMarker_ShieldInterior auto hidden
ObjectReference property myFollowerAMarker_MainWeapon auto hidden
ObjectReference property myFollowerAMarker_OffHandWeapon auto hidden
ObjectReference property myFollowerAMarker_BigWeapon auto hidden
ObjectReference property myFollowerAMarker_Bow auto hidden
ObjectReference property myFollowerAMarker_Shield auto hidden
ObjectReference property myFollowerBMarker_MainWeapon auto hidden
ObjectReference property myFollowerBMarker_OffHandWeapon auto hidden
ObjectReference property myFollowerBMarker_BigWeapon auto hidden
ObjectReference property myFollowerBMarker_Bow auto hidden
ObjectReference property myFollowerBMarker_Shield auto hidden
ObjectReference property myFollowerCMarker_MainWeapon auto hidden
ObjectReference property myFollowerCMarker_OffHandWeapon auto hidden
ObjectReference property myFollowerCMarker_BigWeapon auto hidden
ObjectReference property myFollowerCMarker_Bow auto hidden
ObjectReference property myFollowerCMarker_Shield auto hidden
ObjectReference property myClutterStatic1 auto hidden
ObjectReference property myClutterStatic2 auto hidden
ObjectReference property myClutterStatic3 auto hidden
ObjectReference property myClutterStatic4 auto hidden
ObjectReference property myClutterStatic5 auto hidden
ObjectReference property myClutterActivator1 auto hidden
ObjectReference property myClutterActivator2 auto hidden
ObjectReference property myClutterActivator3 auto hidden
ObjectReference property myClutterActivator4 auto hidden
ObjectReference property myClutterActivator5 auto hidden
ObjectReference property myClutterFurniture1 auto hidden
ObjectReference property myClutterFurniture2 auto hidden
ObjectReference property myClutterFurniture3 auto hidden
ObjectReference property myClutterFurniture4 auto hidden
ObjectReference property myClutterFurniture5 auto hidden
ObjectReference property myPlayerSitMarker auto hidden
ObjectReference property myPlayerLayDownMarker auto hidden
ObjectReference property myExitFront auto hidden
ObjectReference property myBedRoll auto hidden
ObjectReference property mySpareBedRoll1 auto hidden
ObjectReference property mySpareBedRoll2 auto hidden
ObjectReference property mySpareBedRoll3 auto hidden
ObjectReference property myWard auto hidden

Ammo property myQuiver auto hidden
Armor property myShield auto hidden
Armor property myHelm auto hidden
Armor property myBackpack auto hidden
Armor property myBoots auto hidden
Armor property myGauntlets auto hidden
Armor property myCuirass auto hidden
Weapon property myMainWeapon auto hidden
Weapon property myOffHandWeapon auto hidden
Weapon property myBigWeapon auto hidden
Weapon property myBow auto hidden

ObjectReference property myDisplayQuiver auto hidden
ObjectReference property myDisplayShield auto hidden
ObjectReference property myDisplayHelm auto hidden
ObjectReference property myDisplayBackpack auto hidden
ObjectReference property myDisplayBoots auto hidden
ObjectReference property myDisplayGauntlets auto hidden
ObjectReference property myDisplayCuirass auto hidden
ObjectReference property myDisplayMainWeapon auto hidden
ObjectReference property myDisplayOffHandWeapon auto hidden
ObjectReference property myDisplayBigWeapon auto hidden
ObjectReference property myDisplayBow auto hidden

Armor property myFollowerAShield auto hidden
Weapon property myFollowerAMainWeapon auto hidden
Weapon property myFollowerAOffHandWeapon auto hidden
Weapon property myFollowerABigWeapon auto hidden
Weapon property myFollowerABow auto hidden

Armor property myFollowerBShield auto hidden
Weapon property myFollowerBMainWeapon auto hidden
Weapon property myFollowerBOffHandWeapon auto hidden
Weapon property myFollowerBBigWeapon auto hidden
Weapon property myFollowerBBow auto hidden

Armor property myFollowerCShield auto hidden
Weapon property myFollowerCMainWeapon auto hidden
Weapon property myFollowerCOffHandWeapon auto hidden
Weapon property myFollowerCBigWeapon auto hidden
Weapon property myFollowerCBow auto hidden

Armor property myDisplayFollowerAShield auto hidden
Weapon property myDisplayFollowerAMainWeapon auto hidden
Weapon property myDisplayFollowerAOffHandWeapon auto hidden
Weapon property myDisplayFollowerABigWeapon auto hidden
Weapon property myDisplayFollowerABow auto hidden

Armor property myDisplayFollowerBShield auto hidden
Weapon property myDisplayFollowerBMainWeapon auto hidden
Weapon property myDisplayFollowerBOffHandWeapon auto hidden
Weapon property myDisplayFollowerBBigWeapon auto hidden
Weapon property myDisplayFollowerBBow auto hidden

Armor property myDisplayFollowerCShield auto hidden
Weapon property myDisplayFollowerCMainWeapon auto hidden
Weapon property myDisplayFollowerCOffHandWeapon auto hidden
Weapon property myDisplayFollowerCBigWeapon auto hidden
Weapon property myDisplayFollowerCBow auto hidden

bool property bLanternLit = false auto hidden
bool property bGettingUp = false auto hidden

Quest property CampfireObjectPlacementSystem auto

Event OnInit()
	while !self.Is3DLoaded()
	endWhile

	RotateOnStartUp()
	StartObjectProfiling()
	;CreatePositionArrays()
	myOriginAng = GetAngleData(self)
	;SetRelativePositions()
	;Placement()
	QueueThreads()
	RaiseEvent_OnThreadedPlacementStart()
	GetResults()
	StopObjectProfiling()

	;@TODO: Remove
	GenerateDebugReport()
endEvent

Event OnUpdate()
	UpdateTentUseState(self)
endEvent

Event OnActivate(ObjectReference akActionRef)
	ActivateTent(akActionRef, self)
endEvent

function CreatePositionArrays()
	if RequiredPositionRef_PlayerBed
		myBedRoll_Pos = new float[6]
	endif
	if RequiredPositionRef_SitFurniture
		myPlayerSitMarker_Pos = new float[6]
	endif
	if RequiredPositionRef_LieDownFurniture
		myPlayerLayDownMarker_Pos = new float[6]
	endif
	if PositionRef_FrontExitMarker
		myExitFront_Pos = new float[6]
	endif
	if PositionRef_Shelter
		myTent_Pos = new float[6]
	endif
	if PositionRef_Ward
		myWard_Pos = new float[6]
	endif
	if PositionRef_Lantern1
		myLanternUnlit_Pos = new float[6]
		myLanternLit_Pos = new float[6]
		myLanternLight_Pos = new float[6]
	endif
	if PositionRef_ClutterStatic1
		myClutterStatic1_Pos = new float[6]
	endif
	if PositionRef_ClutterStatic2
		myClutterStatic2_Pos = new float[6]
	endif
	if PositionRef_ClutterStatic3
		myClutterStatic3_Pos = new float[6]
	endif
	if PositionRef_ClutterStatic4
		myClutterStatic4_Pos = new float[6]
	endif
	if PositionRef_ClutterStatic5
		myClutterStatic5_Pos = new float[6]
	endif
	if PositionRef_Player_Backpack
		myPlayerMarker_Backpack_Pos = new float[6]
	endif
	if PositionRef_Player_Shield
		myPlayerMarker_Shield_Pos = new float[6]
	endif
	if PositionRef_Player_ShieldInterior
		myPlayerMarker_ShieldInterior_Pos = new float[6]
	endif
	if PositionRef_Player_WeaponMainHand
		myPlayerMarker_MainWeapon_Pos = new float[6]
	endif
	if PositionRef_Player_WeaponOffHand
		myPlayerMarker_OffHandWeapon_Pos = new float[6]
	endif
	if PositionRef_Player_WeaponTwoHand
		myPlayerMarker_BigWeapon_Pos = new float[6]
	endif
	if PositionRef_Player_WeaponBow
		myPlayerMarker_Bow_Pos = new float[6]
	endif
	if PositionRef_Player_ArmorHelm
		myPlayerMarker_Helm_Pos = new float[6]
	endif
	if PositionRef_Player_ArmorCuirass
		myPlayerMarker_Cuirass_Pos = new float[6]
	endif
	if PositionRef_Player_ArmorGauntlets
		myPlayerMarker_Gauntlets_Pos = new float[6]
	endif
	if PositionRef_Player_ArmorBoots
		myPlayerMarker_Boots_Pos = new float[6]
	endif

	;Check extended objects
	CampTentEx Extended = self as CampTentEx
	if Extended
		if Extended.PositionRef_Lantern2
			myLanternUnlit2_Pos = new float[6]
			myLanternLit2_Pos = new float[6]
			myLanternLight2_Pos = new float[6]
		endif
		if Extended.PositionRef_Lantern3
			myLanternUnlit3_Pos = new float[6]
			myLanternLit3_Pos = new float[6]
			myLanternLight3_Pos = new float[6]
		endif
		if Extended.PositionRef_ClutterActivator1
			myClutterActivator1_Pos = new float[6]
		endif
		if Extended.PositionRef_ClutterActivator2
			myClutterActivator2_Pos = new float[6]
		endif
		if Extended.PositionRef_ClutterActivator3
			myClutterActivator3_Pos = new float[6]
		endif
		if Extended.PositionRef_ClutterActivator4
			myClutterActivator4_Pos = new float[6]
		endif
		if Extended.PositionRef_ClutterActivator5
			myClutterActivator5_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower1_Bed
			mySpareBedRoll1_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower1_Shield
			myFollowerAMarker_Shield_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower1_WeaponMainHand
			myFollowerAMarker_MainWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower1_WeaponOffHand
			myFollowerAMarker_OffHandWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower1_WeaponTwoHand
			myFollowerAMarker_BigWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower1_WeaponBow
			myFollowerAMarker_Bow_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower2_Bed
			mySpareBedRoll2_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower2_Shield
			myFollowerBMarker_Shield_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower2_WeaponMainHand
			myFollowerBMarker_MainWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower2_WeaponOffHand
			myFollowerBMarker_OffHandWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower2_WeaponTwoHand
			myFollowerBMarker_BigWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower2_WeaponBow
			myFollowerBMarker_Bow_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower3_Bed
			mySpareBedRoll3_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower3_Shield
			myFollowerCMarker_Shield_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower3_WeaponMainHand
			myFollowerCMarker_MainWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower3_WeaponOffHand
			myFollowerCMarker_OffHandWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower3_WeaponTwoHand
			myFollowerCMarker_BigWeapon_Pos = new float[6]
		endif
		if Extended.PositionRef_Follower3_WeaponBow
			myFollowerCMarker_Bow_Pos = new float[6]
		endif
	endif
endFunction

function SetRelativePositions()
	ObjectReference myCenterObject
	if PositionRef_CenterObjectOverride
		myCenterObject = PositionRef_CenterObjectOverride
	else
		if PositionRef_Shelter
			myCenterObject = PositionRef_Shelter
		else
			myCenterObject = RequiredPositionRef_PlayerBed
		endif
	endif

	if RequiredPositionRef_PlayerBed
		myBedRoll_Pos = GetRelativePosition(myCenterObject, RequiredPositionRef_PlayerBed)
	endif
	if RequiredPositionRef_SitFurniture
		myPlayerSitMarker_Pos = GetRelativePosition(myCenterObject, RequiredPositionRef_SitFurniture)
	endif
	if RequiredPositionRef_LieDownFurniture
		myPlayerLayDownMarker_Pos = GetRelativePosition(myCenterObject, RequiredPositionRef_LieDownFurniture)
	endif
	if PositionRef_FrontExitMarker
		myExitFront_Pos = GetRelativePosition(myCenterObject, PositionRef_FrontExitMarker)
	endif
	if PositionRef_Shelter
		myTent_Pos = GetRelativePosition(myCenterObject, PositionRef_Shelter)
	endif
	if PositionRef_Ward
		myWard_Pos = GetRelativePosition(myCenterObject, PositionRef_Ward)
	endif
	if PositionRef_Lantern1
		myLanternUnlit_Pos = GetRelativePosition(myCenterObject, PositionRef_Lantern1)
		myLanternLit_Pos = GetRelativePosition(myCenterObject, PositionRef_Lantern1)
		myLanternLight_Pos = GetRelativePosition(myCenterObject, PositionRef_Lantern1)
		;Position the light inside the lantern.
		myLanternLight_Pos[2] = myLanternLight_Pos[2] + 7.0
	endif
	if PositionRef_ClutterStatic1
		myClutterStatic1_Pos = GetRelativePosition(myCenterObject, PositionRef_ClutterStatic1)
	endif
	if PositionRef_ClutterStatic2
		myClutterStatic2_Pos = GetRelativePosition(myCenterObject, PositionRef_ClutterStatic2)
	endif
	if PositionRef_ClutterStatic3
		myClutterStatic3_Pos = GetRelativePosition(myCenterObject, PositionRef_ClutterStatic3)
	endif
	if PositionRef_ClutterStatic4
		myClutterStatic4_Pos = GetRelativePosition(myCenterObject, PositionRef_ClutterStatic4)
	endif
	if PositionRef_ClutterStatic5
		myClutterStatic5_Pos = GetRelativePosition(myCenterObject, PositionRef_ClutterStatic5)
	endif
	if PositionRef_Player_Backpack
		myPlayerMarker_Backpack_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_Backpack)
	endif
	if PositionRef_Player_Shield
		myPlayerMarker_Shield_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_Shield)
	endif
	if PositionRef_Player_ShieldInterior
		myPlayerMarker_ShieldInterior_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_ShieldInterior)
	endif
	if PositionRef_Player_WeaponMainHand
		myPlayerMarker_MainWeapon_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_WeaponMainHand)
	endif
	if PositionRef_Player_WeaponOffHand
		myPlayerMarker_OffHandWeapon_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_WeaponOffHand)
	endif
	if PositionRef_Player_WeaponTwoHand
		myPlayerMarker_BigWeapon_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_WeaponTwoHand)
	endif
	if PositionRef_Player_WeaponBow
		myFollowerCMarker_Bow_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_WeaponBow)
	endif
	if PositionRef_Player_ArmorHelm
		myPlayerMarker_Helm_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_ArmorHelm)
	endif
	if PositionRef_Player_ArmorCuirass
		myPlayerMarker_Cuirass_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_ArmorCuirass)
	endif
	if PositionRef_Player_ArmorGauntlets
		myPlayerMarker_Gauntlets_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_ArmorGauntlets)
	endif
	if PositionRef_Player_ArmorBoots
		myPlayerMarker_Boots_Pos = GetRelativePosition(myCenterObject, PositionRef_Player_ArmorBoots)
	endif

	;Check extended objects
	CampTentEx Extended = self as CampTentEx
	if Extended
		if Extended.PositionRef_Lantern2
			myLanternUnlit2_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
			myLanternLit2_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
			myLanternLight2_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
			;Position the light inside the lantern.
			myLanternLight2_Pos[2] = myLanternLight2_Pos[2] + 7.0
		endif
		if Extended.PositionRef_Lantern3
			myLanternUnlit3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
			myLanternLit3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
			myLanternLight3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
			;Position the light inside the lantern.
			myLanternLight3_Pos[2] = myLanternLight3_Pos[2] + 7.0
		endif
		if Extended.PositionRef_ClutterActivator1
			myClutterActivator1_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ClutterActivator1)
		endif
		if Extended.PositionRef_ClutterActivator2
			myClutterActivator2_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ClutterActivator2)
		endif
		if Extended.PositionRef_ClutterActivator3
			myClutterActivator3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ClutterActivator3)
		endif
		if Extended.PositionRef_ClutterActivator4
			myClutterActivator4_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ClutterActivator4)
		endif
		if Extended.PositionRef_ClutterActivator5
			myClutterActivator5_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ClutterActivator5)
		endif
		if Extended.PositionRef_Follower1_Bed
			mySpareBedRoll1_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower1_Bed)
		endif
		if Extended.PositionRef_Follower1_Shield
			myFollowerAMarker_Shield_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower1_Shield)
		endif
		if Extended.PositionRef_Follower1_WeaponMainHand
			myFollowerAMarker_MainWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower1_WeaponMainHand)
		endif
		if Extended.PositionRef_Follower1_WeaponOffHand
			myFollowerAMarker_OffHandWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower1_WeaponOffHand)
		endif
		if Extended.PositionRef_Follower1_WeaponTwoHand
			myFollowerAMarker_BigWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower1_WeaponTwoHand)
		endif
		if Extended.PositionRef_Follower1_WeaponBow
			myFollowerAMarker_Bow_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower1_WeaponBow)
		endif
		if Extended.PositionRef_Follower2_Bed
			mySpareBedRoll2_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower2_Bed)
		endif
		if Extended.PositionRef_Follower2_Shield
			myFollowerBMarker_Shield_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower2_Shield)
		endif
		if Extended.PositionRef_Follower2_WeaponMainHand
			myFollowerBMarker_MainWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower2_WeaponMainHand)
		endif
		if Extended.PositionRef_Follower2_WeaponOffHand
			myFollowerBMarker_OffHandWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower2_WeaponOffHand)
		endif
		if Extended.PositionRef_Follower2_WeaponTwoHand
			myFollowerBMarker_BigWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower2_WeaponTwoHand)
		endif
		if Extended.PositionRef_Follower2_WeaponBow
			myFollowerBMarker_Bow_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower2_WeaponBow)
		endif
		if Extended.PositionRef_Follower3_Bed
			mySpareBedRoll3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower3_Bed)
		endif
		if Extended.PositionRef_Follower3_Shield
			myFollowerCMarker_Shield_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower3_Shield)
		endif
		if Extended.PositionRef_Follower3_WeaponMainHand
			myFollowerCMarker_MainWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower3_WeaponMainHand)
		endif
		if Extended.PositionRef_Follower3_WeaponOffHand
			myFollowerCMarker_OffHandWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower3_WeaponOffHand)
		endif
		if Extended.PositionRef_Follower3_WeaponTwoHand
			myFollowerCMarker_BigWeapon_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower3_WeaponTwoHand)
		endif
		if Extended.PositionRef_Follower3_WeaponBow
			myFollowerCMarker_Bow_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Follower3_WeaponBow)
		endif
	endif
endFunction

function Placement()
	CampTentEx Extended = self as CampTentEx
	if TentAsset_ShelterModel && PositionRef_Shelter
		PlaceTentObject_Tent()
	endif
	if myTent && TentAsset_ShelterModelExterior && PositionRef_Shelter
		PlaceTentObject_NormalTent()
	endif
	if myTent && TentAsset_ShelterModelMaterialSnow && PositionRef_Shelter
		PlaceTentObject_SnowTent()
	endif
	if myTent && TentAsset_ShelterModelMaterialAsh && PositionRef_Shelter
		PlaceTentObject_AshTent()
	endif
	TentSystem.ApplySnow(self)
	PlaceTentObject_Ward()
	if TentAsset_ClutterStatic1 && PositionRef_ClutterStatic1
		PlaceTentObject_ClutterStatic1()
	endif
	if TentAsset_ClutterStatic2 && PositionRef_ClutterStatic2
		PlaceTentObject_ClutterStatic2()
	endif
	if TentAsset_ClutterStatic3 && PositionRef_ClutterStatic3
		PlaceTentObject_ClutterStatic3()
	endif
	if TentAsset_ClutterStatic4 && PositionRef_ClutterStatic4
		PlaceTentObject_ClutterStatic4()
	endif
	if TentAsset_ClutterStatic5 && PositionRef_ClutterStatic5
		PlaceTentObject_ClutterStatic5()
	endif
	if Extended
		if !myClutterActivator1 && Extended.TentAsset_ClutterActivator1 && Extended.PositionRef_ClutterActivator1
			PlaceTentObject_ClutterActivator1(Extended)
		endif
		if !myClutterActivator2 && Extended.TentAsset_ClutterActivator2 && Extended.PositionRef_ClutterActivator2
			PlaceTentObject_ClutterActivator2(Extended)
		endif
		if !myClutterActivator3 && Extended.TentAsset_ClutterActivator3 && Extended.PositionRef_ClutterActivator3
			PlaceTentObject_ClutterActivator3(Extended)
		endif
		if !myClutterActivator4 && Extended.TentAsset_ClutterActivator4 && Extended.PositionRef_ClutterActivator4
			PlaceTentObject_ClutterActivator4(Extended)
		endif
		if !myClutterActivator5 && Extended.TentAsset_ClutterActivator5 && Extended.PositionRef_ClutterActivator5
			PlaceTentObject_ClutterActivator5(Extended)
		endif
	endif
	if PositionRef_Lantern1
		PlaceTentObject_Lantern1()
	endif
	if Extended
		if Extended.PositionRef_Lantern2
			PlaceTentObject_Lantern2()
		endif
		if Extended.PositionRef_Lantern3
			PlaceTentObject_Lantern3()
		endif
	endif
	if PositionRef_Player_WeaponMainHand
		PlaceTentObject_PlayerMainWeapon()
	endif
	if PositionRef_Player_WeaponOffHand
		PlaceTentObject_PlayerOffHandWeapon()
	endif
	if PositionRef_Player_WeaponTwoHand
		PlaceTentObject_PlayerBigWeapon()
	endif
	if PositionRef_Player_WeaponBow
		PlaceTentObject_PlayerBow()
	endif
	if PositionRef_Player_ArmorHelm
		PlaceTentObject_PlayerHelm()
	endif
	if PositionRef_Player_ArmorBoots
		PlaceTentObject_PlayerBoots()
	endif
	if PositionRef_Player_ArmorGauntlets
		PlaceTentObject_PlayerGauntlets()
	endif
	if PositionRef_Player_ArmorCuirass
		PlaceTentObject_PlayerCuirass()
	endif
	if PositionRef_Player_Backpack
		PlaceTentObject_PlayerBackpack()
	endif
	if PositionRef_Player_Shield
		PlaceTentObject_PlayerShield()
	endif
	if PositionRef_Player_ShieldInterior
		PlaceTentObject_PlayerShieldInterior()
	endif
	if Extended
		if Extended.PositionRef_Follower1_WeaponMainHand
			PlaceTentObject_Follower1MainWeapon()
		endif
		if Extended.PositionRef_Follower1_WeaponOffHand
			PlaceTentObject_Follower1OffHandWeapon()
		endif
		if Extended.PositionRef_Follower1_WeaponTwoHand
			PlaceTentObject_Follower1BigWeapon()
		endif
		if Extended.PositionRef_Follower1_WeaponBow
			PlaceTentObject_Follower1Bow()
		endif
		if Extended.PositionRef_Follower1_Shield
			PlaceTentObject_Follower1Shield()
		endif
		if Extended.PositionRef_Follower2_WeaponMainHand
			PlaceTentObject_Follower2MainWeapon()
		endif
		if Extended.PositionRef_Follower2_WeaponOffHand
			PlaceTentObject_Follower2OffHandWeapon()
		endif
		if Extended.PositionRef_Follower2_WeaponTwoHand
			PlaceTentObject_Follower2BigWeapon()
		endif
		if Extended.PositionRef_Follower2_WeaponBow
			PlaceTentObject_Follower2Bow()
		endif
		if Extended.PositionRef_Follower2_Shield
			PlaceTentObject_Follower2Shield()
		endif
		if Extended.PositionRef_Follower3_WeaponMainHand
			PlaceTentObject_Follower3MainWeapon()
		endif
		if Extended.PositionRef_Follower3_WeaponOffHand
			PlaceTentObject_Follower3OffHandWeapon()
		endif
		if Extended.PositionRef_Follower3_WeaponTwoHand
			PlaceTentObject_Follower3BigWeapon()
		endif
		if Extended.PositionRef_Follower3_WeaponBow
			PlaceTentObject_Follower3Bow()
		endif
		if Extended.PositionRef_Follower3_Shield
			PlaceTentObject_Follower3Shield()
		endif
	endif
	PlaceTentObject_PlayerSitMarker()
	PlaceTentObject_PlayerLayDownMarker()
	if PositionRef_FrontExitMarker
		PlaceTentObject_ExitFront()
	endif
	PlaceTentObject_BedRoll()
	if Extended
		if Extended.PositionRef_Follower1_Bed
			PlaceTentObject_SpareBedRoll1()
		endif
		if Extended.PositionRef_Follower1_Bed
			PlaceTentObject_SpareBedRoll2()
		endif
		if Extended.PositionRef_Follower1_Bed
			PlaceTentObject_SpareBedRoll3()
		endif
	endif

	if self.GetDistance(myBedRoll) > 20.0
		self.MoveTo(myBedRoll)
	endif
endFunction

function QueueThreads()
	CampTentEx Extended = self as CampTentEx
	if TentAsset_ShelterModel && PositionRef_Shelter
		PlaceTentObjectThreaded_Tent()
	endif
	if myTent && TentAsset_ShelterModelExterior && PositionRef_Shelter
		PlaceTentObjectThreaded_NormalTent()
	endif
	if myTent && TentAsset_ShelterModelMaterialSnow && PositionRef_Shelter
		PlaceTentObjectThreaded_SnowTent()
	endif
	if myTent && TentAsset_ShelterModelMaterialAsh && PositionRef_Shelter
		PlaceTentObjectThreaded_AshTent()
	endif
	TentSystem.ApplySnow(self)
	PlaceTentObjectThreaded_Ward()
	if TentAsset_ClutterStatic1 && PositionRef_ClutterStatic1
		PlaceTentObjectThreaded_ClutterStatic1()
	endif
	if TentAsset_ClutterStatic2 && PositionRef_ClutterStatic2
		PlaceTentObjectThreaded_ClutterStatic2()
	endif
	if TentAsset_ClutterStatic3 && PositionRef_ClutterStatic3
		PlaceTentObjectThreaded_ClutterStatic3()
	endif
	if TentAsset_ClutterStatic4 && PositionRef_ClutterStatic4
		PlaceTentObjectThreaded_ClutterStatic4()
	endif
	if TentAsset_ClutterStatic5 && PositionRef_ClutterStatic5
		PlaceTentObjectThreaded_ClutterStatic5()
	endif
	if Extended
		if !myClutterActivator1 && Extended.TentAsset_ClutterActivator1 && Extended.PositionRef_ClutterActivator1
			PlaceTentObjectThreaded_ClutterActivator1(Extended)
		endif
		if !myClutterActivator2 && Extended.TentAsset_ClutterActivator2 && Extended.PositionRef_ClutterActivator2
			PlaceTentObjectThreaded_ClutterActivator2(Extended)
		endif
		if !myClutterActivator3 && Extended.TentAsset_ClutterActivator3 && Extended.PositionRef_ClutterActivator3
			PlaceTentObjectThreaded_ClutterActivator3(Extended)
		endif
		if !myClutterActivator4 && Extended.TentAsset_ClutterActivator4 && Extended.PositionRef_ClutterActivator4
			PlaceTentObjectThreaded_ClutterActivator4(Extended)
		endif
		if !myClutterActivator5 && Extended.TentAsset_ClutterActivator5 && Extended.PositionRef_ClutterActivator5
			PlaceTentObjectThreaded_ClutterActivator5(Extended)
		endif
	endif
	if PositionRef_Lantern1
		PlaceTentObjectThreaded_Lantern1()
	endif
	if Extended
		if Extended.PositionRef_Lantern2
			PlaceTentObjectThreaded_Lantern2()
		endif
		if Extended.PositionRef_Lantern3
			PlaceTentObjectThreaded_Lantern3()
		endif
	endif
	if PositionRef_Player_WeaponMainHand
		PlaceTentObjectThreaded_PlayerMainWeapon()
	endif
	if PositionRef_Player_WeaponOffHand
		PlaceTentObjectThreaded_PlayerOffHandWeapon()
	endif
	if PositionRef_Player_WeaponTwoHand
		PlaceTentObjectThreaded_PlayerBigWeapon()
	endif
	if PositionRef_Player_WeaponBow
		PlaceTentObjectThreaded_PlayerBow()
	endif
	if PositionRef_Player_ArmorHelm
		PlaceTentObjectThreaded_PlayerHelm()
	endif
	if PositionRef_Player_ArmorBoots
		PlaceTentObjectThreaded_PlayerBoots()
	endif
	if PositionRef_Player_ArmorGauntlets
		PlaceTentObjectThreaded_PlayerGauntlets()
	endif
	if PositionRef_Player_ArmorCuirass
		PlaceTentObjectThreaded_PlayerCuirass()
	endif
	if PositionRef_Player_Backpack
		PlaceTentObjectThreaded_PlayerBackpack()
	endif
	if PositionRef_Player_Shield
		PlaceTentObjectThreaded_PlayerShield()
	endif
	if PositionRef_Player_ShieldInterior
		PlaceTentObjectThreaded_PlayerShieldInterior()
	endif
	if Extended
		if Extended.PositionRef_Follower1_WeaponMainHand
			PlaceTentObjectThreaded_Follower1MainWeapon()
		endif
		if Extended.PositionRef_Follower1_WeaponOffHand
			PlaceTentObjectThreaded_Follower1OffHandWeapon()
		endif
		if Extended.PositionRef_Follower1_WeaponTwoHand
			PlaceTentObjectThreaded_Follower1BigWeapon()
		endif
		if Extended.PositionRef_Follower1_WeaponBow
			PlaceTentObjectThreaded_Follower1Bow()
		endif
		if Extended.PositionRef_Follower1_Shield
			PlaceTentObjectThreaded_Follower1Shield()
		endif
		if Extended.PositionRef_Follower2_WeaponMainHand
			PlaceTentObjectThreaded_Follower2MainWeapon()
		endif
		if Extended.PositionRef_Follower2_WeaponOffHand
			PlaceTentObjectThreaded_Follower2OffHandWeapon()
		endif
		if Extended.PositionRef_Follower2_WeaponTwoHand
			PlaceTentObjectThreaded_Follower2BigWeapon()
		endif
		if Extended.PositionRef_Follower2_WeaponBow
			PlaceTentObjectThreaded_Follower2Bow()
		endif
		if Extended.PositionRef_Follower2_Shield
			PlaceTentObjectThreaded_Follower2Shield()
		endif
		if Extended.PositionRef_Follower3_WeaponMainHand
			PlaceTentObjectThreaded_Follower3MainWeapon()
		endif
		if Extended.PositionRef_Follower3_WeaponOffHand
			PlaceTentObjectThreaded_Follower3OffHandWeapon()
		endif
		if Extended.PositionRef_Follower3_WeaponTwoHand
			PlaceTentObjectThreaded_Follower3BigWeapon()
		endif
		if Extended.PositionRef_Follower3_WeaponBow
			PlaceTentObjectThreaded_Follower3Bow()
		endif
		if Extended.PositionRef_Follower3_Shield
			PlaceTentObjectThreaded_Follower3Shield()
		endif
	endif
	PlaceTentObjectThreaded_PlayerSitMarker()
	PlaceTentObjectThreaded_PlayerLayDownMarker()
	if PositionRef_FrontExitMarker
		PlaceTentObjectThreaded_ExitFront()
	endif
	PlaceTentObjectThreaded_BedRoll()
	if Extended
		if Extended.PositionRef_Follower1_Bed
			PlaceTentObjectThreaded_SpareBedRoll1()
		endif
		if Extended.PositionRef_Follower1_Bed
			PlaceTentObjectThreaded_SpareBedRoll2()
		endif
		if Extended.PositionRef_Follower1_Bed
			PlaceTentObjectThreaded_SpareBedRoll3()
		endif
	endif

	;if self.GetDistance(myBedRoll) > 20.0
	;	self.MoveTo(myBedRoll)
	;endif
endFunction

function GetResults()
	while !myTent
		myTent = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread01).get_result()
	endWhile
	while !myClutterStatic1
		myClutterStatic1 = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread02).get_result()
	endWhile
	;/while !myTent
		= (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread03).get_result()
	endWhile
	while !myTent
		= (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread04).get_result()
	endWhile
	while !myTent
		= (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread05).get_result()
	endWhile
	while !myTent
		= (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread06).get_result()
	endWhile/;
	while !myPlayerMarker_MainWeapon 
		myPlayerMarker_MainWeapon = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread07).get_result()
	endWhile
	while !myPlayerMarker_OffHandWeapon
		myPlayerMarker_OffHandWeapon = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread08).get_result()
	endWhile
	while !myPlayerMarker_BigWeapon
		myPlayerMarker_BigWeapon = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread09).get_result()
	endWhile
	while !myPlayerMarker_Bow
		myPlayerMarker_Bow = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread10).get_result()
	endWhile
	while !myPlayerMarker_Shield
		myPlayerMarker_Shield = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread11).get_result()
	endWhile
	while !myPlayerMarker_Cuirass
		myPlayerMarker_Cuirass = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread12).get_result()
	endWhile
	while !myPlayerMarker_Helm
		myPlayerMarker_Helm = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread13).get_result()
	endWhile
	while !myPlayerMarker_Boots
		myPlayerMarker_Boots = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread14).get_result()
	endWhile
	while !myPlayerMarker_Gauntlets
		myPlayerMarker_Gauntlets = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread15).get_result()
	endWhile
	while !myPlayerMarker_Backpack
		myPlayerMarker_Backpack = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread16).get_result()
	endWhile
	while !myPlayerMarker_ShieldInterior
		myPlayerMarker_ShieldInterior = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread17).get_result()
	endWhile
	while !myPlayerSitMarker
		myPlayerSitMarker = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread18).get_result()
	endWhile
	while !myPlayerLayDownMarker
		myPlayerLayDownMarker = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread19).get_result()
	endWhile
	while !myExitFront
		myExitFront = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread20).get_result()
	endWhile
	while !myBedRoll
		myBedRoll = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread21).get_result()
	endWhile
	while !myWard
		myWard = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread22).get_result()
	endWhile
	while !myLanternUnlit
		myLanternUnlit = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread23).get_result()
	endWhile
	while !myLanternLit
		myLanternLit = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread24).get_result()
	endWhile
	while !myLanternLight
		myLanternLight = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread25).get_result()
	endWhile
endFunction

function TearDown()
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
	TryToDisableAndDeleteRef(myClutterStatic1)
	TryToDisableAndDeleteRef(myClutterStatic2)
	TryToDisableAndDeleteRef(myClutterStatic3)
	TryToDisableAndDeleteRef(myClutterStatic4)
	TryToDisableAndDeleteRef(myClutterStatic5)
	TryToDisableAndDeleteRef(myClutterActivator1)
	TryToDisableAndDeleteRef(myClutterActivator2)
	TryToDisableAndDeleteRef(myClutterActivator3)
	TryToDisableAndDeleteRef(myClutterActivator4)
	TryToDisableAndDeleteRef(myClutterActivator5)
	TryToDisableAndDeleteRef(myClutterFurniture1)
	TryToDisableAndDeleteRef(myClutterFurniture2)
	TryToDisableAndDeleteRef(myClutterFurniture3)
	TryToDisableAndDeleteRef(myClutterFurniture4)
	TryToDisableAndDeleteRef(myClutterFurniture5)
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
endFunction

function GenerateDebugReport()
	debug.trace("[Campfire] Placement complete. Placed object report:")
	debug.trace("[Campfire] ======================================================================")
	debug.trace("[Campfire] myTent: " + myTent)
	debug.trace("[Campfire] myTentExterior: " + myTentExterior)
	debug.trace("[Campfire] myNormalTent: " + myNormalTent)
	debug.trace("[Campfire] mySnowTent: " + mySnowTent)
	debug.trace("[Campfire] myAshTent: " + myAshTent)
	debug.trace("[Campfire] myLanternLit: " + myLanternLit)
	debug.trace("[Campfire] myLanternUnlit: " + myLanternUnlit)
	debug.trace("[Campfire] myLanternLight: " + myLanternLight)
	debug.trace("[Campfire] myLanternLit2: " + myLanternLit2)
	debug.trace("[Campfire] myLanternUnlit2: " + myLanternUnlit2)
	debug.trace("[Campfire] myLanternLight2: " + myLanternLight2)
	debug.trace("[Campfire] myLanternLit3: " + myLanternLit3)
	debug.trace("[Campfire] myLanternUnlit3: " + myLanternUnlit3)
	debug.trace("[Campfire] myLanternLight3: " + myLanternLight3)
	debug.trace("[Campfire] myPlayerMarker_MainWeapon: " + myPlayerMarker_MainWeapon)
	debug.trace("[Campfire] myPlayerMarker_OffHandWeapon: " + myPlayerMarker_OffHandWeapon)
	debug.trace("[Campfire] myPlayerMarker_BigWeapon: " + myPlayerMarker_BigWeapon)
	debug.trace("[Campfire] myPlayerMarker_Bow: " + myPlayerMarker_Bow)
	debug.trace("[Campfire] myPlayerMarker_Helm: " + myPlayerMarker_Helm)
	debug.trace("[Campfire] myPlayerMarker_Boots: " + myPlayerMarker_Boots)
	debug.trace("[Campfire] myPlayerMarker_Gauntlets: " + myPlayerMarker_Gauntlets)
	debug.trace("[Campfire] myPlayerMarker_Cuirass: " + myPlayerMarker_Cuirass)
	debug.trace("[Campfire] myPlayerMarker_Backpack: " + myPlayerMarker_Backpack)
	debug.trace("[Campfire] myPlayerMarker_Shield: " + myPlayerMarker_Shield)
	debug.trace("[Campfire] myPlayerMarker_ShieldInterior: " + myPlayerMarker_ShieldInterior)
	debug.trace("[Campfire] myFollowerAMarker_MainWeapon: " + myFollowerAMarker_MainWeapon)
	debug.trace("[Campfire] myFollowerAMarker_OffHandWeapon: " + myFollowerAMarker_OffHandWeapon)
	debug.trace("[Campfire] myFollowerAMarker_BigWeapon: " + myFollowerAMarker_BigWeapon)
	debug.trace("[Campfire] myFollowerAMarker_Bow: " + myFollowerAMarker_Bow)
	debug.trace("[Campfire] myFollowerAMarker_Shield: " + myFollowerAMarker_Shield)
	debug.trace("[Campfire] myFollowerBMarker_MainWeapon: " + myFollowerBMarker_MainWeapon)
	debug.trace("[Campfire] myFollowerBMarker_OffHandWeapon: " + myFollowerBMarker_OffHandWeapon)
	debug.trace("[Campfire] myFollowerBMarker_BigWeapon: " + myFollowerBMarker_BigWeapon)
	debug.trace("[Campfire] myFollowerBMarker_Bow: " + myFollowerBMarker_Bow)
	debug.trace("[Campfire] myFollowerBMarker_Shield: " + myFollowerBMarker_Shield)
	debug.trace("[Campfire] myFollowerCMarker_MainWeapon: " + myFollowerCMarker_MainWeapon)
	debug.trace("[Campfire] myFollowerCMarker_OffHandWeapon: " + myFollowerCMarker_OffHandWeapon)
	debug.trace("[Campfire] myFollowerCMarker_BigWeapon: " + myFollowerCMarker_BigWeapon)
	debug.trace("[Campfire] myFollowerCMarker_Bow: " + myFollowerCMarker_Bow)
	debug.trace("[Campfire] myFollowerCMarker_Shield: " + myFollowerCMarker_Shield)
	debug.trace("[Campfire] myClutterStatic1: " + myClutterStatic1)
	debug.trace("[Campfire] myClutterStatic2: " + myClutterStatic2)
	debug.trace("[Campfire] myClutterStatic3: " + myClutterStatic3)
	debug.trace("[Campfire] myClutterStatic4: " + myClutterStatic4)
	debug.trace("[Campfire] myClutterStatic5: " + myClutterStatic5)
	debug.trace("[Campfire] myClutterActivator1: " + myClutterActivator1)
	debug.trace("[Campfire] myClutterActivator2: " + myClutterActivator2)
	debug.trace("[Campfire] myClutterActivator3: " + myClutterActivator3)
	debug.trace("[Campfire] myClutterActivator4: " + myClutterActivator4)
	debug.trace("[Campfire] myClutterActivator5: " + myClutterActivator5)
	debug.trace("[Campfire] myPlayerSitMarker: " + myPlayerSitMarker)
	debug.trace("[Campfire] myPlayerLayDownMarker: " + myPlayerLayDownMarker)
	debug.trace("[Campfire] myExitFront: " + myExitFront)
	debug.trace("[Campfire] myBedRoll: " + myBedRoll)
	debug.trace("[Campfire] mySpareBedRoll1: " + mySpareBedRoll1)
	debug.trace("[Campfire] mySpareBedRoll2: " + mySpareBedRoll2)
	debug.trace("[Campfire] mySpareBedRoll3: " + mySpareBedRoll3)
	debug.trace("[Campfire] myWard: " + myWard)
	debug.trace("[Campfire] ======================================================================")
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction




function PlaceTentObjectThreaded_Tent()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread01).queue_placement(PositionRef_Shelter, PositionRef_Shelter, self, TentAsset_ShelterModel, myOriginAng)
endFunction

function PlaceTentObjectThreaded_NormalTent()
	;myNormalTent = myTent.PlaceAtMe(TentAsset_ShelterModelExterior, abInitiallyDisabled = true)	
endFunction

function PlaceTentObjectThreaded_SnowTent()
	;mySnowTent = myTent.PlaceAtMe(TentAsset_ShelterModelMaterialSnow, abInitiallyDisabled = true)
endFunction

function PlaceTentObjectThreaded_AshTent()
	;myAshTent = myTent.PlaceAtMe(TentAsset_ShelterModelMaterialAsh, abInitiallyDisabled = true)
endFunction

function PlaceTentObjectThreaded_ClutterStatic1()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread02).queue_placement(PositionRef_Shelter, PositionRef_ClutterStatic1, self, TentAsset_ClutterStatic1, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterStatic2()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread03).queue_placement(PositionRef_Shelter, PositionRef_ClutterStatic2, self, TentAsset_ClutterStatic2, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterStatic3()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread04).queue_placement(PositionRef_Shelter, PositionRef_ClutterStatic3, self, TentAsset_ClutterStatic3, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterStatic4()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread05).queue_placement(PositionRef_Shelter, PositionRef_ClutterStatic4, self, TentAsset_ClutterStatic4, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterStatic5()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread06).queue_placement(PositionRef_Shelter, PositionRef_ClutterStatic5, self, TentAsset_ClutterStatic5, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator1(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator1, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator2(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator2, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator3(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator3, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator4(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator4, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator5(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator5, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture1(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture1, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture2(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture2, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture3(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture3, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture4(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture4, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture5(CampTentEx Extended)
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture5, myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerMainWeapon()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread07).queue_placement(PositionRef_Shelter, PositionRef_Player_WeaponMainHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerOffHandWeapon()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread08).queue_placement(PositionRef_Shelter, PositionRef_Player_WeaponOffHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerBigWeapon()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread09).queue_placement(PositionRef_Shelter, PositionRef_Player_WeaponTwoHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerBow()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread10).queue_placement(PositionRef_Shelter, PositionRef_Player_WeaponBow, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerShield()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread11).queue_placement(PositionRef_Shelter, PositionRef_Player_Shield, self, TentSystem.GetXMarker(), myOriginAng, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true)
endFunction

function PlaceTentObjectThreaded_PlayerCuirass()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread12).queue_placement(PositionRef_Shelter, PositionRef_Player_ArmorCuirass, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerHelm()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread13).queue_placement(PositionRef_Shelter, PositionRef_Player_ArmorHelm, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerBoots()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread14).queue_placement(PositionRef_Shelter, PositionRef_Player_ArmorBoots, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerGauntlets()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread15).queue_placement(PositionRef_Shelter, PositionRef_Player_ArmorGauntlets, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerBackpack()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread16).queue_placement(PositionRef_Shelter, PositionRef_Player_Backpack, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerShieldInterior()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread17).queue_placement(PositionRef_Shelter, PositionRef_Player_ShieldInterior, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerSitMarker()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread18).queue_placement(PositionRef_Shelter, RequiredPositionRef_SitFurniture, self, TentSystem.GetSitMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerLayDownMarker()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread19).queue_placement(PositionRef_Shelter, RequiredPositionRef_LieDownFurniture, self, TentSystem.GetLieDownMarker(), myOriginAng, z_local_ang_adjust = 180.0)
endFunction

function PlaceTentObjectThreaded_ExitFront()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread20).queue_placement(PositionRef_Shelter, PositionRef_FrontExitMarker, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_BedRoll()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread21).queue_placement(PositionRef_Shelter, RequiredPositionRef_PlayerBed, self, TentSystem.GetPlayerBedroll(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_Ward()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread22).queue_placement(PositionRef_Shelter, PositionRef_Ward, self, TentSystem.GetWard(), myOriginAng, x_local_ang_adjust = -90.0, is_propped = true)
endFunction

function PlaceTentObjectThreaded_Lantern1()
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread23).queue_placement(PositionRef_Shelter, PositionRef_Lantern1, self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng)
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread24).queue_placement(PositionRef_Shelter, PositionRef_Lantern1, self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, initially_disabled = true)
	(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread25).queue_placement(PositionRef_Shelter, PositionRef_Lantern1, self, TentSystem.GetLanternLight(), myOriginAng, initially_disabled = true)
endFunction

function PlaceTentObjectThreaded_Lantern2()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng)
	;myLanternLit2 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit2_Pos, abInitiallyDisabled = true)
	;myLanternLight2 = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight2_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObjectThreaded_Lantern3()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng, myLanternUnlit3_Pos)
	;myLanternLit3 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit3_Pos, abInitiallyDisabled = true)
	;myLanternLight3 = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight3_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObjectThreaded_SpareBedRoll1()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll1_Pos)
endFunction

function PlaceTentObjectThreaded_SpareBedRoll2()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll2_Pos)
endFunction

function PlaceTentObjectThreaded_SpareBedRoll3()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll3_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1MainWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_MainWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1OffHandWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1BigWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_BigWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1Bow()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_Bow_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1Shield()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObjectThreaded_Follower2MainWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_MainWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower2OffHandWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower2BigWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_BigWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower2Bow()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_Bow_Pos)
endFunction

function PlaceTentObjectThreaded_Follower2Shield()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObjectThreaded_Follower3MainWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_MainWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower3OffHandWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower3BigWeapon()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_BigWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower3Bow()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_Bow_Pos)
endFunction

function PlaceTentObjectThreaded_Follower3Shield()
	;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

























function PlaceTentObject_Tent()
	myTent = PlaceAtMeRelative(self, TentAsset_ShelterModel, myOriginAng, myTent_Pos)
endFunction

function PlaceTentObject_NormalTent()
	myNormalTent = myTent.PlaceAtMe(TentAsset_ShelterModelExterior, abInitiallyDisabled = true)	
endFunction

function PlaceTentObject_SnowTent()
	mySnowTent = myTent.PlaceAtMe(TentAsset_ShelterModelMaterialSnow, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_AshTent()
	myAshTent = myTent.PlaceAtMe(TentAsset_ShelterModelMaterialAsh, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_ClutterStatic1()
	myClutterStatic1 = PlaceAtMeRelative(self, TentAsset_ClutterStatic1, myOriginAng, myClutterStatic1_Pos)
endFunction

function PlaceTentObject_ClutterStatic2()
	myClutterStatic2 = PlaceAtMeRelative(self, TentAsset_ClutterStatic2, myOriginAng, myClutterStatic2_Pos)
endFunction

function PlaceTentObject_ClutterStatic3()
	myClutterStatic3 = PlaceAtMeRelative(self, TentAsset_ClutterStatic3, myOriginAng, myClutterStatic3_Pos)
endFunction

function PlaceTentObject_ClutterStatic4()
	myClutterStatic4 = PlaceAtMeRelative(self, TentAsset_ClutterStatic4, myOriginAng, myClutterStatic4_Pos)
endFunction

function PlaceTentObject_ClutterStatic5()
	myClutterStatic5 = PlaceAtMeRelative(self, TentAsset_ClutterStatic5, myOriginAng, myClutterStatic5_Pos)
endFunction

function PlaceTentObject_ClutterActivator1(CampTentEx Extended)
	myClutterActivator1 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterActivator1, myOriginAng, myClutterActivator1_Pos)
endFunction

function PlaceTentObject_ClutterActivator2(CampTentEx Extended)
	myClutterActivator2 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterActivator2, myOriginAng, myClutterActivator2_Pos)
endFunction

function PlaceTentObject_ClutterActivator3(CampTentEx Extended)
	myClutterActivator3 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterActivator3, myOriginAng, myClutterActivator3_Pos)
endFunction

function PlaceTentObject_ClutterActivator4(CampTentEx Extended)
	myClutterActivator4 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterActivator4, myOriginAng, myClutterActivator4_Pos)
endFunction

function PlaceTentObject_ClutterActivator5(CampTentEx Extended)
	myClutterActivator5 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterActivator5, myOriginAng, myClutterActivator5_Pos)
endFunction

function PlaceTentObject_ClutterFurniture1(CampTentEx Extended)
	myClutterFurniture1 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterFurniture1, myOriginAng, myClutterFurniture1_Pos)
endFunction

function PlaceTentObject_ClutterFurniture2(CampTentEx Extended)
	myClutterFurniture2 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterFurniture2, myOriginAng, myClutterFurniture2_Pos)
endFunction

function PlaceTentObject_ClutterFurniture3(CampTentEx Extended)
	myClutterFurniture3 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterFurniture3, myOriginAng, myClutterFurniture3_Pos)
endFunction

function PlaceTentObject_ClutterFurniture4(CampTentEx Extended)
	myClutterFurniture4 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterFurniture4, myOriginAng, myClutterFurniture4_Pos)
endFunction

function PlaceTentObject_ClutterFurniture5(CampTentEx Extended)
	myClutterFurniture5 = PlaceAtMeRelative(self, Extended.TentAsset_ClutterFurniture5, myOriginAng, myClutterFurniture5_Pos)
endFunction

function PlaceTentObject_PlayerMainWeapon()
	myPlayerMarker_MainWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_MainWeapon_Pos)
endFunction

function PlaceTentObject_PlayerOffHandWeapon()
	myPlayerMarker_OffHandWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObject_PlayerBigWeapon()
	myPlayerMarker_BigWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_BigWeapon_Pos)
endFunction

function PlaceTentObject_PlayerBow()
	myPlayerMarker_Bow = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_Bow_Pos)
endFunction

function PlaceTentObject_PlayerShield()
	myPlayerMarker_Shield = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObject_PlayerCuirass()
	myPlayerMarker_Cuirass = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_Cuirass_Pos)
endFunction

function PlaceTentObject_PlayerHelm()
	myPlayerMarker_Helm = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_Helm_Pos)
endFunction

function PlaceTentObject_PlayerBoots()
	myPlayerMarker_Boots = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_Boots_Pos)
endFunction

function PlaceTentObject_PlayerGauntlets()
	myPlayerMarker_Gauntlets = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_Gauntlets_Pos)
endFunction

function PlaceTentObject_PlayerBackpack()
	myPlayerMarker_Backpack = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_Backpack_Pos)
endFunction

function PlaceTentObject_PlayerShieldInterior()
	myPlayerMarker_ShieldInterior = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myPlayerMarker_ShieldInterior_Pos)
endFunction

function PlaceTentObject_PlayerSitMarker()
	myPlayerSitMarker = PlaceAtMeRelative(self, TentSystem.GetSitMarker(), myOriginAng, myPlayerSitMarker_Pos)
endFunction

function PlaceTentObject_PlayerLayDownMarker()
	myPlayerLayDownMarker = PlaceAtMeRelative(self, TentSystem.GetLieDownMarker(), myOriginAng, myPlayerLayDownMarker_Pos, fZLocalAngAdjust = 180.0)
endFunction

function PlaceTentObject_ExitFront()
	myExitFront = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myExitFront_Pos)
endFunction

function PlaceTentObject_BedRoll()
	myBedRoll = PlaceAtMeRelative(self, TentSystem.GetPlayerBedroll(), myOriginAng, myBedRoll_Pos)
endFunction

function PlaceTentObject_Ward()
	myWard = PlaceAtMeRelative(self, TentSystem.GetWard(), myOriginAng, myWard_Pos, fXLocalAngAdjust = -90.0, abIsPropped = true)
endFunction

function PlaceTentObject_Lantern1()
	;Place a lantern on the ground, unlit by default (lit lantern and light initially disabled)
	myLanternUnlit = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng, myLanternUnlit_Pos)
	myLanternLit = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit_Pos, abInitiallyDisabled = true)
	myLanternLight = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_Lantern2()
	myLanternUnlit2 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng, myLanternUnlit2_Pos)
	myLanternLit2 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit2_Pos, abInitiallyDisabled = true)
	myLanternLight2 = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight2_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_Lantern3()
	myLanternUnlit3 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng, myLanternUnlit3_Pos)
	myLanternLit3 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit3_Pos, abInitiallyDisabled = true)
	myLanternLight3 = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight3_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_SpareBedRoll1()
	mySpareBedRoll1 = PlaceAtMeRelative(self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll1_Pos)
endFunction

function PlaceTentObject_SpareBedRoll2()
	mySpareBedRoll2 = PlaceAtMeRelative(self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll2_Pos)
endFunction

function PlaceTentObject_SpareBedRoll3()
	mySpareBedRoll3 = PlaceAtMeRelative(self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll3_Pos)
endFunction

function PlaceTentObject_Follower1MainWeapon()
	myFollowerAMarker_MainWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_MainWeapon_Pos)
endFunction

function PlaceTentObject_Follower1OffHandWeapon()
	myFollowerAMarker_OffHandWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObject_Follower1BigWeapon()
	myFollowerAMarker_BigWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_BigWeapon_Pos)
endFunction

function PlaceTentObject_Follower1Bow()
	myFollowerAMarker_Bow = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_Bow_Pos)
endFunction

function PlaceTentObject_Follower1Shield()
	myFollowerAMarker_Shield = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObject_Follower2MainWeapon()
	myFollowerBMarker_MainWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_MainWeapon_Pos)
endFunction

function PlaceTentObject_Follower2OffHandWeapon()
	myFollowerBMarker_OffHandWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObject_Follower2BigWeapon()
	myFollowerBMarker_BigWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_BigWeapon_Pos)
endFunction

function PlaceTentObject_Follower2Bow()
	myFollowerBMarker_Bow = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_Bow_Pos)
endFunction

function PlaceTentObject_Follower2Shield()
	myFollowerBMarker_Shield = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObject_Follower3MainWeapon()
	myFollowerCMarker_MainWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_MainWeapon_Pos)
endFunction

function PlaceTentObject_Follower3OffHandWeapon()
	myFollowerCMarker_OffHandWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObject_Follower3BigWeapon()
	myFollowerCMarker_BigWeapon = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_BigWeapon_Pos)
endFunction

function PlaceTentObject_Follower3Bow()
	myFollowerCMarker_Bow = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_Bow_Pos)
endFunction

function PlaceTentObject_Follower3Shield()
	myFollowerCMarker_Shield = PlaceAtMeRelative(self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction