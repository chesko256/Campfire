Scriptname _DE_ArmorSpellScript extends ActiveMagicEffect  

GlobalVariable property myGlobalVar auto
{The global variable associated with this spell.}

Event OnEffectStart(Actor akTarget, Actor akCaster)

	myGlobalVar.SetValue(1.0)

endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	myGlobalVar.SetValue(0.0)

endEvent