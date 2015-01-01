Scriptname _DE_boundcloakremovescript extends ObjectReference

Sound Property sndDeactivate Auto
Spell property CloakSpell auto

Event OnUnequipped(Actor akActor)
	sndDeactivate.Play(Game.GetPlayer())
	Game.GetPlayer().DispelSpell(CloakSpell)

	;Finally, attempt to delete myself
	self.Delete()
EndEvent
