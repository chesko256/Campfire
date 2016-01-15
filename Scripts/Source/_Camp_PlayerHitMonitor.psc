scriptname _Camp_PlayerHitMonitor extends ReferenceAlias

import CampUtil

ObjectReference property FireLightingReference auto hidden

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	SendEvent_PlayerHit(akAggressor, akSource, akProjectile)
EndEvent

function SendEvent_PlayerHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile)
	GetPlacementSystem().PlayerHitEvent(akAggressor, akSource, akProjectile)
	GetTentSystem().PlayerHitEvent(akAggressor, akSource, akProjectile)
	if FireLightingReference
		(FireLightingReference as _Camp_LightFireFurnScript).PlayerHitEvent(akAggressor, akSource, akProjectile)
	endif
	if GetCompatibilitySystem().isSKSELoaded
		int handle = ModEvent.Create("Campfire_PlayerHit")
		if handle
			ModEvent.PushForm(handle, akAggressor as Form)
			ModEvent.PushForm(handle, akSource)
			ModEvent.PushForm(handle, akProjectile as Form)
			ModEvent.Send(handle)
		endif
	endif
endFunction