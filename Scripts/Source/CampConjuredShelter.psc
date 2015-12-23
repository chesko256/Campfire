scriptname CampConjuredShelter extends CampTentEx

import _CampInternal
import CampUtil
import TentSystem

Static property TentAsset_SphereModel auto
{ DESCRIPTION: Optional: The tent static object. }

Static property TentAsset_BaseStatic1 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic2 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic3 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic4 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic5 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic6 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic7 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_ClutterStatic6 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

Static property TentAsset_ClutterStatic7 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

MiscObject property TentAsset_ClutterMisc1 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property TentAsset_ClutterMisc2 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property TentAsset_ClutterMisc3 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property TentAsset_ClutterMisc4 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property TentAsset_ClutterMisc5 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property TentAsset_ClutterMisc6 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property TentAsset_ClutterMisc7 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

Furniture property TentAsset_ClutterFurniture6 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Furniture property TentAsset_ClutterFurniture7 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

ObjectReference property PositionRef_Sphere auto
{ DESCRIPTION: Optional: The shelter (tent, structure) position reference. }

ObjectReference property PositionRef_BaseStatic1 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic2 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic3 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic4 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic5 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic6 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic7 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_ClutterStatic6 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterStatic7 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc1 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc2 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc3 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc4 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc5 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc6 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc7 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture6 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture7 auto
{ DESCRIPTION: Optional: Clutter position reference. }

; PRIVATE
;Run-time objects
ObjectReference property mySphere auto hidden


;Futures
ObjectReference property mySphereFuture auto hidden


;Misc
EffectShader property ShockDisintegrate01FXS auto
VisualEffect property MGTeleportInEffect auto
Activator property SummonTargetFXActivator auto

float property ShelterID auto hidden
int property mySoundID auto hidden

;/
;@Override _Camp_PlaceableObjectBase
function PlaceObjects()
	 ; Cache shared resources locally
	XMarker = Game.GetFormFromFile(0x0000003B, "Skyrim.esm") as Static
	DogLayingDownIdleMarker = Game.GetFormFromFile(0x0010F801, "Skyrim.esm")
	_Camp_Bedroll_ActualF = Game.GetFormFromFile(0x02007EFA, "Campfire.esm") as Furniture 
	_Camp_Bedroll_NPC_F = Game.GetFormFromFile(0x02038CBF, "Campfire.esm") as Furniture
	_Camp_Bedroll_SpouseF = Game.GetFormFromFile(0x0203900D, "Campfire.esm") as Furniture
	_Camp_TentLayDownMarker = Game.GetFormFromFile(0x02036587, "Campfire.esm") as Furniture
	_Camp_TentSitMarker = Game.GetFormFromFile(0x02036586, "Campfire.esm") as Furniture
	_Camp_TentSitMarkerSandbox = Game.GetFormFromFile(0x0203232B, "Campfire.esm") as Furniture

	if PositionRef_CenterObjectOverride
		CenterObject = PositionRef_CenterObjectOverride
	else
		if PositionRef_Sphere
			CenterObject = PositionRef_Sphere
		else
			CenterObject = RequiredPositionRef_PlayerBed
		endif
	endif

	if TentAsset_SphereModel && PositionRef_Sphere
		PlaceObject_Sphere()
	endif
	if TentAsset_ShelterDestructionCollider && PositionRef_Sphere
		PlaceObject_ShelterCollider()
	endif
	if TentAsset_LargeTentTriggerVolume
		PlaceObject_LargeTentTriggerVolume()
	endif
	if TentAsset_BaseStatic1 && PositionRef_BaseStatic1
		PlaceObject_BaseStatic1()
	endif
	if TentAsset_BaseStatic2 && PositionRef_BaseStatic2
		PlaceObject_BaseStatic2()
	endif
	if TentAsset_BaseStatic3 && PositionRef_BaseStatic3
		PlaceObject_BaseStatic3()
	endif
	if TentAsset_BaseStatic4 && PositionRef_BaseStatic4
		PlaceObject_BaseStatic4()
	endif
	if TentAsset_BaseStatic5 && PositionRef_BaseStatic5
		PlaceObject_BaseStatic5()
	endif
	if TentAsset_BaseStatic6 && PositionRef_BaseStatic6
		PlaceObject_BaseStatic6()
	endif
	if TentAsset_BaseStatic7 && PositionRef_BaseStatic7
		PlaceObject_BaseStatic7()
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
	if TentAsset_ClutterStatic6 && PositionRef_ClutterStatic6
		PlaceObject_ClutterStatic6()
	endif
	if TentAsset_ClutterStatic7 && PositionRef_ClutterStatic7
		PlaceObject_ClutterStatic7()
	endif
	if TentAsset_ClutterMisc1 && PositionRef_ClutterMisc1
		PlaceObject_ClutterMisc1()
	endif
	if TentAsset_ClutterMisc2 && PositionRef_ClutterMisc2
		PlaceObject_ClutterMisc2()
	endif
	if TentAsset_ClutterMisc3 && PositionRef_ClutterMisc3
		PlaceObject_ClutterMisc3()
	endif
	if TentAsset_ClutterMisc4 && PositionRef_ClutterMisc4
		PlaceObject_ClutterMisc4()
	endif
	if TentAsset_ClutterMisc5 && PositionRef_ClutterMisc5
		PlaceObject_ClutterMisc5()
	endif
	if TentAsset_ClutterActivator1 && PositionRef_ClutterActivator1
		PlaceObject_ClutterActivator1()
	endif
	if TentAsset_ClutterActivator2 && PositionRef_ClutterActivator2
		PlaceObject_ClutterActivator2()
	endif
	if TentAsset_ClutterActivator3 && PositionRef_ClutterActivator3
		PlaceObject_ClutterActivator3()
	endif
	if TentAsset_ClutterFurniture1 && PositionRef_ClutterFurniture1
		PlaceObject_ClutterFurniture1()
	endif
	if TentAsset_ClutterFurniture2 && PositionRef_ClutterFurniture2
		PlaceObject_ClutterFurniture2()
	endif
	if TentAsset_ClutterFurniture3 && PositionRef_ClutterFurniture3
		PlaceObject_ClutterFurniture3()
	endif
	if TentAsset_ClutterFurniture4 && PositionRef_ClutterFurniture4
		PlaceObject_ClutterFurniture4()
	endif
	if TentAsset_ClutterFurniture5 && PositionRef_ClutterFurniture5
		PlaceObject_ClutterFurniture5()
	endif
	if TentAsset_ClutterFurniture6 && PositionRef_ClutterFurniture6
		PlaceObject_ClutterFurniture6()
	endif
	if TentAsset_ClutterFurniture7 && PositionRef_ClutterFurniture7
		PlaceObject_ClutterFurniture7()
	endif
	if PositionRef_Light1
		PlaceObject_Light1()
	endif
	if PositionRef_Light2
		PlaceObject_Light2()
	endif
	if PositionRef_Light3
		PlaceObject_Light3()
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
	
	if PositionRef_Follower1_WeaponMainHand
		PlaceObject_Follower1MainWeapon()
	endif
	if PositionRef_Follower1_WeaponOffHand
		PlaceObject_Follower1OffHandWeapon()
	endif
	if PositionRef_Follower1_WeaponTwoHand
		PlaceObject_Follower1BigWeapon()
	endif
	if PositionRef_Follower1_WeaponBow
		PlaceObject_Follower1Bow()
	endif
	if PositionRef_Follower1_Shield
		PlaceObject_Follower1Shield()
	endif
	if PositionRef_Follower2_WeaponMainHand
		PlaceObject_Follower2MainWeapon()
	endif
	if PositionRef_Follower2_WeaponOffHand
		PlaceObject_Follower2OffHandWeapon()
	endif
	if PositionRef_Follower2_WeaponTwoHand
		PlaceObject_Follower2BigWeapon()
	endif
	if PositionRef_Follower2_WeaponBow
		PlaceObject_Follower2Bow()
	endif
	if PositionRef_Follower2_Shield
		PlaceObject_Follower2Shield()
	endif
	if PositionRef_Follower3_WeaponMainHand
		PlaceObject_Follower3MainWeapon()
	endif
	if PositionRef_Follower3_WeaponOffHand
		PlaceObject_Follower3OffHandWeapon()
	endif
	if PositionRef_Follower3_WeaponTwoHand
		PlaceObject_Follower3BigWeapon()
	endif
	if PositionRef_Follower3_WeaponBow
		PlaceObject_Follower3Bow()
	endif
	if PositionRef_Follower3_Shield
		PlaceObject_Follower3Shield()
	endif
	PlaceObject_PlayerSitMarker()
	PlaceObject_PlayerLayDownMarker()
	PlaceObject_PlayerWithSpouseLayDownMarker()
	PlaceObject_SpouseLayDownMarker()
	if PositionRef_AnimalLayDownMarker
		PlaceObject_AnimalLayDownMarker()
	endif
	PlaceObject_BedRoll()
	
	if PositionRef_Follower1_Bed
		PlaceObject_SpareBedRoll1()
		PlaceObject_SpareBedRoll1SitMarker()
	endif
	if PositionRef_Follower2_Bed
		PlaceObject_SpareBedRoll2()
		PlaceObject_SpareBedRoll2SitMarker()
	endif
	if PositionRef_Follower3_Bed
		PlaceObject_SpareBedRoll3()
		PlaceObject_SpareBedRoll3SitMarker()
	endif
endFunction

;@Override _Camp_PlaceableObjectBase
function GetResults()
	if mySphereFuture
		mySphere = GetFuture(mySphereFuture).get_result()
		mySphereFuture = None
	endif
	if myShelterColliderFuture
		myShelterCollider = GetFuture(myShelterColliderFuture).get_result()
		if myShelterCollider
			(myShelterCollider as CampTentShelterCollider).ParentTent = self
		endif
		myShelterColliderFuture = None
	endif

	if myLargeTentTriggerVolumeFuture
		myLargeTentTriggerVolume = GetFuture(myLargeTentTriggerVolumeFuture).get_result()
		if myLargeTentTriggerVolume
			(myLargeTentTriggerVolume as CampLargeTentTriggerVolumeScript).ParentTent = self
		endif
		myLargeTentTriggerVolumeFuture = None
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
	if myLightUnlitFuture
		myLightUnlit = GetFuture(myLightUnlitFuture).get_result()
		myLightUnlitFuture = None
	endif
	if myLightLitFuture
		myLightLit = GetFuture(myLightLitFuture).get_result()
		myLightLitFuture = None
	endif
	if myLightLightFuture
		myLightLight = GetFuture(myLightLightFuture).get_result()
		myLightLightFuture = None
	endif
	if myLightUnlit2Future
		myLightUnlit2 = GetFuture(myLightUnlit2Future).get_result()
		myLightUnlit2Future = None
	endif
	if myLightLit2Future
		myLightLit2 = GetFuture(myLightLit2Future).get_result()
		myLightLit2Future = None
	endif
	if myLightLight2Future
		myLightLight2 = GetFuture(myLightLight2Future).get_result()
		myLightLight2Future = None
	endif
	if myLightUnlit3Future
		myLightUnlit3 = GetFuture(myLightUnlit3Future).get_result()
		myLightUnlit3Future = None
	endif
	if myLightLit3Future
		myLightLit3 = GetFuture(myLightLit3Future).get_result()
		myLightLit3Future = None
	endif
	if myLightLight3Future
		myLightLight3 = GetFuture(myLightLight3Future).get_result()
		myLightLight3Future = None
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
	if mySpareBedRoll1Future
		mySpareBedRoll1 = GetFuture(mySpareBedRoll1Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll1.SetScale(Setting_BedRollScale)
		endif
        mySpareBedRoll1SitMarker = GetFuture(mySpareBedRoll1SitMarkerFuture).get_result()
        mySpareBedRoll1SitMarkerFuture = None
        mySpareBedRoll1Future = None
	endif
	if mySpareBedRoll2Future
		mySpareBedRoll2 = GetFuture(mySpareBedRoll2Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll2.SetScale(Setting_BedRollScale)
		endif
        mySpareBedRoll2SitMarker = GetFuture(mySpareBedRoll2SitMarkerFuture).get_result()
        mySpareBedRoll2SitMarkerFuture = None
        mySpareBedRoll2Future = None
	endif
	if mySpareBedRoll3Future
		mySpareBedRoll3 = GetFuture(mySpareBedRoll3Future).get_result()
		if Setting_BedRollScale != 1.0
			mySpareBedRoll3.SetScale(Setting_BedRollScale)
		endif
        mySpareBedRoll3SitMarker = GetFuture(mySpareBedRoll3SitMarkerFuture).get_result()
        mySpareBedRoll3SitMarkerFuture = None
        mySpareBedRoll3Future = None
	endif

	if GetLogLevel() <= 1
		GenerateDebugReport()
	endif
endFunction

function TakeDown()
	SetCurrentTent(None)
	(self as _Camp_PlaceableObjectBase).TakeDown()

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

	; Destroy invisible objects (markers, etc)
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
	TryToDisableAndDeleteRef(myPlayerSitMarker)
	TryToDisableAndDeleteRef(myPlayerLayDownMarker)
	TryToDisableAndDeleteRef(myPlayerWithSpouseLayDownMarker)
	TryToDisableAndDeleteRef(mySpouseLayDownMarker)
	TryToDisableAndDeleteRef(myAnimalLayDownMarker)
	TryToDisableAndDeleteRef(mySpareBedRoll1SitMarker)
	TryToDisableAndDeleteRef(mySpareBedRoll2SitMarker)
	TryToDisableAndDeleteRef(mySpareBedRoll3SitMarker)
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

	; Warp out visible objects
	WarpOutRef(myBaseStatic1)
	WarpOutRef(myBaseStatic2)
	WarpOutRef(myBaseStatic3)
	WarpOutRef(myBaseStatic4)
	WarpOutRef(myBaseStatic5)
	WarpOutRef(myBaseStatic6)
	WarpOutRef(myBaseStatic7)
	WarpOutRef(myClutterStatic1)
	WarpOutRef(myClutterStatic2)
	WarpOutRef(myClutterStatic3)
	WarpOutRef(myClutterStatic4)
	WarpOutRef(myClutterStatic5)
	WarpOutRef(myClutterStatic6)
	WarpOutRef(myClutterStatic7)
	WarpOutRef(myClutterActivator1)
	WarpOutRef(myClutterActivator2)
	WarpOutRef(myClutterActivator3)
	WarpOutRef(myClutterFurniture1)
	WarpOutRef(myClutterFurniture2)
	WarpOutRef(myClutterFurniture3)
	WarpOutRef(myClutterFurniture4)
	WarpOutRef(myClutterFurniture5)
	WarpOutRef(myClutterFurniture6)
	WarpOutRef(myClutterFurniture7)
	WarpOutRef(myBedRoll)
	WarpOutRef(myLightLit)
	WarpOutRef(myLightUnlit)
	WarpOutRef(myLightLight)
	WarpOutRef(myLightLit2)
	WarpOutRef(myLightUnlit2)
	WarpOutRef(myLightLight2)
	WarpOutRef(myLightLit3)
	WarpOutRef(myLightUnlit3)
	WarpOutRef(myLightLight3)
	WarpOutRef(mySpareBedRoll1)
	WarpOutRef(mySpareBedRoll2)
	WarpOutRef(mySpareBedRoll3)

	Utility.Wait(1.2)

	; Remove references
	TryToDisableAndDeleteRef(myBaseStatic1)
	TryToDisableAndDeleteRef(myBaseStatic2)
	TryToDisableAndDeleteRef(myBaseStatic3)
	TryToDisableAndDeleteRef(myBaseStatic4)
	TryToDisableAndDeleteRef(myBaseStatic5)
	TryToDisableAndDeleteRef(myBaseStatic6)
	TryToDisableAndDeleteRef(myBaseStatic7)
	TryToDisableAndDeleteRef(myClutterMisc1)
	TryToDisableAndDeleteRef(myClutterMisc2)
	TryToDisableAndDeleteRef(myClutterMisc3)
	TryToDisableAndDeleteRef(myClutterMisc4)
	TryToDisableAndDeleteRef(myClutterMisc5)
	TryToDisableAndDeleteRef(myClutterMisc6)
	TryToDisableAndDeleteRef(myClutterMisc7)
	TryToDisableAndDeleteRef(myClutterStatic1)
	TryToDisableAndDeleteRef(myClutterStatic2)
	TryToDisableAndDeleteRef(myClutterStatic3)
	TryToDisableAndDeleteRef(myClutterStatic4)
	TryToDisableAndDeleteRef(myClutterStatic5)
	TryToDisableAndDeleteRef(myClutterStatic6)
	TryToDisableAndDeleteRef(myClutterStatic7)
	TryToDisableAndDeleteRef(myClutterActivator1)
	TryToDisableAndDeleteRef(myClutterActivator2)
	TryToDisableAndDeleteRef(myClutterActivator3)
	TryToDisableAndDeleteRef(myClutterFurniture1)
	TryToDisableAndDeleteRef(myClutterFurniture2)
	TryToDisableAndDeleteRef(myClutterFurniture3)
	TryToDisableAndDeleteRef(myClutterFurniture4)
	TryToDisableAndDeleteRef(myClutterFurniture5)
	TryToDisableAndDeleteRef(myClutterFurniture6)
	TryToDisableAndDeleteRef(myClutterFurniture7)
	TryToDisableAndDeleteRef(myBedRoll)
	TryToDisableAndDeleteRef(myLightLit)
	TryToDisableAndDeleteRef(myLightUnlit)
	TryToDisableAndDeleteRef(myLightLight)
	TryToDisableAndDeleteRef(myLightLit2)
	TryToDisableAndDeleteRef(myLightUnlit2)
	TryToDisableAndDeleteRef(myLightLight2)
	TryToDisableAndDeleteRef(myLightLit3)
	TryToDisableAndDeleteRef(myLightUnlit3)
	TryToDisableAndDeleteRef(myLightLight3)
	TryToDisableAndDeleteRef(mySpareBedRoll1)
	TryToDisableAndDeleteRef(mySpareBedRoll2)
	TryToDisableAndDeleteRef(mySpareBedRoll3)
	TryToDisableAndDeleteRef(mySphere)

	; Clear properties to ensure proper reference removal
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
	myClutterMisc1 = None
	myClutterMisc2 = None
	myClutterMisc3 = None
	myClutterMisc4 = None
	myClutterMisc5 = None
	myClutterMisc6 = None
	myClutterMisc7 = None
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
	myBedRoll = None
	myLightLit = None
	myLightUnlit = None
	myLightLight = None
	myLightLit2 = None
	myLightUnlit2 = None
	myLightLight2 = None
	myLightLit3 = None
	myLightUnlit3 = None
	myLightLight3 = None
	mySpareBedRoll1 = None
	mySpareBedRoll2 = None
	mySpareBedRoll3 = None
	mySpareBedRoll1SitMarker = None
	mySpareBedRoll2SitMarker = None
	mySpareBedRoll3SitMarker = None
	mySphere = None
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

function PlayWarpInEffect(ObjectReference akObject)
	if Is3DLoadedFinite(akObject)
		MGTeleportInEffect.Play(akObject, 3.0)
	endif
endFunction

function WarpOutRef(ObjectReference akObject)
	if akObject && Is3DLoadedFinite(akObject)
		ShockDisintegrate01FXS.Play(akObject)
		Utility.Wait(0.1)
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

function SummonSphere()
	if mySphere
		float mySphereScale = PositionRef_Sphere.GetScale()		
		mySphere.SetScale(mySphereScale / 10.0)
		mySphere.PlaceAtMe(SummonTargetFXActivator)
		mySphere.Enable()	
		mySphere.SetScale(mySphereScale / 9.0)
		mySphere.SetScale(mySphereScale / 8.0)
		mySphere.SetScale(mySphereScale / 7.0)
		mySphere.SetScale(mySphereScale / 6.0)
		mySphere.SetScale(mySphereScale / 5.0)
		mySphere.SetScale(mySphereScale / 4.0)
		mySphere.SetScale(mySphereScale / 3.0)
		mySphere.SetScale(mySphereScale / 2.0)
		mySphere.SetScale(mySphereScale / 1.8)
		mySphere.SetScale(mySphereScale / 1.6)
		mySphere.SetScale(mySphereScale / 1.4)
		mySphere.SetScale(mySphereScale / 1.2)
		mySphere.SetScale(mySphereScale)
		mySphere.SetScale(mySphereScale / 0.8)
		mySphere.SetScale(mySphereScale / 0.6)
		;Bounce the sphere effect
		float fDivisor = 0.61
		while fDivisor < 1.0
			mySphere.SetScale(mySphereScale / fDivisor)
			fDivisor += 0.01
		endWhile
	endif
endFunction

function DispelSphere()
	if mySphere
		;Suck in the sphere
		mySphere.PlaceAtMe(SummonTargetFXActivator)
		Utility.Wait(1.0)
		float mySphereScale = PositionRef_Sphere.GetScale()
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
endFunction

function GenerateDebugReport()
	CampDebug(1, "Placement complete. Placed object report:")
	CampDebug(1, "======================================================================")
	CampDebug(1, "**SELF**: " + self)
	CampDebug(1, "mySphere: " + mySphere)
	CampDebug(1, "myLargeTentTriggerVolume: " + myLargeTentTriggerVolume)
	CampDebug(1, "myLightLit: " + myLightLit)
	CampDebug(1, "myLightUnlit: " + myLightUnlit)
	CampDebug(1, "myLightLight: " + myLightLight)
	CampDebug(1, "myLightLit2: " + myLightLit2)
	CampDebug(1, "myLightUnlit2: " + myLightUnlit2)
	CampDebug(1, "myLightLight2: " + myLightLight2)
	CampDebug(1, "myLightLit3: " + myLightLit3)
	CampDebug(1, "myLightUnlit3: " + myLightUnlit3)
	CampDebug(1, "myLightLight3: " + myLightLight3)
	CampDebug(1, "myPlayerMarker_MainWeapon: " + myPlayerMarker_MainWeapon)
	CampDebug(1, "myPlayerMarker_OffHandWeapon: " + myPlayerMarker_OffHandWeapon)
	CampDebug(1, "myPlayerMarker_BigWeapon: " + myPlayerMarker_BigWeapon)
	CampDebug(1, "myPlayerMarker_Bow: " + myPlayerMarker_Bow)
	CampDebug(1, "myPlayerMarker_Helm: " + myPlayerMarker_Helm)
	CampDebug(1, "myPlayerMarker_Boots: " + myPlayerMarker_Boots)
	CampDebug(1, "myPlayerMarker_Gauntlets: " + myPlayerMarker_Gauntlets)
	CampDebug(1, "myPlayerMarker_Cuirass: " + myPlayerMarker_Cuirass)
	CampDebug(1, "myPlayerMarker_Backpack: " + myPlayerMarker_Backpack)
	CampDebug(1, "myPlayerMarker_Shield: " + myPlayerMarker_Shield)
	CampDebug(1, "myPlayerMarker_ShieldInterior: " + myPlayerMarker_ShieldInterior)
	CampDebug(1, "myFollowerAMarker_MainWeapon: " + myFollowerAMarker_MainWeapon)
	CampDebug(1, "myFollowerAMarker_OffHandWeapon: " + myFollowerAMarker_OffHandWeapon)
	CampDebug(1, "myFollowerAMarker_BigWeapon: " + myFollowerAMarker_BigWeapon)
	CampDebug(1, "myFollowerAMarker_Bow: " + myFollowerAMarker_Bow)
	CampDebug(1, "myFollowerAMarker_Shield: " + myFollowerAMarker_Shield)
	CampDebug(1, "myFollowerBMarker_MainWeapon: " + myFollowerBMarker_MainWeapon)
	CampDebug(1, "myFollowerBMarker_OffHandWeapon: " + myFollowerBMarker_OffHandWeapon)
	CampDebug(1, "myFollowerBMarker_BigWeapon: " + myFollowerBMarker_BigWeapon)
	CampDebug(1, "myFollowerBMarker_Bow: " + myFollowerBMarker_Bow)
	CampDebug(1, "myFollowerBMarker_Shield: " + myFollowerBMarker_Shield)
	CampDebug(1, "myFollowerCMarker_MainWeapon: " + myFollowerCMarker_MainWeapon)
	CampDebug(1, "myFollowerCMarker_OffHandWeapon: " + myFollowerCMarker_OffHandWeapon)
	CampDebug(1, "myFollowerCMarker_BigWeapon: " + myFollowerCMarker_BigWeapon)
	CampDebug(1, "myFollowerCMarker_Bow: " + myFollowerCMarker_Bow)
	CampDebug(1, "myFollowerCMarker_Shield: " + myFollowerCMarker_Shield)
	CampDebug(1, "myClutterStatic1: " + myClutterStatic1)
	CampDebug(1, "myClutterStatic2: " + myClutterStatic2)
	CampDebug(1, "myClutterStatic3: " + myClutterStatic3)
	CampDebug(1, "myClutterStatic4: " + myClutterStatic4)
	CampDebug(1, "myClutterStatic5: " + myClutterStatic5)
	CampDebug(1, "myClutterActivator1: " + myClutterActivator1)
	CampDebug(1, "myClutterActivator2: " + myClutterActivator2)
	CampDebug(1, "myClutterActivator3: " + myClutterActivator3)
	CampDebug(1, "myPlayerSitMarker: " + myPlayerSitMarker)
	CampDebug(1, "myPlayerLayDownMarker: " + myPlayerLayDownMarker)
	CampDebug(1, "mySpouseLayDownMarker: " + mySpouseLayDownMarker)
	CampDebug(1, "myPlayerWithSpouseLayDownMarker: " + myPlayerWithSpouseLayDownMarker)
	CampDebug(1, "myAnimalLayDownMarker: " + myAnimalLayDownMarker)
	CampDebug(1, "myBedRoll: " + myBedRoll)
	CampDebug(1, "mySpareBedRoll1: " + mySpareBedRoll1)
	CampDebug(1, "mySpareBedRoll2: " + mySpareBedRoll2)
	CampDebug(1, "mySpareBedRoll3: " + mySpareBedRoll3)
	CampDebug(1, "======================================================================")
endFunction

function PlaceObject_Sphere()
	mySphereFuture = PlacementSystem.PlaceObject(self, TentAsset_SphereModel, PositionRef_Sphere, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_ShelterCollider()
	myShelterColliderFuture = PlacementSystem.PlaceObject(self, TentAsset_ShelterDestructionCollider, PositionRef_Sphere, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_LargeTentTriggerVolume()
	myLargeTentTriggerVolumeFuture = PlacementSystem.PlaceObject(self, TentAsset_LargeTentTriggerVolume, PositionRef_Sphere, is_temp = is_temporary)
endFunction

function PlaceObject_BaseStatic1()
	myBaseStatic1Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic1, PositionRef_BaseStatic1, is_temp = is_temporary)
endFunction

function PlaceObject_BaseStatic2()
	myBaseStatic2Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic2, PositionRef_BaseStatic2, is_temp = is_temporary)
endFunction

function PlaceObject_BaseStatic3()
	myBaseStatic3Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic3, PositionRef_BaseStatic3, is_temp = is_temporary)
endFunction

function PlaceObject_BaseStatic4()
	myBaseStatic4Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic4, PositionRef_BaseStatic4, is_temp = is_temporary)
endFunction

function PlaceObject_BaseStatic5()
	myBaseStatic5Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic5, PositionRef_BaseStatic5, is_temp = is_temporary)
endFunction

function PlaceObject_BaseStatic6()
	myBaseStatic6Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic6, PositionRef_BaseStatic6, is_temp = is_temporary)
endFunction

function PlaceObject_BaseStatic7()
	myBaseStatic7Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic7, PositionRef_BaseStatic7, is_temp = is_temporary)
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

function PlaceObject_ClutterStatic6()
	myClutterStatic6Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic6, PositionRef_ClutterStatic6, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic7()
	myClutterStatic7Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic7, PositionRef_ClutterStatic7, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterMisc1()
	myClutterMisc1Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc1, PositionRef_ClutterMisc1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterMisc2()
	myClutterMisc2Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc2, PositionRef_ClutterMisc2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterMisc3()
	myClutterMisc3Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc3, PositionRef_ClutterMisc3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterMisc4()
	myClutterMisc4Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc4, PositionRef_ClutterMisc4, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterMisc5()
	myClutterMisc5Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc5, PositionRef_ClutterMisc5, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterMisc6()
	myClutterMisc6Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc6, PositionRef_ClutterMisc6, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterMisc7()
	myClutterMisc7Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc7, PositionRef_ClutterMisc7, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator1()
	myClutterActivator1Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterActivator1, PositionRef_ClutterActivator1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator2()
	myClutterActivator2Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterActivator2, PositionRef_ClutterActivator2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator3()
	myClutterActivator3Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterActivator3, PositionRef_ClutterActivator3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture1()
	myClutterFurniture1Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture1, PositionRef_ClutterFurniture1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture2()
	myClutterFurniture2Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture2, PositionRef_ClutterFurniture2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture3()
	myClutterFurniture3Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture3, PositionRef_ClutterFurniture3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture4()
	myClutterFurniture4Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture4, PositionRef_ClutterFurniture4, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture5()
	myClutterFurniture5Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture5, PositionRef_ClutterFurniture5, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture6()
	myClutterFurniture6Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture6, PositionRef_ClutterFurniture6, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture7()
	myClutterFurniture7Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture7, PositionRef_ClutterFurniture7, is_temp = is_temporary)
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
	myPlayerSitMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentSitMarker, RequiredPositionRef_PlayerBed, x_pos_offset = 12.1647, y_pos_offset = -22.7978, z_pos_offset = 5.1221, z_local_ang_adjust = 180.0 + Setting_PlayerSitAngle, is_temp = is_temporary)
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

function PlaceObject_BedRoll()
	myBedRollFuture = PlacementSystem.PlaceObject(self, _Camp_Bedroll_ActualF, RequiredPositionRef_PlayerBed, z_pos_offset = 2000.0, is_temp = is_temporary)
endFunction

function PlaceObject_Light1()
	myLightUnlitFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), PositionRef_Light1, is_temp = is_temporary)
	myLightLitFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), PositionRef_Light1, initially_disabled = true, is_temp = is_temporary)
	myLightLightFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), PositionRef_Light1, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_Light2()
	myLightUnlit2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), PositionRef_Light2, is_temp = is_temporary)
	myLightLit2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), PositionRef_Light2, initially_disabled = true, is_temp = is_temporary)
	myLightLight2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), PositionRef_Light2, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_Light3()
	myLightUnlit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), PositionRef_Light3, is_temp = is_temporary)
	myLightLit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), PositionRef_Light3, initially_disabled = true, is_temp = is_temporary)
	myLightLight3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), PositionRef_Light3, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll1()
	mySpareBedRoll1Future = PlacementSystem.PlaceObject(self, _Camp_Bedroll_NPC_F, PositionRef_Follower1_Bed, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll2()
	mySpareBedRoll2Future = PlacementSystem.PlaceObject(self, _Camp_Bedroll_NPC_F, PositionRef_Follower2_Bed, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll3()
	mySpareBedRoll3Future = PlacementSystem.PlaceObject(self, _Camp_Bedroll_NPC_F, PositionRef_Follower3_Bed, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll1SitMarker()
	mySpareBedRoll1SitMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentSitMarkerSandbox, PositionRef_Follower1_Bed, x_pos_offset = 2.1647, y_pos_offset = -22.7978, z_pos_offset = 5.1221, z_local_ang_adjust = 180.0, is_temp = is_temporary)
endFunction
function PlaceObject_SpareBedRoll2SitMarker()
	mySpareBedRoll2SitMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentSitMarkerSandbox, PositionRef_Follower2_Bed, x_pos_offset = 2.1647, y_pos_offset = -22.7978, z_pos_offset = 5.1221, z_local_ang_adjust = 180.0, is_temp = is_temporary)
endFunction
function PlaceObject_SpareBedRoll3SitMarker()
	mySpareBedRoll3SitMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_TentSitMarkerSandbox, PositionRef_Follower3_Bed, x_pos_offset = 2.1647, y_pos_offset = -22.7978, z_pos_offset = 5.1221, z_local_ang_adjust = 180.0, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1MainWeapon()
	myFollowerAMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower1_WeaponMainHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1OffHandWeapon()
	myFollowerAMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower1_WeaponOffHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1BigWeapon()
	myFollowerAMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower1_WeaponTwoHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1Bow()
	myFollowerAMarker_BowFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower1_WeaponBow, is_temp = is_temporary)
endFunction

function PlaceObject_Follower1Shield()
	myFollowerAMarker_ShieldFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower1_Shield, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2MainWeapon()
	myFollowerBMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower2_WeaponMainHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2OffHandWeapon()
	myFollowerBMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower2_WeaponOffHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2BigWeapon()
	myFollowerBMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower2_WeaponTwoHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2Bow()
	myFollowerBMarker_BowFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower2_WeaponBow, is_temp = is_temporary)
endFunction

function PlaceObject_Follower2Shield()
	myFollowerBMarker_ShieldFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower2_Shield, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3MainWeapon()
	myFollowerCMarker_MainWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower3_WeaponMainHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3OffHandWeapon()
	myFollowerCMarker_OffHandWeaponFuture= PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower3_WeaponOffHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3BigWeapon()
	myFollowerCMarker_BigWeaponFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower3_WeaponTwoHand, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3Bow()
	myFollowerCMarker_BowFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower3_WeaponBow, is_temp = is_temporary)
endFunction

function PlaceObject_Follower3Shield()
	myFollowerCMarker_ShieldFuture = PlacementSystem.PlaceObject(self, XMarker, PositionRef_Follower3_Shield, x_local_ang_adjust = 90.0, z_local_ang_adjust = 124.0, inverted_local_y = true, is_propped = true, is_temp = is_temporary)
endFunction

function DestroyMyself()
	TentSystem.DestroyTent(self)
endFunction

/;