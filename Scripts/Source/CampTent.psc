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