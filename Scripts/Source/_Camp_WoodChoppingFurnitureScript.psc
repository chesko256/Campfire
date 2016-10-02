scriptname _Camp_WoodChoppingFurnitureScript extends ObjectReference

import _CampInternal

Quest property _Camp_MainQuest auto
FormList property woodChoppingAxes auto
Actor property PlayerRef auto

weapon EquippedWeapon

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef as Actor) == Game.GetPlayer()
		CampDebug(0, "I was activated by the player!")
		RegisterForSingleUpdate(0.5)
	endif
endEvent

Event OnUpdate()
	bool hasBaseObject = self.GetBaseObject()
	if !hasBaseObject
		CampDebug(2, "Invalid registration detected. You should run 'ClearInvalidRegistrations' from the console while playing using SKSE in order to fix this.")
		return
	endif

	if self.IsFurnitureInUse()
		CampDebug(0, "I am in use by the player!")
		(_Camp_MainQuest as _Camp_ConditionValues).IsChoppingWood = true
		if woodChoppingAxes.HasForm(PlayerRef.GetEquippedWeapon())
			EquippedWeapon = PlayerRef.GetEquippedWeapon()
			PlayerRef.UnequipItem(EquippedWeapon as Form, abSilent = true)
		endif
		RegisterForSingleUpdate(0.25)
	else
		CampDebug(0, "I am not in use by the player!")
		(_Camp_MainQuest as _Camp_ConditionValues).IsChoppingWood = false
		if EquippedWeapon != none
			PlayerRef.EquipItem(EquippedWeapon as Form, abSilent = true)
			EquippedWeapon = none
		endif
	endif
endEvent