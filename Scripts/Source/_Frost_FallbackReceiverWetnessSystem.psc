scriptname _Frost_FallbackReceiverWetnessSystem extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  	if asEventName == "Frostfall_OnPlayerStartSwimming"
    	((self as Form) as _Frost_WetnessSystem).OnPlayerStartSwimming()
  	elseif asEventName == "Frostfall_OnPlayerStopSwimming"
  		((self as Form) as _Frost_WetnessSystem).OnPlayerStopSwimming()
  	endif
endFunction