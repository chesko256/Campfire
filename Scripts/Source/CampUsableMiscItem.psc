scriptname CampUsableMiscItem extends CampPlaceableMiscItem

import CampUtil

;/********p* CampUsableMiscItem/activator_to_use
* SYNTAX
*/;
Activator property activator_to_use auto
;/*
* DESCRIPTION
{ The activator that will spawn and immediately be used by the player when using this item. }
;*********/;

;/********p* CampUsableMiscItem/furniture_to_use
* SYNTAX
*/;
Furniture property furniture_to_use auto
;/*
* DESCRIPTION
{ Required: The furniture that will spawn and immediately be used by the player when using this item. }
;*********/;

Event OnEquipped(Actor akActor)
	if PlayerCanPlaceObjects()
		if akActor == Game.GetPlayer()
			CampUtil.GetPlacementSystem().UsableObjectUsed(activator_to_use, furniture_to_use, 	\
														   consumable_ingredient, 				\
														   consumable_misc_item,				\
														   consumable_cost,						\
														   necessary_perk)
		endif
	endif
endEvent