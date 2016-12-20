scriptname CampUsableMiscItem extends ObjectReference

import CampUtil

;/********p* CampUsableMiscItem/activator_to_use
* SYNTAX
*/;
Activator property activator_to_use auto
{
* DESCRIPTION
* The activator that will spawn and immediately be used by the player when using this item. }
;*********/;

;/********p* CampUsableMiscItem/furniture_to_use
* SYNTAX
*/;
Furniture property furniture_to_use auto
{
* DESCRIPTION
* Required: The furniture that will spawn and immediately be used by the player when using this item. }
;*********/;

;/********p* CampUsableMiscItem/consumable_ingredient
* SYNTAX
*/;
Ingredient property consumable_ingredient auto
{
* DESCRIPTION
* Optional: An ingredient that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property. }
;********/;

;/********p* CampUsableMiscItem/consumable_misc_item
* SYNTAX
*/;
MiscObject property consumable_misc_item auto
{
* DESCRIPTION
* Optional: A misc item that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property. }
;********/;

;/********p* CampUsableMiscItem/consumable_cost
* SYNTAX
*/;
int property consumable_cost auto
{
* DESCRIPTION
* Optional: How many of the ingredients or misc items that will be consumed when this item is used / placed. }
;********/;

;/********p* CampUsableMiscItem/necessary_perk
* SYNTAX
*/;
Perk property necessary_perk auto
{
* DESCRIPTION
* Optional: A perk required to use / place this item. }
;********/;

;/********p* CampUsableMiscItem/consumable_ingredient_error
* SYNTAX
*/;
message property consumable_ingredient_error auto
{
* DESCRIPTION
* Optional: The error message displaying the name of the required ingredient. Must contain 1 numeric parameter (%.0f) for the ingredient cost. }
;********/;

;/********p* CampUsableMiscItem/consumable_miscitem_error
* SYNTAX
*/;
message property consumable_miscitem_error auto
{
* DESCRIPTION
* Optional: The error message displaying the name of the required misc item. Must contain 1 numeric parameter (%.0f) for the item cost. }
;********/;

;/********p* CampUsableMiscItem/necessary_perk_error
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
			CampUtil.GetPlacementSystem().UsableObjectUsed(activator_to_use, furniture_to_use, 	\
														   consumable_ingredient, 				\
														   consumable_misc_item,				\
														   consumable_cost,						\
														   necessary_perk,                      \
                                                           consumable_ingredient_error,         \
                                                           consumable_miscitem_error,           \
                                                           necessary_perk_error)
		endif
	endif
endEvent