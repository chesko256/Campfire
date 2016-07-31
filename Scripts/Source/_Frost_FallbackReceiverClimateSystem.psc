scriptname _Frost_FallbackReceiverClimateSystem extends FallbackEventReceiverForm

function RaiseEvent(String asEventName, Bool[] pushedBools, Int[] pushedInts, Float[] pushedFloats, Form[] pushedForms, String[] pushedStrings)
  if asEventName == "Frost_OnTamrielRegionChange"
    ((self as Form) as _Frost_ClimateSystem).OnTamrielRegionChange(pushedInts[0], pushedBools[0])
  endif
endFunction
