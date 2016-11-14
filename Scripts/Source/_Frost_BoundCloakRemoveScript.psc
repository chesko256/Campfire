Scriptname _Frost_BoundCloakRemoveScript extends ObjectReference

import FrostUtil
import _CampInternal

Actor property PlayerRef auto
Armor property BoundCloak auto
Sound Property sndDeactivate Auto
Spell property CloakSpell auto
Message property _Frost_BoundCloakRemovedMsg auto

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
	ExitMenus()
	_Frost_BoundCloakRemovedMsg.Show()
	SendEvent_DispelBoundCloaks()
EndEvent

function SendEvent_DispelBoundCloaks()
	FallbackEventEmitter emitter = GetEventEmitter_DispelBoundCloaks()
	int handle = emitter.Create("Frost_DispelBoundCloaks")
	if handle
		emitter.Send(handle)
	endif
endFunction