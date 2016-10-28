scriptname _Frost_BoundCloakEventReceiver extends FallbackEventReceiverActiveMagicEffect

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  	if asEventName == "Frost_DispelBoundCloaks"
  		((self as ActiveMagicEffect) as _Frost_BoundCloakScript).DispelBoundCloaks()
  	endif
endFunction