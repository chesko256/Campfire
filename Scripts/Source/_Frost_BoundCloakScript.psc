scriptname _Frost_BoundCloakScript extends ActiveMagicEffect

Armor Property BoundCloak Auto
Actor property PlayerRef auto

Event OnEffectStart(Actor ckTarget, Actor ckCaster)
	RegisterForModEvent("Frost_DispelBoundCloaks", "DispelBoundCloaks")
	Utility.Wait(0.2)
	PlayerRef.AddItem(BoundCloak, 1, true)
	PlayerRef.EquipItem(BoundCloak, false, true)
EndEvent

Event OnEffectFinish(Actor ckTarget, Actor ckCaster)
	int cloak_count = PlayerRef.GetItemCount(BoundCloak)
	if cloak_count > 0
		PlayerRef.RemoveItem(BoundCloak, cloak_count, true)
	endif
EndEvent

Event DispelBoundCloaks()
	Dispel()
endEvent