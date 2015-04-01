scriptname _Camp_EquipMonitor extends ReferenceAlias

import math
import utility
import CampUtil
import _CampInternal

CampfireData property CampData auto
_Camp_Compatibility property Compatibility auto
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

; Edge case - Only armor in vanilla game with integrated headgear
Armor property ClothesMGRobesArchmage1Hooded auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if !(GetUsesMainBodySlot(akBaseObject))
		return
	else
		ProcessEquippedObject(akBaseObject)
	endif
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	bool bEventRaised = false

	if akBaseObject as Armor

		if !(GetUsesMainBodySlot(akBaseObject))
			return
		endif

		if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
			CampDebug(1, "Unequipped body armor!")
			bEventRaised = RaiseEventOnGearUnequipped(akBaseObject, 1)
			CampData.CurrentBody = none
		endif
		if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
			CampDebug(1, "Unequipped gloves!")
			bEventRaised = RaiseEventOnGearUnequipped(akBaseObject, 2)
			CampData.CurrentHands = none
		endif
		if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
			CampDebug(1, "Unequipped helmet!")
			bEventRaised = RaiseEventOnGearUnequipped(akBaseObject, 3)
			CampData.CurrentHead = none
		endif
		if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
			CampDebug(1, "Unequipped boots!")
			bEventRaised = RaiseEventOnGearUnequipped(akBaseObject, 4)
			CampData.CurrentFeet = none
		endif
		if _Camp_Backpacks.HasForm(akBaseObject)
			bEventRaised = RaiseEventOnGearUnequipped(akBaseObject, 5)
			CampData.CurrentBackpack = none
		endif
		
		;Cloak check
		if !bEventRaised
			bool b = RaiseEventOnGearUnequipped(akBaseObject, 7)
		endif
		
	elseif akBaseObject as Ammo
		CampDebug(1, "Setting ammo to none")
		CampData.CurrentAmmo = none
		bool b = RaiseEventOnGearUnequipped(akBaseObject, 6)
	endif
endEvent

function ProcessEquippedObject(Form akBaseObject)
	WaitMenuMode(0.3)	;Helps prevent a race condition when switching equipment.
	bool bEventRaised = false

	if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
		CampData.CurrentBody = akBaseObject as Armor
		bEventRaised = RaiseEventOnGearEquipped(akBaseObject, 1)
		CampDebug(1, "The player equipped a piece of body armor.")
	endif
	if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
		CampData.CurrentHands = akBaseObject as Armor
		bEventRaised = RaiseEventOnGearEquipped(akBaseObject, 2)
		CampDebug(1, "The player equipped a piece of hand armor.")
	endif
	if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
		CampData.CurrentHead = akBaseObject as Armor
		bEventRaised = RaiseEventOnGearEquipped(akBaseObject, 3)
		CampDebug(1, "The player equipped a piece of head armor.")
	endif
	if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)	
		CampData.CurrentFeet = akBaseObject as Armor
		bEventRaised = RaiseEventOnGearEquipped(akBaseObject, 4)
		CampDebug(1, "The player equipped a piece of feet armor.")
	endif
	if !bEventRaised
		if _Camp_Backpacks.HasForm(akBaseObject)
			CampData.CurrentBackpack = akBaseObject as Armor
			bool b = RaiseEventOnGearEquipped(akBaseObject, 5)
			CampDebug(1, "The player equipped a backpack.")
		elseif akBaseObject as Ammo
			CampData.CurrentAmmo = akBaseObject as Ammo
			bool b = RaiseEventOnGearEquipped(akBaseObject, 6)
			CampDebug(1, "The player equipped ammo.")
		else
			;This object might be what Frostfall considers a cloak.
			bool b = RaiseEventOnGearEquipped(akBaseObject, 7)
			CampDebug(1, "The player equipped a cloak." + akBaseObject)
		endif
	endif
endFunction

bool function RaiseEventOnGearEquipped(Form akBaseObject, int iGearType)
	;===========
	;Parameters
	;===========
	;	akBaseObject: The base object the actor just equipped.
	;	iGearType: The type of gear the actor equipped, which is one of the following values:
	;		1: Body gear (Armor, clothing)
	;		2: Hands gear (Gauntlets, gloves)
	;		3: Head gear (Helmet, hat, hoods)
	;		4: Foot gear (Boots, shoes)
	;		5: Backpack
	;		6: Ammo
	;		7: Other (could be shield, cloak, etc)
	;===========
	;Notes
	;===========
	;	* The intent of this event is to notify when a piece of visual worn gear
	;	  (armor, clothing, backpacks, ammo, etc) is equipped, instead of every equipped
	;	  object. Primarily, the emphasis is on gear that has a substantive gameplay purpose
	;	  (not purely cosmetic or utility equipment).
	;
	;	* This event can be raised multiple times for the same Base Object if that object
	;	  is a set of "compound" gear (i.e. having more than one matching keyword, such 
	;	  as ArmorBody AND ArmorGauntlets), allowing you to act on each part of an otherwise
	;	  "one piece" set of gear (example: Vagabond Armor (Immersive Armors), which has both
	;	  body armor and a cloak).
	;
	;	* Unlike OnObjectEquipped, this event filters results based on the equipped item's
	;	  slot mask. Gear that utilizes slots 61 - 53, 51 - 47, or 45 will not be returned.
	;	  Slot 52 is not checked for compatibility reasons. These slots are checked in 
	;	  order of greatest to smallest, so if a piece of gear uses slots 61 and 30, it will 
	;	  be filtered out and this event will not be raised when the object is equipped.
	;
	;	* This event is not raised when weapons are equipped.

	if Compatibility.IsFrostfallLoaded
		FrostUtil.GetClothingSystem().ObjectEquipped(akBaseObject, iGearType)
	endif

	; Help prevent the system from becoming overloaded with many requests.
	Utility.Wait(0.2)

	return true
endFunction

bool function RaiseEventOnGearUnequipped(Form akBaseObject, int iGearType)
	;===========
	;Parameters
	;===========
	;	akBaseObject: The base object the actor just unequipped.
	;	iGearType: The type of gear the actor unequipped, which is one of the following values:
	;		1: Body gear (Armor, clothing)
	;		2: Hands gear (Gauntlets, gloves)
	;		3: Head gear (Helmet, hat, hoods)
	;		4: Foot gear (Boots, shoes)
	;		5: Backpack
	;		6: Ammo
	;		7: Other (could be shield, cloak, etc)
	;===========
	;Notes
	;===========
	;	* The intent of this event is to notify when a piece of visual worn gear
	;	  (armor, clothing, backpacks, ammo, etc) is unequipped, instead of every unequipped
	;	  object. Primarily, the emphasis is on gear that has a substantive gameplay purpose
	;	  (not purely cosmetic or utility equipment).
	;
	;	* This event can be raised multiple times for the same Base Object if that object
	;	  is a set of "compound" gear (i.e. having more than one matching keyword, such 
	;	  as ArmorBody AND ArmorGauntlets), allowing you to act on each part of an otherwise
	;	  "one piece" set of gear (example: Vagabond Armor (Immersive Armors), which has both
	;	  body armor and a cloak).
	;
	;	* Unlike OnObjectUnequipped, this event filters results based on the unequipped item's
	;	  slot mask. Gear that utilizes slots 61 - 53, 51 - 47, or 45 will not be returned.
	;	  Slot 52 is not checked for compatibility reasons. These slots are checked in 
	;	  order of greatest to smallest, so if a piece of gear uses slots 61 and 30, it will 
	;	  be filtered out and this event will not be raised when the object is unequipped.
	;
	;	* This event is not raised when weapons are unequipped.

	if Compatibility.IsFrostfallLoaded
		FrostUtil.GetClothingSystem().ObjectUnequipped(akBaseObject, iGearType)
	endif

	; Help prevent the system from becoming overloaded with many requests.
	Utility.Wait(0.2)

	return true
endFunction

bool function GetUsesMainBodySlot(Form akBaseObject)
	; Requires SKSE
	; Checks if akBaseObject uses one of the main gear slots for the body (30-39,41-43)
	; Returns True on slots 40 and 46 as well for cloak support

	if GetCompatibilitySystem().isSKSELoaded
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

Event OnRaceSwitchComplete()
	if Compatibility.IsFrostfallLoaded
		FrostUtil.GetClothingSystem().RaceChanged()
	endif
endEvent