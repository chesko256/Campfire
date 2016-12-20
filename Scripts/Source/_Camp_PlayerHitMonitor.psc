scriptname _Camp_PlayerHitMonitor extends ReferenceAlias

import CampUtil

ObjectReference property FireLightingReference auto hidden

bool event_debounce = false

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if !event_debounce
		event_debounce = true
		SendEvent_PlayerHit(akAggressor, akSource, akProjectile)
		Utility.Wait(3)
		event_debounce = false
	endif
EndEvent

function SendEvent_PlayerHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile)
	GetPlacementSystem().PlayerHitEvent(akAggressor, akSource, akProjectile)
	GetTentSystem().PlayerHitEvent(akAggressor, akSource, akProjectile)
	if FireLightingReference
		(FireLightingReference as _Camp_LightFireFurnScript).PlayerHitEvent(akAggressor, akSource, akProjectile)
	endif
	FallbackEventEmitter emitter = GetEventEmitter_PlayerHit()
	int handle = emitter.Create("Campfire_PlayerHit")
	if handle
		emitter.PushForm(handle, akAggressor as Form)
		emitter.PushForm(handle, akSource)
		emitter.PushForm(handle, akProjectile as Form)
		emitter.Send(handle)
	endif
endFunction