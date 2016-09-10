scriptname _Camp_EquipMonitor extends ReferenceAlias

import math
import utility
import CampUtil
import _CampInternal

CampfireData property CampData auto
Actor property PlayerRef auto
Formlist property _Camp_Backpacks auto
keyword property ArmorCuirass auto
keyword property ArmorGauntlets auto
keyword property ArmorHelmet auto
keyword property ArmorBoots auto
keyword property ClothingBody auto
keyword property ClothingHands auto
keyword property ClothingHead auto
keyword property ClothingFeet auto

bool processing_unequip = false

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if !(GetUsesMainBodySlot(akBaseObject))
		return
	else
		ProcessEquippedObject(akBaseObject)
	endif
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	processing_unequip = true

	if akBaseObject as Armor
		if !(GetUsesMainBodySlot(akBaseObject))
			processing_unequip = false
			return
		endif

		if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
			CampDebug(1, "Unequipped body armor!")
			CampData.CurrentBody = none
		elseif akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
			CampDebug(1, "Unequipped gloves!")
			CampData.CurrentHands = none
		elseif akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead)
			CampDebug(1, "Unequipped helmet!")
			CampData.CurrentHead = none
		elseif akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
			CampDebug(1, "Unequipped boots!")
			CampData.CurrentFeet = none
		elseif _Camp_Backpacks.HasForm(akBaseObject)
			CampData.CurrentBackpack = none
		endif
	elseif akBaseObject as Ammo
		CampDebug(1, "Setting ammo to none")
		CampData.CurrentAmmo = none
	endif

	processing_unequip = false
endEvent

function ProcessEquippedObject(Form akBaseObject)
	int i = 0
	while processing_unequip && i < 50
		WaitMenuMode(0.1)
		i += 1
	endWhile
	CampDebug(0, "Processing equipped object")
	WaitMenuMode(0.1)	;Helps prevent a race condition when switching equipment.

	if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
		CampDebug(1, "The player equipped a piece of body armor.")
		CampData.CurrentBody = akBaseObject as Armor
	elseif akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
		CampDebug(1, "The player equipped a piece of hand armor.")
		CampData.CurrentHands = akBaseObject as Armor
	elseif akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead)
		CampDebug(1, "The player equipped a piece of head armor.")
		CampData.CurrentHead = akBaseObject as Armor
	elseif akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
		CampDebug(1, "The player equipped a piece of feet armor.")
		CampData.CurrentFeet = akBaseObject as Armor
	elseif _Camp_Backpacks.HasForm(akBaseObject)
		CampDebug(1, "The player equipped a backpack.")
		CampData.CurrentBackpack = akBaseObject as Armor
	elseif akBaseObject as Ammo
		CampDebug(1, "The player equipped ammo.")
		CampData.CurrentAmmo = akBaseObject as Ammo
	else
		CampDebug(1, "The player equipped a miscellaneous object, " + akBaseObject)
	endif
endFunction

;@TODO - Do I even need this anymore?
bool function GetUsesMainBodySlot(Form akBaseObject)
	; Requires SKSE
	; Checks if akBaseObject uses one of the main gear slots for the body (30-39,41-43)
	; Returns True on slots 40 and 46 as well for cloak support

	if !(GetCompatibilitySystem().isSKSELoaded)
		; SKSE not loaded or too old; fall back to True
		return true
	endif

	if akBaseObject == None
		return false
	elseif akBaseObject as Ammo
		return true
	elseif _Camp_Backpacks.HasForm(akBaseObject)
		CampDebug(0, "This equipment is a backpack.")
		return true
	elseif akBaseObject as Armor
		Armor akArmor = akBaseObject as Armor
		if akArmor.IsShield()
			CampDebug(0, "This equipment is a shield, returning false!")
			return false
		endif
		int mySlotMask = akArmor.GetSlotMask()
		if LogicalAnd(mySlotMask, akArmor.kSlotMask61)
			CampDebug(0, "This equipment has slot kSlotMask61, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask60)
			CampDebug(0, "This equipment has slot kSlotMask60, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask59)
			CampDebug(0, "This equipment has slot kSlotMask59, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask58)
			CampDebug(0, "This equipment has slot kSlotMask58, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask57)
			CampDebug(0, "This equipment has slot kSlotMask57, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask56)
			CampDebug(0, "This equipment has slot kSlotMask56, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask55)
			CampDebug(0, "This equipment has slot kSlotMask55, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask54)
			CampDebug(0, "This equipment has slot kSlotMask54, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask53)
			CampDebug(0, "This equipment has slot kSlotMask53, which is NOT valid armor, returning false.")
			return false
		;elseif LogicalAnd(mySlotMask, akArmor.kSlotMask52)
		;	CampDebug(0, "This equipment has slot kSlotMask52, which is NOT valid armor, returning false.")
		;	return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask51)
			CampDebug(0, "This equipment has slot kSlotMask51, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask50)
			CampDebug(0, "This equipment has slot kSlotMask50, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask49)
			CampDebug(0, "This equipment has slot kSlotMask49, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask48)
			CampDebug(0, "This equipment has slot kSlotMask48, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask47)
			CampDebug(0, "This equipment has slot kSlotMask47, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask46)
			CampDebug(0, "This equipment has slot kSlotMask46, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask45)
			CampDebug(0, "This equipment has slot kSlotMask45, which is NOT valid armor, returning false.")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask44)
			CampDebug(0, "This equipment has slot kSlotMask44, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask43)
			CampDebug(0, "This equipment has slot kSlotMask43, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask42)
			CampDebug(0, "This equipment has slot kSlotMask42, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask41)
			CampDebug(0, "This equipment has slot kSlotMask41, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask40)
			CampDebug(0, "This equipment has slot kSlotMask40, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask39)
			CampDebug(0, "This equipment has slot kSlotMask39, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask38)
			CampDebug(0, "This equipment has slot kSlotMask38, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask37)
			CampDebug(0, "This equipment has slot kSlotMask37, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask36)
			CampDebug(0, "This equipment has slot kSlotMask36, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask35)
			CampDebug(0, "This equipment has slot kSlotMask35, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask34)
			CampDebug(0, "This equipment has slot kSlotMask34, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask33)
			CampDebug(0, "This equipment has slot kSlotMask33, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask32)
			CampDebug(0, "This equipment has slot kSlotMask32, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask31)
			CampDebug(0, "This equipment has slot kSlotMask31, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask30)
			CampDebug(0, "This equipment has slot kSlotMask30, which is valid armor.")
			return true
		else
			CampDebug(0, "This equipment has slot could not be determined, returning True.")
			return True
		endif
	else
		return false
	endif
endFunction
