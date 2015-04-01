Scriptname _Camp_DebugSpouseAliasScript extends ReferenceAlias  

import _CampInternal

Event OnInit()
	CampDebug(0, "Filled spouse alias with " + self.GetActorRef())
EndEvent