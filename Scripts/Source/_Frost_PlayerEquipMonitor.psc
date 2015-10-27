scriptname _Frost_PlayerEquipMonitor extends ReferenceAlias

import FrostUtil

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	elseif akBaseObject as Armor
		if (akBaseObject as Armor).IsShield()
			SendEvent_ShieldEquipped(akBaseObject)
		endif
	endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	elseif akBaseObject as Armor
		if (akBaseObject as Armor).IsShield()
			SendEvent_ShieldEquipped(akBaseObject, false)
		endif
	endif
EndEvent

function SendEvent_UpdateWarmth()
	_FrostInternal.FrostDebug(0, "Sending event Frost_UpdateWarmth")
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_ShieldEquipped(Form akBaseObject, bool abEquipped = true)
	_FrostInternal.FrostDebug(0, "Sending event Frost_ShieldEquipped")
    int handle = ModEvent.Create("Frost_ShieldEquipped")
    if handle
    	ModEvent.PushForm(handle, akBaseObject)
    	ModEvent.PushBool(handle, abEquipped)
        ModEvent.Send(handle)
    endif
endFunction
