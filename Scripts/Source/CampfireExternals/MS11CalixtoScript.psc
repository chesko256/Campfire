Scriptname MS11CalixtoScript extends ReferenceAlias  

Scene Property KillScene auto

Event OnDeath(Actor akKiller)
	if (GetOwningQuest().GetStage() == 130)
		(GetOwningQuest() as MS11QuestScript).CalixtoDead = true
		GetActorReference().BlockActivation(false)
		GetOwningQuest().SetStage(150)
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor == Game.GetPlayer())
		ResolvePlayerAttack()
	endif
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if (akCaster == Game.GetPlayer())
		ResolvePlayerAttack()
	endif
EndEvent


Function ResolvePlayerAttack()
	if (KillScene.IsPlaying())
		if (KillScene.IsActionComplete(7) && KillScene.IsActionComplete(8) && (GetOwningQuest() as MS11QuestScript).PlayerInMurderZone)
			KillScene.Stop()
		endif
	endif
EndFunction
