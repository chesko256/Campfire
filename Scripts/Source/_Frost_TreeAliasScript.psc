scriptname _Frost_TreeAliasScript extends ReferenceAlias

import math
import _CampInternal

Activator property _Camp_HarvestBranchTree_Node auto
Actor property PlayerRef auto
ObjectReference property woodref auto hidden
Formlist property _Camp_HarvestableBranchTrees auto

Event OnInit()
	woodref = self.GetRef()
	if woodref && !(Game.FindClosestReferenceOfTypeFromRef(_Camp_HarvestBranchTree_Node, woodref, 800.0))
		;debug.trace("[Campfire] Tree Alias " + self + " assigned new reference " + woodref)
		Handle_Tree(woodref)
	endif
EndEvent

;debug
spell property _Camp_BranchZTestSpell auto
Activator property _Camp_ZTestReceiver auto
;debug
function Handle_Tree(ObjectReference akReference)
	ObjectReference tr = self.getref().PlaceAtMe(_Camp_ZTestReceiver)
	;debug.trace("[Campfire] Firing...")
	tr.MoveTo(tr, afZOffset = -2000.0)
	_Camp_BranchZTestSpell.Cast(self.GetRef(), tr)
endFunction