scriptname _Camp_SearchQuest extends Quest

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

Event OnInit()
	RegisterForModEvent("Campfire_InstinctsStartSearch", "InstinctsStartSearch")
	RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
EndEvent

Event InstinctsStartSearch()
	debug.trace("Starting!")
	int i = 0
	while !IsReadyToStart() && i < 20
		Utility.Wait(0.2)
		i += 1
	endWhile
	self.Start()
	SendEvent_InstinctsRunAliases()
endEvent

Event InstinctsStopSearch()
	self.Stop()
endEvent

bool function IsReadyToStart()
	if Alias1.GetRef() ||	\
	   Alias2.GetRef() ||	\
	   Alias3.GetRef() ||	\
	   Alias4.GetRef() ||	\
	   Alias5.GetRef() ||	\
	   Alias6.GetRef() ||	\
	   Alias7.GetRef() ||	\
	   Alias8.GetRef() ||	\
	   Alias9.GetRef() ||	\
	   Alias10.GetRef()
	   	return false
	else
		return true
	endif
endFunction

function SendEvent_InstinctsRunAliases()
	int handle = ModEvent.Create("Campfire_InstinctsRunAliases")
	if handle
		ModEvent.Send(handle)
	endif
endFunction

_Camp_SearchAliasBase function SearchAlias(ReferenceAlias akAlias)
	return akAlias as _Camp_SearchAliasBase
endFunction