scriptname _Camp_InstinctsCtrlEventReceiver extends FallbackEventReceiverActiveMagicEffect

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
	if asEventName == "Campfire_PlayerHit"
		((self as ActiveMagicEffect) as _Camp_InstinctsController).PlayerHit(pushedForms[0], pushedForms[1], pushedForms[2])
	endif
endFunction