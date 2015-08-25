Scriptname DGIntimidatePlayerScript extends ReferenceAlias  

import game

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; if the player is hit with any weapon other than hands, or by anyone but the brawlers
	if akAggressor != Opponent.GetRef() && akAggressor != OpponentFriend.GetRef()
; 		debug.trace(self + " player hit by someone not in the brawl - end Intimidate")
		GetOwningQuest().SetStage(200)
	else
; 		debug.trace(self + " hit by brawl opponent with weapon = " + akWeapon + ", Projectile = " + akProjectile)
;		if akProjectile || (akWeapon && akWeapon != UnarmedWeapon)
; ;			debug.trace(self + " player hit with weapon or projectile - end Intimidate")
;			GetOwningQuest().SetStage(200)
;		endif
	endif

endEvent

;Event OnSpellCast(Form akSpell)
;	; if player casts any spell, except if he is on CR04
;	If ((GetOwningQuest() as DGIntimidateQuestScript).CR04Running == 0)
; ;		debug.trace(self + " Player casts spell - end Intimidate")
;		GetOwningQuest().SetStage(150)
;	EndIf
;EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	; if player is hit with any magic effect (not by himself)
	if akCaster != GetPlayer()
; 			debug.trace(self + " hit with magic - end Intimidate")
			GetOwningQuest().SetStage(150)
	endif
endEvent

Event OnEnterBleedout()
; 	Debug.Trace("player enters bleedout")
	GetOwningQuest().SetStage(180)
;	Opponent.GetActorReference().EvaluatePackage() ; 
;	if OpponentFriend
;		OpponentFriend.GetActorReference().EvaluatePackage() ; 
;	endif
EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  if Game.GetPlayer().IsInLocation(Opponent.GetActorRef().GetCurrentLocation()) == False
;     Debug.Trace(self + "Player has left opponent's location, shutting down")
    GetOwningQuest().SetStage(200)
  endIf
endEvent

Weapon Property UnarmedWeapon  Auto  


ReferenceAlias Property Opponent  Auto  
{opponent in the brawl}

ReferenceAlias Property OpponentFriend  Auto  
