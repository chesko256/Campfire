Scriptname CampPlacementIndicator extends ObjectReference

import utility
import math
import debug
import CampUtil

_Camp_ObjectPlacementThreadManager property PlacementSystem auto hidden

Furniture property Required_furniture_to_place auto
{ Required: The Furniture object to place with this indicator. Fill only the furniture or the activator, not both. }
Activator property Required_activator_to_place auto
{ Required: The Activator object to place with this indicator. Fill only the furniture or the activator, not both. }
MiscObject property Required_inventory_item auto
{ Required: The Misc Item that starts this placement indicator. }

ingredient property required_ingredient auto hidden
miscobject property required_miscitem auto hidden
int property cost auto hidden

Event OnInit()
	PlacementSystem = CampUtil.GetPlacementSystem()	
	StartPlacement(self)
	RegisterForSingleUpdate(fUpdateSpeed)
endEvent

Event OnUpdate()
	bool keep_updating = PlacementSystem.PerformPlacement()
	if keep_updating
		RegisterForSingleUpdate(fUpdateSpeed)
	else
		self.Disable()
		self.Delete()
	endif
	;PlacementSystem.PerformPlacement(400.0, _DE_HeatSources_All, 1.0, -180.0, 400.0)
endEvent

function PerformPlacement(float fDistance, float fHeight = 1.0, float fRot = 0.0, float fHeatDist = 0.0, bool bLockToPlayer = false)
	
	
endFunction

