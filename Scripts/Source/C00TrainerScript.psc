Scriptname C00TrainerScript extends ReferenceAlias  

; -----

; updated by Enai Siaion

; -----

Int NumHits = 0

; -----

;Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

;	if (Game.GetPlayer() == akCaster)
;		GetOwningQuest().SetStage(100)
;	endif

;EndEvent

; -----

Event OnEnterBleedout()

	BleedoutChecks()

EndEvent

; -----

Function BleedoutChecks()

	If !GetOwningQuest().IsRunning()
		Return
	Else
		Int CurrStage = GetOwningQuest().GetStage()
		If CurrStage != 100 && CurrStage != 110
			; if not already doing something else
			GetOwningQuest().SetStage(125)
		EndIf
	EndIf

EndFunction

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor == Game.GetPlayer()
		; player hit actor with hostile magic
		If ((akSource as Spell) && (akSource as Spell).IsHostile()) || (akSource as Scroll)
			GetOwningQuest().SetStage(100)
		ElseIf (!akSource as Explosion && !akSource as Enchantment)
			NumHits += 1
			If numHits >= 3
				GetOwningQuest().SetStage(150)
			EndIf
		EndIf
	Else
		; someone else hit actor with a hostile attack
		If (akSource as Weapon) || ((akSource as Spell) && (akSource as Spell).IsHostile())
			GetOwningQuest().SetStage(110)
		EndIf
	EndIf

EndEvent

; -----

Function ResetHits()

	NumHits = 0

EndFunction

; -----