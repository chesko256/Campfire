scriptname _Frost_FallbackReceiverWarmthSystem extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  if asEventName == "Frost_UpdateWarmth"
    ((self as Form) as _Frost_WarmthSystem).UpdateWarmth()
  endif
endFunction
