Scriptname DGIntimidatePlayerScript extends ReferenceAlias  

; -----

; updated by Enai Siaion

; -----

Weapon Property UnarmedWeapon Auto
ReferenceAlias Property Opponent Auto  
{opponent in the brawl}
ReferenceAlias Property OpponentFriend Auto

; -----

Import Game

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor != Opponent.GetRef() && akAggressor != OpponentFriend.GetRef()
		; hit by something else
		; note that the opponent can hit you with anythng they want

		If (akSource as Weapon) || ((akSource as Spell) && (akSource as Spell).IsHostile())
			; weapon hits
			; hostile spells (including shouts)

			; abandon ship
			GetOwningQuest().SetStage(200)
		EndIf
	EndIf

EndEvent

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell)
		Actor PlayerRef = GetPlayer()
		If (PlayerRef.GetEquippedSpell(0) == (akSpell as Spell) || PlayerRef.GetEquippedSpell(1) == (akSpell as Spell))
			; cast a spell from your hands

			If (akSpell as Spell).IsHostile()
		;		; you want a real fight, eh?
		;		GetOwningQuest().SetStage(150)
		; handled by opponent in brawl if you hit them with it - 1.03
			Else
				; not so tough now, are you?
				GetOwningQuest().SetStage(180)
			EndIf
		EndIf
	ElseIf (akSpell as Ingredient) || (akSpell as Potion)
		; used alchemy

		; not so tough now, are you?
		GetOwningQuest().SetStage(180)
	EndIf

EndEvent

; -----

Event OnEnterBleedout()

	; suck more noob
	GetOwningQuest().SetStage(180)

EndEvent

; -----

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	; player walked away
	If !GetPlayer().IsInLocation(Opponent.GetActorRef().GetCurrentLocation())
		; abandon ship
		GetOwningQuest().SetStage(200)
	EndIf

EndEvent

; -----
