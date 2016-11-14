scriptname _Frost_BoundCloakScript extends ActiveMagicEffect

import FrostUtil

Armor Property BoundCloak Auto
Actor property PlayerRef auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	FallbackEventEmitter emitter = GetEventEmitter_DispelBoundCloaks()
	emitter.RegisterActiveMagicEffectForModEventWithFallback("Frost_DispelBoundCloaks", "DispelBoundCloaks", self)
	Utility.Wait(0.2)
	PlayerRef.AddItem(BoundCloak, 1, true)
	PlayerRef.EquipItem(BoundCloak, false, true)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	int cloak_count = PlayerRef.GetItemCount(BoundCloak)
	if cloak_count > 0
		PlayerRef.RemoveItem(BoundCloak, cloak_count, true)
	endif
EndEvent

Event DispelBoundCloaks()
	Dispel()
endEvent