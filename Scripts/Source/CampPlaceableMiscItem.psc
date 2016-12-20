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

;/********p* CampPlaceableMiscItem/consumable_ingredient_error
* SYNTAX
*/;
message property consumable_ingredient_error auto
{
* DESCRIPTION
* Optional: The error message displaying the name of the required ingredient. Must contain 1 numeric parameter (%.0f) for the ingredient cost. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_miscitem_error
* SYNTAX
*/;
message property consumable_miscitem_error auto
{
* DESCRIPTION
* Optional: The error message displaying the name of the required misc item. Must contain 1 numeric parameter (%.0f) for the item cost. }
;********/;

;/********p* CampPlaceableMiscItem/necessary_perk_error
* SYNTAX
*/;
message property necessary_perk_error auto
{
* DESCRIPTION
* Optional: The error message displaying the name of the required perk. }
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
                                                              consumable_ingredient_error,   \
                                                              consumable_miscitem_error,     \
                                                              necessary_perk_error)
		endif
	endif
endEvent