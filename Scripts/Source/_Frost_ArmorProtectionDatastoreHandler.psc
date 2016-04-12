scriptname _Frost_ArmorProtectionDatastoreHandler extends _Frost_APDatastoreDefaultData

import StorageUtil
import StringUtil
import FrostUtil
import _FrostInternal
import Math

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
Keyword property _Frost_WarmthLow auto
Keyword property _Frost_WarmthAverage auto
Keyword property _Frost_WarmthGood auto
Keyword property _Frost_WarmthExcellent auto
Keyword property _Frost_WarmthMax auto
Keyword property _Frost_CoveragePoor auto
Keyword property _Frost_CoverageLow auto
Keyword property _Frost_CoverageAverage auto
Keyword property _Frost_CoverageGood auto
Keyword property _Frost_CoverageExcellent auto
Keyword property _Frost_CoverageMax auto

Keyword property _Frost_ExtraBodyWarmthPoor auto
Keyword property _Frost_ExtraBodyWarmthLow auto
Keyword property _Frost_ExtraBodyWarmthAverage auto
Keyword property _Frost_ExtraBodyWarmthGood auto
Keyword property _Frost_ExtraBodyWarmthExcellent auto
Keyword property _Frost_ExtraBodyWarmthMax auto

Keyword property _Frost_ExtraHeadWarmthPoor auto
Keyword property _Frost_ExtraHeadWarmthLow auto
Keyword property _Frost_ExtraHeadWarmthAverage auto
Keyword property _Frost_ExtraHeadWarmthGood auto
Keyword property _Frost_ExtraHeadWarmthExcellent auto
Keyword property _Frost_ExtraHeadWarmthMax auto

Keyword property _Frost_ExtraHandsWarmthPoor auto
Keyword property _Frost_ExtraHandsWarmthLow auto
Keyword property _Frost_ExtraHandsWarmthAverage auto
Keyword property _Frost_ExtraHandsWarmthGood auto
Keyword property _Frost_ExtraHandsWarmthExcellent auto
Keyword property _Frost_ExtraHandsWarmthMax auto

Keyword property _Frost_ExtraFeetWarmthPoor auto
Keyword property _Frost_ExtraFeetWarmthLow auto
Keyword property _Frost_ExtraFeetWarmthAverage auto
Keyword property _Frost_ExtraFeetWarmthGood auto
Keyword property _Frost_ExtraFeetWarmthExcellent auto
Keyword property _Frost_ExtraFeetWarmthMax auto

Keyword property _Frost_ExtraCloakWarmthPoor auto
Keyword property _Frost_ExtraCloakWarmthLow auto
Keyword property _Frost_ExtraCloakWarmthAverage auto
Keyword property _Frost_ExtraCloakWarmthGood auto
Keyword property _Frost_ExtraCloakWarmthExcellent auto
Keyword property _Frost_ExtraCloakWarmthMax auto

Keyword property _Frost_ExtraMiscWarmthPoor auto
Keyword property _Frost_ExtraMiscWarmthLow auto
Keyword property _Frost_ExtraMiscWarmthAverage auto
Keyword property _Frost_ExtraMiscWarmthGood auto
Keyword property _Frost_ExtraMiscWarmthExcellent auto
Keyword property _Frost_ExtraMiscWarmthMax auto

Keyword property _Frost_ExtraBodyCoveragePoor auto
Keyword property _Frost_ExtraBodyCoverageLow auto
Keyword property _Frost_ExtraBodyCoverageAverage auto
Keyword property _Frost_ExtraBodyCoverageGood auto
Keyword property _Frost_ExtraBodyCoverageExcellent auto
Keyword property _Frost_ExtraBodyCoverageMax auto

Keyword property _Frost_ExtraHeadCoveragePoor auto
Keyword property _Frost_ExtraHeadCoverageLow auto
Keyword property _Frost_ExtraHeadCoverageAverage auto
Keyword property _Frost_ExtraHeadCoverageGood auto
Keyword property _Frost_ExtraHeadCoverageExcellent auto
Keyword property _Frost_ExtraHeadCoverageMax auto

Keyword property _Frost_ExtraHandsCoveragePoor auto
Keyword property _Frost_ExtraHandsCoverageLow auto
Keyword property _Frost_ExtraHandsCoverageAverage auto
Keyword property _Frost_ExtraHandsCoverageGood auto
Keyword property _Frost_ExtraHandsCoverageExcellent auto
Keyword property _Frost_ExtraHandsCoverageMax auto

Keyword property _Frost_ExtraFeetCoveragePoor auto
Keyword property _Frost_ExtraFeetCoverageLow auto
Keyword property _Frost_ExtraFeetCoverageAverage auto
Keyword property _Frost_ExtraFeetCoverageGood auto
Keyword property _Frost_ExtraFeetCoverageExcellent auto
Keyword property _Frost_ExtraFeetCoverageMax auto

Keyword property _Frost_ExtraCloakCoveragePoor auto
Keyword property _Frost_ExtraCloakCoverageLow auto
Keyword property _Frost_ExtraCloakCoverageAverage auto
Keyword property _Frost_ExtraCloakCoverageGood auto
Keyword property _Frost_ExtraCloakCoverageExcellent auto
Keyword property _Frost_ExtraCloakCoverageMax auto

Keyword property _Frost_ExtraMiscCoveragePoor auto
Keyword property _Frost_ExtraMiscCoverageLow auto
Keyword property _Frost_ExtraMiscCoverageAverage auto
Keyword property _Frost_ExtraMiscCoverageGood auto
Keyword property _Frost_ExtraMiscCoverageExcellent auto
Keyword property _Frost_ExtraMiscCoverageMax auto


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

Keyword[] OverrideKeywords
int[] OverrideValues

int property WARMTH_BODY_POOR = 30 autoReadOnly hidden
int property WARMTH_BODY_LOW = 60 autoReadOnly hidden
int property WARMTH_BODY_AVERAGE = 125 autoReadOnly hidden
int property WARMTH_BODY_GOOD = 140 autoReadOnly hidden
int property WARMTH_BODY_EXCELLENT = 175 autoReadOnly hidden
int property WARMTH_BODY_MAX = 190 autoReadOnly hidden

int property WARMTH_HEAD_POOR = 10 autoReadOnly hidden
int property WARMTH_HEAD_LOW = 15 autoReadOnly hidden
int property WARMTH_HEAD_AVERAGE = 30 autoReadOnly hidden
int property WARMTH_HEAD_GOOD = 40 autoReadOnly hidden
int property WARMTH_HEAD_EXCELLENT = 50 autoReadOnly hidden
int property WARMTH_HEAD_MAX = 55 autoReadOnly hidden

int property WARMTH_HANDS_POOR = 3 autoReadOnly hidden
int property WARMTH_HANDS_LOW = 9 autoReadOnly hidden
int property WARMTH_HANDS_AVERAGE = 12 autoReadOnly hidden
int property WARMTH_HANDS_GOOD = 15 autoReadOnly hidden
int property WARMTH_HANDS_EXCELLENT = 21 autoReadOnly hidden
int property WARMTH_HANDS_MAX = 24 autoReadOnly hidden

int property WARMTH_FEET_POOR = 3 autoReadOnly hidden
int property WARMTH_FEET_LOW = 7 autoReadOnly hidden
int property WARMTH_FEET_AVERAGE = 12 autoReadOnly hidden
int property WARMTH_FEET_GOOD = 15 autoReadOnly hidden
int property WARMTH_FEET_EXCELLENT = 21 autoReadOnly hidden
int property WARMTH_FEET_MAX = 24 autoReadOnly hidden

int property WARMTH_CLOAK_POOR = 1 autoReadOnly hidden
int property WARMTH_CLOAK_LOW = 6 autoReadOnly hidden
int property WARMTH_CLOAK_AVERAGE = 12 autoReadOnly hidden
int property WARMTH_CLOAK_GOOD = 20 autoReadOnly hidden
int property WARMTH_CLOAK_EXCELLENT = 30 autoReadOnly hidden
int property WARMTH_CLOAK_MAX = 40 autoReadOnly hidden

int property WARMTH_MISC_POOR = 1 autoReadOnly hidden
int property WARMTH_MISC_LOW = 6 autoReadOnly hidden
int property WARMTH_MISC_AVERAGE = 12 autoReadOnly hidden
int property WARMTH_MISC_GOOD = 20 autoReadOnly hidden
int property WARMTH_MISC_EXCELLENT = 30 autoReadOnly hidden
int property WARMTH_MISC_MAX = 40 autoReadOnly hidden

int property COVERAGE_BODY_POOR = 16 autoReadOnly hidden
int property COVERAGE_BODY_LOW = 35 autoReadOnly hidden
int property COVERAGE_BODY_AVERAGE = 54 autoReadOnly hidden
int property COVERAGE_BODY_GOOD = 72 autoReadOnly hidden
int property COVERAGE_BODY_EXCELLENT = 91 autoReadOnly hidden
int property COVERAGE_BODY_MAX = 109 autoReadOnly hidden

int property COVERAGE_HEAD_POOR = 3 autoReadOnly hidden
int property COVERAGE_HEAD_LOW = 14 autoReadOnly hidden
int property COVERAGE_HEAD_AVERAGE = 29 autoReadOnly hidden
int property COVERAGE_HEAD_GOOD = 43 autoReadOnly hidden
int property COVERAGE_HEAD_EXCELLENT = 58 autoReadOnly hidden
int property COVERAGE_HEAD_MAX = 72 autoReadOnly hidden

int property COVERAGE_HANDS_POOR = 3 autoReadOnly hidden
int property COVERAGE_HANDS_LOW = 6 autoReadOnly hidden
int property COVERAGE_HANDS_AVERAGE = 14 autoReadOnly hidden
int property COVERAGE_HANDS_GOOD = 21 autoReadOnly hidden
int property COVERAGE_HANDS_EXCELLENT = 29 autoReadOnly hidden
int property COVERAGE_HANDS_MAX = 35 autoReadOnly hidden

int property COVERAGE_FEET_POOR = 3 autoReadOnly hidden
int property COVERAGE_FEET_LOW = 6 autoReadOnly hidden
int property COVERAGE_FEET_AVERAGE = 14 autoReadOnly hidden
int property COVERAGE_FEET_GOOD = 21 autoReadOnly hidden
int property COVERAGE_FEET_EXCELLENT = 29 autoReadOnly hidden
int property COVERAGE_FEET_MAX = 35 autoReadOnly hidden

int property COVERAGE_CLOAK_POOR = 1 autoReadOnly hidden
int property COVERAGE_CLOAK_LOW = 6 autoReadOnly hidden
int property COVERAGE_CLOAK_AVERAGE = 12 autoReadOnly hidden
int property COVERAGE_CLOAK_GOOD = 20 autoReadOnly hidden
int property COVERAGE_CLOAK_EXCELLENT = 30 autoReadOnly hidden
int property COVERAGE_CLOAK_MAX = 40 autoReadOnly hidden

int property COVERAGE_MISC_POOR = 1 autoReadOnly hidden
int property COVERAGE_MISC_LOW = 6 autoReadOnly hidden
int property COVERAGE_MISC_AVERAGE = 12 autoReadOnly hidden
int property COVERAGE_MISC_GOOD = 20 autoReadOnly hidden
int property COVERAGE_MISC_EXCELLENT = 30 autoReadOnly hidden
int property COVERAGE_MISC_MAX = 40 autoReadOnly hidden


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
	StandardKeywords = new Keyword[12]
	StandardBodyValues = new int[12]
	StandardHeadValues = new int[12]
	StandardHandsValues = new int[12]
	StandardFeetValues = new int[12]
	StandardCloakValues = new int[12]
	StandardMiscValues = new int[12]
	StandardPartIndex = new int[12]

	OverrideKeywords = new Keyword[72]
	OverrideValues = new int[72]
	OverrideExtraPartIndex = new int[72]

	StandardKeywords[0] = _Frost_WarmthPoor
	StandardKeywords[1] = _Frost_WarmthLow
	StandardKeywords[2] = _Frost_WarmthAverage
	StandardKeywords[3] = _Frost_WarmthGood
	StandardKeywords[4] = _Frost_WarmthExcellent
	StandardKeywords[5] = _Frost_WarmthMax
	StandardKeywords[6] = _Frost_CoveragePoor
	StandardKeywords[7] = _Frost_CoverageLow
	StandardKeywords[8] = _Frost_CoverageAverage
	StandardKeywords[9] = _Frost_CoverageGood
	StandardKeywords[10] = _Frost_CoverageExcellent
	StandardKeywords[11] = _Frost_CoverageMax

	StandardBodyValues[0] = WARMTH_BODY_POOR
	StandardBodyValues[1] = WARMTH_BODY_LOW
	StandardBodyValues[2] = WARMTH_BODY_AVERAGE
	StandardBodyValues[3] = WARMTH_BODY_GOOD
	StandardBodyValues[4] = WARMTH_BODY_EXCELLENT
	StandardBodyValues[5] = WARMTH_BODY_MAX
	StandardBodyValues[6] = COVERAGE_BODY_POOR
	StandardBodyValues[7] = COVERAGE_BODY_LOW
	StandardBodyValues[8] = COVERAGE_BODY_AVERAGE
	StandardBodyValues[9] = COVERAGE_BODY_GOOD
	StandardBodyValues[10] = COVERAGE_BODY_EXCELLENT
	StandardBodyValues[11] = COVERAGE_BODY_MAX

	StandardHeadValues[0] = WARMTH_HEAD_POOR
	StandardHeadValues[1] = WARMTH_HEAD_LOW
	StandardHeadValues[2] = WARMTH_HEAD_AVERAGE
	StandardHeadValues[3] = WARMTH_HEAD_GOOD
	StandardHeadValues[4] = WARMTH_HEAD_EXCELLENT
	StandardHeadValues[5] = WARMTH_HEAD_MAX
	StandardHeadValues[6] = COVERAGE_HEAD_POOR
	StandardHeadValues[7] = COVERAGE_HEAD_LOW
	StandardHeadValues[8] = COVERAGE_HEAD_AVERAGE
	StandardHeadValues[9] = COVERAGE_HEAD_GOOD
	StandardHeadValues[10] = COVERAGE_HEAD_EXCELLENT
	StandardHeadValues[11] = COVERAGE_HEAD_MAX

	StandardHandsValues[0] = WARMTH_HANDS_POOR
	StandardHandsValues[1] = WARMTH_HANDS_LOW
	StandardHandsValues[2] = WARMTH_HANDS_AVERAGE
	StandardHandsValues[3] = WARMTH_HANDS_GOOD
	StandardHandsValues[4] = WARMTH_HANDS_EXCELLENT
	StandardHandsValues[5] = WARMTH_HANDS_MAX
	StandardHandsValues[6] = COVERAGE_HANDS_POOR
	StandardHandsValues[7] = COVERAGE_HANDS_LOW
	StandardHandsValues[8] = COVERAGE_HANDS_AVERAGE
	StandardHandsValues[9] = COVERAGE_HANDS_GOOD
	StandardHandsValues[10] = COVERAGE_HANDS_EXCELLENT
	StandardHandsValues[11] = COVERAGE_HANDS_MAX

	StandardFeetValues[0] = WARMTH_FEET_POOR
	StandardFeetValues[1] = WARMTH_FEET_LOW
	StandardFeetValues[2] = WARMTH_FEET_AVERAGE
	StandardFeetValues[3] = WARMTH_FEET_GOOD
	StandardFeetValues[4] = WARMTH_FEET_EXCELLENT
	StandardFeetValues[5] = WARMTH_FEET_MAX
	StandardFeetValues[6] = COVERAGE_FEET_POOR
	StandardFeetValues[7] = COVERAGE_FEET_LOW
	StandardFeetValues[8] = COVERAGE_FEET_AVERAGE
	StandardFeetValues[9] = COVERAGE_FEET_GOOD
	StandardFeetValues[10] = COVERAGE_FEET_EXCELLENT
	StandardFeetValues[11] = COVERAGE_FEET_MAX

	StandardCloakValues[0] = WARMTH_CLOAK_POOR
	StandardCloakValues[1] = WARMTH_CLOAK_LOW
	StandardCloakValues[2] = WARMTH_CLOAK_AVERAGE
	StandardCloakValues[3] = WARMTH_CLOAK_GOOD
	StandardCloakValues[4] = WARMTH_CLOAK_EXCELLENT
	StandardCloakValues[5] = WARMTH_CLOAK_MAX
	StandardCloakValues[6] = COVERAGE_CLOAK_POOR
	StandardCloakValues[7] = COVERAGE_CLOAK_LOW
	StandardCloakValues[8] = COVERAGE_CLOAK_AVERAGE
	StandardCloakValues[9] = COVERAGE_CLOAK_GOOD
	StandardCloakValues[10] = COVERAGE_CLOAK_EXCELLENT
	StandardCloakValues[11] = COVERAGE_CLOAK_MAX

	StandardMiscValues[0] = WARMTH_MISC_POOR
	StandardMiscValues[1] = WARMTH_MISC_LOW
	StandardMiscValues[2] = WARMTH_MISC_AVERAGE
	StandardMiscValues[3] = WARMTH_MISC_GOOD
	StandardMiscValues[4] = WARMTH_MISC_EXCELLENT
	StandardMiscValues[5] = WARMTH_MISC_MAX
	StandardMiscValues[6] = COVERAGE_MISC_POOR
	StandardMiscValues[7] = COVERAGE_MISC_LOW
	StandardMiscValues[8] = COVERAGE_MISC_AVERAGE
	StandardMiscValues[9] = COVERAGE_MISC_GOOD
	StandardMiscValues[10] = COVERAGE_MISC_EXCELLENT
	StandardMiscValues[11] = COVERAGE_MISC_MAX

	StandardPartIndex[0] = 0
	StandardPartIndex[1] = 0
	StandardPartIndex[2] = 0
	StandardPartIndex[3] = 0
	StandardPartIndex[4] = 0
	StandardPartIndex[5] = 0
	StandardPartIndex[6] = 1
	StandardPartIndex[7] = 1
	StandardPartIndex[8] = 1
	StandardPartIndex[9] = 1
	StandardPartIndex[10] = 1
	StandardPartIndex[11] = 1

	OverrideKeywords[0] = _Frost_ExtraBodyWarmthPoor
	OverrideKeywords[1] = _Frost_ExtraBodyWarmthLow
	OverrideKeywords[2] = _Frost_ExtraBodyWarmthAverage
	OverrideKeywords[3] = _Frost_ExtraBodyWarmthGood
	OverrideKeywords[4] = _Frost_ExtraBodyWarmthExcellent
	OverrideKeywords[5] = _Frost_ExtraBodyWarmthMax
	OverrideKeywords[6] = _Frost_ExtraHeadWarmthPoor
	OverrideKeywords[7] = _Frost_ExtraHeadWarmthLow
	OverrideKeywords[8] = _Frost_ExtraHeadWarmthAverage
	OverrideKeywords[9] = _Frost_ExtraHeadWarmthGood
	OverrideKeywords[10] = _Frost_ExtraHeadWarmthExcellent
	OverrideKeywords[11] = _Frost_ExtraHeadWarmthMax
	OverrideKeywords[12] = _Frost_ExtraHandsWarmthPoor
	OverrideKeywords[13] = _Frost_ExtraHandsWarmthLow
	OverrideKeywords[14] = _Frost_ExtraHandsWarmthAverage
	OverrideKeywords[15] = _Frost_ExtraHandsWarmthGood
	OverrideKeywords[16] = _Frost_ExtraHandsWarmthExcellent
	OverrideKeywords[17] = _Frost_ExtraHandsWarmthMax
	OverrideKeywords[18] = _Frost_ExtraFeetWarmthPoor
	OverrideKeywords[19] = _Frost_ExtraFeetWarmthLow
	OverrideKeywords[20] = _Frost_ExtraFeetWarmthAverage
	OverrideKeywords[21] = _Frost_ExtraFeetWarmthGood
	OverrideKeywords[22] = _Frost_ExtraFeetWarmthExcellent
	OverrideKeywords[23] = _Frost_ExtraFeetWarmthMax
	OverrideKeywords[24] = _Frost_ExtraCloakWarmthPoor
	OverrideKeywords[25] = _Frost_ExtraCloakWarmthLow
	OverrideKeywords[26] = _Frost_ExtraCloakWarmthAverage
	OverrideKeywords[27] = _Frost_ExtraCloakWarmthGood
	OverrideKeywords[28] = _Frost_ExtraCloakWarmthExcellent
	OverrideKeywords[29] = _Frost_ExtraCloakWarmthMax
	OverrideKeywords[30] = _Frost_ExtraMiscWarmthPoor
	OverrideKeywords[31] = _Frost_ExtraMiscWarmthLow
	OverrideKeywords[32] = _Frost_ExtraMiscWarmthAverage
	OverrideKeywords[33] = _Frost_ExtraMiscWarmthGood
	OverrideKeywords[34] = _Frost_ExtraMiscWarmthExcellent
	OverrideKeywords[35] = _Frost_ExtraMiscWarmthMax
	OverrideKeywords[36] = _Frost_ExtraBodyCoveragePoor
	OverrideKeywords[37] = _Frost_ExtraBodyCoverageLow
	OverrideKeywords[38] = _Frost_ExtraBodyCoverageAverage
	OverrideKeywords[39] = _Frost_ExtraBodyCoverageGood
	OverrideKeywords[40] = _Frost_ExtraBodyCoverageExcellent
	OverrideKeywords[41] = _Frost_ExtraBodyCoverageMax
	OverrideKeywords[42] = _Frost_ExtraHeadCoveragePoor
	OverrideKeywords[43] = _Frost_ExtraHeadCoverageLow
	OverrideKeywords[44] = _Frost_ExtraHeadCoverageAverage
	OverrideKeywords[45] = _Frost_ExtraHeadCoverageGood
	OverrideKeywords[46] = _Frost_ExtraHeadCoverageExcellent
	OverrideKeywords[47] = _Frost_ExtraHeadCoverageMax
	OverrideKeywords[48] = _Frost_ExtraHandsCoveragePoor
	OverrideKeywords[49] = _Frost_ExtraHandsCoverageLow
	OverrideKeywords[50] = _Frost_ExtraHandsCoverageAverage
	OverrideKeywords[51] = _Frost_ExtraHandsCoverageGood
	OverrideKeywords[52] = _Frost_ExtraHandsCoverageExcellent
	OverrideKeywords[53] = _Frost_ExtraHandsCoverageMax
	OverrideKeywords[54] = _Frost_ExtraFeetCoveragePoor
	OverrideKeywords[55] = _Frost_ExtraFeetCoverageLow
	OverrideKeywords[56] = _Frost_ExtraFeetCoverageAverage
	OverrideKeywords[57] = _Frost_ExtraFeetCoverageGood
	OverrideKeywords[58] = _Frost_ExtraFeetCoverageExcellent
	OverrideKeywords[59] = _Frost_ExtraFeetCoverageMax
	OverrideKeywords[60] = _Frost_ExtraCloakCoveragePoor
	OverrideKeywords[61] = _Frost_ExtraCloakCoverageLow
	OverrideKeywords[62] = _Frost_ExtraCloakCoverageAverage
	OverrideKeywords[63] = _Frost_ExtraCloakCoverageGood
	OverrideKeywords[64] = _Frost_ExtraCloakCoverageExcellent
	OverrideKeywords[65] = _Frost_ExtraCloakCoverageMax
	OverrideKeywords[66] = _Frost_ExtraMiscCoveragePoor
	OverrideKeywords[67] = _Frost_ExtraMiscCoverageLow
	OverrideKeywords[68] = _Frost_ExtraMiscCoverageAverage
	OverrideKeywords[69] = _Frost_ExtraMiscCoverageGood
	OverrideKeywords[70] = _Frost_ExtraMiscCoverageExcellent
	OverrideKeywords[71] = _Frost_ExtraMiscCoverageMax

	OverrideValues[0] = WARMTH_BODY_POOR
	OverrideValues[1] = WARMTH_BODY_LOW
	OverrideValues[2] = WARMTH_BODY_AVERAGE
	OverrideValues[3] = WARMTH_BODY_GOOD
	OverrideValues[4] = WARMTH_BODY_EXCELLENT
	OverrideValues[5] = WARMTH_BODY_MAX
	OverrideValues[6] = WARMTH_HEAD_POOR
	OverrideValues[7] = WARMTH_HEAD_LOW
	OverrideValues[8] = WARMTH_HEAD_AVERAGE
	OverrideValues[9] = WARMTH_HEAD_GOOD
	OverrideValues[10] = WARMTH_HEAD_EXCELLENT
	OverrideValues[11] = WARMTH_HEAD_MAX
	OverrideValues[12] = WARMTH_HANDS_POOR
	OverrideValues[13] = WARMTH_HANDS_LOW
	OverrideValues[14] = WARMTH_HANDS_AVERAGE
	OverrideValues[15] = WARMTH_HANDS_GOOD
	OverrideValues[16] = WARMTH_HANDS_EXCELLENT
	OverrideValues[17] = WARMTH_HANDS_MAX
	OverrideValues[18] = WARMTH_FEET_POOR
	OverrideValues[19] = WARMTH_FEET_LOW
	OverrideValues[20] = WARMTH_FEET_AVERAGE
	OverrideValues[21] = WARMTH_FEET_GOOD
	OverrideValues[22] = WARMTH_FEET_EXCELLENT
	OverrideValues[23] = WARMTH_FEET_MAX
	OverrideValues[24] = WARMTH_CLOAK_POOR
	OverrideValues[25] = WARMTH_CLOAK_LOW
	OverrideValues[26] = WARMTH_CLOAK_AVERAGE
	OverrideValues[27] = WARMTH_CLOAK_GOOD
	OverrideValues[28] = WARMTH_CLOAK_EXCELLENT
	OverrideValues[29] = WARMTH_CLOAK_MAX
	OverrideValues[30] = WARMTH_MISC_POOR
	OverrideValues[31] = WARMTH_MISC_LOW
	OverrideValues[32] = WARMTH_MISC_AVERAGE
	OverrideValues[33] = WARMTH_MISC_GOOD
	OverrideValues[34] = WARMTH_MISC_EXCELLENT
	OverrideValues[35] = WARMTH_MISC_MAX
	OverrideValues[36] = COVERAGE_BODY_POOR
	OverrideValues[37] = COVERAGE_BODY_LOW
	OverrideValues[38] = COVERAGE_BODY_AVERAGE
	OverrideValues[39] = COVERAGE_BODY_GOOD
	OverrideValues[40] = COVERAGE_BODY_EXCELLENT
	OverrideValues[41] = COVERAGE_BODY_MAX
	OverrideValues[42] = COVERAGE_HEAD_POOR
	OverrideValues[43] = COVERAGE_HEAD_LOW
	OverrideValues[44] = COVERAGE_HEAD_AVERAGE
	OverrideValues[45] = COVERAGE_HEAD_GOOD
	OverrideValues[46] = COVERAGE_HEAD_EXCELLENT
	OverrideValues[47] = COVERAGE_HEAD_MAX
	OverrideValues[48] = COVERAGE_HANDS_POOR
	OverrideValues[49] = COVERAGE_HANDS_LOW
	OverrideValues[50] = COVERAGE_HANDS_AVERAGE
	OverrideValues[51] = COVERAGE_HANDS_GOOD
	OverrideValues[52] = COVERAGE_HANDS_EXCELLENT
	OverrideValues[53] = COVERAGE_HANDS_MAX
	OverrideValues[54] = COVERAGE_FEET_POOR
	OverrideValues[55] = COVERAGE_FEET_LOW
	OverrideValues[56] = COVERAGE_FEET_AVERAGE
	OverrideValues[57] = COVERAGE_FEET_GOOD
	OverrideValues[58] = COVERAGE_FEET_EXCELLENT
	OverrideValues[59] = COVERAGE_FEET_MAX
	OverrideValues[60] = COVERAGE_CLOAK_POOR
	OverrideValues[61] = COVERAGE_CLOAK_LOW
	OverrideValues[62] = COVERAGE_CLOAK_AVERAGE
	OverrideValues[63] = COVERAGE_CLOAK_GOOD
	OverrideValues[64] = COVERAGE_CLOAK_EXCELLENT
	OverrideValues[65] = COVERAGE_CLOAK_MAX
	OverrideValues[66] = COVERAGE_MISC_POOR
	OverrideValues[67] = COVERAGE_MISC_LOW
	OverrideValues[68] = COVERAGE_MISC_AVERAGE
	OverrideValues[69] = COVERAGE_MISC_GOOD
	OverrideValues[70] = COVERAGE_MISC_EXCELLENT
	OverrideValues[71] = COVERAGE_MISC_MAX

	OverrideExtraPartIndex[0] = 2
	OverrideExtraPartIndex[1] = 2
	OverrideExtraPartIndex[2] = 2
	OverrideExtraPartIndex[3] = 2
	OverrideExtraPartIndex[4] = 2
	OverrideExtraPartIndex[5] = 2
	OverrideExtraPartIndex[6] = 4
	OverrideExtraPartIndex[7] = 4
	OverrideExtraPartIndex[8] = 4
	OverrideExtraPartIndex[9] = 4
	OverrideExtraPartIndex[10] = 4
	OverrideExtraPartIndex[11] = 4
	OverrideExtraPartIndex[12] = 6
	OverrideExtraPartIndex[13] = 6
	OverrideExtraPartIndex[14] = 6
	OverrideExtraPartIndex[15] = 6
	OverrideExtraPartIndex[16] = 6
	OverrideExtraPartIndex[17] = 6
	OverrideExtraPartIndex[18] = 8
	OverrideExtraPartIndex[19] = 8
	OverrideExtraPartIndex[20] = 8
	OverrideExtraPartIndex[21] = 8
	OverrideExtraPartIndex[22] = 8
	OverrideExtraPartIndex[23] = 8
	OverrideExtraPartIndex[24] = 10
	OverrideExtraPartIndex[25] = 10
	OverrideExtraPartIndex[26] = 10
	OverrideExtraPartIndex[27] = 10
	OverrideExtraPartIndex[28] = 10
	OverrideExtraPartIndex[29] = 10
	OverrideExtraPartIndex[30] = 12
	OverrideExtraPartIndex[31] = 12
	OverrideExtraPartIndex[32] = 12
	OverrideExtraPartIndex[33] = 12
	OverrideExtraPartIndex[34] = 12
	OverrideExtraPartIndex[35] = 12
	OverrideExtraPartIndex[36] = 3
	OverrideExtraPartIndex[37] = 3
	OverrideExtraPartIndex[38] = 3
	OverrideExtraPartIndex[39] = 3
	OverrideExtraPartIndex[40] = 3
	OverrideExtraPartIndex[41] = 3
	OverrideExtraPartIndex[42] = 5
	OverrideExtraPartIndex[43] = 5
	OverrideExtraPartIndex[44] = 5
	OverrideExtraPartIndex[45] = 5
	OverrideExtraPartIndex[46] = 5
	OverrideExtraPartIndex[47] = 5
	OverrideExtraPartIndex[48] = 7
	OverrideExtraPartIndex[49] = 7
	OverrideExtraPartIndex[50] = 7
	OverrideExtraPartIndex[51] = 7
	OverrideExtraPartIndex[52] = 7
	OverrideExtraPartIndex[53] = 7
	OverrideExtraPartIndex[54] = 9
	OverrideExtraPartIndex[55] = 9
	OverrideExtraPartIndex[56] = 9
	OverrideExtraPartIndex[57] = 9
	OverrideExtraPartIndex[58] = 9
	OverrideExtraPartIndex[59] = 9
	OverrideExtraPartIndex[60] = 11
	OverrideExtraPartIndex[61] = 11
	OverrideExtraPartIndex[62] = 11
	OverrideExtraPartIndex[63] = 11
	OverrideExtraPartIndex[64] = 11
	OverrideExtraPartIndex[65] = 11
	OverrideExtraPartIndex[66] = 13
	OverrideExtraPartIndex[67] = 13
	OverrideExtraPartIndex[68] = 13
	OverrideExtraPartIndex[69] = 13
	OverrideExtraPartIndex[70] = 13
	OverrideExtraPartIndex[71] = 13
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

int[] function GetTotalProtectionValues(Armor akArmor)
	int[] armor_data = new int[2]
	int[] ap = GetArmorProtectionData(akArmor)

	; Original contract with ClothingSystem maintained (3.1).
	if ap[14] == 1
		armor_data[0] = 0
		armor_data[1] = 0
		return armor_data
	endif

	armor_data[0] = ap[0] + ap[2] + ap[4] + ap[6] + ap[8] + ap[10] + ap[12]
	armor_data[1] = ap[1] + ap[3] + ap[5] + ap[7] + ap[9] + ap[11] + ap[13]

	return armor_data
endFunction

int[] function GetArmorProtectionDataByKeyword(Armor akArmor)
	int[] armor_data = new int[15]
	armor_data[0] = -1
	if akArmor.HasKeyword(_Frost_Ignore)
		armor_data[14] = 1
		return armor_data
	endif

	int keyword_count = akArmor.GetNumKeywords()
	int i = 0
	while i < keyword_count
		Keyword k = akArmor.GetNthKeyword(i)
		int idx = StandardKeywords.Find(k)
		if idx != -1
			; standard keyword
			int determined_value = GetArmorProtectionDataByType(akArmor, idx)
			armor_data[StandardPartIndex[idx]] = determined_value
		else
			; extra parts
			idx = OverrideKeywords.Find(k)
			if idx != -1
				armor_data[OverrideExtraPartIndex[idx]] = OverrideValues[idx]
			endif
		endif
		i += 1
	endWhile
	return armor_data
endFunction

int function GetArmorProtectionDataByType(Armor akArmor, int aiStandardKeywordIndex)
	; The slot mask is the single source of truth for what "kind" of armor this is.
	int armor_mask = akArmor.GetSlotMask()
	int gear_type = GetGearType(akArmor, armor_mask, abStrictMode = false)
	if gear_type == GEARTYPE_BODY
		return StandardBodyValues[aiStandardKeywordIndex]
	elseif gear_type == GEARTYPE_HEAD
		return StandardHeadValues[aiStandardKeywordIndex]
	elseif gear_type == GEARTYPE_HANDS
		return StandardHandsValues[aiStandardKeywordIndex]
	elseif gear_type == GEARTYPE_FEET
		return StandardFeetValues[aiStandardKeywordIndex]
	elseif gear_type == GEARTYPE_CLOAK
		return StandardCloakValues[aiStandardKeywordIndex]
	elseif gear_type == GEARTYPE_MISC
		return StandardMiscValues[aiStandardKeywordIndex]
	endif
endFunction

int function GetGearType(Armor akArmor, int aiSlotMask, bool abStrictMode = true)
	; Check base types
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
	else
		if abStrictMode
			if LogicalAnd(aiSlotMask, SLOTMASK_SHIELD)
				return GEARTYPE_MISC
			else
				return -1
			endif
		else
			return GEARTYPE_MISC
		endif
	endif
endFunction

int[] function GetArmorProtectionDataByAnalysis(Armor akArmor)
	int[] armor_data = new int[15]

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

	int gear_type = GetGearType(akArmor, armor_mask, abStrictMode = true)

	if gear_type == -1
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
    	if armor_data[14] == 1 ; Ignore
    		return armor_data
    	endif
    	if armor_data[0] == -1
    		armor_data = GetArmorProtectionDataByAnalysis(akArmor)
    	endif
    endif

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

	_Frost_DatastoreInitialized.SetValueInt(2)
endFunction

; Frostfall 3.1 Stuff

bool function DatastoreHasKey(string asKey, bool abCheckDefaultValues = true)
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
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
function SetArmorDataByKey(string asKey, int aiWarmth = 0, int aiCoverage = 0,					\
									 int aiExtraBodyWarmth = 0, int aiExtraBodyCoverage = 0, 	\
									 int aiExtraHeadWarmth = 0, int aiExtraHeadCoverage = 0, 	\
									 int aiExtraHandsWarmth = 0, int aiExtraHandsCoverage = 0, 	\
									 int aiExtraFeetWarmth = 0, int aiExtraFeetCoverage = 0, 	\
									 int aiExtraCloakWarmth = 0, int aiExtraCloakCoverage = 0, 	\
									 int aiExtraMiscWarmth = 0, int aiExtraMiscCoverage = 0, 	\
									 bool abIgnore = false, bool abExportToDefaults = false)
	
	string profile_path
	if abExportToDefaults
		profile_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	else
		profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	endif
	
	if !ProfileHasKey(profile_path, asKey)
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
	if !ProfileHasKey(profile_path, dskey)
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
	if !ProfileHasKey(profile_path, dskey)
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
	if ProfileHasKey(profile_path, dskey)
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
	if ProfileHasKey(profile_path, dskey)
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

	if ProfileHasKey(profile_path, dskey)
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
	else
		armor_data = GetDefaultArmorData(akArmor, abUsableValues = true)
	endif
	return armor_data
endFunction

int[] function GetDefaultArmorData(Armor akArmor, bool abUsableValues = false)
	string defaults_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	string dskey = GetDatastoreKeyFromForm(akArmor)
	int[] armor_data = new int[15]
	armor_data[0] = -1
	if ProfileHasKey(defaults_path, dskey)
		int modifier = 0
		if abUsableValues
			modifier = 1
		endif

		armor_data[0] = JsonUtil.IntListGet(defaults_path, dskey, 0) - modifier
		armor_data[1] = JsonUtil.IntListGet(defaults_path, dskey, 1) - modifier
		armor_data[2] = JsonUtil.IntListGet(defaults_path, dskey, 2) - modifier
		armor_data[3] = JsonUtil.IntListGet(defaults_path, dskey, 3) - modifier
		armor_data[4] = JsonUtil.IntListGet(defaults_path, dskey, 4) - modifier
		armor_data[5] = JsonUtil.IntListGet(defaults_path, dskey, 5) - modifier
		armor_data[6] = JsonUtil.IntListGet(defaults_path, dskey, 6) - modifier
		armor_data[7] = JsonUtil.IntListGet(defaults_path, dskey, 7) - modifier
		armor_data[8] = JsonUtil.IntListGet(defaults_path, dskey, 8) - modifier
		armor_data[9] = JsonUtil.IntListGet(defaults_path, dskey, 9) - modifier
		armor_data[10] = JsonUtil.IntListGet(defaults_path, dskey, 10) - modifier
		armor_data[11] = JsonUtil.IntListGet(defaults_path, dskey, 11) - modifier
		armor_data[12] = JsonUtil.IntListGet(defaults_path, dskey, 12) - modifier
		armor_data[13] = JsonUtil.IntListGet(defaults_path, dskey, 13) - modifier
		armor_data[14] = JsonUtil.IntListGet(defaults_path, dskey, 14) - modifier
	endif
	return armor_data
endFunction

function RestoreDefaultArmorData(Armor akArmor, bool abRemoveIfNoDefaultData = false)
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	string defaults_path = CONFIG_PATH + ARMOR_DEFAULT_PREFIX
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if ProfileHasKey(profile_path, dskey)
		if ProfileHasKey(defaults_path, dskey)
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
		if ProfileHasKey(defaults_path, dskey)
			SetArmorDataA(akArmor, GetDefaultArmorData(akArmor, true))
		endif
	endif
endFunction

function RestoreAllDefaultArmorData()
	; The nuclear option - destroys all custom armor data on a profile
	string profile_path = CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt()
	JsonUtil.ClearAll(CONFIG_PATH + PROFILE_PREFIX + _Frost_Setting_CurrentProfile.GetValueInt())
endFunction


; DEPRECATED
Keyword property _FrostData_ArmorBody auto
Keyword property _FrostData_ArmorHead auto
Keyword property _FrostData_ArmorHands auto
Keyword property _FrostData_ArmorFeet auto
Keyword property _FrostData_ArmorCloak auto
Keyword property _FrostData_ArmorShield auto
Keyword property _FrostData_ArmorIgnore auto