Scriptname C00VilkasScript extends ReferenceAlias  

ObjectReference Property TrainingMarker auto
Quest Property TrainingQuest auto
ReferenceAlias Property Trainer auto ; on training quest
Faction Property TrainingFaction auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor == Game.GetPlayer())
		CheckForTrainingStart()
	endif
EndEvent

Event OnEnterBleedout()
	CheckForTrainingStart()
	if (GetOwningQuest().GetStage() <= 20)
		(Trainer as C00TrainerScript).BleedoutChecks()
	endif
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if (akCaster == Game.GetPlayer())
		CheckForTrainingStart()
	endif
EndEvent

Function CheckForTrainingStart()
	if ((GetOwningQuest().GetStage() == 20) && (GetReference().GetDistance(TrainingMarker) < 1300))
		if ((!TrainingQuest.IsRunning()) && (GetActorReference().GetCombatState() != 1))
; 			Debug.Trace("C00: Player hit Vilkas; starting training.")
			Game.GetPlayer().AddToFaction(TrainingFaction)
			GetActorReference().AddToFaction(TrainingFaction)
			TrainingQuest.Start()
		endif
	endif
EndFunction

