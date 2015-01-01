Scriptname _DE_ShelterDetectSensorScript extends ObjectReference

ObjectReference property _DE_ShelterDetectOrigin auto
Spell property _DE_ShelterDetectBeam auto
GlobalVariable property _DE_fShelterTime auto
GlobalVariable property _DE_fLastShelterTime auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if akSource == _DE_ShelterDetectBeam
		;debug.trace("[Frostfall] SHELTER UPDATE HIT!")
		GoToState("GotHit")
		_DE_fShelterTime.SetValue(Game.GetRealHoursPassed())
		utility.Wait(1.0)
		GoToState("")
	endif
endEvent

State GotHit
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;do nothing
	endEvent
endState