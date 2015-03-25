Scriptname MS11CalixtoScript extends ReferenceAlias  

Scene Property KillScene auto

;Keyword[] Property MagicEffectArray Auto
{ Array of Keywords to check for. Array traversal is > 1000x faster than using FLSTs, so should stay as an Array, despite FLST's convenience.
Only if the magic effect keyword from this list is cast by the player will the opponent consider it cheating.
}
Keyword[] MagicEffectArray

import Game

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

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		GoToState("Busy")
		if (akAggressor == Game.GetPlayer())
			ResolvePlayerAttack()
		endif
		GoToState("Waiting")
	EndEvent

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		GoToState("Busy")
		if (akCaster == Game.GetPlayer())
			ResolvePlayerAttack()
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

Event OnDeath(Actor akKiller)
	if (GetOwningQuest().GetStage() == 130)
		(GetOwningQuest() as MS11QuestScript).CalixtoDead = true
		GetActorReference().BlockActivation(false)
		GetOwningQuest().SetStage(150)
	endif
EndEvent


Function ResolvePlayerAttack()
	if (KillScene.IsPlaying())
		if (KillScene.IsActionComplete(7) && KillScene.IsActionComplete(8) && (GetOwningQuest() as MS11QuestScript).PlayerInMurderZone)
			KillScene.Stop()
		endif
	endif
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