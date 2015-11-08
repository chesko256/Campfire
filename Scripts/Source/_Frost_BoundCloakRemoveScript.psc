Scriptname _Frost_BoundCloakRemoveScript extends ObjectReference

Actor property PlayerRef auto
Armor property BoundCloak auto
Sound Property sndDeactivate Auto
Spell property CloakSpell auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if !akNewContainer
		self.Delete()
	else
		if akNewContainer != PlayerRef
			int cloak_count = akNewContainer.GetItemCount(BoundCloak)
			if cloak_count > 0
				akNewContainer.RemoveItem(BoundCloak, cloak_count, true)
			endif
		endif
	endif
EndEvent

Event OnUnequipped(Actor akActor)
	sndDeactivate.Play(PlayerRef)
	SendEvent_DispelBoundCloaks()
EndEvent

function SendEvent_DispelBoundCloaks()
	int handle = ModEvent.Create("Frost_DispelBoundCloaks")
	if handle
		ModEvent.Send(handle)
	endif
endFunction