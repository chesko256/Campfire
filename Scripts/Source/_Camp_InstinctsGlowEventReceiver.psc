scriptname _Camp_InstinctsGlowEventReceiver extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
	if asEventName == "Campfire_InstinctsStopSearch"
		((self as Form) as _Camp_InstinctsGlowScript).InstinctsStopSearch()
	endif
endFunction