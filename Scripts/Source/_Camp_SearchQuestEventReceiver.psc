scriptname _Camp_SearchQuestEventReceiver extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
	if asEventName == "Campfire_InstinctsStartSearch"
		((self as Form) as _Camp_SearchQuest).InstinctsStartSearch()
	elseif asEventName == "Campfire_InstinctsStopSearch"
		((self as Form) as _Camp_SearchQuest).InstinctsStopSearch()
	endif
endFunction