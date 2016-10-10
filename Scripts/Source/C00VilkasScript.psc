Scriptname C00VilkasScript extends ReferenceAlias  

; -----

; updated by Enai Siaion

; -----

ObjectReference Property TrainingMarker Auto
Quest Property TrainingQuest Auto
ReferenceAlias Property Trainer Auto
Faction Property TrainingFaction Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor == Game.GetPlayer()
		If (akSource as Weapon) || ((akSource as Spell) && (akSource as Spell).IsHostile()) || (akSource as Scroll)
			CheckForTrainingStart()
		EndIf
	EndIf

EndEvent

; -----

Event OnEnterBleedout()

	CheckForTrainingStart()
	If GetOwningQuest().GetStage() <= 20
		(Trainer as C00TrainerScript).BleedoutChecks()
	Endif

EndEvent

; -----

Function CheckForTrainingStart()

	If GetOwningQuest().GetStage() == 20 && GetReference().GetDistance(TrainingMarker) < 1300
		If !TrainingQuest.IsRunning() && GetActorReference().GetCombatState() != 1
			Game.GetPlayer().AddToFaction(TrainingFaction)
			GetActorReference().AddToFaction(TrainingFaction)
			TrainingQuest.Start()
		EndIf
	EndIf

EndFunction

; -----