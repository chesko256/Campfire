scriptname _CampTentEx_LargeHideTent extends CampTentEx

import CampUtil
import TentSystem

;@Overrides CampTent
function PlaceTentObject_Lantern3(CampTentEx Extended)
	if !IsRefInInterior(Game.GetPlayer())
		myLanternUnlit3Future = ObjectPlacementSystem.PlaceTentObjectAsync(self, TentSystem.GetLantern(bOn = false, bHanging = true), Extended.PositionRef_Lantern3, z_hanging_offset = -36.4536, is_hanging = true)
		myLanternLit3Future = ObjectPlacementSystem.PlaceTentObjectAsync(self, TentSystem.GetLantern(bOn = true, bHanging = true), Extended.PositionRef_Lantern3, z_hanging_offset = -36.4536, is_hanging = true, initially_disabled = true)
		myLanternLight3Future = ObjectPlacementSystem.PlaceTentObjectAsync(self, TentSystem.GetLanternLight(), Extended.PositionRef_Lantern3, initially_disabled = true)
	endif
endFunction