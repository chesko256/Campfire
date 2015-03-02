Scriptname _Camp_TreeActivatorScript extends ObjectReference  

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

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		(my_wood_alias as _Camp_TreeAliasScript).Activated()
	endif
EndEvent

Event WoodActivatorReset()
	GoHome()
endEvent

;Can be called from Node Controller
function GoHome()
	my_wood_alias = None
	self.MoveTo(_Camp_WoodHarvestAnchor)
endFunction