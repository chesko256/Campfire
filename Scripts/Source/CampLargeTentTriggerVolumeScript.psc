scriptname CampLargeTentTriggerVolumeScript extends ObjectReference
{Attach this script to custom large tent trigger volume activators.}

import CampUtil
import _CampInternal

ObjectReference property ParentTent auto hidden
{Assigned at runtime. The tent this trigger volume belongs to.}

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && ParentTent
		SetCurrentTent(ParentTent)
	endif
	if GetCompatibilitySystem().isSKSELoaded
		SendEvent_OnTentEnter()
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		SetCurrentTent(None)
	endif
	if GetCompatibilitySystem().isSKSELoaded
		SendEvent_OnTentLeave()
	endif
EndEvent

function SendEvent_OnTentEnter()
	CampDebug(0, "Sending event Campfire_OnTentEnter")
	; * Event OnTentEnter(Form akTent)
	; * akTent: The tent ObjectReference entered.
    int handle = ModEvent.Create("Campfire_OnTentEnter")
    if handle
    	ModEvent.PushForm(handle, ParentTent)
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_OnTentLeave()
	CampDebug(0, "Sending event Campfire_OnTentLeave")
	; * Event OnTentLeave(Form akTent)
	; * akTent: The tent ObjectReference left.
    int handle = ModEvent.Create("Campfire_OnTentLeave")
    if handle
    	ModEvent.PushForm(handle, ParentTent)
        ModEvent.Send(handle)
    endif
endFunction