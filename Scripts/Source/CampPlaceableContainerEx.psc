;/********s* CampPlaceableObject/CampPlaceableObjectEx
* SCRIPTNAME
*/;
scriptname CampPlaceableContainerEx extends CampPlaceableContainer
;/*
* OVERVIEW
* The `CampPlaceableObjectEx` script is an expanded version of CampPlaceableObject, for creating
* more elaborate multi-part placeable objects (such as a barrel with a lantern and a chair). Can be
* attached to an Activator or Furniture object that serves as the main interactible.
;*********/;

import _CampInternal

;/********p* CampPlaceableObject/Asset_ExtraStatic1
* SYNTAX
*/;
Static property Asset_ExtraStatic1 auto
{
* DESCRIPTION
* Optional: A static to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraStatic2
* SYNTAX
*/;
Static property Asset_ExtraStatic2 auto
{
* DESCRIPTION
* Optional: A static to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraStatic3
* SYNTAX
*/;
Static property Asset_ExtraStatic3 auto
{
* DESCRIPTION
* Optional: A static to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraStatic4
* SYNTAX
*/;
Static property Asset_ExtraStatic4 auto
{
* DESCRIPTION
* Optional: A static to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraStatic5
* SYNTAX
*/;
Static property Asset_ExtraStatic5 auto
{
* DESCRIPTION
* Optional: A static to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraActivator1
* SYNTAX
*/;
Activator property Asset_ExtraActivator1 auto
{
* DESCRIPTION
* Optional: An activator to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraActivator2
* SYNTAX
*/;
Activator property Asset_ExtraActivator2 auto
{
* DESCRIPTION
* Optional: An activator to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraActivator3
* SYNTAX
*/;
Activator property Asset_ExtraActivator3 auto
{
* DESCRIPTION
* Optional: An activator to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraActivator4
* SYNTAX
*/;
Activator property Asset_ExtraActivator4 auto
{
* DESCRIPTION
* Optional: An activator to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraActivator5
* SYNTAX
*/;
Activator property Asset_ExtraActivator5 auto
{
* DESCRIPTION
* Optional: An activator to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraFurniture1
* SYNTAX
*/;
Furniture property Asset_ExtraFurniture1 auto
{
* DESCRIPTION
* Optional: A piece of furniture to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraFurniture2
* SYNTAX
*/;
Furniture property Asset_ExtraFurniture2 auto
{
* DESCRIPTION
* Optional: A piece of furniture to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraFurniture3
* SYNTAX
*/;
Furniture property Asset_ExtraFurniture3 auto
{
* DESCRIPTION
* Optional: A piece of furniture to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraFurniture4
* SYNTAX
*/;
Furniture property Asset_ExtraFurniture4 auto
{
* DESCRIPTION
* Optional: A piece of furniture to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraFurniture5
* SYNTAX
*/;
Furniture property Asset_ExtraFurniture5 auto
{
* DESCRIPTION
* Optional: A piece of furniture to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraLight1
* SYNTAX
*/;
Light property Asset_ExtraLight1 auto
{
* DESCRIPTION
* Optional: A light source to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraLight2
* SYNTAX
*/;
Light property Asset_ExtraLight2 auto
{
* DESCRIPTION
* Optional: A light source to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/Asset_ExtraLight3
* SYNTAX
*/;
Light property Asset_ExtraLight3 auto
{
* DESCRIPTION
* Optional: A light source to place near this object. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraStatic1
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraStatic1 auto
{
* DESCRIPTION
* Optional: Extra Static object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraStatic2
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraStatic2 auto
{
* DESCRIPTION
* Optional: Extra Static object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraStatic3
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraStatic3 auto
{
* DESCRIPTION
* Optional: Extra Static object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraStatic4
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraStatic4 auto
{
* DESCRIPTION
* Optional: Extra Static object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraStatic5
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraStatic5 auto
{
* DESCRIPTION
* Optional: Extra Static object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraActivator1
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraActivator1 auto
{
* DESCRIPTION
* Optional: Extra Activator object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraActivator2
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraActivator2 auto
{
* DESCRIPTION
* Optional: Extra Activator object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraActivator3
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraActivator3 auto
{
* DESCRIPTION
* Optional: Extra Activator object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraActivator4
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraActivator4 auto
{
* DESCRIPTION
* Optional: Extra Activator object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraActivator5
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraActivator5 auto
{
* DESCRIPTION
* Optional: Extra Activator object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraFurniture1
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraFurniture1 auto
{
* DESCRIPTION
* Optional: Extra Furniture object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraFurniture2
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraFurniture2 auto
{
* DESCRIPTION
* Optional: Extra Furniture object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraFurniture3
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraFurniture3 auto
{
* DESCRIPTION
* Optional: Extra Furniture object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraFurniture4
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraFurniture4 auto
{
* DESCRIPTION
* Optional: Extra Furniture object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraFurniture5
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraFurniture5 auto
{
* DESCRIPTION
* Optional: Extra Furniture object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraLight1
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraLight1 auto
{
* DESCRIPTION
* Optional: Extra Light object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraLight2
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraLight2 auto
{
* DESCRIPTION
* Optional: Extra Light object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/PositionRef_ExtraLight3
* SYNTAX
*/;
ObjectReference property PositionRef_ExtraLight3 auto
{
* DESCRIPTION
* Optional: Extra Light object position reference. }
;*********/;

;/********p* CampPlaceableObjectEx/RequiredPositionRef_CenterObject
* SYNTAX
*/;
ObjectReference property RequiredPositionRef_CenterObject auto
{
* DESCRIPTION
* Required: Set this to specify the position reference of the object that all other objects "orbit" when rotated. }
;*********/;

function TakeDown()
	CampDebug(0, self + " TakeDown (CampPlaceableContainerEx)")
	parent.TakeDown()
endFunction