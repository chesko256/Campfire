Scriptname CompanionsSingleCombatantScript extends ReferenceAlias  

Event OnEnterBleedOut()
	GetOwningQuest().SetStage(200)
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	; if player hits with any magic effect
	if (akCaster == Game.GetPlayer())
			GetOwningQuest().SetStage(150)
	endif
EndEvent

