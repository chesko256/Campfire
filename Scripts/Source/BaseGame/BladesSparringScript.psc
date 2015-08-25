Scriptname BladesSparringScript extends ReferenceAlias  

import game

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; if I'm hit by anybody but my opponent, stop quest
	if akAggressor != Opponent.GetRef()
; 		debug.trace(self + " hit by someone besides my opponent - end sparring")
		GetOwningQuest().SetStage(300)
	endif
endEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	debug.trace(self + "OnMagicEffectApply akCaster=" + akCaster)
	; if hit by anybody but opponent
	if akCaster != Opponent.GetRef() && akCaster != GetRef()
; 		debug.trace(self + " hit by someone besides my opponent - end sparring")
		GetOwningQuest().SetStage(300)
	endif 	
endEvent

ReferenceAlias Property Opponent  Auto

