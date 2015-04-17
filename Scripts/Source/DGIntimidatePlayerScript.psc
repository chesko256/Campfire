Scriptname DGIntimidatePlayerScript extends ReferenceAlias  

;Faction Property DGIntimidateFaction Auto
;Keyword[] Property MagicEffectArray Auto
{ Array of Keywords to check for. Array traversal is > 1000x faster than using FLSTs, so should stay as an Array, despite FLST's convenience.
Only if the magic effect keyword from this list is cast by the player will the opponent consider it cheating.
}
Keyword[] MagicEffectArray

import game

Event OnInit()
{	Keyword avoids enchantments for obvious reasons. Should leave that up to a mod which requires
you take off any enchanted items before brawling. Any hostile/detrimental spells cast onto the
opponent are handled in DGIntimidateAliasScript. 
}
	MagicEffectArray = new Keyword[27]
	MagicEffectArray[4] = (GetFormFromFile(0x0001CEB0, "Skyrim.esm") as Keyword) ; MagicRestoreHealth
	MagicEffectArray[3] = (GetFormFromFile(0x0001EA69, "Skyrim.esm") as Keyword) ; MagicWard
	MagicEffectArray[9] = (GetFormFromFile(0x0001EA6F, "Skyrim.esm") as Keyword) ; MagicInvisibility
	MagicEffectArray[10] = (GetFormFromFile(0x0001EA72, "Skyrim.esm") as Keyword) ; MagicArmorSpell
	MagicEffectArray[8] = (GetFormFromFile(0x00024823, "Skyrim.esm") as Keyword) ; MagicSummonFire
	MagicEffectArray[6] = (GetFormFromFile(0x00024829, "Skyrim.esm") as Keyword) ; MagicSummonFrost
	MagicEffectArray[5] = (GetFormFromFile(0x0002482A, "Skyrim.esm") as Keyword) ; MagicSummonShock
	MagicEffectArray[2] = (GetFormFromFile(0x0002482B, "Skyrim.esm") as Keyword) ; MagicSummonUndead
	MagicEffectArray[12] = (GetFormFromFile(0x00042503, "Skyrim.esm") as Keyword) ; MagicAlchRestoreHealth
	MagicEffectArray[11] = (GetFormFromFile(0x00042504, "Skyrim.esm") as Keyword) ; MagicAlchRestoreStamina
	MagicEffectArray[14] = (GetFormFromFile(0x00042508, "Skyrim.esm") as Keyword) ; MagicAlchRestoreMagicka
	MagicEffectArray[0] = (GetFormFromFile(0x00046B99, "Skyrim.esm") as Keyword) ; MagicShout
	MagicEffectArray[23] = (GetFormFromFile(0x00065A23, "Skyrim.esm") as Keyword) ; MagicAlchFortifyHeavyArmor
	MagicEffectArray[22] = (GetFormFromFile(0x00065A24, "Skyrim.esm") as Keyword) ; MagicAlchFortifyLightArmor
	MagicEffectArray[16] = (GetFormFromFile(0x00065A30, "Skyrim.esm") as Keyword) ; MagicAlchFortifyHealRate
	MagicEffectArray[21] = (GetFormFromFile(0x00065A31, "Skyrim.esm") as Keyword) ; MagicAlchFortifyHealth
	MagicEffectArray[20] = (GetFormFromFile(0x00065A32, "Skyrim.esm") as Keyword) ; MagicAlchFortifyStamina
	MagicEffectArray[19] = (GetFormFromFile(0x00065A33, "Skyrim.esm") as Keyword) ; MagicAlchFortifyMagicka
	MagicEffectArray[15] = (GetFormFromFile(0x00065A34, "Skyrim.esm") as Keyword) ; MagicAlchFortifyMagickaRate
	MagicEffectArray[17] = (GetFormFromFile(0x00065A35, "Skyrim.esm") as Keyword) ; MagicAlchFortifyStaminaRate
	MagicEffectArray[7] = (GetFormFromFile(0x000B62E4, "Skyrim.esm") as Keyword) ; MagicCloak
	MagicEffectArray[18] = (GetFormFromFile(0x000F81E3, "Skyrim.esm") as Keyword) ; MagicDamageResist
	MagicEffectArray[1] = (GetFormFromFile(0x000F8A4E, "Skyrim.esm") as Keyword) ; MagicAlchBeneficial
	MagicEffectArray[13] = (GetFormFromFile(0x001091CF, "Skyrim.esm") as Keyword) ; MagicSummonFamiliar
	;MagicEffectArray[] = (GetFormFromFile(0x000, "Skyrim.esm") as Keyword) ; 
	;MagicEffectArray[] = (GetFormFromFile(0x000, "Skyrim.esm") as Keyword) ; 
	;MagicEffectArray[] = (GetFormFromFile(0x000, "Skyrim.esm") as Keyword) ; 
	;MagicEffectArray[] = (GetFormFromFile(0x000, "Skyrim.esm") as Keyword) ;
	
	GoToState("Waiting")
EndEvent

State Waiting

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
	;	; if player casts any HOSTILE spell, except if he is on CR04
	;	GoToState("Busy")
	;	If ((GetOwningQuest() as DGIntimidateQuestScript).CR04Running == 0) ;&& (GetOwningQuest().GetStage() < 150)
	;		If akSpell as Spell
	;			If ((akSpell as Spell).IsHostile())
	;				; IsHostile() check is pretty good blanket check, and will prevent
	;				; the more complicated keyword checks on the opponent from ever running.
	;				debug.trace(self + " Player casts hostile spell - end Intimidate")
	;				GetOwningQuest().SetStage(150)
	;			EndIf
	;		ElseIf akSpell as Potion
	;			If ((akSpell as Potion).IsHostile())
	;				; IsHostile() check is pretty good blanket check, and will prevent
	;				; the more complicated keyword checks on the opponent from ever running.
	;				debug.trace(self + " Player casts hostile spell - end Intimidate")
	;				GetOwningQuest().SetStage(150)
	;			EndIf
	;		ElseIf akSpell as Enchantment
	;			If ((akSpell as Enchantment).IsHostile())
	;				; IsHostile() check is pretty good blanket check, and will prevent
	;				; the more complicated keyword checks on the opponent from ever running.
	;				debug.trace(self + " Player casts hostile spell - end Intimidate")
	;				GetOwningQuest().SetStage(150)
	;			EndIf
	;		EndIf
	;	EndIf
	;	GoToState("Waiting")
	;EndEvent

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		GoToState("Busy")
		Actor pActor = Opponent.GetActorRef()
		Actor pPlayer = GetPlayer()
		
		if akCaster != GetPlayer()
		; if player is hit with any magic effect (not by himself)
			;debug.trace(self + " hit with magic - end Intimidate")
			GetOwningQuest().SetStage(150)
		ElseIf akCaster == GetPlayer()
		; if player attempts to heal himself in any way
		; or use summons or other buffs
			If (HasMagicEffectKeywordInList(akEffect, MagicEffectArray))
				;debug.trace(self + " Player attempted to use magic - end Intimidate")
				Faction DGIntimidateFaction = GetFormFromFile(0x0004CFA6, "Skyrim.ESM") as Faction
				pPlayer.RemoveFromFaction(DGIntimidateFaction)
				pActor.RemoveFromFaction(DGIntimidateFaction)
				pActor.StopCombat()
				GetOwningQuest().SetStage(150)
			EndIf
		endif
		GoToState("Waiting")
	endEvent
	
EndState

State Busy

	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		return
	EndEvent
	
	Event OnSpellCast(Form akSpell)
		return
	EndEvent
	
	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		return
	EndEvent
	
EndState

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

bool Function HasMagicEffectKeywordInList(MagicEffect akEffect, Keyword[] akList)
	int aiIndex = 0
	While aiIndex < akList.Length
		; Order akList in order of prevalence (User count in CK)
		; This is so walking the array will return True faster.
		If (akEffect.HasKeyword(akList[aiIndex]))
			return True
		EndIf
		aiIndex += 1
	EndWhile
	return False
EndFunction

Weapon Property UnarmedWeapon  Auto  


ReferenceAlias Property Opponent  Auto  
{opponent in the brawl}

ReferenceAlias Property OpponentFriend  Auto  
