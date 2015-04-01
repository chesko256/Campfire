scriptname _Camp_PlayerHitMonitor extends ReferenceAlias

import CampUtil

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	RaiseEvent_PlayerHit(akAggressor, akSource, akProjectile)
EndEvent

function RaiseEvent_PlayerHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile)
	GetPlacementSystem().PlayerHitEvent(akAggressor, akSource, akProjectile)
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