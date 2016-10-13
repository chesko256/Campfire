Scriptname MS11CalixtoScript extends ReferenceAlias  

; -----

; updated by Enai Siaion

; -----

Scene Property KillScene Auto

; -----

Event OnDeath(Actor akKiller)

	If (GetOwningQuest().GetStage() == 130)
		(GetOwningQuest() as MS11QuestScript).CalixtoDead = true
		GetActorReference().BlockActivation(false)
		GetOwningQuest().SetStage(150)
	EndIf

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor == Game.GetPlayer()
		If (akSource as Weapon) || ((akSource as Spell) && (akSource as Spell).IsHostile()) || (akSource as Scroll)
			; player hit the target with something hostile
			ResolvePlayerAttack()
		EndIf
	EndIf

EndEvent

; -----

Function ResolvePlayerAttack()

	If KillScene.IsPlaying()
		If (KillScene.IsActionComplete(7) && KillScene.IsActionComplete(8) && (GetOwningQuest() as MS11QuestScript).PlayerInMurderZone)
			KillScene.Stop()
		EndIf
	EndIf

EndFunction

; -----