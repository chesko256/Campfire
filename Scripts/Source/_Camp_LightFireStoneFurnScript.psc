scriptname _Camp_LightFireStoneFurnScript extends ObjectReference

ObjectReference property parent_campfire auto hidden
float property total_required_seconds auto hidden
float remaining_required_seconds
float old_percentage = 1.0

Event OnActivate(ObjectReference akActionRef)
	remaining_required_seconds = total_required_seconds
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	remaining_required_seconds -= 1.0
	float percentage = (remaining_required_seconds / total_required_seconds)
	
	if self.IsFurnitureInUse()	
		if percentage <= 0.33 && old_percentage > 0.33
			(parent_campfire as CampCampfire).mySteam.Enable()
			RegisterForSingleUpdate(1)
		elseif percentage <= 0.0
			(parent_campfire as CampCampfire).mySteam.Disable()
			(parent_campfire as CampCampfire).LightFire()
			; Advance camping skill
		else
			RegisterForSingleUpdate(1)
		endif
	endif
	old_percentage = percentage
EndEvent