;/********s* ObjectReference/CampPlaceableMiscItem
* SCRIPTNAME
*/;
scriptname CampPlaceableMiscItem extends ObjectReference
;/*
* OVERVIEW
* Attach this script to a Misc Item that represents the inventory item of a Placeable Object.
;*********/;

import math
import CampUtil

;/********p* CampPlaceableMiscItem/Required_placement_indicator
* SYNTAX
*/;
Activator property Required_placement_indicator auto
;/*
* DESCRIPTION
{ Required: The object that will indicate to the player where to place this item. }
;*********/;

;/********p* CampPlaceableMiscItem/z_angle_offset
* SYNTAX
*/;
float property z_angle_offset auto
;/*
* DESCRIPTION
{ Adjust Z angle (compass rotation) of placed item. Use if placed item is at a different angle than the placement indicator. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_ingredient
* SYNTAX
*/;
Ingredient property consumable_ingredient auto
;/*
* DESCRIPTION
{ Optional: An ingredient that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_misc_item
* SYNTAX
*/;
MiscObject property consumable_misc_item auto
;/*
* DESCRIPTION
{ Optional: A misc item that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_cost
* SYNTAX
*/;
int property consumable_cost auto
;/*
* DESCRIPTION
{ Optional: How many of the ingredients or misc items that will be consumed when this item is used / placed. }
;********/;

;/********p* CampPlaceableMiscItem/necessary_perk
* SYNTAX
*/;
Perk property necessary_perk auto
;/*
* DESCRIPTION
{ Optional: A perk required to use / place this item. }
;********/;

Event OnEquipped(Actor akActor)
	if akActor == Game.GetPlayer()
		int handle = ModEvent.Create("Campfire_CampfireOnPlaceableObjectUsed")
		if handle
			ModEvent.PushForm(handle, Required_placement_indicator as Form)
			ModEvent.PushForm(handle, consumable_ingredient as Form)
			ModEvent.PushForm(handle, consumable_misc_item as Form)
			ModEvent.PushInt(handle, consumable_cost)
			ModEvent.PushForm(handle, necessary_perk as Form)
			ModEvent.Send(handle)
		endif
	endif
endEvent