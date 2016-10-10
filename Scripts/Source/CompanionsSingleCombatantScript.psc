Scriptname CompanionsSingleCombatantScript extends ReferenceAlias  

; -----

; updated by Enai Siaion

; -----

Event OnEnterBleedOut()

	GetOwningQuest().SetStage(200)

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	; this is meant to respond only to magic
	If akAggressor == Game.GetPlayer()
		If ((akSource as Spell) && (akSource as Spell).IsHostile()) || (akSource as Scroll)
			GetOwningQuest().SetStage(150)
		EndIf
	EndIf

EndEvent

; -----