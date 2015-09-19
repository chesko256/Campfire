;/********s* ObjectReference/CampPlaceableMiscItem
* SCRIPTNAME
*/;
scriptname CampPlaceableMiscItem extends ObjectReference
;/*
* OVERVIEW
* Attach this script to a Misc Item that represents the inventory item of a Placeable Object.
;*********/;

import CampUtil

;/********p* CampPlacementIndicator/Required_this_item
* SYNTAX
*/;
MiscObject property Required_this_item auto
{
* DESCRIPTION
* Required: This inventory item, the object this script is attached to. }
;*********/;

;/********p* CampPlaceableMiscItem/Required_placement_indicator
* SYNTAX
*/;
Activator property Required_placement_indicator auto
{
* DESCRIPTION
* Required: The object that will indicate to the player where to place this item. }
;*********/;

;/********p* CampPlaceableMiscItem/z_angle_offset
* SYNTAX
*/;
float property z_angle_offset auto
{
* DESCRIPTION
* Adjust Z angle (compass rotation) of placed item. Use if placed item is at a different angle than the placement indicator. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_ingredient
* SYNTAX
*/;
Ingredient property consumable_ingredient auto
{
* DESCRIPTION
* Optional: An ingredient that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_misc_item
* SYNTAX
*/;
MiscObject property consumable_misc_item auto
{
* DESCRIPTION
* Optional: A misc item that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_cost
* SYNTAX
*/;
int property consumable_cost auto
{
* DESCRIPTION
* Optional: How many of the ingredients or misc items that will be consumed when this item is used / placed. }
;********/;

;/********p* CampPlaceableMiscItem/necessary_perk
* SYNTAX
*/;
Perk property necessary_perk auto
{
* DESCRIPTION
* Optional: A perk required to use / place this item. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_ingredient_name
* SYNTAX
*/;
string property consumable_ingredient_name auto
{
* DESCRIPTION
* Optional: The name of any required ingredient. Used if user does not have SKSE installed. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_miscitem_name
* SYNTAX
*/;
string property consumable_miscitem_name auto
{
* DESCRIPTION
* Optional: The name of any required misc item. Used if user does not have SKSE installed. }
;********/;

;/********p* CampPlaceableMiscItem/necessary_perk_name
* SYNTAX
*/;
string property necessary_perk_name auto
{
* DESCRIPTION
* Optional: The name of any required perk. Used if user does not have SKSE installed. }
;********/;

Event OnEquipped(Actor akActor)
	if PlayerCanPlaceObjects()
		if akActor == Game.GetPlayer()
			CampUtil.GetPlacementSystem().PlaceableObjectUsed(Required_this_item,           \
                                                              Required_placement_indicator, \
										  					  consumable_ingredient,		\
										  					  consumable_misc_item,			\
										  					  consumable_cost,				\
										  					  necessary_perk,               \
                                                              consumable_ingredient_name,   \
                                                              consumable_miscitem_name,     \
                                                              necessary_perk_name)
		endif
	endif
endEvent