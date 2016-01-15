scriptname _Camp_LightFireFurnScript extends ObjectReference

ReferenceAlias property _Camp_PlayerAlias auto
ObjectReference property parent_campfire auto hidden
float property total_required_seconds auto hidden
float remaining_required_seconds
float old_percentage = 1.0

Event OnActivate(ObjectReference akActionRef)
	(_Camp_PlayerAlias as _Camp_PlayerHitMonitor).FireLightingReference = self
	remaining_required_seconds = total_required_seconds
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	remaining_required_seconds -= 1.0
	float percentage = (remaining_required_seconds / total_required_seconds)
	
	if was_hit
		TakeDown()
	endif

	if self.IsFurnitureInUse()	
		if percentage <= 0.33 && old_percentage > 0.33
			(parent_campfire as CampCampfire).mySteam.Enable()
			RegisterForSingleUpdate(1)
		elseif percentage <= 0.0
			(parent_campfire as CampCampfire).mySteam.Disable()
			(parent_campfire as CampCampfire).LightFire()
			; Advance camping skill
			TakeDown()
		else
			RegisterForSingleUpdate(1)
		endif
	endif
	old_percentage = percentage
EndEvent

bool was_hit = false
function PlayerHitEvent(ObjectReference akAggressor, Form akSource, Projectile akProjectile)
    was_hit = true
endFunction

function TakeDown()
	(_Camp_PlayerAlias as _Camp_PlayerHitMonitor).FireLightingReference = none
	parent_campfire = none
	self.Disable()
	self.Delete()
endFunction