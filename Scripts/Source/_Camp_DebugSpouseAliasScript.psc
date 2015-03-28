Scriptname _Camp_DebugSpouseAliasScript extends ReferenceAlias  

Event OnInit()
	debug.trace("[Campfire] Filled spouse alias with " + self.GetActorRef())
EndEvent