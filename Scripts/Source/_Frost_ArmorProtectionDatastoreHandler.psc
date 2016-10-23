scriptname _Frost_ArmorProtectionDatastoreHandler extends Quest

import StorageUtil
import StringUtil
import CampUtil
import FrostUtil
import _FrostInternal
import Math

Keyword property _FrostData_ArmorPrecache auto

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

; Override keywords
Keyword property _Frost_Ignore auto
Keyword property _Frost_WarmthPoor auto
Keyword property _Frost_WarmthFair auto
Keyword property _Frost_WarmthGood auto
Keyword property _Frost_WarmthExcellent auto
Keyword property _Frost_WarmthMax auto
Keyword property _Frost_CoveragePoor auto
Keyword property _Frost_CoverageFair auto
Keyword property _Frost_CoverageGood auto
Keyword property _Frost_CoverageExcellent auto
Keyword property _Frost_CoverageMax auto

Keyword property _Frost_ExtraBodyWarmthPoor auto
Keyword property _Frost_ExtraBodyWarmthFair auto
Keyword property _Frost_ExtraBodyWarmthGood auto
Keyword property _Frost_ExtraBodyWarmthExcellent auto
Keyword property _Frost_ExtraBodyWarmthMax auto

Keyword property _Frost_ExtraHeadWarmthPoor auto
Keyword property _Frost_ExtraHeadWarmthFair auto
Keyword property _Frost_ExtraHeadWarmthGood auto
Keyword property _Frost_ExtraHeadWarmthExcellent auto
Keyword property _Frost_ExtraHeadWarmthMax auto

Keyword property _Frost_ExtraHandsWarmthPoor auto
Keyword property _Frost_ExtraHandsWarmthFair auto
Keyword property _Frost_ExtraHandsWarmthGood auto
Keyword property _Frost_ExtraHandsWarmthExcellent auto
Keyword property _Frost_ExtraHandsWarmthMax auto

Keyword property _Frost_ExtraFeetWarmthPoor auto
Keyword property _Frost_ExtraFeetWarmthFair auto
Keyword property _Frost_ExtraFeetWarmthGood auto
Keyword property _Frost_ExtraFeetWarmthExcellent auto
Keyword property _Frost_ExtraFeetWarmthMax auto

Keyword property _Frost_ExtraCloakWarmthPoor auto
Keyword property _Frost_ExtraCloakWarmthFair auto
Keyword property _Frost_ExtraCloakWarmthGood auto
Keyword property _Frost_ExtraCloakWarmthExcellent auto
Keyword property _Frost_ExtraCloakWarmthMax auto

Keyword property _Frost_ExtraMiscWarmthPoor auto
Keyword property _Frost_ExtraMiscWarmthFair auto
Keyword property _Frost_ExtraMiscWarmthGood auto
Keyword property _Frost_ExtraMiscWarmthExcellent auto
Keyword property _Frost_ExtraMiscWarmthMax auto

Keyword property _Frost_ExtraBodyCoveragePoor auto
Keyword property _Frost_ExtraBodyCoverageFair auto
Keyword property _Frost_ExtraBodyCoverageGood auto
Keyword property _Frost_ExtraBodyCoverageExcellent auto
Keyword property _Frost_ExtraBodyCoverageMax auto

Keyword property _Frost_ExtraHeadCoveragePoor auto
Keyword property _Frost_ExtraHeadCoverageFair auto
Keyword property _Frost_ExtraHeadCoverageGood auto
Keyword property _Frost_ExtraHeadCoverageExcellent auto
Keyword property _Frost_ExtraHeadCoverageMax auto

Keyword property _Frost_ExtraHandsCoveragePoor auto
Keyword property _Frost_ExtraHandsCoverageFair auto
Keyword property _Frost_ExtraHandsCoverageGood auto
Keyword property _Frost_ExtraHandsCoverageExcellent auto
Keyword property _Frost_ExtraHandsCoverageMax auto

Keyword property _Frost_ExtraFeetCoveragePoor auto
Keyword property _Frost_ExtraFeetCoverageFair auto
Keyword property _Frost_ExtraFeetCoverageGood auto
Keyword property _Frost_ExtraFeetCoverageExcellent auto
Keyword property _Frost_ExtraFeetCoverageMax auto

Keyword property _Frost_ExtraCloakCoveragePoor auto
Keyword property _Frost_ExtraCloakCoverageFair auto
Keyword property _Frost_ExtraCloakCoverageGood auto
Keyword property _Frost_ExtraCloakCoverageExcellent auto
Keyword property _Frost_ExtraCloakCoverageMax auto

Keyword property _Frost_ExtraMiscCoveragePoor auto
Keyword property _Frost_ExtraMiscCoverageFair auto
Keyword property _Frost_ExtraMiscCoverageGood auto
Keyword property _Frost_ExtraMiscCoverageExcellent auto
Keyword property _Frost_ExtraMiscCoverageMax auto

GlobalVariable property _Frost_DatastoreInitialized auto
GlobalVariable property _Frost_Setting_CurrentProfile auto

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
int property DEFAULT_MISC_WARMTH				= 10 autoReadOnly hidden
int property DEFAULT_MISC_COVERAGE				= 10 autoReadOnly hidden

int property SLOTMASK_HEAD 						= 0x00000001 autoReadOnly hidden
int property SLOTMASK_HAIR 						= 0x00000002 autoReadOnly hidden
int property SLOTMASK_BODY 						= 0x00000004 autoReadOnly hidden
int property SLOTMASK_HANDS 					= 0x00000008 autoReadOnly hidden
int property SLOTMASK_FOREARMS 					= 0x00000010 autoReadOnly hidden
int property SLOTMASK_AMULET 					= 0x00000020 autoReadOnly hidden
int property SLOTMASK_RING 						= 0x00000040 autoReadOnly hidden
int property SLOTMASK_FEET 						= 0x00000080 autoReadOnly hidden
int property SLOTMASK_CALVES 					= 0x00000100 autoReadOnly hidden
int property SLOTMASK_SHIELD 					= 0x00000200 autoReadOnly hidden
int property SLOTMASK_TAIL 						= 0x00000400 autoReadOnly hidden
int property SLOTMASK_LONGHAIR 					= 0x00000800 autoReadOnly hidden
int property SLOTMASK_CIRCLET 					= 0x00001000 autoReadOnly hidden
int property SLOTMASK_EARS 						= 0x00002000 autoReadOnly hidden
int property SLOTMASK_CLOAK 					= 0x00010000 autoReadOnly hidden
int property SLOTMASK_BACKPACK 					= 0x00020000 autoReadOnly hidden

int property GEARTYPE_NOTFOUND 					= 0 autoReadOnly hidden
int property GEARTYPE_BODY 						= 1 autoReadOnly hidden
int property GEARTYPE_HEAD 						= 2 autoReadOnly hidden
int property GEARTYPE_HANDS 					= 3 autoReadOnly hidden
int property GEARTYPE_FEET 						= 4 autoReadOnly hidden
int property GEARTYPE_CLOAK 					= 5 autoReadOnly hidden
int property GEARTYPE_MISC 						= 6 autoReadOnly hidden
int property GEARTYPE_IGNORE 					= 7 autoReadOnly hidden

Keyword[] OverrideKeywords
int[] OverrideValues
int[] OverrideExtraPartIndex

Keyword[] StandardKeywords
int[] property StandardBodyValues auto hidden
int[] property StandardHeadValues auto hidden
int[] property StandardHandsValues auto hidden
int[] property StandardFeetValues auto hidden
int[] property StandardCloakValues auto hidden
int[] property StandardMiscValues auto hidden
int[] property StandardPartIndex auto hidden

int property WARMTH_BODY_POOR 					= 60 autoReadOnly hidden
int property WARMTH_BODY_FAIR 					= 125 autoReadOnly hidden
int property WARMTH_BODY_GOOD 					= 140 autoReadOnly hidden
int property WARMTH_BODY_EXCELLENT 				= 175 autoReadOnly hidden
int property WARMTH_BODY_MAX 					= 190 autoReadOnly hidden

int property WARMTH_HEAD_POOR 					= 15 autoReadOnly hidden
int property WARMTH_HEAD_FAIR 					= 30 autoReadOnly hidden
int property WARMTH_HEAD_GOOD 					= 40 autoReadOnly hidden
int property WARMTH_HEAD_EXCELLENT 				= 50 autoReadOnly hidden
int property WARMTH_HEAD_MAX 					= 55 autoReadOnly hidden

int property WARMTH_HANDS_POOR 					= 9 autoReadOnly hidden
int property WARMTH_HANDS_FAIR 					= 12 autoReadOnly hidden
int property WARMTH_HANDS_GOOD 					= 15 autoReadOnly hidden
int property WARMTH_HANDS_EXCELLENT 			= 21 autoReadOnly hidden
int property WARMTH_HANDS_MAX 					= 24 autoReadOnly hidden

int property WARMTH_FEET_POOR 					= 7 autoReadOnly hidden
int property WARMTH_FEET_FAIR 					= 12 autoReadOnly hidden
int property WARMTH_FEET_GOOD 					= 15 autoReadOnly hidden
int property WARMTH_FEET_EXCELLENT 				= 21 autoReadOnly hidden
int property WARMTH_FEET_MAX 					= 24 autoReadOnly hidden

int property WARMTH_CLOAK_POOR 					= 6 autoReadOnly hidden
int property WARMTH_CLOAK_FAIR 					= 12 autoReadOnly hidden
int property WARMTH_CLOAK_GOOD 					= 20 autoReadOnly hidden
int property WARMTH_CLOAK_EXCELLENT 			= 30 autoReadOnly hidden
int property WARMTH_CLOAK_MAX 					= 40 autoReadOnly hidden

int property WARMTH_MISC_POOR 					= 6 autoReadOnly hidden
int property WARMTH_MISC_FAIR 					= 12 autoReadOnly hidden
int property WARMTH_MISC_GOOD 					= 20 autoReadOnly hidden
int property WARMTH_MISC_EXCELLENT 				= 30 autoReadOnly hidden
int property WARMTH_MISC_MAX 					= 40 autoReadOnly hidden

int property COVERAGE_BODY_POOR 				= 35 autoReadOnly hidden
int property COVERAGE_BODY_FAIR 				= 54 autoReadOnly hidden
int property COVERAGE_BODY_GOOD 				= 72 autoReadOnly hidden
int property COVERAGE_BODY_EXCELLENT 			= 91 autoReadOnly hidden
int property COVERAGE_BODY_MAX 					= 109 autoReadOnly hidden

int property COVERAGE_HEAD_POOR 				= 14 autoReadOnly hidden
int property COVERAGE_HEAD_FAIR 				= 29 autoReadOnly hidden
int property COVERAGE_HEAD_GOOD 				= 43 autoReadOnly hidden
int property COVERAGE_HEAD_EXCELLENT 			= 58 autoReadOnly hidden
int property COVERAGE_HEAD_MAX 					= 72 autoReadOnly hidden

int property COVERAGE_HANDS_POOR 				= 6 autoReadOnly hidden
int property COVERAGE_HANDS_FAIR 				= 14 autoReadOnly hidden
int property COVERAGE_HANDS_GOOD 				= 21 autoReadOnly hidden
int property COVERAGE_HANDS_EXCELLENT 			= 29 autoReadOnly hidden
int property COVERAGE_HANDS_MAX 				= 35 autoReadOnly hidden

int property COVERAGE_FEET_POOR 				= 6 autoReadOnly hidden
int property COVERAGE_FEET_FAIR 				= 14 autoReadOnly hidden
int property COVERAGE_FEET_GOOD 				= 21 autoReadOnly hidden
int property COVERAGE_FEET_EXCELLENT 			= 29 autoReadOnly hidden
int property COVERAGE_FEET_MAX 					= 35 autoReadOnly hidden

int property COVERAGE_CLOAK_POOR 				= 6 autoReadOnly hidden
int property COVERAGE_CLOAK_FAIR 				= 12 autoReadOnly hidden
int property COVERAGE_CLOAK_GOOD 				= 20 autoReadOnly hidden
int property COVERAGE_CLOAK_EXCELLENT 			= 30 autoReadOnly hidden
int property COVERAGE_CLOAK_MAX 				= 40 autoReadOnly hidden

int property COVERAGE_MISC_POOR 				= 6 autoReadOnly hidden
int property COVERAGE_MISC_FAIR 				= 12 autoReadOnly hidden
int property COVERAGE_MISC_GOOD 				= 20 autoReadOnly hidden
int property COVERAGE_MISC_EXCELLENT 			= 30 autoReadOnly hidden
int property COVERAGE_MISC_MAX 					= 40 autoReadOnly hidden

;/ Array / Datastore Schemas ==================================================
	
	The Armor Protection Datastore and the Clothing System use various arrays
	and lists in order to pass around data about equipment, depending on the
	needs of the system and for performance reasons.

	The following are the most commonly used conventions used throughout
	Frostfall.
	
	JsonUtil IntList[15] ArmorData: The format that the Armor Protection
	Datastore stores a record about a single piece of gear. This data is saved
	to a Default Settings Profile, or to the player's custom Armor Profile.
	{
		FileName: '../FrostfallData/<profile name>'
		KeyName: Datastore key as returned by GetDatastoreKeyFrom*()
		Values: {
			0: Type (See GetGearType() and GEARTYPE_* constants)
			1: Warmth (main value)
			2: Coverage (main value)
			3: Extra Body Warmth
			4: Extra Body Coverage
			5: Extra Head Warmth
			6: Extra Head Coverage
			7: Extra Hands Warmth
			8: Extra Hands Coverage
			9: Extra Feet Warmth
			10: Extra Feet Coverage
			11: Extra Cloak Warmth
			12: Extra Cloak Coverage
			13: Extra Misc Warmth
			14: Extra Misc Coverage
		}
	}

	int[15] armor_data: This gets passed around anywhere "full" 
	data about a piece of armor is required and is used throughout the system,
	usually after retrieving it from the datastore. The schema is essentially
	the same.
	{
		0: Type (See GetGearType() and GEARTYPE_* constants)
		1: Warmth (main value)
		2: Coverage (main value)
		3: Extra Body Warmth
		4: Extra Body Coverage
		5: Extra Head Warmth
		6: Extra Head Coverage
		7: Extra Hands Warmth
		8: Extra Hands Coverage
		9: Extra Feet Warmth
		10: Extra Feet Coverage
		11: Extra Cloak Warmth
		12: Extra Cloak Coverage
		13: Extra Misc Warmth
		14: Extra Misc Coverage
	}
	
	StorageUtil IntList[13] _Frost_WornGearData: Used by the Clothing System
	to store a record of a single, currently-worn piece of gear.
	{
		ObjKey: _Frost_WornGearData
		KeyName: Datastore key as returned by GetDatastoreKeyFrom*()
		Values: {
			0: Type
			1: Body Warmth
			2: Body Coverage
			3: Head Warmth
			4: Head Coverage
			5: Hands Warmth
			6: Hands Coverage
			7: Feet Warmth
			8: Feet Coverage
			9: Cloak Warmth
			10: Cloak Coverage
			11: Misc Warmth
			12: Misc Coverage
		}
	}

	int[12] WornGearValues: Used by the Clothing System to store the sums
	of the protection data of all currently worn armor.
	{
		0: Total Worn Body Warmth
		1: Total Worn Body Coverage
		2: Total Worn Head Warmth
		3: Total Worn Head Coverage
		4: Total Worn Hands Warmth
		5: Total Worn Hands Coverage
		6: Total Worn Feet Warmth
		7: Total Worn Feet Coverage
		8: Total Worn Cloak Warmth
		9: Total Worn Cloak Coverage
		10: Total Worn Misc Warmth
		11: Total Worn Misc Coverage
	}

	int[2] armor_totals: Returned from GetTotalArmorProtectionValues(). Returns
	the total warmth and coverage for a piece of gear, including all of its 
	extra parts.
	{
		0: Warmth
		1: Coverage
	}
/;

string CONFIG_PATH = "../FrostfallData/"
string ARMOR_PROFILE_PREFIX = "armor_profile"
string ARMOR_DEFAULT_PREFIX = "armor_default_values"

function StopSystem()
	if self.IsRunning()
		self.Stop()
	endif
endFunction

function CreateProtectionKeywordValueMaps()
	; "Ignore" keyword?
	StandardKeywords = new Keyword[10]
	StandardBodyValues = new int[10]
	StandardHeadValues = new int[10]
	StandardHandsValues = new int[10]
	StandardFeetValues = new int[10]
	StandardCloakValues = new int[10]
	StandardMiscValues = new int[10]
	StandardPartIndex = new int[10]

	OverrideKeywords = new Keyword[60]
	OverrideValues = new int[60]
	OverrideExtraPartIndex = new int[60]

	StandardKeywords[0] = _Frost_WarmthPoor
	StandardKeywords[1] = _Frost_WarmthFair
	StandardKeywords[2] = _Frost_WarmthGood
	StandardKeywords[3] = _Frost_WarmthExcellent
	StandardKeywords[4] = _Frost_WarmthMax
	StandardKeywords[5] = _Frost_CoveragePoor
	StandardKeywords[6] = _Frost_CoverageFair
	StandardKeywords[7] = _Frost_CoverageGood
	StandardKeywords[8] = _Frost_CoverageExcellent
	StandardKeywords[9] = _Frost_CoverageMax

	StandardBodyValues[0] = WARMTH_BODY_POOR
	StandardBodyValues[1] = WARMTH_BODY_FAIR
	StandardBodyValues[2] = WARMTH_BODY_GOOD
	StandardBodyValues[3] = WARMTH_BODY_EXCELLENT
	StandardBodyValues[4] = WARMTH_BODY_MAX
	StandardBodyValues[5] = COVERAGE_BODY_POOR
	StandardBodyValues[6] = COVERAGE_BODY_FAIR
	StandardBodyValues[7] = COVERAGE_BODY_GOOD
	StandardBodyValues[8] = COVERAGE_BODY_EXCELLENT
	StandardBodyValues[9] = COVERAGE_BODY_MAX

	StandardHeadValues[0] = WARMTH_HEAD_POOR
	StandardHeadValues[1] = WARMTH_HEAD_FAIR
	StandardHeadValues[2] = WARMTH_HEAD_GOOD
	StandardHeadValues[3] = WARMTH_HEAD_EXCELLENT
	StandardHeadValues[4] = WARMTH_HEAD_MAX
	StandardHeadValues[5] = COVERAGE_HEAD_POOR
	StandardHeadValues[6] = COVERAGE_HEAD_FAIR
	StandardHeadValues[7] = COVERAGE_HEAD_GOOD
	StandardHeadValues[8] = COVERAGE_HEAD_EXCELLENT
	StandardHeadValues[9] = COVERAGE_HEAD_MAX

	StandardHandsValues[0] = WARMTH_HANDS_POOR
	StandardHandsValues[1] = WARMTH_HANDS_FAIR
	StandardHandsValues[2] = WARMTH_HANDS_GOOD
	StandardHandsValues[3] = WARMTH_HANDS_EXCELLENT
	StandardHandsValues[4] = WARMTH_HANDS_MAX
	StandardHandsValues[5] = COVERAGE_HANDS_POOR
	StandardHandsValues[6] = COVERAGE_HANDS_FAIR
	StandardHandsValues[7] = COVERAGE_HANDS_GOOD
	StandardHandsValues[8] = COVERAGE_HANDS_EXCELLENT
	StandardHandsValues[9] = COVERAGE_HANDS_MAX

	StandardFeetValues[0] = WARMTH_FEET_POOR
	StandardFeetValues[1] = WARMTH_FEET_FAIR
	StandardFeetValues[2] = WARMTH_FEET_GOOD
	StandardFeetValues[3] = WARMTH_FEET_EXCELLENT
	StandardFeetValues[4] = WARMTH_FEET_MAX
	StandardFeetValues[5] = COVERAGE_FEET_POOR
	StandardFeetValues[6] = COVERAGE_FEET_FAIR
	StandardFeetValues[7] = COVERAGE_FEET_GOOD
	StandardFeetValues[8] = COVERAGE_FEET_EXCELLENT
	StandardFeetValues[9] = COVERAGE_FEET_MAX

	StandardCloakValues[0] = WARMTH_CLOAK_POOR
	StandardCloakValues[1] = WARMTH_CLOAK_FAIR
	StandardCloakValues[2] = WARMTH_CLOAK_GOOD
	StandardCloakValues[3] = WARMTH_CLOAK_EXCELLENT
	StandardCloakValues[4] = WARMTH_CLOAK_MAX
	StandardCloakValues[5] = COVERAGE_CLOAK_POOR
	StandardCloakValues[6] = COVERAGE_CLOAK_FAIR
	StandardCloakValues[7] = COVERAGE_CLOAK_GOOD
	StandardCloakValues[8] = COVERAGE_CLOAK_EXCELLENT
	StandardCloakValues[9] = COVERAGE_CLOAK_MAX

	StandardMiscValues[0] = WARMTH_MISC_POOR
	StandardMiscValues[1] = WARMTH_MISC_FAIR
	StandardMiscValues[2] = WARMTH_MISC_GOOD
	StandardMiscValues[3] = WARMTH_MISC_EXCELLENT
	StandardMiscValues[4] = WARMTH_MISC_MAX
	StandardMiscValues[5] = COVERAGE_MISC_POOR
	StandardMiscValues[6] = COVERAGE_MISC_FAIR
	StandardMiscValues[7] = COVERAGE_MISC_GOOD
	StandardMiscValues[8] = COVERAGE_MISC_EXCELLENT
	StandardMiscValues[9] = COVERAGE_MISC_MAX

	StandardPartIndex[0] = 1
	StandardPartIndex[1] = 1
	StandardPartIndex[2] = 1
	StandardPartIndex[3] = 1
	StandardPartIndex[4] = 1
	StandardPartIndex[5] = 2
	StandardPartIndex[6] = 2
	StandardPartIndex[7] = 2
	StandardPartIndex[8] = 2
	StandardPartIndex[9] = 2

	OverrideKeywords[0] = _Frost_ExtraBodyWarmthPoor
	OverrideKeywords[1] = _Frost_ExtraBodyWarmthFair
	OverrideKeywords[2] = _Frost_ExtraBodyWarmthGood
	OverrideKeywords[3] = _Frost_ExtraBodyWarmthExcellent
	OverrideKeywords[4] = _Frost_ExtraBodyWarmthMax
	OverrideKeywords[5] = _Frost_ExtraHeadWarmthPoor
	OverrideKeywords[6] = _Frost_ExtraHeadWarmthFair
	OverrideKeywords[7] = _Frost_ExtraHeadWarmthGood
	OverrideKeywords[8] = _Frost_ExtraHeadWarmthExcellent
	OverrideKeywords[9] = _Frost_ExtraHeadWarmthMax
	OverrideKeywords[10] = _Frost_ExtraHandsWarmthPoor
	OverrideKeywords[11] = _Frost_ExtraHandsWarmthFair
	OverrideKeywords[12] = _Frost_ExtraHandsWarmthGood
	OverrideKeywords[13] = _Frost_ExtraHandsWarmthExcellent
	OverrideKeywords[14] = _Frost_ExtraHandsWarmthMax
	OverrideKeywords[15] = _Frost_ExtraFeetWarmthPoor
	OverrideKeywords[16] = _Frost_ExtraFeetWarmthFair
	OverrideKeywords[17] = _Frost_ExtraFeetWarmthGood
	OverrideKeywords[18] = _Frost_ExtraFeetWarmthExcellent
	OverrideKeywords[19] = _Frost_ExtraFeetWarmthMax
	OverrideKeywords[20] = _Frost_ExtraCloakWarmthPoor
	OverrideKeywords[21] = _Frost_ExtraCloakWarmthFair
	OverrideKeywords[22] = _Frost_ExtraCloakWarmthGood
	OverrideKeywords[23] = _Frost_ExtraCloakWarmthExcellent
	OverrideKeywords[24] = _Frost_ExtraCloakWarmthMax
	OverrideKeywords[25] = _Frost_ExtraMiscWarmthPoor
	OverrideKeywords[26] = _Frost_ExtraMiscWarmthFair
	OverrideKeywords[27] = _Frost_ExtraMiscWarmthGood
	OverrideKeywords[28] = _Frost_ExtraMiscWarmthExcellent
	OverrideKeywords[29] = _Frost_ExtraMiscWarmthMax
	OverrideKeywords[30] = _Frost_ExtraBodyCoveragePoor
	OverrideKeywords[31] = _Frost_ExtraBodyCoverageFair
	OverrideKeywords[32] = _Frost_ExtraBodyCoverageGood
	OverrideKeywords[33] = _Frost_ExtraBodyCoverageExcellent
	OverrideKeywords[34] = _Frost_ExtraBodyCoverageMax
	OverrideKeywords[35] = _Frost_ExtraHeadCoveragePoor
	OverrideKeywords[36] = _Frost_ExtraHeadCoverageFair
	OverrideKeywords[37] = _Frost_ExtraHeadCoverageGood
	OverrideKeywords[38] = _Frost_ExtraHeadCoverageExcellent
	OverrideKeywords[39] = _Frost_ExtraHeadCoverageMax
	OverrideKeywords[40] = _Frost_ExtraHandsCoveragePoor
	OverrideKeywords[41] = _Frost_ExtraHandsCoverageFair
	OverrideKeywords[42] = _Frost_ExtraHandsCoverageGood
	OverrideKeywords[43] = _Frost_ExtraHandsCoverageExcellent
	OverrideKeywords[44] = _Frost_ExtraHandsCoverageMax
	OverrideKeywords[45] = _Frost_ExtraFeetCoveragePoor
	OverrideKeywords[46] = _Frost_ExtraFeetCoverageFair
	OverrideKeywords[47] = _Frost_ExtraFeetCoverageGood
	OverrideKeywords[48] = _Frost_ExtraFeetCoverageExcellent
	OverrideKeywords[49] = _Frost_ExtraFeetCoverageMax
	OverrideKeywords[50] = _Frost_ExtraCloakCoveragePoor
	OverrideKeywords[51] = _Frost_ExtraCloakCoverageFair
	OverrideKeywords[52] = _Frost_ExtraCloakCoverageGood
	OverrideKeywords[53] = _Frost_ExtraCloakCoverageExcellent
	OverrideKeywords[54] = _Frost_ExtraCloakCoverageMax
	OverrideKeywords[55] = _Frost_ExtraMiscCoveragePoor
	OverrideKeywords[56] = _Frost_ExtraMiscCoverageFair
	OverrideKeywords[57] = _Frost_ExtraMiscCoverageGood
	OverrideKeywords[58] = _Frost_ExtraMiscCoverageExcellent
	OverrideKeywords[59] = _Frost_ExtraMiscCoverageMax

	OverrideValues[0] = WARMTH_BODY_POOR
	OverrideValues[1] = WARMTH_BODY_FAIR
	OverrideValues[2] = WARMTH_BODY_GOOD
	OverrideValues[3] = WARMTH_BODY_EXCELLENT
	OverrideValues[4] = WARMTH_BODY_MAX
	OverrideValues[5] = WARMTH_HEAD_POOR
	OverrideValues[6] = WARMTH_HEAD_FAIR
	OverrideValues[7] = WARMTH_HEAD_GOOD
	OverrideValues[8] = WARMTH_HEAD_EXCELLENT
	OverrideValues[9] = WARMTH_HEAD_MAX
	OverrideValues[10] = WARMTH_HANDS_POOR
	OverrideValues[11] = WARMTH_HANDS_FAIR
	OverrideValues[12] = WARMTH_HANDS_GOOD
	OverrideValues[13] = WARMTH_HANDS_EXCELLENT
	OverrideValues[14] = WARMTH_HANDS_MAX
	OverrideValues[15] = WARMTH_FEET_POOR
	OverrideValues[16] = WARMTH_FEET_FAIR
	OverrideValues[17] = WARMTH_FEET_GOOD
	OverrideValues[18] = WARMTH_FEET_EXCELLENT
	OverrideValues[19] = WARMTH_FEET_MAX
	OverrideValues[20] = WARMTH_CLOAK_POOR
	OverrideValues[21] = WARMTH_CLOAK_FAIR
	OverrideValues[22] = WARMTH_CLOAK_GOOD
	OverrideValues[23] = WARMTH_CLOAK_EXCELLENT
	OverrideValues[24] = WARMTH_CLOAK_MAX
	OverrideValues[25] = WARMTH_MISC_POOR
	OverrideValues[26] = WARMTH_MISC_FAIR
	OverrideValues[27] = WARMTH_MISC_GOOD
	OverrideValues[28] = WARMTH_MISC_EXCELLENT
	OverrideValues[29] = WARMTH_MISC_MAX
	OverrideValues[30] = COVERAGE_BODY_POOR
	OverrideValues[31] = COVERAGE_BODY_FAIR
	OverrideValues[32] = COVERAGE_BODY_GOOD
	OverrideValues[33] = COVERAGE_BODY_EXCELLENT
	OverrideValues[34] = COVERAGE_BODY_MAX
	OverrideValues[35] = COVERAGE_HEAD_POOR
	OverrideValues[36] = COVERAGE_HEAD_FAIR
	OverrideValues[37] = COVERAGE_HEAD_GOOD
	OverrideValues[38] = COVERAGE_HEAD_EXCELLENT
	OverrideValues[39] = COVERAGE_HEAD_MAX
	OverrideValues[40] = COVERAGE_HANDS_POOR
	OverrideValues[41] = COVERAGE_HANDS_FAIR
	OverrideValues[42] = COVERAGE_HANDS_GOOD
	OverrideValues[43] = COVERAGE_HANDS_EXCELLENT
	OverrideValues[44] = COVERAGE_HANDS_MAX
	OverrideValues[45] = COVERAGE_FEET_POOR
	OverrideValues[46] = COVERAGE_FEET_FAIR
	OverrideValues[47] = COVERAGE_FEET_GOOD
	OverrideValues[48] = COVERAGE_FEET_EXCELLENT
	OverrideValues[49] = COVERAGE_FEET_MAX
	OverrideValues[50] = COVERAGE_CLOAK_POOR
	OverrideValues[51] = COVERAGE_CLOAK_FAIR
	OverrideValues[52] = COVERAGE_CLOAK_GOOD
	OverrideValues[53] = COVERAGE_CLOAK_EXCELLENT
	OverrideValues[54] = COVERAGE_CLOAK_MAX
	OverrideValues[55] = COVERAGE_MISC_POOR
	OverrideValues[56] = COVERAGE_MISC_FAIR
	OverrideValues[57] = COVERAGE_MISC_GOOD
	OverrideValues[58] = COVERAGE_MISC_EXCELLENT
	OverrideValues[59] = COVERAGE_MISC_MAX

	OverrideExtraPartIndex[0] = 3
	OverrideExtraPartIndex[1] = 3
	OverrideExtraPartIndex[2] = 3
	OverrideExtraPartIndex[3] = 3
	OverrideExtraPartIndex[4] = 3
	OverrideExtraPartIndex[5] = 5
	OverrideExtraPartIndex[6] = 5
	OverrideExtraPartIndex[7] = 5
	OverrideExtraPartIndex[8] = 5
	OverrideExtraPartIndex[9] = 5
	OverrideExtraPartIndex[10] = 7
	OverrideExtraPartIndex[11] = 7
	OverrideExtraPartIndex[12] = 7
	OverrideExtraPartIndex[13] = 7
	OverrideExtraPartIndex[14] = 7
	OverrideExtraPartIndex[15] = 9
	OverrideExtraPartIndex[16] = 9
	OverrideExtraPartIndex[17] = 9
	OverrideExtraPartIndex[18] = 9
	OverrideExtraPartIndex[19] = 9
	OverrideExtraPartIndex[20] = 11
	OverrideExtraPartIndex[21] = 11
	OverrideExtraPartIndex[22] = 11
	OverrideExtraPartIndex[23] = 11
	OverrideExtraPartIndex[24] = 11
	OverrideExtraPartIndex[25] = 13
	OverrideExtraPartIndex[26] = 13
	OverrideExtraPartIndex[27] = 13
	OverrideExtraPartIndex[28] = 13
	OverrideExtraPartIndex[29] = 13
	OverrideExtraPartIndex[30] = 4
	OverrideExtraPartIndex[31] = 4
	OverrideExtraPartIndex[32] = 4
	OverrideExtraPartIndex[33] = 4
	OverrideExtraPartIndex[34] = 4
	OverrideExtraPartIndex[35] = 6
	OverrideExtraPartIndex[36] = 6
	OverrideExtraPartIndex[37] = 6
	OverrideExtraPartIndex[38] = 6
	OverrideExtraPartIndex[39] = 6
	OverrideExtraPartIndex[40] = 8
	OverrideExtraPartIndex[41] = 8
	OverrideExtraPartIndex[42] = 8
	OverrideExtraPartIndex[43] = 8
	OverrideExtraPartIndex[44] = 8
	OverrideExtraPartIndex[45] = 10
	OverrideExtraPartIndex[46] = 10
	OverrideExtraPartIndex[47] = 10
	OverrideExtraPartIndex[48] = 10
	OverrideExtraPartIndex[49] = 10
	OverrideExtraPartIndex[50] = 12
	OverrideExtraPartIndex[51] = 12
	OverrideExtraPartIndex[52] = 12
	OverrideExtraPartIndex[53] = 12
	OverrideExtraPartIndex[54] = 12
	OverrideExtraPartIndex[55] = 14
	OverrideExtraPartIndex[56] = 14
	OverrideExtraPartIndex[57] = 14
	OverrideExtraPartIndex[58] = 14
	OverrideExtraPartIndex[59] = 14
endFunction

function InitializeDatastore()
	if _Frost_DatastoreInitialized.GetValueInt() != 2
		if GetSKSELoaded()
			RevertDatastore()
		else
			GetLegacyArmorDatastore().InitializeDatastore()
		endif
	endif
endFunction


;/* GetTotalArmorProtectionValues wrapper */;
int[] function GetTotalArmorProtectionValues(Armor akArmor, string asArmorName = "")
	int[] armor_totals = new int[2]
	int[] ap

	if !akArmor
		armor_totals[0] = 0
		armor_totals[1] = 0
		return armor_totals
	endif

	if GetSKSELoaded()
		ap = GetTotalArmorProtectionValues_SKSE(akArmor, asArmorName)
	else
		ap = GetTotalArmorProtectionValues_Vanilla(akArmor)
	endif

	FrostDebug(0, "GetTotalArmorProtectionValues ap = " + ap)
	if ap[0] == GEARTYPE_IGNORE
		armor_totals[0] = 0
		armor_totals[1] = 0
		return armor_totals
	endif

	armor_totals[0] = ap[1] + ap[3] + ap[5] + ap[7] + ap[9] + ap[11] + ap[13]
	armor_totals[1] = ap[2] + ap[4] + ap[6] + ap[8] + ap[10] + ap[12] + ap[14]

	return armor_totals
endFunction

;@TODO: Shorten this execution path if it makes sense (go directly to GetArmorData_Vanilla).
int[] function GetTotalArmorProtectionValues_Vanilla(Armor akArmor)
	return GetArmorProtectionData(akArmor)
endFunction

int[] function GetTotalArmorProtectionValues_SKSE(Armor akArmor, string asArmorName = "")
	int[] ap
	if PrecacheHasArmorData(asArmorName, _FrostData_ArmorPrecache)
		ap = GetArmorDataFromPrecache(asArmorName, _FrostData_ArmorPrecache)
	else
		ap = GetArmorProtectionData(akArmor)
		TryToAddArmorDataToPrecache(akArmor, ap, _FrostData_ArmorPrecache)
	endif
	return ap
endFunction


;/* GetTotalArmorProtectionValuesWithType wrapper */;
int[] function GetTotalArmorProtectionValuesWithType(Armor akArmor, string asArmorName = "")
	int[] armor_totals = new int[3]
	int[] ap

	if !akArmor
		armor_totals[0] = 0
		armor_totals[1] = 0
		armor_totals[2] = 0
		return armor_totals
	endif

	if GetSKSELoaded()
		GetTotalArmorProtectionValuesWithType_SKSE(akArmor, asArmorName)
	else
		GetTotalArmorProtectionValuesWithType_Vanilla(akArmor)
	endif
	
	FrostDebug(0, "GetTotalArmorProtectionValuesWithType ap = " + ap)
	if ap[0] == GEARTYPE_IGNORE
		armor_totals[0] = 0
		armor_totals[1] = 0
		armor_totals[2] = 0
		return armor_totals
	endif

	armor_totals[0] = ap[1] + ap[3] + ap[5] + ap[7] + ap[9] + ap[11] + ap[13]
	armor_totals[1] = ap[2] + ap[4] + ap[6] + ap[8] + ap[10] + ap[12] + ap[14]
	armor_totals[2] = ap[0]

	return armor_totals
endFunction

int[] function GetTotalArmorProtectionValuesWithType_SKSE(Armor akArmor, string asArmorName)
	int[] ap
	if PrecacheHasArmorData(asArmorName, _FrostData_ArmorPrecache)
		ap = GetArmorDataFromPrecache(asArmorName, _FrostData_ArmorPrecache)
	else
		ap = GetArmorProtectionData(akArmor)
		TryToAddArmorDataToPrecache(akArmor, ap, _FrostData_ArmorPrecache)
	endif
	return ap
endFunction

int[] function GetTotalArmorProtectionValuesWithType_Vanilla(Armor akArmor)
	return GetArmorProtectionData(akArmor)
endFunction

int function GetGearType(Armor akArmor, int aiSlotMask)
	if LogicalAnd(aiSlotMask, SLOTMASK_BODY)
		return GEARTYPE_BODY
	elseif LogicalAnd(aiSlotMask, SLOTMASK_HAIR) || LogicalAnd(aiSlotMask, SLOTMASK_HEAD)
		return GEARTYPE_HEAD
	elseif LogicalAnd(aiSlotMask, SLOTMASK_HANDS)
		return GEARTYPE_HANDS
	elseif LogicalAnd(aiSlotMask, SLOTMASK_FEET)
		return GEARTYPE_FEET
	elseif LogicalAnd(aiSlotMask, SLOTMASK_CLOAK) || akArmor.HasKeyword(WAF_ClothingCloak)
		return GEARTYPE_CLOAK
	elseif LogicalAnd(aiSlotMask, SLOTMASK_SHIELD)
		return GEARTYPE_MISC
	else
		return GEARTYPE_NOTFOUND
	endif
endFunction

int function GetGearType_Vanilla(Armor akArmor)
	if akArmor.HasKeyword(ArmorCuirass) || akArmor.HasKeyword(ClothingBody)
		return GEARTYPE_BODY
	elseif akArmor.HasKeyword(ArmorGauntlets) || akArmor.HasKeyword(ClothingHands)
		return GEARTYPE_HANDS
	elseif akArmor.HasKeyword(ArmorHelmet) || akArmor.HasKeyword(ClothingHead); @TODO: || akArmor == ClothesMGRobesArchmage1Hooded
		return GEARTYPE_HEAD
	elseif akArmor.HasKeyword(ArmorBoots) || akArmor.HasKeyword(ClothingFeet)
		return GEARTYPE_FEET
	elseif akArmor.HasKeyword(WAF_ClothingCloak) || IsArmorCloak(akArmor)
		return GEARTYPE_CLOAK
	elseif IsArmorShield(akArmor)
		return GEARTYPE_MISC
	else
		return GEARTYPE_NOTFOUND
	endif
endFunction


;/* GetArmorProtectionData wrapper */;
int[] function GetArmorProtectionData(Armor akArmor)
	if GetSKSELoaded()
		return GetArmorProtectionData_SKSE(akArmor)
	else
		return GetArmorProtectionData_Vanilla(akArmor)
	endif
endFunction

int[] function GetArmorProtectionData_SKSE(Armor akArmor)
    int[] armor_data = GetArmorData(akArmor)
    
    if armor_data[0] == GEARTYPE_IGNORE ; Ignore
    	return armor_data
    endif

    if armor_data[0] == GEARTYPE_NOTFOUND ; No entry for this armor.
    	armor_data = GetArmorProtectionDataByKeyword(akArmor)
    	if armor_data[0] == GEARTYPE_IGNORE ; Ignore
    		return armor_data
    	endif
    	if armor_data[0] == GEARTYPE_NOTFOUND
    		armor_data = GetArmorProtectionDataByAnalysis(akArmor)
    	endif
    endif

    return armor_data
endFunction

int[] function GetArmorProtectionData_Vanilla(Armor akArmor)
	; Fallback mode

	; The datastore is now a set of arrays

	; Lookup flow:
	; 	arrays (specific search)
	;	Keywords (Frostfall-specific)
	;		Only look at the "base" keywords for now.
	;	Keywords (Analysis)

	int gearType = GetGearType_Vanilla(akArmor)
	int[] armor_data = GetArmorData_Vanilla(akArmor, gearType)

	if armor_data[0] == GEARTYPE_IGNORE ; Ignore
    	return armor_data
    endif

    return armor_data
endFunction

int function GetArmorProtectionDataByType(Armor akArmor, int aiGearType, int aiStandardKeywordIndex)
	if aiGearType == GEARTYPE_BODY
		return StandardBodyValues[aiStandardKeywordIndex]
	elseif aiGearType == GEARTYPE_HEAD
		return StandardHeadValues[aiStandardKeywordIndex]
	elseif aiGearType == GEARTYPE_HANDS
		return StandardHandsValues[aiStandardKeywordIndex]
	elseif aiGearType == GEARTYPE_FEET
		return StandardFeetValues[aiStandardKeywordIndex]
	elseif aiGearType == GEARTYPE_CLOAK
		return StandardCloakValues[aiStandardKeywordIndex]
	elseif aiGearType == GEARTYPE_MISC
		return StandardMiscValues[aiStandardKeywordIndex]
	endif
endFunction

;/* GetArmorProtectionDataByKeyword wrapper */;
int[] function GetArmorProtectionDataByKeyword(Armor akArmor)
	int[] armor_data = new int[15]

	if akArmor.HasKeyword(_Frost_Ignore)
		armor_data[0] = GEARTYPE_IGNORE
		return armor_data
	endif
	
	int armor_mask = akArmor.GetSlotMask()
	;@TODO: Do I need this?
	int gear_type = GetGearType(akArmor, armor_mask)
	if gear_type == GEARTYPE_NOTFOUND
		; No gear type found for this item. Ignore it.
		armor_data[0] = GEARTYPE_IGNORE
		return armor_data
	endif

	armor_data[0] = gear_type

	int keyword_count = akArmor.GetNumKeywords()
	int i = 1
	bool found_keyword = false
	while i < keyword_count
		Keyword k = akArmor.GetNthKeyword(i)
		int idx = StandardKeywords.Find(k)
		if idx != -1
			; standard keyword
			int determined_value = GetArmorProtectionDataByType(akArmor, gear_type, idx)
			armor_data[StandardPartIndex[idx]] = determined_value
			found_keyword = true
		else
			; extra parts
			idx = OverrideKeywords.Find(k)
			if idx != -1
				armor_data[OverrideExtraPartIndex[idx]] = OverrideValues[idx]
				found_keyword = true
			endif
		endif
		i += 1
	endWhile

	; If we didn't find anything, say that the gear type was NOT FOUND so that
	; the system will try an analysis check.
	if !found_keyword
		armor_data[0] = GEARTYPE_NOTFOUND
	endif

	return armor_data
endFunction

int[] function GetArmorProtectionDataByAnalysis(Armor akArmor)
	int[] armor_data = new int[15]

	; The slot mask is the single source of truth for what "kind" of armor this is.
	int armor_mask = akArmor.GetSlotMask()

	; Check exceptions
	if armor_mask == SLOTMASK_CIRCLET
		armor_data[0] = GEARTYPE_IGNORE
		return armor_data
	endif

	if LogicalAnd(armor_mask, SLOTMASK_RING) || LogicalAnd(armor_mask, SLOTMASK_AMULET)
		armor_data[0] = GEARTYPE_IGNORE
		return armor_data
	endif

	int gear_type = GetGearType(akArmor, armor_mask)
	armor_data[0] = gear_type

	if gear_type == GEARTYPE_NOTFOUND
		; No gear type found for this item. Ignore it.
		armor_data[0] = GEARTYPE_IGNORE
		return armor_data
	endif

	if gear_type == GEARTYPE_BODY
		armor_data[1] = DEFAULT_BODY_WARMTH
		armor_data[2] = DEFAULT_BODY_COVERAGE
	elseif gear_type == GEARTYPE_HEAD
		; Coarsely differentiate between hoods and helms
		_Frost_Strings str = GetFrostfallStrings()
		if StringUtil.Find(akArmor.GetName(), str.Hood) != -1
			armor_data[1] = DEFAULT_HEADHOOD_WARMTH
			armor_data[2] = DEFAULT_HEADHOOD_COVERAGE
		else
			armor_data[1] = DEFAULT_HEAD_WARMTH
			armor_data[2] = DEFAULT_HEAD_COVERAGE
		endif
	elseif gear_type == GEARTYPE_HANDS
		armor_data[1] = DEFAULT_HANDS_WARMTH
		armor_data[2] = DEFAULT_HANDS_COVERAGE
	elseif gear_type == GEARTYPE_FEET
		armor_data[1] = DEFAULT_FEET_WARMTH
		armor_data[2] = DEFAULT_FEET_COVERAGE
	elseif gear_type == GEARTYPE_CLOAK
		armor_data[1] = DEFAULT_CLOAK_WARMTH
		armor_data[2] = DEFAULT_CLOAK_COVERAGE
	elseif gear_type == GEARTYPE_MISC
		if LogicalAnd(armor_mask, SLOTMASK_SHIELD)
			armor_data[1] = DEFAULT_SHIELD_WARMTH
			armor_data[2] = DEFAULT_SHIELD_COVERAGE
		else
			armor_data[1] = DEFAULT_MISC_WARMTH
			armor_data[2] = DEFAULT_MISC_COVERAGE
		endif
	endif

	; Now, check extra data
	if gear_type != GEARTYPE_HEAD && (LogicalAnd(armor_mask, SLOTMASK_HAIR) || LogicalAnd(armor_mask, SLOTMASK_HEAD))
		; Coarsely differentiate between hoods and helms
		_Frost_Strings str = GetFrostfallStrings()
		if StringUtil.Find(akArmor.GetName(), str.Hood) != -1 || StringUtil.Find(akArmor.GetName(), str.Robes) != -1
			armor_data[5] = DEFAULT_HEADHOOD_WARMTH
			armor_data[6] = DEFAULT_HEADHOOD_COVERAGE
		else
			armor_data[5] = DEFAULT_HEAD_WARMTH
			armor_data[6] = DEFAULT_HEAD_COVERAGE
		endif
	endif
	if gear_type != GEARTYPE_HANDS && LogicalAnd(armor_mask, SLOTMASK_HANDS)
		armor_data[7] = DEFAULT_HANDS_WARMTH
		armor_data[8] = DEFAULT_HANDS_COVERAGE
	endif
	if gear_type != GEARTYPE_FEET && LogicalAnd(armor_mask, SLOTMASK_FEET)
		armor_data[9] = DEFAULT_FEET_WARMTH
		armor_data[10] = DEFAULT_FEET_COVERAGE
	endif
	if gear_type != GEARTYPE_CLOAK && (LogicalAnd(armor_mask, SLOTMASK_CLOAK) || akArmor.HasKeyword(WAF_ClothingCloak))
		armor_data[11] = DEFAULT_CLOAK_WARMTH
		armor_data[12] = DEFAULT_CLOAK_COVERAGE
	endif

	FrostDebug(0, "GetArmorProtectionDataByAnalysis Result: " + armor_data)
	return armor_data
endFunction

string function GetDatastoreKeyFromForm(Armor akArmor)
	int form_id = akArmor.GetFormID()
	return GetDatastoreKeyFromID(form_id)
endFunction

string function GetDatastoreKeyFromID(int aiFormID)
	; Values of aiFormID larger than 0x80000000 will be negative and require conversion
	; to obtain the mod index.
	int mod_index = GetModIndex(aiFormID)
	int base_form_id = GetBaseFormID(aiFormID)
	string ds_key = base_form_id + "___" + Game.GetModName(mod_index)
	return ds_key
endFunction

function RevertDatastore()
	;@TODO
	; DEPRECATED - Just reinitialize defaults for modded armor instead.
	RestoreAllDefaultArmorData()

	_Frost_DatastoreInitialized.SetValueInt(2)
endFunction

int function GetModIndex(int aiFormID)
	; Values of aiFormID larger than 0x80000000 will be negative and require conversion
	; to obtain the mod index.
	int mod_index = aiFormID/16777216
	if mod_index < 0
		mod_index = LogicalAnd(mod_index, 0xFF) - 1
	endif
	return mod_index
endFunction

int function GetBaseFormID(int aiFormID)
	return LogicalAnd(aiFormID, 0x00FFFFFF)
endFunction

; Frostfall 3.1 Stuff

bool function DatastoreHasKey(string asKey, bool abCheckDefaultValues = true)
	string profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	if JsonUtil.IntListGet(profile_path, asKey, 0) != 0
		return true
	elseif abCheckDefaultValues
		string defaults_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
		if JsonUtil.IntListGet(defaults_path, asKey, 0) != 0
			return true
		else
			return false
		endif
	else
		return false
	endif
endFunction

bool function ProfileHasKey(string asProfilePath, string asKey)
	if JsonUtil.IntListGet(asProfilePath, asKey, 0) != 0
		return true
	else
		return false
	endif
endFunction

; CRUD
function SetArmorDataByKey(string asKey, int aiType, int aiWarmth = 0, int aiCoverage = 0,		\
									 int aiExtraBodyWarmth = 0, int aiExtraBodyCoverage = 0, 	\
									 int aiExtraHeadWarmth = 0, int aiExtraHeadCoverage = 0, 	\
									 int aiExtraHandsWarmth = 0, int aiExtraHandsCoverage = 0, 	\
									 int aiExtraFeetWarmth = 0, int aiExtraFeetCoverage = 0, 	\
									 int aiExtraCloakWarmth = 0, int aiExtraCloakCoverage = 0, 	\
									 int aiExtraMiscWarmth = 0, int aiExtraMiscCoverage = 0, 	\
									 bool abExportToDefaults = false, bool abSave = true)
	
	string profile_path
	if abExportToDefaults
		profile_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	else
		profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	endif
	
	JsonUtil.IntListResize(profile_path, asKey, 15, 0)
	JsonUtil.IntListSet(profile_path, asKey, 0, aiType)
	JsonUtil.IntListSet(profile_path, asKey, 1, aiWarmth)
	JsonUtil.IntListSet(profile_path, asKey, 2, aiCoverage)
	JsonUtil.IntListSet(profile_path, asKey, 3, aiExtraBodyWarmth)
	JsonUtil.IntListSet(profile_path, asKey, 4, aiExtraBodyCoverage)
	JsonUtil.IntListSet(profile_path, asKey, 5, aiExtraHeadWarmth)
	JsonUtil.IntListSet(profile_path, asKey, 6, aiExtraHeadCoverage)
	JsonUtil.IntListSet(profile_path, asKey, 7, aiExtraHandsWarmth)
	JsonUtil.IntListSet(profile_path, asKey, 8, aiExtraHandsCoverage)
	JsonUtil.IntListSet(profile_path, asKey, 9, aiExtraFeetWarmth)
	JsonUtil.IntListSet(profile_path, asKey, 10, aiExtraFeetCoverage)
	JsonUtil.IntListSet(profile_path, asKey, 11, aiExtraCloakWarmth)
	JsonUtil.IntListSet(profile_path, asKey, 12, aiExtraCloakCoverage)
	JsonUtil.IntListSet(profile_path, asKey, 13, aiExtraMiscWarmth)
	JsonUtil.IntListSet(profile_path, asKey, 14, aiExtraMiscCoverage)
	
	if abSave
		JsonUtil.Save(profile_path)
	endif
endFunction

function SetArmorData(Armor akArmor, int aiType, int aiWarmth = 0, int aiCoverage = 0,			\
									 int aiExtraBodyWarmth = 0, int aiExtraBodyCoverage = 0, 	\
									 int aiExtraHeadWarmth = 0, int aiExtraHeadCoverage = 0, 	\
									 int aiExtraHandsWarmth = 0, int aiExtraHandsCoverage = 0, 	\
									 int aiExtraFeetWarmth = 0, int aiExtraFeetCoverage = 0, 	\
									 int aiExtraCloakWarmth = 0, int aiExtraCloakCoverage = 0, 	\
									 int aiExtraMiscWarmth = 0, int aiExtraMiscCoverage = 0, 	\
									 bool abExportToDefaults = false)
	
	string profile_path
	if abExportToDefaults
		profile_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	else
		profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	endif
	string dskey = GetDatastoreKeyFromForm(akArmor)
	JsonUtil.IntListResize(profile_path, dskey, 15, 0)
	JsonUtil.IntListSet(profile_path, dskey, 0, aiType)
	JsonUtil.IntListSet(profile_path, dskey, 1, aiWarmth)
	JsonUtil.IntListSet(profile_path, dskey, 2, aiCoverage)
	JsonUtil.IntListSet(profile_path, dskey, 3, aiExtraBodyWarmth)
	JsonUtil.IntListSet(profile_path, dskey, 4, aiExtraBodyCoverage)
	JsonUtil.IntListSet(profile_path, dskey, 5, aiExtraHeadWarmth)
	JsonUtil.IntListSet(profile_path, dskey, 6, aiExtraHeadCoverage)
	JsonUtil.IntListSet(profile_path, dskey, 7, aiExtraHandsWarmth)
	JsonUtil.IntListSet(profile_path, dskey, 8, aiExtraHandsCoverage)
	JsonUtil.IntListSet(profile_path, dskey, 9, aiExtraFeetWarmth)
	JsonUtil.IntListSet(profile_path, dskey, 10, aiExtraFeetCoverage)
	JsonUtil.IntListSet(profile_path, dskey, 11, aiExtraCloakWarmth)
	JsonUtil.IntListSet(profile_path, dskey, 12, aiExtraCloakCoverage)
	JsonUtil.IntListSet(profile_path, dskey, 13, aiExtraMiscWarmth)
	JsonUtil.IntListSet(profile_path, dskey, 14, aiExtraMiscCoverage)
	JsonUtil.Save(profile_path)
endFunction

function SetArmorDataA(Armor akArmor, int[] aiProtectionValues, bool abExportToDefaults = false)
	string profile_path
	if abExportToDefaults
		profile_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	else
		profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	endif
	string dskey = GetDatastoreKeyFromForm(akArmor)
	
	JsonUtil.IntListResize(profile_path, dskey, 15, 0)
	JsonUtil.IntListSet(profile_path, dskey, 0, aiProtectionValues[0]) ; aiType
	JsonUtil.IntListSet(profile_path, dskey, 1, aiProtectionValues[1]) ; aiWarmth
	JsonUtil.IntListSet(profile_path, dskey, 2, aiProtectionValues[2]) ; aiCoverage
	JsonUtil.IntListSet(profile_path, dskey, 3, aiProtectionValues[3]) ; aiExtraBodyWarmth
	JsonUtil.IntListSet(profile_path, dskey, 4, aiProtectionValues[4]) ; aiExtraBodyCoverage
	JsonUtil.IntListSet(profile_path, dskey, 5, aiProtectionValues[5]) ; aiExtraHeadWarmth
	JsonUtil.IntListSet(profile_path, dskey, 6, aiProtectionValues[6]) ; aiExtraHeadCoverage
	JsonUtil.IntListSet(profile_path, dskey, 7, aiProtectionValues[7]) ; aiExtraHandsWarmth
	JsonUtil.IntListSet(profile_path, dskey, 8, aiProtectionValues[8]) ; aiExtraHandsCoverage
	JsonUtil.IntListSet(profile_path, dskey, 9, aiProtectionValues[9]) ; aiExtraFeetWarmth
	JsonUtil.IntListSet(profile_path, dskey, 10, aiProtectionValues[10]) ; aiExtraFeetCoverage
	JsonUtil.IntListSet(profile_path, dskey, 11, aiProtectionValues[11]) ; aiExtraCloakWarmth
	JsonUtil.IntListSet(profile_path, dskey, 12, aiProtectionValues[12]) ; aiExtraCloakCoverage
	JsonUtil.IntListSet(profile_path, dskey, 13, aiProtectionValues[13]) ; aiExtraMiscWarmth
	JsonUtil.IntListSet(profile_path, dskey, 14, aiProtectionValues[14]) ; aiExtraMiscCoverage
	JsonUtil.Save(profile_path)
endFunction

function UpdateArmorData(Armor akArmor, int aiType = -1, int aiWarmth = -1, int aiCoverage = -1, 	\
	                                        int aiExtraBodyWarmth = -1, int aiExtraBodyCoverage = -1, 	\
	                                        int aiExtraHeadWarmth = -1, int aiExtraHeadCoverage = -1, 	\
	                                        int aiExtraHandsWarmth = -1, int aiExtraHandsCoverage = -1, \
	                                        int aiExtraFeetWarmth = -1, int aiExtraFeetCoverage = -1, 	\
	                                        int aiExtraCloakWarmth = -1, int aiExtraCloakCoverage = -1, \
	                                        int aiExtraMiscWarmth = -1, int aiExtraMiscCoverage = -1)
	
	string profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if ProfileHasKey(profile_path, dskey)
		if aiType != -1
			JsonUtil.IntListSet(profile_path, dskey, 0, aiType)
		endif
		if aiWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 1, aiWarmth)
		endif
		if aiCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 2, aiCoverage)
		endif
		if aiExtraBodyWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 3, aiExtraBodyWarmth)
		endif
		if aiExtraBodyCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 4, aiExtraBodyCoverage)
		endif
		if aiExtraHeadWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 5, aiExtraHeadWarmth)
		endif
		if aiExtraHeadCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 6, aiExtraHeadCoverage)
		endif
		if aiExtraHandsWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 7, aiExtraHandsWarmth)
		endif
		if aiExtraHandsCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 8, aiExtraHandsCoverage)
		endif
		if aiExtraFeetWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 9, aiExtraFeetWarmth)
		endif
		if aiExtraFeetCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 10, aiExtraFeetCoverage)
		endif
		if aiExtraCloakWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 11, aiExtraCloakWarmth)
		endif
		if aiExtraCloakCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 12, aiExtraCloakCoverage)
		endif
		if aiExtraMiscWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 13, aiExtraMiscWarmth)
		endif
		if aiExtraMiscCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 14, aiExtraMiscCoverage)
		endif
		JsonUtil.Save(profile_path)
	else
		; Get the default values for this gear, overwrite it with the updates, and save it.
		int[] armor_data = GetArmorProtectionData(akArmor)
		if aiType != -1
			armor_data[0] = aiType
		endif
		if aiWarmth != -1
			armor_data[1] = aiWarmth
		endif
		if aiCoverage != -1
			armor_data[2] = aiCoverage
		endif
		if aiExtraBodyWarmth != -1
			armor_data[3] = aiExtraBodyWarmth
		endif
		if aiExtraBodyCoverage != -1
			armor_data[4] = aiExtraBodyCoverage
		endif
		if aiExtraHeadWarmth != -1
			armor_data[5] = aiExtraHeadWarmth
		endif
		if aiExtraHeadCoverage != -1
			armor_data[6] = aiExtraHeadCoverage
		endif
		if aiExtraHandsWarmth != -1
			armor_data[7] = aiExtraHandsWarmth
		endif
		if aiExtraHandsCoverage != -1
			armor_data[8] = aiExtraHandsCoverage
		endif
		if aiExtraFeetWarmth != -1
			armor_data[9] = aiExtraFeetWarmth
		endif
		if aiExtraFeetCoverage != -1
			armor_data[10] = aiExtraFeetCoverage
		endif
		if aiExtraCloakWarmth != -1
			armor_data[11] = aiExtraCloakWarmth
		endif
		if aiExtraCloakCoverage != -1
			armor_data[12] = aiExtraCloakCoverage
		endif
		if aiExtraMiscWarmth != -1
			armor_data[13] = aiExtraMiscWarmth
		endif
		if aiExtraMiscCoverage != -1
			armor_data[14] = aiExtraMiscCoverage
		endif

		SetArmorDataA(akArmor, armor_data)
	endif
endFunction

function UpdateArmorDataA(Armor akArmor, int[] aiProtectionValues)
	
	string profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if ProfileHasKey(profile_path, dskey)
		if aiProtectionValues[0] != -1
			JsonUtil.IntListSet(profile_path, dskey, 0, aiProtectionValues[0])
		endif
		if aiProtectionValues[1] != -1
			JsonUtil.IntListSet(profile_path, dskey, 1, aiProtectionValues[1])
		endif
		if aiProtectionValues[2] != -1
			JsonUtil.IntListSet(profile_path, dskey, 2, aiProtectionValues[2])
		endif
		if aiProtectionValues[3] != -1
			JsonUtil.IntListSet(profile_path, dskey, 3, aiProtectionValues[3])
		endif
		if aiProtectionValues[4] != -1
			JsonUtil.IntListSet(profile_path, dskey, 4, aiProtectionValues[4])
		endif
		if aiProtectionValues[5] != -1
			JsonUtil.IntListSet(profile_path, dskey, 5, aiProtectionValues[5])
		endif
		if aiProtectionValues[6] != -1
			JsonUtil.IntListSet(profile_path, dskey, 6, aiProtectionValues[6])
		endif
		if aiProtectionValues[7] != -1
			JsonUtil.IntListSet(profile_path, dskey, 7, aiProtectionValues[7])
		endif
		if aiProtectionValues[8] != -1
			JsonUtil.IntListSet(profile_path, dskey, 8, aiProtectionValues[8])
		endif
		if aiProtectionValues[9] != -1
			JsonUtil.IntListSet(profile_path, dskey, 9, aiProtectionValues[9])
		endif
		if aiProtectionValues[10] != -1
			JsonUtil.IntListSet(profile_path, dskey, 10, aiProtectionValues[10])
		endif
		if aiProtectionValues[11] != -1
			JsonUtil.IntListSet(profile_path, dskey, 11, aiProtectionValues[11])
		endif
		if aiProtectionValues[12] != -1
			JsonUtil.IntListSet(profile_path, dskey, 12, aiProtectionValues[12])
		endif
		if aiProtectionValues[13] != -1
			JsonUtil.IntListSet(profile_path, dskey, 13, aiProtectionValues[13])
		endif
		if aiProtectionValues[14] != -1
			JsonUtil.IntListSet(profile_path, dskey, 14, aiProtectionValues[14])
		endif
		JsonUtil.Save(profile_path)
	else
		; Get the default values for this gear, overwrite it with the updates, and save it.
		int[] armor_data = GetArmorProtectionData(akArmor)
		if aiProtectionValues[0] != -1
			armor_data[0] = aiProtectionValues[0]
		endif
		if aiProtectionValues[1] != -1
			armor_data[1] = aiProtectionValues[1]
		endif
		if aiProtectionValues[2] != -1
			armor_data[2] = aiProtectionValues[2]
		endif
		if aiProtectionValues[3] != -1
			armor_data[3] = aiProtectionValues[3]
		endif
		if aiProtectionValues[4] != -1
			armor_data[4] = aiProtectionValues[4]
		endif
		if aiProtectionValues[5] != -1
			armor_data[5] = aiProtectionValues[5]
		endif
		if aiProtectionValues[6] != -1
			armor_data[6] = aiProtectionValues[6]
		endif
		if aiProtectionValues[7] != -1
			armor_data[7] = aiProtectionValues[7]
		endif
		if aiProtectionValues[8] != -1
			armor_data[8] = aiProtectionValues[8]
		endif
		if aiProtectionValues[9] != -1
			armor_data[9] = aiProtectionValues[9]
		endif
		if aiProtectionValues[10] != -1
			armor_data[10] = aiProtectionValues[10]
		endif
		if aiProtectionValues[11] != -1
			armor_data[11] = aiProtectionValues[11]
		endif
		if aiProtectionValues[12] != -1
			armor_data[12] = aiProtectionValues[12]
		endif
		if aiProtectionValues[13] != -1
			armor_data[13] = aiProtectionValues[13]
		endif
		if aiProtectionValues[14] != -1
			armor_data[14] = aiProtectionValues[14]
		endif
		SetArmorDataA(akArmor, armor_data)
	endif
endFunction

function RestoreDefaultArmorData(Armor akArmor)
	; Removes user settings for armor.
	string profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	JsonUtil.IntListClear(profile_path, dskey)
	JsonUtil.Save(profile_path)
endFunction

function RemoveDefaultArmorData(Armor akArmor)
	; Removes default settings for armor.
	string profile_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	string dskey = GetDatastoreKeyFromForm(akArmor)
	JsonUtil.IntListClear(profile_path, dskey)
	JsonUtil.Save(profile_path)
endFunction

; GET
int[] function GetArmorData(Armor akArmor)
	string profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	int[] armor_data = new int[15]

	if ProfileHasKey(profile_path, dskey)
		armor_data[0] = JsonUtil.IntListGet(profile_path, dskey, 0)
		armor_data[1] = JsonUtil.IntListGet(profile_path, dskey, 1)
		armor_data[2] = JsonUtil.IntListGet(profile_path, dskey, 2)
		armor_data[3] = JsonUtil.IntListGet(profile_path, dskey, 3)
		armor_data[4] = JsonUtil.IntListGet(profile_path, dskey, 4)
		armor_data[5] = JsonUtil.IntListGet(profile_path, dskey, 5)
		armor_data[6] = JsonUtil.IntListGet(profile_path, dskey, 6)
		armor_data[7] = JsonUtil.IntListGet(profile_path, dskey, 7)
		armor_data[8] = JsonUtil.IntListGet(profile_path, dskey, 8)
		armor_data[9] = JsonUtil.IntListGet(profile_path, dskey, 9)
		armor_data[10] = JsonUtil.IntListGet(profile_path, dskey, 10)
		armor_data[11] = JsonUtil.IntListGet(profile_path, dskey, 11)
		armor_data[12] = JsonUtil.IntListGet(profile_path, dskey, 12)
		armor_data[13] = JsonUtil.IntListGet(profile_path, dskey, 13)
		armor_data[14] = JsonUtil.IntListGet(profile_path, dskey, 14)
	else
		armor_data = GetDefaultArmorData(dskey)
	endif
	return armor_data
endFunction

int[] function GetArmorData_Vanilla(Armor akArmor, int aiGearType)
	_Frost_LegacyArmorDatastore ds = GetLegacyArmorDatastore()
	int[] armor_data = new int[15]
	int[] protectionLevels

	;@TODO: Handle zero value by returning -1 from legacy datastore
	;@TODO: Check the Ignore arrays first in all cases.
	;@TODO: Make the Ignore array single.

	if aiGearType == GEARTYPE_BODY
		protectionLevels = ds.FindBodyProtectionLevels(akArmor)
		int warmthLevel = protectionLevels[0]
		int coverageLevel = protectionLevels[1]
		bool found = protectionLevels[2]

		if found
			armor_data[0] = aiGearType
			armor_data[1] = StandardBodyValues[warmthLevel]
			armor_data[2] = StandardBodyValues[coverageLevel + 5]
		else
			armor_data[0] = GEARTYPE_NOTFOUND
			return armor_data
		endif

		; check extra head
		protectionLevels = ds.FindHeadProtectionLevels(akArmor)
		warmthLevel = protectionLevels[0]
		coverageLevel = protectionLevels[1]
		found = protectionLevels[2]

		if found
			armor_data[5] = StandardHeadValues[warmthLevel]
			armor_data[6] = StandardHeadValues[coverageLevel + 5]
		endif

		; check extra cloak
		protectionLevels = ds.FindCloakProtectionLevels(akArmor)
		warmthLevel = protectionLevels[0]
		coverageLevel = protectionLevels[1]
		found = protectionLevels[2]

		if found
			armor_data[11] = StandardCloakValues[warmthLevel]
			armor_data[12] = StandardCloakValues[coverageLevel + 5]
		endif

	elseif aiGearType == GEARTYPE_HEAD
		protectionLevels = ds.FindHeadProtectionLevels(akArmor)
		int warmthLevel = protectionLevels[0]
		int coverageLevel = protectionLevels[1]
		bool found = protectionLevels[2]

		if found
			armor_data[0] = aiGearType
			armor_data[1] = StandardHeadValues[warmthLevel]
			armor_data[2] = StandardHeadValues[coverageLevel + 5]
		else
			armor_data[0] = GEARTYPE_NOTFOUND
			return armor_data
		endif

		; check extra cloak
		protectionLevels = ds.FindCloakProtectionLevels(akArmor)
		warmthLevel = protectionLevels[0]
		coverageLevel = protectionLevels[1]
		found = protectionLevels[2]

		if found
			armor_data[11] = StandardCloakValues[warmthLevel]
			armor_data[12] = StandardCloakValues[coverageLevel + 5]
		endif

	elseif aiGearType == GEARTYPE_HANDS
		protectionLevels = ds.FindHandsProtectionLevels(akArmor)
		int warmthLevel = protectionLevels[0]
		int coverageLevel = protectionLevels[1]
		bool found = protectionLevels[2]

		if found
			armor_data[0] = aiGearType
			armor_data[1] = StandardHandsValues[warmthLevel]
			armor_data[2] = StandardHandsValues[coverageLevel + 5]
		else
			armor_data[0] = GEARTYPE_NOTFOUND
			return armor_data
		endif

	elseif aiGearType == GEARTYPE_FEET
		protectionLevels = ds.FindFeetProtectionLevels(akArmor)
		int warmthLevel = protectionLevels[0]
		int coverageLevel = protectionLevels[1]
		bool found = protectionLevels[2]

		if found
			armor_data[0] = aiGearType
			armor_data[1] = StandardFeetValues[warmthLevel]
			armor_data[2] = StandardFeetValues[coverageLevel + 5]
		else
			armor_data[0] = GEARTYPE_NOTFOUND
			return armor_data
		endif

	elseif aiGearType == GEARTYPE_CLOAK
		protectionLevels = ds.FindCloakProtectionLevels(akArmor)
		int warmthLevel = protectionLevels[0]
		int coverageLevel = protectionLevels[1]
		bool found = protectionLevels[2]

		if found
			armor_data[0] = aiGearType
			armor_data[1] = StandardCloakValues[warmthLevel]
			armor_data[2] = StandardCloakValues[coverageLevel + 5]
		else
			armor_data[0] = GEARTYPE_NOTFOUND
			return armor_data
		endif

	;@TODO
	;/
	elseif aiGearType == GEARTYPE_MISC
		protectionLevels = ds.FindMiscProtectionLevels(akArmor)
		int warmthLevel = protectionLevels[0]
		int coverageLevel = protectionLevels[1]

		if warmthLevel > -1 || coverageLevel > -1
			armor_data[0] = aiGearType
			armor_data[1] = StandardMiscValues[warmthLevel]
			armor_data[2] = StandardMiscValues[coverageLevel + 5]
		endif
	/;
	endif
	; else if it wasn't found...

	return armor_data
endFunction

int[] function GetDefaultArmorData(string asKey)
	string defaults_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	int[] armor_data = new int[15]
	if ProfileHasKey(defaults_path, asKey)
		armor_data[0] = JsonUtil.IntListGet(defaults_path, asKey, 0)
		armor_data[1] = JsonUtil.IntListGet(defaults_path, asKey, 1)
		armor_data[2] = JsonUtil.IntListGet(defaults_path, asKey, 2)
		armor_data[3] = JsonUtil.IntListGet(defaults_path, asKey, 3)
		armor_data[4] = JsonUtil.IntListGet(defaults_path, asKey, 4)
		armor_data[5] = JsonUtil.IntListGet(defaults_path, asKey, 5)
		armor_data[6] = JsonUtil.IntListGet(defaults_path, asKey, 6)
		armor_data[7] = JsonUtil.IntListGet(defaults_path, asKey, 7)
		armor_data[8] = JsonUtil.IntListGet(defaults_path, asKey, 8)
		armor_data[9] = JsonUtil.IntListGet(defaults_path, asKey, 9)
		armor_data[10] = JsonUtil.IntListGet(defaults_path, asKey, 10)
		armor_data[11] = JsonUtil.IntListGet(defaults_path, asKey, 11)
		armor_data[12] = JsonUtil.IntListGet(defaults_path, asKey, 12)
		armor_data[13] = JsonUtil.IntListGet(defaults_path, asKey, 13)
		armor_data[14] = JsonUtil.IntListGet(defaults_path, asKey, 14)
	endif
	; debug.trace("Returning default armor data " + armor_data)
	return armor_data
endFunction

function RestoreAllDefaultArmorData()
	; The nuclear option - destroys all custom armor data on a profile
	string profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	JsonUtil.ClearAll(profile_path)
	JsonUtil.Save(profile_path)
endFunction

function SaveCurrentUserArmorProfile()
	string profile_path = CONFIG_PATH + ARMOR_PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	JsonUtil.Save(profile_path)
endFunction

function SaveDefaultArmorProfile()
	string defaults_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	JsonUtil.Save(defaults_path)
endFunction

; Lilac Mock States ===========================================================

int[] property mock_GetArmorProtectionData_value auto hidden
int property mock_GetArmorProtectionData_callcount auto hidden

state mock_GetArmorProtectionData
	int[] function GetArmorProtectionData(Armor akArmor)
		mock_GetArmorProtectionData_callcount += 1
		return mock_GetArmorProtectionData_value
	endFunction
endState

int[] property mock_GetArmorData_value auto hidden
int[] property mock_GetArmorProtectionDataByKeyword_value auto hidden
int property mock_GetArmorProtectionDataByType_value auto hidden
int[] property mock_GetArmorProtectionDataByAnalysis_value auto hidden

int property mock_GetArmorData_callcount auto hidden
int property mock_GetArmorProtectionDataByKeyword_callcount auto hidden
int property mock_GetArmorProtectionDataByType_callcount auto hidden
int property mock_GetArmorProtectionDataByAnalysis_callcount auto hidden

state mock_getArmorProtectionDataByX
	int[] function GetArmorData(Armor akArmor)
		mock_GetArmorData_callcount += 1
		return mock_GetArmorData_value
	endFunction

	int[] function GetArmorProtectionDataByKeyword(Armor akArmor)
		mock_GetArmorProtectionDataByKeyword_callcount += 1
		return mock_GetArmorProtectionDataByKeyword_value
	endFunction

	int function GetArmorProtectionDataByType(Armor akArmor, int aiGearType, int aiStandardKeywordIndex)
		mock_GetArmorProtectionDataByType_callcount += 1
		return mock_GetArmorProtectionDataByType_value
	endFunction

	int[] function GetArmorProtectionDataByAnalysis(Armor akArmor)
		mock_GetArmorProtectionDataByAnalysis_callcount += 1
		return mock_GetArmorProtectionDataByAnalysis_value
	endFunction
endState


; DEPRECATED
Keyword property _FrostData_ArmorBody auto
Keyword property _FrostData_ArmorHead auto
Keyword property _FrostData_ArmorHands auto
Keyword property _FrostData_ArmorFeet auto
Keyword property _FrostData_ArmorCloak auto
Keyword property _FrostData_ArmorShield auto
Keyword property _FrostData_ArmorIgnore auto