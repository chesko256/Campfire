scriptname _Frost_ArmorProtectionDatastoreHandler extends _Frost_APDatastoreDefaultData

import StorageUtil
import StringUtil
import FrostUtil
import _FrostInternal

Keyword property _FrostData_ArmorBody auto
Keyword property _FrostData_ArmorHead auto
Keyword property _FrostData_ArmorHands auto
Keyword property _FrostData_ArmorFeet auto
Keyword property _FrostData_ArmorCloak auto
Keyword property _FrostData_ArmorShield auto

Keyword property ClothingCirclet auto

Keyword property ArmorCuirass auto
Keyword property ClothingBody auto
Keyword property ArmorGauntlets auto
Keyword property ClothingHands auto
Keyword property ArmorHelmet auto
Keyword property ClothingHead auto
Keyword property ArmorBoots auto
Keyword property ClothingFeet auto
FormList property _Camp_Backpacks auto

GlobalVariable property _Frost_DatastoreInitialized auto

int property DEFAULT_BODY_WARMTH 				= 110 autoReadOnly
int property DEFAULT_BODY_COVERAGE 				= 35 autoReadOnly
int property DEFAULT_HANDS_WARMTH 				= 12 autoReadOnly
int property DEFAULT_HANDS_COVERAGE 			= 6 autoReadOnly
int property DEFAULT_HEAD_WARMTH 				= 30 autoReadOnly
int property DEFAULT_HEAD_COVERAGE 				= 14 autoReadOnly
int property DEFAULT_HEADHOOD_WARMTH 			= 25 autoReadOnly
int property DEFAULT_HEADHOOD_COVERAGE 			= 43 autoReadOnly
int property DEFAULT_FEET_WARMTH 				= 12 autoReadOnly
int property DEFAULT_FEET_COVERAGE 				= 14 autoReadOnly
int property DEFAULT_SHIELD_WARMTH				= 0 autoReadOnly
int property DEFAULT_SHIELD_COVERAGE			= 20 autoReadOnly

Event OnInit()
	if !self.IsRunning()
		self.Start()
		return
	endif
	RevertDatastore()
EndEvent

int function GetGearType(Form akBaseObject)
	if !akBaseObject
		return -1
	endif
	bool bFound = false
	if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
		return 1
	endif
	if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
		return 2
	endif
	if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead)
		return 3
	endif
	if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)	
		return 4
	endif
	if !bFound
		if _Camp_Backpacks.HasForm(akBaseObject)
			return 5
		elseif akBaseObject as Ammo
			return 6
		elseif (akBaseObject as Armor).IsShield()
			return 8
		else
			return 7
		endif
	endif
endFunction

int[] function GetTotalProtectionValues(Armor akArmor, int aiGearType)
	int[] result = new int[2]
	if aiGearType == -1
		result[0] = -1
		result[1] = -1
		return result
	endif

	int warmth_val = 0
	int cover_val = 0
	string ds_key = GetDatastoreKeyFromForm(akArmor)

	if aiGearType == 1
		; Body mode - check body and all other slots
		; Body
		warmth_val = IntListGet(_FrostData_ArmorBody, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorBody, ds_key, 1) - 1
		; Try to set sane default values for the body
		if warmth_val == -1
			result[0] = result[0] + DEFAULT_BODY_WARMTH
			result[1] = result[1] + DEFAULT_BODY_COVERAGE
		else
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		; Hands
		warmth_val = IntListGet(_FrostData_ArmorHands, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorHands, ds_key, 1) - 1
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		; Head
		warmth_val = IntListGet(_FrostData_ArmorHead, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorHead, ds_key, 1) - 1
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		; Feet
		warmth_val = IntListGet(_FrostData_ArmorFeet, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorFeet, ds_key, 1) - 1
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		; Cloak
		warmth_val = IntListGet(_FrostData_ArmorCloak, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorCloak, ds_key, 1) - 1
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		
		return result
	elseif aiGearType == 3
		; Head mode - check head and cloak slots
		; Head
		warmth_val = IntListGet(_FrostData_ArmorHead, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorHead, ds_key, 1) - 1
		; Try to set sane default values for the head
		if warmth_val == -1
			if akArmor.HasKeyword(ClothingCirclet)
				result[0] = result[0] + 0
				result[1] = result[1] + 0
			elseif StringUtil.Find(akArmor.GetName(), "hood") != -1
				result[0] = result[0] + DEFAULT_HEADHOOD_WARMTH
				result[1] = result[1] + DEFAULT_HEADHOOD_COVERAGE
			else
				result[0] = result[0] + DEFAULT_HEAD_WARMTH
				result[1] = result[1] + DEFAULT_HEAD_COVERAGE
			endif
		else
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		; Cloak
		warmth_val = IntListGet(_FrostData_ArmorCloak, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorCloak, ds_key, 1) - 1
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif

		return result
	else
		; Normal mode - check single slot
		Keyword Datastore
		if aiGearType == 1
			Datastore = _FrostData_ArmorBody
		elseif aiGearType == 2
			Datastore = _FrostData_ArmorHands
		elseif aiGearType == 3
			Datastore = _FrostData_ArmorHead
		elseif aiGearType == 4
			Datastore = _FrostData_ArmorFeet
		elseif aiGearType == 7
			Datastore = _FrostData_ArmorCloak
		elseif aiGearType == 8
			Datastore = _FrostData_ArmorShield
		endif
	
		; Subtract 1 to return a falsey -1 on failure
		warmth_val = IntListGet(Datastore, ds_key, 0) - 1
		cover_val = IntListGet(Datastore, ds_key, 1) - 1
	
		if warmth_val == -1
			; Try to set sane default values
			if aiGearType == 1
				result[0] = result[0] + DEFAULT_BODY_WARMTH
				result[1] = result[1] + DEFAULT_BODY_COVERAGE
			elseif aiGearType == 2
				result[0] = result[0] + DEFAULT_HANDS_WARMTH
				result[1] = result[1] + DEFAULT_HANDS_COVERAGE
			elseif aiGearType == 3
				if akArmor.HasKeyword(ClothingCirclet)
					result[0] = result[0] + 0
					result[1] = result[1] + 0
				elseif StringUtil.Find(akArmor.GetName(), "hood") != -1
					result[0] = result[0] + DEFAULT_HEADHOOD_WARMTH
					result[1] = result[1] + DEFAULT_HEADHOOD_COVERAGE
				else
					result[0] = result[0] + DEFAULT_HEAD_WARMTH
					result[1] = result[1] + DEFAULT_HEAD_COVERAGE
				endif
			elseif aiGearType == 4
				result[0] = result[0] + DEFAULT_FEET_WARMTH
				result[1] = result[1] + DEFAULT_FEET_COVERAGE
			elseif aiGearType == 8
				result[0] = result[0] + DEFAULT_SHIELD_WARMTH
				result[1] = result[1] + DEFAULT_SHIELD_COVERAGE
			endif
		else
			result[0] = warmth_val
			result[1] = cover_val
		endif
		return result
	endif
endFunction

int[] function GetArmorProtectionData(Armor akArmor, int aiGearType, int aiMode = 0)
	if aiMode == 1
		; Body mode - check body and all other slots, return int[10]
		int[] result = new int[10]
		string ds_key = GetDatastoreKeyFromForm(akArmor)
		; Body
		result[0] = (IntListGet(_FrostData_ArmorBody, ds_key, 0) - 1)
		result[1] = (IntListGet(_FrostData_ArmorBody, ds_key, 1) - 1)
		; Try to set sane default values for the body
		if result[0] == -1
			result[0] = DEFAULT_BODY_WARMTH
			result[1] = DEFAULT_BODY_COVERAGE
		endif
		; Hands
		result[2] = (IntListGet(_FrostData_ArmorHands, ds_key, 0) - 1)
		result[3] = (IntListGet(_FrostData_ArmorHands, ds_key, 1) - 1)
		; Head
		result[4] = (IntListGet(_FrostData_ArmorHead, ds_key, 0) - 1)
		result[5] = (IntListGet(_FrostData_ArmorHead, ds_key, 1) - 1)
		; Feet
		result[6] = (IntListGet(_FrostData_ArmorFeet, ds_key, 0) - 1)
		result[7] = (IntListGet(_FrostData_ArmorFeet, ds_key, 1) - 1)
		; Cloak
		result[8] = (IntListGet(_FrostData_ArmorCloak, ds_key, 0) - 1)
		result[9] = (IntListGet(_FrostData_ArmorCloak, ds_key, 1) - 1)
		return result
	elseif aiMode == 2 
		; Head mode - check head and cloak slots, return int[4]
		int[] result = new int[4]
		string ds_key = GetDatastoreKeyFromForm(akArmor)
		; Head
		result[0] = (IntListGet(_FrostData_ArmorHead, ds_key, 0) - 1)
		result[1] = (IntListGet(_FrostData_ArmorHead, ds_key, 1) - 1)
		; Try to set sane default values for the head
		if result[0] == -1
			if akArmor.HasKeyword(ClothingCirclet)
				result[0] = 0
				result[1] = 0
			elseif StringUtil.Find(akArmor.GetName(), "hood") != -1
				result[0] = DEFAULT_HEADHOOD_WARMTH
				result[1] = DEFAULT_HEADHOOD_COVERAGE
			else
				result[0] = DEFAULT_HEAD_WARMTH
				result[1] = DEFAULT_HEAD_COVERAGE
			endif
		endif
		; Cloak
		result[2] = (IntListGet(_FrostData_ArmorCloak, ds_key, 0) - 1)
		result[3] = (IntListGet(_FrostData_ArmorCloak, ds_key, 1) - 1)
		return result
	else
		; Normal mode - check single slot, return int[2]
		int[] result = new int[2]
		string ds_key = GetDatastoreKeyFromForm(akArmor)
		Keyword Datastore
		if aiGearType == 1
			Datastore = _FrostData_ArmorBody
		elseif aiGearType == 2
			Datastore = _FrostData_ArmorHands
		elseif aiGearType == 3
			Datastore = _FrostData_ArmorHead
		elseif aiGearType == 4
			Datastore = _FrostData_ArmorFeet
		elseif aiGearType == 7
			Datastore = _FrostData_ArmorCloak
		elseif aiGearType == 8
			Datastore = _FrostData_ArmorShield
		endif
	
		; Subtract 1 to return a falsey -1 on failure
		result[0] = (IntListGet(Datastore, ds_key, 0) - 1)
		result[1] = (IntListGet(Datastore, ds_key, 1) - 1)
	
		if result[0] == -1
			; Try to set sane default values
			if aiGearType == 1
				result[0] = DEFAULT_BODY_WARMTH
				result[1] = DEFAULT_BODY_COVERAGE
			elseif aiGearType == 2
				result[0] = DEFAULT_HANDS_WARMTH
				result[1] = DEFAULT_HANDS_COVERAGE
			elseif aiGearType == 3
				if akArmor.HasKeyword(ClothingCirclet)
					result[0] = 0
					result[1] = 0
				elseif StringUtil.Find(akArmor.GetName(), "hood") != -1
					result[0] = DEFAULT_HEADHOOD_WARMTH
					result[1] = DEFAULT_HEADHOOD_COVERAGE
				else
					result[0] = DEFAULT_HEAD_WARMTH
					result[1] = DEFAULT_HEAD_COVERAGE
				endif
			elseif aiGearType == 4
				result[0] = DEFAULT_FEET_WARMTH
				result[1] = DEFAULT_FEET_COVERAGE
			elseif aiGearType == 8
				result[0] = DEFAULT_SHIELD_WARMTH
				result[1] = DEFAULT_SHIELD_COVERAGE
			endif
		endif
		return result
	endif
endFunction

string function GetDatastoreKeyFromForm(Armor akArmor)
	int form_id = akArmor.GetFormID()
	int mod_index = form_id/16777216
	if mod_index < 0
		mod_index = 0
	endif

	return (form_id % 16777216) + "___" + Game.GetModName(mod_index)
endFunction

string function GetDatastoreKeyFromID(int aiFormID)
	int mod_index = aiFormID/16777216
	if mod_index < 0
		mod_index = 0
	endif
	return (aiFormID % 16777216) + "___" + Game.GetModName(mod_index)
endFunction

function AddDatastoreEntryByKey(string asKey, int aiGearType, int aiWarmth, int aiCoverage)
	Keyword Datastore
	if aiGearType == 1
		Datastore = _FrostData_ArmorBody
	elseif aiGearType == 2
		Datastore = _FrostData_ArmorHands
	elseif aiGearType == 3
		Datastore = _FrostData_ArmorHead
	elseif aiGearType == 4
		Datastore = _FrostData_ArmorFeet
	elseif aiGearType == 7
		Datastore = _FrostData_ArmorCloak
	elseif aiGearType == 8
		Datastore = _FrostData_ArmorShield
	endif

	; Do we know if the entry exists already? Assume 'we know it doesn't' for now.
	; Add 1 so we can return a falsey -1 on failure later
	IntListAdd(Datastore, asKey, aiWarmth + 1)
	IntListAdd(Datastore, asKey, aiCoverage + 1)
endFunction

function AddDatastoreEntryByForm(Armor akArmor, int aiGearType, int aiWarmth, int aiCoverage)
	string ds_key = GetDatastoreKeyFromForm(akArmor)
	Keyword Datastore
	if aiGearType == 1
		Datastore = _FrostData_ArmorBody
	elseif aiGearType == 2
		Datastore = _FrostData_ArmorHands
	elseif aiGearType == 3
		Datastore = _FrostData_ArmorHead
	elseif aiGearType == 4
		Datastore = _FrostData_ArmorFeet
	elseif aiGearType == 7
		Datastore = _FrostData_ArmorCloak
	elseif aiGearType == 8
		Datastore = _FrostData_ArmorShield
	endif

	; Do we know if the entry exists already? Assume 'yes, we know it doesn't' for now.
	IntListAdd(Datastore, ds_key, aiWarmth + 1)
	IntListAdd(Datastore, ds_key, aiCoverage + 1)
endFunction

function UpdateDatastoreEntry(string asKey, int aiWarmth, int aiCoverage)

endFunction

function RevertDatastore()
	FrostDebug(1, "Setting default settings for body armor...")
	SetDefaults_Body()
	FrostDebug(1, "Setting default settings for body armor...done.")
	FrostDebug(1, "Setting default settings for hands armor...")
	SetDefaults_Hands()
	FrostDebug(1, "Setting default settings for hands armor...done.")
	FrostDebug(1, "Setting default settings for head armor...")
	SetDefaults_Head()
	FrostDebug(1, "Setting default settings for head armor...done.")
	FrostDebug(1, "Setting default settings for feet armor...")
	SetDefaults_Feet()
	FrostDebug(1, "Setting default settings for feet armor...done.")
	FrostDebug(1, "Setting default settings for cloak armor...")
	SetDefaults_Cloak()
	FrostDebug(1, "Setting default settings for cloak armor...done.")
	FrostDebug(1, "Setting default settings for shield armor...")
	SetDefaults_Shield()
	FrostDebug(1, "Setting default settings for shield armor...done.")
	_Frost_DatastoreInitialized.SetValueInt(2)
endFunction

function RevertDatastoreEntry(string asKey)

endFunction

;@TODO
;/Event OnKeyUp(int keyCode, float holdTime)
    if UI.IsMenuOpen("InventoryMenu")
        utility.WaitMenuMode(0.1)
        debug.trace("[Frost] ItemCard item formid " + UI.GetInt("InventoryMenu", "_root.Menu_mc.inventoryLists.itemList.selectedEntry.formId"))
        debug.trace("[Frost] ItemCard item name " + UI.GetString("InventoryMenu", "_root.Menu_mc.itemCard.ItemName.text"))
    endif
endEvent
/;