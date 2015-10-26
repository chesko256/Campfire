scriptname _Frost_PlayerEquipMonitor extends ReferenceAlias

import FrostUtil

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	endif
EndEvent

function SendEvent_UpdateWarmth()
	_FrostInternal.FrostDebug(0, "Sending event Frost_UpdateWarmth")
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
endFunction