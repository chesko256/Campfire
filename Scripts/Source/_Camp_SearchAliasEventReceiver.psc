scriptname _Camp_SearchAliasEventReceiver extends FallbackEventReceiverAlias

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
	if asEventName == "Campfire_InstinctsRunAliases"
		((self as Alias) as _Camp_SearchAliasBase).InstinctsRunAliases()
	elseif asEventName == "Campfire_InstinctsStopSearch"
		((self as Alias) as _Camp_SearchAliasBase).InstinctsStopSearch()
	endif
endFunction