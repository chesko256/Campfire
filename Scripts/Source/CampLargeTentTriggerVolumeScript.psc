scriptname CampLargeTentTriggerVolumeScript extends ObjectReference
{Attach this script to custom large tent trigger volume activators.}

import _CampInternal

ObjectReference property ParentTent auto hidden
{Assigned at runtime. The tent this trigger volume belongs to.}

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && ParentTent
		SetCurrentTent(ParentTent)
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		SetCurrentTent(None)
	endif
EndEvent

