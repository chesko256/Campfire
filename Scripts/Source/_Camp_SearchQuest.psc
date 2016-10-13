scriptname _Camp_SearchQuest extends Quest

import CampUtil

ReferenceAlias property Alias1 auto
ReferenceAlias property Alias2 auto
ReferenceAlias property Alias3 auto
ReferenceAlias property Alias4 auto
ReferenceAlias property Alias5 auto
ReferenceAlias property Alias6 auto
ReferenceAlias property Alias7 auto
ReferenceAlias property Alias8 auto
ReferenceAlias property Alias9 auto
ReferenceAlias property Alias10 auto

Event InstinctsStartSearch()
	self.Start()
	WaitUntilReady()
	SendEvent_InstinctsRunAliases()
endEvent

Event InstinctsStopSearch()
	self.Stop()
endEvent

function WaitUntilReady()
	int i = 0
	while !IsReadyToStart() && i < 20
		Utility.Wait(0.2)
		i += 1
	endWhile
endFunction

bool function IsReadyToStart()
	if SearchAlias(Alias1).initialized &&	\
	   SearchAlias(Alias2).initialized &&	\
	   SearchAlias(Alias3).initialized &&	\
	   SearchAlias(Alias4).initialized &&	\
	   SearchAlias(Alias5).initialized &&	\
	   SearchAlias(Alias6).initialized &&	\
	   SearchAlias(Alias7).initialized &&	\
	   SearchAlias(Alias8).initialized &&	\
	   SearchAlias(Alias9).initialized &&	\
	   SearchAlias(Alias10).initialized
	   	return true
	else
		return false
	endif
endFunction

function SendEvent_InstinctsRunAliases()
	FallbackEventEmitter emitter = GetEventEmitter_InstinctsRunAliases()
	int handle = emitter.Create("Campfire_InstinctsRunAliases")
	if handle
		emitter.Send(handle)
	endif
endFunction

_Camp_SearchAliasBase function SearchAlias(ReferenceAlias akAlias)
	return akAlias as _Camp_SearchAliasBase
endFunction