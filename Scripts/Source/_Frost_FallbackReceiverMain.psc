scriptname _Frost_FallbackReceiverMain extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  	if asEventName == "Frost_StartFrostfall"
  		((self as Form) as _Frost_Main).StartFrostfall(pushedBools[0])
   	elseif asEventName == "Frost_StopFrostfall"
    	((self as Form) as _Frost_Main).StopFrostfall()
  	endif
endFunction