scriptname _Frost_ArmorProtectionDatastoreHandler extends _Frost_APDatastoreDefaultData

import StorageUtil
import StringUtil
import FrostUtil
import _FrostInternal
import Math

; TODO: Remove
Keyword property _FrostData_ArmorAll auto
Keyword property _FrostData_ArmorBody auto
Keyword property _FrostData_ArmorHead auto
Keyword property _FrostData_ArmorHands auto
Keyword property _FrostData_ArmorFeet auto
Keyword property _FrostData_ArmorCloak auto
Keyword property _FrostData_ArmorShield auto
Keyword property _FrostData_ArmorIgnore auto
Keyword property WAF_ClothingCloak auto

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

string CONFIG_PATH = 
string ARMOR_PROFILE_PREFIX = "armor_profile"
string ARMOR_DEFAULT_PREFIX = "armor_default_values"

function StopSystem()
	if self.IsRunning()
		self.Stop()
	endif
endFunction

function InitializeDatastore()
	if _Frost_DatastoreInitialized.GetValueInt() != 2
		RevertDatastore()
	endif
endFunction

int function GetGearType(Form akBaseObject)
	if !akBaseObject
		return -1
	endif

	; Gear Type Overrides
    if akBaseObject.HasKeyword(WAF_ClothingCloak)
        return 7
    endif
    Armor armor_object = akBaseObject as Armor
    if !armor_object
    	return -1
    endif
    int mySlotMask = armor_object.GetSlotMask()
    if LogicalAnd(mySlotMask, armor_object.kSlotMask31) && !LogicalAnd(mySlotMask, armor_object.kSlotMask32)
        return 3
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

bool function DatastoreHasEntry(string ds_key, int aiDatastoreType)
	Keyword Datastore
	if aiDatastoreType == 1
		Datastore = _FrostData_ArmorBody
	elseif aiDatastoreType == 2
		Datastore = _FrostData_ArmorHands
	elseif aiDatastoreType == 3
		Datastore = _FrostData_ArmorHead
	elseif aiDatastoreType == 4
		Datastore = _FrostData_ArmorFeet
	elseif aiDatastoreType == 7
		Datastore = _FrostData_ArmorCloak
	elseif aiDatastoreType == 8
		Datastore = _FrostData_ArmorShield
	elseif aiDatastoreType == 99
		Datastore = _FrostData_ArmorIgnore
	endif

	int result = IntListGet(Datastore, ds_key, 0) - 1
	if result >= 0
		return true
	else
		return false
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

	int in_ignore_list = IntListGet(_FrostData_ArmorIgnore, ds_key, 0) - 1
	if in_ignore_list == 0
		result[0] = 0
		result[1] = 0
		return result
	endif

	; Gear Type Overrides
    if akArmor.HasKeyword(WAF_ClothingCloak)
        aiGearType = 7
    endif
    int mySlotMask = akArmor.GetSlotMask()
    if LogicalAnd(mySlotMask, akArmor.kSlotMask31) && !LogicalAnd(mySlotMask, akArmor.kSlotMask32)
        aiGearType = 3
    endif

	;FrostDebug(0, "iGearType=" + aiGearType)
	if aiGearType == 1
		; Body mode - check body and all other slots
		; Body
		warmth_val = IntListGet(_FrostData_ArmorBody, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorBody, ds_key, 1) - 1
		;FrostDebug(0, "Returning body " + warmth_val + " " + cover_val)
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
		;FrostDebug(0, "Returning multi hands " + warmth_val + " " + cover_val)
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		; Head
		warmth_val = IntListGet(_FrostData_ArmorHead, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorHead, ds_key, 1) - 1
		;FrostDebug(0, "Returning multi head " + warmth_val + " " + cover_val)
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		; Feet
		warmth_val = IntListGet(_FrostData_ArmorFeet, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorFeet, ds_key, 1) - 1
		;FrostDebug(0, "Returning multi feet " + warmth_val + " " + cover_val)
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		; Cloak
		warmth_val = IntListGet(_FrostData_ArmorCloak, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorCloak, ds_key, 1) - 1
		;FrostDebug(0, "Returning multi feet " + warmth_val + " " + cover_val)
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif
		
		;FrostDebug(0, "Result: " + result)
		return result
	elseif aiGearType == 3
		; Head mode - check head and cloak slots
		; Head
		warmth_val = IntListGet(_FrostData_ArmorHead, ds_key, 0) - 1
		cover_val = IntListGet(_FrostData_ArmorHead, ds_key, 1) - 1
		;FrostDebug(0, "Returning head " + warmth_val + " " + cover_val)
		; Try to set sane default values for the head
		if warmth_val == -1
			if akArmor.HasKeyword(ClothingCirclet) || StringUtil.Find(akArmor.GetName(), "circlet") != -1
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
		;FrostDebug(0, "Returning multi cloak " + warmth_val + " " + cover_val)
		if warmth_val != -1
			result[0] = result[0] + warmth_val
			result[1] = result[1] + cover_val
		endif

		;FrostDebug(0, "Result: " + result)
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
		;FrostDebug(0, "Returning type " + aiGearType + " single " + warmth_val + " " + cover_val)
	
		if warmth_val == -1
			; Try to set sane default values
			if aiGearType == 1
				result[0] = result[0] + DEFAULT_BODY_WARMTH
				result[1] = result[1] + DEFAULT_BODY_COVERAGE
			elseif aiGearType == 2
				result[0] = result[0] + DEFAULT_HANDS_WARMTH
				result[1] = result[1] + DEFAULT_HANDS_COVERAGE
			elseif aiGearType == 3
				if akArmor.HasKeyword(ClothingCirclet) || StringUtil.Find(akArmor.GetName(), "circlet") != -1
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
			elseif aiGearType == 7
				; This item is not supposed to provide warmth or coverage.
				result[0] = -99
				result[1] = -99
			elseif aiGearType == 8
				result[0] = result[0] + DEFAULT_SHIELD_WARMTH
				result[1] = result[1] + DEFAULT_SHIELD_COVERAGE
			endif
		else
			result[0] = warmth_val
			result[1] = cover_val
		endif
		;FrostDebug(0, "Result: " + result)
		return result
	endif
endFunction

int[] function GetArmorProtectionData(Armor akArmor, int aiGearType, int aiMode = 0)
	
	; Gear Type Overrides
    if akArmor.HasKeyword(WAF_ClothingCloak)
        aiGearType = 7
    endif
    int mySlotMask = akArmor.GetSlotMask()
    if LogicalAnd(mySlotMask, akArmor.kSlotMask31) && !LogicalAnd(mySlotMask, akArmor.kSlotMask32)
        aiGearType = 3
    endif

    string ds_key = GetDatastoreKeyFromForm(akArmor)

    int in_ignore_list = IntListGet(_FrostData_ArmorIgnore, ds_key, 0) - 1
	if in_ignore_list == 0
		if aiMode == 1
			int[] result = new int[10]
			result[0] = 0
			result[1] = 0
			result[2] = 0
			result[3] = 0
			result[4] = 0
			result[5] = 0
			result[6] = 0
			result[7] = 0
			result[8] = 0
			result[9] = 0
			return result
		elseif aiMode == 2
			int[] result = new int[4]
			result[0] = 0
			result[1] = 0
			result[2] = 0
			result[3] = 0
			return result
		else
			int[] result = new int[2]	
			result[0] = 0
			result[1] = 0
			return result
		endif
	endif


	; TEMPORARY
	int[] result = new int[2]
	result[0] = (IntListGet(_FrostData_ArmorAll, ds_key, 0) - 1)
	result[1] = (IntListGet(_FrostData_ArmorAll, ds_key, 1) - 1)
	return result


	;/if aiMode == 1
		; Body mode - check body and all other slots, return int[10]
		int[] result = new int[10]
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
		; Head
		result[0] = (IntListGet(_FrostData_ArmorHead, ds_key, 0) - 1)
		result[1] = (IntListGet(_FrostData_ArmorHead, ds_key, 1) - 1)
		; Try to set sane default values for the head
		if result[0] == -1
			if akArmor.HasKeyword(ClothingCirclet) || StringUtil.Find(akArmor.GetName(), "circlet") != -1
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
		;FrostDebug(0, "Result: " + result)
		return result
	else
		; Normal mode - check single slot, return int[2]
		int[] result = new int[2]
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
				if akArmor.HasKeyword(ClothingCirclet) || StringUtil.Find(akArmor.GetName(), "circlet") != -1
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
		;FrostDebug(0, "Result: " + result)
		return result
	endif/;
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
	; TODO: Remove
	;/if aiGearType == 1
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
	elseif aiGearType == 99
		Datastore = _FrostData_ArmorIgnore
	endif
	/;

	Keyword Datastore
	if aiGearType == 99
		Datastore = _FrostData_ArmorIgnore
	else
		Datastore = _FrostData_ArmorAll
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

function RevertDatastore()
	;@TODO
	; DEPRECATED - Just reinitialize defaults for modded armor instead.
	RestoreAllDefaultArmorData()

	;/FrostDebug(1, "Setting default settings for body armor...")
	SetDefaults_Body()
	FrostDebug(1, "Setting default settings for body armor...done.")
	FrostDebug(1, "Setting default settings for head armor...")
	SetDefaults_Head()
	FrostDebug(1, "Setting default settings for head armor...done.")
	FrostDebug(1, "Setting default settings for hands armor...")
	SetDefaults_Hands()
	FrostDebug(1, "Setting default settings for hands armor...done.")
	FrostDebug(1, "Setting default settings for feet armor...")
	SetDefaults_Feet()
	FrostDebug(1, "Setting default settings for feet armor...done.")
	FrostDebug(1, "Setting default settings for cloak armor...")
	SetDefaults_Cloak()
	FrostDebug(1, "Setting default settings for cloak armor...done.")
	FrostDebug(1, "Setting default settings for shield armor...")
	SetDefaults_Shield()
	FrostDebug(1, "Setting default settings for shield armor...done.")
	/;

	_Frost_DatastoreInitialized.SetValueInt(2)
endFunction

; Frostfall 3.1 Stuff

; Expose in CampUtil with ArmorProtectionDataExists(Armor akArmor)
bool function DatastoreHasKey(string asProfilePath, string asKey)
	if JsonUtil.IntListGet(asProfilePath, asKey, 0) != 0
		return true
	else
		return false
	endif
endFunction

; CRUD
function SetArmorData(Armor akArmor, int aiWarmth = 0, int aiCoverage = 0,						\
									 int aiExtraBodyWarmth = 0, int aiExtraBodyCoverage = 0, 	\
									 int aiExtraHeadWarmth = 0, int aiExtraHeadCoverage = 0, 	\
									 int aiExtraHandsWarmth = 0, int aiExtraHandsCoverage = 0, 	\
									 int aiExtraFeetWarmth = 0, int aiExtraFeetCoverage = 0, 	\
									 int aiExtraCloakWarmth = 0, int aiExtraCloakCoverage = 0, 	\
									 int aiExtraMiscWarmth = 0, int aiExtraMiscCoverage = 0, 	\
									 bool abIgnore = false)
	
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if !DatastoreHasKey(profile_path, dskey)
		; + 1 so that 0 is a meaningful value on Get
		JsonUtil.IntListAdd(profile_path, dskey, aiWarmth				+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiCoverage				+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraBodyWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraBodyCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraHeadWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraHeadCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraHandsWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraHandsCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraFeetWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraFeetCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraCloakWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraCloakCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraMiscWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, dskey, aiExtraMiscCoverage	+ 1)
		int ignore_flag
		if abIgnore
			ignore_flag = 1
		else
			ignore_flag = 0
		endif
		JsonUtil.IntListAdd(profile_path, dskey, ignore_flag	+ 1)
		JsonUtil.Save(profile_path)
	endif
endFunction

function SetArmorDataA(Armor akArmor, int[] aiProtectionValues)
	
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if !DatastoreHasKey(profile_path, dskey)
		; + 1 so that 0 is a meaningful value on Get
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[0]	+ 1) ; aiWarmth
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[1]	+ 1) ; aiCoverage
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[2]	+ 1) ; aiExtraBodyWarmth
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[3]	+ 1) ; aiExtraBodyCoverage
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[4]	+ 1) ; aiExtraHeadWarmth
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[5]	+ 1) ; aiExtraHeadCoverage
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[6]	+ 1) ; aiExtraHandsWarmth
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[7]	+ 1) ; aiExtraHandsCoverage
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[8]	+ 1) ; aiExtraFeetWarmth
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[9]	+ 1) ; aiExtraFeetCoverage
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[10]	+ 1) ; aiExtraCloakWarmth
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[11]	+ 1) ; aiExtraCloakCoverage
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[12]	+ 1) ; aiExtraMiscWarmth
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[13]	+ 1) ; aiExtraMiscCoverage
		JsonUtil.IntListAdd(profile_path, dskey, aiProtectionValues[14]	+ 1) ; abIgnore
		JsonUtil.Save(profile_path)
	endif
endFunction

bool function UpdateArmorData(Armor akArmor, int aiWarmth = -1, int aiCoverage = -1, 					\
	                                        int aiExtraBodyWarmth = -1, int aiExtraBodyCoverage = -1, 	\
	                                        int aiExtraHeadWarmth = -1, int aiExtraHeadCoverage = -1, 	\
	                                        int aiExtraHandsWarmth = -1, int aiExtraHandsCoverage = -1, \
	                                        int aiExtraFeetWarmth = -1, int aiExtraFeetCoverage = -1, 	\
	                                        int aiExtraCloakWarmth = -1, int aiExtraCloakCoverage = -1, \
	                                        int aiExtraMiscWarmth = -1, int aiExtraMiscCoverage = -1)
	
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if DatastoreHasKey(profile_path, dskey)
		; + 1 so that 0 is a meaningful value on Get
		if aiWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 0, aiWarmth				+ 1)
		endif
		if aiCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 1, aiCoverage				+ 1)
		endif
		if aiExtraBodyWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 2, aiExtraBodyWarmth		+ 1)
		endif
		if aiExtraBodyCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 3, aiExtraBodyCoverage		+ 1)
		endif
		if aiExtraHeadWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 4, aiExtraHeadWarmth		+ 1)
		endif
		if aiExtraHeadCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 5, aiExtraHeadCoverage		+ 1)
		endif
		if aiExtraHandsWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 6, aiExtraHandsWarmth		+ 1)
		endif
		if aiExtraHandsCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 7, aiExtraHandsCoverage	+ 1)
		endif
		if aiExtraFeetWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 8, aiExtraFeetWarmth		+ 1)
		endif
		if aiExtraFeetCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 9, aiExtraFeetCoverage		+ 1)
		endif
		if aiExtraCloakWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 10, aiExtraCloakWarmth		+ 1)
		endif
		if aiExtraCloakCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 11, aiExtraCloakCoverage	+ 1)
		endif
		if aiExtraMiscWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 12, aiExtraMiscWarmth		+ 1)
		endif
		if aiExtraMiscCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 13, aiExtraMiscCoverage	+ 1)
		endif
		if abIgnore != -1
			int ignore_flag
			if abIgnore
				ignore_flag = 1
			else
				ignore_flag = 0
			endif
			JsonUtil.IntListSet(profile_path, dskey, 14, ignore_flag			+ 1)
		endif
		JsonUtil.Save(profile_path)
		return true
	else
		return false
	endif
endFunction

bool function UpdateArmorDataA(Armor akArmor, int[] aiProtectionValues)
	
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if DatastoreHasKey(profile_path, dskey)
		; + 1 so that 0 is a meaningful value on Get
		if aiProtectionValues[0] != -1
			JsonUtil.IntListSet(profile_path, dskey, 0, aiProtectionValues[0]		+ 1)
		endif
		if aiProtectionValues[1] != -1
			JsonUtil.IntListSet(profile_path, dskey, 1, aiProtectionValues[1]		+ 1)
		endif
		if aiProtectionValues[2] != -1
			JsonUtil.IntListSet(profile_path, dskey, 2, aiProtectionValues[2]		+ 1)
		endif
		if aiProtectionValues[3] != -1
			JsonUtil.IntListSet(profile_path, dskey, 3, aiProtectionValues[3]		+ 1)
		endif
		if aiProtectionValues[4] != -1
			JsonUtil.IntListSet(profile_path, dskey, 4, aiProtectionValues[4]		+ 1)
		endif
		if aiProtectionValues[5] != -1
			JsonUtil.IntListSet(profile_path, dskey, 5, aiProtectionValues[5]		+ 1)
		endif
		if aiProtectionValues[6] != -1
			JsonUtil.IntListSet(profile_path, dskey, 6, aiProtectionValues[6]		+ 1)
		endif
		if aiProtectionValues[7] != -1
			JsonUtil.IntListSet(profile_path, dskey, 7, aiProtectionValues[7]		+ 1)
		endif
		if aiProtectionValues[8] != -1
			JsonUtil.IntListSet(profile_path, dskey, 8, aiProtectionValues[8]		+ 1)
		endif
		if aiProtectionValues[9] != -1
			JsonUtil.IntListSet(profile_path, dskey, 9, aiProtectionValues[9]		+ 1)
		endif
		if aiProtectionValues[10] != -1
			JsonUtil.IntListSet(profile_path, dskey, 10, aiProtectionValues[10]		+ 1)
		endif
		if aiProtectionValues[11] != -1
			JsonUtil.IntListSet(profile_path, dskey, 11, aiProtectionValues[11]		+ 1)
		endif
		if aiProtectionValues[12] != -1
			JsonUtil.IntListSet(profile_path, dskey, 12, aiProtectionValues[12]		+ 1)
		endif
		if aiProtectionValues[13] != -1
			JsonUtil.IntListSet(profile_path, dskey, 13, aiProtectionValues[13]		+ 1)
		endif
		if aiProtectionValues[14] != -1
			JsonUtil.IntListSet(profile_path, dskey, 14, aiProtectionValues[14]		+ 1)
		endif
		JsonUtil.Save(profile_path)
		return true
	else
		return false
	endif
endFunction

function DeleteArmorData(Armor akArmor)
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	IntListClear(profile_path, dskey)
endFunction

; GET
int[] function GetArmorData(Armor akArmor)
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	int[] armor_data = new int[15]
	if DatastoreHasKey(profile_path, dskey)
		armor_data[0] = JsonUtil.IntListGet(profile_path, dskey, 0) - 1
		armor_data[1] = JsonUtil.IntListGet(profile_path, dskey, 1) - 1
		armor_data[2] = JsonUtil.IntListGet(profile_path, dskey, 2) - 1
		armor_data[3] = JsonUtil.IntListGet(profile_path, dskey, 3) - 1
		armor_data[4] = JsonUtil.IntListGet(profile_path, dskey, 4) - 1
		armor_data[5] = JsonUtil.IntListGet(profile_path, dskey, 5) - 1
		armor_data[6] = JsonUtil.IntListGet(profile_path, dskey, 6) - 1
		armor_data[7] = JsonUtil.IntListGet(profile_path, dskey, 7) - 1
		armor_data[8] = JsonUtil.IntListGet(profile_path, dskey, 8) - 1
		armor_data[9] = JsonUtil.IntListGet(profile_path, dskey, 9) - 1
		armor_data[10] = JsonUtil.IntListGet(profile_path, dskey, 10) - 1
		armor_data[11] = JsonUtil.IntListGet(profile_path, dskey, 11) - 1
		armor_data[12] = JsonUtil.IntListGet(profile_path, dskey, 12) - 1
		armor_data[13] = JsonUtil.IntListGet(profile_path, dskey, 13) - 1
		armor_data[14] = JsonUtil.IntListGet(profile_path, dskey, 14) - 1
	endif
	return armor_data
endFunction

int[] function GetDefaultArmorData(Armor akArmor, bool abRawValues = false)
	string defaults_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	string dskey = GetDatastoreKeyFromForm(akArmor)
	int[] armor_data = new int[15]
	if DatastoreHasKey(defaults_path, dskey)
		int modifier = 0
		if abRawValues
			modifier = 1
		endif

		armor_data[0] = JsonUtil.IntListGet(profile_path, dskey, 0) - modifier
		armor_data[1] = JsonUtil.IntListGet(profile_path, dskey, 1) - modifier
		armor_data[2] = JsonUtil.IntListGet(profile_path, dskey, 2) - modifier
		armor_data[3] = JsonUtil.IntListGet(profile_path, dskey, 3) - modifier
		armor_data[4] = JsonUtil.IntListGet(profile_path, dskey, 4) - modifier
		armor_data[5] = JsonUtil.IntListGet(profile_path, dskey, 5) - modifier
		armor_data[6] = JsonUtil.IntListGet(profile_path, dskey, 6) - modifier
		armor_data[7] = JsonUtil.IntListGet(profile_path, dskey, 7) - modifier
		armor_data[8] = JsonUtil.IntListGet(profile_path, dskey, 8) - modifier
		armor_data[9] = JsonUtil.IntListGet(profile_path, dskey, 9) - modifier
		armor_data[10] = JsonUtil.IntListGet(profile_path, dskey, 10) - modifier
		armor_data[11] = JsonUtil.IntListGet(profile_path, dskey, 11) - modifier
		armor_data[12] = JsonUtil.IntListGet(profile_path, dskey, 12) - modifier
		armor_data[13] = JsonUtil.IntListGet(profile_path, dskey, 13) - modifier
		armor_data[14] = JsonUtil.IntListGet(profile_path, dskey, 14) - modifier
	endif
	return armor_data
endFunction

function RestoreDefaultArmorData(Armor akArmor, bool abRemoveIfNoDefaultData = false)
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string defaults_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if DatastoreHasKey(profile_path, dskey)
		if DatastoreHasKey(defaults_path, dskey)
			JsonUtil.IntListSet(profile_path, dskey, 0, JsonUtil.IntListGet(defaults_path, dskey, 0))
			JsonUtil.IntListSet(profile_path, dskey, 1, JsonUtil.IntListGet(defaults_path, dskey, 1))
			JsonUtil.IntListSet(profile_path, dskey, 2, JsonUtil.IntListGet(defaults_path, dskey, 2))
			JsonUtil.IntListSet(profile_path, dskey, 3, JsonUtil.IntListGet(defaults_path, dskey, 3))
			JsonUtil.IntListSet(profile_path, dskey, 4, JsonUtil.IntListGet(defaults_path, dskey, 4))
			JsonUtil.IntListSet(profile_path, dskey, 5, JsonUtil.IntListGet(defaults_path, dskey, 5))
			JsonUtil.IntListSet(profile_path, dskey, 6, JsonUtil.IntListGet(defaults_path, dskey, 6))
			JsonUtil.IntListSet(profile_path, dskey, 7, JsonUtil.IntListGet(defaults_path, dskey, 7))
			JsonUtil.IntListSet(profile_path, dskey, 8, JsonUtil.IntListGet(defaults_path, dskey, 8))
			JsonUtil.IntListSet(profile_path, dskey, 9, JsonUtil.IntListGet(defaults_path, dskey, 9))
			JsonUtil.IntListSet(profile_path, dskey, 10, JsonUtil.IntListGet(defaults_path, dskey, 10))
			JsonUtil.IntListSet(profile_path, dskey, 11, JsonUtil.IntListGet(defaults_path, dskey, 11))
			JsonUtil.IntListSet(profile_path, dskey, 12, JsonUtil.IntListGet(defaults_path, dskey, 12))
			JsonUtil.IntListSet(profile_path, dskey, 13, JsonUtil.IntListGet(defaults_path, dskey, 13))
			JsonUtil.IntListSet(profile_path, dskey, 14, JsonUtil.IntListGet(defaults_path, dskey, 14))
			JsonUtil.Save(profile_path)
		else
			if abRemoveIfNoDefaultData
				JsonUtil.IntListClear(profile_path, dskey)
			endif
		endif
	else
		if DatastoreHasKey(defaults_path, dskey)
			SetArmorDataA(akArmor, GetDefaultArmorData(akArmor, true))
		endif
	endif
endFunction

function RestoreAllDefaultArmorData()
	; The nuclear option - destroys all custom armor data on a profile
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	JsonUtil.ClearAll(CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt())
endFunction