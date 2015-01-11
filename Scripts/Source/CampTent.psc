scriptname CampTent extends _Camp_PlaceableObjectBase

import CampUtil
;import TentUtil

; REQUIRED PROPERTIES
ObjectReference property RequiredPositionRef_PlayerBed auto
{The player's bed roll (main interactible) position reference.}

ObjectReference property RequiredPositionRef_SitFurniture auto
{The player's sitting furniture position reference.}

ObjectReference property RequiredPositionRef_LieDownFurniture auto
{The player's lying down furniture position reference.}

; OPTIONAL PROPERTIES

Static property TentAsset_ShelterModel auto
{Optional: The tent (structure) static object.}

Static property TentAsset_ShelterModelSnow auto
{Optional: The tent (structure) static object, with snow directional shader applied.}

Static property TentAsset_ShelterModelAsh auto
{Optional: The tent (structure) static object, with ash directional shader applied (use _Camp_AshMaterialSolstheim1P_2 instead of a direct dependency on Dragonborn.esm)}

ObjectReference property PositionRef_FrontExitMarker auto
{Optional: Position reference of marker to move the player to when exiting a small tent.}

ObjectReference property PositionRef_Shelter auto
{Optional: The shelter (tent, structure) position reference.}

ObjectReference property PositionRef_Ward auto

ObjectReference property PositionRef_Lantern1 auto
{Optional: The first lantern's position reference.}

ObjectReference property PositionRef_Clutter1 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Clutter2 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Clutter3 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Clutter4 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Clutter5 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Player_Backpack auto

ObjectReference property PositionRef_Player_Shield auto

ObjectReference property PositionRef_Player_WeaponMainHand auto

ObjectReference property PositionRef_Player_WeaponOffHand auto

ObjectReference property PositionRef_Player_WeaponTwoHand auto

ObjectReference property PositionRef_Player_WeaponBow auto

ObjectReference property PositionRef_Player_ArmorHelm auto

ObjectReference property PositionRef_Player_ArmorCuirass auto

ObjectReference property PositionRef_Player_ArmorGauntlets auto

ObjectReference property PositionRef_Player_ArmorBoots auto

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
float[] property myClutter1_Pos auto hidden
float[] property myClutter2_Pos auto hidden
float[] property myClutter3_Pos auto hidden
float[] property myClutter4_Pos auto hidden
float[] property myClutter5_Pos auto hidden
float[] property myClutter6_Pos auto hidden
float[] property myClutter7_Pos auto hidden
float[] property myClutter8_Pos auto hidden
float[] property myClutter9_Pos auto hidden
float[] property myClutter10_Pos auto hidden
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
ObjectReference property myClutter1 auto hidden
ObjectReference property myClutter2 auto hidden
ObjectReference property myClutter3 auto hidden
ObjectReference property myClutter4 auto hidden
ObjectReference property myClutter5 auto hidden
ObjectReference property myClutter6 auto hidden
ObjectReference property myClutter7 auto hidden
ObjectReference property myClutter8 auto hidden
ObjectReference property myClutter9 auto hidden
ObjectReference property myClutter10 auto hidden
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

bool bLanternLit = false
bool bGettingUp = false

Event OnUpdate()
	bool bUsingTent = TentUtil.UpdateTentUseState(myFrontExitMarker)
	if bUsingTent
		RegisterForSingleUpdate(0.5)
	else
		TentUtil.CleanUpTent(self.GetBaseObject())
	endif
endEvent

Event OnActivate(ObjectReference akActionRef)
	TentUtil.ActivateTent(akActionRef, myPlayerSitMarker, myPlayerLayDownMarker)
endEvent