Scriptname _Frost_WoodActivatorScript extends ObjectReference  

import _CampInternal
import CampUtil
import Utility

Actor property PlayerRef auto
ObjectReference property _Camp_WoodHarvestAnchor auto
ReferenceAlias property my_wood_alias auto hidden

Event OnInit()
	;@TODO: Register once per game load
	RegisterForModEvent("Campfire_WoodActivatorReset", "WoodActivatorReset")
EndEvent