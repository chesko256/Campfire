scriptname CampLargeTentTriggerVolumeScript extends ObjectReference
{Attach this script to custom large tent trigger volume activators.}

import _CampInternal
import CampUtil

ObjectReference property ParentTent auto hidden
{Assigned at runtime. The tent this trigger volume belongs to.}

Event OnTriggerEnter(ObjectReference akActionRef)
	if ParentTent
		SetCurrentTent(ParentTent)
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	SetCurrentTent(None)
EndEvent
