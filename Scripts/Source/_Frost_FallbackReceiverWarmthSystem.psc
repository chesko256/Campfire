scriptname _Frost_FallbackReceiverWarmthSystem extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  	if asEventName == "Frost_UpdateWarmth"
  		((self as Form) as _Frost_WarmthSystem).UpdateWarmth(pushedBools[0])
   	elseif asEventName == "Frost_SoupEffectStart"
    	((self as Form) as _Frost_WarmthSystem).SoupEffectStart()
    elseif asEventName == "Frost_SoupEffectStop"
    	((self as Form) as _Frost_WarmthSystem).SoupEffectStop()
    elseif asEventName == "Campfire_CampfirePerkPurchased"
    	((self as Form) as _Frost_WarmthSystem).CampfirePerkPurchased()
  	endif
endFunction
