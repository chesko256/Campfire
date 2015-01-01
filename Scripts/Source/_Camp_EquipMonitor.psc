scriptname _Camp_EquipMonitor extends ReferenceAlias

import debug
import math
import utility
import CampUtil

CampfireData property CampData auto

Formlist property _DE_EquipExceptions auto
Formlist property _DE_Backpacks auto

keyword property ArmorCuirass auto
keyword property ArmorGauntlets auto
keyword property ArmorHelmet auto
keyword property ArmorBoots auto
keyword property ClothingBody auto
keyword property ClothingHands auto
keyword property ClothingHead auto
keyword property ClothingFeet auto

Armor property ClothesMGRobesArchmage1Hooded auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	;First, check exceptions
	if _DE_EquipExceptions.HasForm(akBaseObject)
		return
	elseif !(GetUsesMainBodySlot(akBaseObject))
		return
	else
		ProcessEquippedObject(akBaseObject)
	endif
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	bool bEventRaised = false

	if akBaseObject as Armor

		if _DE_EquipExceptions.HasForm(akBaseObject)
			return
		elseif !(GetUsesMainBodySlot(akBaseObject))
			return
		endif

		if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
			;trace("[Campfire] Unequipped body armor!")
			bEventRaised = RaiseEvent_CampfireOnGearUnequipped(akBaseObject, 1)
			CampData.CurrentBody = none
		endif
		if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
			;trace("[Campfire] Unequipped gloves!")
			bEventRaised = RaiseEvent_CampfireOnGearUnequipped(akBaseObject, 2)
			CampData.CurrentHands = none
		endif
		if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
			;trace("[Campfire] Unequipped helmet!")
			bEventRaised = RaiseEvent_CampfireOnGearUnequipped(akBaseObject, 3)
			CampData.CurrentHead = none
		endif
		if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
			;trace("[Campfire] Unequipped boots!")
			bEventRaised = RaiseEvent_CampfireOnGearUnequipped(akBaseObject, 4)
			CampData.CurrentFeet = none
		endif
		if _DE_Backpacks.HasForm(akBaseObject)
			bEventRaised = RaiseEvent_CampfireOnGearUnequipped(akBaseObject, 5)
			CampData.CurrentBackpack = none
		endif
		
		;Cloak check
		if !bEventRaised
			bool b = RaiseEvent_CampfireOnGearUnequipped(akBaseObject, 7)
		endif
		
	elseif akBaseObject as Ammo
		;trace("[Campfire] Setting ammo to none")
		CampData.CurrentAmmo = none
		bool b = RaiseEvent_CampfireOnGearUnequipped(akBaseObject, 6)
	endif
endEvent

function ProcessEquippedObject(Form akBaseObject)
	WaitMenuMode(0.3)	;Helps prevent a race condition when switching equipment.
	bool bEventRaised = false

	if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
		CampData.CurrentBody = akBaseObject as Armor
		bEventRaised = RaiseEvent_CampfireOnGearEquipped(akBaseObject, 1)
		;trace("[Campfire] The player equipped a piece of body armor.")
	endif
	if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
		CampData.CurrentHands = akBaseObject as Armor
		bEventRaised = RaiseEvent_CampfireOnGearEquipped(akBaseObject, 2)
		;trace("[Campfire] The player equipped a piece of hand armor.")
	endif
	if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
		CampData.CurrentHead = akBaseObject as Armor
		bEventRaised = RaiseEvent_CampfireOnGearEquipped(akBaseObject, 3)
		;trace("[Campfire] The player equipped a piece of head armor.")
	endif
	if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)	
		CampData.CurrentFeet = akBaseObject as Armor
		bEventRaised = RaiseEvent_CampfireOnGearEquipped(akBaseObject, 4)
		;trace("[Campfire] The player equipped a piece of feet armor.")
	endif
	if !bEventRaised
		if _DE_Backpacks.HasForm(akBaseObject)
			CampData.CurrentBackpack = akBaseObject as Armor
			bool b = RaiseEvent_CampfireOnGearEquipped(akBaseObject, 5)
			;trace("[Campfire] The player equipped a backpack.")
		elseif akBaseObject as Ammo
			CampData.CurrentAmmo = akBaseObject as Ammo
			bool b = RaiseEvent_CampfireOnGearEquipped(akBaseObject, 6)
			;trace("[Campfire] The player equipped ammo.")
		else
			;CloakCheck()
			;TTis object might be what Frostfall would consider to be a cloak.
			bool b = RaiseEvent_CampfireOnGearEquipped(akBaseObject, 7)
			;trace("[Campfire] The player equipped a cloak." + akBaseObject)
		endif
	endif
endFunction

bool function GetUsesMainBodySlot(Form akBaseObject)
	;Requires SKSE
	;Checks if akBaseObject uses one of the main gear slots for the body (30-39,41-43)
	;Returns True on slots 40 and 46 as well for cloak support
	if akBaseObject == None
		return false
	elseif akBaseObject as Ammo
		return true
	elseif _DE_Backpacks.HasForm(akBaseObject)
		;trace("[Campfire] This equipment is a backpack.")
		return true
	elseif akBaseObject as Armor
		Armor akArmor = akBaseObject as Armor
		if akArmor.IsShield()
			;trace("[Campfire] This equipment is a shield, returning false!")
			return false
		endif
		int mySlotMask = akArmor.GetSlotMask()
		if LogicalAnd(mySlotMask, akArmor.kSlotMask61)
			;trace("[Campfire] This equipment has slot kSlotMask61, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask60)
			;trace("[Campfire] This equipment has slot kSlotMask60, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask59)
			;trace("[Campfire] This equipment has slot kSlotMask59, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask58)
			;trace("[Campfire] This equipment has slot kSlotMask58, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask57)
			;trace("[Campfire] This equipment has slot kSlotMask57, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask56)
			;trace("[Campfire] This equipment has slot kSlotMask56, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask55)
			;trace("[Campfire] This equipment has slot kSlotMask55, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask54)
			;trace("[Campfire] This equipment has slot kSlotMask54, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask53)
			;trace("[Campfire] This equipment has slot kSlotMask53, which is NOT valid armor, returning false!")
			return false
		;elseif LogicalAnd(mySlotMask, akArmor.kSlotMask52)
		;	;trace("[Campfire] This equipment has slot kSlotMask52, which is NOT valid armor, returning false!")
		;	return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask51)
			;trace("[Campfire] This equipment has slot kSlotMask51, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask50)
			;trace("[Campfire] This equipment has slot kSlotMask50, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask49)
			;trace("[Campfire] This equipment has slot kSlotMask49, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask48)
			;trace("[Campfire] This equipment has slot kSlotMask48, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask47)
			;trace("[Campfire] This equipment has slot kSlotMask47, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask46)
			;trace("[Campfire] This equipment has slot kSlotMask46, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask45)
			;trace("[Campfire] This equipment has slot kSlotMask45, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask44)
			;trace("[Campfire] This equipment has slot kSlotMask44, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask43)
			;trace("[Campfire] This equipment has slot kSlotMask43, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask42)
			;trace("[Campfire] This equipment has slot kSlotMask42, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask41)
			;trace("[Campfire] This equipment has slot kSlotMask41, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask40)
			;trace("[Campfire] This equipment has slot kSlotMask40, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask39)
			;trace("[Campfire] This equipment has slot kSlotMask39, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask38)
			;trace("[Campfire] This equipment has slot kSlotMask38, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask37)
			;trace("[Campfire] This equipment has slot kSlotMask37, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask36)
			;trace("[Campfire] This equipment has slot kSlotMask36, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask35)
			;trace("[Campfire] This equipment has slot kSlotMask35, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask34)
			;trace("[Campfire] This equipment has slot kSlotMask34, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask33)
			;trace("[Campfire] This equipment has slot kSlotMask33, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask32)
			;trace("[Campfire] This equipment has slot kSlotMask32, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask31)
			;trace("[Campfire] This equipment has slot kSlotMask31, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask30)
			;trace("[Campfire] This equipment has slot kSlotMask30, which is valid armor.")
			return true
		else
			;trace("[Campfire] I don't know what happened, returning True.")
			return True
		endif
	else
		return false
	endif
endFunction