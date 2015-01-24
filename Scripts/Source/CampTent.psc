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
ObjectReference center_object
bool property bLanternLit = false auto hidden
bool property bGettingUp = false auto hidden

Quest property CampfireObjectPlacementSystem auto
_Camp_ObjectPlacementThreadManager ObjectPlacementSystem

Event OnInit()
	while !self.Is3DLoaded()
	endWhile
	;We need to get out of OnInit() quickly, so member functions on this object can be called.
	RegisterForSingleUpdate(0.1)
endEvent

Event OnUpdate()
	if !initialized
		Initialize()
		return
	endif
	UpdateTentUseState(self)
endEvent

function Initialize()
	ObjectPlacementSystem = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThreadManager
	RotateOnStartUp()
	;CreatePositionArrays()
	StartObjectProfiling()
	debug.StartScriptProfiling("CampTent")
	myOriginAng = GetAngleData(self)
	;SetRelativePositions()
	;Placement()
	PlacementAsync()
	GetResults()
	StopObjectProfiling()
	debug.StopScriptProfiling("CampTent")
	;@TODO: Remove
	GenerateDebugReport()
	initialized = true
endFunction

Event OnActivate(ObjectReference akActionRef)
	ActivateTent(akActionRef, self)
endEvent

function PlacementAsync()
	CampTentEx Extended = self as CampTentEx

	if PositionRef_CenterObjectOverride
		center_object = PositionRef_CenterObjectOverride
	else
		if PositionRef_Shelter
			center_object = PositionRef_Shelter
		else
			center_object = RequiredPositionRef_PlayerBed
		endif
	endif

	if TentAsset_ShelterModel && PositionRef_Shelter
		PlaceTentObject_Tent()
	endif
	if TentAsset_ShelterModelExterior && PositionRef_Shelter
		;PlaceTentObject_NormalTent()
	endif
	if TentAsset_ShelterModelMaterialSnow && PositionRef_Shelter
		;PlaceTentObject_SnowTent()
	endif
	if TentAsset_ShelterModelMaterialAsh && PositionRef_Shelter
		;PlaceTentObject_AshTent()
	endif
	;TentSystem.ApplySnow(self)
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
	ObjectPlacementSystem.wait_all()

	;if self.GetDistance(myBedRoll) > 20.0
	;	self.MoveTo(myBedRoll)
	;endif
endFunction

function GetResults()
	;debug.trace("[Campfire] Gathering results...")
	
	if myTentFuture
		myTent = GetFuture(myTentFuture).get_result()
	endif
	;Other tent exteriors
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
	endif
	if myBedRollFuture
		myBedRoll = GetFuture(myBedRollFuture).get_result()
	endif
	if myWardFuture
		myWard = GetFuture(myWardFuture).get_result()
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


function PlaceTentObject_Tent()
	myTentFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Shelter, self, TentAsset_ShelterModel, myOriginAng)
endFunction

function PlaceTentObject_NormalTent()
	;FuturemyNormalTent = myTent.PlaceAtMe(TentAsset_ShelterModelExterior, abInitiallyDisabled = true)	
endFunction

function PlaceTentObject_SnowTent()
	;FuturemySnowTent = myTent.PlaceAtMe(TentAsset_ShelterModelMaterialSnow, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_AshTent()
	;FuturemyAshTent = myTent.PlaceAtMe(TentAsset_ShelterModelMaterialAsh, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_ClutterStatic1()
	myClutterStatic1Future = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_ClutterStatic1, self, TentAsset_ClutterStatic1, myOriginAng)
endFunction

function PlaceTentObject_ClutterStatic2()
	myClutterStatic2Future = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_ClutterStatic2, self, TentAsset_ClutterStatic2, myOriginAng)
endFunction

function PlaceTentObject_ClutterStatic3()
	myClutterStatic3Future = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_ClutterStatic3, self, TentAsset_ClutterStatic3, myOriginAng)
endFunction

function PlaceTentObject_ClutterStatic4()
	myClutterStatic4Future = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_ClutterStatic4, self, TentAsset_ClutterStatic4, myOriginAng)
endFunction

function PlaceTentObject_ClutterStatic5()
	myClutterStatic5Future = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_ClutterStatic5, self, TentAsset_ClutterStatic5, myOriginAng)
endFunction

function PlaceTentObject_ClutterActivator1(CampTentEx Extended)
	;Future , self, Extended.TentAsset_ClutterActivator1, myOriginAng)
endFunction

function PlaceTentObject_ClutterActivator2(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator2, myOriginAng)
endFunction

function PlaceTentObject_ClutterActivator3(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator3, myOriginAng)
endFunction

function PlaceTentObject_ClutterActivator4(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator4, myOriginAng)
endFunction

function PlaceTentObject_ClutterActivator5(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterActivator5, myOriginAng)
endFunction

function PlaceTentObject_ClutterFurniture1(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture1, myOriginAng)
endFunction

function PlaceTentObject_ClutterFurniture2(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture2, myOriginAng)
endFunction

function PlaceTentObject_ClutterFurniture3(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture3, myOriginAng)
endFunction

function PlaceTentObject_ClutterFurniture4(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture4, myOriginAng)
endFunction

function PlaceTentObject_ClutterFurniture5(CampTentEx Extended)
	;;(FutureCampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, Extended.TentAsset_ClutterFurniture5, myOriginAng)
endFunction

function PlaceTentObject_PlayerMainWeapon()
	myPlayerMarker_MainWeaponFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_WeaponMainHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerOffHandWeapon()
	myPlayerMarker_OffHandWeaponFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_WeaponOffHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerBigWeapon()
	myPlayerMarker_BigWeaponFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_WeaponTwoHand, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerBow()
	myPlayerMarker_BowFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_WeaponBow, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerShield()
	myPlayerMarker_ShieldFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_Shield, self, TentSystem.GetXMarker(), myOriginAng, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true)
endFunction

function PlaceTentObject_PlayerCuirass()
	myPlayerMarker_CuirassFuture= ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_ArmorCuirass, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerHelm()
	myPlayerMarker_HelmFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_ArmorHelm, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerBoots()
	myPlayerMarker_BootsFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_ArmorBoots, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerGauntlets()
	myPlayerMarker_GauntletsFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_ArmorGauntlets, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerBackpack()
	myPlayerMarker_BackpackFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_Backpack, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerShieldInterior()
	myPlayerMarker_ShieldInteriorFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Player_ShieldInterior, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerSitMarker()
	myPlayerSitMarkerFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, RequiredPositionRef_SitFurniture, self, TentSystem.GetSitMarker(), myOriginAng)
endFunction

function PlaceTentObject_PlayerLayDownMarker()
	myPlayerLayDownMarkerFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, RequiredPositionRef_LieDownFurniture, self, TentSystem.GetLieDownMarker(), myOriginAng, z_local_ang_adjust = 180.0)
endFunction

function PlaceTentObject_ExitFront()
	myExitFrontFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_FrontExitMarker, self, TentSystem.GetXMarker(), myOriginAng)
endFunction

function PlaceTentObject_BedRoll()
	myBedRollFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, RequiredPositionRef_PlayerBed, self, TentSystem.GetPlayerBedroll(), myOriginAng)
endFunction

function PlaceTentObject_Ward()
	myWardFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Ward, self, TentSystem.GetWard(), myOriginAng, x_local_ang_adjust = -90.0, is_propped = true)
endFunction

function PlaceTentObject_Lantern1()
	myLanternUnlitFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Lantern1, self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng)
	myLanternLitFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Lantern1, self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, initially_disabled = true)
	myLanternLightFuture = ObjectPlacementSystem.PlaceTentObjectAsync(center_object, PositionRef_Lantern1, self, TentSystem.GetLanternLight(), myOriginAng, initially_disabled = true)
endFunction

function PlaceTentObject_Lantern2()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng)
	;myLanternLit2 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit2_Pos, abInitiallyDisabled = true)
	;myLanternLight2 = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight2_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_Lantern3()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetLantern(bOn = false, bHanging = false), myOriginAng, myLanternUnlit3_Pos)
	;myLanternLit3 = PlaceAtMeRelative(self, TentSystem.GetLantern(bOn = true, bHanging = false), myOriginAng, myLanternLit3_Pos, abInitiallyDisabled = true)
	;myLanternLight3 = PlaceAtMeRelative(self, TentSystem.GetLanternLight(), myOriginAng, myLanternLight3_Pos, abInitiallyDisabled = true)
endFunction

function PlaceTentObject_SpareBedRoll1()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll1_Pos)
endFunction

function PlaceTentObject_SpareBedRoll2()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll2_Pos)
endFunction

function PlaceTentObject_SpareBedRoll3()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetNPCBedroll(), myOriginAng, mySpareBedRoll3_Pos)
endFunction

function PlaceTentObject_Follower1MainWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_MainWeapon_Pos)
endFunction

function PlaceTentObject_Follower1OffHandWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObject_Follower1BigWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_BigWeapon_Pos)
endFunction

function PlaceTentObject_Follower1Bow()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_Bow_Pos)
endFunction

function PlaceTentObject_Follower1Shield()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerAMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObject_Follower2MainWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_MainWeapon_Pos)
endFunction

function PlaceTentObject_Follower2OffHandWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObject_Follower2BigWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_BigWeapon_Pos)
endFunction

function PlaceTentObject_Follower2Bow()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_Bow_Pos)
endFunction

function PlaceTentObject_Follower2Shield()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerBMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction

function PlaceTentObject_Follower3MainWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_MainWeapon_Pos)
endFunction

function PlaceTentObject_Follower3OffHandWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_OffHandWeapon_Pos)
endFunction

function PlaceTentObject_Follower3BigWeapon()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_BigWeapon_Pos)
endFunction

function PlaceTentObject_Follower3Bow()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_Bow_Pos)
endFunction

function PlaceTentObject_Follower3Shield()
	;;(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread).queue_placement(PositionRef_Shelter, , self, TentSystem.GetXMarker(), myOriginAng, myFollowerCMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
endFunction