scriptname _Camp_SearchAliasBase extends ReferenceAlias

import CampUtil

Actor property PlayerRef auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto
_Camp_ConditionValues property Conditions auto
bool property initialized = false auto hidden

Event OnInit()
	;debug.trace("[Campfire] " + self.GetRef() + " initializing!")
	if GetSKSELoaded()
		FallbackEventEmitter runAliasEmitter = GetEventEmitter_InstinctsRunAliases()
		FallbackEventEmitter stopSearchEmitter = GetEventEmitter_InstinctsStopSearch()
		runAliasEmitter.RegisterAliasForModEventWithFallback("Campfire_InstinctsRunAliases", "InstinctsRunAliases", self as Alias)
		stopSearchEmitter.RegisterAliasForModEventWithFallback("Campfire_InstinctsStopSearch", "InstinctsStopSearch", self as Alias)
		initialized = true
	endif
EndEvent

Event InstinctsRunAliases()
	;debug.trace("[Campfire]" + self + " InstinctsRunAliases received.")
	float detection_distance = 2048.0 + (_Camp_PerkRank_KeenSenses.GetValueInt() * 1024.0)
	if Conditions.IsPlayerInInterior
		detection_distance /= 2
	endif
	ObjectReference ref = self.GetRef()
	if ref && PlayerRef.GetDistance(ref) <= detection_distance
		;debug.trace("[Campfire] " + ref + " running!")
		AliasStart(ref)
	else
		;debug.trace("[Campfire] " + ref + " is none or too far away.")
	endif
endEvent

Event InstinctsStopSearch()
	initialized = false
	AliasStop(self.GetRef())
	;debug.trace("[Campfire] " + self.GetRef() + " shut down.")
endEvent

function AliasStart(ObjectReference akReference)
	;extend
endFunction

function AliasStop(ObjectReference akReference)
	;extend
endFunction
