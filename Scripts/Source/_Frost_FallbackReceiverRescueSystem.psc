scriptname _Frost_FallbackReceiverRescueSystem extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  	if asEventName == "Frost_OnRescuePlayer"
  		((self as Form) as _Frost_RescueSystem).OnRescuePlayer(pushedBools[0])
  	endif
endFunction