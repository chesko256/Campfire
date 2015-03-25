Scriptname C00TrainerScript extends ReferenceAlias  

;Keyword[] Property MagicEffectArray Auto
{ Array of Keywords to check for. Array traversal is > 1000x faster than using FLSTs, so should stay as an Array, despite FLST's convenience.
Only if the magic effect keyword from this list is cast by the player will the opponent consider it cheating.
}
Keyword[] MagicEffectArray

import Game
int numHits = 0

Event OnInit()
	MagicEffectArray = new Keyword[27]
	MagicEffectArray[0] = (GetFormFromFile(0x0001CEAD, "Skyrim.esm") as Keyword) ; MagicDamageFire
	MagicEffectArray[1] = (GetFormFromFile(0x0001CEAF, "Skyrim.esm") as Keyword) ; MagicDamageShock
	MagicEffectArray[2] = (GetFormFromFile(0x00046B99, "Skyrim.esm") as Keyword) ; MagicShout
	MagicEffectArray[3] = (GetFormFromFile(0x00078098, "Skyrim.esm") as Keyword) ; MagicInfluence
	MagicEffectArray[4] = (GetFormFromFile(0x0001CEAE, "Skyrim.esm") as Keyword) ; MagicDamageFrost
	MagicEffectArray[5] = (GetFormFromFile(0x000FBFEE, "Skyrim.esm") as Keyword) ; DB10MagicHeavyFire
	MagicEffectArray[6] = (GetFormFromFile(0x00042509, "Skyrim.esm") as Keyword) ; MagicAlchHarmful
	MagicEffectArray[7] = (GetFormFromFile(0x0010E4B3, "Skyrim.esm") as Keyword) ; dunCGMagicHeavyFire
	MagicEffectArray[8] = (GetFormFromFile(0x0001EA70, "Skyrim.esm") as Keyword) ; MagicParalysis
	MagicEffectArray[9] = (GetFormFromFile(0x000424E0, "Skyrim.esm") as Keyword) ; MagicInfluenceFear
	MagicEffectArray[10] = (GetFormFromFile(0x0009F28E, "Skyrim.esm") as Keyword) ; MagicTrapGas
	MagicEffectArray[11] = (GetFormFromFile(0x000424EE, "Skyrim.esm") as Keyword) ; MagicInfluenceCharm
	MagicEffectArray[12] = (GetFormFromFile(0x000B729E, "Skyrim.esm") as Keyword) ; MagicSlow
	MagicEffectArray[13] = (GetFormFromFile(0x000C44B6, "Skyrim.esm") as Keyword) ; MagicInfluenceFrenzy
	MagicEffectArray[14] = (GetFormFromFile(0x00109D79, "Skyrim.esm") as Keyword) ; MagicRune
	MagicEffectArray[15] = (GetFormFromFile(0x0007F404, "Skyrim.esm") as Keyword) ; MagicTelekinesis
	MagicEffectArray[16] = (GetFormFromFile(0x000FBFEF, "Skyrim.esm") as Keyword) ; DB10MagicLightFire
	MagicEffectArray[17] = (GetFormFromFile(0x00101BDE, "Skyrim.esm") as Keyword) ; MagicVampireDrain
	MagicEffectArray[18] = (GetFormFromFile(0x001093BB, "Skyrim.esm") as Keyword) ; MagicTrapPoison	
	MagicEffectArray[19] = (GetFormFromFile(0x0010E4B4, "Skyrim.esm") as Keyword) ; dunCGMagicLightFire
	;MagicEffectArray[20] = (GetFormFromFile(0x00074F4E, "Skyrim.esm") as Keyword) ; MagicAlchWeaknessFire
	;MagicEffectArray[21] = (GetFormFromFile(0x00074F4F, "Skyrim.esm") as Keyword) ; MagicAlchWeaknessFrost
	;MagicEffectArray[22] = (GetFormFromFile(0x00074F50, "Skyrim.esm") as Keyword) ; MagicAlchWeaknessShock
	;MagicEffectArray[23] = (GetFormFromFile(0x00074F51, "Skyrim.esm") as Keyword) ; MagicAlchWeaknessMagic
	;MagicEffectArray[24] = (GetFormFromFile(0x00074F53, "Skyrim.esm") as Keyword) ; MagicEnchWeaknessFire
	;MagicEffectArray[25] = (GetFormFromFile(0x00074F55, "Skyrim.esm") as Keyword) ; MagicEnchWeaknessShock
	
	GoToState("Waiting")
EndEvent

State Waiting

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		GoToState("Busy")
		;Debug.Trace("C00: Vilkas hit by magic.")
		Actor pActor = GetActorRef()
		If HasMagicEffectKeywordInList(akEffect, MagicEffectArray)
			if (Game.GetPlayer() == akCaster)
				GetOwningQuest().SetStage(100)
			endif
		EndIf
		GoToState("Waiting")
	EndEvent

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

		GoToState("Busy")
		;Debug.Trace("C00: Vilkas was hit.")
		;Debug.Trace("C00: Vilkas hit datums -- " + akAggressor + " " + akSource + " " + akProjectile + " " + abPowerAttack + " " + abSneakAttack + " " + abBashAttack + " " + abHitBlocked)
		if     (akSource as Spell)
			;Debug.Trace("C00: Vilkas hit by spell; bailing out and handling it in the magic effect handler.")
			return
		elseif (akSource as Explosion)
			;Debug.Trace("C00: Vilkas hit by explosion; bailing out and handling it in the other handlers.")
			return
		endif
		if (Game.GetPlayer() == akAggressor)
			if ((akSource as Spell) != None)
				GetOwningQuest().SetStage(100)
				return
			endif
			numHits += 1
			if (numHits >= 3)
				GetOwningQuest().SetStage(150)
			endif
		else
			; someone else hit him, stop the quest and have him berate you
			GetOwningQuest().SetStage(110)
		endif
		GoToState("Waiting")
	EndEvent
	
EndState

State Busy

	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		return
	EndEvent
	
	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		return
	EndEvent
	
EndState

Event OnEnterBleedout()
	BleedoutChecks()
EndEvent

Function BleedoutChecks()
	if (!GetOwningQuest().IsRunning())
		return
	endif
	;Debug.Trace("C00: Vilkas reached bleedout.")
	int currStage = GetOwningQuest().GetStage()
	if (currStage != 100 && currStage != 110) ; don't let it through if he's trying to
											  ;  razz you about using magic, for instance
		GetOwningQuest().SetStage(125)
	endif
EndFunction

Function ResetHits()
	numHits = 0
EndFunction

bool Function HasMagicEffectKeywordInList(MagicEffect akEffect, Keyword[] akList)
	int aiIndex = 0
	While aiIndex < akList.Length
		; Order akList in order of prevalence (User count in CK)
		; MagicDamageFire, MagicDamageShock, and so forth.
		; This is so walking the array will return True faster.
		If (akEffect.HasKeyword(akList[aiIndex]))
			return True
		EndIf
		aiIndex += 1
	EndWhile
	return False
EndFunction
