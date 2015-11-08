scriptname _Frost_WarmthSystem extends _Frost_BaseSystem

import FrostUtil
import _FrostInternal

Actor property PlayerRef auto
GlobalVariable property _Frost_ArmorPerk3Active auto
GlobalVariable property _Frost_ArmorPerk2Active auto
GlobalVariable property _Frost_ArmorPerk1Active auto
MagicEffect property _Frost_ExposureArmorFFSelf_3 auto
MagicEffect property _Frost_ExposureArmorFFSelf_2 auto
MagicEffect property _Frost_ExposureArmorFFSelf_1 auto

GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_PerkRank_Adaptation auto
GlobalVariable property _Frost_DatastoreInitialized auto
bool property well_insulated_perk_active = false auto hidden
int current_food_bonus
int current_spell_bonus

function RegisterForEvents()
	RegisterForModEvent("Frost_UpdateWarmth", "UpdateWarmth")
	RegisterForModEvent("Frost_SoupEffectStart", "SoupEffectStart")
	RegisterForModEvent("Frost_SoupEffectStop", "SoupEffectStop")
	RegisterForModEvent("Campfire_CampfirePerkPurchased", "CampfirePerkPurchased")
endFunction

Event UpdateWarmth()
	int warmth
	warmth += GetClothingSystem().GetArmorWarmth()
	if well_insulated_perk_active
		warmth += Math.Ceiling(warmth * 0.25)
	endif
	warmth += GetTorchBonus()
	warmth += GetFrostResistBonus()
	warmth += current_food_bonus
	warmth += _Frost_PerkRank_Adaptation.GetValueInt() * 20
	warmth += GetSpellBonus()

	_FrostInternal.FrostDebug(0, "**** Warmth ::: Warmth Value: " + warmth)
	_Frost_AttributeWarmth.SetValueInt(warmth)
	SendEvent_UpdateBottomBarWarmth(warmth)
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

int function GetSpellBonus()
	if PlayerRef.HasMagicEffect(_Frost_ExposureArmorFFSelf_3)				;Bearskin
		if _Frost_ArmorPerk3Active.GetValue() == 1.0
			return 90
		elseif _Frost_ArmorPerk2Active.GetValue() == 1.0
			return 75
		elseif _Frost_ArmorPerk1Active.GetValue() == 1.0
			return 60
		else
			return 30
		endif
	elseif PlayerRef.HasMagicEffect(_Frost_ExposureArmorFFSelf_2)			;Wolfskin
		if _Frost_ArmorPerk3Active.GetValue() == 1.0
			return 60
		elseif _Frost_ArmorPerk2Active.GetValue() == 1.0
			return 50
		elseif _Frost_ArmorPerk1Active.GetValue() == 1.0
			return 40
		else
			return 20
		endif
	elseif PlayerRef.HasMagicEffect(_Frost_ExposureArmorFFSelf_1)			;Foxskin
		if _Frost_ArmorPerk3Active.GetValue() == 1.0
			return 30
		elseif _Frost_ArmorPerk2Active.GetValue() == 1.0
			return 25
		elseif _Frost_ArmorPerk1Active.GetValue() == 1.0
			return 20
		else
			return 10
		endif
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

function SetWellInsulated(bool active)
	if active
		well_insulated_perk_active = true
	else
		well_insulated_perk_active = false
	endif
endFunction

function SendEvent_UpdateBottomBarWarmth(int aiWarmth)
    if _Frost_DatastoreInitialized.GetValueInt() != 2
        return
    endif

    FrostDebug(0, "Sending event Frost_UpdateBottomBarWarmth")
    int handle = ModEvent.Create("Frost_UpdateBottomBarWarmth")
    if handle
        ModEvent.PushInt(handle, aiWarmth)
        ModEvent.Send(handle)
    endif
endFunction

Event CampfirePerkPurchased()
	UpdateWarmth()
endEvent