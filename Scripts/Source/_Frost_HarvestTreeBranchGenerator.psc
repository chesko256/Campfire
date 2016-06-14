Scriptname _Frost_HarvestTreeBranchGenerator extends ObjectReference  

import _CampInternal
Activator property _Camp_HarvestBranchTree_Node auto

Event OnInit()
	ObjectReference my_node = self.PlaceAtMe(_Camp_HarvestBranchTree_Node, abInitiallyDisabled = true)
	my_node.MoveTo(my_node, afZOffset = -5.0)
	my_node.SetAngle(0.0, 0.0, utility.randomfloat(0.0, 359.0))
	my_node.SetScale(0.4)
	my_node.EnableNoWait(true)
	(my_node as _Camp_BranchTreeHarvestNodeController).Setup()
endEvent