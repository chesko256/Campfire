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
Form property myTent auto hidden
Form property myTentExterior auto hidden
Form property myNormalTent auto hidden
Form property mySnowTent auto hidden
Form property myAshTent auto hidden
Form property myLanternLit auto hidden
Form property myLanternUnlit auto hidden
Form property myLanternLight auto hidden
Form property myLanternLit2 auto hidden
Form property myLanternUnlit2 auto hidden
Form property myLanternLight2 auto hidden
Form property myLanternLit3 auto hidden
Form property myLanternUnlit3 auto hidden
Form property myLanternLight3 auto hidden
Form property myPlayerMarker_MainWeapon auto hidden
Form property myPlayerMarker_OffHandWeapon auto hidden
Form property myPlayerMarker_BigWeapon auto hidden
Form property myPlayerMarker_Bow auto hidden
Form property myPlayerMarker_Helm auto hidden
Form property myPlayerMarker_Boots auto hidden
Form property myPlayerMarker_Gauntlets auto hidden
Form property myPlayerMarker_Cuirass auto hidden
Form property myPlayerMarker_Backpack auto hidden
Form property myPlayerMarker_Shield auto hidden
Form property myPlayerMarker_ShieldInterior auto hidden
Form property myFollowerAMarker_MainWeapon auto hidden
Form property myFollowerAMarker_OffHandWeapon auto hidden
Form property myFollowerAMarker_BigWeapon auto hidden
Form property myFollowerAMarker_Bow auto hidden
Form property myFollowerAMarker_Shield auto hidden
Form property myFollowerBMarker_MainWeapon auto hidden
Form property myFollowerBMarker_OffHandWeapon auto hidden
Form property myFollowerBMarker_BigWeapon auto hidden
Form property myFollowerBMarker_Bow auto hidden
Form property myFollowerBMarker_Shield auto hidden
Form property myFollowerCMarker_MainWeapon auto hidden
Form property myFollowerCMarker_OffHandWeapon auto hidden
Form property myFollowerCMarker_BigWeapon auto hidden
Form property myFollowerCMarker_Bow auto hidden
Form property myFollowerCMarker_Shield auto hidden
Form property myClutterStatic1 auto hidden
Form property myClutterStatic2 auto hidden
Form property myClutterStatic3 auto hidden
Form property myClutterStatic4 auto hidden
Form property myClutterStatic5 auto hidden
Form property myClutterActivator1 auto hidden
Form property myClutterActivator2 auto hidden
Form property myClutterActivator3 auto hidden
Form property myClutterActivator4 auto hidden
Form property myClutterActivator5 auto hidden
Form property myClutterFurniture1 auto hidden
Form property myClutterFurniture2 auto hidden
Form property myClutterFurniture3 auto hidden
Form property myClutterFurniture4 auto hidden
Form property myClutterFurniture5 auto hidden
Form property myPlayerSitMarker auto hidden
Form property myPlayerLayDownMarker auto hidden
Form property myExitFront auto hidden
Form property myBedRoll auto hidden
Form property mySpareBedRoll1 auto hidden
Form property mySpareBedRoll2 auto hidden
Form property mySpareBedRoll3 auto hidden
Form property myWard auto hidden

;Futures
ObjectReference myTentFuture
ObjectReference myTentExteriorFuture
ObjectReference myNormalTentFuture
ObjectReference mySnowTentFuture
ObjectReference myAshTentFuture
ObjectReference myLanternLitFuture
ObjectReference myLanternUnlitFuture
ObjectReference myLanternLightFuture
ObjectReference myLanternLit2Future
ObjectReference myLanternUnlit2Future
ObjectReference myLanternLight2Future
ObjectReference myLanternLit3Future
ObjectReference myLanternUnlit3Future
ObjectReference myLanternLight3Future
ObjectReference myPlayerMarker_MainWeaponFuture
ObjectReference myPlayerMarker_OffHandWeaponFuture
ObjectReference myPlayerMarker_BigWeaponFuture
ObjectReference myPlayerMarker_BowFuture
ObjectReference myPlayerMarker_HelmFuture
ObjectReference myPlayerMarker_BootsFuture
ObjectReference myPlayerMarker_GauntletsFuture
ObjectReference myPlayerMarker_CuirassFuture
ObjectReference myPlayerMarker_BackpackFuture
ObjectReference myPlayerMarker_ShieldFuture
ObjectReference myPlayerMarker_ShieldInteriorFuture
ObjectReference myFollowerAMarker_MainWeaponFuture
ObjectReference myFollowerAMarker_OffHandWeaponFuture
ObjectReference myFollowerAMarker_BigWeaponFuture
ObjectReference myFollowerAMarker_BowFuture
ObjectReference myFollowerAMarker_ShieldFuture
ObjectReference myFollowerBMarker_MainWeaponFuture
ObjectReference myFollowerBMarker_OffHandWeaponFuture
ObjectReference myFollowerBMarker_BigWeaponFuture
ObjectReference myFollowerBMarker_BowFuture
ObjectReference myFollowerBMarker_ShieldFuture
ObjectReference myFollowerCMarker_MainWeaponFuture
ObjectReference myFollowerCMarker_OffHandWeaponFuture
ObjectReference myFollowerCMarker_BigWeaponFuture
ObjectReference myFollowerCMarker_BowFuture
ObjectReference myFollowerCMarker_ShieldFuture
ObjectReference myClutterStatic1Future
ObjectReference myClutterStatic2Future
ObjectReference myClutterStatic3Future
ObjectReference myClutterStatic4Future
ObjectReference myClutterStatic5Future
ObjectReference myClutterActivator1Future
ObjectReference myClutterActivator2Future
ObjectReference myClutterActivator3Future
ObjectReference myClutterActivator4Future
ObjectReference myClutterActivator5Future
ObjectReference myClutterFurniture1Future
ObjectReference myClutterFurniture2Future
ObjectReference myClutterFurniture3Future
ObjectReference myClutterFurniture4Future
ObjectReference myClutterFurniture5Future
ObjectReference myPlayerSitMarkerFuture
ObjectReference myPlayerLayDownMarkerFuture
ObjectReference myExitFrontFuture
ObjectReference myBedRollFuture
ObjectReference mySpareBedRoll1Future
ObjectReference mySpareBedRoll2Future
ObjectReference mySpareBedRoll3Future
ObjectReference myWardFuture

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

bool initialized = false
bool property bLanternLit = false auto hidden
bool property bGettingUp = false auto hidden

Quest property CampfireObjectPlacementSystem auto

Event OnInit()
	while !self.Is3DLoaded()
	endWhile
	;We need to get out of OnInit() quickly, so member functions on this object can be called.
	RegisterForSingleUpdate(0.1)
endEvent

function Initialize()
	RotateOnStartUp()
	;CreatePositionArrays()
	StartObjectProfiling()
	debug.StartScriptProfiling("CampTent")
	myOriginAng = GetAngleData(self)
	;SetRelativePositions()
	;Placement()
	PlacementAsync()
	GetResultsWaitAll()
	StopObjectProfiling()
	debug.StopScriptProfiling("CampTent")
	;@TODO: Remove
	GenerateDebugReport()
	initialized = true
endFunction

Event OnUpdate()
	if !initialized
		Initialize()
		return
	endif
	UpdateTentUseState(self)
endEvent

Event OnActivate(ObjectReference akActionRef)
	ActivateTent(akActionRef, self)
endEvent

function PlacementAsync()
	CampTentEx Extended = self as CampTentEx
	if TentAsset_ShelterModel && PositionRef_Shelter
		PlaceTentObjectThreaded_Tent()
	endif
	if TentAsset_ShelterModelExterior && PositionRef_Shelter
		;PlaceTentObjectThreaded_NormalTent()
	endif
	if TentAsset_ShelterModelMaterialSnow && PositionRef_Shelter
		;PlaceTentObjectThreaded_SnowTent()
	endif
	if TentAsset_ShelterModelMaterialAsh && PositionRef_Shelter
		;PlaceTentObjectThreaded_AshTent()
	endif
	;TentSystem.ApplySnow(self)
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

function GetResultsWaitAll()
	
	While (myTent as _Camp_ObjectPlacementSystem)
		myTent = (myTent as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myTent)
	endWhile
	While (myClutterStatic1 as _Camp_ObjectPlacementSystem)
		myClutterStatic1 = (myClutterStatic1 as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myClutterStatic1)
	endWhile
	While (myPlayerMarker_MainWeapon as _Camp_ObjectPlacementSystem)
		myPlayerMarker_MainWeapon = (myPlayerMarker_MainWeapon as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_MainWeapon)
	endWhile
	While (myPlayerMarker_OffHandWeapon as _Camp_ObjectPlacementSystem)
		myPlayerMarker_OffHandWeapon = (myPlayerMarker_OffHandWeapon as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_OffHandWeapon)
	endWhile
	While (myPlayerMarker_BigWeapon as _Camp_ObjectPlacementSystem)
		myPlayerMarker_BigWeapon = (myPlayerMarker_BigWeapon as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_BigWeapon)
	endWhile
	While (myPlayerMarker_Bow as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Bow = (myPlayerMarker_Bow as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_Bow)
	endWhile
	While (myPlayerMarker_Shield as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Shield = (myPlayerMarker_Shield as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_Shield)
	endWhile
	While (myPlayerMarker_Cuirass as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Cuirass = (myPlayerMarker_Cuirass as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_Cuirass)
	endWhile
	While (myPlayerMarker_Helm as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Helm = (myPlayerMarker_Helm as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_Helm)
	endWhile
	While (myPlayerMarker_Boots as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Boots = (myPlayerMarker_Boots as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_Boots)
	endWhile
	While (myPlayerMarker_Gauntlets as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Gauntlets = (myPlayerMarker_Gauntlets as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_Gauntlets)
	endWhile
	While (myPlayerMarker_Backpack as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Backpack = (myPlayerMarker_Backpack as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_Backpack)
	endWhile
	While (myPlayerMarker_ShieldInterior as _Camp_ObjectPlacementSystem)
		myPlayerMarker_ShieldInterior = (myPlayerMarker_ShieldInterior as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerMarker_ShieldInterior)
	endWhile
	While (myPlayerSitMarker as _Camp_ObjectPlacementSystem)
		myPlayerSitMarker = (myPlayerSitMarker as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerSitMarker)
	endWhile
	While (myPlayerLayDownMarker as _Camp_ObjectPlacementSystem)
		myPlayerLayDownMarker = (myPlayerLayDownMarker as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myPlayerLayDownMarker)
	endWhile
	While (myExitFront as _Camp_ObjectPlacementSystem)
		myExitFront = (myExitFront as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myExitFront)
	endWhile
	While (myBedRoll as _Camp_ObjectPlacementSystem)
		myBedRoll = (myBedRoll as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myBedRoll)
	endWhile
	While (myWard as _Camp_ObjectPlacementSystem)
		myWard = (myWard as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myWard)
	endWhile
	While (myLanternUnlit as _Camp_ObjectPlacementSystem)
		myLanternUnlit = (myLanternUnlit as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myLanternUnlit)
	endWhile
	While (myLanternLit as _Camp_ObjectPlacementSystem)
		myLanternLit = (myLanternLit as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myLanternLit)
	endWhile
	While (myLanternLight as _Camp_ObjectPlacementSystem)
		myLanternLight = (myLanternLight as _Camp_ObjectPlacementSystem).get_result_async()
		debug.trace("[Campfire] @@@@@@@@@@ Result " + myLanternLight)
	endWhile
endFunction

function GetResults()
	;debug.trace("[Campfire] Gathering results...")
	if (myTent as _Camp_ObjectPlacementSystem)
		myTent = (myTent as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myClutterStatic1 as _Camp_ObjectPlacementSystem)
		myClutterStatic1 = (myClutterStatic1 as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_MainWeapon as _Camp_ObjectPlacementSystem)
		myPlayerMarker_MainWeapon = (myPlayerMarker_MainWeapon as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_OffHandWeapon as _Camp_ObjectPlacementSystem)
		myPlayerMarker_OffHandWeapon = (myPlayerMarker_OffHandWeapon as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_BigWeapon as _Camp_ObjectPlacementSystem)
		myPlayerMarker_BigWeapon = (myPlayerMarker_BigWeapon as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_Bow as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Bow = (myPlayerMarker_Bow as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_Shield as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Shield = (myPlayerMarker_Shield as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_Cuirass as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Cuirass = (myPlayerMarker_Cuirass as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_Helm as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Helm = (myPlayerMarker_Helm as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_Boots as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Boots = (myPlayerMarker_Boots as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_Gauntlets as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Gauntlets = (myPlayerMarker_Gauntlets as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_Backpack as _Camp_ObjectPlacementSystem)
		myPlayerMarker_Backpack = (myPlayerMarker_Backpack as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerMarker_ShieldInterior as _Camp_ObjectPlacementSystem)
		myPlayerMarker_ShieldInterior = (myPlayerMarker_ShieldInterior as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerSitMarker as _Camp_ObjectPlacementSystem)
		myPlayerSitMarker = (myPlayerSitMarker as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myPlayerLayDownMarker as _Camp_ObjectPlacementSystem)
		myPlayerLayDownMarker = (myPlayerLayDownMarker as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myExitFront as _Camp_ObjectPlacementSystem)
		myExitFront = (myExitFront as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myBedRoll as _Camp_ObjectPlacementSystem)
		myBedRoll = (myBedRoll as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myWard as _Camp_ObjectPlacementSystem)
		myWard = (myWard as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myLanternUnlit as _Camp_ObjectPlacementSystem)
		myLanternUnlit = (myLanternUnlit as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myLanternLit as _Camp_ObjectPlacementSystem)
		myLanternLit = (myLanternLit as _Camp_ObjectPlacementSystem).get_result_async()
	endif
	if (myLanternLight as _Camp_ObjectPlacementSystem)
		myLanternLight = (myLanternLight as _Camp_ObjectPlacementSystem).get_result_async()
	endif

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
	endWhile
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
	endWhile/;
endFunction

function TearDown()
	TryToDisableAndDeleteRef(myPlayerMarker_MainWeapon as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_OffHandWeapon as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_BigWeapon as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_Bow as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_Cuirass as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_Helm as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_Boots as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_Gauntlets as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_Backpack as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_Shield as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerMarker_ShieldInterior as ObjectReference)
	TryToDisableAndDeleteRef(myClutterStatic1 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterStatic2 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterStatic3 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterStatic4 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterStatic5 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterActivator1 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterActivator2 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterActivator3 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterActivator4 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterActivator5 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterFurniture1 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterFurniture2 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterFurniture3 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterFurniture4 as ObjectReference)
	TryToDisableAndDeleteRef(myClutterFurniture5 as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerSitMarker as ObjectReference)
	TryToDisableAndDeleteRef(myPlayerLayDownMarker as ObjectReference)
	TryToDisableAndDeleteRef(myExitFront as ObjectReference)
	TryToDisableAndDeleteRef(myBedRoll as ObjectReference)
	TryToDisableAndDeleteRef(myWard as ObjectReference)
	TryToDisableAndDeleteRef(myLanternLit as ObjectReference)
	TryToDisableAndDeleteRef(myLanternUnlit as ObjectReference)
	TryToDisableAndDeleteRef(myLanternLight as ObjectReference)
	TryToDisableAndDeleteRef(myLanternLit2 as ObjectReference)
	TryToDisableAndDeleteRef(myLanternUnlit2 as ObjectReference)
	TryToDisableAndDeleteRef(myLanternLight2 as ObjectReference)
	TryToDisableAndDeleteRef(myLanternLit3 as ObjectReference)
	TryToDisableAndDeleteRef(myLanternUnlit3 as ObjectReference)
	TryToDisableAndDeleteRef(myLanternLight3 as ObjectReference)
	TryToDisableAndDeleteRef(mySpareBedRoll1 as ObjectReference)
	TryToDisableAndDeleteRef(mySpareBedRoll2 as ObjectReference)
	TryToDisableAndDeleteRef(mySpareBedRoll3 as ObjectReference)
	TryToDisableAndDeleteRef(mySnowTent as ObjectReference)
	TryToDisableAndDeleteRef(myAshTent as ObjectReference)
	TryToDisableAndDeleteRef(myNormalTent as ObjectReference)
	TryToDisableAndDeleteRef(myTent as ObjectReference)
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

ObjectReference function PlaceTentObjectAsync(ObjectReference object_position_reference, ObjectReference origin, Form form_to_place, float[] origin_angle,\
							  float x_local_ang_adjust = 0.0, float y_local_ang_adjust = 0.0, float z_local_ang_adjust = 0.0, \
							  float z_global_ang_adjust = 0.0, float z_hanging_offset = 0.0, bool inverted_local_y = false, \
							  bool initially_disabled = false, bool is_propped = false, bool is_hanging = false)

	
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

	ObjectReference future
	while !future
		if !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread01).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread01).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread02).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread02).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread03).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread03).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread04).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread04).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread05).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread05).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread06).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread06).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread07).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread07).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread08).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread08).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread09).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread09).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread10).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread10).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread11).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread11).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread12).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread12).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread13).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread13).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread14).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread14).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread15).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread15).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread16).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread16).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread17).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread17).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread18).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread18).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread19).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread19).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread20).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread20).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread21).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread21).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread22).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread22).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread23).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread23).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread24).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread24).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread25).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread25).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread26).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread26).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread27).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread27).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread28).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread28).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread29).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread29).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread30).queued()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread30).get_async(myCenterObject, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		else
			;Threads are full; wait and try again.
			;@TODO: Add timeout
			utility.wait(0.1)
		endif
	endWhile

	return future
endFunction

function PlaceTentObjectThreaded_Tent()
	myTent = PlaceTentObjectAsync(PositionRef_Shelter, self, TentAsset_ShelterModel, myOriginAng)
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
	myClutterStatic1 = PlaceTentObjectAsync(PositionRef_ClutterStatic1, self, TentAsset_ClutterStatic1, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterStatic2()
	myClutterStatic2 = PlaceTentObjectAsync(PositionRef_ClutterStatic2, self, TentAsset_ClutterStatic2, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterStatic3()
	myClutterStatic3 = PlaceTentObjectAsync(PositionRef_ClutterStatic3, self, TentAsset_ClutterStatic3, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterStatic4()
	myClutterStatic4 = PlaceTentObjectAsync(PositionRef_ClutterStatic4, self, TentAsset_ClutterStatic4, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterStatic5()
	myClutterStatic5 = PlaceTentObjectAsync(PositionRef_ClutterStatic5, self, TentAsset_ClutterStatic5, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator1(CampTentEx Extended)
	; , self, Extended.TentAsset_ClutterActivator1, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator2(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator2, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator3(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator3, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator4(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator4, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterActivator5(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator5, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture1(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture1, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture2(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture2, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture3(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture3, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture4(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture4, myOriginAng)
endFunction

function PlaceTentObjectThreaded_ClutterFurniture5(CampTentEx Extended)
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture5, myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerMainWeapon()
	myPlayerMarker_MainWeapon = PlaceTentObjectAsync(PositionRef_Player_WeaponMainHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerOffHandWeapon()
	myPlayerMarker_OffHandWeapon = PlaceTentObjectAsync(PositionRef_Player_WeaponOffHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerBigWeapon()
	myPlayerMarker_BigWeapon = PlaceTentObjectAsync(PositionRef_Player_WeaponTwoHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerBow()
	myPlayerMarker_Bow = PlaceTentObjectAsync(PositionRef_Player_WeaponBow, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerShield()
	myPlayerMarker_Shield = PlaceTentObjectAsync(PositionRef_Player_Shield, self, TentSystem.GetXMarker(), myOriginAng, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true)
endFunction

function PlaceTentObjectThreaded_PlayerCuirass()
	myPlayerMarker_Cuirass= PlaceTentObjectAsync(PositionRef_Player_ArmorCuirass, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerHelm()
	myPlayerMarker_Helm = PlaceTentObjectAsync(PositionRef_Player_ArmorHelm, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerBoots()
	myPlayerMarker_Boots = PlaceTentObjectAsync(PositionRef_Player_ArmorBoots, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerGauntlets()
	myPlayerMarker_Gauntlets = PlaceTentObjectAsync(PositionRef_Player_ArmorGauntlets, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerBackpack()
	myPlayerMarker_Backpack = PlaceTentObjectAsync(PositionRef_Player_Backpack, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerShieldInterior()
	myPlayerMarker_ShieldInterior = PlaceTentObjectAsync(PositionRef_Player_ShieldInterior, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerSitMarker()
	myPlayerSitMarker = PlaceTentObjectAsync(RequiredPositionRef_SitFurniture, self, TentSystem.GetSitMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_PlayerLayDownMarker()
	myPlayerLayDownMarker = PlaceTentObjectAsync(RequiredPositionRef_LieDownFurniture, self, TentSystem.GetLieDownMarker(), myOriginAng, z_local_ang_adjust = 180.0)
endFunction

function PlaceTentObjectThreaded_ExitFront()
	myExitFront = PlaceTentObjectAsync(PositionRef_FrontExitMarker, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_BedRoll()
	myBedRoll = PlaceTentObjectAsync(RequiredPositionRef_PlayerBed, self, TentSystem.GetPlayerBedroll(), myOriginAng)
endFunction

function PlaceTentObjectThreaded_Ward()
	myWard = PlaceTentObjectAsync(PositionRef_Ward, self, TentSystem.GetWard(), myOriginAng, x_local_ang_adjust = -90.0, is_propped = true)
endFunction

function PlaceTentObjectThreaded_Lantern1()
	myLanternUnlit = PlaceTentObjectAsync(PositionRef_Lantern1, self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng)
	myLanternLit = PlaceTentObjectAsync(PositionRef_Lantern1, self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, initially_disabled = true)
	myLanternLight = PlaceTentObjectAsync(PositionRef_Lantern1, self, TentSystem.GetLanternLight(), myOriginAng, initially_disabled = true)
endFunction

function PlaceTentObjectThreaded_Lantern2()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng)
	;myLanternLit2 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit2_Pos, abInitiallyDisabled = true)
	;myLanternLight2 = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight2_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObjectThreaded_Lantern3()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng, myLanternUnlit3_Pos)
	;myLanternLit3 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit3_Pos, abInitiallyDisabled = true)
	;myLanternLight3 = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight3_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObjectThreaded_SpareBedRoll1()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll1_Pos)
endFunction

function PlaceTentObjectThreaded_SpareBedRoll2()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll2_Pos)
endFunction

function PlaceTentObjectThreaded_SpareBedRoll3()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll3_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1MainWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_MainWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1OffHandWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1BigWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_BigWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1Bow()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_Bow_Pos)
endFunction

function PlaceTentObjectThreaded_Follower1Shield()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObjectThreaded_Follower2MainWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_MainWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower2OffHandWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower2BigWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_BigWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower2Bow()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_Bow_Pos)
endFunction

function PlaceTentObjectThreaded_Follower2Shield()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObjectThreaded_Follower3MainWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_MainWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower3OffHandWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower3BigWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_BigWeapon_Pos)
endFunction

function PlaceTentObjectThreaded_Follower3Bow()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_Bow_Pos)
endFunction

function PlaceTentObjectThreaded_Follower3Shield()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction