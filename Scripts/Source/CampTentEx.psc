;/********s* CampTent/CampTentEx
* SCRIPTNAME
*/;
scriptname CampTentEx extends CampTent
;/*
* OVERVIEW
* This script is an expanded version of CampTent, and includes a larger number of optional properties 
* in order to create more elaborate tents. CampTentEx includes support for up to 3 follower bed rolls,
* 2 additional lanterns, new clutter options, and more.
;*********/;

import _CampInternal

; OPTIONAL PROPERTIES

;/********p* CampTentEx/TentAsset_ClutterActivator1
* SYNTAX
*/;
Activator property TentAsset_ClutterActivator1 auto
{
* DESCRIPTION
* Optional: An activator to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterActivator2
* SYNTAX
*/;
Activator property TentAsset_ClutterActivator2 auto
{
* DESCRIPTION
* Optional: An activator to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterActivator3
* SYNTAX
*/;
Activator property TentAsset_ClutterActivator3 auto
{
* DESCRIPTION
* Optional: An activator to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterActivator4
* SYNTAX
*/;
Activator property TentAsset_ClutterActivator4 auto
{
* DESCRIPTION
* Optional: An activator to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterActivator5
* SYNTAX
*/;
Activator property TentAsset_ClutterActivator5 auto
{
* DESCRIPTION
* Optional: An activator to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterFurniture1
* SYNTAX
*/;
Furniture property TentAsset_ClutterFurniture1 auto
{
* DESCRIPTION
* Optional: A furniture object to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterFurniture2
* SYNTAX
*/;
Furniture property TentAsset_ClutterFurniture2 auto
{
* DESCRIPTION
* Optional: A furniture object to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterFurniture3
* SYNTAX
*/;
Furniture property TentAsset_ClutterFurniture3 auto
{
* DESCRIPTION
* Optional: A furniture object to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterFurniture4
* SYNTAX
*/;
Furniture property TentAsset_ClutterFurniture4 auto
{
* DESCRIPTION
* Optional: A furniture object to place in or around the tent. }
;*********/;

;/********p* CampTentEx/TentAsset_ClutterFurniture5
* SYNTAX
*/;
Furniture property TentAsset_ClutterFurniture5 auto
{
* DESCRIPTION
* Optional: A furniture object to place in or around the tent. }
;*********/;

;/********p* CampTentEx/PositionRef_Lantern2
* SYNTAX
*/;
ObjectReference property PositionRef_Lantern2 auto
{
* DESCRIPTION
* Optional: The second lantern's position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Lantern3
* SYNTAX
*/;
ObjectReference property PositionRef_Lantern3 auto
{
* DESCRIPTION
* Optional: The third lantern's position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterActivator1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator1 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterActivator2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator2 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterActivator3
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator3 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterActivator4
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator4 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterActivator5
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator5 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterFurniture1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture1 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterFurniture2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture2 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterFurniture3
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture3 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterFurniture4
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture4 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_ClutterFurniture5
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture5 auto
{
* DESCRIPTION
* Optional: Clutter position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower1_Bed
* SYNTAX
*/;
ObjectReference property PositionRef_Follower1_Bed auto
{
* DESCRIPTION
* Optional: The first follower's bed furniture position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower1_Shield
* SYNTAX
*/;
ObjectReference property PositionRef_Follower1_Shield auto
{
* DESCRIPTION
* Optional: The first follower's shield position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower1_WeaponMainHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower1_WeaponMainHand auto
{
* DESCRIPTION
* Optional: The first follower's main hand weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower1_WeaponOffHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower1_WeaponOffHand auto
{
* DESCRIPTION
* Optional: The first follower's off hand weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower1_WeaponTwoHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower1_WeaponTwoHand auto
{
* DESCRIPTION
* Optional: The first follower's two-handed weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower1_WeaponBow
* SYNTAX
*/;
ObjectReference property PositionRef_Follower1_WeaponBow auto
{
* DESCRIPTION
* Optional: The first follower's bow position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower2_Bed
* SYNTAX
*/;
ObjectReference property PositionRef_Follower2_Bed auto
{
* DESCRIPTION
* Optional: The second follower's bed furniture position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower2_Shield
* SYNTAX
*/;
ObjectReference property PositionRef_Follower2_Shield auto
{
* DESCRIPTION
* Optional: The second follower's shield position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower2_WeaponMainHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower2_WeaponMainHand auto
{
* DESCRIPTION
* Optional: The second follower's main hand weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower2_WeaponOffHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower2_WeaponOffHand auto
{
* DESCRIPTION
* Optional: The second follower's off hand weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower2_WeaponTwoHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower2_WeaponTwoHand auto
{
* DESCRIPTION
* Optional: The second follower's two-handed weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower2_WeaponBow
* SYNTAX
*/;
ObjectReference property PositionRef_Follower2_WeaponBow auto
{
* DESCRIPTION
* Optional: The second follower's bow position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower3_Bed
* SYNTAX
*/;
ObjectReference property PositionRef_Follower3_Bed auto
{
* DESCRIPTION
* Optional: The third follower's bed furniture position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower3_Shield
* SYNTAX
*/;
ObjectReference property PositionRef_Follower3_Shield auto
{
* DESCRIPTION
* Optional: The third follower's shield position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower3_WeaponMainHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower3_WeaponMainHand auto
{
* DESCRIPTION
* Optional: The third follower's main hand weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower3_WeaponOffHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower3_WeaponOffHand auto
{
* DESCRIPTION
* Optional: The third follower's off hand weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower3_WeaponTwoHand
* SYNTAX
*/;
ObjectReference property PositionRef_Follower3_WeaponTwoHand auto
{
* DESCRIPTION
* Optional: The third follower's two-handed weapon position reference. }
;*********/;

;/********p* CampTentEx/PositionRef_Follower3_WeaponBow
* SYNTAX
*/;
ObjectReference property PositionRef_Follower3_WeaponBow auto
{
* DESCRIPTION
* Optional: The third follower's bow position reference. }
;*********/;

function TakeDown()
	CampDebug(0, self + " TakeDown (CampTentEx)")
	parent.TakeDown()
endFunction