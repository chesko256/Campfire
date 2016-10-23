scriptname _Frost_SKSETypesAlias extends ReferenceAlias

Event OnPlayerLoadGame()
	(self.GetOwningQuest() as _Frost_SKSETypesDelegate).RegisterForAllEvents()
EndEvent