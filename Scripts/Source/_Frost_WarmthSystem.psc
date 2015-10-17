scriptname _Frost_WarmthSystem extends _Frost_BaseSystem

import FrostUtil

Actor property PlayerRef auto
GlobalVariable property _Frost_AttributeWarmth auto
;@TODO: Conditionalize this on the player alias instead
; Spell property _Frost_TorchState_Spell auto

function RegisterForEvents()
	RegisterForModEvent("Frost_UpdateWarmth", "UpdateWarmth")
endFunction

Event UpdateWarmth()
	; Should push results up to the UI

	int warmth
	warmth += GetClothingSystem().GetArmorExposureProtection()
	warmth += GetTorchBonus()
	; torch
	; food
	; Perks

	_Frost_AttributeWarmth.SetValueInt(warmth)
endEvent

int function GetTorchBonus()
	if PlayerRef.GetEquippedItemType(0) == 11 || PlayerRef.GetEquippedItemType(1) == 11
		return 25
	else
		return 0
	endif
endFunction