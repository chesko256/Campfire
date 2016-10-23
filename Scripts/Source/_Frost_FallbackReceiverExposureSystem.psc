scriptname _Frost_FallbackReceiverExposureSystem extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  	if asEventName == "Frost_OnInnerFireMeditate"
    	((self as Form) as _Frost_ExposureSystem).OnInnerFireMeditate(pushedBools[0])
  	elseif asEventName == "Campfire_CampfirePerkPurchased"
  		((self as Form) as _Frost_ExposureSystem).CampfirePerkPurchased()
  	endif
endFunction