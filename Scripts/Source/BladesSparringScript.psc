Scriptname BladesSparringScript extends ReferenceAlias  

; -----

; updated by Enai Siaion

; -----

ReferenceAlias Property Opponent Auto

; -----

Import Game

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor != Opponent.GetRef()
		If (akSource as Weapon) || ((akSource as Spell) && (akSource as Spell).IsHostile()) || (akSource as Scroll)
			; hit by anyone but my opponent
			GetOwningQuest().SetStage(300)
		EndIf
	EndIf

EndEvent

; -----
