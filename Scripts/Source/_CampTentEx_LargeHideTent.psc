scriptname _CampTentEx_LargeHideTent extends CampTentEx

import CampUtil
import TentSystem

;@Overrides CampTent
function PlaceObject_Lantern3(CampTentEx Extended)
	if !IsRefInInterior(Game.GetPlayer())
		myLanternUnlit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = false, bHanging = true), Extended.PositionRef_Lantern3, z_hanging_offset = -36.4536, is_hanging = true, is_temp = is_temporary)
		myLanternLit3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLantern(bOn = true, bHanging = true), Extended.PositionRef_Lantern3, z_hanging_offset = -36.4536, is_hanging = true, initially_disabled = true, is_temp = is_temporary)
		myLanternLight3Future = PlacementSystem.PlaceObject(self, TentSystem.GetLanternLight(), Extended.PositionRef_Lantern3, initially_disabled = true, is_temp = is_temporary)
	endif
endFunction