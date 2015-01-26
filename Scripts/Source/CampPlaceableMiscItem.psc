scriptname CampPlaceableMiscItem extends ObjectReference

import math
import CampUtil

Activator property Required_placement_indicator auto
{Required: The object that will indicate to the player where to place this item.}

MiscObject property Required_self auto
{Required: Fill this property with the base object this script is attached to (Reason: Cannot reliably be determined at runtime.)}

float property z_position_offset auto
{Adjust far up or down from the indicated position to place this item. Use if placed item is always above or below placement indicator position.}

float property z_angle_offset auto
{Adjust Z angle (compass rotation) of placed item. Use if placed item is at a different angle than the placement indicator.}

Ingredient property consumable_ingredient auto
{Optional: An ingredient that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property.}

MiscObject property consumable_misc_item auto
{Optional: A misc item that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property.}

int property consumable_cost auto
{Optional: How many of the ingredients or misc items that will be consumed when this item is used / placed.}

Perk property necessary_perk auto
{Optional: A perk required to use / place this item.}

Event OnEquipped(Actor akActor)
	if akActor == Game.GetPlayer()
		RaiseEvent_CampfireOnPlaceableObjectUsed(Required_self, Required_placement_indicator as Form)
	endif
endEvent