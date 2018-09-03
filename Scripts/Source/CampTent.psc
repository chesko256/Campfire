;/********s* _Camp_PlaceableObjectBase/CampTent
* SCRIPTNAME
*/;
scriptname CampTent extends _Camp_PlaceableObjectBase
;/*
* OVERVIEW
* This script controls all tent behavior. Attach this script to an Activator which will serve as 
* the player's bed roll. Attaching this script and filling out properties in the Creation Kit is 
* how new tents are created; please see the tutorials for more information. This script supports 
* creating a tent with a single bed roll, a lantern, clutter, and more. See CampTentEx for even 
* more capability.
;*********/;

import _CampInternal
import CampUtil
import TentSystem

;/********p* CampTent/Setting_PlayerUsesFullBed
* SYNTAX
*/;
bool property Setting_PlayerUsesFullBed = false auto
{
* DESCRIPTION
* Optional: Whether or not the player's bedding is a full-sized bed. If true, the player's ability to sit and lay down in the bedding is disabled. }
;*********/;

;/********p* CampTent/Setting_BedRollScale
* SYNTAX
*/;
Float property Setting_BedRollScale = 1.0 auto
{
* DESCRIPTION
* Optional: The scale to render the player's and follower's bed rolls. 1.0 by default. }
;*********/;

;/********p* CampTent/Setting_PlayerSitAngle
* SYNTAX
*/;
Float property Setting_PlayerSitAngle = 0.0 auto
{
* DESCRIPTION
* Optional: The compass direction adjustment applied to the player's sitting position. 0.0 by default. }
;*********/;

;/********p* CampTent/Setting_UseSilverCandlestick
* SYNTAX
*/;
bool property Setting_UseSilverCandlestick = false auto
{
* DESCRIPTION
* Optional: If True, will replace all lanterns with SilverCandlestick02 instead. }
;*********/;

;/********p* CampTent/RequiredPositionRef_PlayerBed
* SYNTAX
*/;
ObjectReference property RequiredPositionRef_PlayerBed auto
;/* 
* DESCRIPTION
{ Required: The player's bed roll (main interactible) position reference. }
;*********/;

;/********p* CampTent/TentAsset_LargeTentTriggerVolume
* SYNTAX
*/;
Activator property TentAsset_LargeTentTriggerVolume auto
{
* DESCRIPTION
* Optional: A trigger box activator for walk-in tents that lets the system know that you are standing inside of it. If not included, the system will only consider the player to be "inside" the tent when sitting or lying down in it. }
;*********/;

;/********p* CampTent/TentAsset_ShelterModel
* SYNTAX
*/;
Static property TentAsset_ShelterModel auto
{
* DESCRIPTION
* Optional: The tent static object. }
;*********/;

;/********p* CampTent/TentAsset_ShelterModelExterior
* SYNTAX
*/;
Static property TentAsset_ShelterModelExterior auto
{
* DESCRIPTION
* Optional: The tent static object exterior (for use with Toggle View feature). }
;*********/;

;/********p* CampTent/TentAsset_ShelterModelMaterialSnow
* SYNTAX
*/;
Static property TentAsset_ShelterModelMaterialSnow auto
{
* DESCRIPTION
* Optional: The tent (ShelterModel or ShelterModelExterior) with snow directional shader applied. }
;*********/;

;/********p* CampTent/TentAsset_ShelterModelMaterialAsh
* SYNTAX
*/;
Static property TentAsset_ShelterModelMaterialAsh auto
{
* DESCRIPTION
* Optional: The tent (ShelterModel or ShelterModelExterior) with ash directional shader applied (use _Camp_AshMaterialSolstheim1P_2 instead of a direct dependency on Dragonborn.esm) }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic1
* SYNTAX
*/;
Static property TentAsset_ClutterStatic1 auto
{
* DESCRIPTION
* Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic2
* SYNTAX
*/;
Static property TentAsset_ClutterStatic2 auto
{
* DESCRIPTION
* Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic3
* SYNTAX
*/;
Static property TentAsset_ClutterStatic3 auto
{
* DESCRIPTION
* Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic4
* SYNTAX
*/;
Static property TentAsset_ClutterStatic4 auto
{
* DESCRIPTION
* Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ClutterStatic5
* SYNTAX
*/;
Static property TentAsset_ClutterStatic5 auto
{
* DESCRIPTION
* Optional: A static to place in or around the tent. }
;*********/;

;/********p* CampTent/TentAsset_ShelterDestructionCollider
* SYNTAX
*/;
Activator property TentAsset_ShelterDestructionCollider auto
{
* DESCRIPTION
* Optional: Activator that passes its OnHit data to this object. Used to allow hitting the shelter object to destroy the tent. }
;*********/;

;/********p* CampTent/PositionRef_FrontExitMarker
* SYNTAX
*/;
ObjectReference property PositionRef_FrontExitMarker auto
{
* DESCRIPTION
* Optional: Position reference of marker to move the player to when exiting a small tent. }
;*********/;

;/********p* CampTent/PositionRef_AnimalLayDownMarker
* SYNTAX
*/;
ObjectReference property PositionRef_AnimalLayDownMarker auto
{
* DESCRIPTION
* Optional: Position reference of marker that animals will lie down at. }
;*********/;

;/********p* CampTent/PositionRef_Shelter
* SYNTAX
*/;
ObjectReference property PositionRef_Shelter auto
{
* DESCRIPTION
* Optional: The shelter (tent, structure) position reference. }
;*********/;

;/********p* CampTent/PositionRef_Ward
* SYNTAX
*/;
ObjectReference property PositionRef_Ward auto
{
* DESCRIPTION
* Optional: The ward position reference. The "ward" is the walking stick seen near the front of most tents. }
;*********/;

;/********p* CampTent/PositionRef_Lantern1
* SYNTAX
*/;
ObjectReference property PositionRef_Lantern1 auto
{
* DESCRIPTION
* Optional: The first lantern's position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic1 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic2 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic3
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic3 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic4
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic4 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_ClutterStatic5
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic5 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTent/PositionRef_Player_Backpack
* SYNTAX
*/;
ObjectReference property PositionRef_Player_Backpack auto
{
* DESCRIPTION
* Optional: Position reference of player's backpack. }
;*********/;

;/********p* CampTent/PositionRef_Player_Shield
* SYNTAX
*/;
ObjectReference property PositionRef_Player_Shield auto
{
* DESCRIPTION
* Optional: Position reference of player's shield. }
;*********/;

;/********p* CampTent/PositionRef_Player_ShieldInterior
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ShieldInterior auto
{
* DESCRIPTION
* Optional: Position reference of player's shield when in an interior (usually lying flat). }
;*********/;

;/********p* CampTent/PositionRef_Player_WeaponMainHand
* SYNTAX
*/;
ObjectReference property PositionRef_Player_WeaponMainHand auto
{
* DESCRIPTION
* Optional: Position reference of player's main hand weapon. }
;*********/;

;/********p* CampTent/PositionRef_Player_WeaponOffHand
* SYNTAX
*/;
ObjectReference property PositionRef_Player_WeaponOffHand auto
{
* DESCRIPTION
* Optional: Position reference of player's off hand weapon. }
;*********/;

;/********p* CampTent/PositionRef_Player_WeaponTwoHand
* SYNTAX
*/;
ObjectReference property PositionRef_Player_WeaponTwoHand auto
{
* DESCRIPTION
* Optional: Position reference of player's two-handed weapon. }
;*********/;

;/********p* CampTent/PositionRef_Player_WeaponBow
* SYNTAX
*/;
ObjectReference property PositionRef_Player_WeaponBow auto
{
* DESCRIPTION
* Optional: Position reference of player's bow. }
;*********/;

;/********p* CampTent/PositionRef_Player_ArmorHelm
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ArmorHelm auto
{
* DESCRIPTION
* Optional: Position reference of player's head gear. }
;*********/;

;/********p* CampTent/PositionRef_Player_ArmorCuirass
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ArmorCuirass auto
{
* DESCRIPTION
* Optional: Position reference of player's body gear. }
;*********/;

;/********p* CampTent/PositionRef_Player_ArmorGauntlets
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ArmorGauntlets auto
{
* DESCRIPTION
* Optional: Position reference of player's hand gear. }
;*********/;

;/********p* CampTent/PositionRef_Player_ArmorBoots
* SYNTAX
*/;
ObjectReference property PositionRef_Player_ArmorBoots auto
{
* DESCRIPTION
* Optional: Position reference of player's foot gear. }
;*********/;

;/********p* CampTent/PositionRef_CenterObjectOverride
* SYNTAX
*/;
ObjectReference property PositionRef_CenterObjectOverride auto
{
* DESCRIPTION
* Optional: Set this to specify a different object as the one which all other tent objects "orbit" when rotated. Uses the Shelter or Player Bed if left blank. }
;*********/;

; PRIVATE
; Run-time objects
ObjectReference property myTent auto hidden
ObjectReference property myTentExterior auto hidden
ObjectReference property myNormalTent auto hidden
ObjectReference property mySnowTent auto hidden
ObjectReference property myAshTent auto hidden
ObjectReference property myLargeTentTriggerVolume auto hidden
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
ObjectReference property myPlayerWithSpouseLayDownMarker auto hidden
ObjectReference property mySpouseLayDownMarker auto hidden
ObjectReference property myAnimalLayDownMarker auto hidden
ObjectReference property myExitFront auto hidden
ObjectReference property myBedRoll auto hidden
ObjectReference property mySpareBedRoll1 auto hidden
ObjectReference property mySpareBedRoll2 auto hidden
ObjectReference property mySpareBedRoll3 auto hidden
ObjectReference property mySpareBedRoll1SitMarker auto hidden
ObjectReference property mySpareBedRoll2SitMarker auto hidden
ObjectReference property mySpareBedRoll3SitMarker auto hidden
ObjectReference property myWard auto hidden
ObjectReference property myShelterCollider auto hidden

; Conjured Shelter-specific objects
ObjectReference property myBaseStatic1 auto hidden
ObjectReference property myBaseStatic2 auto hidden
ObjectReference property myBaseStatic3 auto hidden
ObjectReference property myBaseStatic4 auto hidden
ObjectReference property myBaseStatic5 auto hidden
ObjectReference property myBaseStatic6 auto hidden
ObjectReference property myBaseStatic7 auto hidden
ObjectReference property myClutterStatic6 auto hidden
ObjectReference property myClutterStatic7 auto hidden
ObjectReference property myClutterMisc1 auto hidden
ObjectReference property myClutterMisc2 auto hidden
ObjectReference property myClutterMisc3 auto hidden
ObjectReference property myClutterMisc4 auto hidden
ObjectReference property myClutterMisc5 auto hidden
ObjectReference property myClutterMisc6 auto hidden
ObjectReference property myClutterMisc7 auto hidden
ObjectReference property myClutterFurniture6 auto hidden
ObjectReference property myClutterFurniture7 auto hidden

; Futures
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
ObjectReference property myPlayerWithSpouseLayDownMarkerFuture auto hidden
ObjectReference property mySpouseLayDownMarkerFuture auto hidden
ObjectReference property myAnimalLayDownMarkerFuture auto hidden
ObjectReference property myExitFrontFuture auto hidden
ObjectReference property myBedRollFuture auto hidden
ObjectReference property mySpareBedRoll1Future auto hidden
ObjectReference property mySpareBedRoll2Future auto hidden
ObjectReference property mySpareBedRoll3Future auto hidden
ObjectReference property mySpareBedRoll1SitMarkerFuture auto hidden
ObjectReference property mySpareBedRoll2SitMarkerFuture auto hidden
ObjectReference property mySpareBedRoll3SitMarkerFuture auto hidden
ObjectReference property myWardFuture auto hidden
ObjectReference property myShelterColliderFuture auto hidden
ObjectReference property myLargeTentTriggerVolumeFuture auto hidden

; Conjured Shelter-specific futures
ObjectReference property myBaseStatic1Future auto hidden
ObjectReference property myBaseStatic2Future auto hidden
ObjectReference property myBaseStatic3Future auto hidden
ObjectReference property myBaseStatic4Future auto hidden
ObjectReference property myBaseStatic5Future auto hidden
ObjectReference property myBaseStatic6Future auto hidden
ObjectReference property myBaseStatic7Future auto hidden
ObjectReference property myClutterStatic6Future auto hidden
ObjectReference property myClutterStatic7Future auto hidden
ObjectReference property myClutterMisc1Future auto hidden
ObjectReference property myClutterMisc2Future auto hidden
ObjectReference property myClutterMisc3Future auto hidden
ObjectReference property myClutterMisc4Future auto hidden
ObjectReference property myClutterMisc5Future auto hidden
ObjectReference property myClutterMisc6Future auto hidden
ObjectReference property myClutterMisc7Future auto hidden
ObjectReference property myClutterFurniture6Future auto hidden
ObjectReference property myClutterFurniture7Future auto hidden

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

ObjectReference property myDisplayFollowerAShield auto hidden
ObjectReference property myDisplayFollowerAMainWeapon auto hidden
ObjectReference property myDisplayFollowerAOffHandWeapon auto hidden
ObjectReference property myDisplayFollowerABigWeapon auto hidden
ObjectReference property myDisplayFollowerABow auto hidden

ObjectReference property myDisplayFollowerBShield auto hidden
ObjectReference property myDisplayFollowerBMainWeapon auto hidden
ObjectReference property myDisplayFollowerBOffHandWeapon auto hidden
ObjectReference property myDisplayFollowerBBigWeapon auto hidden
ObjectReference property myDisplayFollowerBBow auto hidden

ObjectReference property myDisplayFollowerCShield auto hidden
ObjectReference property myDisplayFollowerCMainWeapon auto hidden
ObjectReference property myDisplayFollowerCOffHandWeapon auto hidden
ObjectReference property myDisplayFollowerCBigWeapon auto hidden
ObjectReference property myDisplayFollowerCBow auto hidden

bool property bLanternLit = false auto hidden
bool property bGettingUp = false auto hidden

; Some frequently used resources need to be declared locally in order to
; keep TentSystem from becoming overloaded with requests.
Static XMarker
Furniture _Camp_Bedroll_ActualF
Furniture _Camp_Bedroll_NPC_F
Furniture _Camp_Bedroll_SpouseF
Furniture _Camp_TentLayDownMarker
Furniture _Camp_TentSitMarker
Furniture _Camp_TentSitMarkerSandbox
Static _Camp_TentWard
Form DogLayingDownIdleMarker

function Update()
	UpdateTentUseState(self)
endFunction

function UseObject(ObjectReference akActionRef)
	ActivateTent(akActionRef, self)
endFunction

;@Override _Camp_PlaceableObjectBase
function PlaceObjects()
	CampTentEx Extended = self as CampTentEx
	CampConjuredShelter Conjured = self as CampConjuredShelter

	; Cache shared resources locally
	XMarker = Game.GetFormFromFile(0x0000003B, "Skyrim.esm") as Static
	DogLayingDownIdleMarker = Game.GetFormFromFile(0x0010F801, "Skyrim.esm")
	_Camp_Bedroll_ActualF = Game.GetFormFromFile(0x02007EFA, "Campfire.esm") as Furniture 
	_Camp_Bedroll_NPC_F = Game.GetFormFromFile(0x02038CBF, "Campfire.esm") as Furniture
	_Camp_Bedroll_SpouseF = Game.GetFormFromFile(0x0203900D, "Campfire.esm") as Furniture
	_Camp_TentLayDownMarker = Game.GetFormFromFile(0x02036587, "Campfire.esm") as Furniture
	_Camp_TentSitMarker = Game.GetFormFromFile(0x02036586, "Campfire.esm") as Furniture
	_Camp_TentSitMarkerSandbox = Game.GetFormFromFile(0x0203232B, "Campfire.esm") as Furniture
	_Camp_TentWard = Game.GetFormFromFile(0x0203BE8E, "Campfire.esm") as Static	

	if PositionRef_CenterObjectOverride
		CenterObject = PositionRef_CenterObjectOverride
	else
		if PositionRef_Shelter
			CenterObject = PositionRef_Shelter
		else
			CenterObject = RequiredPositionRef_PlayerBed
		endif
	endif

	if Conjured && Conjured.Setting_UseShelterSphere
		Conjured.SummonSphere()
	endif

	if Conjured
		if Conjured.TentAsset_BaseStatic1 && Conjured.PositionRef_BaseStatic1
			PlaceObject_BaseStatic1()
		endif
		if Conjured.TentAsset_BaseStatic2 && Conjured.PositionRef_BaseStatic2
			PlaceObject_BaseStatic2()
		endif
		if Conjured.TentAsset_BaseStatic3 && Conjured.PositionRef_BaseStatic3
			PlaceObject_BaseStatic3()
		endif
		if Conjured.TentAsset_BaseStatic4 && Conjured.PositionRef_BaseStatic4
			PlaceObject_BaseStatic4()
		endif
		if Conjured.TentAsset_BaseStatic5 && Conjured.PositionRef_BaseStatic5
			PlaceObject_BaseStatic5()
		endif
		if Conjured.TentAsset_BaseStatic6 && Conjured.PositionRef_BaseStatic6
			PlaceObject_BaseStatic6()
		endif
		if Conjured.TentAsset_BaseStatic7 && Conjured.PositionRef_BaseStatic7
			PlaceObject_BaseStatic7()
		endif
	endif

	if Conjured && Conjured.Setting_UseShelterSphere
		; Place the special sphere trigger volume
		PlaceObject_LargeTentTriggerVolume()
	else
		if TentAsset_ShelterModel && PositionRef_Shelter
			PlaceObject_Tent()
		endif
		if TentAsset_ShelterDestructionCollider && PositionRef_Shelter
			PlaceObject_ShelterCollider()
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
		if TentAsset_LargeTentTriggerVolume
			PlaceObject_LargeTentTriggerVolume()
		endif
	endif

	if PositionRef_Ward
		PlaceObject_Ward()
	endif
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

	if Conjured
		if Conjured.TentAsset_ClutterStatic6 && Conjured.PositionRef_ClutterStatic6
			PlaceObject_ClutterStatic6()
		endif
		if Conjured.TentAsset_ClutterStatic7 && Conjured.PositionRef_ClutterStatic7
			PlaceObject_ClutterStatic7()
		endif
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

	if Conjured
		if Conjured.TentAsset_ClutterFurniture6 && Conjured.PositionRef_ClutterFurniture6
			PlaceObject_ClutterFurniture6()
		endif
		if Conjured.TentAsset_ClutterFurniture7 && Conjured.PositionRef_ClutterFurniture7
			PlaceObject_ClutterFurniture7()
		endif
		if Conjured.TentAsset_ClutterMisc1 && Conjured.PositionRef_ClutterMisc1
			PlaceObject_ClutterMisc1()
		endif
		if Conjured.TentAsset_ClutterMisc2 && Conjured.PositionRef_ClutterMisc2
			PlaceObject_ClutterMisc2()
		endif
		if Conjured.TentAsset_ClutterMisc3 && Conjured.PositionRef_ClutterMisc3
			PlaceObject_ClutterMisc3()
		endif
		if Conjured.TentAsset_ClutterMisc4 && Conjured.PositionRef_ClutterMisc4
			PlaceObject_ClutterMisc4()
		endif
		if Conjured.TentAsset_ClutterMisc5 && Conjured.PositionRef_ClutterMisc5
			PlaceObject_ClutterMisc5()
		endif
		if Conjured.TentAsset_ClutterMisc6 && Conjured.PositionRef_ClutterMisc6
			PlaceObject_ClutterMisc6()
		endif
		if Conjured.TentAsset_ClutterMisc7 && Conjured.PositionRef_ClutterMisc7
			PlaceObject_ClutterMisc7()
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
	if !Setting_PlayerUsesFullBed
		PlaceObject_PlayerSitMarker()
		PlaceObject_PlayerLayDownMarker()
		PlaceObject_PlayerWithSpouseLayDownMarker()
		PlaceObject_SpouseLayDownMarker()
	endif
	if PositionRef_AnimalLayDownMarker
		PlaceObject_AnimalLayDownMarker()
	endif
	if PositionRef_FrontExitMarker
		PlaceObject_ExitFront()
	endif
	PlaceObject_BedRoll()
	if Extended
		if Extended.PositionRef_Follower1_Bed
			PlaceObject_SpareBedRoll1(Extended)
			PlaceObject_SpareBedRoll1SitMarker(Extended)
		endif
		if Extended.PositionRef_Follower2_Bed
			PlaceObject_SpareBedRoll2(Extended)
			PlaceObject_SpareBedRoll2SitMarker(Extended)
		endif
		if Extended.PositionRef_Follower3_Bed
			PlaceObject_SpareBedRoll3(Extended)
			PlaceObject_SpareBedRoll3SitMarker(Extended)
		endif
	endif
endFunction

;@Override _Camp_PlaceableObjectBase
function GetResults()
	CampConjuredShelter Conjured = self as CampConjuredShelter
	
	if myTentFuture
		myTent = GetFuture(myTentFuture).get_result()
		myTentFuture = None
	endif
	if myShelterColliderFuture
		myShelterCollider = GetFuture(myShelterColliderFuture).get_result()
		if myShelterCollider
			(myShelterCollider as CampTentShelterCollider).ParentTent = self
		endif
		myShelterColliderFuture = None
	endif
	if myNormalTentFuture
		myNormalTent = GetFuture(myNormalTentFuture).get_result()
		myNormalTentFuture = None
	endif
	if mySnowTentFuture
		mySnowTent = GetFuture(mySnowTentFuture).get_result()
		mySnowTentFuture = None
	endif
	if myAshTentFuture
		myAshTent = GetFuture(myAshTentFuture).get_result()
		myAshTentFuture = None
	endif
	TentSystem.SelectExterior(self, false)

	if myLargeTentTriggerVolumeFuture
		myLargeTentTriggerVolume = GetFuture(myLargeTentTriggerVolumeFuture).get_result()
		if myLargeTentTriggerVolume
			if Conjured && Conjured.Setting_UseShelterSphere
				myLargeTentTriggerVolume.SetScale(Conjured.Setting_ShelterSphereScale)
				(myLargeTentTriggerVolume as CampShelterSphereTriggerVolumeScript).ParentTent = self				
			else
				(myLargeTentTriggerVolume as CampLargeTentTriggerVolumeScript).ParentTent = self
			endif
		endif
		myLargeTentTriggerVolumeFuture = None
	endif

	if myFire1Future
		myFire1 = GetFuture(myFire1Future).get_result()
		myFire1Future = None
	endif
	if myFire2Future
		myFire2 = GetFuture(myFire2Future).get_result()
		myFire2Future = None
	endif
	if myFire3Future
		myFire3 = GetFuture(myFire3Future).get_result()
		myFire3Future = None
	endif
	if myFire4Future
		myFire4 = GetFuture(myFire4Future).get_result()
		myFire4Future = None
	endif
	if myFire5Future
		myFire5 = GetFuture(myFire5Future).get_result()
		myFire5Future = None
	endif
	if myFire6Future
		myFire6 = GetFuture(myFire6Future).get_result()
		myFire6Future = None
	endif
	if mySmokeFuture
		mySmoke = GetFuture(mySmokeFuture).get_result()
		float xs
		float ys
		if PositionRef_Shelter
			xs = PositionRef_Shelter.GetWidth()
			ys = PositionRef_Shelter.GetLength()
		else
			xs = self.GetWidth()
			ys = self.GetLength()
		endif
		float size
		if xs > ys
			size = xs
		else
			size = ys
		endif
		mySmoke.SetScale(size / 900)
		mySmokeFuture = None
	endif

	if myPlayerMarker_MainWeaponFuture
		myPlayerMarker_MainWeapon = GetFuture(myPlayerMarker_MainWeaponFuture).get_result()
		myPlayerMarker_MainWeaponFuture = None
	endif
	if myPlayerMarker_OffHandWeaponFuture
		myPlayerMarker_OffHandWeapon = GetFuture(myPlayerMarker_OffHandWeaponFuture).get_result()
		myPlayerMarker_OffHandWeaponFuture = None
	endif
	if myPlayerMarker_BigWeaponFuture
		myPlayerMarker_BigWeapon = GetFuture(myPlayerMarker_BigWeaponFuture).get_result()
		myPlayerMarker_BigWeaponFuture = None
	endif
	if myPlayerMarker_BowFuture
		myPlayerMarker_Bow = GetFuture(myPlayerMarker_BowFuture).get_result()
		myPlayerMarker_BowFuture = None
	endif
	if myPlayerMarker_ShieldFuture
		myPlayerMarker_Shield = GetFuture(myPlayerMarker_ShieldFuture).get_result()
		myPlayerMarker_ShieldFuture = None
	endif
	if myPlayerMarker_CuirassFuture
		myPlayerMarker_Cuirass = GetFuture(myPlayerMarker_CuirassFuture).get_result()
		myPlayerMarker_CuirassFuture = None
	endif
	if myPlayerMarker_HelmFuture
		myPlayerMarker_Helm = GetFuture(myPlayerMarker_HelmFuture).get_result()
		myPlayerMarker_HelmFuture = None
	endif
	if myPlayerMarker_BootsFuture
		myPlayerMarker_Boots = GetFuture(myPlayerMarker_BootsFuture).get_result()
		myPlayerMarker_BootsFuture = None
	endif
	if myPlayerMarker_GauntletsFuture
		myPlayerMarker_Gauntlets = GetFuture(myPlayerMarker_GauntletsFuture).get_result()
		myPlayerMarker_GauntletsFuture = None
	endif
	if myPlayerMarker_BackpackFuture
		myPlayerMarker_Backpack = GetFuture(myPlayerMarker_BackpackFuture).get_result()
		myPlayerMarker_BackpackFuture = None
	endif
	if myPlayerMarker_ShieldInteriorFuture
		myPlayerMarker_ShieldInterior = GetFuture(myPlayerMarker_ShieldInteriorFuture).get_result()
		myPlayerMarker_ShieldInteriorFuture = None
	endif
	if myAnimalLayDownMarkerFuture
		myAnimalLayDownMarker = GetFuture(myAnimalLayDownMarkerFuture).get_result()
		myAnimalLayDownMarkerFuture = None
	endif
	if myExitFrontFuture
		myExitFront = GetFuture(myExitFrontFuture).get_result()
		if !IsRefInInterior(Game.GetPlayer())
			TryToEnableRef(myExitFront)
		endif
		myExitFrontFuture = None
	endif
	if myWardFuture
		myWard = GetFuture(myWardFuture).get_result()
		if !IsRefInInterior(Game.GetPlayer())
			TryToEnableRef(myWard)
		endif
		myWardFuture = None
	endif
	if myBaseStatic1Future
		myBaseStatic1 = GetFuture(myBaseStatic1Future).get_result()
		myBaseStatic1.SetScale(Conjured.PositionRef_BaseStatic1.GetScale())
		myBaseStatic1Future = None
	endif
	if myBaseStatic2Future
		myBaseStatic2 = GetFuture(myBaseStatic2Future).get_result()
		myBaseStatic2.SetScale(Conjured.PositionRef_BaseStatic2.GetScale())
		myBaseStatic2Future = None
	endif
	if myBaseStatic3Future
		myBaseStatic3 = GetFuture(myBaseStatic3Future).get_result()
		myBaseStatic3.SetScale(Conjured.PositionRef_BaseStatic3.GetScale())
		myBaseStatic3Future = None
	endif
	if myBaseStatic4Future
		myBaseStatic4 = GetFuture(myBaseStatic4Future).get_result()
		myBaseStatic4.SetScale(Conjured.PositionRef_BaseStatic4.GetScale())
		myBaseStatic4Future = None
	endif
	if myBaseStatic5Future
		myBaseStatic5 = GetFuture(myBaseStatic5Future).get_result()
		myBaseStatic5.SetScale(Conjured.PositionRef_BaseStatic5.GetScale())
		myBaseStatic5Future = None
	endif
	if myBaseStatic6Future
		myBaseStatic6 = GetFuture(myBaseStatic6Future).get_result()
		myBaseStatic6.SetScale(Conjured.PositionRef_BaseStatic6.GetScale())
		myBaseStatic6Future = None
	endif
	if myBaseStatic7Future
		myBaseStatic7 = GetFuture(myBaseStatic7Future).get_result()
		myBaseStatic7.SetScale(Conjured.PositionRef_BaseStatic7.GetScale())
		myBaseStatic7Future = None
	endif
	if myClutterStatic1Future
		myClutterStatic1 = GetFuture(myClutterStatic1Future).get_result()
		myClutterStatic1Future = None
	endif
	if myClutterStatic2Future
		myClutterStatic2 = GetFuture(myClutterStatic2Future).get_result()
		myClutterStatic2Future = None
	endif
	if myClutterStatic3Future
		myClutterStatic3 = GetFuture(myClutterStatic3Future).get_result()
		myClutterStatic3Future = None
	endif
	if myClutterStatic4Future
		myClutterStatic4 = GetFuture(myClutterStatic4Future).get_result()
		myClutterStatic4Future = None
	endif
	if myClutterStatic5Future
		myClutterStatic5 = GetFuture(myClutterStatic5Future).get_result()
		myClutterStatic5Future = None
	endif
	if myClutterStatic6Future
		myClutterStatic6 = GetFuture(myClutterStatic6Future).get_result()
		myClutterStatic6Future = None
	endif
	if myClutterStatic7Future
		myClutterStatic7 = GetFuture(myClutterStatic7Future).get_result()
		myClutterStatic7Future = None
	endif
	if myClutterActivator1Future
		myClutterActivator1 = GetFuture(myClutterActivator1Future).get_result()
		myClutterActivator1Future = None
	endif
	if myClutterActivator2Future
		myClutterActivator2 = GetFuture(myClutterActivator2Future).get_result()
		myClutterActivator2Future = None
	endif
	if myClutterActivator3Future
		myClutterActivator3 = GetFuture(myClutterActivator3Future).get_result()
		myClutterActivator3Future = None
	endif
	if myClutterActivator4Future
		myClutterActivator4 = GetFuture(myClutterActivator4Future).get_result()
		myClutterActivator4Future = None
	endif
	if myClutterActivator5Future
		myClutterActivator5 = GetFuture(myClutterActivator5Future).get_result()
		myClutterActivator5Future = None
	endif
	if myClutterFurniture1Future
		myClutterFurniture1 = GetFuture(myClutterFurniture1Future).get_result()
		myClutterFurniture1Future = None
	endif
	if myClutterFurniture2Future
		myClutterFurniture2 = GetFuture(myClutterFurniture2Future).get_result()
		myClutterFurniture2Future = None
	endif
	if myClutterFurniture3Future
		myClutterFurniture3 = GetFuture(myClutterFurniture3Future).get_result()
		myClutterFurniture3Future = None
	endif
	if myClutterFurniture4Future
		myClutterFurniture4 = GetFuture(myClutterFurniture4Future).get_result()
		myClutterFurniture4Future = None
	endif
	if myClutterFurniture5Future
		myClutterFurniture5 = GetFuture(myClutterFurniture5Future).get_result()
		myClutterFurniture5Future = None
	endif
	if myClutterFurniture6Future
		myClutterFurniture6 = GetFuture(myClutterFurniture6Future).get_result()
		myClutterFurniture6Future = None
	endif
	if myClutterFurniture7Future
		myClutterFurniture7 = GetFuture(myClutterFurniture7Future).get_result()
		myClutterFurniture7Future = None
	endif
	if myClutterMisc1Future
		myClutterMisc1 = GetFuture(myClutterMisc1Future).get_result()
		myClutterMisc1Future = None
	endif
	if myClutterMisc2Future
		myClutterMisc2 = GetFuture(myClutterMisc2Future).get_result()
		myClutterMisc2Future = None
	endif
	if myClutterMisc3Future
		myClutterMisc3 = GetFuture(myClutterMisc3Future).get_result()
		myClutterMisc3Future = None
	endif
	if myClutterMisc4Future
		myClutterMisc4 = GetFuture(myClutterMisc4Future).get_result()
		myClutterMisc4Future = None
	endif
	if myClutterMisc5Future
		myClutterMisc5 = GetFuture(myClutterMisc5Future).get_result()
		myClutterMisc5Future = None
	endif
	if myClutterMisc6Future
		myClutterMisc6 = GetFuture(myClutterMisc6Future).get_result()
		myClutterMisc6Future = None
	endif
	if myClutterMisc7Future
		myClutterMisc7 = GetFuture(myClutterMisc7Future).get_result()
		myClutterMisc7Future = None
	endif
	if myLanternUnlitFuture
		myLanternUnlit = GetFuture(myLanternUnlitFuture).get_result()
		myLanternUnlitFuture = None
	endif
	if myLanternLitFuture
		myLanternLit = GetFuture(myLanternLitFuture).get_result()
		myLanternLitFuture = None
	endif
	if myLanternLightFuture
		myLanternLight = GetFuture(myLanternLightFuture).get_result()
		myLanternLightFuture = None
	endif
	if myLanternUnlit2Future
		myLanternUnlit2 = GetFuture(myLanternUnlit2Future).get_result()
		myLanternUnlit2Future = None
	endif
	if myLanternLit2Future
		myLanternLit2 = GetFuture(myLanternLit2Future).get_result()
		myLanternLit2Future = None
	endif
	if myLanternLight2Future
		myLanternLight2 = GetFuture(myLanternLight2Future).get_result()
		myLanternLight2Future = None
	endif
	if myLanternUnlit3Future
		myLanternUnlit3 = GetFuture(myLanternUnlit3Future).get_result()
		myLanternUnlit3Future = None
	endif
	if myLanternLit3Future
		myLanternLit3 = GetFuture(myLanternLit3Future).get_result()
		myLanternLit3Future = None
	endif
	if myLanternLight3Future
		myLanternLight3 = GetFuture(myLanternLight3Future).get_result()
		myLanternLight3Future = None
	endif
	if myFollowerAMarker_MainWeaponFuture
		myFollowerAMarker_MainWeapon = GetFuture(myFollowerAMarker_MainWeaponFuture).get_result()
		myFollowerAMarker_MainWeaponFuture = None
	endif
	if myFollowerAMarker_OffHandWeaponFuture
		myFollowerAMarker_OffHandWeapon = GetFuture(myFollowerAMarker_OffHandWeaponFuture).get_result()
		myFollowerAMarker_OffHandWeaponFuture = None
	endif
	if myFollowerAMarker_BigWeaponFuture
		myFollowerAMarker_BigWeapon = GetFuture(myFollowerAMarker_BigWeaponFuture).get_result()
		myFollowerAMarker_BigWeaponFuture = None
	endif
	if myFollowerAMarker_BowFuture
		myFollowerAMarker_Bow = GetFuture(myFollowerAMarker_BowFuture).get_result()
		myFollowerAMarker_BowFuture = None
	endif
	if myFollowerAMarker_ShieldFuture
		myFollowerAMarker_Shield = GetFuture(myFollowerAMarker_ShieldFuture).get_result()
		myFollowerAMarker_ShieldFuture = None
	endif
	if myFollowerBMarker_MainWeaponFuture
		myFollowerBMarker_MainWeapon = GetFuture(myFollowerBMarker_MainWeaponFuture).get_result()
		myFollowerBMarker_MainWeaponFuture = None
	endif
	if myFollowerBMarker_OffHandWeaponFuture
		myFollowerBMarker_OffHandWeapon = GetFuture(myFollowerBMarker_OffHandWeaponFuture).get_result()
		myFollowerBMarker_OffHandWeaponFuture = None
	endif
	if myFollowerBMarker_BigWeaponFuture
		myFollowerBMarker_BigWeapon = GetFuture(myFollowerBMarker_BigWeaponFuture).get_result()
		myFollowerBMarker_BigWeaponFuture = None
	endif
	if myFollowerBMarker_BowFuture
		myFollowerBMarker_Bow = GetFuture(myFollowerBMarker_BowFuture).get_result()
		myFollowerBMarker_BowFuture = None
	endif
	if myFollowerBMarker_ShieldFuture
		myFollowerBMarker_Shield = GetFuture(myFollowerBMarker_ShieldFuture).get_result()
		myFollowerBMarker_ShieldFuture = None
	endif
	if myFollowerCMarker_MainWeaponFuture
		myFollowerCMarker_MainWeapon = GetFuture(myFollowerCMarker_MainWeaponFuture).get_result()
		myFollowerCMarker_MainWeaponFuture = None
	endif
	if myFollowerCMarker_OffHandWeaponFuture
		myFollowerCMarker_OffHandWeapon = GetFuture(myFollowerCMarker_OffHandWeaponFuture).get_result()
		myFollowerCMarker_OffHandWeaponFuture = None
	endif
	if myFollowerCMarker_BigWeaponFuture
		myFollowerCMarker_BigWeapon = GetFuture(myFollowerCMarker_BigWeaponFuture).get_result()
		myFollowerCMarker_BigWeaponFuture = None
	endif
	if myFollowerCMarker_BowFuture
		myFollowerCMarker_Bow = GetFuture(myFollowerCMarker_BowFuture).get_result()
		myFollowerCMarker_BowFuture = None
	endif
	if myFollowerCMarker_ShieldFuture
		myFollowerCMarker_Shield = GetFuture(myFollowerCMarker_ShieldFuture).get_result()
		myFollowerCMarker_ShieldFuture = None
	endif
	if myPlayerSitMarkerFuture
		myPlayerSitMarker = GetFuture(myPlayerSitMarkerFuture).get_result()
		myPlayerSitMarkerFuture = None
	endif
	if myPlayerLayDownMarkerFuture
		myPlayerLayDownMarker = GetFuture(myPlayerLayDownMarkerFuture).get_result()
		myPlayerLayDownMarkerFuture = None
	endif
	if myPlayerWithSpouseLayDownMarkerFuture
		myPlayerWithSpouseLayDownMarker = GetFuture(myPlayerWithSpouseLayDownMarkerFuture).get_result()
		myPlayerWithSpouseLayDownMarkerFuture = None
	endif
	if mySpouseLayDownMarkerFuture
		mySpouseLayDownMarker = GetFuture(mySpouseLayDownMarkerFuture).get_result()
		if Setting_BedRollScale != 1.0
			mySpouseLayDownMarker.SetScale(Setting_BedRollScale)
		endif
		mySpouseLayDownMarkerFuture = None
	endif
	if myBedRollFuture
		myBedRoll = GetFuture(myBedRollFuture).get_result()
		if Get2DDistance(self, myBedRoll) > 50.0
			self.MoveTo(myBedRoll, afZOffset = -2000.0)
		endif
		if Setting_BedRollScale != 1.0
			self.SetScale(Setting_BedRollScale)
		endif
		myBedRollFuture = None
	endif
	
	; Conjured shelters - enable the bed reference now.
	if self.IsDisabled()
		self.EnableNoWait()
		if Conjured
			(self as CampConjuredShelter).PlayWarpInEffect(self)
		endif
	endif
	
	if mySpareBedRoll1Future
		mySpareBedRoll1 = GetFuture(mySpareBedRoll1Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll1.SetScale(Setting_BedRollScale)
		endif
        (mySpareBedRoll1 as _Camp_CampTentNPCBedrollScript).Setup(self as CampTent, 1)
        mySpareBedRoll1SitMarker = GetFuture(mySpareBedRoll1SitMarkerFuture).get_result()
        mySpareBedRoll1SitMarkerFuture = None
        mySpareBedRoll1Future = None
	endif
	if mySpareBedRoll2Future
		mySpareBedRoll2 = GetFuture(mySpareBedRoll2Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll2.SetScale(Setting_BedRollScale)
		endif
        (mySpareBedRoll2 as _Camp_CampTentNPCBedrollScript).Setup(self as CampTent, 2)
        mySpareBedRoll2SitMarker = GetFuture(mySpareBedRoll2SitMarkerFuture).get_result()
        mySpareBedRoll2SitMarkerFuture = None
        mySpareBedRoll2Future = None
	endif
	if mySpareBedRoll3Future
		mySpareBedRoll3 = GetFuture(mySpareBedRoll3Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll3.SetScale(Setting_BedRollScale)
		endif
        (mySpareBedRoll3 as _Camp_CampTentNPCBedrollScript).Setup(self as CampTent, 3)
        mySpareBedRoll3SitMarker = GetFuture(mySpareBedRoll3SitMarkerFuture).get_result()
        mySpareBedRoll3SitMarkerFuture = None
        mySpareBedRoll3Future = None
	endif

	if Conjured
		Conjured.WarpInObjects()
	endif

	if GetLogLevel() <= 1
		GenerateDebugReport()
	endif
endFunction

function TakeDown()
	CampDebug(0, self + " TakeDown (CampTent)")
	SetCurrentTent(None)
	parent.TakeDown()

	; No way to do parent.parent.FunctionCall(), so return now.
	if (self as CampConjuredShelter)
		CampDebug(0, "CampTent is CampConjuredShelter, returning.")
		return
	endif

	ForceStopUsingFurniture(myClutterFurniture1)
	ForceStopUsingFurniture(myClutterFurniture2)
	ForceStopUsingFurniture(myClutterFurniture3)
	ForceStopUsingFurniture(myClutterFurniture4)
	ForceStopUsingFurniture(myClutterFurniture5)
	ForceStopUsingFurniture(myClutterFurniture6)
	ForceStopUsingFurniture(myClutterFurniture7)
	ForceStopUsingFurniture(myPlayerSitMarker)
	ForceStopUsingFurniture(myPlayerLayDownMarker)
	ForceStopUsingFurniture(myPlayerWithSpouseLayDownMarker)
	ForceStopUsingFurniture(mySpouseLayDownMarker)
	ForceStopUsingFurniture(myAnimalLayDownMarker)
	ForceStopUsingFurniture(myBedRoll)
	ForceStopUsingFurniture(mySpareBedRoll1)
	ForceStopUsingFurniture(mySpareBedRoll2)
	ForceStopUsingFurniture(mySpareBedRoll3)
	ForceStopUsingFurniture(mySpareBedRoll1SitMarker)
	ForceStopUsingFurniture(mySpareBedRoll2SitMarker)
	ForceStopUsingFurniture(mySpareBedRoll3SitMarker)

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
	TryToDisableAndDeleteRef(myClutterStatic6)
	TryToDisableAndDeleteRef(myClutterStatic7)
	TryToDisableAndDeleteRef(myClutterMisc1)
	TryToDisableAndDeleteRef(myClutterMisc2)
	TryToDisableAndDeleteRef(myClutterMisc3)
	TryToDisableAndDeleteRef(myClutterMisc4)
	TryToDisableAndDeleteRef(myClutterMisc5)
	TryToDisableAndDeleteRef(myClutterMisc6)
	TryToDisableAndDeleteRef(myClutterMisc7)

	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterActivator1)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterActivator2)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterActivator3)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterActivator4)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterActivator5)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterFurniture1)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterFurniture2)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterFurniture3)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterFurniture4)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterFurniture5)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterFurniture6)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myClutterFurniture7)

	TryToDisableAndDeleteRef(myBaseStatic1)
	TryToDisableAndDeleteRef(myBaseStatic2)
	TryToDisableAndDeleteRef(myBaseStatic3)
	TryToDisableAndDeleteRef(myBaseStatic4)
	TryToDisableAndDeleteRef(myBaseStatic5)
	TryToDisableAndDeleteRef(myBaseStatic6)
	TryToDisableAndDeleteRef(myBaseStatic7)
	TryToDisableAndDeleteRef(myPlayerSitMarker)
	TryToDisableAndDeleteRef(myPlayerLayDownMarker)
	TryToDisableAndDeleteRef(myPlayerWithSpouseLayDownMarker)
	TryToDisableAndDeleteRef(mySpouseLayDownMarker)
	TryToDisableAndDeleteRef(myAnimalLayDownMarker)
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
	TryToDisableAndDeleteRef(mySpareBedRoll1SitMarker)
	TryToDisableAndDeleteRef(mySpareBedRoll2SitMarker)
	TryToDisableAndDeleteRef(mySpareBedRoll3SitMarker)
	TryToDisableAndDeleteRef(mySnowTent)
	TryToDisableAndDeleteRef(myAshTent)
	TryToDisableAndDeleteRef(myNormalTent)
	TryToDisableAndDeleteRef(myTent)
	TryToDisableAndDeleteRef(myShelterCollider)
	TryToDisableAndDeleteRef(myLargeTentTriggerVolume)
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
	TryToDisableAndDeleteRef(myDisplayQuiver)
	TryToDisableAndDeleteRef(myDisplayShield)
	TryToDisableAndDeleteRef(myDisplayHelm)
	TryToDisableAndDeleteRef(myDisplayBackpack)
	TryToDisableAndDeleteRef(myDisplayBoots)
	TryToDisableAndDeleteRef(myDisplayGauntlets)
	TryToDisableAndDeleteRef(myDisplayCuirass)
	TryToDisableAndDeleteRef(myDisplayMainWeapon)
	TryToDisableAndDeleteRef(myDisplayOffHandWeapon)
	TryToDisableAndDeleteRef(myDisplayBigWeapon)
	TryToDisableAndDeleteRef(myDisplayBow)
	TryToDisableAndDeleteRef(myDisplayFollowerAShield)
	TryToDisableAndDeleteRef(myDisplayFollowerAMainWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerAOffHandWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerABigWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerABow)
	TryToDisableAndDeleteRef(myDisplayFollowerBShield)
	TryToDisableAndDeleteRef(myDisplayFollowerBMainWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerBOffHandWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerBBigWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerBBow)
	TryToDisableAndDeleteRef(myDisplayFollowerCShield)
	TryToDisableAndDeleteRef(myDisplayFollowerCMainWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerCOffHandWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerCBigWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerCBow)

	myPlayerMarker_MainWeapon = None
	myPlayerMarker_OffHandWeapon = None
	myPlayerMarker_BigWeapon = None
	myPlayerMarker_Bow = None
	myPlayerMarker_Cuirass = None
	myPlayerMarker_Helm = None
	myPlayerMarker_Boots = None
	myPlayerMarker_Gauntlets = None
	myPlayerMarker_Backpack = None
	myPlayerMarker_Shield = None
	myPlayerMarker_ShieldInterior = None
	myBaseStatic1 = None
	myBaseStatic2 = None
	myBaseStatic3 = None
	myBaseStatic4 = None
	myBaseStatic5 = None
	myBaseStatic6 = None
	myBaseStatic7 = None
	myClutterStatic1 = None
	myClutterStatic2 = None
	myClutterStatic3 = None
	myClutterStatic4 = None
	myClutterStatic5 = None
	myClutterStatic6 = None
	myClutterStatic7 = None
	myClutterActivator1 = None
	myClutterActivator2 = None
	myClutterActivator3 = None
	myClutterActivator4 = None
	myClutterActivator5 = None
	myClutterFurniture1 = None
	myClutterFurniture2 = None
	myClutterFurniture3 = None
	myClutterFurniture4 = None
	myClutterFurniture5 = None
	myClutterFurniture6 = None
	myClutterFurniture7 = None
	myPlayerSitMarker = None
	myPlayerLayDownMarker = None
	myPlayerWithSpouseLayDownMarker = None
	mySpouseLayDownMarker = None
	myAnimalLayDownMarker = None
	myExitFront = None
	myBedRoll = None
	myWard = None
	myLanternLit = None
	myLanternUnlit = None
	myLanternLight = None
	myLanternLit2 = None
	myLanternUnlit2 = None
	myLanternLight2 = None
	myLanternLit3 = None
	myLanternUnlit3 = None
	myLanternLight3 = None
	mySpareBedRoll1 = None
	mySpareBedRoll2 = None
	mySpareBedRoll3 = None
	mySpareBedRoll1SitMarker = None
	mySpareBedRoll2SitMarker = None
	mySpareBedRoll3SitMarker = None
	mySnowTent = None
	myAshTent = None
	myNormalTent = None
	myTent = None
	myShelterCollider = None
	myLargeTentTriggerVolume = None
	myFollowerAMarker_MainWeapon = None
	myFollowerAMarker_OffHandWeapon = None
	myFollowerAMarker_BigWeapon = None
	myFollowerAMarker_Bow = None
	myFollowerAMarker_Shield = None
	myFollowerBMarker_MainWeapon = None
	myFollowerBMarker_OffHandWeapon = None
	myFollowerBMarker_BigWeapon = None
	myFollowerBMarker_Bow = None
	myFollowerBMarker_Shield = None
	myFollowerCMarker_MainWeapon = None
	myFollowerCMarker_OffHandWeapon = None
	myFollowerCMarker_BigWeapon = None
	myFollowerCMarker_Bow = None
	myFollowerCMarker_Shield = None
	myDisplayQuiver = None
	myDisplayShield = None
	myDisplayHelm = None
	myDisplayBackpack = None
	myDisplayBoots = None
	myDisplayGauntlets = None
	myDisplayCuirass = None
	myDisplayMainWeapon = None
	myDisplayOffHandWeapon = None
	myDisplayBigWeapon = None
	myDisplayBow = None
	myDisplayFollowerAShield = None
	myDisplayFollowerAMainWeapon = None
	myDisplayFollowerAOffHandWeapon = None
	myDisplayFollowerABigWeapon = None
	myDisplayFollowerABow = None
	myDisplayFollowerBShield = None
	myDisplayFollowerBMainWeapon = None
	myDisplayFollowerBOffHandWeapon = None
	myDisplayFollowerBBigWeapon = None
	myDisplayFollowerBBow = None
	myDisplayFollowerCShield = None
	myDisplayFollowerCMainWeapon = None
	myDisplayFollowerCOffHandWeapon = None
	myDisplayFollowerCBigWeapon = None
	myDisplayFollowerCBow = None

	TryToDisableAndDeleteRef(self)
endFunction

function GenerateDebugReport()
	CampDebug(1, "Placement complete. Placed object report:")
	CampDebug(1, "======================================================================")
	CampDebug(1, "**SELF**: " + self)
	CampDebug(1, "myPlayerMarker_MainWeapon:" + myPlayerMarker_MainWeapon)
	CampDebug(1, "myPlayerMarker_OffHandWeapon:" + myPlayerMarker_OffHandWeapon)
	CampDebug(1, "myPlayerMarker_BigWeapon:" + myPlayerMarker_BigWeapon)
	CampDebug(1, "myPlayerMarker_Bow:" + myPlayerMarker_Bow)
	CampDebug(1, "myPlayerMarker_Cuirass:" + myPlayerMarker_Cuirass)
	CampDebug(1, "myPlayerMarker_Helm:" + myPlayerMarker_Helm)
	CampDebug(1, "myPlayerMarker_Boots:" + myPlayerMarker_Boots)
	CampDebug(1, "myPlayerMarker_Gauntlets:" + myPlayerMarker_Gauntlets)
	CampDebug(1, "myPlayerMarker_Backpack:" + myPlayerMarker_Backpack)
	CampDebug(1, "myPlayerMarker_Shield:" + myPlayerMarker_Shield)
	CampDebug(1, "myPlayerMarker_ShieldInterior:" + myPlayerMarker_ShieldInterior)
	CampDebug(1, "myBaseStatic1:" + myBaseStatic1)
	CampDebug(1, "myBaseStatic2:" + myBaseStatic2)
	CampDebug(1, "myBaseStatic3:" + myBaseStatic3)
	CampDebug(1, "myBaseStatic4:" + myBaseStatic4)
	CampDebug(1, "myBaseStatic5:" + myBaseStatic5)
	CampDebug(1, "myBaseStatic6:" + myBaseStatic6)
	CampDebug(1, "myBaseStatic7:" + myBaseStatic7)
	CampDebug(1, "myClutterStatic1:" + myClutterStatic1)
	CampDebug(1, "myClutterStatic2:" + myClutterStatic2)
	CampDebug(1, "myClutterStatic3:" + myClutterStatic3)
	CampDebug(1, "myClutterStatic4:" + myClutterStatic4)
	CampDebug(1, "myClutterStatic5:" + myClutterStatic5)
	CampDebug(1, "myClutterStatic6:" + myClutterStatic6)
	CampDebug(1, "myClutterStatic7:" + myClutterStatic7)
	CampDebug(1, "myClutterActivator1:" + myClutterActivator1)
	CampDebug(1, "myClutterActivator2:" + myClutterActivator2)
	CampDebug(1, "myClutterActivator3:" + myClutterActivator3)
	CampDebug(1, "myClutterActivator4:" + myClutterActivator4)
	CampDebug(1, "myClutterActivator5:" + myClutterActivator5)
	CampDebug(1, "myClutterFurniture1:" + myClutterFurniture1)
	CampDebug(1, "myClutterFurniture2:" + myClutterFurniture2)
	CampDebug(1, "myClutterFurniture3:" + myClutterFurniture3)
	CampDebug(1, "myClutterFurniture4:" + myClutterFurniture4)
	CampDebug(1, "myClutterFurniture5:" + myClutterFurniture5)
	CampDebug(1, "myClutterFurniture6:" + myClutterFurniture6)
	CampDebug(1, "myClutterFurniture7:" + myClutterFurniture7)
	CampDebug(1, "myPlayerSitMarker:" + myPlayerSitMarker)
	CampDebug(1, "myPlayerLayDownMarker:" + myPlayerLayDownMarker)
	CampDebug(1, "myPlayerWithSpouseLayDownMarker:" + myPlayerWithSpouseLayDownMarker)
	CampDebug(1, "mySpouseLayDownMarker:" + mySpouseLayDownMarker)
	CampDebug(1, "myAnimalLayDownMarker:" + myAnimalLayDownMarker)
	CampDebug(1, "myExitFront:" + myExitFront)
	CampDebug(1, "myBedRoll:" + myBedRoll)
	CampDebug(1, "myWard:" + myWard)
	CampDebug(1, "myLanternLit:" + myLanternLit)
	CampDebug(1, "myLanternUnlit:" + myLanternUnlit)
	CampDebug(1, "myLanternLight:" + myLanternLight)
	CampDebug(1, "myLanternLit2:" + myLanternLit2)
	CampDebug(1, "myLanternUnlit2:" + myLanternUnlit2)
	CampDebug(1, "myLanternLight2:" + myLanternLight2)
	CampDebug(1, "myLanternLit3:" + myLanternLit3)
	CampDebug(1, "myLanternUnlit3:" + myLanternUnlit3)
	CampDebug(1, "myLanternLight3:" + myLanternLight3)
	CampDebug(1, "mySpareBedRoll1:" + mySpareBedRoll1)
	CampDebug(1, "mySpareBedRoll2:" + mySpareBedRoll2)
	CampDebug(1, "mySpareBedRoll3:" + mySpareBedRoll3)
	CampDebug(1, "mySpareBedRoll1SitMarker:" + mySpareBedRoll1SitMarker)
	CampDebug(1, "mySpareBedRoll2SitMarker:" + mySpareBedRoll2SitMarker)
	CampDebug(1, "mySpareBedRoll3SitMarker:" + mySpareBedRoll3SitMarker)
	CampDebug(1, "mySnowTent:" + mySnowTent)
	CampDebug(1, "myAshTent:" + myAshTent)
	CampDebug(1, "myNormalTent:" + myNormalTent)
	CampDebug(1, "myTent:" + myTent)
	CampDebug(1, "myShelterCollider:" + myShelterCollider)
	CampDebug(1, "myLargeTentTriggerVolume:" + myLargeTentTriggerVolume)
	CampDebug(1, "myFollowerAMarker_MainWeapon:" + myFollowerAMarker_MainWeapon)
	CampDebug(1, "myFollowerAMarker_OffHandWeapon:" + myFollowerAMarker_OffHandWeapon)
	CampDebug(1, "myFollowerAMarker_BigWeapon:" + myFollowerAMarker_BigWeapon)
	CampDebug(1, "myFollowerAMarker_Bow:" + myFollowerAMarker_Bow)
	CampDebug(1, "myFollowerAMarker_Shield:" + myFollowerAMarker_Shield)
	CampDebug(1, "myFollowerBMarker_MainWeapon:" + myFollowerBMarker_MainWeapon)
	CampDebug(1, "myFollowerBMarker_OffHandWeapon:" + myFollowerBMarker_OffHandWeapon)
	CampDebug(1, "myFollowerBMarker_BigWeapon:" + myFollowerBMarker_BigWeapon)
	CampDebug(1, "myFollowerBMarker_Bow:" + myFollowerBMarker_Bow)
	CampDebug(1, "myFollowerBMarker_Shield:" + myFollowerBMarker_Shield)
	CampDebug(1, "myFollowerCMarker_MainWeapon:" + myFollowerCMarker_MainWeapon)
	CampDebug(1, "myFollowerCMarker_OffHandWeapon:" + myFollowerCMarker_OffHandWeapon)
	CampDebug(1, "myFollowerCMarker_BigWeapon:" + myFollowerCMarker_BigWeapon)
	CampDebug(1, "myFollowerCMarker_Bow:" + myFollowerCMarker_Bow)
	CampDebug(1, "myFollowerCMarker_Shield:" + myFollowerCMarker_Shield)
	CampDebug(1, "myDisplayQuiver:" + myDisplayQuiver)
	CampDebug(1, "myDisplayShield:" + myDisplayShield)
	CampDebug(1, "myDisplayHelm:" + myDisplayHelm)
	CampDebug(1, "myDisplayBackpack:" + myDisplayBackpack)
	CampDebug(1, "myDisplayBoots:" + myDisplayBoots)
	CampDebug(1, "myDisplayGauntlets:" + myDisplayGauntlets)
	CampDebug(1, "myDisplayCuirass:" + myDisplayCuirass)
	CampDebug(1, "myDisplayMainWeapon:" + myDisplayMainWeapon)
	CampDebug(1, "myDisplayOffHandWeapon:" + myDisplayOffHandWeapon)
	CampDebug(1, "myDisplayBigWeapon:" + myDisplayBigWeapon)
	CampDebug(1, "myDisplayBow:" + myDisplayBow)
	CampDebug(1, "myDisplayFollowerAShield:" + myDisplayFollowerAShield)
	CampDebug(1, "myDisplayFollowerAMainWeapon:" + myDisplayFollowerAMainWeapon)
	CampDebug(1, "myDisplayFollowerAOffHandWeapon:" + myDisplayFollowerAOffHandWeapon)
	CampDebug(1, "myDisplayFollowerABigWeapon:" + myDisplayFollowerABigWeapon)
	CampDebug(1, "myDisplayFollowerABow:" + myDisplayFollowerABow)
	CampDebug(1, "myDisplayFollowerBShield:" + myDisplayFollowerBShield)
	CampDebug(1, "myDisplayFollowerBMainWeapon:" + myDisplayFollowerBMainWeapon)
	CampDebug(1, "myDisplayFollowerBOffHandWeapon:" + myDisplayFollowerBOffHandWeapon)
	CampDebug(1, "myDisplayFollowerBBigWeapon:" + myDisplayFollowerBBigWeapon)
	CampDebug(1, "myDisplayFollowerBBow:" + myDisplayFollowerBBow)
	CampDebug(1, "myDisplayFollowerCShield:" + myDisplayFollowerCShield)
	CampDebug(1, "myDisplayFollowerCMainWeapon:" + myDisplayFollowerCMainWeapon)
	CampDebug(1, "myDisplayFollowerCOffHandWeapon:" + myDisplayFollowerCOffHandWeapon)
	CampDebug(1, "myDisplayFollowerCBigWeapon:" + myDisplayFollowerCBigWeapon)
	CampDebug(1, "myDisplayFollowerCBow:" + myDisplayFollowerCBow)
	CampDebug(1, "======================================================================")
endFunction

function PlaceObject_Tent()
	myTentFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterModel, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_ShelterCollider()
	myShelterColliderFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterDestructionCollider, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_NormalTent()
	myNormalTentFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterModelExterior, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_SnowTent()
	mySnowTentFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterModelMaterialSnow, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_AshTent()
	myAshTentFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterModelMaterialAsh, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_LargeTentTriggerVolume()
	myLargeTentTriggerVolumeFuture = PlacementSystem.PlaceObject(self, TentAsset_LargeTentTriggerVolume, PositionRef_Shelter, is_temp = is_temporary)
endFunction

;@Overrides _Camp_PlaceableObjectBase
function PlaceObject_FireMarkers()
	float fire_z_offset = (Game.GetFormFromFile(0x0005573D, "Campfire.esm") as GlobalVariable).GetValue() * -1.0
	float xr
	float yr
	if PositionRef_Shelter
		xr = (PositionRef_Shelter.GetWidth() / 2) * 0.7
		yr = (PositionRef_Shelter.GetLength() / 2) * 0.7
	else
		xr = (self.GetWidth() / 2)
		yr = (self.GetLength() / 2)
	endif
	myFire1Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr), is_hanging = True, z_hanging_offset = fire_z_offset, is_temp = is_temporary)
	myFire2Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr), is_hanging = True, z_hanging_offset = fire_z_offset, is_temp = is_temporary)
	myFire3Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr), is_hanging = True, z_hanging_offset = fire_z_offset, is_temp = is_temporary)
	myFire4Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr), is_hanging = True, z_hanging_offset = fire_z_offset, is_temp = is_temporary)
	myFire5Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr), is_hanging = True, z_hanging_offset = fire_z_offset, is_temp = is_temporary)
	myFire6Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr), is_hanging = True, z_hanging_offset = fire_z_offset, is_temp = is_temporary)
	mySmokeFuture = PlacementSystem.PlaceObject(self, PlacementSystem._Camp_LargeFireSmoke, self, initially_disabled = true, is_hanging = True, z_hanging_offset = 10.0 + fire_z_offset, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic1()
	myClutterStatic1Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic1, PositionRef_ClutterStatic1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic2()
	myClutterStatic2Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic2, PositionRef_ClutterStatic2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic3()
	myClutterStatic3Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic3, PositionRef_ClutterStatic3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic4()
	myClutterStatic4Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic4, PositionRef_ClutterStatic4, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic5()
	myClutterStatic5Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic5, PositionRef_ClutterStatic5, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator1(CampTentEx Extended)
	myClutterActivator1Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator1, Extended.PositionRef_ClutterActivator1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator2(CampTentEx Extended)
	myClutterActivator2Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator2, Extended.PositionRef_ClutterActivator2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator3(CampTentEx Extended)
	myClutterActivator3Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator3, Extended.PositionRef_ClutterActivator3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator4(CampTentEx Extended)
	myClutterActivator4Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator4, Extended.PositionRef_ClutterActivator4, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator5(CampTentEx Extended)
	myClutterActivator5Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterActivator5, Extended.PositionRef_ClutterActivator5, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture1(CampTentEx Extended)
	myClutterFurniture1Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture1, Extended.PositionRef_ClutterFurniture1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture2(CampTentEx Extended)
	myClutterFurniture2Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture2, Extended.PositionRef_ClutterFurniture2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture3(CampTentEx Extended)
	myClutterFurniture3Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture3, Extended.PositionRef_ClutterFurniture3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture4(CampTentEx Extended)
	myClutterFurniture4Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture4, Extended.PositionRef_ClutterFurniture4, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture5(CampTentEx Extended)
	myClutterFurniture5Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture5, Extended.PositionRef_ClutterFurniture5, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerMainWeapon()
	myPlayerMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_WeaponMainHand, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerOffHandWeapon()
	myPlayerMarker_OffHandWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_WeaponOffHand, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerBigWeapon()
	myPlayerMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_WeaponTwoHand, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerBow()
	myPlayerMarker_BowFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_WeaponBow, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerShield()
	myPlayerMarker_ShieldFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_Shield, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerCuirass()
	myPlayerMarker_CuirassFuture= PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_ArmorCuirass, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerHelm()
	myPlayerMarker_HelmFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_ArmorHelm, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerBoots()
	myPlayerMarker_BootsFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_ArmorBoots, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerGauntlets()
	myPlayerMarker_GauntletsFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_ArmorGauntlets, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerBackpack()
	myPlayerMarker_BackpackFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_Backpack, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerShieldInterior()
	myPlayerMarker_ShieldInteriorFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Player_ShieldInterior, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerSitMarker()
	if GetCompatibilitySystem().isSkyrimVR
		Furniture VRSitMarker = Game.GetFormFromFile(0x0207BEA1, "Campfire.esm") as Furniture
		myPlayerSitMarkerFuture = PlacementSystem.PlaceObject(self, VRSitMarker, RequiredPositionRef_PlayerBed, z_pos_offset = 18.0, z_local_ang_adjust = 180.0 + Setting_PlayerSitAngle, is_temp = is_temporary)
	else
		myPlayerSitMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentSitMarker, RequiredPositionRef_PlayerBed, x_pos_offset = 12.1647, y_pos_offset = -22.7978, z_pos_offset = 5.1221, z_local_ang_adjust = 180.0 + Setting_PlayerSitAngle, is_temp = is_temporary)
	endif
endFunction

function PlaceObject_PlayerLayDownMarker()
	myPlayerLayDownMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentLayDownMarker, RequiredPositionRef_PlayerBed, z_pos_offset = 2.1221, z_local_ang_adjust = 180.0, is_temp = is_temporary)
endFunction

function PlaceObject_PlayerWithSpouseLayDownMarker()
	myPlayerWithSpouseLayDownMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentLayDownMarker, RequiredPositionRef_PlayerBed, x_pos_offset = 11.4984, z_pos_offset = 2.1221, z_local_ang_adjust = 180.0, is_temp = is_temporary)
endFunction

function PlaceObject_SpouseLayDownMarker()
	mySpouseLayDownMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_Bedroll_SpouseF, RequiredPositionRef_PlayerBed, x_pos_offset = -24.3813, y_pos_offset = -7.3676, z_local_ang_adjust = -4.46, is_temp = is_temporary)
endFunction

function PlaceObject_AnimalLayDownMarker()
	myAnimalLayDownMarkerFuture = PlacementSystem.PlaceObject(self, DogLayingDownIdleMarker, PositionRef_AnimalLayDownMarker, is_temp = is_temporary)
endFunction

function PlaceObject_ExitFront()
	myExitFrontFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_FrontExitMarker, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_BedRoll()
	myBedRollFuture = PlacementSystem.PlaceObject(self, _Camp_Bedroll_ActualF, RequiredPositionRef_PlayerBed, z_pos_offset = 2000.0, is_temp = is_temporary)
endFunction

function PlaceObject_Ward()
	myWardFuture = PlacementSystem.PlaceObject(self, _Camp_TentWard, PositionRef_Ward, x_local_ang_adjust = -90.0, is_propped = true, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_Lantern1()
	myLanternUnlitFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false, bSilverCandlestick = Setting_UseSilverCandlestick), PositionRef_Lantern1, is_temp = is_temporary)
	myLanternLitFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false, bSilverCandlestick = Setting_UseSilverCandlestick), PositionRef_Lantern1, initially_disabled = true, is_temp = is_temporary)
	myLanternLightFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), PositionRef_Lantern1, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_Lantern2(CampTentEx Extended)
	myLanternUnlit2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false, bSilverCandlestick = Setting_UseSilverCandlestick), Extended.PositionRef_Lantern2, is_temp = is_temporary)
	myLanternLit2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false, bSilverCandlestick = Setting_UseSilverCandlestick), Extended.PositionRef_Lantern2, initially_disabled = true, is_temp = is_temporary)
	myLanternLight2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), Extended.PositionRef_Lantern2, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_Lantern3(CampTentEx Extended)
	myLanternUnlit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false, bSilverCandlestick = Setting_UseSilverCandlestick), Extended.PositionRef_Lantern3, is_temp = is_temporary)
	myLanternLit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false, bSilverCandlestick = Setting_UseSilverCandlestick), Extended.PositionRef_Lantern3, initially_disabled = true, is_temp = is_temporary)
	myLanternLight3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), Extended.PositionRef_Lantern3, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll1(CampTentEx Extended)
	mySpareBedRoll1Future = PlacementSystem.PlaceObject(self, _Camp_Bedroll_NPC_F, Extended.PositionRef_Follower1_Bed, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll2(CampTentEx Extended)
	mySpareBedRoll2Future = PlacementSystem.PlaceObject(self, _Camp_Bedroll_NPC_F, Extended.PositionRef_Follower2_Bed, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll3(CampTentEx Extended)
	mySpareBedRoll3Future = PlacementSystem.PlaceObject(self, _Camp_Bedroll_NPC_F, Extended.PositionRef_Follower3_Bed, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll1SitMarker(CampTentEx Extended)
	mySpareBedRoll1SitMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentSitMarkerSandbox, Extended.PositionRef_Follower1_Bed, x_pos_offset = 2.1647, y_pos_offset = -22.7978, z_pos_offset = 5.1221, z_local_ang_adjust = 180.0, is_temp = is_temporary)
endFunction
function PlaceObject_SpareBedRoll2SitMarker(CampTentEx Extended)
	mySpareBedRoll2SitMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentSitMarkerSandbox, Extended.PositionRef_Follower2_Bed, x_pos_offset = 2.1647, y_pos_offset = -22.7978, z_pos_offset = 5.1221, z_local_ang_adjust = 180.0, is_temp = is_temporary)
endFunction
function PlaceObject_SpareBedRoll3SitMarker(CampTentEx Extended)
	mySpareBedRoll3SitMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentSitMarkerSandbox, Extended.PositionRef_Follower3_Bed, x_pos_offset = 2.1647, y_pos_offset = -22.7978, z_pos_offset = 5.1221, z_local_ang_adjust = 180.0, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1MainWeapon(CampTentEx Extended)
	myFollowerAMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower1_WeaponMainHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1OffHandWeapon(CampTentEx Extended)
	myFollowerAMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower1_WeaponOffHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1BigWeapon(CampTentEx Extended)
	myFollowerAMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower1_WeaponTwoHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1Bow(CampTentEx Extended)
	myFollowerAMarker_BowFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower1_WeaponBow, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1Shield(CampTentEx Extended)
	myFollowerAMarker_ShieldFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower1_Shield, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2MainWeapon(CampTentEx Extended)
	myFollowerBMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower2_WeaponMainHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2OffHandWeapon(CampTentEx Extended)
	myFollowerBMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower2_WeaponOffHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2BigWeapon(CampTentEx Extended)
	myFollowerBMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower2_WeaponTwoHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2Bow(CampTentEx Extended)
	myFollowerBMarker_BowFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower2_WeaponBow, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2Shield(CampTentEx Extended)
	myFollowerBMarker_ShieldFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower2_Shield, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3MainWeapon(CampTentEx Extended)
	myFollowerCMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower3_WeaponMainHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3OffHandWeapon(CampTentEx Extended)
	myFollowerCMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower3_WeaponOffHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3BigWeapon(CampTentEx Extended)
	myFollowerCMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower3_WeaponTwoHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3Bow(CampTentEx Extended)
	myFollowerCMarker_BowFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower3_WeaponBow, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3Shield(CampTentEx Extended)
	myFollowerCMarker_ShieldFuture = PlacementSystem.PlaceObject(self, XMarker, Extended.PositionRef_Follower3_Shield, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true, is_temp = is_temporary)
endFunction

; Conjured Shelter function stubs - overridden by CampConjuredShelter
function PlaceObject_BaseStatic1()
endFunction
function PlaceObject_BaseStatic2()
endFunction
function PlaceObject_BaseStatic3()
endFunction
function PlaceObject_BaseStatic4()
endFunction
function PlaceObject_BaseStatic5()
endFunction
function PlaceObject_BaseStatic6()
endFunction
function PlaceObject_BaseStatic7()
endFunction
function PlaceObject_ClutterMisc1()
endFunction
function PlaceObject_ClutterMisc2()
endFunction
function PlaceObject_ClutterMisc3()
endFunction
function PlaceObject_ClutterMisc4()
endFunction
function PlaceObject_ClutterMisc5()
endFunction
function PlaceObject_ClutterMisc6()
endFunction
function PlaceObject_ClutterMisc7()
endFunction
function PlaceObject_ClutterFurniture6()
endFunction
function PlaceObject_ClutterFurniture7()
endFunction
function PlaceObject_ClutterStatic6()
endFunction
function PlaceObject_ClutterStatic7()
endFunction


function DestroyMyself()
	TentSystem.DestroyTent(self)
endFunction

state BurningDown
	function BurnDown()
		ObjectReference myBigFire
		if myTent
			myBigFire = myTent.PlaceAtMe(PlacementSystem._Camp_LargeFire, abInitiallyDisabled = true)
		else
			myBigFire = self.PlaceAtMe(PlacementSystem._Camp_LargeFire, abInitiallyDisabled = true)
		endif
		float xs
		float ys
		if PositionRef_Shelter
			xs = PositionRef_Shelter.GetWidth()
			ys = PositionRef_Shelter.GetLength()
		else
			xs = 200.0
			ys = 200.0
		endif
		float size
		if xs > ys
			size = xs
		else
			size = ys
		endif
		myBigFire.SetScale(size / 750)
		myBigFire.Enable(true)
		mySmoke.Disable(true)
		TryToPlayShader(self)
		TryToPlayShader(myClutterStatic1)
		TryToPlayShader(myClutterStatic2)
		TryToPlayShader(myClutterStatic3)
		TryToPlayShader(myClutterStatic4)
		TryToPlayShader(myClutterStatic5)
		TryToPlayShader(myClutterActivator1)
		TryToPlayShader(myClutterActivator2)
		TryToPlayShader(myClutterActivator3)
		TryToPlayShader(myClutterActivator4)
		TryToPlayShader(myClutterActivator5)
		TryToPlayShader(myClutterFurniture1)
		TryToPlayShader(myClutterFurniture2)
		TryToPlayShader(myClutterFurniture3)
		TryToPlayShader(myClutterFurniture4)
		TryToPlayShader(myClutterFurniture5)
		TryToPlayShader(myWard)
		TryToPlayShader(mySpareBedRoll1)
		TryToPlayShader(mySpareBedRoll2)
		TryToPlayShader(mySpareBedRoll3)
		TryToPlayShader(mySnowTent)
		TryToPlayShader(myAshTent)
		TryToPlayShader(myNormalTent)
		TryToPlayShader(myTent)
		utility.wait(10.5)

		if myTent && myTent.IsEnabled()
			float fire_z_offset = (Game.GetFormFromFile(0x0005573D, "Campfire.esm") as GlobalVariable).GetValue() * -1.0
			ObjectReference rubble = myTent.PlaceAtMe(PlacementSystem._Camp_ObjectRubbleFire, abInitiallyDisabled = true)
			rubble.SetScale(0.8)
			rubble.SetAngle(rubble.GetAngleX(), rubble.GetAngleY(), Utility.RandomFloat(0.0, 359.0))
			rubble.MoveTo(rubble, afZOffset = fire_z_offset)
			rubble.EnableNoWait()
			myTent.PlaceAtMe(PlacementSystem._Camp_CollapseFireball)
		endif
		TakeDown()
		utility.wait(3.5)
		self.Disable()
		if myTent
			myTent.PlaceAtMe(PlacementSystem.FallingDustExplosion01)
		else
			self.PlaceAtMe(PlacementSystem.FallingDustExplosion01)
		endif
		utility.wait(7.0)
		TryToDisableAndDeleteRef(self)
	endFunction
endState
