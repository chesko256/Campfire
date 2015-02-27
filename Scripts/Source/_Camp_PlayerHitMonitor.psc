scriptname _Camp_PlayerHitMonitor extends ReferenceAlias

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	RaiseEvent_PlayerHit(akAggressor as Form, akSource, akProjectile as Form)
EndEvent

function RaiseEvent_PlayerHit(Form akAggressor, Form akSource, Form akProjectile)
	int handle = ModEvent.Create("Campfire_PlayerHit")
	if handle
		ModEvent.PushForm(handle, akAggressor)
		ModEvent.PushForm(handle, akSource)
		ModEvent.PushForm(handle, akProjectile)
		ModEvent.Send(handle)
	endif
endFunction