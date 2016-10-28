scriptname _Frost_OnConjuredObjectIDReceiver extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  	if asEventName == "Campfire_OnConjuredObjectIDUpdated"
  		(((self as Form) as ObjectReference) as _Camp_PlaceableObjectBase).OnConjuredObjectIDUpdated()
  	endif
endFunction