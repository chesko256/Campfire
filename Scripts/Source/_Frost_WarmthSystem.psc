scriptname _Frost_WarmthSystem extends _Frost_BaseSystem

import FrostUtil

Actor property PlayerRef auto
GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_PerkRank_Adaptation auto

int current_food_bonus
int current_spell_bonus

function RegisterForEvents()
	RegisterForModEvent("Frost_UpdateWarmth", "UpdateWarmth")
	RegisterForModEvent("Frost_SoupEffectStart", "SoupEffectStart")
	RegisterForModEvent("Frost_SoupEffectStop", "SoupEffectStop")
endFunction

Event UpdateWarmth()
	; Should push results up to the UI

	int warmth
	warmth += GetClothingSystem().GetArmorWarmth()
	warmth += GetTorchBonus()
	warmth += GetFrostResistBonus()
	warmth += current_food_bonus
	warmth += _Frost_PerkRank_Adaptation.GetValueInt() * 20
	
	; spells
	_FrostInternal.FrostDebug(0, "**** Warmth ::: Warmth Value: " + warmth)
	_Frost_AttributeWarmth.SetValueInt(warmth)
endEvent

Event SoupEffectStart()
	current_food_bonus = 25
	UpdateWarmth()
endEvent

Event SoupEffectStop()
	current_food_bonus = 0
	UpdateWarmth()
endEvent

int function GetTorchBonus()
	if PlayerRef.GetEquippedItemType(0) == 11 || PlayerRef.GetEquippedItemType(1) == 11
		return 25
	else
		return 0
	endif
endFunction

int function GetFrostResistBonus()
	int bonus = Math.Ceiling(PlayerRef.GetAV("FrostResist") / 2.0)
	if bonus > 50
		bonus = 50
	endif
	return bonus
endFunction