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

;/********p* CampUsableMiscItem/consumable_ingredient_name
* SYNTAX
*/;
string property consumable_ingredient_name auto
{
* DESCRIPTION
* Optional: The name of any required ingredient. Used if user does not have SKSE installed. }
;********/;

;/********p* CampUsableMiscItem/consumable_miscitem_name
* SYNTAX
*/;
string property consumable_miscitem_name auto
{
* DESCRIPTION
* Optional: The name of any required misc item. Used if user does not have SKSE installed. }
;********/;

;/********p* CampUsableMiscItem/necessary_perk_name
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
			CampUtil.GetPlacementSystem().UsableObjectUsed(activator_to_use, furniture_to_use, 	\
														   consumable_ingredient, 				\
														   consumable_misc_item,				\
														   consumable_cost,						\
														   necessary_perk,                      \
                                                           consumable_ingredient_name,          \
                                                           consumable_miscitem_name,            \
                                                           necessary_perk_name)
		endif
	endif
endEvent