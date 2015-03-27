Scriptname DGIntimidateAliasScript extends ReferenceAlias  

Faction Property DGIntimidateFaction Auto

import game

Event OnUpdate()
; 	debug.trace("DGIntimidateAliasScript: OnUpdate")
	actor pActor = GetActorRef()
	if pActor.IsInCombat() == 0 && pActor.IsBleedingOut() == 0 && GetOwningQuest().GetStage() < 15 && GetOwningQuest().GetStage() > 20
; 		debug.trace(self + " is no longer in combat, ending quest")
		; end quest
		GetOwningQuest().SetStage(200)
	endif
endEvent

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; if the player hits with any weapon other than hands
	; don't do this if it's a Companion's radiant quest
		Actor pActor = GetActorRef()
		Actor pPlayer = GetPlayer()
		if (akAggressor == pPlayer) && ((GetOwningQuest() as DGIntimidateQuestScript).CR04Running == 0)
; 			debug.trace(self + " hit with weapon = " + akWeapon + ", Projectile = " + akProjectile)
			if akProjectile || (akWeapon && akWeapon != UnarmedWeapon)
; 				debug.trace(self + " hit with weapon or projectile - end Intimidate")
				pPlayer.RemoveFromFaction(DGIntimidateFaction)
				pActor.RemoveFromFaction(DGIntimidateFaction)
				pActor.StopCombat()
				pActor.SendAssaultAlarm()
				pActor.StartCombat(Game.GetPlayer())
				GetOwningQuest().SetStage(150)
			endif
		elseif ((GetOwningQuest() as DGIntimidateQuestScript).CR04Running == 0)
			; if hit by anybody else, end quest
; 			debug.trace(self + " hit by " +akAggressor + " with weapon or projectile - end Intimidate")
			GetOwningQuest().SetStage(150)
		endif
endEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	; if player hits with any magic effect
	; don't do this if it's a Companion's radiant quest
		if (akCaster == GetPlayer()) &&  ((GetOwningQuest() as DGIntimidateQuestScript).CR04Running == 0)
; 				debug.trace(self + " hit with magic - end Intimidate")
				GetOwningQuest().SetStage(150)
		endif 	
endEvent

Event OnEnterBleedout()
	GetOwningQuest().SetStage(15)
; 	Debug.Trace("Opponent entering bleedout.")
	GetActorReference().EvaluatePackage() ; to make sure the forcegreet happens
EndEvent

Weapon Property UnarmedWeapon  Auto  
