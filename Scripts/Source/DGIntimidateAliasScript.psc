Scriptname DGIntimidateAliasScript extends ReferenceAlias  

; -----

; updated by Enai Siaion

; -----

Faction Property DGIntimidateFaction Auto
Weapon Property UnarmedWeapon Auto
Import Game

; -----

Event OnUpdate()

	; this used to contain a condition that was always false, checking if the owning quest stage is < 15 AND > 20
	; blanked out

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

		Actor TheActor = GetActorRef()
		Actor ThePlayer = GetPlayer()

		If akAggressor == ThePlayer && ((GetOwningQuest() as DGIntimidateQuestScript).CR04Running == 0)
			; only count the player

			If (akSource as Weapon && akSource != UnarmedWeapon) || ((akSource as Spell) && (akSource as Spell).IsHostile()) || (akSource as Scroll)
				; weapon hits but not actual punches
				; hostile spells (including shouts)
				; scrolls

				ThePlayer.RemoveFromFaction(DGIntimidateFaction)
				TheActor.RemoveFromFaction(DGIntimidateFaction)
				TheActor.StopCombat()
				TheActor.SendAssaultAlarm()
				TheActor.StartCombat(ThePlayer)
				GetOwningQuest().SetStage(150)

			; note - enchantments are not checked because it is not possible to quickly distinguish between armor and weapon enchantments

			EndIf

		EndIf

EndEvent

; -----

Event OnEnterBleedout()

	; well done rocky
	GetOwningQuest().SetStage(15)
	GetActorReference().EvaluatePackage() ; to make sure the forcegreet happens

EndEvent

; -----