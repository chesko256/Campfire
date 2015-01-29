;/********s* _Camp_PlaceableObjectBase/CampTent
* SCRIPTNAME
*/;
scriptname CampTent extends _Camp_PlaceableObjectBase
;*********/;

import CampUtil
import TentSystem

; REQUIRED PROPERTIES

;/********p* CampTent/Setting_BedRollScale
* SYNTAX
*/;
Float property Setting_BedRollScale = 1.0 auto
;/*
* DESCRIPTION
{ Optional: The scale to render the player's and follower's bed rolls. 1.0 by default. }
;*********/;

;/********p* CampTent/RequiredPositionRef_PlayerBed
* SYNTAX
*/;
ObjectReference property RequiredPositionRef_PlayerBed auto
;/* 
* DESCRIPTION
{ Required: The player's bed roll (main interactible) position reference. }
;*********/;

;/********p* CampTent/RequiredPositionRef_SitFurniture
* SYNTAX
*/;
ObjectReference property RequiredPositionRef_SitFurniture auto
;/* 
* DESCRIPTION
{ Required: The player's sitting furniture position reference. }
;*********/;

;/********p* CampTent/RequiredPositionRef_LieDownFurniture
* SYNTAX
*/;
ObjectReference property RequiredPositionRef_LieDownFurniture auto
;/* 
* DESCRIPTION
{ Required: The player's lying down furniture position reference. }
;*********/;

; OPTIONAL PROPERTIES
;/********p* CampTent/TentAsset_ShelterModel
* SYNTAX
*/;
Static property TentAsset_ShelterModel auto
;/*
* DESCRIPTION
{ Optional: The tent static object. }
;*********/;

;/********p* CampTent/TentAsset_ShelterModelExterior
* SYNTAX
*/;
Static property TentAsset_ShelterModelExterior auto
;/*
* DESCRIPTION
{ Optional: The tent static object exterior (for use with Toggle View feature). }
;*********/;

;/********p* CampTent/TentAsset_ShelterModelMaterialSnow
* SYNTAX
*/;
Static property TentAsset_ShelterModelMaterialSnow auto
;/*
* DESCRIPTION
{ Optional: The tent (ShelterModel or ShelterModelExterior) with snow directional shader applied. }
;*********/;

;/********p* CampTent/TentAsset_ShelterModelMaterialAsh
* SYNTAX
*/;
Static property TentAsset_ShelterModelMaterialAsh auto
;/*
* DESCRIPTION
{ Optional: The tent (ShelterModel or ShelterModelExterior) with ash directional shader applied (use _Camp_AshMaterialSolstheim1P_2 instead of a direct dependency on Dragonborn.esm) }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic1
* SYNTAX
*/;
Static property TentAsset_ClutterStatic1 auto
;/*
* DESCRIPTION
{ Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic2
* SYNTAX
*/;
Static property TentAsset_ClutterStatic2 auto
;/*
* DESCRIPTION
{ Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic3
* SYNTAX
*/;
Static property TentAsset_ClutterStatic3 auto
;/*
* DESCRIPTION
{ Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic4
* SYNTAX
*/;
Static property TentAsset_ClutterStatic4 auto
;/*
* DESCRIPTION
{ Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic5
* SYNTAX
*/;
Static property TentAsset_ClutterStatic5 auto
;/*
* DESCRIPTION
{ Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/PositionRef_FrontExitMarker
* SYNTAX
*/;
ObjectReference property PositionRef_FrontExitMarker auto
;/*
* DESCRIPTION
{ Optional: Position reference of marker to move the player to when exiting a small tent. }
;*********/;

;/********p* CampTent/PositionRef_Shelter
* SYNTAX
*/;
ObjectReference property PositionRef_Shelter auto
;/*
* DESCRIPTION
{ Optional: The shelter (tent, structure) position reference. }
;*********/;

;/********p* CampTent/PositionRef_Ward
* SYNTAX
*/;
ObjectReference property PositionRef_Ward auto
;/*
* DESCRIPTION
{ Optional: The ward position reference. }
;*********/;

;/********p* CampTent/PositionRef_Lantern1
* SYNTAX
*/;
ObjectReference property PositionRef_Lantern1 auto
;/*
* DESCRIPTION
{ Optional: The first lantern's position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic1 auto
;/*
* DESCRIPTION
{ Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic2 auto
;/*
* DESCRIPTION
{ Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic3
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic3 auto
;/*
* DESCRIPTION
{ Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic4
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic4 auto
;/*
* DESCRIPTION
{ Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic5
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic5 auto
;/*
* DESCRIPTION
{ Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_Player_Backpack
* SYNTAX
*/;
ObjectReference property PositionRef_Player_Backpack auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's backpack. }
;*********/;

;/********p* CampTent/PositionRef_Player_Shield
* SYNTAX
*/;
ObjectReference property PositionRef_Player_Shield auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's shield. }
;*********/;

;/********p* CampTent/PositionRef_Player_ShieldInterior
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ShieldInterior auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's shield when in an interior (usually lying flat). }
;*********/;

;/********p* CampTent/PositionRef_Player_WeaponMainHand
* SYNTAX
*/;
ObjectReference property PositionRef_Player_WeaponMainHand auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's main hand weapon. }
;*********/;

;/********p* CampTent/PositionRef_Player_WeaponOffHand
* SYNTAX
*/;
ObjectReference property PositionRef_Player_WeaponOffHand auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's off hand weapon. }
;*********/;

;/********p* CampTent/PositionRef_Player_WeaponTwoHand
* SYNTAX
*/;
ObjectReference property PositionRef_Player_WeaponTwoHand auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's two-handed weapon. }
;*********/;

;/********p* CampTent/PositionRef_Player_WeaponBow
* SYNTAX
*/;
ObjectReference property PositionRef_Player_WeaponBow auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's bow. }
;*********/;

;/********p* CampTent/PositionRef_Player_ArmorHelm
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ArmorHelm auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's head gear. }
;*********/;

;/********p* CampTent/PositionRef_Player_ArmorCuirass
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ArmorCuirass auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's body gear. }
;*********/;

;/********p* CampTent/PositionRef_Player_ArmorGauntlets
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ArmorGauntlets auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's hand gear. }
;*********/;

;/********p* CampTent/PositionRef_Player_ArmorBoots
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ArmorBoots auto
;/*
* DESCRIPTION
{ Optional: Position reference of player's foot gear. }
;*********/;

;/********p* CampTent/PositionRef_CenterObjectOverride
* SYNTAX
*/;
ObjectReference property PositionRef_CenterObjectOverride auto
;/*
* DESCRIPTION
{ Optional: Set this to specify a different object as the one which all other tent objects "orbit" when rotated. Uses the Shelter or Player Bed if left blank. }
;*********/;

; PRIVATE
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

;Futures
ObjectReference property myTentFuture auto hidden
ObjectReference property myNormalTentFuture auto hidden
ObjectReference property mySnowTentFuture auto hidden
ObjectReference property myAshTentFuture auto hidden
ObjectReference property myLanternLitFuture auto hidden
ObjectReference property myLanternUnlitFuture auto hidden
ObjectReference property myLanternLightFuture auto hidden
ObjectReference property myLanternLit2Future auto hidden
ObjectReference property myLanternUnlit2Future auto hidden
ObjectReference property myLanternLight2Future auto hidden
ObjectReference property myLanternLit3Future auto hidden
ObjectReference property myLanternUnlit3Future auto hidden
ObjectReference property myLanternLight3Future auto hidden
ObjectReference property myPlayerMarker_MainWeaponFuture auto hidden
ObjectReference property myPlayerMarker_OffHandWeaponFuture auto hidden
ObjectReference property myPlayerMarker_BigWeaponFuture auto hidden
ObjectReference property myPlayerMarker_BowFuture auto hidden
ObjectReference property myPlayerMarker_HelmFuture auto hidden
ObjectReference property myPlayerMarker_BootsFuture auto hidden
ObjectReference property myPlayerMarker_GauntletsFuture auto hidden
ObjectReference property myPlayerMarker_CuirassFuture auto hidden
ObjectReference property myPlayerMarker_BackpackFuture auto hidden
ObjectReference property myPlayerMarker_ShieldFuture auto hidden
ObjectReference property myPlayerMarker_ShieldInteriorFuture auto hidden
ObjectReference property myFollowerAMarker_MainWeaponFuture auto hidden
ObjectReference property myFollowerAMarker_OffHandWeaponFuture auto hidden
ObjectReference property myFollowerAMarker_BigWeaponFuture auto hidden
ObjectReference property myFollowerAMarker_BowFuture auto hidden
ObjectReference property myFollowerAMarker_ShieldFuture auto hidden
ObjectReference property myFollowerBMarker_MainWeaponFuture auto hidden
ObjectReference property myFollowerBMarker_OffHandWeaponFuture auto hidden
ObjectReference property myFollowerBMarker_BigWeaponFuture auto hidden
ObjectReference property myFollowerBMarker_BowFuture auto hidden
ObjectReference property myFollowerBMarker_ShieldFuture auto hidden
ObjectReference property myFollowerCMarker_MainWeaponFuture auto hidden
ObjectReference property myFollowerCMarker_OffHandWeaponFuture auto hidden
ObjectReference property myFollowerCMarker_BigWeaponFuture auto hidden
ObjectReference property myFollowerCMarker_BowFuture auto hidden
ObjectReference property myFollowerCMarker_ShieldFuture auto hidden
ObjectReference property myClutterStatic1Future auto hidden
ObjectReference property myClutterStatic2Future auto hidden
ObjectReference property myClutterStatic3Future auto hidden
ObjectReference property myClutterStatic4Future auto hidden
ObjectReference property myClutterStatic5Future auto hidden
ObjectReference property myClutterActivator1Future auto hidden
ObjectReference property myClutterActivator2Future auto hidden
ObjectReference property myClutterActivator3Future auto hidden
ObjectReference property myClutterActivator4Future auto hidden
ObjectReference property myClutterActivator5Future auto hidden
ObjectReference property myClutterFurniture1Future auto hidden
ObjectReference property myClutterFurniture2Future auto hidden
ObjectReference property myClutterFurniture3Future auto hidden
ObjectReference property myClutterFurniture4Future auto hidden
ObjectReference property myClutterFurniture5Future auto hidden
ObjectReference property myPlayerSitMarkerFuture auto hidden
ObjectReference property myPlayerLayDownMarkerFuture auto hidden
ObjectReference property myExitFrontFuture auto hidden
ObjectReference property myBedRollFuture auto hidden
ObjectReference property mySpareBedRoll1Future auto hidden
ObjectReference property mySpareBedRoll2Future auto hidden
ObjectReference property mySpareBedRoll3Future auto hidden
ObjectReference property myWardFuture auto hidden

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

function Update()
	UpdateTentUseState(self)
endFunction

Event OnActivate(ObjectReference akActionRef)
	ActivateTent(akActionRef, self)
endEvent

;@Override _Camp_PlaceableObjectBase
function PlaceObjects()
	CampTentEx Extended = self as CampTentEx

	if PositionRef_CenterObjectOverride
		CenterObject = PositionRef_CenterObjectOverride
	else
		if PositionRef_Shelter
			CenterObject = PositionRef_Shelter
		else
			CenterObject = RequiredPositionRef_PlayerBed
		endif
	endif

	if TentAsset_ShelterModel && PositionRef_Shelter
		PlaceObject_Tent()
	endif
	if TentAsset_ShelterModelExterior && PositionRef_Shelter
		PlaceObject_NormalTent()
	endif
	if TentAsset_ShelterModelMaterialSnow && PositionRef_Shelter
		PlaceObject_SnowTent()
	endif
	if TentAsset_ShelterModelMaterialAsh && PositionRef_Shelter
		PlaceObject_AshTent()
	endif
	PlaceObject_Ward()
	if TentAsset_ClutterStatic1 && PositionRef_ClutterStatic1
		PlaceObject_ClutterStatic1()
	endif
	if TentAsset_ClutterStatic2 && PositionRef_ClutterStatic2
		PlaceObject_ClutterStatic2()
	endif
	if TentAsset_ClutterStatic3 && PositionRef_ClutterStatic3
		PlaceObject_ClutterStatic3()
	endif
	if TentAsset_ClutterStatic4 && PositionRef_ClutterStatic4
		PlaceObject_ClutterStatic4()
	endif
	if TentAsset_ClutterStatic5 && PositionRef_ClutterStatic5
		PlaceObject_ClutterStatic5()
	endif
	if Extended
		if Extended.TentAsset_ClutterActivator1 && Extended.PositionRef_ClutterActivator1
			PlaceObject_ClutterActivator1(Extended)
		endif
		if Extended.TentAsset_ClutterActivator2 && Extended.PositionRef_ClutterActivator2
			PlaceObject_ClutterActivator2(Extended)
		endif
		if Extended.TentAsset_ClutterActivator3 && Extended.PositionRef_ClutterActivator3
			PlaceObject_ClutterActivator3(Extended)
		endif
		if Extended.TentAsset_ClutterActivator4 && Extended.PositionRef_ClutterActivator4
			PlaceObject_ClutterActivator4(Extended)
		endif
		if Extended.TentAsset_ClutterActivator5 && Extended.PositionRef_ClutterActivator5
			PlaceObject_ClutterActivator5(Extended)
		endif
		if Extended.TentAsset_ClutterFurniture1 && Extended.PositionRef_ClutterFurniture1
			PlaceObject_ClutterFurniture1(Extended)
		endif
		if Extended.TentAsset_ClutterFurniture2 && Extended.PositionRef_ClutterFurniture2
			PlaceObject_ClutterFurniture2(Extended)
		endif
		if Extended.TentAsset_ClutterFurniture3 && Extended.PositionRef_ClutterFurniture3
			PlaceObject_ClutterFurniture3(Extended)
		endif
		if Extended.TentAsset_ClutterFurniture4 && Extended.PositionRef_ClutterFurniture4
			PlaceObject_ClutterFurniture4(Extended)
		endif
		if Extended.TentAsset_ClutterFurniture5 && Extended.PositionRef_ClutterFurniture5
			PlaceObject_ClutterFurniture5(Extended)
		endif
	endif
	if PositionRef_Lantern1
		PlaceObject_Lantern1()
	endif
	if Extended
		if Extended.PositionRef_Lantern2
			PlaceObject_Lantern2(Extended)
		endif
		if Extended.PositionRef_Lantern3
			PlaceObject_Lantern3(Extended)
		endif
	endif
	if PositionRef_Player_WeaponMainHand
		PlaceObject_PlayerMainWeapon()
	endif
	if PositionRef_Player_WeaponOffHand
		PlaceObject_PlayerOffHandWeapon()
	endif
	if PositionRef_Player_WeaponTwoHand
		PlaceObject_PlayerBigWeapon()
	endif
	if PositionRef_Player_WeaponBow
		PlaceObject_PlayerBow()
	endif
	if PositionRef_Player_ArmorHelm
		PlaceObject_PlayerHelm()
	endif
	if PositionRef_Player_ArmorBoots
		PlaceObject_PlayerBoots()
	endif
	if PositionRef_Player_ArmorGauntlets
		PlaceObject_PlayerGauntlets()
	endif
	if PositionRef_Player_ArmorCuirass
		PlaceObject_PlayerCuirass()
	endif
	if PositionRef_Player_Backpack
		PlaceObject_PlayerBackpack()
	endif
	if PositionRef_Player_Shield
		PlaceObject_PlayerShield()
	endif
	if PositionRef_Player_ShieldInterior
		PlaceObject_PlayerShieldInterior()
	endif
	if Extended
		if Extended.PositionRef_Follower1_WeaponMainHand
			PlaceObject_Follower1MainWeapon(Extended)
		endif
		if Extended.PositionRef_Follower1_WeaponOffHand
			PlaceObject_Follower1OffHandWeapon(Extended)
		endif
		if Extended.PositionRef_Follower1_WeaponTwoHand
			PlaceObject_Follower1BigWeapon(Extended)
		endif
		if Extended.PositionRef_Follower1_WeaponBow
			PlaceObject_Follower1Bow(Extended)
		endif
		if Extended.PositionRef_Follower1_Shield
			PlaceObject_Follower1Shield(Extended)
		endif
		if Extended.PositionRef_Follower2_WeaponMainHand
			PlaceObject_Follower2MainWeapon(Extended)
		endif
		if Extended.PositionRef_Follower2_WeaponOffHand
			PlaceObject_Follower2OffHandWeapon(Extended)
		endif
		if Extended.PositionRef_Follower2_WeaponTwoHand
			PlaceObject_Follower2BigWeapon(Extended)
		endif
		if Extended.PositionRef_Follower2_WeaponBow
			PlaceObject_Follower2Bow(Extended)
		endif
		if Extended.PositionRef_Follower2_Shield
			PlaceObject_Follower2Shield(Extended)
		endif
		if Extended.PositionRef_Follower3_WeaponMainHand
			PlaceObject_Follower3MainWeapon(Extended)
		endif
		if Extended.PositionRef_Follower3_WeaponOffHand
			PlaceObject_Follower3OffHandWeapon(Extended)
		endif
		if Extended.PositionRef_Follower3_WeaponTwoHand
			PlaceObject_Follower3BigWeapon(Extended)
		endif
		if Extended.PositionRef_Follower3_WeaponBow
			PlaceObject_Follower3Bow(Extended)
		endif
		if Extended.PositionRef_Follower3_Shield
			PlaceObject_Follower3Shield(Extended)
		endif
	endif
	PlaceObject_PlayerSitMarker()
	PlaceObject_PlayerLayDownMarker()
	if PositionRef_FrontExitMarker
		PlaceObject_ExitFront()
	endif
	PlaceObject_BedRoll()
	if Extended
		if Extended.PositionRef_Follower1_Bed
			PlaceObject_SpareBedRoll1(Extended)
		endif
		if Extended.PositionRef_Follower2_Bed
			PlaceObject_SpareBedRoll2(Extended)
		endif
		if Extended.PositionRef_Follower3_Bed
			PlaceObject_SpareBedRoll3(Extended)
		endif
	endif
endFunction

;@Override _Camp_PlaceableObjectBase
function GetResults()
	if myTentFuture
		myTent = GetFuture(myTentFuture).get_result()
	endif
	if myNormalTentFuture
		myNormalTent = GetFuture(myNormalTentFuture).get_result()
	endif
	if mySnowTentFuture
		mySnowTent = GetFuture(mySnowTentFuture).get_result()
	endif
	if myAshTentFuture
		myAshTent = GetFuture(myAshTentFuture).get_result()
	endif
	TentSystem.SelectExterior(self)
	if myPlayerMarker_MainWeaponFuture
		myPlayerMarker_MainWeapon = GetFuture(myPlayerMarker_MainWeaponFuture).get_result()
	endif
	if myPlayerMarker_OffHandWeaponFuture
		myPlayerMarker_OffHandWeapon = GetFuture(myPlayerMarker_OffHandWeaponFuture).get_result()
	endif
	if myPlayerMarker_BigWeaponFuture
		myPlayerMarker_BigWeapon = GetFuture(myPlayerMarker_BigWeaponFuture).get_result()
	endif
	if myPlayerMarker_BowFuture
		myPlayerMarker_Bow = GetFuture(myPlayerMarker_BowFuture).get_result()
	endif
	if myPlayerMarker_ShieldFuture
		myPlayerMarker_Shield = GetFuture(myPlayerMarker_ShieldFuture).get_result()
	endif
	if myPlayerMarker_CuirassFuture
		myPlayerMarker_Cuirass = GetFuture(myPlayerMarker_CuirassFuture).get_result()
	endif
	if myPlayerMarker_HelmFuture
		myPlayerMarker_Helm = GetFuture(myPlayerMarker_HelmFuture).get_result()
	endif
	if myPlayerMarker_BootsFuture
		myPlayerMarker_Boots = GetFuture(myPlayerMarker_BootsFuture).get_result()
	endif
	if myPlayerMarker_GauntletsFuture
		myPlayerMarker_Gauntlets = GetFuture(myPlayerMarker_GauntletsFuture).get_result()
	endif
	if myPlayerMarker_BackpackFuture
		myPlayerMarker_Backpack = GetFuture(myPlayerMarker_BackpackFuture).get_result()
	endif
	if myPlayerMarker_ShieldInteriorFuture
		myPlayerMarker_ShieldInterior = GetFuture(myPlayerMarker_ShieldInteriorFuture).get_result()
	endif
	if myPlayerSitMarkerFuture
		myPlayerSitMarker = GetFuture(myPlayerSitMarkerFuture).get_result()
	endif
	if myPlayerLayDownMarkerFuture
		myPlayerLayDownMarker = GetFuture(myPlayerLayDownMarkerFuture).get_result()
	endif
	if myExitFrontFuture
		myExitFront = GetFuture(myExitFrontFuture).get_result()
		if !IsRefInInterior(Game.GetPlayer())
			TryToEnableRef(myExitFront)
		endif
	endif
	if myWardFuture
		myWard = GetFuture(myWardFuture).get_result()
		if !IsRefInInterior(Game.GetPlayer())
			TryToEnableRef(myWard)
		endif	
	endif
	if myClutterStatic1Future
		myClutterStatic1 = GetFuture(myClutterStatic1Future).get_result()
	endif
	if myClutterStatic2Future
		myClutterStatic2 = GetFuture(myClutterStatic2Future).get_result()
	endif
	if myClutterStatic3Future
		myClutterStatic3 = GetFuture(myClutterStatic3Future).get_result()
	endif
	if myClutterStatic4Future
		myClutterStatic4 = GetFuture(myClutterStatic4Future).get_result()
	endif
	if myClutterStatic5Future
		myClutterStatic5 = GetFuture(myClutterStatic5Future).get_result()
	endif
	if myClutterActivator1Future
		myClutterActivator1 = GetFuture(myClutterActivator1Future).get_result()
	endif
	if myClutterActivator2Future
		myClutterActivator2 = GetFuture(myClutterActivator2Future).get_result()
	endif
	if myClutterActivator3Future
		myClutterActivator3 = GetFuture(myClutterActivator3Future).get_result()
	endif
	if myClutterActivator4Future
		myClutterActivator4 = GetFuture(myClutterActivator4Future).get_result()
	endif
	if myClutterActivator5Future
		myClutterActivator5 = GetFuture(myClutterActivator5Future).get_result()
	endif
	if myClutterFurniture1Future
		myClutterFurniture1 = GetFuture(myClutterFurniture1Future).get_result()
	endif
	if myClutterFurniture2Future
		myClutterFurniture2 = GetFuture(myClutterFurniture2Future).get_result()
	endif
	if myClutterFurniture3Future
		myClutterFurniture3 = GetFuture(myClutterFurniture3Future).get_result()
	endif
	if myClutterFurniture4Future
		myClutterFurniture4 = GetFuture(myClutterFurniture4Future).get_result()
	endif
	if myClutterFurniture5Future
		myClutterFurniture5 = GetFuture(myClutterFurniture5Future).get_result()
	endif
	if myLanternUnlitFuture
		myLanternUnlit = GetFuture(myLanternUnlitFuture).get_result()
	endif
	if myLanternLitFuture
		myLanternLit = GetFuture(myLanternLitFuture).get_result()
	endif
	if myLanternLightFuture
		myLanternLight = GetFuture(myLanternLightFuture).get_result()
	endif
	if myLanternUnlit2Future
		myLanternUnlit2 = GetFuture(myLanternUnlit2Future).get_result()
	endif
	if myLanternLit2Future
		myLanternLit2 = GetFuture(myLanternLit2Future).get_result()
	endif
	if myLanternLight2Future
		myLanternLight2 = GetFuture(myLanternLight2Future).get_result()
	endif
	if myLanternUnlit3Future
		myLanternUnlit3 = GetFuture(myLanternUnlit3Future).get_result()
	endif
	if myLanternLit3Future
		myLanternLit3 = GetFuture(myLanternLit3Future).get_result()
	endif
	if myLanternLight3Future
		myLanternLight3 = GetFuture(myLanternLight3Future).get_result()
	endif
	if myFollowerAMarker_MainWeaponFuture
		myFollowerAMarker_MainWeapon = GetFuture(myFollowerAMarker_MainWeaponFuture).get_result()
	endif
	if myFollowerAMarker_OffHandWeaponFuture
		myFollowerAMarker_OffHandWeapon = GetFuture(myFollowerAMarker_OffHandWeaponFuture).get_result()
	endif
	if myFollowerAMarker_BigWeaponFuture
		myFollowerAMarker_BigWeapon = GetFuture(myFollowerAMarker_BigWeaponFuture).get_result()
	endif
	if myFollowerAMarker_BowFuture
		myFollowerAMarker_Bow = GetFuture(myFollowerAMarker_BowFuture).get_result()
	endif
	if myFollowerAMarker_ShieldFuture
		myFollowerAMarker_Shield = GetFuture(myFollowerAMarker_ShieldFuture).get_result()
	endif
	if myFollowerBMarker_MainWeaponFuture
		myFollowerBMarker_MainWeapon = GetFuture(myFollowerBMarker_MainWeaponFuture).get_result()
	endif
	if myFollowerBMarker_OffHandWeaponFuture
		myFollowerBMarker_OffHandWeapon = GetFuture(myFollowerBMarker_OffHandWeaponFuture).get_result()
	endif
	if myFollowerBMarker_BigWeaponFuture
		myFollowerBMarker_BigWeapon = GetFuture(myFollowerBMarker_BigWeaponFuture).get_result()
	endif
	if myFollowerBMarker_BowFuture
		myFollowerBMarker_Bow = GetFuture(myFollowerBMarker_BowFuture).get_result()
	endif
	if myFollowerBMarker_ShieldFuture
		myFollowerBMarker_Shield = GetFuture(myFollowerBMarker_ShieldFuture).get_result()
	endif
	if myFollowerCMarker_MainWeaponFuture
		myFollowerCMarker_MainWeapon = GetFuture(myFollowerCMarker_MainWeaponFuture).get_result()
	endif
	if myFollowerCMarker_OffHandWeaponFuture
		myFollowerCMarker_OffHandWeapon = GetFuture(myFollowerCMarker_OffHandWeaponFuture).get_result()
	endif
	if myFollowerCMarker_BigWeaponFuture
		myFollowerCMarker_BigWeapon = GetFuture(myFollowerCMarker_BigWeaponFuture).get_result()
	endif
	if myFollowerCMarker_BowFuture
		myFollowerCMarker_Bow = GetFuture(myFollowerCMarker_BowFuture).get_result()
	endif
	if myFollowerCMarker_ShieldFuture
		myFollowerCMarker_Shield = GetFuture(myFollowerCMarker_ShieldFuture).get_result()
	endif
	if myBedRollFuture
		myBedRoll = GetFuture(myBedRollFuture).get_result()
		if self.GetDistance(myBedRoll) > 20.0
			self.MoveTo(myBedRoll)
		endif
		if Setting_BedRollScale != 1.0
			self.SetScale(Setting_BedRollScale)
		endif
	endif
	if mySpareBedRoll1Future
		mySpareBedRoll1 = GetFuture(mySpareBedRoll1Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll1.SetScale(Setting_BedRollScale)
		endif
	endif
	if mySpareBedRoll2Future
		mySpareBedRoll2 = GetFuture(mySpareBedRoll2Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll2.SetScale(Setting_BedRollScale)
		endif
	endif
	if mySpareBedRoll3Future
		mySpareBedRoll3 = GetFuture(mySpareBedRoll3Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll3.SetScale(Setting_BedRollScale)
		endif
	endif
endFunction

function TakeDown()
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
	TryToDisableAndDeleteRef(myFollowerAMarker_MainWeapon)
	TryToDisableAndDeleteRef(myFollowerAMarker_OffHandWeapon)
	TryToDisableAndDeleteRef(myFollowerAMarker_BigWeapon)
	TryToDisableAndDeleteRef(myFollowerAMarker_Bow)
	TryToDisableAndDeleteRef(myFollowerAMarker_Shield)
	TryToDisableAndDeleteRef(myFollowerBMarker_MainWeapon)
	TryToDisableAndDeleteRef(myFollowerBMarker_OffHandWeapon)
	TryToDisableAndDeleteRef(myFollowerBMarker_BigWeapon)
	TryToDisableAndDeleteRef(myFollowerBMarker_Bow)
	TryToDisableAndDeleteRef(myFollowerBMarker_Shield)
	TryToDisableAndDeleteRef(myFollowerCMarker_MainWeapon)
	TryToDisableAndDeleteRef(myFollowerCMarker_OffHandWeapon)
	TryToDisableAndDeleteRef(myFollowerCMarker_BigWeapon)
	TryToDisableAndDeleteRef(myFollowerCMarker_Bow)
	TryToDisableAndDeleteRef(myFollowerCMarker_Shield)
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

function PlaceObject_Tent()
	myTentFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterModel, PositionRef_Shelter, initially_disabled = true)
endFunction

function PlaceObject_NormalTent()
	myNormalTentFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterModelExterior, PositionRef_Shelter, initially_disabled = true)	
endFunction

function PlaceObject_SnowTent()
	mySnowTentFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterModelMaterialSnow, PositionRef_Shelter, initially_disabled = true)
endFunction

function PlaceObject_AshTent()
	myAshTentFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterModelMaterialAsh, PositionRef_Shelter, initially_disabled = true)
endFunction

function PlaceObject_ClutterStatic1()
	myClutterStatic1Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic1, PositionRef_ClutterStatic1)
endFunction

function PlaceObject_ClutterStatic2()
	myClutterStatic2Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic2, PositionRef_ClutterStatic2)
endFunction

function PlaceObject_ClutterStatic3()
	myClutterStatic3Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic3, PositionRef_ClutterStatic3)
endFunction

function PlaceObject_ClutterStatic4()
	myClutterStatic4Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic4, PositionRef_ClutterStatic4)
endFunction

function PlaceObject_ClutterStatic5()
	myClutterStatic5Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic5, PositionRef_ClutterStatic5)
endFunction

function PlaceObject_ClutterActivator1(CampTentEx Extended)
	myClutterActivator1Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator1, Extended.PositionRef_ClutterActivator1)
endFunction

function PlaceObject_ClutterActivator2(CampTentEx Extended)
	myClutterActivator2Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator2, Extended.PositionRef_ClutterActivator2)
endFunction

function PlaceObject_ClutterActivator3(CampTentEx Extended)
	myClutterActivator3Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator3, Extended.PositionRef_ClutterActivator3)
endFunction

function PlaceObject_ClutterActivator4(CampTentEx Extended)
	myClutterActivator4Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator4, Extended.PositionRef_ClutterActivator4)
endFunction

function PlaceObject_ClutterActivator5(CampTentEx Extended)
	myClutterActivator5Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator5, Extended.PositionRef_ClutterActivator5)
endFunction

function PlaceObject_ClutterFurniture1(CampTentEx Extended)
	myClutterFurniture1Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture1, Extended.PositionRef_ClutterFurniture1)
endFunction

function PlaceObject_ClutterFurniture2(CampTentEx Extended)
	myClutterFurniture2Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture2, Extended.PositionRef_ClutterFurniture2)
endFunction

function PlaceObject_ClutterFurniture3(CampTentEx Extended)
	myClutterFurniture3Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture3, Extended.PositionRef_ClutterFurniture3)
endFunction

function PlaceObject_ClutterFurniture4(CampTentEx Extended)
	myClutterFurniture4Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture4, Extended.PositionRef_ClutterFurniture4)
endFunction

function PlaceObject_ClutterFurniture5(CampTentEx Extended)
	myClutterFurniture5Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture5, Extended.PositionRef_ClutterFurniture5)
endFunction

function PlaceObject_PlayerMainWeapon()
	myPlayerMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_WeaponMainHand)
endFunction

function PlaceObject_PlayerOffHandWeapon()
	myPlayerMarker_OffHandWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_WeaponOffHand)
endFunction

function PlaceObject_PlayerBigWeapon()
	myPlayerMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_WeaponTwoHand)
endFunction

function PlaceObject_PlayerBow()
	myPlayerMarker_BowFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_WeaponBow)
endFunction

function PlaceObject_PlayerShield()
	myPlayerMarker_ShieldFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_Shield, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true)
endFunction

function PlaceObject_PlayerCuirass()
	myPlayerMarker_CuirassFuture= PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_ArmorCuirass)
endFunction

function PlaceObject_PlayerHelm()
	myPlayerMarker_HelmFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_ArmorHelm)
endFunction

function PlaceObject_PlayerBoots()
	myPlayerMarker_BootsFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_ArmorBoots)
endFunction

function PlaceObject_PlayerGauntlets()
	myPlayerMarker_GauntletsFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_ArmorGauntlets)
endFunction

function PlaceObject_PlayerBackpack()
	myPlayerMarker_BackpackFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_Backpack)
endFunction

function PlaceObject_PlayerShieldInterior()
	myPlayerMarker_ShieldInteriorFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_Player_ShieldInterior)
endFunction

function PlaceObject_PlayerSitMarker()
	myPlayerSitMarkerFuture = PlacementSystem.PlaceObject(self, TentSystem.GetSitMarker(), RequiredPositionRef_SitFurniture)
endFunction

function PlaceObject_PlayerLayDownMarker()
	myPlayerLayDownMarkerFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLieDownMarker(), RequiredPositionRef_LieDownFurniture, z_local_ang_adjust = 180.0)
endFunction

function PlaceObject_ExitFront()
	myExitFrontFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), PositionRef_FrontExitMarker, initially_disabled = true)
endFunction

function PlaceObject_BedRoll()
	myBedRollFuture = PlacementSystem.PlaceObject(self, TentSystem.GetPlayerBedroll(), RequiredPositionRef_PlayerBed)
endFunction

function PlaceObject_Ward()
	myWardFuture = PlacementSystem.PlaceObject(self, TentSystem.GetWard(), PositionRef_Ward, x_local_ang_adjust = -90.0, is_propped = true, initially_disabled = true)
endFunction

function PlaceObject_Lantern1()
	myLanternUnlitFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), PositionRef_Lantern1)
	myLanternLitFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), PositionRef_Lantern1, initially_disabled = true)
	myLanternLightFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), PositionRef_Lantern1, initially_disabled = true)
endFunction

function PlaceObject_Lantern2(CampTentEx Extended)
	myLanternUnlit2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), Extended.PositionRef_Lantern2)
	myLanternLit2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), Extended.PositionRef_Lantern2, initially_disabled = true)
	myLanternLight2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), Extended.PositionRef_Lantern2, initially_disabled = true)
endFunction

function PlaceObject_Lantern3(CampTentEx Extended)
	myLanternUnlit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), Extended.PositionRef_Lantern3)
	myLanternLit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), Extended.PositionRef_Lantern3, initially_disabled = true)
	myLanternLight3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), Extended.PositionRef_Lantern3, initially_disabled = true)
endFunction

function PlaceObject_SpareBedRoll1(CampTentEx Extended)
	mySpareBedRoll1Future = PlacementSystem.PlaceObject(self, TentSystem.GetNPCBedroll(), Extended.PositionRef_Follower1_Bed)
endFunction

function PlaceObject_SpareBedRoll2(CampTentEx Extended)
	mySpareBedRoll2Future = PlacementSystem.PlaceObject(self, TentSystem.GetNPCBedroll(), Extended.PositionRef_Follower2_Bed)
endFunction

function PlaceObject_SpareBedRoll3(CampTentEx Extended)
	mySpareBedRoll3Future = PlacementSystem.PlaceObject(self, TentSystem.GetNPCBedroll(), Extended.PositionRef_Follower3_Bed)
endFunction

function PlaceObject_Follower1MainWeapon(CampTentEx Extended)
	myFollowerAMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower1_WeaponMainHand)
endFunction

function PlaceObject_Follower1OffHandWeapon(CampTentEx Extended)
	myFollowerAMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower1_WeaponOffHand)
endFunction

function PlaceObject_Follower1BigWeapon(CampTentEx Extended)
	myFollowerAMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower1_WeaponTwoHand)
endFunction

function PlaceObject_Follower1Bow(CampTentEx Extended)
	myFollowerAMarker_BowFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower1_WeaponBow)
endFunction

function PlaceObject_Follower1Shield(CampTentEx Extended)
	myFollowerAMarker_ShieldFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower1_Shield)
endFunction

function PlaceObject_Follower2MainWeapon(CampTentEx Extended)
	myFollowerBMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower2_WeaponMainHand)
endFunction

function PlaceObject_Follower2OffHandWeapon(CampTentEx Extended)
	myFollowerBMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower2_WeaponOffHand)
endFunction

function PlaceObject_Follower2BigWeapon(CampTentEx Extended)
	myFollowerBMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower2_WeaponTwoHand)
endFunction

function PlaceObject_Follower2Bow(CampTentEx Extended)
	myFollowerBMarker_BowFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower2_WeaponBow)
endFunction

function PlaceObject_Follower2Shield(CampTentEx Extended)
	myFollowerBMarker_ShieldFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower2_Shield)
endFunction

function PlaceObject_Follower3MainWeapon(CampTentEx Extended)
	myFollowerCMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower3_WeaponMainHand)
endFunction

function PlaceObject_Follower3OffHandWeapon(CampTentEx Extended)
	myFollowerCMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower3_WeaponOffHand)
endFunction

function PlaceObject_Follower3BigWeapon(CampTentEx Extended)
	myFollowerCMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower3_WeaponTwoHand)
endFunction

function PlaceObject_Follower3Bow(CampTentEx Extended)
	myFollowerCMarker_BowFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower3_WeaponBow)
endFunction

function PlaceObject_Follower3Shield(CampTentEx Extended)
	myFollowerCMarker_ShieldFuture = PlacementSystem.PlaceObject(self, TentSystem.GetXMarker(), Extended.PositionRef_Follower3_Shield)
endFunction