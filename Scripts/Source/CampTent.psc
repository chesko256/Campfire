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

Static property TentAsset_StaticClutter1 auto
{Optional: A static to place in or around the tent.}

Static property TentAsset_StaticClutter2 auto
{Optional: A static to place in or around the tent.}

Static property TentAsset_StaticClutter3 auto
{Optional: A static to place in or around the tent.}

Static property TentAsset_StaticClutter4 auto
{Optional: A static to place in or around the tent.}

Static property TentAsset_StaticClutter5 auto
{Optional: A static to place in or around the tent.}

ObjectReference property PositionRef_FrontExitMarker auto
{Optional: Position reference of marker to move the player to when exiting a small tent.}

ObjectReference property PositionRef_Shelter auto
{Optional: The shelter (tent, structure) position reference.}

ObjectReference property PositionRef_Ward auto

ObjectReference property PositionRef_Lantern1 auto
{Optional: The first lantern's position reference.}

ObjectReference property PositionRef_StaticClutter1 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_StaticClutter2 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_StaticClutter3 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_StaticClutter4 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_StaticClutter5 auto
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
float[] property myStaticClutter1_Pos auto hidden
float[] property myStaticClutter2_Pos auto hidden
float[] property myStaticClutter3_Pos auto hidden
float[] property myStaticClutter4_Pos auto hidden
float[] property myStaticClutter5_Pos auto hidden
float[] property myActivatorClutter1_Pos auto hidden
float[] property myActivatorClutter2_Pos auto hidden
float[] property myActivatorClutter3_Pos auto hidden
float[] property myActivatorClutter4_Pos auto hidden
float[] property myActivatorClutter5_Pos auto hidden
float[] property myFurnitureClutter1_Pos auto hidden
float[] property myFurnitureClutter2_Pos auto hidden
float[] property myFurnitureClutter3_Pos auto hidden
float[] property myFurnitureClutter4_Pos auto hidden
float[] property myFurnitureClutter5_Pos auto hidden
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
ObjectReference property myStaticClutter1 auto hidden
ObjectReference property myStaticClutter2 auto hidden
ObjectReference property myStaticClutter3 auto hidden
ObjectReference property myStaticClutter4 auto hidden
ObjectReference property myStaticClutter5 auto hidden
ObjectReference property myActivatorClutter1 auto hidden
ObjectReference property myActivatorClutter2 auto hidden
ObjectReference property myActivatorClutter3 auto hidden
ObjectReference property myActivatorClutter4 auto hidden
ObjectReference property myActivatorClutter5 auto hidden
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

Event OnInit()
	while !self.Is3DLoaded()
	endWhile

	RotateOnStartUp()

	CreatePositionArrays()

	myOriginAng = GetAngleData(self)

	SetRelativePositions()

	Placement()

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
	if PositionRef_StaticClutter1
		myStaticClutter1_Pos = new float[6]
	endif
	if PositionRef_StaticClutter2
		myStaticClutter2_Pos = new float[6]
	endif
	if PositionRef_StaticClutter3
		myStaticClutter3_Pos = new float[6]
	endif
	if PositionRef_StaticClutter4
		myStaticClutter4_Pos = new float[6]
	endif
	if PositionRef_StaticClutter5
		myStaticClutter5_Pos = new float[6]
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
		if Extended.PositionRef_ActivatorClutter1
			myActivatorClutter1_Pos = new float[6]
		endif
		if Extended.PositionRef_ActivatorClutter2
			myActivatorClutter2_Pos = new float[6]
		endif
		if Extended.PositionRef_ActivatorClutter3
			myActivatorClutter3_Pos = new float[6]
		endif
		if Extended.PositionRef_ActivatorClutter4
			myActivatorClutter4_Pos = new float[6]
		endif
		if Extended.PositionRef_ActivatorClutter5
			myActivatorClutter5_Pos = new float[6]
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
	endif
	if PositionRef_StaticClutter1
		myStaticClutter1_Pos = GetRelativePosition(myCenterObject, PositionRef_StaticClutter1)
	endif
	if PositionRef_StaticClutter2
		myStaticClutter2_Pos = GetRelativePosition(myCenterObject, PositionRef_StaticClutter2)
	endif
	if PositionRef_StaticClutter3
		myStaticClutter3_Pos = GetRelativePosition(myCenterObject, PositionRef_StaticClutter3)
	endif
	if PositionRef_StaticClutter4
		myStaticClutter4_Pos = GetRelativePosition(myCenterObject, PositionRef_StaticClutter4)
	endif
	if PositionRef_StaticClutter5
		myStaticClutter5_Pos = GetRelativePosition(myCenterObject, PositionRef_StaticClutter5)
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
		endif
		if Extended.PositionRef_Lantern3
			myLanternUnlit3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
			myLanternLit3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
			myLanternLight3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_Lantern2)
		endif
		if Extended.PositionRef_ActivatorClutter1
			myActivatorClutter1_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ActivatorClutter1)
		endif
		if Extended.PositionRef_ActivatorClutter2
			myActivatorClutter2_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ActivatorClutter2)
		endif
		if Extended.PositionRef_ActivatorClutter3
			myActivatorClutter3_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ActivatorClutter3)
		endif
		if Extended.PositionRef_ActivatorClutter4
			myActivatorClutter4_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ActivatorClutter4)
		endif
		if Extended.PositionRef_ActivatorClutter5
			myActivatorClutter5_Pos = GetRelativePosition(myCenterObject, Extended.PositionRef_ActivatorClutter5)
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
	if TentAsset_StaticClutter1 && PositionRef_StaticClutter1
		PlaceTentObject_StaticClutter1()
	endif
	if TentAsset_StaticClutter2 && PositionRef_StaticClutter2
		PlaceTentObject_StaticClutter2()
	endif
	if TentAsset_StaticClutter3 && PositionRef_StaticClutter3
		PlaceTentObject_StaticClutter3()
	endif
	if TentAsset_StaticClutter4 && PositionRef_StaticClutter4
		PlaceTentObject_StaticClutter4()
	endif
	if TentAsset_StaticClutter5 && PositionRef_StaticClutter5
		PlaceTentObject_StaticClutter5()
	endif
	if Extended
		if !myActivatorClutter1 && Extended.TentAsset_ActivatorClutter1 && Extended.PositionRef_ActivatorClutter1
			PlaceTentObject_ActivatorClutter1(Extended)
		endif
		if !myActivatorClutter2 && Extended.TentAsset_ActivatorClutter2 && Extended.PositionRef_ActivatorClutter2
			PlaceTentObject_ActivatorClutter2(Extended)
		endif
		if !myActivatorClutter3 && Extended.TentAsset_ActivatorClutter3 && Extended.PositionRef_ActivatorClutter3
			PlaceTentObject_ActivatorClutter3(Extended)
		endif
		if !myActivatorClutter4 && Extended.TentAsset_ActivatorClutter4 && Extended.PositionRef_ActivatorClutter4
			PlaceTentObject_ActivatorClutter4(Extended)
		endif
		if !myActivatorClutter5 && Extended.TentAsset_ActivatorClutter5 && Extended.PositionRef_ActivatorClutter5
			PlaceTentObject_ActivatorClutter5(Extended)
		endif
	endif
	if PositionRef_Lantern1
		PlaceTentObject_LanternLit()
		PlaceTentObject_LanternUnlit()
		PlaceTentObject_LanternLight()
	endif
	if Extended
		if !myLanternLit2 && Extended.PositionRef_Lantern2
			PlaceTentObject_LanternLit2()
		endif
		if !myLanternUnlit2 && Extended.PositionRef_Lantern2
			PlaceTentObject_LanternUnlit2()
		endif
		if !myLanternLight2 && Extended.PositionRef_Lantern2
			PlaceTentObject_LanternLight2()
		endif
		if !myLanternLit3 && Extended.PositionRef_Lantern3
			PlaceTentObject_LanternLit3()
		endif
		if !myLanternUnlit3 && Extended.PositionRef_Lantern3
			PlaceTentObject_LanternUnlit3()
		endif
		if !myLanternLight3 && Extended.PositionRef_Lantern3
			PlaceTentObject_LanternLight3()
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

	self.MoveTo(myBedRoll)
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
	debug.trace("[Campfire] myStaticClutter1: " + myStaticClutter1)
	debug.trace("[Campfire] myStaticClutter2: " + myStaticClutter2)
	debug.trace("[Campfire] myStaticClutter3: " + myStaticClutter3)
	debug.trace("[Campfire] myStaticClutter4: " + myStaticClutter4)
	debug.trace("[Campfire] myStaticClutter5: " + myStaticClutter5)
	debug.trace("[Campfire] myActivatorClutter1: " + myActivatorClutter1)
	debug.trace("[Campfire] myActivatorClutter2: " + myActivatorClutter2)
	debug.trace("[Campfire] myActivatorClutter3: " + myActivatorClutter3)
	debug.trace("[Campfire] myActivatorClutter4: " + myActivatorClutter4)
	debug.trace("[Campfire] myActivatorClutter5: " + myActivatorClutter5)
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

function PlaceTentObject_Tent()
	debug.trace("[Campfire] What is the value of myTent right now?: " + myTent)
	ObjectReference akTemp = PlaceAtMeRelative(self, TentAsset_ShelterModel, myOriginAng, myTent_Pos)
	debug.trace("[Campfire] What is the value of akTemp after placement?: " + akTemp)
	myTent = akTemp
	debug.trace("[Campfire] What is the value of myTent after placement?: " + myTent)
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

function PlaceTentObject_StaticClutter1()
	myStaticClutter1 = PlaceAtMeRelative(self, TentAsset_StaticClutter1, myOriginAng, myStaticClutter1_Pos)
endFunction

function PlaceTentObject_StaticClutter2()
	myStaticClutter2 = PlaceAtMeRelative(self, TentAsset_StaticClutter2, myOriginAng, myStaticClutter2_Pos)
endFunction

function PlaceTentObject_StaticClutter3()
	myStaticClutter3 = PlaceAtMeRelative(self, TentAsset_StaticClutter3, myOriginAng, myStaticClutter3_Pos)
endFunction

function PlaceTentObject_StaticClutter4()
	myStaticClutter4 = PlaceAtMeRelative(self, TentAsset_StaticClutter4, myOriginAng, myStaticClutter4_Pos)
endFunction

function PlaceTentObject_StaticClutter5()
	myStaticClutter5 = PlaceAtMeRelative(self, TentAsset_StaticClutter5, myOriginAng, myStaticClutter5_Pos)
endFunction

function PlaceTentObject_ActivatorClutter1(CampTentEx Extended)
	myActivatorClutter1 = PlaceAtMeRelative(self, Extended.TentAsset_ActivatorClutter1, myOriginAng, myActivatorClutter1_Pos)
endFunction

function PlaceTentObject_ActivatorClutter2(CampTentEx Extended)
	myActivatorClutter2 = PlaceAtMeRelative(self, Extended.TentAsset_ActivatorClutter2, myOriginAng, myActivatorClutter2_Pos)
endFunction

function PlaceTentObject_ActivatorClutter3(CampTentEx Extended)
	myActivatorClutter3 = PlaceAtMeRelative(self, Extended.TentAsset_ActivatorClutter3, myOriginAng, myActivatorClutter3_Pos)
endFunction

function PlaceTentObject_ActivatorClutter4(CampTentEx Extended)
	myActivatorClutter4 = PlaceAtMeRelative(self, Extended.TentAsset_ActivatorClutter4, myOriginAng, myActivatorClutter4_Pos)
endFunction

function PlaceTentObject_ActivatorClutter5(CampTentEx Extended)
	myActivatorClutter5 = PlaceAtMeRelative(self, Extended.TentAsset_ActivatorClutter5, myOriginAng, myActivatorClutter5_Pos)
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

function PlaceTentObject_LanternLit()
	myLanternLit = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_LanternUnlit()
	myLanternUnlit = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng, myLanternUnlit_Pos)
endFunction

function PlaceTentObject_LanternLight()
	myLanternLight = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_LanternLit2()

endFunction

function PlaceTentObject_LanternUnlit2()

endFunction

function PlaceTentObject_LanternLight2()

endFunction

function PlaceTentObject_LanternLit3()

endFunction

function PlaceTentObject_LanternUnlit3()

endFunction

function PlaceTentObject_LanternLight3()

endFunction

function PlaceTentObject_SpareBedRoll1()

endFunction

function PlaceTentObject_SpareBedRoll2()

endFunction

function PlaceTentObject_SpareBedRoll3()

endFunction

function PlaceTentObject_Follower1MainWeapon()

endFunction

function PlaceTentObject_Follower1OffHandWeapon()

endFunction

function PlaceTentObject_Follower1BigWeapon()

endFunction

function PlaceTentObject_Follower1Bow()

endFunction

function PlaceTentObject_Follower1Shield()

endFunction

function PlaceTentObject_Follower2MainWeapon()

endFunction

function PlaceTentObject_Follower2OffHandWeapon()

endFunction

function PlaceTentObject_Follower2BigWeapon()

endFunction

function PlaceTentObject_Follower2Bow()

endFunction

function PlaceTentObject_Follower2Shield()

endFunction

function PlaceTentObject_Follower3MainWeapon()

endFunction

function PlaceTentObject_Follower3OffHandWeapon()

endFunction

function PlaceTentObject_Follower3BigWeapon()

endFunction

function PlaceTentObject_Follower3Bow()

endFunction

function PlaceTentObject_Follower3Shield()

endFunction