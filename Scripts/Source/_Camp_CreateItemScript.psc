Scriptname _Camp_CreateItemScript extends ActiveMagicEffect

import CampUtil

Furniture property _Camp_CraftingObject auto

Event OnInit()
	if PlayerCanPlaceObjects()
		CampUtil.GetPlacementSystem().UsableObjectUsed(none, _Camp_CraftingObject, none, none, 0, none)
	endif
endEvent