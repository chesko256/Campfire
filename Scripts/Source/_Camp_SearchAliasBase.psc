scriptname _Camp_SearchAliasBase extends ReferenceAlias

bool property running = false auto hidden

Event OnInit()
	debug.trace("[Campfire] " + self + " initializing!")
	RegisterForModEvent("Campfire_InstinctsRunAliases", "InstinctsRunAliases")
	RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
EndEvent

Event InstinctsRunAliases()	
	debug.trace("[Campfire] " + self + " running!")
	running = true
endEvent

Event InstinctsStopSearch()
	self.Clear()
	debug.trace("[Campfire] " + self + " shut down.")
	running = false
endEvent
