scriptname _Frost_ConjuredShelter extends _Camp_PlaceableObjectBase

import _CampInternal
import CampUtil
import TentSystem

Float property Setting_BedRollScale = 1.0 auto
{ DESCRIPTION: Optional: The scale to render the player's and follower's bed rolls. 1.0 by default. }

Float property Setting_PlayerSitAngle = 0.0 auto
{ DESCRIPTION: Optional: The compass direction adjustment applied to the player's sitting position. 0.0 by default. }

ObjectReference property RequiredPositionRef_PlayerBed auto
{ DESCRIPTION: Required: The player's bed roll (main interactible) position reference. }

Activator property ShelterAsset_LargeTentTriggerVolume auto
{ DESCRIPTION: Optional: A trigger box activator for walk-in tents that lets the system know that you are standing inside of it. If not included, the system will only consider the player to be "inside" the tent when sitting or lying down in it. }

Static property ShelterAsset_ShelterModel auto
{ DESCRIPTION: Optional: The tent static object. }

Static property ShelterAsset_ShelterModelExterior auto
{ DESCRIPTION: Optional: The tent static object exterior (for use with Toggle View feature). }

Static property ShelterAsset_BaseStatic1 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property ShelterAsset_BaseStatic2 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property ShelterAsset_BaseStatic3 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property ShelterAsset_BaseStatic4 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property ShelterAsset_BaseStatic5 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property ShelterAsset_BaseStatic6 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property ShelterAsset_BaseStatic7 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property ShelterAsset_ClutterStatic1 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

Static property ShelterAsset_ClutterStatic2 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

Static property ShelterAsset_ClutterStatic3 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

Static property ShelterAsset_ClutterStatic4 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

Static property ShelterAsset_ClutterStatic5 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

Static property ShelterAsset_ClutterStatic6 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

Static property ShelterAsset_ClutterStatic7 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

MiscObject property ShelterAsset_ClutterMisc1 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property ShelterAsset_ClutterMisc2 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property ShelterAsset_ClutterMisc3 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property ShelterAsset_ClutterMisc4 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

MiscObject property ShelterAsset_ClutterMisc5 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. }

Activator property ShelterAsset_ClutterActivator1 auto
{ DESCRIPTION: Optional: An activator to place in or around the tent. }

Activator property ShelterAsset_ClutterActivator2 auto
{ DESCRIPTION: Optional: An activator to place in or around the tent. }

Activator property ShelterAsset_ClutterActivator3 auto
{ DESCRIPTION: Optional: An activator to place in or around the tent. }

Furniture property ShelterAsset_ClutterFurniture1 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Furniture property ShelterAsset_ClutterFurniture2 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Furniture property ShelterAsset_ClutterFurniture3 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Furniture property ShelterAsset_ClutterFurniture4 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Furniture property ShelterAsset_ClutterFurniture5 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Furniture property ShelterAsset_ClutterFurniture6 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Furniture property ShelterAsset_ClutterFurniture7 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Activator property ShelterAsset_ShelterDestructionCollider auto
{ DESCRIPTION: Optional: Activator that passes its OnHit data to this object. Used to allow hitting the shelter object to destroy the tent. }

ObjectReference property PositionRef_AnimalLayDownMarker auto
{ DESCRIPTION: Optional: Position reference of marker that animals will lie down at. }

ObjectReference property PositionRef_Shelter auto
{ DESCRIPTION: Optional: The shelter (tent, structure) position reference. }

ObjectReference property PositionRef_Light1 auto
{ DESCRIPTION: Optional: The first Light's position reference. }

ObjectReference property PositionRef_Light2 auto
{ DESCRIPTION: Optional: The second Light's position reference. }

ObjectReference property PositionRef_Light3 auto
{ DESCRIPTION: Optional: The third Light's position reference. }

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

ObjectReference property PositionRef_ClutterStatic1 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterStatic2 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterStatic3 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterStatic4 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterStatic5 auto
{ DESCRIPTION: Optional: Clutter position reference. }

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

ObjectReference property PositionRef_ClutterActivator1 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterActivator2 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterActivator3 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture1 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture2 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture3 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture4 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture5 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture6 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture7 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_Player_Backpack auto
{ DESCRIPTION: Optional: Position reference of player's backpack. }

ObjectReference property PositionRef_Player_Shield auto
{ DESCRIPTION: Optional: Position reference of player's shield. }

ObjectReference property PositionRef_Player_ShieldInterior auto
{ DESCRIPTION: Optional: Position reference of player's shield when in an interior (usually lying flat). }

ObjectReference property PositionRef_Player_WeaponMainHand auto
{ DESCRIPTION: Optional: Position reference of player's main hand weapon. }

ObjectReference property PositionRef_Player_WeaponOffHand auto
{ DESCRIPTION: Optional: Position reference of player's off hand weapon. }

ObjectReference property PositionRef_Player_WeaponTwoHand auto
{ DESCRIPTION: Optional: Position reference of player's two-handed weapon. }

ObjectReference property PositionRef_Player_WeaponBow auto
{ DESCRIPTION: Optional: Position reference of player's bow. }

ObjectReference property PositionRef_Player_ArmorHelm auto
{ DESCRIPTION: Optional: Position reference of player's head gear. }

ObjectReference property PositionRef_Player_ArmorCuirass auto
{ DESCRIPTION: Optional: Position reference of player's body gear. }

ObjectReference property PositionRef_Player_ArmorGauntlets auto
{ DESCRIPTION: Optional: Position reference of player's hand gear. }

ObjectReference property PositionRef_Player_ArmorBoots auto
{ DESCRIPTION: Optional: Position reference of player's foot gear. }

ObjectReference property PositionRef_CenterObjectOverride auto
{ DESCRIPTION: Optional: Set this to specify a different object as the one which all other tent objects "orbit" when rotated. Uses the Shelter or Player Bed if left blank. }

ObjectReference property PositionRef_Follower1_Bed auto
{ DESCRIPTION: Optional: The first follower's bed furniture position reference. }

ObjectReference property PositionRef_Follower1_Shield auto
{ DESCRIPTION: Optional: The first follower's shield position reference. }

ObjectReference property PositionRef_Follower1_WeaponMainHand auto
{ DESCRIPTION: Optional: The first follower's main hand weapon position reference. }

ObjectReference property PositionRef_Follower1_WeaponOffHand auto
{ DESCRIPTION: Optional: The first follower's off hand weapon position reference. }

ObjectReference property PositionRef_Follower1_WeaponTwoHand auto
{ DESCRIPTION: Optional: The first follower's two-handed weapon position reference. }

ObjectReference property PositionRef_Follower1_WeaponBow auto
{ DESCRIPTION: Optional: The first follower's bow position reference. }

ObjectReference property PositionRef_Follower2_Bed auto
{ DESCRIPTION: Optional: The second follower's bed furniture position reference. }

ObjectReference property PositionRef_Follower2_Shield auto
{ DESCRIPTION: Optional: The second follower's shield position reference. }

ObjectReference property PositionRef_Follower2_WeaponMainHand auto
{ DESCRIPTION: Optional: The second follower's main hand weapon position reference. }

ObjectReference property PositionRef_Follower2_WeaponOffHand auto
{ DESCRIPTION: Optional: The second follower's off hand weapon position reference. }

ObjectReference property PositionRef_Follower2_WeaponTwoHand auto
{ DESCRIPTION: Optional: The second follower's two-handed weapon position reference. }

ObjectReference property PositionRef_Follower2_WeaponBow auto
{ DESCRIPTION: Optional: The second follower's bow position reference. }

ObjectReference property PositionRef_Follower3_Bed auto
{ DESCRIPTION: Optional: The third follower's bed furniture position reference. }

ObjectReference property PositionRef_Follower3_Shield auto
{ DESCRIPTION: Optional: The third follower's shield position reference. }

ObjectReference property PositionRef_Follower3_WeaponMainHand auto
{ DESCRIPTION: Optional: The third follower's main hand weapon position reference. }

ObjectReference property PositionRef_Follower3_WeaponOffHand auto
{ DESCRIPTION: Optional: The third follower's off hand weapon position reference. }

ObjectReference property PositionRef_Follower3_WeaponTwoHand auto
{ DESCRIPTION: Optional: The third follower's two-handed weapon position reference. }

ObjectReference property PositionRef_Follower3_WeaponBow auto
{ DESCRIPTION: Optional: The third follower's bow position reference. }

; PRIVATE
;Run-time objects
ObjectReference property myTent auto hidden
ObjectReference property myTentExterior auto hidden
ObjectReference property myLargeTentTriggerVolume auto hidden
ObjectReference property myLightLit auto hidden
ObjectReference property myLightUnlit auto hidden
ObjectReference property myLightLight auto hidden
ObjectReference property myLightLit2 auto hidden
ObjectReference property myLightUnlit2 auto hidden
ObjectReference property myLightLight2 auto hidden
ObjectReference property myLightLit3 auto hidden
ObjectReference property myLightUnlit3 auto hidden
ObjectReference property myLightLight3 auto hidden
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
ObjectReference property myBaseStatic1 auto hidden
ObjectReference property myBaseStatic2 auto hidden
ObjectReference property myBaseStatic3 auto hidden
ObjectReference property myBaseStatic4 auto hidden
ObjectReference property myBaseStatic5 auto hidden
ObjectReference property myBaseStatic6 auto hidden
ObjectReference property myBaseStatic7 auto hidden
ObjectReference property myClutterStatic1 auto hidden
ObjectReference property myClutterStatic2 auto hidden
ObjectReference property myClutterStatic3 auto hidden
ObjectReference property myClutterStatic4 auto hidden
ObjectReference property myClutterStatic5 auto hidden
ObjectReference property myClutterStatic6 auto hidden
ObjectReference property myClutterStatic7 auto hidden
ObjectReference property myClutterMisc1 auto hidden
ObjectReference property myClutterMisc2 auto hidden
ObjectReference property myClutterMisc3 auto hidden
ObjectReference property myClutterMisc4 auto hidden
ObjectReference property myClutterMisc5 auto hidden
ObjectReference property myClutterActivator1 auto hidden
ObjectReference property myClutterActivator2 auto hidden
ObjectReference property myClutterActivator3 auto hidden
ObjectReference property myClutterFurniture1 auto hidden
ObjectReference property myClutterFurniture2 auto hidden
ObjectReference property myClutterFurniture3 auto hidden
ObjectReference property myClutterFurniture4 auto hidden
ObjectReference property myClutterFurniture5 auto hidden
ObjectReference property myClutterFurniture6 auto hidden
ObjectReference property myClutterFurniture7 auto hidden
ObjectReference property myPlayerSitMarker auto hidden
ObjectReference property myPlayerLayDownMarker auto hidden
ObjectReference property myPlayerWithSpouseLayDownMarker auto hidden
ObjectReference property mySpouseLayDownMarker auto hidden
ObjectReference property myAnimalLayDownMarker auto hidden
ObjectReference property myBedRoll auto hidden
ObjectReference property mySpareBedRoll1 auto hidden
ObjectReference property mySpareBedRoll2 auto hidden
ObjectReference property mySpareBedRoll3 auto hidden
ObjectReference property mySpareBedRoll1SitMarker auto hidden
ObjectReference property mySpareBedRoll2SitMarker auto hidden
ObjectReference property mySpareBedRoll3SitMarker auto hidden
ObjectReference property myShelterCollider auto hidden

;Futures
ObjectReference property myTentFuture auto hidden
ObjectReference property myLightLitFuture auto hidden
ObjectReference property myLightUnlitFuture auto hidden
ObjectReference property myLightLightFuture auto hidden
ObjectReference property myLightLit2Future auto hidden
ObjectReference property myLightUnlit2Future auto hidden
ObjectReference property myLightLight2Future auto hidden
ObjectReference property myLightLit3Future auto hidden
ObjectReference property myLightUnlit3Future auto hidden
ObjectReference property myLightLight3Future auto hidden
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
ObjectReference property myBaseStatic1Future auto hidden
ObjectReference property myBaseStatic2Future auto hidden
ObjectReference property myBaseStatic3Future auto hidden
ObjectReference property myBaseStatic4Future auto hidden
ObjectReference property myBaseStatic5Future auto hidden
ObjectReference property myBaseStatic6Future auto hidden
ObjectReference property myBaseStatic7Future auto hidden
ObjectReference property myClutterStatic1Future auto hidden
ObjectReference property myClutterStatic2Future auto hidden
ObjectReference property myClutterStatic3Future auto hidden
ObjectReference property myClutterStatic4Future auto hidden
ObjectReference property myClutterStatic5Future auto hidden
ObjectReference property myClutterStatic6Future auto hidden
ObjectReference property myClutterStatic7Future auto hidden
ObjectReference property myClutterMisc1Future auto hidden
ObjectReference property myClutterMisc2Future auto hidden
ObjectReference property myClutterMisc3Future auto hidden
ObjectReference property myClutterMisc4Future auto hidden
ObjectReference property myClutterMisc5Future auto hidden
ObjectReference property myClutterActivator1Future auto hidden
ObjectReference property myClutterActivator2Future auto hidden
ObjectReference property myClutterActivator3Future auto hidden
ObjectReference property myClutterFurniture1Future auto hidden
ObjectReference property myClutterFurniture2Future auto hidden
ObjectReference property myClutterFurniture3Future auto hidden
ObjectReference property myClutterFurniture4Future auto hidden
ObjectReference property myClutterFurniture5Future auto hidden
ObjectReference property myClutterFurniture6Future auto hidden
ObjectReference property myClutterFurniture7Future auto hidden
ObjectReference property myPlayerSitMarkerFuture auto hidden
ObjectReference property myPlayerLayDownMarkerFuture auto hidden
ObjectReference property myPlayerWithSpouseLayDownMarkerFuture auto hidden
ObjectReference property mySpouseLayDownMarkerFuture auto hidden
ObjectReference property myAnimalLayDownMarkerFuture auto hidden
ObjectReference property myBedRollFuture auto hidden
ObjectReference property mySpareBedRoll1Future auto hidden
ObjectReference property mySpareBedRoll2Future auto hidden
ObjectReference property mySpareBedRoll3Future auto hidden
ObjectReference property mySpareBedRoll1SitMarkerFuture auto hidden
ObjectReference property mySpareBedRoll2SitMarkerFuture auto hidden
ObjectReference property mySpareBedRoll3SitMarkerFuture auto hidden
ObjectReference property myShelterColliderFuture auto hidden
ObjectReference property myLargeTentTriggerVolumeFuture auto hidden

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
Form DogLayingDownIdleMarker

function Update()
	UpdateTentUseState(self)
endFunction

Event OnActivate(ObjectReference akActionRef)
	ActivateTent(akActionRef, self)
endEvent

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
		if PositionRef_Shelter
			CenterObject = PositionRef_Shelter
		else
			CenterObject = RequiredPositionRef_PlayerBed
		endif
	endif

	if ShelterAsset_ShelterModel && PositionRef_Shelter
		PlaceObject_Tent()
	endif
	if ShelterAsset_ShelterDestructionCollider && PositionRef_Shelter
		PlaceObject_ShelterCollider()
	endif
	if ShelterAsset_ShelterModelExterior && PositionRef_Shelter
		PlaceObject_NormalTent()
	endif
	if ShelterAsset_ShelterModelMaterialSnow && PositionRef_Shelter
		PlaceObject_SnowTent()
	endif
	if ShelterAsset_ShelterModelMaterialAsh && PositionRef_Shelter
		PlaceObject_AshTent()
	endif
	if ShelterAsset_LargeTentTriggerVolume
		PlaceObject_LargeTentTriggerVolume()
	endif
	if ShelterAsset_ClutterStatic1 && PositionRef_ClutterStatic1
		PlaceObject_ClutterStatic1()
	endif
	if ShelterAsset_ClutterStatic2 && PositionRef_ClutterStatic2
		PlaceObject_ClutterStatic2()
	endif
	if ShelterAsset_ClutterStatic3 && PositionRef_ClutterStatic3
		PlaceObject_ClutterStatic3()
	endif
	if ShelterAsset_ClutterStatic4 && PositionRef_ClutterStatic4
		PlaceObject_ClutterStatic4()
	endif
	if ShelterAsset_ClutterStatic5 && PositionRef_ClutterStatic5
		PlaceObject_ClutterStatic5()
	endif
	if ShelterAsset_ClutterActivator1 && PositionRef_ClutterActivator1
		PlaceObject_ClutterActivator1(Extended)
	endif
	if ShelterAsset_ClutterActivator2 && PositionRef_ClutterActivator2
		PlaceObject_ClutterActivator2(Extended)
	endif
	if ShelterAsset_ClutterActivator3 && PositionRef_ClutterActivator3
		PlaceObject_ClutterActivator3(Extended)
	endif
	if ShelterAsset_ClutterFurniture1 && PositionRef_ClutterFurniture1
		PlaceObject_ClutterFurniture1(Extended)
	endif
	if ShelterAsset_ClutterFurniture2 && PositionRef_ClutterFurniture2
		PlaceObject_ClutterFurniture2(Extended)
	endif
	if ShelterAsset_ClutterFurniture3 && PositionRef_ClutterFurniture3
		PlaceObject_ClutterFurniture3(Extended)
	endif
	if ShelterAsset_ClutterFurniture4 && PositionRef_ClutterFurniture4
		PlaceObject_ClutterFurniture4(Extended)
	endif
	if ShelterAsset_ClutterFurniture5 && PositionRef_ClutterFurniture5
		PlaceObject_ClutterFurniture5(Extended)
	endif
	if PositionRef_Lantern1
		PlaceObject_Lantern1()
	endif
	if PositionRef_Lantern2
		PlaceObject_Lantern2(Extended)
	endif
	if PositionRef_Lantern3
		PlaceObject_Lantern3(Extended)
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
		PlaceObject_Follower1MainWeapon(Extended)
	endif
	if PositionRef_Follower1_WeaponOffHand
		PlaceObject_Follower1OffHandWeapon(Extended)
	endif
	if PositionRef_Follower1_WeaponTwoHand
		PlaceObject_Follower1BigWeapon(Extended)
	endif
	if PositionRef_Follower1_WeaponBow
		PlaceObject_Follower1Bow(Extended)
	endif
	if PositionRef_Follower1_Shield
		PlaceObject_Follower1Shield(Extended)
	endif
	if PositionRef_Follower2_WeaponMainHand
		PlaceObject_Follower2MainWeapon(Extended)
	endif
	if PositionRef_Follower2_WeaponOffHand
		PlaceObject_Follower2OffHandWeapon(Extended)
	endif
	if PositionRef_Follower2_WeaponTwoHand
		PlaceObject_Follower2BigWeapon(Extended)
	endif
	if PositionRef_Follower2_WeaponBow
		PlaceObject_Follower2Bow(Extended)
	endif
	if PositionRef_Follower2_Shield
		PlaceObject_Follower2Shield(Extended)
	endif
	if PositionRef_Follower3_WeaponMainHand
		PlaceObject_Follower3MainWeapon(Extended)
	endif
	if PositionRef_Follower3_WeaponOffHand
		PlaceObject_Follower3OffHandWeapon(Extended)
	endif
	if PositionRef_Follower3_WeaponTwoHand
		PlaceObject_Follower3BigWeapon(Extended)
	endif
	if PositionRef_Follower3_WeaponBow
		PlaceObject_Follower3Bow(Extended)
	endif
	if PositionRef_Follower3_Shield
		PlaceObject_Follower3Shield(Extended)
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
		PlaceObject_SpareBedRoll1(Extended)
		PlaceObject_SpareBedRoll1SitMarker(Extended)
	endif
	if PositionRef_Follower2_Bed
		PlaceObject_SpareBedRoll2(Extended)
		PlaceObject_SpareBedRoll2SitMarker(Extended)
	endif
	if PositionRef_Follower3_Bed
		PlaceObject_SpareBedRoll3(Extended)
		PlaceObject_SpareBedRoll3SitMarker(Extended)
	endif
endFunction

;@Override _Camp_PlaceableObjectBase
function GetResults()
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

	if GetLogLevel() <= 1
		GenerateDebugReport()
	endif
endFunction

function TakeDown()
	SetCurrentTent(None)
	parent.TakeDown()

	ForceStopUsingFurniture(myClutterFurniture1)
	ForceStopUsingFurniture(myClutterFurniture2)
	ForceStopUsingFurniture(myClutterFurniture3)
	ForceStopUsingFurniture(myClutterFurniture4)
	ForceStopUsingFurniture(myClutterFurniture5)
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
	TryToDisableAndDeleteRef(myClutterActivator1)
	TryToDisableAndDeleteRef(myClutterActivator2)
	TryToDisableAndDeleteRef(myClutterActivator3)
	TryToDisableAndDeleteRef(myClutterFurniture1)
	TryToDisableAndDeleteRef(myClutterFurniture2)
	TryToDisableAndDeleteRef(myClutterFurniture3)
	TryToDisableAndDeleteRef(myClutterFurniture4)
	TryToDisableAndDeleteRef(myClutterFurniture5)
	TryToDisableAndDeleteRef(myPlayerSitMarker)
	TryToDisableAndDeleteRef(myPlayerLayDownMarker)
	TryToDisableAndDeleteRef(myPlayerWithSpouseLayDownMarker)
	TryToDisableAndDeleteRef(mySpouseLayDownMarker)
	TryToDisableAndDeleteRef(myAnimalLayDownMarker)
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
	myClutterStatic1 = None
	myClutterStatic2 = None
	myClutterStatic3 = None
	myClutterStatic4 = None
	myClutterStatic5 = None
	myClutterActivator1 = None
	myClutterActivator2 = None
	myClutterActivator3 = None
	myClutterFurniture1 = None
	myClutterFurniture2 = None
	myClutterFurniture3 = None
	myClutterFurniture4 = None
	myClutterFurniture5 = None
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
	CampDebug(1, "myTent: " + myTent)
	CampDebug(1, "myTentExterior: " + myTentExterior)
	CampDebug(1, "myNormalTent: " + myNormalTent)
	CampDebug(1, "mySnowTent: " + mySnowTent)
	CampDebug(1, "myAshTent: " + myAshTent)
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

function PlaceObject_Tent()
	myTentFuture = PlacementSystem.PlaceObject(self, ShelterAsset_ShelterModel, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_ShelterCollider()
	myShelterColliderFuture = PlacementSystem.PlaceObject(self, ShelterAsset_ShelterDestructionCollider, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_NormalTent()
	myNormalTentFuture = PlacementSystem.PlaceObject(self, ShelterAsset_ShelterModelExterior, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_SnowTent()
	mySnowTentFuture = PlacementSystem.PlaceObject(self, ShelterAsset_ShelterModelMaterialSnow, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_AshTent()
	myAshTentFuture = PlacementSystem.PlaceObject(self, ShelterAsset_ShelterModelMaterialAsh, PositionRef_Shelter, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_LargeTentTriggerVolume()
	myLargeTentTriggerVolumeFuture = PlacementSystem.PlaceObject(self, ShelterAsset_LargeTentTriggerVolume, PositionRef_Shelter, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic1()
	myClutterStatic1Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterStatic1, PositionRef_ClutterStatic1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic2()
	myClutterStatic2Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterStatic2, PositionRef_ClutterStatic2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic3()
	myClutterStatic3Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterStatic3, PositionRef_ClutterStatic3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic4()
	myClutterStatic4Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterStatic4, PositionRef_ClutterStatic4, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterStatic5()
	myClutterStatic5Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterStatic5, PositionRef_ClutterStatic5, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator1()
	myClutterActivator1Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterActivator1, PositionRef_ClutterActivator1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator2()
	myClutterActivator2Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterActivator2, PositionRef_ClutterActivator2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterActivator3()
	myClutterActivator3Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterActivator3, PositionRef_ClutterActivator3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture1()
	myClutterFurniture1Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterFurniture1, PositionRef_ClutterFurniture1, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture2()
	myClutterFurniture2Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterFurniture2, PositionRef_ClutterFurniture2, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture3()
	myClutterFurniture3Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterFurniture3, PositionRef_ClutterFurniture3, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture4()
	myClutterFurniture4Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterFurniture4, PositionRef_ClutterFurniture4, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture5()
	myClutterFurniture5Future = PlacementSystem.PlaceObject(self, ShelterAsset_ClutterFurniture5, PositionRef_ClutterFurniture5, is_temp = is_temporary)
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
	myLightUnlitFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), PositionRef_Lantern1, is_temp = is_temporary)
	myLightLitFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), PositionRef_Lantern1, initially_disabled = true, is_temp = is_temporary)
	myLightLightFuture = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), PositionRef_Lantern1, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_Light2()
	myLightUnlit2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), PositionRef_Lantern2, is_temp = is_temporary)
	myLightLit2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), PositionRef_Lantern2, initially_disabled = true, is_temp = is_temporary)
	myLightLight2Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), PositionRef_Lantern2, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_Light3()
	myLightUnlit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = false), PositionRef_Lantern3, is_temp = is_temporary)
	myLightLit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = false), PositionRef_Lantern3, initially_disabled = true, is_temp = is_temporary)
	myLightLight3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), PositionRef_Lantern3, initially_disabled = true, is_temp = is_temporary)
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
















































;Misc
EffectShader property ShockDisintegrate01FXS auto
VisualEffect property MGTeleportInEffect auto

float property ShelterID auto hidden
int property mySoundID auto hidden



function TakeDown()
	SetCurrentTent(None)
	(self as _Camp_PlaceableObjectBase).TakeDown()

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
	WarpOutRef(myClutterStatic1)
	WarpOutRef(myClutterStatic2)
	WarpOutRef(myClutterStatic3)
	WarpOutRef(myClutterStatic4)
	WarpOutRef(myClutterStatic5)
	WarpOutRef(myClutterActivator1)
	WarpOutRef(myClutterActivator2)
	WarpOutRef(myClutterActivator3)
	WarpOutRef(myClutterFurniture1)
	WarpOutRef(myClutterFurniture2)
	WarpOutRef(myClutterFurniture3)
	WarpOutRef(myClutterFurniture4)
	WarpOutRef(myClutterFurniture5)
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
	WarpOutRef(mySnowTent)
	WarpOutRef(myAshTent)
	WarpOutRef(myNormalTent)
	WarpOutRef(myTent)

	Utility.Wait(1.2)

	; Remove references
	TryToDisableAndDeleteRef(myClutterStatic1)
	TryToDisableAndDeleteRef(myClutterStatic2)
	TryToDisableAndDeleteRef(myClutterStatic3)
	TryToDisableAndDeleteRef(myClutterStatic4)
	TryToDisableAndDeleteRef(myClutterStatic5)
	TryToDisableAndDeleteRef(myClutterActivator1)
	TryToDisableAndDeleteRef(myClutterActivator2)
	TryToDisableAndDeleteRef(myClutterActivator3)
	TryToDisableAndDeleteRef(myClutterFurniture1)
	TryToDisableAndDeleteRef(myClutterFurniture2)
	TryToDisableAndDeleteRef(myClutterFurniture3)
	TryToDisableAndDeleteRef(myClutterFurniture4)
	TryToDisableAndDeleteRef(myClutterFurniture5)
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
	TryToDisableAndDeleteRef(mySnowTent)
	TryToDisableAndDeleteRef(myAshTent)
	TryToDisableAndDeleteRef(myNormalTent)
	TryToDisableAndDeleteRef(myTent)

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
	myClutterStatic1 = None
	myClutterStatic2 = None
	myClutterStatic3 = None
	myClutterStatic4 = None
	myClutterStatic5 = None
	myClutterActivator1 = None
	myClutterActivator2 = None
	myClutterActivator3 = None
	myClutterFurniture1 = None
	myClutterFurniture2 = None
	myClutterFurniture3 = None
	myClutterFurniture4 = None
	myClutterFurniture5 = None
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
	mySphere = PlaceAtMeRelative(self, _DE_MageSphere1, myOriginAng, mySphere_Pos, abInitiallyDisabled = true)
	float mySphereScale = _DE_Shelter_L_Sphere.GetScale()		
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
endFunction

function DispelSphere()
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
endFunction