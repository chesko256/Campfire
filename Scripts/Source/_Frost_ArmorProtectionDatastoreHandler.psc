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

int property DEFAULT_BODY_WARMTH 				= 110 autoReadOnly hidden
int property DEFAULT_BODY_COVERAGE 				= 35 autoReadOnly hidden
int property DEFAULT_HANDS_WARMTH 				= 12 autoReadOnly hidden
int property DEFAULT_HANDS_COVERAGE 			= 6 autoReadOnly hidden
int property DEFAULT_HEAD_WARMTH 				= 30 autoReadOnly hidden
int property DEFAULT_HEAD_COVERAGE 				= 14 autoReadOnly hidden
int property DEFAULT_HEADHOOD_WARMTH 			= 25 autoReadOnly hidden
int property DEFAULT_HEADHOOD_COVERAGE 			= 43 autoReadOnly hidden
int property DEFAULT_FEET_WARMTH 				= 12 autoReadOnly hidden
int property DEFAULT_FEET_COVERAGE 				= 14 autoReadOnly hidden
int property DEFAULT_CLOAK_WARMTH				= 10 autoReadOnly hidden
int property DEFAULT_CLOAK_COVERAGE				= 10 autoReadOnly hidden
int property DEFAULT_SHIELD_WARMTH				= 0 autoReadOnly hidden
int property DEFAULT_SHIELD_COVERAGE			= 20 autoReadOnly hidden

int property SLOTMASK_HEAD 						= Armor.kSlotMask30 autoReadOnly hidden
int property SLOTMASK_HAIR 						= Armor.kSlotMask31 autoReadOnly hidden
int property SLOTMASK_BODY 						= Armor.kSlotMask32 autoReadOnly hidden
int property SLOTMASK_HANDS 					= Armor.kSlotMask33 autoReadOnly hidden
int property SLOTMASK_FOREARMS 					= Armor.kSlotMask34 autoReadOnly hidden
int property SLOTMASK_AMULET 					= Armor.kSlotMask35 autoReadOnly hidden
int property SLOTMASK_RING 						= Armor.kSlotMask36 autoReadOnly hidden
int property SLOTMASK_FEET 						= Armor.kSlotMask37 autoReadOnly hidden
int property SLOTMASK_CALVES 					= Armor.kSlotMask38 autoReadOnly hidden
int property SLOTMASK_SHIELD 					= Armor.kSlotMask39 autoReadOnly hidden
int property SLOTMASK_TAIL 						= Armor.kSlotMask40 autoReadOnly hidden
int property SLOTMASK_LONGHAIR 					= Armor.kSlotMask41 autoReadOnly hidden
int property SLOTMASK_CIRCLET 					= Armor.kSlotMask42 autoReadOnly hidden
int property SLOTMASK_EARS 						= Armor.kSlotMask43 autoReadOnly hidden
int property SLOTMASK_CLOAK 					= Armor.kSlotMask46 autoReadOnly hidden
int property SLOTMASK_BACKPACK 					= Armor.kSlotMask47 autoReadOnly hidden

int property GEARTYPE_BODY = 1 autoReadOnly hidden
int property GEARTYPE_HEAD = 2 autoReadOnly hidden
int property GEARTYPE_HANDS = 3 autoReadOnly hidden
int property GEARTYPE_FEET = 4 autoReadOnly hidden
int property GEARTYPE_CLOAK = 5 autoReadOnly hidden
int property GEARTYPE_MISC = 6 autoReadOnly hidden


string CONFIG_PATH = "../FrostfallData/"
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

int[] function GetTotalProtectionValues(Armor akArmor)
	int[] armor_data = new int[2]

	int warmth_val = 0
	int cover_val = 0
	int[] ap = GetArmorProtectionData(akArmor)

	; -1?
	if ap[14] == 1
		armor_data[0] = 0
		armor_data[1] = 0
		return armor_data
	endif

	warmth_val = ap[0] + ap[2] + ap[4] + ap[6] + ap[8] + ap[10] + ap[12]
	cover_val = ap[1] + ap[3] + ap[5] + ap[7] + ap[9] + ap[11] + ap[13]

	return armor_data
endFunction

int[] function GetArmorProtectionDataByKeyword(Armor akArmor)
	
endFunction

int[] function GetArmorProtectionDataByAnalysis(Armor akArmor)
	int[] armor_data = new int[15]
	int gear_type = 0

	; The slot mask is the single source of truth for what "kind" of armor this is.
	int armor_mask = akArmor.GetSlotMask()

	; Check exceptions
	if LogicalAnd(armor_mask, SLOTMASK_CIRCLET)
		return armor_data
	endif
	if LogicalAnd(armor_mask, SLOTMASK_RING) || LogicalAnd(armor_mask, SLOTMASK_AMULET)
		armor_data[14] = 1
		return armor_data
	endif

	; Check base types
	if LogicalAnd(armor_mask, SLOTMASK_BODY)
		gear_type = GEARTYPE_BODY
	elseif LogicalAnd(armor_mask, SLOTMASK_HAIR) || LogicalAnd(armor_mask, SLOTMASK_HEAD)
		gear_type = GEARTYPE_HEAD
	elseif LogicalAnd(armor_mask, SLOTMASK_HANDS)
		gear_type = GEARTYPE_HANDS
	elseif LogicalAnd(armor_mask, SLOTMASK_FEET)
		gear_type = GEARTYPE_FEET
	elseif LogicalAnd(armor_mask, SLOTMASK_CLOAK) || akArmor.HasKeyword(WAF_ClothingCloak)
		gear_type = GEARTYPE_CLOAK
	elseif LogicalAnd(armor_mask, SLOTMASK_SHIELD)
		gear_type = GEARTYPE_MISC
	endif

	if gear_type == 0
		; No gear type found for this item. Ignore it.
		armor_data[14] = 1
		return armor_data
	endif

	if gear_type == GEARTYPE_BODY
		armor_data[0] = DEFAULT_BODY_WARMTH
		armor_data[1] = DEFAULT_BODY_COVERAGE
	elseif gear_type == GEARTYPE_HEAD
		; Coarsely differentiate between hoods and helms
		if StringUtil.Find(akArmor.GetName(), "hood") != -1
			armor_data[0] = DEFAULT_HEADHOOD_WARMTH
			armor_data[1] = DEFAULT_HEADHOOD_COVERAGE
		else
			armor_data[0] = DEFAULT_HEAD_WARMTH
			armor_data[1] = DEFAULT_HEAD_COVERAGE
		endif
	elseif gear_type == GEARTYPE_HANDS
		armor_data[0] = DEFAULT_HANDS_WARMTH
		armor_data[1] = DEFAULT_HANDS_COVERAGE
	elseif gear_type == GEARTYPE_FEET
		armor_data[0] = DEFAULT_FEET_WARMTH
		armor_data[1] = DEFAULT_FEET_COVERAGE
	elseif gear_type == GEARTYPE_CLOAK
		armor_data[0] = DEFAULT_CLOAK_WARMTH
		armor_data[1] = DEFAULT_CLOAK_COVERAGE
	elseif gear_type == GEARTYPE_MISC
		; Only process shields in this category by default.
		armor_data[0] = DEFAULT_SHIELD_WARMTH
		armor_data[1] = DEFAULT_SHIELD_COVERAGE
	endif

	; Now, check extra data
	if gear_type != GEARTYPE_HEAD && (LogicalAnd(armor_mask, SLOTMASK_HAIR) || LogicalAnd(armor_mask, SLOTMASK_HEAD))
		; Coarsely differentiate between hoods and helms
		if StringUtil.Find(akArmor.GetName(), "hood") != -1
			armor_data[4] = DEFAULT_HEADHOOD_WARMTH
			armor_data[5] = DEFAULT_HEADHOOD_COVERAGE
		else
			armor_data[4] = DEFAULT_HEAD_WARMTH
			armor_data[5] = DEFAULT_HEAD_COVERAGE
		endif
	endif
	if gear_type != GEARTYPE_HANDS && LogicalAnd(armor_mask, SLOTMASK_HANDS)
		armor_data[6] = DEFAULT_HANDS_WARMTH
		armor_data[7] = DEFAULT_HANDS_COVERAGE
	endif
	if gear_type != GEARTYPE_FEET && LogicalAnd(armor_mask, SLOTMASK_FEET)
		armor_data[8] = DEFAULT_FEET_WARMTH
		armor_data[9] = DEFAULT_FEET_COVERAGE
	endif
	if gear_type != GEARTYPE_CLOAK && (LogicalAnd(armor_mask, SLOTMASK_CLOAK) || akArmor.HasKeyword(WAF_ClothingCloak))
		armor_data[10] = DEFAULT_CLOAK_WARMTH
		armor_data[11] = DEFAULT_CLOAK_COVERAGE
	endif

	FrostDebug(0, "GetArmorProtectionDataByAnalysis Result: " + armor_data)
	return armor_data
endFunction

int[] function GetArmorProtectionData(Armor akArmor)
    string dskey = GetDatastoreKeyFromForm(akArmor)
    int[] armor_data = GetArmorData(akArmor)
    
    if armor_data[14] == 1 ; Ignore
    	return armor_data
    endif

    if armor_data[0] == -1 ; No entry for this armor.
    	armor_data = GetArmorProtectionDataByKeyword(akArmor)
    	if armor_data[0] == -1
    		armor_data = GetArmorProtectionDataByAnalysis(akArmor)
    	endif
    endif

    ; -1?
    return armor_data
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
function SetArmorDataByKey(string asKey, int aiWarmth = 0, int aiCoverage = 0,					\
									 int aiExtraBodyWarmth = 0, int aiExtraBodyCoverage = 0, 	\
									 int aiExtraHeadWarmth = 0, int aiExtraHeadCoverage = 0, 	\
									 int aiExtraHandsWarmth = 0, int aiExtraHandsCoverage = 0, 	\
									 int aiExtraFeetWarmth = 0, int aiExtraFeetCoverage = 0, 	\
									 int aiExtraCloakWarmth = 0, int aiExtraCloakCoverage = 0, 	\
									 int aiExtraMiscWarmth = 0, int aiExtraMiscCoverage = 0, 	\
									 bool abIgnore = false)
	
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	if !DatastoreHasKey(profile_path, asKey)
		; + 1 so that 0 is a meaningful value on Get
		JsonUtil.IntListAdd(profile_path, asKey, aiWarmth				+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiCoverage				+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraBodyWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraBodyCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraHeadWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraHeadCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraHandsWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraHandsCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraFeetWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraFeetCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraCloakWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraCloakCoverage	+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraMiscWarmth		+ 1)
		JsonUtil.IntListAdd(profile_path, asKey, aiExtraMiscCoverage	+ 1)
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
	armor_data[0] = -1

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