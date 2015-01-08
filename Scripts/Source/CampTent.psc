scriptname CampTent extends ObjectReference

import CampUtil
import TentUtil

; REQUIRED PROPERTIES
Static property Required_PlacementModel auto
{The model to be displayed when the player is placing this object.}

MiscObject property Required_PickupItem auto
{The item the player obtains when picking up this tent.}

ObjectReference property RequiredPositionRef_PlayerBed auto ;figure out what to do with this
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

ObjectReference property PositionRef_Lantern2 auto
{Optional: The second lantern's position reference.}

ObjectReference property PositionRef_Lantern3 auto
{Optional: The third lantern's position reference.}

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

ObjectReference property PositionRef_Clutter6 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Clutter7 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Clutter8 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Clutter9 auto
{Optional: Clutter position reference.}

ObjectReference property PositionRef_Clutter10 auto
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

ObjectReference property PositionRef_Follower1_Bed auto
{Optional: The first follower's bed furniture position reference.}

ObjectReference property PositionRef_Follower1_Shield auto
{Optional: The first follower's shield position reference.}

ObjectReference property PositionRef_Follower1_WeaponMainHand auto
{Optional: The first follower's main hand weapon position reference.}

ObjectReference property PositionRef_Follower1_WeaponOffHand auto
{Optional: The first follower's off hand weapon position reference.}

ObjectReference property PositionRef_Follower1_WeaponTwoHand auto
{Optional: The first follower's two-handed weapon position reference.}

ObjectReference property PositionRef_Follower1_WeaponBow auto
{Optional: The first follower's bow position reference.}

ObjectReference property PositionRef_Follower2_Bed auto
{Optional: The second follower's bed furniture position reference.}

ObjectReference property PositionRef_Follower2_Shield auto
{Optional: The second follower's shield position reference.}

ObjectReference property PositionRef_Follower2_WeaponMainHand auto
{Optional: The second follower's main hand weapon position reference.}

ObjectReference property PositionRef_Follower2_WeaponOffHand auto
{Optional: The second follower's off hand weapon position reference.}

ObjectReference property PositionRef_Follower2_WeaponTwoHand auto
{Optional: The second follower's two-handed weapon position reference.}

ObjectReference property PositionRef_Follower2_WeaponBow auto
{Optional: The second follower's bow position reference.}

ObjectReference property PositionRef_Follower3_Bed auto
{Optional: The third follower's bed furniture position reference.}

ObjectReference property PositionRef_Follower3_Shield auto
{Optional: The third follower's shield position reference.}

ObjectReference property PositionRef_Follower3_WeaponMainHand auto
{Optional: The third follower's main hand weapon position reference.}

ObjectReference property PositionRef_Follower3_WeaponOffHand auto
{Optional: The third follower's off hand weapon position reference.}

ObjectReference property PositionRef_Follower3_WeaponTwoHand auto
{Optional: The third follower's two-handed weapon position reference.}

ObjectReference property PositionRef_Follower3_WeaponBow auto
{Optional: The third follower's bow position reference.}