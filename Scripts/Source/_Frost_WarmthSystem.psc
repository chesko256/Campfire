scriptname _Frost_WarmthSystem extends _Frost_BaseSystem

import CampUtil
import FrostUtil
import _FrostInternal

Actor property PlayerRef auto
Quest property _Frost_MainQuest auto
GlobalVariable property _Frost_ArmorPerk3Active auto
GlobalVariable property _Frost_ArmorPerk2Active auto
GlobalVariable property _Frost_ArmorPerk1Active auto
GlobalVariable property _Frost_Setting_VampireMode auto
MagicEffect property _Frost_ExposureArmorFFSelf_3 auto
MagicEffect property _Frost_ExposureArmorFFSelf_2 auto
MagicEffect property _Frost_ExposureArmorFFSelf_1 auto

GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property FrostfallAttributeWarmthReadOnly auto
GlobalVariable property _Frost_PerkRank_Adaptation auto
GlobalVariable property _Frost_DatastoreInitialized auto
bool property well_insulated_perk_active = false auto hidden
int current_food_bonus
int current_spell_bonus

bool property updating_warmth = false auto hidden

function RegisterForEvents()
	FallbackEventEmitter updateWarmthEvent = GetEventEmitter_UpdateWarmth()
	FallbackEventEmitter campfirePerkEvent = GetEventEmitter_CampfirePerkPurchased()
	FallbackEventEmitter soupStart = GetEventEmitter_SoupEffectStart()
	FallbackEventEmitter soupStop = GetEventEmitter_SoupEffectStop()

  	updateWarmthEvent.RegisterFormForModEventWithFallback("Frost_UpdateWarmth", "UpdateWarmth", self)
	soupStart.RegisterFormForModEventWithFallback("Frost_SoupEffectStart", "SoupEffectStart", self)
	soupStop.RegisterFormForModEventWithFallback("Frost_SoupEffectStop", "SoupEffectStop", self)
	campfirePerkEvent.RegisterFormForModEventWithFallback("Campfire_CampfirePerkPurchased", "CampfirePerkPurchased", self)
endFunction

Event UpdateWarmth(bool abDisplayTextUpdate)
	int i = 20
    while updating_warmth == true && i > 0
        utility.wait(0.2)
        i -= 1
    endWhile

    updating_warmth = true
	int warmth
	_Frost_ClothingSystem clothing = GetClothingSystem()
	warmth += clothing.GetArmorWarmth(clothing.WornGearValues)
	if well_insulated_perk_active
		warmth += Math.Ceiling(warmth * 0.25)
	endif
	warmth += GetTorchBonus()
	warmth += GetFrostResistBonus()
	warmth += current_food_bonus
	warmth += _Frost_PerkRank_Adaptation.GetValueInt() * 20
	warmth += GetSpellBonus()

	if (_Frost_MainQuest as _Frost_ConditionValues).IsVampire && _Frost_Setting_VampireMode.GetValueInt() >= 1
		warmth += 100
	endif

	if (_Frost_MainQuest as _Frost_ConditionValues).IsBeast
		warmth += 500
	endif

	_FrostInternal.FrostDebug(0, "**** Warmth ::: Warmth Value: " + warmth)
	int old_warmth = _Frost_AttributeWarmth.GetValueInt()
	_Frost_AttributeWarmth.SetValueInt(warmth)
	FrostfallAttributeWarmthReadOnly.SetValueInt(warmth)
	SendEvent_UpdateBottomBarWarmth(warmth)
	updating_warmth = false

	if abDisplayTextUpdate
		if FrostUtil.GetCompatibilitySystem().isUIPackageInstalled
			return
		else
			if old_warmth != warmth
				GetClothingSystem().RegisterForSingleUpdate(2)
			endif
		endif
	endif
endEvent

Event SoupEffectStart()
	current_food_bonus = 25
	UpdateWarmth(false)
endEvent

Event SoupEffectStop()
	current_food_bonus = 0
	UpdateWarmth(false)
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

;@NOFALLBACK
function SendEvent_UpdateBottomBarWarmth(int aiWarmth)
	if GetSKSELoaded()
    	if _Frost_DatastoreInitialized.GetValueInt() != 2
        	return
    	endif

    	FrostDebug(0, "Sending event Frost_UpdateBottomBarWarmth")
    	int handle = ModEvent.Create("Frost_UpdateBottomBarWarmth")
    	if handle
        	ModEvent.PushInt(handle, aiWarmth)
        	ModEvent.Send(handle)
    	endif
    endif
endFunction

Event CampfirePerkPurchased()
	UpdateWarmth(false)
endEvent
