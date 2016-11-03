scriptname _Frost_FallbackReceiverCoverageSystem extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  	if asEventName == "Frost_UpdateCoverage"
    	((self as Form) as _Frost_CoverageSystem).UpdateCoverage(pushedBools[0])
  	elseif asEventName == "Campfire_CampfirePerkPurchased"
  		((self as Form) as _Frost_CoverageSystem).CampfirePerkPurchased()
  	endif
endFunction