scriptname _Frost_LegacyArmorDatastore extends Quest

import FrostUtil
import CommonArrayHelper

GlobalVariable property _Frost_DatastoreInitialized auto

int WARMTH_POOR 		= 1
int WARMTH_FAIR 		= 2
int WARMTH_GOOD 		= 3
int WARMTH_EXCELLENT 	= 4
int WARMTH_MAX 			= 5

int COVERAGE_POOR 		= 1
int COVERAGE_FAIR 		= 2
int COVERAGE_GOOD 		= 3
int COVERAGE_EXCELLENT 	= 4
int COVERAGE_MAX 		= 5

int EXTRA_WARMACCESSORY 		= 1
int EXTRA_WEATHERPROOFACCESSORY = 2
int EXTRA_CLOAKCLOTH 			= 3
int EXTRA_CLOAKLEATHER 			= 4
int EXTRA_CLOAKFUR 				= 5

int GEARTYPE_BODY 		= 1
int GEARTYPE_HEAD 		= 2
int GEARTYPE_HANDS 		= 3
int GEARTYPE_FEET 		= 4
int GEARTYPE_CLOAK 		= 5
int GEARTYPE_MISC 		= 6
int GEARTYPE_IGNORE 	= 7

Armor[] ArmorBodyWarmthPoor1
Armor[] ArmorBodyWarmthPoor2
Armor[] ArmorBodyWarmthPoor3
Armor[] ArmorBodyWarmthPoor4
Armor[] ArmorBodyWarmthGood1
Armor[] ArmorBodyWarmthGood2
Armor[] ArmorBodyWarmthGood3
Armor[] ArmorBodyWarmthGood4
Armor[] ArmorBodyWarmthExcellent1
Armor[] ArmorBodyWarmthExcellent2
Armor[] ArmorBodyWarmthExcellent3
Armor[] ArmorBodyWarmthExcellent4
Armor[] ArmorBodyWarmthMax1
Armor[] ArmorBodyWarmthMax2
Armor[] ArmorBodyWarmthMax3
Armor[] ArmorBodyWarmthMax4

Armor[] ArmorHandsWarmthPoor1
Armor[] ArmorHandsWarmthPoor2
Armor[] ArmorHandsWarmthPoor3
Armor[] ArmorHandsWarmthPoor4
Armor[] ArmorHandsWarmthGood1
Armor[] ArmorHandsWarmthGood2
Armor[] ArmorHandsWarmthGood3
Armor[] ArmorHandsWarmthGood4
Armor[] ArmorHandsWarmthExcellent1
Armor[] ArmorHandsWarmthExcellent2
Armor[] ArmorHandsWarmthExcellent3
Armor[] ArmorHandsWarmthExcellent4
Armor[] ArmorHandsWarmthMax1
Armor[] ArmorHandsWarmthMax2
Armor[] ArmorHandsWarmthMax3
Armor[] ArmorHandsWarmthMax4

Armor[] ArmorHeadWarmthPoor1
Armor[] ArmorHeadWarmthPoor2
Armor[] ArmorHeadWarmthPoor3
Armor[] ArmorHeadWarmthPoor4
Armor[] ArmorHeadWarmthGood1
Armor[] ArmorHeadWarmthGood2
Armor[] ArmorHeadWarmthGood3
Armor[] ArmorHeadWarmthGood4
Armor[] ArmorHeadWarmthExcellent1
Armor[] ArmorHeadWarmthExcellent2
Armor[] ArmorHeadWarmthExcellent3
Armor[] ArmorHeadWarmthExcellent4
Armor[] ArmorHeadWarmthMax1
Armor[] ArmorHeadWarmthMax2
Armor[] ArmorHeadWarmthMax3
Armor[] ArmorHeadWarmthMax4

Armor[] ArmorFeetWarmthPoor1
Armor[] ArmorFeetWarmthPoor2
Armor[] ArmorFeetWarmthPoor3
Armor[] ArmorFeetWarmthPoor4
Armor[] ArmorFeetWarmthGood1
Armor[] ArmorFeetWarmthGood2
Armor[] ArmorFeetWarmthGood3
Armor[] ArmorFeetWarmthGood4
Armor[] ArmorFeetWarmthExcellent1
Armor[] ArmorFeetWarmthExcellent2
Armor[] ArmorFeetWarmthExcellent3
Armor[] ArmorFeetWarmthExcellent4
Armor[] ArmorFeetWarmthMax1
Armor[] ArmorFeetWarmthMax2
Armor[] ArmorFeetWarmthMax3
Armor[] ArmorFeetWarmthMax4

Armor[] ArmorBodyCoveragePoor1
Armor[] ArmorBodyCoveragePoor2
Armor[] ArmorBodyCoveragePoor3
Armor[] ArmorBodyCoveragePoor4
Armor[] ArmorBodyCoverageGood1
Armor[] ArmorBodyCoverageGood2
Armor[] ArmorBodyCoverageGood3
Armor[] ArmorBodyCoverageGood4
Armor[] ArmorBodyCoverageExcellent1
Armor[] ArmorBodyCoverageExcellent2
Armor[] ArmorBodyCoverageExcellent3
Armor[] ArmorBodyCoverageExcellent4
Armor[] ArmorBodyCoverageMax1
Armor[] ArmorBodyCoverageMax2
Armor[] ArmorBodyCoverageMax3
Armor[] ArmorBodyCoverageMax4

Armor[] ArmorHandsCoveragePoor1
Armor[] ArmorHandsCoveragePoor2
Armor[] ArmorHandsCoveragePoor3
Armor[] ArmorHandsCoveragePoor4
Armor[] ArmorHandsCoverageGood1
Armor[] ArmorHandsCoverageGood2
Armor[] ArmorHandsCoverageGood3
Armor[] ArmorHandsCoverageGood4
Armor[] ArmorHandsCoverageExcellent1
Armor[] ArmorHandsCoverageExcellent2
Armor[] ArmorHandsCoverageExcellent3
Armor[] ArmorHandsCoverageExcellent4
Armor[] ArmorHandsCoverageMax1
Armor[] ArmorHandsCoverageMax2
Armor[] ArmorHandsCoverageMax3
Armor[] ArmorHandsCoverageMax4

Armor[] ArmorHeadCoveragePoor1
Armor[] ArmorHeadCoveragePoor2
Armor[] ArmorHeadCoveragePoor3
Armor[] ArmorHeadCoveragePoor4
Armor[] ArmorHeadCoverageGood1
Armor[] ArmorHeadCoverageGood2
Armor[] ArmorHeadCoverageGood3
Armor[] ArmorHeadCoverageGood4
Armor[] ArmorHeadCoverageExcellent1
Armor[] ArmorHeadCoverageExcellent2
Armor[] ArmorHeadCoverageExcellent3
Armor[] ArmorHeadCoverageExcellent4
Armor[] ArmorHeadCoverageMax1
Armor[] ArmorHeadCoverageMax2
Armor[] ArmorHeadCoverageMax3
Armor[] ArmorHeadCoverageMax4

Armor[] ArmorFeetCoveragePoor1
Armor[] ArmorFeetCoveragePoor2
Armor[] ArmorFeetCoveragePoor3
Armor[] ArmorFeetCoveragePoor4
Armor[] ArmorFeetCoverageGood1
Armor[] ArmorFeetCoverageGood2
Armor[] ArmorFeetCoverageGood3
Armor[] ArmorFeetCoverageGood4
Armor[] ArmorFeetCoverageExcellent1
Armor[] ArmorFeetCoverageExcellent2
Armor[] ArmorFeetCoverageExcellent3
Armor[] ArmorFeetCoverageExcellent4
Armor[] ArmorFeetCoverageMax1
Armor[] ArmorFeetCoverageMax2
Armor[] ArmorFeetCoverageMax3
Armor[] ArmorFeetCoverageMax4

Armor[] ArmorAccessoryWarm1
Armor[] ArmorAccessoryWarm2
Armor[] ArmorAccessoryWarm3
Armor[] ArmorAccessoryWarm4

Armor[] ArmorAccessoryWeatherproof1
Armor[] ArmorAccessoryWeatherproof2
Armor[] ArmorAccessoryWeatherproof3
Armor[] ArmorAccessoryWeatherproof4

Armor[] ArmorCloakCloth1
Armor[] ArmorCloakCloth2
Armor[] ArmorCloakCloth3
Armor[] ArmorCloakCloth4

Armor[] ArmorCloakLeather1
Armor[] ArmorCloakLeather2
Armor[] ArmorCloakLeather3
Armor[] ArmorCloakLeather4

Armor[] ArmorCloakFur1
Armor[] ArmorCloakFur2
Armor[] ArmorCloakFur3
Armor[] ArmorCloakFur4

Armor[] ArmorIgnore1
Armor[] ArmorIgnore2
Armor[] ArmorIgnore3
Armor[] ArmorIgnore4

function InitializeDatastore()
	InitializeArrays()
	_Frost_DatastoreInitialized.SetValueInt(2)
endFunction

function PopulateDefaultArmorData()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	handler.CreateProtectionKeywordValueMaps()
	
	SetDefaults_Body()
	SetDefaults_Head()
	SetDefaults_Hands()
	SetDefaults_Feet()
	SetDefaults_Cloak()
	SetDefaults_Shield()
endFunction

function InitializeArrays()
	ArmorBodyWarmthPoor1 = new Armor[128]
	ArmorBodyWarmthPoor2 = new Armor[128]
	ArmorBodyWarmthPoor3 = new Armor[128]
	ArmorBodyWarmthPoor4 = new Armor[128]
	ArmorBodyWarmthGood1 = new Armor[128]
	ArmorBodyWarmthGood2 = new Armor[128]
	ArmorBodyWarmthGood3 = new Armor[128]
	ArmorBodyWarmthGood4 = new Armor[128]
	ArmorBodyWarmthExcellent1 = new Armor[128]
	ArmorBodyWarmthExcellent2 = new Armor[128]
	ArmorBodyWarmthExcellent3 = new Armor[128]
	ArmorBodyWarmthExcellent4 = new Armor[128]
	ArmorBodyWarmthMax1 = new Armor[128]
	ArmorBodyWarmthMax2 = new Armor[128]
	ArmorBodyWarmthMax3 = new Armor[128]
	ArmorBodyWarmthMax4 = new Armor[128]
	ArmorHandsWarmthPoor1 = new Armor[128]
	ArmorHandsWarmthPoor2 = new Armor[128]
	ArmorHandsWarmthPoor3 = new Armor[128]
	ArmorHandsWarmthPoor4 = new Armor[128]
	ArmorHandsWarmthGood1 = new Armor[128]
	ArmorHandsWarmthGood2 = new Armor[128]
	ArmorHandsWarmthGood3 = new Armor[128]
	ArmorHandsWarmthGood4 = new Armor[128]
	ArmorHandsWarmthExcellent1 = new Armor[128]
	ArmorHandsWarmthExcellent2 = new Armor[128]
	ArmorHandsWarmthExcellent3 = new Armor[128]
	ArmorHandsWarmthExcellent4 = new Armor[128]
	ArmorHandsWarmthMax1 = new Armor[128]
	ArmorHandsWarmthMax2 = new Armor[128]
	ArmorHandsWarmthMax3 = new Armor[128]
	ArmorHandsWarmthMax4 = new Armor[128]
	ArmorHeadWarmthPoor1 = new Armor[128]
	ArmorHeadWarmthPoor2 = new Armor[128]
	ArmorHeadWarmthPoor3 = new Armor[128]
	ArmorHeadWarmthPoor4 = new Armor[128]
	ArmorHeadWarmthGood1 = new Armor[128]
	ArmorHeadWarmthGood2 = new Armor[128]
	ArmorHeadWarmthGood3 = new Armor[128]
	ArmorHeadWarmthGood4 = new Armor[128]
	ArmorHeadWarmthExcellent1 = new Armor[128]
	ArmorHeadWarmthExcellent2 = new Armor[128]
	ArmorHeadWarmthExcellent3 = new Armor[128]
	ArmorHeadWarmthExcellent4 = new Armor[128]
	ArmorHeadWarmthMax1 = new Armor[128]
	ArmorHeadWarmthMax2 = new Armor[128]
	ArmorHeadWarmthMax3 = new Armor[128]
	ArmorHeadWarmthMax4 = new Armor[128]
	ArmorFeetWarmthPoor1 = new Armor[128]
	ArmorFeetWarmthPoor2 = new Armor[128]
	ArmorFeetWarmthPoor3 = new Armor[128]
	ArmorFeetWarmthPoor4 = new Armor[128]
	ArmorFeetWarmthGood1 = new Armor[128]
	ArmorFeetWarmthGood2 = new Armor[128]
	ArmorFeetWarmthGood3 = new Armor[128]
	ArmorFeetWarmthGood4 = new Armor[128]
	ArmorFeetWarmthExcellent1 = new Armor[128]
	ArmorFeetWarmthExcellent2 = new Armor[128]
	ArmorFeetWarmthExcellent3 = new Armor[128]
	ArmorFeetWarmthExcellent4 = new Armor[128]
	ArmorFeetWarmthMax1 = new Armor[128]
	ArmorFeetWarmthMax2 = new Armor[128]
	ArmorFeetWarmthMax3 = new Armor[128]
	ArmorFeetWarmthMax4 = new Armor[128]
	ArmorBodyCoveragePoor1 = new Armor[128]
	ArmorBodyCoveragePoor2 = new Armor[128]
	ArmorBodyCoveragePoor3 = new Armor[128]
	ArmorBodyCoveragePoor4 = new Armor[128]
	ArmorBodyCoverageGood1 = new Armor[128]
	ArmorBodyCoverageGood2 = new Armor[128]
	ArmorBodyCoverageGood3 = new Armor[128]
	ArmorBodyCoverageGood4 = new Armor[128]
	ArmorBodyCoverageExcellent1 = new Armor[128]
	ArmorBodyCoverageExcellent2 = new Armor[128]
	ArmorBodyCoverageExcellent3 = new Armor[128]
	ArmorBodyCoverageExcellent4 = new Armor[128]
	ArmorBodyCoverageMax1 = new Armor[128]
	ArmorBodyCoverageMax2 = new Armor[128]
	ArmorBodyCoverageMax3 = new Armor[128]
	ArmorBodyCoverageMax4 = new Armor[128]
	ArmorHandsCoveragePoor1 = new Armor[128]
	ArmorHandsCoveragePoor2 = new Armor[128]
	ArmorHandsCoveragePoor3 = new Armor[128]
	ArmorHandsCoveragePoor4 = new Armor[128]
	ArmorHandsCoverageGood1 = new Armor[128]
	ArmorHandsCoverageGood2 = new Armor[128]
	ArmorHandsCoverageGood3 = new Armor[128]
	ArmorHandsCoverageGood4 = new Armor[128]
	ArmorHandsCoverageExcellent1 = new Armor[128]
	ArmorHandsCoverageExcellent2 = new Armor[128]
	ArmorHandsCoverageExcellent3 = new Armor[128]
	ArmorHandsCoverageExcellent4 = new Armor[128]
	ArmorHandsCoverageMax1 = new Armor[128]
	ArmorHandsCoverageMax2 = new Armor[128]
	ArmorHandsCoverageMax3 = new Armor[128]
	ArmorHandsCoverageMax4 = new Armor[128]
	ArmorHeadCoveragePoor1 = new Armor[128]
	ArmorHeadCoveragePoor2 = new Armor[128]
	ArmorHeadCoveragePoor3 = new Armor[128]
	ArmorHeadCoveragePoor4 = new Armor[128]
	ArmorHeadCoverageGood1 = new Armor[128]
	ArmorHeadCoverageGood2 = new Armor[128]
	ArmorHeadCoverageGood3 = new Armor[128]
	ArmorHeadCoverageGood4 = new Armor[128]
	ArmorHeadCoverageExcellent1 = new Armor[128]
	ArmorHeadCoverageExcellent2 = new Armor[128]
	ArmorHeadCoverageExcellent3 = new Armor[128]
	ArmorHeadCoverageExcellent4 = new Armor[128]
	ArmorHeadCoverageMax1 = new Armor[128]
	ArmorHeadCoverageMax2 = new Armor[128]
	ArmorHeadCoverageMax3 = new Armor[128]
	ArmorHeadCoverageMax4 = new Armor[128]
	ArmorFeetCoveragePoor1 = new Armor[128]
	ArmorFeetCoveragePoor2 = new Armor[128]
	ArmorFeetCoveragePoor3 = new Armor[128]
	ArmorFeetCoveragePoor4 = new Armor[128]
	ArmorFeetCoverageGood1 = new Armor[128]
	ArmorFeetCoverageGood2 = new Armor[128]
	ArmorFeetCoverageGood3 = new Armor[128]
	ArmorFeetCoverageGood4 = new Armor[128]
	ArmorFeetCoverageExcellent1 = new Armor[128]
	ArmorFeetCoverageExcellent2 = new Armor[128]
	ArmorFeetCoverageExcellent3 = new Armor[128]
	ArmorFeetCoverageExcellent4 = new Armor[128]
	ArmorFeetCoverageMax1 = new Armor[128]
	ArmorFeetCoverageMax2 = new Armor[128]
	ArmorFeetCoverageMax3 = new Armor[128]
	ArmorFeetCoverageMax4 = new Armor[128]
	ArmorAccessoryWarm1 = new Armor[128]
	ArmorAccessoryWarm2 = new Armor[128]
	ArmorAccessoryWarm3 = new Armor[128]
	ArmorAccessoryWarm4 = new Armor[128]
	ArmorAccessoryWeatherproof1 = new Armor[128]
	ArmorAccessoryWeatherproof2 = new Armor[128]
	ArmorAccessoryWeatherproof3 = new Armor[128]
	ArmorAccessoryWeatherproof4 = new Armor[128]
	ArmorCloakCloth1 = new Armor[128]
	ArmorCloakCloth2 = new Armor[128]
	ArmorCloakCloth3 = new Armor[128]
	ArmorCloakCloth4 = new Armor[128]
	ArmorCloakLeather1 = new Armor[128]
	ArmorCloakLeather2 = new Armor[128]
	ArmorCloakLeather3 = new Armor[128]
	ArmorCloakLeather4 = new Armor[128]
	ArmorCloakFur1 = new Armor[128]
	ArmorCloakFur2 = new Armor[128]
	ArmorCloakFur3 = new Armor[128]
	ArmorCloakFur4 = new Armor[128]
	ArmorIgnore1 = new Armor[128]
	ArmorIgnore2 = new Armor[128]
	ArmorIgnore3 = new Armor[128]
	ArmorIgnore4 = new Armor[128]
endFunction

function SetDefaults_Body()
	SetArmorData(80145, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorHideCuirass
	SetArmorData(1101736, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassAlteration01
	SetArmorData(1101737, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassAlteration02
	SetArmorData(1101738, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassAlteration03
	SetArmorData(1101739, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassConjuration01
	SetArmorData(1101740, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassConjuration02
	SetArmorData(1101741, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassConjuration03
	SetArmorData(1101742, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassDestruction01
	SetArmorData(1101743, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassDestruction02
	SetArmorData(1101744, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassDestruction03
	SetArmorData(500027, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassHealth01
	SetArmorData(709777, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassHealth02
	SetArmorData(709778, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassHealth03
	SetArmorData(1101745, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassIllusion01
	SetArmorData(1101746, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassIllusion02
	SetArmorData(1101747, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassIllusion03
	SetArmorData(500028, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassLightArmor01
	SetArmorData(709780, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassLightArmor02
	SetArmorData(709781, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassLightArmor03
	SetArmorData(1101748, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassRestoration01
	SetArmorData(1101749, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassRestoration02
	SetArmorData(1101750, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassRestoration03
	SetArmorData(1071435, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorBanditCuirass1 		;Shirtless
	SetArmorData(1071437, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorBanditCuirass2 		;Shirtless / shawl
	SetArmorData(111522, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorStuddedCuirass
	SetArmorData(707731, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassHealth01
	SetArmorData(709843, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassHealth02
	SetArmorData(709844, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassHealth03
	SetArmorData(707732, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassLightArmor01
	SetArmorData(709845, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassLightArmor02
	SetArmorData(709846, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassLightArmor03
	SetArmorData(77385, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorIronCuirass
	SetArmorData(1101752, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassAlteration01
	SetArmorData(1101753, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassAlteration02
	SetArmorData(1101755, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassAlteration03
	SetArmorData(1101754, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronArmorAlteration03
	SetArmorData(1101756, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassConjuration01
	SetArmorData(1101757, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassConjuration02
	SetArmorData(1101758, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassConjuration03
	SetArmorData(1101759, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassDestruction01
	SetArmorData(1101760, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassDestruction02
	SetArmorData(1101761, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassDestruction03
	SetArmorData(300302, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHealth01
	SetArmorData(709987, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHealth02
	SetArmorData(709988, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHealth03
	SetArmorData(500008, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHeavyArmor01
	SetArmorData(709989, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHeavyArmor02
	SetArmorData(709990, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHeavyArmor03
	SetArmorData(1101762, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassIllusion01
	SetArmorData(1101763, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassIllusion02
	SetArmorData(1101764, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassIllusion03
	SetArmorData(1101765, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassRestoration01
	SetArmorData(1101766, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassRestoration02
	SetArmorData(1101767, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassRestoration03
	SetArmorData(586138, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerRags
	SetArmorData(248318, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerTunic
	SetArmorData(962512, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; MS02ForswornArmor
	SetArmorData(888144, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ForswornCuirass
	SetArmorData(754635, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorFalmerCuirass
	SetArmorData(59883, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerRagsBloody

	SetArmorData(1071439, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; ArmorBanditCuirass3 	;Sleeveless
	SetArmorData(221598, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorLeatherCuirass
	SetArmorData(1105605, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassAlteration01
	SetArmorData(1105606, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassAlteration02
	SetArmorData(1105607, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassAlteration03
	SetArmorData(1105608, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassConjuration01
	SetArmorData(1105609, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassConjuration02
	SetArmorData(1105610, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassConjuration03
	SetArmorData(1105611, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassDestruction01
	SetArmorData(1105612, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassDestruction02
	SetArmorData(1105613, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassDestruction03
	SetArmorData(737844, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassHealth01
	SetArmorData(737845, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassHealth02
	SetArmorData(737846, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassHealth03
	SetArmorData(1105614, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassIllusion01
	SetArmorData(1105615, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassIllusion02
	SetArmorData(1105616, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassIllusion03
	SetArmorData(737847, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassLightArmor01
	SetArmorData(737848, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassLightArmor02
	SetArmorData(737849, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassLightArmor03
	SetArmorData(1105617, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassRestoration01
	SetArmorData(1105618, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassRestoration02
	SetArmorData(1105619, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassRestoration03
	SetArmorData(562851, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorElvenCuirass
	SetArmorData(1072914, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorElvenLightCuirass
	SetArmorData(80170, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorElvenGildedCuirass
	SetArmorData(1101690, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassAlteration02
	SetArmorData(1101691, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassAlteration03
	SetArmorData(1101692, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassAlteration04
	SetArmorData(1101693, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassConjuration02
	SetArmorData(1101694, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassConjuration03
	SetArmorData(1101695, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassConjuration04
	SetArmorData(1101696, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassDestruction02
	SetArmorData(1101697, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassDestruction03
	SetArmorData(1101698, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassDestruction04
	SetArmorData(778180, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassHealth02
	SetArmorData(778181, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassHealth03
	SetArmorData(778301, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassHealth04
	SetArmorData(1101699, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassIllusion02
	SetArmorData(1101700, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassIllusion03
	SetArmorData(1101701, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassIllusion04
	SetArmorData(778182, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassLightArmor02
	SetArmorData(778183, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassLightArmor03
	SetArmorData(778302, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassLightArmor04
	SetArmorData(1101702, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassRestoration02
	SetArmorData(1101703, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassRestoration03
	SetArmorData(1101704, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassRestoration04
	SetArmorData(1101705, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassAlteration03
	SetArmorData(1101706, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassAlteration04
	SetArmorData(1101715, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassAlteration05
	SetArmorData(1101707, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassConjuration03
	SetArmorData(1101708, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassConjuration04
	SetArmorData(1101716, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassConjuration05
	SetArmorData(1101709, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassDestruction03
	SetArmorData(1101710, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassDestruction04
	SetArmorData(1101717, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassDestruction05
	SetArmorData(1038874, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealRate03
	SetArmorData(1038875, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealRate04
	SetArmorData(1038876, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealRate05
	SetArmorData(844205, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealth03
	SetArmorData(844206, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealth04
	SetArmorData(844207, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealth05
	SetArmorData(1101711, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassIllusion03
	SetArmorData(1101712, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassIllusion04
	SetArmorData(1101718, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassIllusion05
	SetArmorData(844208, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassLightArmor03
	SetArmorData(844209, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassLightArmor04
	SetArmorData(844210, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassLightArmor05
	SetArmorData(1101713, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassRestoration03
	SetArmorData(1101714, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassRestoration04
	SetArmorData(1101719, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassRestoration05
	SetArmorData(1038877, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassStaminaRate03
	SetArmorData(1038878, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassStaminaRate04
	SetArmorData(1038879, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassStaminaRate05
	SetArmorData(111523, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; ArmorScaledCuirass
	SetArmorData(111524, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorScaledCuirassB
	SetArmorData(1105635, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassAlteration02
	SetArmorData(1105636, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassAlteration03
	SetArmorData(1105637, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassAlteration04
	SetArmorData(1105638, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassConjuration02
	SetArmorData(1105639, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassConjuration03
	SetArmorData(1105640, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassConjuration04
	SetArmorData(1105641, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassDestruction02
	SetArmorData(1105642, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassDestruction03
	SetArmorData(1105643, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassDestruction04
	SetArmorData(873461, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassHealth02
	SetArmorData(873462, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassHealth03
	SetArmorData(873463, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassHealth04
	SetArmorData(1105644, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassIllusion02
	SetArmorData(1105645, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassIllusion03
	SetArmorData(1105646, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassIllusion04
	SetArmorData(873464, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassLightArmor02
	SetArmorData(873465, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassLightArmor03
	SetArmorData(873466, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassLightArmor04
	SetArmorData(1105647, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassRestoration02
	SetArmorData(1105648, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassRestoration03
	SetArmorData(1105649, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassRestoration04
	SetArmorData(80185, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorGlassCuirass
	SetArmorData(1101720, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassAlteration03
	SetArmorData(1101721, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassAlteration04
	SetArmorData(1101722, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassAlteration05
	SetArmorData(1101723, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassConjuration03
	SetArmorData(1101724, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassConjuration04
	SetArmorData(1101725, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassConjuration05
	SetArmorData(1101726, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassDestruction03
	SetArmorData(1101728, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassDestruction04
	SetArmorData(1101729, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassDestruction05
	SetArmorData(1041111, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealRate03
	SetArmorData(1041112, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealRate04
	SetArmorData(1041113, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealRate05
	SetArmorData(873345, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealth03
	SetArmorData(873346, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealth04
	SetArmorData(873347, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealth05
	SetArmorData(1101730, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassIllusion03
	SetArmorData(1101731, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassIllusion04
	SetArmorData(1101732, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassIllusion05
	SetArmorData(873348, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassLightArmor03
	SetArmorData(873349, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassLightArmor04
	SetArmorData(873350, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassLightArmor05
	SetArmorData(1101733, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassRestoration03
	SetArmorData(1101734, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassRestoration04
	SetArmorData(1101735, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassRestoration05
	SetArmorData(1041116, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassStaminaRate03
	SetArmorData(1041117, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassStaminaRate04
	SetArmorData(1041118, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassStaminaRate05
	SetArmorData(1101727, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassVsDestruction04
	SetArmorData(80200, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; ArmorIronBandedCuirass
	SetArmorData(1101768, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassAlteration01
	SetArmorData(1101769, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassAlteration02
	SetArmorData(1101770, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassAlteration03
	SetArmorData(1101771, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassConjuration01
	SetArmorData(1101772, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassConjuration02
	SetArmorData(1101773, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassConjuration03
	SetArmorData(1101774, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassDestruction01
	SetArmorData(1101775, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassDestruction02
	SetArmorData(1101776, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassDestruction03
	SetArmorData(707741, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHealth01
	SetArmorData(709919, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHealth02
	SetArmorData(709920, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHealth03
	SetArmorData(707742, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHeavyArmor01
	SetArmorData(709921, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHeavyArmor02
	SetArmorData(709922, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHeavyArmor03
	SetArmorData(1101777, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassIllusion01
	SetArmorData(1101778, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassIllusion02
	SetArmorData(1101779, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassIllusion03
	SetArmorData(1101780, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassRestoration01
	SetArmorData(1101781, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassRestoration02
	SetArmorData(1101782, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassRestoration03
	SetArmorData(80210, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorSteelCuirassA
	SetArmorData(1011490, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorSteelCuirassB
	SetArmorData(1105650, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassAlteration01
	SetArmorData(1105651, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassAlteration02
	SetArmorData(1105652, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassAlteration03
	SetArmorData(1105653, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassConjuration01
	SetArmorData(1105654, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassConjuration02
	SetArmorData(1105655, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassConjuration03
	SetArmorData(1105656, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassDestruction01
	SetArmorData(1105657, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassDestruction02
	SetArmorData(1105658, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassDestruction03
	SetArmorData(741541, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHealth01
	SetArmorData(741542, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHealth02
	SetArmorData(741543, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHealth03
	SetArmorData(741544, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHeavyArmor01
	SetArmorData(741545, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHeavyArmor02
	SetArmorData(741546, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHeavyArmor03
	SetArmorData(1105659, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassIllusion01
	SetArmorData(1105660, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassIllusion02
	SetArmorData(1105661, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassIllusion03
	SetArmorData(1105662, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassRestoration01
	SetArmorData(1105663, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassRestoration02
	SetArmorData(1105664, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassRestoration03
	SetArmorData(80220, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorSteelPlateCuirass
	SetArmorData(1105665, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassAlteration02
	SetArmorData(1105666, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassAlteration03
	SetArmorData(1105667, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassAlteration04
	SetArmorData(1105668, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassConjuration02
	SetArmorData(1105669, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassConjuration03
	SetArmorData(1105670, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassConjuration04
	SetArmorData(1105671, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassDestruction02
	SetArmorData(1105672, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassDestruction03
	SetArmorData(1105673, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassDestruction04
	SetArmorData(111628, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHealth02
	SetArmorData(111629, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHealth03
	SetArmorData(111630, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHealth04
	SetArmorData(111686, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHeavyArmor02
	SetArmorData(111950, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHeavyArmor03
	SetArmorData(111957, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHeavyArmor04
	SetArmorData(1105674, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassIllusion02
	SetArmorData(1105675, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassIllusion03
	SetArmorData(1105676, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassIllusion04
	SetArmorData(1105677, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassRestoration02
	SetArmorData(1105678, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassRestoration03
	SetArmorData(1105679, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassRestoration04
	SetArmorData(307851, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorBladesCuirass
	SetArmorData(1108827, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; DBArmorWornPlayable
	SetArmorData(99208, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; ArmorDraugrCuirass
	SetArmorData(136478, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassFalkreath
	SetArmorData(136480, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassHjaalmarch
	SetArmorData(136456, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassMarkarth
	SetArmorData(136455, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassRiften
	SetArmorData(819035, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassSolitude
	SetArmorData(136485, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassThePale
	SetArmorData(136461, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassWhiterun
	SetArmorData(136482, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassWinterhold
	SetArmorData(683387, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorStormcloakCuirass
	SetArmorData(710048, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorStormcloakCuirassSleeves
	SetArmorData(79573, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorImperialCuirass
	SetArmorData(81625, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorImperialLightCuirass
	SetArmorData(81624, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorImperialStuddedCuirass
	SetArmorData(707776, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHealth01
	SetArmorData(709865, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHealth02
	SetArmorData(709866, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHealth03
	SetArmorData(707777, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHeavyArmor01
	SetArmorData(709867, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHeavyArmor02
	SetArmorData(709868, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHeavyArmor03
	SetArmorData(709872, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassResistFrost03
	SetArmorData(759580, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassHealth01
	SetArmorData(759581, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassHealth02
	SetArmorData(759582, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassHealth03
	SetArmorData(759583, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassLightArmor01
	SetArmorData(759584, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassLightArmor02
	SetArmorData(759585, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassLightArmor03
	SetArmorData(289716, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassHealth01
	SetArmorData(289717, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassHealth02
	SetArmorData(289718, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassHealth03
	SetArmorData(289719, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassLightArmor01
	SetArmorData(289720, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassLightArmor02
	SetArmorData(289721, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassLightArmor03
	SetArmorData(867011, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; ArmorThievesGuildCuirassPlayer
	SetArmorData(1082692, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; ArmorLinweCuirass
	SetArmorData(867020, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; ArmorThievesGuildCuirassPlayerImproved
	SetArmorData(931287, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; ArmorThievesGuildLeaderCuirass
	SetArmorData(862276, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; DBArmor
	SetArmorData(925461, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; DBArmorSP
	SetArmorData(62455, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassHeavy1
	SetArmorData(62458, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassHeavy2
	SetArmorData(62459, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassLight1
	SetArmorData(62466, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassLight2
	SetArmorData(62468, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassLight3
	SetArmorData(59614, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorFalmerHardenedCuirass
	SetArmorData(9193, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorFalmerHeavyCuirass
	SetArmorData(82631, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorVampireArmorGray
	SetArmorData(102898, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorVampireArmorGrayLight
	SetArmorData(102899, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorVampireArmorRed
	SetArmorData(84997, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC1LD_ArmorKatria
	SetArmorData(226660, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldCuirassGuard
	SetArmorData(226659, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldCuirassVariant01
	SetArmorData(118163, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldCuirassVariant02
	SetArmorData(240422, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2ArmorBonemoldImprovedCuirass
	SetArmorData(165077, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassHealth01
	SetArmorData(165078, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassHealth02
	SetArmorData(165079, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassHealth03
	SetArmorData(165080, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassLightArmor01
	SetArmorData(165081, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassLightArmor02
	SetArmorData(165082, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassLightArmor03
	SetArmorData(118154, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2ArmorChitinHeavyCuirass
	SetArmorData(168291, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassAlteration02
	SetArmorData(168292, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassAlteration03
	SetArmorData(168293, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassAlteration04
	SetArmorData(168294, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassConjuration02
	SetArmorData(168295, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassConjuration03
	SetArmorData(168296, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassConjuration04
	SetArmorData(168297, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassDestruction02
	SetArmorData(168298, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassDestruction03
	SetArmorData(168299, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassDestruction04
	SetArmorData(168300, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHealth02
	SetArmorData(168301, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHealth03
	SetArmorData(168302, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHealth04
	SetArmorData(168303, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor02
	SetArmorData(168304, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor03
	SetArmorData(168305, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor04
	SetArmorData(168306, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassIllusion02
	SetArmorData(168307, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassIllusion03
	SetArmorData(168308, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassIllusion04
	SetArmorData(168309, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassRestoration02
	SetArmorData(168310, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassRestoration03
	SetArmorData(168311, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassRestoration04
	SetArmorData(118151, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2ArmorChitinLightCuirass
	SetArmorData(167920, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassAlteration02
	SetArmorData(167921, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassAlteration03
	SetArmorData(167922, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassAlteration04
	SetArmorData(167923, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassConjuration02
	SetArmorData(167924, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassConjuration03
	SetArmorData(167925, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassConjuration04
	SetArmorData(167926, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassDestruction02
	SetArmorData(167927, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassDestruction03
	SetArmorData(167928, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassDestruction04
	SetArmorData(167929, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassHealth02
	SetArmorData(167934, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassHealth03
	SetArmorData(167930, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassHealth04
	SetArmorData(167931, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassLightArmor02
	SetArmorData(167932, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassLightArmor03
	SetArmorData(167935, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassLightArmor04
	SetArmorData(167936, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassRestoration02
	SetArmorData(167937, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassRestoration03
	SetArmorData(167938, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassRestoration04
	SetArmorData(168620, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2MoragTongCuirass
	SetArmorData(121751, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; DLC2dunKolbjornCuirass
	SetArmorData(175411, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; DLC2TGArmorVariantCuirass

	SetArmorData(80190, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; ArmorDragonscaleCuirass
	SetArmorData(1101646, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassAlteration04
	SetArmorData(1101647, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassAlteration05
	SetArmorData(1101648, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassAlteration06
	SetArmorData(1101649, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassConjuration04
	SetArmorData(1101650, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassConjuration05
	SetArmorData(1101651, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassConjuration06
	SetArmorData(1101652, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassDestruction04
	SetArmorData(1101653, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassDestruction05
	SetArmorData(1101654, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassDestruction06
	SetArmorData(1041120, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealRate04
	SetArmorData(1041121, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealRate05
	SetArmorData(1041122, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealRate06
	SetArmorData(883130, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealth04
	SetArmorData(883131, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealth05
	SetArmorData(883132, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealth06
	SetArmorData(1101655, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassIllusion04
	SetArmorData(1101656, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassIllusion05
	SetArmorData(1101657, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassIllusion06
	SetArmorData(883133, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassLightArmor04
	SetArmorData(883134, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassLightArmor05
	SetArmorData(883135, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassLightArmor06
	SetArmorData(1101658, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassRestoration04
	SetArmorData(1101660, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassRestoration05
	SetArmorData(1101659, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassRestoration06
	SetArmorData(1041123, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassStaminaRate04
	SetArmorData(1041124, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassStaminaRate05
	SetArmorData(1041125, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassStaminaRate06
	SetArmorData(80205, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDwarvenCuirass
	SetArmorData(1101661, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassAlteration02
	SetArmorData(571002, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassAlteration03
	SetArmorData(1101662, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassAlteration04
	SetArmorData(1101663, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassConjuration02
	SetArmorData(1101664, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassConjuration03
	SetArmorData(1101665, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassConjuration04
	SetArmorData(1101666, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassDestruction02
	SetArmorData(1101667, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassDestruction03
	SetArmorData(1101668, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassDestruction04
	SetArmorData(111576, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHealth02
	SetArmorData(111577, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHealth03
	SetArmorData(111578, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHealth04
	SetArmorData(111579, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHeavyArmor02
	SetArmorData(111631, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHeavyArmor03
	SetArmorData(111680, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHeavyArmor04
	SetArmorData(1101669, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassIllusion02
	SetArmorData(1101670, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassIllusion03
	SetArmorData(1101671, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassIllusion04
	SetArmorData(1101672, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassRestoration02
	SetArmorData(1101673, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassRestoration03
	SetArmorData(1101674, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassRestoration04
	SetArmorData(80225, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorEbonyCuirass
	SetArmorData(1101675, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassAlteration03
	SetArmorData(1101676, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassAlteration04
	SetArmorData(1101677, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassAlteration05
	SetArmorData(1101678, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassConjuration03
	SetArmorData(1101679, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassConjuration04
	SetArmorData(1101680, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassConjuration05
	SetArmorData(1101681, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassDestruction03
	SetArmorData(1101682, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassDestruction04
	SetArmorData(1101688, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassDestruction05
	SetArmorData(849975, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealth03
	SetArmorData(849976, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealth04
	SetArmorData(849977, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealth05
	SetArmorData(1041129, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealthRate03
	SetArmorData(1041130, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealthRate04
	SetArmorData(1041131, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealthRate05
	SetArmorData(849978, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHeavyArmor03
	SetArmorData(849979, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHeavyArmor04
	SetArmorData(849980, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHeavyArmor05
	SetArmorData(1101683, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassIllusion03
	SetArmorData(1101684, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassIllusion04
	SetArmorData(1101689, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassIllusion05
	SetArmorData(1101685, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassRestoration03
	SetArmorData(1101686, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassRestoration04
	SetArmorData(1101687, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassRestoration05
	SetArmorData(1041132, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassStaminaRate03
	SetArmorData(1041133, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassStaminaRate04
	SetArmorData(1041134, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassStaminaRate05
	SetArmorData(80230, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; ArmorDragonplateCuirass
	SetArmorData(1101631, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassAlteration04
	SetArmorData(1101644, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassAlteration05
	SetArmorData(1101632, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassAlteration06
	SetArmorData(1101633, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassConjuration04
	SetArmorData(1101634, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassConjuration05
	SetArmorData(1101635, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassConjuration06
	SetArmorData(1101636, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassDestruction04
	SetArmorData(1101645, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassDestruction05
	SetArmorData(1101637, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassDestruction06
	SetArmorData(883238, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealth04
	SetArmorData(883239, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealth05
	SetArmorData(883240, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealth06
	SetArmorData(1041141, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealthRate04
	SetArmorData(1041142, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealthRate05
	SetArmorData(1041143, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealthRate06
	SetArmorData(883241, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHeavyArmor04
	SetArmorData(883242, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHeavyArmor05
	SetArmorData(883243, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHeavyArmor06
	SetArmorData(1101638, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassIllusion04
	SetArmorData(1101639, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassIllusion05
	SetArmorData(1101640, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassIllusion06
	SetArmorData(1101641, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassRestoration04
	SetArmorData(1101642, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassRestoration05
	SetArmorData(1101643, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassRestoration06
	SetArmorData(1041144, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassStaminaRate04
	SetArmorData(1041145, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassStaminaRate05
	SetArmorData(1041146, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassStaminaRate06
	SetArmorData(80235, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDaedricCuirass
	SetArmorData(1101616, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassAlteration04
	SetArmorData(1101617, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassAlteration05
	SetArmorData(1101618, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassAlteration06
	SetArmorData(1101619, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassConjuration04
	SetArmorData(1101620, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassConjuration05
	SetArmorData(1101621, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassConjuration06
	SetArmorData(1101622, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassDestruction04
	SetArmorData(1101623, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassDestruction05
	SetArmorData(1101624, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassDestruction06
	SetArmorData(1041150, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealRate04
	SetArmorData(1041151, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealRate05
	SetArmorData(1041152, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealRate06
	SetArmorData(883352, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealth04
	SetArmorData(883353, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealth05
	SetArmorData(883354, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealth06
	SetArmorData(883355, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHeavyArmor04
	SetArmorData(883356, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHeavyArmor05
	SetArmorData(883357, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHeavyArmor06
	SetArmorData(1101625, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassIllusion04
	SetArmorData(1101626, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassIllusion05
	SetArmorData(1101627, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassIllusion06
	SetArmorData(1101628, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassRestoration04
	SetArmorData(1101629, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassRestoration05
	SetArmorData(1101630, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassRestoration06
	SetArmorData(1041147, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassStaminaRate04
	SetArmorData(1041148, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassStaminaRate05
	SetArmorData(1041149, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassStaminaRate06
	SetArmorData(379902, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; GeneralTulliusArmor
	SetArmorData(868000, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorPenitusCuirass
	SetArmorData(51222, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; DLC1IvoryCuirass
	SetArmorData(51923, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; DLC1IvoryCuirassAlternate
	
	SetArmorData(80215, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorOrcishCuirass
	SetArmorData(1105620, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassAlteration03
	SetArmorData(1105621, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassAlteration04
	SetArmorData(1105622, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassAlteration05
	SetArmorData(1105623, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassConjuration03
	SetArmorData(1105624, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassConjuration04
	SetArmorData(1105625, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassConjuration05
	SetArmorData(1105626, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassDestruction03
	SetArmorData(1105627, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassDestruction04
	SetArmorData(1105628, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassDestruction05
	SetArmorData(849858, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHealth03
	SetArmorData(849859, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHealth04
	SetArmorData(849860, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHealth05
	SetArmorData(849861, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHeavyArmor03
	SetArmorData(849862, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHeavyArmor04
	SetArmorData(849863, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHeavyArmor05
	SetArmorData(1105629, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassIllusion03
	SetArmorData(1105630, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassIllusion04
	SetArmorData(1105631, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassIllusion05
	SetArmorData(1105632, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassRestoration03
	SetArmorData(1105633, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassRestoration04
	SetArmorData(1105634, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassRestoration05
	SetArmorData(455571, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_POOR) ; ArmorBanditCuirass 		;Full
	SetArmorData(830997, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_GOOD) ; ArmorCompanionsCuirass

	SetArmorData(118175, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2ArmorStalhrimHeavyCuirass
	SetArmorData(168460, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration04
	SetArmorData(168461, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration05
	SetArmorData(168462, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration06
	SetArmorData(168463, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration04
	SetArmorData(168464, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration05
	SetArmorData(168465, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration06
	SetArmorData(168466, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction04
	SetArmorData(168467, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction05
	SetArmorData(168468, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction06
	SetArmorData(168469, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealth04
	SetArmorData(168470, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealth05
	SetArmorData(168472, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealth06
	SetArmorData(168473, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate04
	SetArmorData(168474, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate05
	SetArmorData(168471, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate06
	SetArmorData(168475, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor04
	SetArmorData(168476, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor05
	SetArmorData(168477, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor06
	SetArmorData(168478, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion04
	SetArmorData(168479, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion05
	SetArmorData(168480, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion06
	SetArmorData(168481, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration04
	SetArmorData(168482, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration05
	SetArmorData(168483, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration06
	SetArmorData(168484, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate04
	SetArmorData(168485, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate05
	SetArmorData(168486, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate06
	SetArmorData(118178, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2ArmorStalhrimLightCuirass
	SetArmorData(168101, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassAlteration03
	SetArmorData(168102, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassAlteration04
	SetArmorData(168103, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassAlteration05
	SetArmorData(168104, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassConjuration03
	SetArmorData(168105, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassConjuration04
	SetArmorData(168106, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassConjuration05
	SetArmorData(168107, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassDestruction03
	SetArmorData(168108, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassDestruction04
	SetArmorData(168109, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassDestruction05
	SetArmorData(168110, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealRate03
	SetArmorData(168111, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealRate04
	SetArmorData(168112, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealRate05
	SetArmorData(168113, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealth03
	SetArmorData(168114, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealth04
	SetArmorData(168115, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealth05
	SetArmorData(168116, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassIllusion03
	SetArmorData(168117, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassIllusion04
	SetArmorData(168118, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassIllusion05
	SetArmorData(168119, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassLightArmor03
	SetArmorData(168120, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassLightArmor04
	SetArmorData(168121, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassLightArmor05
	SetArmorData(168122, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassRestoration03
	SetArmorData(168123, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassRestoration04
	SetArmorData(168124, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassRestoration05
	SetArmorData(168125, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate03
	SetArmorData(168126, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate04
	SetArmorData(168127, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate05
	SetArmorData(118167, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2ArmorNordicHeavyCuirass
	SetArmorData(168368, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassAlteration03
	SetArmorData(168369, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassAlteration04
	SetArmorData(168370, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassAlteration05
	SetArmorData(168371, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassConjuration03
	SetArmorData(168372, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassConjuration04
	SetArmorData(168373, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassConjuration05
	SetArmorData(168374, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassDestruction03
	SetArmorData(168375, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassDestruction04
	SetArmorData(168376, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassDestruction05
	SetArmorData(168377, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHealth03
	SetArmorData(168378, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHealth04
	SetArmorData(168379, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHealth05
	SetArmorData(168380, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor03
	SetArmorData(168381, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor04
	SetArmorData(168382, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor05
	SetArmorData(168383, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassIllusion03
	SetArmorData(168384, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassIllusion04
	SetArmorData(168385, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassIllusion05
	SetArmorData(168386, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassRestoration03
	SetArmorData(168387, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassRestoration04
	SetArmorData(168388, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassRestoration05
	SetArmorData(233742, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ClothesSkaalCoat
	SetArmorData(118185, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_FAIR) ; DLC2SkaalVillagerOutfit
	SetArmorData(147483, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2dunHaknirArmorCuirass


	SetArmorData(551294, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_POOR, aiExtraType = EXTRA_CLOAKFUR) ; ArmorStormcloakBearCuirass 		@MULTI
	SetArmorData(383878, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer01  @MULTI
	SetArmorData(1035278, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer02 @MULTI
	SetArmorData(1035279, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer03 @MULTI
	SetArmorData(46555, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiExtraType = EXTRA_CLOAKLEATHER) ; DLC1ArmorVampireArmorRoyalRed 	@MULTI
	SetArmorData(103621, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiExtraType = EXTRA_CLOAKLEATHER) ; DLC1ArmorVampireArmorValerica	@MULTI
	SetArmorData(118186, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfit 		@MULTI
	SetArmorData(225381, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfitBlue	@MULTI
	SetArmorData(225382, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfitRed	@MULTI

	; Robes
	SetArmorData(0x10F570, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMGRobesArchmage1Hooded
	SetArmorData(0x10CFE4, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesColorBrownHooded
	SetArmorData(0x10CFEC, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesColorGreenHooded
	SetArmorData(0x10CFEA, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesColorGreyHooded
	SetArmorData(0x10CFEB, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesColorRedHooded
	SetArmorData(0x107106, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesHooded
	SetArmorData(0x10710D, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesNecromancerRobesHooded
	SetArmorData(0x107108, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesRobesBlackHooded
	SetArmorData(0x10710A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesRobesBlueHooded
	SetArmorData(0x10C698, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesThalmorRobesHooded
	SetArmorData(0x10710C, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesWarlockRobesHooded
	SetArmorData(0x109008, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration01
	SetArmorData(0x109009, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration02
	SetArmorData(0x10900A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration03
	SetArmorData(0x10900B, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration04
	SetArmorData(0x10900C, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration05
	SetArmorData(0x10900D, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration06
	SetArmorData(0x10900E, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration01
	SetArmorData(0x10900F, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration02
	SetArmorData(0x109010, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration03
	SetArmorData(0x109011, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration04
	SetArmorData(0x109012, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration05
	SetArmorData(0x109013, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration06
	SetArmorData(0x109014, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction01
	SetArmorData(0x109015, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction02
	SetArmorData(0x109016, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction03
	SetArmorData(0x109017, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction04
	SetArmorData(0x109018, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction05
	SetArmorData(0x109019, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction06
	SetArmorData(0x109020, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion01
	SetArmorData(0x109021, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion02
	SetArmorData(0x109022, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion03
	SetArmorData(0x109023, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion04
	SetArmorData(0x109024, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion05
	SetArmorData(0x109025, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion06
	SetArmorData(0x109048, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedMagickaRate02
	SetArmorData(0x109047, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedMagickaRate03
	SetArmorData(0x109046, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedMagickaRate04
	SetArmorData(0x109045, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedMagickaRate05
	SetArmorData(0x10902B, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration01
	SetArmorData(0x10902A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration02
	SetArmorData(0x109029, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration03
	SetArmorData(0x109028, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration04
	SetArmorData(0x109027, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration05
	SetArmorData(0x109026, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration06
	SetArmorData(0x109049, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration01
	SetArmorData(0x10904A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration02
	SetArmorData(0x10904B, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration03
	SetArmorData(0x10904C, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration04
	SetArmorData(0x10904D, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration05
	SetArmorData(0x10904E, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration06
	SetArmorData(0x10904F, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration01
	SetArmorData(0x109050, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration02
	SetArmorData(0x109051, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration03
	SetArmorData(0x109052, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration04
	SetArmorData(0x109053, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration05
	SetArmorData(0x109054, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration06
	SetArmorData(0x109055, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction01
	SetArmorData(0x109056, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction02
	SetArmorData(0x109057, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction03
	SetArmorData(0x109058, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction04
	SetArmorData(0x109059, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction05
	SetArmorData(0x10905A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction06
	SetArmorData(0x109089, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion01
	SetArmorData(0x109088, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion02
	SetArmorData(0x109087, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion03
	SetArmorData(0x109086, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion04
	SetArmorData(0x109085, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion05
	SetArmorData(0x109084, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion06
	SetArmorData(0x109083, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedMagickaRate02
	SetArmorData(0x109082, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedMagickaRate03
	SetArmorData(0x109081, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedMagickaRate04
	SetArmorData(0x109080, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedMagickaRate05
	SetArmorData(0x109066, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration01
	SetArmorData(0x109065, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration02
	SetArmorData(0x109064, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration03
	SetArmorData(0x109063, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration04
	SetArmorData(0x109062, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration05
	SetArmorData(0x109061, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration06


endFunction

function SetDefaults_Head()
	; Poor (0 - 20)
	SetArmorData(80147, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorHideHelmet
	SetArmorData(570983, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlchemy01
	SetArmorData(570984, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlchemy02
	SetArmorData(570985, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlchemy03
	SetArmorData(500048, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlteration01
	SetArmorData(709819, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlteration02
	SetArmorData(709820, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlteration03
	SetArmorData(500049, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetConjuration01
	SetArmorData(709821, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetConjuration02
	SetArmorData(709822, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetConjuration03
	SetArmorData(500050, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetDestruction01
	SetArmorData(709823, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetDestruction02
	SetArmorData(709824, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetDestruction03
	SetArmorData(500052, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetIllusion01
	SetArmorData(709827, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetIllusion02
	SetArmorData(709828, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetIllusion03
	SetArmorData(500053, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMagicka01
	SetArmorData(709829, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMagicka02
	SetArmorData(709830, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMagicka03
	SetArmorData(500055, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMarksman01
	SetArmorData(709831, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMarksman02
	SetArmorData(709832, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMarksman03
	SetArmorData(500056, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetRestoration01
	SetArmorData(709833, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetRestoration02
	SetArmorData(709834, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetRestoration03
	SetArmorData(77389, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorIronHelmet
	SetArmorData(570986, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlchemy01
	SetArmorData(570987, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlchemy02
	SetArmorData(570988, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlchemy03
	SetArmorData(499996, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlteration01
	SetArmorData(710023, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlteration02
	SetArmorData(710024, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlteration03
	SetArmorData(500003, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetConjuration01
	SetArmorData(710025, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetConjuration02
	SetArmorData(710026, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetConjuration03
	SetArmorData(500005, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetDestruction01
	SetArmorData(710027, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetDestruction02
	SetArmorData(710028, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetDestruction03
	SetArmorData(500009, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetIllusion01
	SetArmorData(710031, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetIllusion02
	SetArmorData(710032, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetIllusion03
	SetArmorData(303537, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMagicka01
	SetArmorData(710033, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMagicka02
	SetArmorData(710034, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMagicka03
	SetArmorData(500013, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMarksman01
	SetArmorData(710035, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMarksman02
	SetArmorData(710036, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMarksman03
	SetArmorData(500017, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetRestoration01
	SetArmorData(710037, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetRestoration02
	SetArmorData(710039, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetRestoration03
	SetArmorData(400569, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskBronzeHelmet
	SetArmorData(400555, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskCorondrumHelmet
	SetArmorData(400549, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskEbonyHelmet
	SetArmorData(400577, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskIronHelmet
	SetArmorData(400578, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskMarbleHelmet
	SetArmorData(400523, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskMoonstoneHelmet
	SetArmorData(400576, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskOrichalumHelmet
	SetArmorData(400585, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskSteelHelmet
	SetArmorData(400598, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskUltraHelmet
	SetArmorData(400586, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskWoodHelmet
	SetArmorData(147710, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2ArmorAcolyteMaskFire
	SetArmorData(147711, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2ArmorAcolyteMaskFrost
	SetArmorData(147511, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2ArmorAcolyteMaskShock
	SetArmorData(170594, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MiraakMaskNew
	SetArmorData(237473, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask1H
	SetArmorData(236843, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask1L
	SetArmorData(237474, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask2H
	SetArmorData(236846, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask2L
	SetArmorData(237475, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask3H
	SetArmorData(236847, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask3L
	
	;Fair (21 - 32)
	SetArmorData(80157, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorElvenHelmet
	SetArmorData(1072916, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorElvenLightHelmet
	SetArmorData(570980, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlchemy02
	SetArmorData(570981, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlchemy03
	SetArmorData(570982, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlchemy04
	SetArmorData(778216, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlteration02
	SetArmorData(778217, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlteration03
	SetArmorData(778319, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlteration04
	SetArmorData(778218, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetConjuration02
	SetArmorData(778219, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetConjuration03
	SetArmorData(778320, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetConjuration04
	SetArmorData(778220, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetDestruction02
	SetArmorData(778221, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetDestruction03
	SetArmorData(778321, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetDestruction04
	SetArmorData(778224, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetIllusion02
	SetArmorData(778225, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetIllusion03
	SetArmorData(778323, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetIllusion04
	SetArmorData(778226, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMagicka02
	SetArmorData(778227, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMagicka03
	SetArmorData(778324, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMagicka04
	SetArmorData(778228, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMarksman02
	SetArmorData(778229, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMarksman03
	SetArmorData(778325, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMarksman04
	SetArmorData(778230, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetRestoration02
	SetArmorData(778231, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetRestoration03
	SetArmorData(778326, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetRestoration04
	SetArmorData(111521, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorScaledHelmet
	SetArmorData(290039, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlchemy02
	SetArmorData(290038, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlchemy03
	SetArmorData(290040, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlchemy04
	SetArmorData(290074, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlteration02
	SetArmorData(290079, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlteration03
	SetArmorData(290080, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlteration04
	SetArmorData(290081, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetConjuration02
	SetArmorData(290225, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetConjuration03
	SetArmorData(290226, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetConjuration04
	SetArmorData(290227, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetDestruction02
	SetArmorData(290228, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetDestruction03
	SetArmorData(290229, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetDestruction04
	SetArmorData(290242, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetIllusion02
	SetArmorData(290243, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetIllusion03
	SetArmorData(290244, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetIllusion04
	SetArmorData(290247, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMagicka02
	SetArmorData(290250, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMagicka03
	SetArmorData(290251, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMagicka04
	SetArmorData(290259, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMarksman02
	SetArmorData(290265, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMarksman03
	SetArmorData(290274, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMarksman04
	SetArmorData(290285, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetRestoration02
	SetArmorData(290286, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetRestoration03
	SetArmorData(290287, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetRestoration04
	SetArmorData(290288, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetWaterbreathing
	SetArmorData(80187, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGlassHelmet
	SetArmorData(873406, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlchemy03
	SetArmorData(873407, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlchemy04
	SetArmorData(873408, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlchemy05
	SetArmorData(873409, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlteration03
	SetArmorData(873410, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlteration04
	SetArmorData(873411, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlteration05
	SetArmorData(873412, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetConjuration03
	SetArmorData(873413, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetConjuration04
	SetArmorData(873414, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetConjuration05
	SetArmorData(873415, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetDestruction03
	SetArmorData(873416, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetDestruction04
	SetArmorData(873417, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetDestruction05
	SetArmorData(873421, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetIllusion03
	SetArmorData(873422, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetIllusion04
	SetArmorData(873423, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetIllusion05
	SetArmorData(873424, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagicka03
	SetArmorData(873425, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagicka04
	SetArmorData(873426, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagicka05
	SetArmorData(1041114, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagickaRate03
	SetArmorData(1041115, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagickaRate04
	SetArmorData(1041119, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagickaRate05
	SetArmorData(873427, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMarksman03
	SetArmorData(873428, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMarksman04
	SetArmorData(873429, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMarksman05
	SetArmorData(873430, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetRestoration03
	SetArmorData(873431, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetRestoration04
	SetArmorData(873432, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetRestoration05
	SetArmorData(873433, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetWaterbreathing
	SetArmorData(354974, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorDraugrHelmet
	SetArmorData(1001806, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorDraugrHelmetResistFire03
	SetArmorData(1070493, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorEastmarchHelmetFull
	SetArmorData(136729, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullFalkreath
	SetArmorData(819036, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullHaafingar
	SetArmorData(136731, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullHjaalmarch
	SetArmorData(136735, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullPale
	SetArmorData(136723, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullReach
	SetArmorData(136738, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullRift
	SetArmorData(136725, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullWhiterun
	SetArmorData(136733, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullWinterhold
	SetArmorData(683385, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorStormcloakHelmetFull
	SetArmorData(105182, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC01ClothesVampireHood
	SetArmorData(168622, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2MoragTongHood
	SetArmorData(121752, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2dunKolbjornHelm
	SetArmorData(118156, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2ArmorChitinHeavyHelmet
	SetArmorData(168327, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlchemy02
	SetArmorData(168328, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlchemy03
	SetArmorData(168329, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlchemy04
	SetArmorData(168330, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlteration02
	SetArmorData(168331, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlteration03
	SetArmorData(168332, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlteration04
	SetArmorData(168333, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetConjuration02
	SetArmorData(168334, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetConjuration03
	SetArmorData(168335, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetConjuration04
	SetArmorData(168336, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetDestruction02
	SetArmorData(168337, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetDestruction03
	SetArmorData(168338, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetDestruction04
	SetArmorData(168339, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetIllusion02
	SetArmorData(168340, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetIllusion03
	SetArmorData(168341, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetIllusion04
	SetArmorData(168342, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMagicka02
	SetArmorData(168343, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMagicka03
	SetArmorData(168344, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMagicka04
	SetArmorData(168345, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMarksman02
	SetArmorData(168346, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMarksman03
	SetArmorData(168347, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMarksman04
	SetArmorData(168348, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetRestoration02
	SetArmorData(168349, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetRestoration03
	SetArmorData(168350, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetRestoration04
	SetArmorData(168351, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetWaterbreathing
	SetArmorData(118153, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2ArmorChitinLightHelmet
	SetArmorData(167960, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlchemy02
	SetArmorData(167961, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlchemy03
	SetArmorData(167962, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlchemy04
	SetArmorData(167963, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlteration02
	SetArmorData(167964, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlteration03
	SetArmorData(167965, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlteration04
	SetArmorData(167966, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetConjuration02
	SetArmorData(167967, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetConjuration03
	SetArmorData(167968, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetConjuration04
	SetArmorData(167969, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetDestruction02
	SetArmorData(167970, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetDestruction03
	SetArmorData(167972, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetDestruction04
	SetArmorData(167971, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetIllusion02
	SetArmorData(167973, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetIllusion03
	SetArmorData(167974, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetIllusion04
	SetArmorData(167975, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMagicka02
	SetArmorData(167976, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMagicka03
	SetArmorData(167977, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMagicka04
	SetArmorData(167978, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMarksman02
	SetArmorData(167979, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMarksman03
	SetArmorData(167980, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMarksman04
	SetArmorData(167981, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetRestoration02
	SetArmorData(167982, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetRestoration03
	SetArmorData(167983, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetRestoration04


	; Good (33 - 42)
	SetArmorData(80162, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorLeatherHelmet
	SetArmorData(570989, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlchemy01
	SetArmorData(570990, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlchemy02
	SetArmorData(570991, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlchemy03
	SetArmorData(741474, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlteration01
	SetArmorData(741475, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlteration02
	SetArmorData(741476, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlteration03
	SetArmorData(741477, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetConjuration01
	SetArmorData(741478, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetConjuration02
	SetArmorData(741479, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetConjuration03
	SetArmorData(741480, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetDestruction01
	SetArmorData(741481, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetDestruction02
	SetArmorData(741482, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetDestruction03
	SetArmorData(741495, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetIllusion01
	SetArmorData(741496, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetIllusion02
	SetArmorData(741497, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetIllusion03
	SetArmorData(741498, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMagicka01
	SetArmorData(741499, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMagicka02
	SetArmorData(741500, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMagicka03
	SetArmorData(741501, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMarksman01
	SetArmorData(741502, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMarksman02
	SetArmorData(741503, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMarksman03
	SetArmorData(741483, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetRestoration01
	SetArmorData(741484, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetRestoration02
	SetArmorData(741485, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetRestoration03
	SetArmorData(80192, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonscaleHelmet
	SetArmorData(883188, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlchemy04
	SetArmorData(883189, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlchemy05
	SetArmorData(883190, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlchemy06
	SetArmorData(883191, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlteration04
	SetArmorData(883192, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlteration05
	SetArmorData(883193, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlteration06
	SetArmorData(883194, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetConjuration04
	SetArmorData(883195, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetConjuration05
	SetArmorData(883196, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetConjuration06
	SetArmorData(883197, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetDestruction04
	SetArmorData(883198, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetDestruction05
	SetArmorData(883199, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetDestruction06
	SetArmorData(883203, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetIllusion04
	SetArmorData(883204, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetIllusion05
	SetArmorData(883205, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetIllusion06
	SetArmorData(883206, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagicka04
	SetArmorData(883207, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagicka05
	SetArmorData(883208, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagicka06
	SetArmorData(1041126, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagickaRate04
	SetArmorData(1041127, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagickaRate05
	SetArmorData(1041128, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagickaRate06
	SetArmorData(883209, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMarksman04
	SetArmorData(883210, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMarksman05
	SetArmorData(883211, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMarksman06
	SetArmorData(883212, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetRestoration04
	SetArmorData(883213, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetRestoration05
	SetArmorData(883214, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetRestoration06
	SetArmorData(883215, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetWaterbreathing
	SetArmorData(80212, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorSteelHelmetA
	SetArmorData(1011492, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorSteelHelmetB
	SetArmorData(571039, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlchemy01
	SetArmorData(571040, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlchemy02
	SetArmorData(571041, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlchemy03
	SetArmorData(741587, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlteration01
	SetArmorData(741595, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlteration02
	SetArmorData(741596, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlteration03
	SetArmorData(741588, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetConjuration01
	SetArmorData(741597, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetConjuration02
	SetArmorData(741598, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetConjuration03
	SetArmorData(741589, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetDestruction01
	SetArmorData(741599, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetDestruction02
	SetArmorData(741600, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetDestruction03
	SetArmorData(741591, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetIllusion01
	SetArmorData(741603, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetIllusion02
	SetArmorData(741604, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetIllusion03
	SetArmorData(741592, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMagicka01
	SetArmorData(741605, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMagicka02
	SetArmorData(741606, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMagicka03
	SetArmorData(741593, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMarksman01
	SetArmorData(741609, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMarksman02
	SetArmorData(741610, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMarksman03
	SetArmorData(741594, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetRestoration01
	SetArmorData(741607, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetRestoration02
	SetArmorData(741608, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetRestoration03
	SetArmorData(600710, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetWaterbreathing
	SetArmorData(80207, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorDwarvenHelmet
	SetArmorData(570970, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlchemy02
	SetArmorData(570978, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlchemy03
	SetArmorData(570979, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlchemy04
	SetArmorData(112491, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlteration02
	SetArmorData(112492, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlteration03
	SetArmorData(112493, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlteration04
	SetArmorData(112494, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetConjuration02
	SetArmorData(112495, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetConjuration03
	SetArmorData(112496, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetConjuration04
	SetArmorData(112497, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetDestruction02
	SetArmorData(112498, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetDestruction03
	SetArmorData(112522, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetDestruction04
	SetArmorData(113072, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetIllusion02
	SetArmorData(113079, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetIllusion03
	SetArmorData(113080, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetIllusion04
	SetArmorData(113083, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMagicka02
	SetArmorData(113084, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMagicka03
	SetArmorData(113086, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMagicka04
	SetArmorData(113088, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMarksman02
	SetArmorData(113089, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMarksman03
	SetArmorData(113091, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMarksman04
	SetArmorData(113092, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetRestoration02
	SetArmorData(113093, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetRestoration03
	SetArmorData(113095, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetRestoration04
	SetArmorData(600717, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetWaterbreathing
	SetArmorData(80222, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorSteelPlateHelmet
	SetArmorData(570992, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlchemy02
	SetArmorData(570993, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlchemy03
	SetArmorData(570994, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlchemy04
	SetArmorData(253817, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlteration02
	SetArmorData(253818, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlteration03
	SetArmorData(253819, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlteration04
	SetArmorData(253820, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetConjuration02
	SetArmorData(253821, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetConjuration03
	SetArmorData(253822, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetConjuration04
	SetArmorData(253823, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetDestruction02
	SetArmorData(253824, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetDestruction03
	SetArmorData(253825, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetDestruction04
	SetArmorData(253829, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetIllusion02
	SetArmorData(266270, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetIllusion03
	SetArmorData(266272, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetIllusion04
	SetArmorData(266273, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMagicka02
	SetArmorData(266274, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMagicka03
	SetArmorData(266279, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMagicka04
	SetArmorData(266284, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMarksman02
	SetArmorData(266291, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMarksman03
	SetArmorData(266292, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMarksman04
	SetArmorData(266293, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetRestoration02
	SetArmorData(266294, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetRestoration03
	SetArmorData(266295, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetRestoration04
	SetArmorData(600778, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetWaterbreathing
	SetArmorData(80227, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorEbonyHelmet
	SetArmorData(850033, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlchemy03
	SetArmorData(850034, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlchemy04
	SetArmorData(850035, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlchemy05
	SetArmorData(850036, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlteration03
	SetArmorData(850037, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlteration04
	SetArmorData(850038, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlteration05
	SetArmorData(850039, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetConjuration03
	SetArmorData(850040, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetConjuration04
	SetArmorData(850041, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetConjuration05
	SetArmorData(850042, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetDestruction03
	SetArmorData(850043, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetDestruction04
	SetArmorData(850044, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetDestruction05
	SetArmorData(850048, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetIllusion03
	SetArmorData(850049, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetIllusion04
	SetArmorData(850050, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetIllusion05
	SetArmorData(850051, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagicka03
	SetArmorData(850052, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagicka04
	SetArmorData(850053, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagicka05
	SetArmorData(1041135, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagickaRate03
	SetArmorData(1041136, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagickaRate04
	SetArmorData(1041137, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagickaRate05
	SetArmorData(850054, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMarksman03
	SetArmorData(850055, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMarksman04
	SetArmorData(850056, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMarksman05
	SetArmorData(850057, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetRestoration03
	SetArmorData(850058, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetRestoration04
	SetArmorData(850059, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetRestoration05
	SetArmorData(850060, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetWaterbreathing
	SetArmorData(80233, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonplateHelmet
	SetArmorData(883296, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlchemy04
	SetArmorData(883297, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlchemy05
	SetArmorData(883298, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlchemy06
	SetArmorData(883299, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlteration04
	SetArmorData(883300, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlteration05
	SetArmorData(883301, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlteration06
	SetArmorData(883302, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetConjuration04
	SetArmorData(883303, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetConjuration05
	SetArmorData(883304, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetConjuration06
	SetArmorData(883305, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetDestruction04
	SetArmorData(883306, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetDestruction05
	SetArmorData(883307, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetDestruction06
	SetArmorData(883311, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetIllusion04
	SetArmorData(883312, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetIllusion05
	SetArmorData(883313, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetIllusion06
	SetArmorData(883314, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagicka04
	SetArmorData(883315, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagicka05
	SetArmorData(883316, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagicka06
	SetArmorData(1041138, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagickaRate04
	SetArmorData(1041139, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagickaRate05
	SetArmorData(1041140, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagickaRate06
	SetArmorData(883317, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMarksman04
	SetArmorData(883318, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMarksman05
	SetArmorData(883319, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMarksman06
	SetArmorData(883320, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetRestoration04
	SetArmorData(883321, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetRestoration05
	SetArmorData(883322, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetRestoration06
	SetArmorData(883323, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetWaterbreathing
	SetArmorData(307855, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorBladesHelmet
	SetArmorData(81628, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorImperialHelmet
	SetArmorData(81627, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorImperialLightHelmet
	SetArmorData(614669, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorImperialHelmetFull
	SetArmorData(79567, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorImperialHelmetOfficer
	SetArmorData(571042, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlchemy01
	SetArmorData(571043, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlchemy02
	SetArmorData(571044, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlchemy03
	SetArmorData(571045, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlteration01
	SetArmorData(571046, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlteration02
	SetArmorData(571047, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlteration03
	SetArmorData(571048, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetConjuration01
	SetArmorData(571049, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetConjuration02
	SetArmorData(571050, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetConjuration03
	SetArmorData(571051, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetDestruction01
	SetArmorData(571052, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetDestruction02
	SetArmorData(571053, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetDestruction03
	SetArmorData(571057, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetIllusion01
	SetArmorData(571058, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetIllusion02
	SetArmorData(571059, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetIllusion03
	SetArmorData(571060, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMagicka01
	SetArmorData(571061, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMagicka02
	SetArmorData(571063, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMarksman01
	SetArmorData(571064, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMarksman02
	SetArmorData(571065, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMarksman03
	SetArmorData(571066, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetRestoration01
	SetArmorData(571067, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetRestoration02
	SetArmorData(571068, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetRestoration03
	SetArmorData(571069, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlchemy01
	SetArmorData(571075, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlchemy02
	SetArmorData(571070, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlchemy03
	SetArmorData(571071, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlteration01
	SetArmorData(571072, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlteration02
	SetArmorData(571073, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlteration03
	SetArmorData(571074, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetConjuration01
	SetArmorData(571076, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetConjuration02
	SetArmorData(571077, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetConjuration03
	SetArmorData(571078, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetDestruction01
	SetArmorData(571079, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetDestruction02
	SetArmorData(571080, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetDestruction03
	SetArmorData(571084, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetIllusion01
	SetArmorData(571085, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetIllusion02
	SetArmorData(571086, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetIllusion03
	SetArmorData(571087, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetMagicka01
	SetArmorData(571088, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetMagicka02
	SetArmorData(571062, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetMagicka03
	SetArmorData(862274, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DBArmorHelmet
	SetArmorData(371652, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DBArmorHelmetMaskLess
	SetArmorData(925463, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DBArmorHelmetSP
	SetArmorData(1108829, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DBArmorHelmetWornPlayable
	SetArmorData(867013, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorThievesGuildHelmetPlayer
	SetArmorData(867022, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorThievesGuildHelmetPlayerImproved
	SetArmorData(931289, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorThievesGuildLeaderHelmet
	SetArmorData(1082694, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorLinweHelmet
	SetArmorData(383880, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_MAX) ; ArmorNightingaleHelmetPlayer01
	SetArmorData(1035283, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_MAX) ; ArmorNightingaleHelmetPlayer02
	SetArmorData(1035282, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_MAX) ; ArmorNightingaleHelmetPlayer03
	SetArmorData(962513, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; MS02ForswornHelmet
	SetArmorData(888146, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ForswornHelmet
	SetArmorData(868010, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorPenitusHelmet
	SetArmorData(455582, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorBanditHelmet
	SetArmorData(20688, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorDawnguardHelmetHeavy
	SetArmorData(104606, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorDawnguardHelmetLight
	SetArmorData(59616, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorFAlmerHardenedHelmet
	SetArmorData(9195, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorFAlmerHeavyHelmet
	SetArmorData(77450, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorShellbugHelmet
	SetArmorData(51220, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; DLC1IvoryCrown
	SetArmorData(118165, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2ArmorBonemoldHelmet
	SetArmorData(240419, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; DLC2ArmorBonemoldImprovedHelmet
	SetArmorData(165113, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlchemy01
	SetArmorData(165114, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlchemy02
	SetArmorData(165115, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlchemy03
	SetArmorData(165116, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlteration01
	SetArmorData(165117, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlteration02
	SetArmorData(165118, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlteration03
	SetArmorData(165119, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetConjuration01
	SetArmorData(165120, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetConjuration02
	SetArmorData(165121, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetConjuration03
	SetArmorData(165122, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetDestruction01
	SetArmorData(165123, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetDestruction02
	SetArmorData(165124, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetDestruction03
	SetArmorData(165125, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetIllusion01
	SetArmorData(165126, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetIllusion02
	SetArmorData(165127, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetIllusion03
	SetArmorData(165128, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetMagicka01
	SetArmorData(165129, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetMagicka02
	SetArmorData(165130, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetMagicka03
	SetArmorData(232157, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; DLC2dunFahlbtharzDwarvenHelmet
	SetArmorData(175409, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DLC2TGArmorVariantHood
	
	; Excellent (43 - 50)
	SetArmorData(80217, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; ArmorOrcishHelmet
	SetArmorData(849916, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlchemy03
	SetArmorData(849917, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlchemy04
	SetArmorData(849918, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlchemy05
	SetArmorData(849919, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlteration03
	SetArmorData(849920, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlteration04
	SetArmorData(849921, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlteration05
	SetArmorData(849922, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetConjuration03
	SetArmorData(849923, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetConjuration04
	SetArmorData(849924, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetConjuration05
	SetArmorData(849925, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetDestruction03
	SetArmorData(849926, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetDestruction04
	SetArmorData(849927, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetDestruction05
	SetArmorData(849931, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetIllusion03
	SetArmorData(849932, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetIllusion04
	SetArmorData(849933, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetIllusion05
	SetArmorData(849934, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMagicka03
	SetArmorData(849935, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMagicka04
	SetArmorData(849936, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMagicka05
	SetArmorData(849937, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMarksman03
	SetArmorData(849938, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMarksman04
	SetArmorData(849939, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMarksman05
	SetArmorData(849940, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetRestoration03
	SetArmorData(849941, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetRestoration04
	SetArmorData(849942, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetRestoration05
	SetArmorData(849943, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetWaterbreathing
	SetArmorData(80237, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; ArmorDaedricHelmet
	SetArmorData(883410, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlchemy04
	SetArmorData(883411, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlchemy05
	SetArmorData(883412, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlchemy06
	SetArmorData(883413, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlteration04
	SetArmorData(883414, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlteration05
	SetArmorData(883415, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlteration06
	SetArmorData(883416, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetConjuration04
	SetArmorData(883417, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetConjuration05
	SetArmorData(883418, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetConjuration06
	SetArmorData(883419, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetDestruction04
	SetArmorData(883420, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetDestruction05
	SetArmorData(883421, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetDestruction06
	SetArmorData(883425, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetIllusion04
	SetArmorData(883426, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetIllusion05
	SetArmorData(883427, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetIllusion06
	SetArmorData(883428, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagicka04
	SetArmorData(883429, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagicka05
	SetArmorData(883430, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagicka06
	SetArmorData(1041153, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagickaRate04
	SetArmorData(1041154, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagickaRate05
	SetArmorData(1041155, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagickaRate06
	SetArmorData(883431, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMarksman04
	SetArmorData(883432, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMarksman05
	SetArmorData(883433, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMarksman06
	SetArmorData(883434, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetRestoration04
	SetArmorData(883435, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetRestoration05
	SetArmorData(883436, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetRestoration06
	SetArmorData(883437, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetWaterbreathing
	SetArmorData(312272, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; ArmorCompanionsHelmet
	SetArmorData(551301, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; ArmorStormcloakBearHelmet
	
	
	

	SetArmorData(233748, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_POOR) ; DLC2ClothesSkaalHat
	SetArmorData(147485, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2dunHaknirArmorHelm
	SetArmorData(118177, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimHeavyHelmet
	SetArmorData(168502, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy04
	SetArmorData(168503, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy05
	SetArmorData(168504, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy06
	SetArmorData(168505, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration04
	SetArmorData(168506, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration05
	SetArmorData(168507, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration06
	SetArmorData(168508, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration04
	SetArmorData(168509, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration05
	SetArmorData(168510, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration06
	SetArmorData(168511, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction04
	SetArmorData(168512, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction05
	SetArmorData(168513, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction06
	SetArmorData(168514, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion04
	SetArmorData(168515, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion05
	SetArmorData(168516, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion06
	SetArmorData(168517, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka04
	SetArmorData(168518, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka05
	SetArmorData(168519, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka06
	SetArmorData(168520, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate04
	SetArmorData(168521, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate05
	SetArmorData(168522, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate06
	SetArmorData(168523, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman04
	SetArmorData(168524, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman05
	SetArmorData(168525, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman06
	SetArmorData(168526, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration04
	SetArmorData(168527, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration05
	SetArmorData(168528, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration06
	SetArmorData(168529, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetWaterbreathing
	SetArmorData(118179, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimLightHelmet
	SetArmorData(168149, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlchemy03
	SetArmorData(168150, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlchemy04
	SetArmorData(168151, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlchemy05
	SetArmorData(168152, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlteration03
	SetArmorData(168153, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlteration04
	SetArmorData(168154, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlteration05
	SetArmorData(168155, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetConjuration03
	SetArmorData(168156, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetConjuration04
	SetArmorData(168157, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetConjuration05
	SetArmorData(168158, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetDestruction03
	SetArmorData(168159, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetDestruction04
	SetArmorData(168160, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetDestruction05
	SetArmorData(168161, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetIllusion03
	SetArmorData(168162, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetIllusion04
	SetArmorData(168163, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetIllusion05
	SetArmorData(168164, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagicka03
	SetArmorData(168165, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagicka04
	SetArmorData(168166, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagicka05
	SetArmorData(168167, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate03
	SetArmorData(168168, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate04
	SetArmorData(168169, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate05
	SetArmorData(168170, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMarksman03
	SetArmorData(168171, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMarksman04
	SetArmorData(168172, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMarksman05
	SetArmorData(168173, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetRestoration03
	SetArmorData(168174, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetRestoration04
	SetArmorData(168175, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetRestoration05
	SetArmorData(168191, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetWaterbreathing
	SetArmorData(118169, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorNordicHeavyHelmet
	SetArmorData(168404, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlchemy03
	SetArmorData(168405, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlchemy04
	SetArmorData(168406, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlchemy05
	SetArmorData(168407, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlteration03
	SetArmorData(168408, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlteration04
	SetArmorData(168409, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlteration05
	SetArmorData(168410, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetConjuration03
	SetArmorData(168411, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetConjuration04
	SetArmorData(168412, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetConjuration05
	SetArmorData(168413, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetDestruction03
	SetArmorData(168414, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetDestruction04
	SetArmorData(168415, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetDestruction05
	SetArmorData(168416, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetIllusion03
	SetArmorData(168417, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetIllusion04
	SetArmorData(168418, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetIllusion05
	SetArmorData(168419, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMagicka03
	SetArmorData(168420, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMagicka04
	SetArmorData(168421, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMagicka05
	SetArmorData(168422, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMarksman03
	SetArmorData(168423, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMarksman04
	SetArmorData(168424, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMarksman05
	SetArmorData(168425, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetRestoration03
	SetArmorData(168426, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetRestoration04
	SetArmorData(168427, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetRestoration05
	SetArmorData(168428, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetWaterbreathing
endFunction

function SetDefaults_Hands()
	; Poor (0 - 10)
	SetArmorData(80146, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ArmorHideGauntlets
	SetArmorData(571007, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsAlchemy01
	SetArmorData(571008, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsAlchemy02
	SetArmorData(571009, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsAlchemy03
	SetArmorData(500041, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsLockpicking01
	SetArmorData(709805, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsLockpicking02
	SetArmorData(709806, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsLockpicking03
	SetArmorData(500042, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsMarksman01
	SetArmorData(709807, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsMarksman02
	SetArmorData(709808, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsMarksman03
	SetArmorData(500043, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsOneHanded01
	SetArmorData(709809, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsOneHanded02
	SetArmorData(709810, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsOneHanded03
	SetArmorData(500044, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsPickpocket01
	SetArmorData(709811, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsPickpocket02
	SetArmorData(709812, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsPickpocket03
	SetArmorData(500046, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsSmithing01
	SetArmorData(709815, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsSmithing02
	SetArmorData(709816, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsSmithing03
	SetArmorData(500047, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsTwoHanded01
	SetArmorData(709817, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsTwoHanded02
	SetArmorData(709818, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsTwoHanded03
	SetArmorData(77382, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ArmorIronGauntlets
	SetArmorData(802022, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; FavorOrcsGauntlets
	SetArmorData(571016, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsAlchemy01
	SetArmorData(571017, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsAlchemy02
	SetArmorData(571018, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsAlchemy03
	SetArmorData(500012, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsMarksman01
	SetArmorData(710011, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsMarksman02
	SetArmorData(710012, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsMarksman03
	SetArmorData(500014, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsOneHanded01
	SetArmorData(710013, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsOneHanded02
	SetArmorData(710014, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsOneHanded03
	SetArmorData(500018, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsSmithing01
	SetArmorData(710019, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsSmithing02
	SetArmorData(710020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsSmithing03
	SetArmorData(500020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsTwoHanded01
	SetArmorData(710021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsTwoHanded02
	SetArmorData(710022, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsTwoHanded03
	SetArmorData(80161, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ArmorLeatherGauntlets
	SetArmorData(571019, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsAlchemy01
	SetArmorData(571020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsAlchemy02
	SetArmorData(571021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsAlchemy03
	SetArmorData(741453, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsLockpicking01
	SetArmorData(741454, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsLockpicking02
	SetArmorData(741455, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsLockpicking03
	SetArmorData(741456, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsMarksman01
	SetArmorData(741457, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsMarksman02
	SetArmorData(741458, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsMarksman03
	SetArmorData(741459, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsOneHanded01
	SetArmorData(741460, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsOneHanded02
	SetArmorData(741461, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsOneHanded03
	SetArmorData(741462, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsPickpocket01
	SetArmorData(741463, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsPickpocket02
	SetArmorData(741464, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsPickpocket03
	SetArmorData(741468, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsSmithing01
	SetArmorData(741469, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsSmithing02
	SetArmorData(741470, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsSmithing03
	SetArmorData(741471, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsTwoHanded01
	SetArmorData(741472, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsTwoHanded02
	SetArmorData(741473, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsTwoHanded03
	SetArmorData(80156, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; ArmorElvenGauntlets
	SetArmorData(1072915, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; ArmorElvenLightGauntlets
	SetArmorData(570998, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsAlchemy02
	SetArmorData(570999, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsAlchemy03
	SetArmorData(571000, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsAlchemy04
	SetArmorData(778202, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsLockpicking02
	SetArmorData(778203, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsLockpicking03
	SetArmorData(778312, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsLockpicking04
	SetArmorData(778204, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsMarksman02
	SetArmorData(778205, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsMarksman03
	SetArmorData(778313, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsMarksman04
	SetArmorData(778206, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsOneHanded02
	SetArmorData(778207, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsOneHanded03
	SetArmorData(778314, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsOneHanded04
	SetArmorData(778208, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsPickpocket02
	SetArmorData(778209, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsPickpocket03
	SetArmorData(778315, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsPickpocket04
	SetArmorData(778212, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsSmithing02
	SetArmorData(778213, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsSmithing03
	SetArmorData(778317, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsSmithing04
	SetArmorData(778214, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsTwoHanded02
	SetArmorData(778215, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsTwoHanded03
	SetArmorData(778318, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsTwoHanded04
	SetArmorData(1105977, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; PrisonerCuffsPlayer
	SetArmorData(416691, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ClothesThalmorGloves
	SetArmorData(962514, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; MS02ForswornGauntlets
	SetArmorData(888149, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ForswornGauntlets
	SetArmorData(59615, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; DLC1ArmorFalmerHardenedGauntlets
	SetArmorData(9197, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; DLC1ArmorFalmerHeavyGauntlets
	SetArmorData(355095, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ArmorDraugrGauntlets
	SetArmorData(118155, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2ArmorChitinHeavyGauntlets
	SetArmorData(168312, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy02
	SetArmorData(168313, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy03
	SetArmorData(168314, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy04
	SetArmorData(168315, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsMarksman02
	SetArmorData(168316, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsMarksman03
	SetArmorData(168317, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsMarksman04
	SetArmorData(168318, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded02
	SetArmorData(168319, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded03
	SetArmorData(168320, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded04
	SetArmorData(168321, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsSmithing02
	SetArmorData(168322, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsSmithing03
	SetArmorData(168323, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsSmithing04
	SetArmorData(168324, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded02
	SetArmorData(168325, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded03
	SetArmorData(168326, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded04
	SetArmorData(118152, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2ArmorChitinLightGauntlets
	SetArmorData(167939, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsAlchemy02
	SetArmorData(167940, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsAlchemy03
	SetArmorData(167941, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsAlchemy04
	SetArmorData(167942, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsLockpicking02
	SetArmorData(167943, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsLockpicking03
	SetArmorData(167944, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsLockpicking04
	SetArmorData(167945, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsMarksman02
	SetArmorData(167946, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsMarksman03
	SetArmorData(167947, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsMarksman04
	SetArmorData(167948, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsOneHanded02
	SetArmorData(167949, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsOneHanded03
	SetArmorData(167950, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsOneHanded04
	SetArmorData(167951, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsPickpocket02
	SetArmorData(167952, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsPickpocket03
	SetArmorData(167953, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsPickpocket04
	SetArmorData(167954, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsSmithing02
	SetArmorData(167955, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsSmithing03
	SetArmorData(167956, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsSmithing04
	SetArmorData(167957, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsTwoHanded02
	SetArmorData(167958, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsTwoHanded03
	SetArmorData(167959, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsTwoHanded04
	SetArmorData(168621, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2MoragTongGauntlets
	SetArmorData(121753, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; DLC2dunKolbjornGauntlets


	; Fair (11 - 14)
	SetArmorData(455579, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; ArmorBanditGauntlets
	SetArmorData(111520, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; ArmorScaledGauntlets
	SetArmorData(289744, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsAlchemy02
	SetArmorData(289745, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsAlchemy03
	SetArmorData(289746, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsAlchemy04
	SetArmorData(289766, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsLockpicking02
	SetArmorData(289767, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsLockpicking03
	SetArmorData(289768, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsLockpicking04
	SetArmorData(289769, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsMarksman02
	SetArmorData(289770, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsMarksman03
	SetArmorData(289771, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsMarksman04
	SetArmorData(289913, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsOneHanded02
	SetArmorData(289914, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsOneHanded03
	SetArmorData(289916, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsOneHanded04
	SetArmorData(289917, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsPickpocket02
	SetArmorData(289919, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsPickpocket03
	SetArmorData(289920, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsPickpocket04
	SetArmorData(289950, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsSmithing02
	SetArmorData(290010, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsSmithing03
	SetArmorData(290026, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsSmithing04
	SetArmorData(290035, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsTwoHanded02
	SetArmorData(290036, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsTwoHanded03
	SetArmorData(290037, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsTwoHanded04
	SetArmorData(80186, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGlassGauntlets
	SetArmorData(873367, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsAlchemy03
	SetArmorData(873368, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsAlchemy04
	SetArmorData(873369, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsAlchemy05
	SetArmorData(1036017, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsLockpicking03
	SetArmorData(1036018, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsLockpicking04
	SetArmorData(1036019, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsLockpicking05
	SetArmorData(873388, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsMarksman03
	SetArmorData(873389, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsMarksman04
	SetArmorData(873390, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsMarksman05
	SetArmorData(873391, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsOneHanded03
	SetArmorData(873392, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsOneHanded04
	SetArmorData(873393, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsOneHanded05
	SetArmorData(1036020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsPickpocket03
	SetArmorData(1036021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsPickpocket04
	SetArmorData(1036022, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsPickpocket05
	SetArmorData(873397, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsSmithing03
	SetArmorData(873398, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsSmithing04
	SetArmorData(873399, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsSmithing05
	SetArmorData(873403, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsTwoHanded03
	SetArmorData(873404, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsTwoHanded04
	SetArmorData(873405, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsTwoHanded05
	SetArmorData(80211, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; ArmorSteelGauntletsA
	SetArmorData(1011491, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; ArmorSteelGauntletsB
	SetArmorData(571025, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsAlchemy01
	SetArmorData(571026, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsAlchemy02
	SetArmorData(571027, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsAlchemy03
	SetArmorData(741566, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsMarksman01
	SetArmorData(741579, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsMarksman02
	SetArmorData(741580, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsMarksman03
	SetArmorData(741567, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsOneHanded01
	SetArmorData(741581, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsOneHanded02
	SetArmorData(741582, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsOneHanded03
	SetArmorData(741569, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsSmithing01
	SetArmorData(571028, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsSmithing02
	SetArmorData(571029, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsSmithing03
	SetArmorData(741570, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsTwoHanded01
	SetArmorData(741585, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsTwoHanded02
	SetArmorData(741586, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsTwoHanded03
	SetArmorData(307853, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorBladesGauntlets
	SetArmorData(862275, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorGloves
	SetArmorData(1005953, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorGlovesReward
	SetArmorData(925462, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorGlovesSP
	SetArmorData(1108830, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorGlovesWornPlayable
	SetArmorData(79572, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorImperialGauntlets
	SetArmorData(81626, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorImperialLightGauntlets
	SetArmorData(571010, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlchemy01
	SetArmorData(571011, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlchemy02
	SetArmorData(571012, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlchemy03
	SetArmorData(707782, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlteration01
	SetArmorData(709877, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlteration02
	SetArmorData(709878, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlteration03
	SetArmorData(707784, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsConjuration01
	SetArmorData(709881, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsConjuration02
	SetArmorData(709882, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsConjuration03
	SetArmorData(707785, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsDestruction01
	SetArmorData(709883, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsDestruction02
	SetArmorData(709884, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsDestruction03
	SetArmorData(707789, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsMarksman01
	SetArmorData(709891, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsMarksman02
	SetArmorData(709892, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsMarksman03
	SetArmorData(707790, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsOneHanded01
	SetArmorData(759623, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsOneHanded02
	SetArmorData(709894, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsOneHanded03
	SetArmorData(707793, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsSmithing01
	SetArmorData(709899, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsSmithing02
	SetArmorData(709900, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsSmithing03
	SetArmorData(707794, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsTwoHanded01
	SetArmorData(709901, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsTwoHanded02
	SetArmorData(709902, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsTwoHanded03
	SetArmorData(571013, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlchemy01
	SetArmorData(571014, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlchemy02
	SetArmorData(571015, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlchemy03
	SetArmorData(759598, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlteration01
	SetArmorData(759599, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlteration02
	SetArmorData(759600, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlteration03
	SetArmorData(759604, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsConjuration01
	SetArmorData(759605, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsConjuration02
	SetArmorData(759606, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsConjuration03
	SetArmorData(759607, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsDestruction01
	SetArmorData(759608, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsDestruction02
	SetArmorData(759609, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsDestruction03
	SetArmorData(759616, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsLockpicking01
	SetArmorData(759617, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsLockpicking02
	SetArmorData(759618, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsLockpicking03
	SetArmorData(759619, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsMarksman01
	SetArmorData(759620, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsMarksman02
	SetArmorData(759621, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsMarksman03
	SetArmorData(759622, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsOneHanded01
	SetArmorData(709893, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsOneHanded02
	SetArmorData(759624, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsOneHanded03
	SetArmorData(759625, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsPickpocket01
	SetArmorData(759626, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsPickpocket02
	SetArmorData(759627, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsPickpocket03
	SetArmorData(759631, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsSmithing01
	SetArmorData(759632, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsSmithing02
	SetArmorData(759633, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsSmithing03
	SetArmorData(759634, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsTwoHanded01
	SetArmorData(759635, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsTwoHanded02
	SetArmorData(759636, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsTwoHanded03
	SetArmorData(118164, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldGauntlets
	SetArmorData(240418, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2ArmorBonemoldImprovedGauntlets
	SetArmorData(165083, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlchemy01
	SetArmorData(165084, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlchemy02
	SetArmorData(165085, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlchemy03
	SetArmorData(165086, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlteration01
	SetArmorData(165087, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlteration02
	SetArmorData(165088, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlteration03
	SetArmorData(165089, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsConjuration01
	SetArmorData(165090, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsConjuration02
	SetArmorData(165091, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsConjuration03
	SetArmorData(165092, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsDestruction01
	SetArmorData(165093, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsDestruction02
	SetArmorData(165094, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsDestruction03
	SetArmorData(165095, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsLockpicking01
	SetArmorData(165096, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsLockpicking02
	SetArmorData(165097, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsLockpicking03
	SetArmorData(165098, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsMarksman01
	SetArmorData(165099, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsMarksman02
	SetArmorData(165100, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsMarksman03
	SetArmorData(165101, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsOneHanded01
	SetArmorData(165102, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsOneHanded02
	SetArmorData(165103, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsOneHanded03
	SetArmorData(165104, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsPickpocket01
	SetArmorData(165105, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsPickpocket02
	SetArmorData(165106, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsPickpocket03
	SetArmorData(165107, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsSmithing01
	SetArmorData(165108, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsSmithing02
	SetArmorData(165109, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsSmithing03
	SetArmorData(165110, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsTwoHanded01
	SetArmorData(165111, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsTwoHanded02
	SetArmorData(165112, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsTwoHanded03
	SetArmorData(867012, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildGauntletsPlayer
	SetArmorData(867021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildGauntletsPlayerImproved
	SetArmorData(931288, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildLeaderGauntlets
	SetArmorData(1082693, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorLinweGauntlets
	SetArmorData(383879, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleGauntletsPlayer01
	SetArmorData(1035280, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleGauntletsPlayer02
	SetArmorData(1035281, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleGauntletsPlayer03
	SetArmorData(83800, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorDawnguardGauntletsHeavy
	SetArmorData(62462, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorDawnguardGauntletsLight
	SetArmorData(107807, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_GOOD) ; DLC1ArmorVampireGauntlets
	SetArmorData(175410, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC2TGArmorVariantGloves


	; Good (15 - 18)
	SetArmorData(80191, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonscaleGauntlets
	SetArmorData(883152, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsAlchemy04
	SetArmorData(883153, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsAlchemy05
	SetArmorData(883154, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsAlchemy06
	SetArmorData(1105777, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsLockpicking04
	SetArmorData(1105778, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsLockpicking05
	SetArmorData(1105779, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsLockpicking06
	SetArmorData(883173, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsMarksman04
	SetArmorData(883174, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsMarksman05
	SetArmorData(883175, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsMarksman06
	SetArmorData(883176, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsOneHanded04
	SetArmorData(883177, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsOneHanded05
	SetArmorData(883178, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsOneHanded06
	SetArmorData(1105774, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsPickpocket04
	SetArmorData(1105775, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsPickpocket05
	SetArmorData(1105776, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsPickpocket06
	SetArmorData(883182, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsSmithing04
	SetArmorData(883183, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsSmithing05
	SetArmorData(883184, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsSmithing06
	SetArmorData(883185, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsTwoHanded04
	SetArmorData(883186, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsTwoHanded05
	SetArmorData(883187, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsTwoHanded06
	SetArmorData(80206, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDwarvenGauntlets
	SetArmorData(570995, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsAlchemy02
	SetArmorData(570996, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsAlchemy03
	SetArmorData(570997, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsAlchemy04
	SetArmorData(111611, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsMarksman02
	SetArmorData(111612, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsMarksman03
	SetArmorData(111613, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsMarksman04
	SetArmorData(112469, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsOneHanded02
	SetArmorData(112470, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsOneHanded03
	SetArmorData(112471, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsOneHanded04
	SetArmorData(112481, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsSmithing02
	SetArmorData(112482, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsSmithing03
	SetArmorData(112486, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsSmithing04
	SetArmorData(112487, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsTwoHanded02
	SetArmorData(112488, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsTwoHanded03
	SetArmorData(112490, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsTwoHanded04
	SetArmorData(80221, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorSteelPlateGauntlets
	SetArmorData(571033, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsAlchemy02
	SetArmorData(571034, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsAlchemy03
	SetArmorData(571035, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsAlchemy04
	SetArmorData(253739, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsMarksman02
	SetArmorData(253772, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsMarksman03
	SetArmorData(253794, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsMarksman04
	SetArmorData(253798, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsOneHanded02
	SetArmorData(253799, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsOneHanded03
	SetArmorData(253803, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsOneHanded04
	SetArmorData(253811, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsSmithing02
	SetArmorData(253812, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsSmithing03
	SetArmorData(253813, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsSmithing04
	SetArmorData(253814, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsTwoHanded02
	SetArmorData(253815, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsTwoHanded03
	SetArmorData(253816, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsTwoHanded04
	SetArmorData(80226, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorEbonyGauntlets
	SetArmorData(849997, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsAlchemy03
	SetArmorData(849998, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsAlchemy04
	SetArmorData(849999, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsAlchemy05
	SetArmorData(850018, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsMarksman03
	SetArmorData(850019, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsMarksman04
	SetArmorData(850020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsMarksman05
	SetArmorData(850021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsOneHanded03
	SetArmorData(850022, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsOneHanded04
	SetArmorData(850023, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsOneHanded05
	SetArmorData(850027, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsSmithing03
	SetArmorData(850028, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsSmithing04
	SetArmorData(850029, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsSmithing05
	SetArmorData(850030, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsTwoHanded03
	SetArmorData(850031, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsTwoHanded04
	SetArmorData(850032, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsTwoHanded05
	SetArmorData(80231, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonplateGauntlets
	SetArmorData(883260, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsAlchemy04
	SetArmorData(883261, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsAlchemy05
	SetArmorData(883262, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsAlchemy06
	SetArmorData(883281, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsMarksman04
	SetArmorData(883282, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsMarksman05
	SetArmorData(883283, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsMarksman06
	SetArmorData(883284, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsOneHanded04
	SetArmorData(883285, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsOneHanded05
	SetArmorData(883286, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsOneHanded06
	SetArmorData(883290, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsSmithing04
	SetArmorData(883291, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsSmithing05
	SetArmorData(883292, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsSmithing06
	SetArmorData(883293, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsTwoHanded04
	SetArmorData(883294, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsTwoHanded05
	SetArmorData(883295, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsTwoHanded06
	SetArmorData(80236, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDaedricGauntlets
	SetArmorData(883374, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsAlchemy04
	SetArmorData(883375, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsAlchemy05
	SetArmorData(883376, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsAlchemy06
	SetArmorData(883395, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsMarksman04
	SetArmorData(883396, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsMarksman05
	SetArmorData(883397, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsMarksman06
	SetArmorData(883398, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsOneHanded04
	SetArmorData(883399, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsOneHanded05
	SetArmorData(883400, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsOneHanded06
	SetArmorData(883404, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsSmithing04
	SetArmorData(883405, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsSmithing05
	SetArmorData(883406, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsSmithing06
	SetArmorData(883407, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsTwoHanded04
	SetArmorData(883408, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsTwoHanded05
	SetArmorData(883409, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsTwoHanded06
	SetArmorData(551299, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorStormcloakBearGauntlets
	SetArmorData(868011, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorPenitusGauntlets
	SetArmorData(51223, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; DLC1IvoryGauntlets


	; Excellent (19 - 21)
	SetArmorData(80216, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorOrcishGauntlets
	SetArmorData(849880, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsAlchemy03
	SetArmorData(849881, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsAlchemy04
	SetArmorData(849882, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsAlchemy05
	SetArmorData(849901, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsMarksman03
	SetArmorData(849902, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsMarksman04
	SetArmorData(849903, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsMarksman05
	SetArmorData(849904, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsOneHanded03
	SetArmorData(849905, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsOneHanded04
	SetArmorData(849906, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsOneHanded05
	SetArmorData(849910, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsSmithing03
	SetArmorData(849911, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsSmithing04
	SetArmorData(849912, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsSmithing05
	SetArmorData(849913, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsTwoHanded03
	SetArmorData(849914, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsTwoHanded04
	SetArmorData(849915, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsTwoHanded05
	SetArmorData(847486, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorCompanionsGauntlets
	SetArmorData(683389, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorStormcloakGauntlets
	SetArmorData(267721, "Campfire.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; _Camp_ArmorSonsGauntlets
	
	
	; Max (22 - 24)
	SetArmorData(118176, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimHeavyGauntlets
	SetArmorData(168487, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy04
	SetArmorData(168488, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy05
	SetArmorData(168489, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy06
	SetArmorData(168490, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman04
	SetArmorData(168491, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman05
	SetArmorData(168492, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman06
	SetArmorData(168493, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded04
	SetArmorData(168494, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded05
	SetArmorData(168495, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded06
	SetArmorData(168496, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing04
	SetArmorData(168497, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing05
	SetArmorData(168498, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing06
	SetArmorData(168499, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded04
	SetArmorData(168500, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded05
	SetArmorData(168501, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded06
	SetArmorData(118181, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimLightGauntlets
	SetArmorData(168128, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy03
	SetArmorData(168129, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy04
	SetArmorData(168130, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy05
	SetArmorData(168131, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking03
	SetArmorData(168132, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking04
	SetArmorData(168133, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking05
	SetArmorData(168134, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsMarksman03
	SetArmorData(168135, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsMarksman04
	SetArmorData(168136, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsMarksman05
	SetArmorData(168137, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded03
	SetArmorData(168138, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded04
	SetArmorData(168139, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded05
	SetArmorData(168140, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket03
	SetArmorData(168141, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket04
	SetArmorData(168142, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket05
	SetArmorData(168143, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsSmithing03
	SetArmorData(168144, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsSmithing04
	SetArmorData(168145, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsSmithing05
	SetArmorData(168146, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded03
	SetArmorData(168147, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded04
	SetArmorData(168148, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded05
	SetArmorData(118168, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2ArmorNordicHeavyGauntlets
	SetArmorData(168389, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy03
	SetArmorData(168390, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy04
	SetArmorData(168391, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy05
	SetArmorData(168392, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsMarksman03
	SetArmorData(168393, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsMarksman04
	SetArmorData(168394, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsMarksman05
	SetArmorData(168395, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded03
	SetArmorData(168396, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded04
	SetArmorData(168397, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded05
	SetArmorData(168398, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsSmithing03
	SetArmorData(168399, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsSmithing04
	SetArmorData(168400, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsSmithing05
	SetArmorData(168401, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded03
	SetArmorData(168402, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded04
	SetArmorData(168403, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded05
	SetArmorData(233744, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ClothesSkaalGloves
	SetArmorData(147484, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2dunHaknirArmorGauntlets
endFunction

function SetDefaults_Feet()
	; Poor (0 - 8)
	SetArmorData(77387, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; ArmorIronBoots
	SetArmorData(500000, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsCarry01
	SetArmorData(709979, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsCarry02
	SetArmorData(709980, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsCarry03
	SetArmorData(499952, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFire01
	SetArmorData(709981, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFire02
	SetArmorData(709982, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFire03
	SetArmorData(499953, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFrost01
	SetArmorData(709983, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFrost02
	SetArmorData(709984, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFrost03
	SetArmorData(301970, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistShock01
	SetArmorData(709985, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistShock02
	SetArmorData(709986, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistShock03
	SetArmorData(1105807, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsStamina01
	SetArmorData(1105808, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsStamina02
	SetArmorData(1105809, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsStamina03
	SetArmorData(248320, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerShoes
	SetArmorData(962515, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; MS02ForswornBoots
	SetArmorData(888142, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; ForswornBoots
	SetArmorData(59882, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerBloodyShoes
	SetArmorData(18393, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; DLC1ClothesMothPriestSandals
	SetArmorData(59613, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; DLC1ArmorFalmerHardenedBoots
	SetArmorData(9199, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; DLC1ArmorFalmerHeavyBoots

	; Fair (9 - 13)
	SetArmorData(80144, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; ArmorHideBoots
	SetArmorData(500021, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsCarry01
	SetArmorData(709713, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsCarry02
	SetArmorData(709714, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsCarry03
	SetArmorData(500022, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFire01
	SetArmorData(709769, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFire02
	SetArmorData(709770, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFire03
	SetArmorData(500023, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFrost01
	SetArmorData(709771, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFrost02
	SetArmorData(709772, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFrost03
	SetArmorData(500024, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistShock01
	SetArmorData(709773, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistShock02
	SetArmorData(709774, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistShock03
	SetArmorData(500025, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsSneak01
	SetArmorData(709775, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsSneak02
	SetArmorData(709776, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsSneak03
	SetArmorData(1105804, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsStamina01
	SetArmorData(1105805, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsStamina02
	SetArmorData(1105806, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsStamina03
	SetArmorData(80160, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorLeatherBoots
	SetArmorData(737829, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsCarry01
	SetArmorData(737830, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsCarry02
	SetArmorData(737831, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsCarry03
	SetArmorData(737832, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFire01
	SetArmorData(737833, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFire02
	SetArmorData(737834, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFire03
	SetArmorData(737835, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFrost01
	SetArmorData(737836, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFrost02
	SetArmorData(737837, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFrost03
	SetArmorData(737838, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistShock01
	SetArmorData(737839, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistShock02
	SetArmorData(737840, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistShock03
	SetArmorData(737841, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsSneak01
	SetArmorData(737842, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsSneak02
	SetArmorData(737843, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsSneak03
	SetArmorData(1105810, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsStamina01
	SetArmorData(1105811, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsStamina02
	SetArmorData(1105812, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsStamina03
	SetArmorData(80154, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorElvenBoots
	SetArmorData(1072913, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorElvenLightBoots
	SetArmorData(778169, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsCarry02
	SetArmorData(778170, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsCarry03
	SetArmorData(778171, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsCarry04
	SetArmorData(778172, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFire02
	SetArmorData(778173, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFire03
	SetArmorData(778232, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFire04
	SetArmorData(778174, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFrost02
	SetArmorData(778175, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFrost03
	SetArmorData(778298, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFrost04
	SetArmorData(778176, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistShock02
	SetArmorData(778177, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistShock03
	SetArmorData(778299, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistShock04
	SetArmorData(778178, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsSneak02
	SetArmorData(778179, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsSneak03
	SetArmorData(778300, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsSneak04
	SetArmorData(1105798, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsStamina02
	SetArmorData(1105799, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsStamina03
	SetArmorData(1105800, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsStamina04
	SetArmorData(111519, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; ArmorScaledBoots
	SetArmorData(873446, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsCarry02
	SetArmorData(873447, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsCarry03
	SetArmorData(873448, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsCarry04
	SetArmorData(873449, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFire02
	SetArmorData(873450, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFire03
	SetArmorData(873451, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFire04
	SetArmorData(873452, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFrost02
	SetArmorData(873453, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFrost03
	SetArmorData(873454, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFrost04
	SetArmorData(873455, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistShock02
	SetArmorData(873456, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistShock03
	SetArmorData(873457, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistShock04
	SetArmorData(873458, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsSneak02
	SetArmorData(873459, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsSneak03
	SetArmorData(873460, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsSneak04
	SetArmorData(1105816, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsStamina02
	SetArmorData(1105817, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsStamina03
	SetArmorData(1105818, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsStamina04
	SetArmorData(80184, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGlassBoots
	SetArmorData(873326, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsCarry03
	SetArmorData(873327, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsCarry04
	SetArmorData(873328, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsCarry05
	SetArmorData(873329, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsMuffle
	SetArmorData(873330, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFire03
	SetArmorData(873331, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFire04
	SetArmorData(873332, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFire05
	SetArmorData(873333, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFrost03
	SetArmorData(873334, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFrost04
	SetArmorData(873335, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFrost05
	SetArmorData(873336, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistShock03
	SetArmorData(873337, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistShock04
	SetArmorData(873338, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistShock05
	SetArmorData(1105780, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsSneak03
	SetArmorData(1105781, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsSneak04
	SetArmorData(1105782, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsSneak05
	SetArmorData(1105801, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsStamina03
	SetArmorData(1105802, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsStamina04
	SetArmorData(1105803, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsStamina05
	SetArmorData(80209, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorSteelBootsA
	SetArmorData(1011489, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorSteelBootsB
	SetArmorData(741530, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsCarry01
	SetArmorData(741531, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsCarry02
	SetArmorData(741532, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsCarry03
	SetArmorData(600693, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsMuffle
	SetArmorData(741533, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFire01
	SetArmorData(741534, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFire02
	SetArmorData(741535, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFire03
	SetArmorData(741536, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFrost01
	SetArmorData(741625, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFrost02
	SetArmorData(741537, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFrost03
	SetArmorData(741538, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistShock01
	SetArmorData(741539, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistShock02
	SetArmorData(741540, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistShock03
	SetArmorData(1105819, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsStamina01
	SetArmorData(1105820, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsStamina02
	SetArmorData(1105821, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsStamina03
	SetArmorData(862277, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorBoots
	SetArmorData(925460, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorBootsSP
	SetArmorData(1108828, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorBootsWornPlayable
	SetArmorData(354973, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; ArmorDraugrBoots
	SetArmorData(307848, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorBladesBoots
	SetArmorData(79574, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorImperialBoots
	SetArmorData(81623, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorImperialLightBoots
	SetArmorData(707771, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsCarry01
	SetArmorData(709855, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsCarry02
	SetArmorData(709856, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsCarry03
	SetArmorData(707772, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFire01
	SetArmorData(709857, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFire02
	SetArmorData(709858, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFire03
	SetArmorData(707773, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFrost01
	SetArmorData(709859, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFrost02
	SetArmorData(709860, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFrost03
	SetArmorData(707774, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistShock01
	SetArmorData(709861, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistShock02
	SetArmorData(709862, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistShock03
	SetArmorData(707775, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsSneak01
	SetArmorData(709863, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsSneak02
	SetArmorData(709864, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsSneak03
	SetArmorData(759565, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsCarry01
	SetArmorData(759566, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsCarry02
	SetArmorData(759567, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsCarry03
	SetArmorData(759568, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFire01
	SetArmorData(759569, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFire02
	SetArmorData(759570, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFire03
	SetArmorData(759571, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFrost01
	SetArmorData(759572, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFrost02
	SetArmorData(759573, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFrost03
	SetArmorData(759574, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistShock01
	SetArmorData(759575, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistShock02
	SetArmorData(759576, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistShock03
	SetArmorData(759577, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsSneak01
	SetArmorData(759578, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsSneak02
	SetArmorData(759579, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsSneak03
	SetArmorData(416684, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; ClothesThalmorBoots
	SetArmorData(867010, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildBootsPlayer
	SetArmorData(867019, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildBootsPlayerImproved
	SetArmorData(931286, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildLeaderBoots
	SetArmorData(1082691, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorLinweBoots
	SetArmorData(1035276, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleBootsPlayer01
	SetArmorData(383877, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleBootsPlayer02
	SetArmorData(1035277, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleBootsPlayer03
	SetArmorData(83799, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorDawnguardBootsHeavy
	SetArmorData(62464, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorDawnguardBootsLight
	SetArmorData(46558, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorVampireBoots
	SetArmorData(165062, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsCarry01
	SetArmorData(165063, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsCarry02
	SetArmorData(165064, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsCarry03
	SetArmorData(165065, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFire01
	SetArmorData(165066, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFire02
	SetArmorData(165067, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFire03
	SetArmorData(165068, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFrost01
	SetArmorData(165069, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFrost02
	SetArmorData(165070, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFrost03
	SetArmorData(165071, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistShock01
	SetArmorData(165072, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistShock02
	SetArmorData(165073, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistShock03
	SetArmorData(165074, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsSneak01
	SetArmorData(165075, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsSneak02
	SetArmorData(165076, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsSneak03
	SetArmorData(118150, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorChitinLightBoots
	SetArmorData(167903, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsCarry02
	SetArmorData(167933, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsCarry03
	SetArmorData(167904, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsCarry04
	SetArmorData(167905, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFire02
	SetArmorData(167906, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFire03
	SetArmorData(167907, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFire04
	SetArmorData(167908, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFrost02
	SetArmorData(167909, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFrost03
	SetArmorData(167910, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFrost04
	SetArmorData(167911, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistShock02
	SetArmorData(167912, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistShock03
	SetArmorData(167913, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistShock04
	SetArmorData(167914, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsSneak02
	SetArmorData(167915, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsSneak03
	SetArmorData(167916, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsSneak04
	SetArmorData(167917, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsStamina02
	SetArmorData(167918, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsStamina03
	SetArmorData(167919, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsStamina04
	SetArmorData(118146, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorChitinHeavyBoots
	SetArmorData(168275, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsCarry02
	SetArmorData(168276, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsCarry03
	SetArmorData(168277, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsCarry04
	SetArmorData(168278, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsMuffle
	SetArmorData(168279, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFire02
	SetArmorData(168280, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFire03
	SetArmorData(168281, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFire04
	SetArmorData(168282, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFrost02
	SetArmorData(168283, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFrost03
	SetArmorData(168284, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFrost04
	SetArmorData(168285, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistShock02
	SetArmorData(168286, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistShock03
	SetArmorData(168287, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistShock04
	SetArmorData(168288, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsStamina02
	SetArmorData(168289, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsStamina03
	SetArmorData(168290, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsStamina04
	SetArmorData(168619, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2MoragTongBoots
	SetArmorData(116309, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; DLC2dunKolbjornBoots
	SetArmorData(175412, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC2TGArmorVariantBoots
	SetArmorData(118162, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldBoots

	; Good (14 - 18)
	SetArmorData(455576, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_POOR) ; ArmorBanditBoots
	SetArmorData(80189, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonscaleBoots
	SetArmorData(883111, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsCarry04
	SetArmorData(883112, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsCarry05
	SetArmorData(883113, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsCarry06
	SetArmorData(883115, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFire04
	SetArmorData(883116, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFire05
	SetArmorData(883117, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFire06
	SetArmorData(883118, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFrost04
	SetArmorData(883119, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFrost05
	SetArmorData(883120, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFrost06
	SetArmorData(883121, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistShock04
	SetArmorData(883122, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistShock05
	SetArmorData(883123, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistShock06
	SetArmorData(883114, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsSneak04
	SetArmorData(1038853, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsSneak05
	SetArmorData(1038854, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsSneak06
	SetArmorData(1105789, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsStamina04
	SetArmorData(1105790, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsStamina05
	SetArmorData(1105791, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsStamina06
	SetArmorData(80204, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDwarvenBoots
	SetArmorData(111413, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsCarry02
	SetArmorData(111421, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsCarry03
	SetArmorData(111563, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsCarry04
	SetArmorData(600713, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsMuffle
	SetArmorData(111564, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFire02
	SetArmorData(111565, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFire03
	SetArmorData(111566, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFire04
	SetArmorData(111567, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFrost02
	SetArmorData(111568, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFrost03
	SetArmorData(111569, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFrost04
	SetArmorData(111570, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistShock02
	SetArmorData(111571, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistShock03
	SetArmorData(111572, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistShock04
	SetArmorData(1105792, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsStamina02
	SetArmorData(1105793, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsStamina03
	SetArmorData(1105794, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsStamina04
	SetArmorData(80219, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorSteelPlateBoots
	SetArmorData(111391, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsCarry02
	SetArmorData(111614, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsCarry03
	SetArmorData(111615, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsCarry04
	SetArmorData(600718, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsMuffle
	SetArmorData(111616, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFire02
	SetArmorData(111617, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFire03
	SetArmorData(111618, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFire04
	SetArmorData(111619, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFrost02
	SetArmorData(111620, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFrost03
	SetArmorData(111621, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFrost04
	SetArmorData(111622, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistShock02
	SetArmorData(111623, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistShock03
	SetArmorData(111624, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistShock04
	SetArmorData(1105822, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsStamina02
	SetArmorData(1105823, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsStamina03
	SetArmorData(1105824, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsStamina04
	SetArmorData(80224, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorEbonyBoots
	SetArmorData(849956, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsCarry03
	SetArmorData(849957, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsCarry04
	SetArmorData(849958, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsCarry05
	SetArmorData(849959, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsMuffle
	SetArmorData(849960, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFire03
	SetArmorData(849961, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFire04
	SetArmorData(849962, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFire05
	SetArmorData(849963, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFrost03
	SetArmorData(849964, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFrost04
	SetArmorData(849965, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFrost05
	SetArmorData(849966, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistShock03
	SetArmorData(849967, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistShock04
	SetArmorData(849968, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistShock05
	SetArmorData(1105795, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsStamina03
	SetArmorData(1105796, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsStamina04
	SetArmorData(1105797, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsStamina05
	SetArmorData(80229, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonplateBoots
	SetArmorData(883228, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsCarry04
	SetArmorData(883229, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsCarry05
	SetArmorData(883230, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsCarry06
	SetArmorData(883231, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsMuffle
	SetArmorData(883232, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFire04
	SetArmorData(883233, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFire05
	SetArmorData(883234, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFire06
	SetArmorData(883235, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFrost04
	SetArmorData(883236, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFrost05
	SetArmorData(883237, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFrost06
	SetArmorData(883349, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistShock04
	SetArmorData(883350, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistShock05
	SetArmorData(883351, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistShock06
	SetArmorData(1105786, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsStamina04
	SetArmorData(1105787, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsStamina05
	SetArmorData(1105788, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsStamina06
	SetArmorData(80234, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDaedricBoots
	SetArmorData(883336, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsCarry04
	SetArmorData(883337, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsCarry05
	SetArmorData(883338, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsCarry06
	SetArmorData(883339, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsMuffle
	SetArmorData(883340, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFire04
	SetArmorData(883341, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFire05
	SetArmorData(883342, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFire06
	SetArmorData(883343, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFrost04
	SetArmorData(883344, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFrost05
	SetArmorData(883345, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFrost06
	SetArmorData(883346, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistShock04
	SetArmorData(883347, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistShock05
	SetArmorData(883348, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistShock06
	SetArmorData(1105783, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsStamina04
	SetArmorData(1105784, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsStamina05
	SetArmorData(1105785, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsStamina06
	SetArmorData(551297, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorStormcloakBearBoots
	SetArmorData(868007, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorPenitusBoots
	SetArmorData(51221, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; DLC1IvoryBoots
	SetArmorData(240421, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; DLC2ArmorBonemoldImprovedBoots


	; Excellent (21)
	SetArmorData(80214, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorOrcishBoots
	SetArmorData(849839, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsCarry03
	SetArmorData(849840, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsCarry04
	SetArmorData(849841, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsCarry05
	SetArmorData(849842, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsMuffle
	SetArmorData(849843, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFire03
	SetArmorData(849844, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFire04
	SetArmorData(849845, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFire05
	SetArmorData(849846, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFrost03
	SetArmorData(849847, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFrost04
	SetArmorData(849848, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFrost05
	SetArmorData(849849, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistShock03
	SetArmorData(849850, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistShock04
	SetArmorData(849851, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistShock05
	SetArmorData(1105813, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsStamina03
	SetArmorData(1105814, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsStamina04
	SetArmorData(1105815, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsStamina05
	SetArmorData(267720, "Campfire.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; _Camp_ArmorSonsBoots
	SetArmorData(847484, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorCompanionsBoots
	SetArmorData(683391, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorStormcloakBoots
	

	; Max (24)
	SetArmorData(118174, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimHeavyBoots
	SetArmorData(168444, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsCarry04
	SetArmorData(168445, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsCarry05
	SetArmorData(168446, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsCarry06
	SetArmorData(168447, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsMuffle
	SetArmorData(168448, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFire04
	SetArmorData(168449, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFire05
	SetArmorData(168450, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFire06
	SetArmorData(168451, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost04
	SetArmorData(168452, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost05
	SetArmorData(168453, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost06
	SetArmorData(168454, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistShock04
	SetArmorData(168455, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistShock05
	SetArmorData(168456, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistShock06
	SetArmorData(168457, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsStamina04
	SetArmorData(168458, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsStamina05
	SetArmorData(168459, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsStamina06
	SetArmorData(118142, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimLightBoots
	SetArmorData(168083, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsCarry03
	SetArmorData(168084, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsCarry04
	SetArmorData(168085, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsCarry05
	SetArmorData(168192, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsMuffle
	SetArmorData(168086, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFire03
	SetArmorData(168087, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFire04
	SetArmorData(168088, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFire05
	SetArmorData(168089, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFrost03
	SetArmorData(168090, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFrost04
	SetArmorData(168091, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFrost05
	SetArmorData(168093, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistShock03
	SetArmorData(168094, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistShock04
	SetArmorData(168095, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistShock05
	SetArmorData(168092, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsSneak03
	SetArmorData(168096, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsSneak04
	SetArmorData(168097, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsSneak05
	SetArmorData(168098, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsStamina03
	SetArmorData(168099, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsStamina04
	SetArmorData(168100, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsStamina05
	SetArmorData(118166, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2ArmorNordicHeavyBoots
	SetArmorData(168352, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsCarry03
	SetArmorData(168353, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsCarry04
	SetArmorData(168354, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsCarry05
	SetArmorData(168355, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsMuffle
	SetArmorData(168356, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFire03
	SetArmorData(168357, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFire04
	SetArmorData(168358, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFire05
	SetArmorData(168359, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFrost03
	SetArmorData(168360, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFrost04
	SetArmorData(168361, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFrost05
	SetArmorData(168362, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistShock03
	SetArmorData(168363, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistShock04
	SetArmorData(168364, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistShock05
	SetArmorData(168365, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsStamina03
	SetArmorData(168366, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsStamina04
	SetArmorData(168367, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsStamina05
	SetArmorData(233746, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ClothesSkaalBoots
	SetArmorData(147482, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2dunHaknirArmorBoots
endFunction

function SetDefaults_Cloak()
	SetArmorData(260764, "Campfire.esm", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKCLOTH) ; _Camp_Cloak_BasicBurlap
	SetArmorData(260765, "Campfire.esm", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKCLOTH) ; _Camp_Cloak_BasicLinen
	SetArmorData(260766, "Campfire.esm", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKFUR) ; _Camp_Cloak_BasicFur
	SetArmorData(260767, "Campfire.esm", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKLEATHER) ; _Camp_Cloak_BasicHide
	SetArmorData(356637, "Frostfall.esp", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKCLOTH) ; _Frost_Cloak_BoundLesser
	SetArmorData(359400, "Frostfall.esp", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKFUR) ; _Frost_Cloak_BoundGreater
endFunction

function SetDefaults_Shield()
	SetArmorData(151754, "Campfire.esm", GEARTYPE_IGNORE) ; _Camp_WalkingStickShield
endFunction

function SetArmorData(int aiFormID, string asPluginName, int aiGearType, int aiWarmthType = 0, int aiCoverageType = 0, int aiHeadWarmthType = 0, int aiHeadCoverageType = 0, int aiExtraType = 0)
	;debug.trace("SetArmorData " + aiFormID + " " + asPluginName + " " + aiGearType + " " + aiWarmthType + " " + aiCoverageType + " " + aiHeadWarmthType + " " + aiHeadCoverageType + " " + aiExtraType)
	if aiGearType == GEARTYPE_BODY
		SetArmorDataBody(aiFormID, asPluginName, aiWarmthType, aiCoverageType, aiHeadWarmthType, aiHeadCoverageType, aiExtraType)
	elseif aiGearType == GEARTYPE_HEAD
		SetArmorDataHead(aiFormID, asPluginName, aiWarmthType, aiCoverageType, aiExtraType)
	elseif aiGearType == GEARTYPE_HANDS
		SetArmorDataHands(aiFormID, asPluginName, aiWarmthType, aiCoverageType)
	elseif aiGearType == GEARTYPE_FEET
		SetArmorDataFeet(aiFormID, asPluginName, aiWarmthType, aiCoverageType)
	elseif aiGearType == GEARTYPE_CLOAK
		SetArmorDataCloak(aiFormID, asPluginName, aiExtraType)
	elseif aiGearType == GEARTYPE_MISC
		SetArmorDataMisc(aiFormID, asPluginName, aiExtraType)
	elseif aiGearType == GEARTYPE_IGNORE
		SetArmorDataIgnore(aiFormID, asPluginName)
	endif
endFunction

function SetArmorDataBody(int aiFormID, string asPluginName, int aiWarmthType, int aiCoverageType, int aiHeadWarmthType = 0, int aiHeadCoverageType = 0, int aiExtraCloakType = 0)	
	Armor theArmor = Game.GetFormFromFile(aiFormID, asPluginName) as Armor
	if !theArmor
		return
	endif

	if aiWarmthType == WARMTH_FAIR
		; pass - this will be assigned automatically when not found
	elseif aiWarmthType == WARMTH_POOR
		LinkedArrayAddArmor(theArmor, ArmorBodyWarmthPoor1, ArmorBodyWarmthPoor2, ArmorBodyWarmthPoor3, ArmorBodyWarmthPoor4)
	elseif aiWarmthType == WARMTH_GOOD
		LinkedArrayAddArmor(theArmor, ArmorBodyWarmthGood1, ArmorBodyWarmthGood2, ArmorBodyWarmthGood3, ArmorBodyWarmthGood4)
	elseif aiWarmthType == WARMTH_EXCELLENT
		LinkedArrayAddArmor(theArmor, ArmorBodyWarmthExcellent1, ArmorBodyWarmthExcellent2, ArmorBodyWarmthExcellent3, ArmorBodyWarmthExcellent4)
	elseif aiWarmthType == WARMTH_MAX
		LinkedArrayAddArmor(theArmor, ArmorBodyWarmthMax1, ArmorBodyWarmthMax2, ArmorBodyWarmthMax3, ArmorBodyWarmthMax4)
	endif

	if aiCoverageType == COVERAGE_FAIR
		; pass - this will be assigned automatically when not found
	elseif aiCoverageType == COVERAGE_POOR
		LinkedArrayAddArmor(theArmor, ArmorBodyCoveragePoor1, ArmorBodyCoveragePoor2, ArmorBodyCoveragePoor3, ArmorBodyCoveragePoor4)
	elseif aiCoverageType == COVERAGE_GOOD
		LinkedArrayAddArmor(theArmor, ArmorBodyCoverageGood1, ArmorBodyCoverageGood2, ArmorBodyCoverageGood3, ArmorBodyCoverageGood4)
	elseif aiCoverageType == COVERAGE_EXCELLENT
		LinkedArrayAddArmor(theArmor, ArmorBodyCoverageExcellent1, ArmorBodyCoverageExcellent2, ArmorBodyCoverageExcellent3, ArmorBodyCoverageExcellent4)
	elseif aiCoverageType == COVERAGE_MAX
		LinkedArrayAddArmor(theArmor, ArmorBodyCoverageMax1, ArmorBodyCoverageMax2, ArmorBodyCoverageMax3, ArmorBodyCoverageMax4)
	endif

	if aiHeadWarmthType > 0 || aiHeadCoverageType > 0
		SetArmorDataHead(aiFormID, asPluginName, aiHeadWarmthType, aiHeadCoverageType)
	endif

	if aiExtraCloakType != 0
		if aiExtraCloakType == EXTRA_CLOAKCLOTH
			LinkedArrayAddArmor(theArmor, ArmorCloakCloth1, ArmorCloakCloth2, ArmorCloakCloth3, ArmorCloakCloth4)
		elseif aiExtraCloakType == EXTRA_CLOAKLEATHER
			LinkedArrayAddArmor(theArmor, ArmorCloakLeather1, ArmorCloakLeather2, ArmorCloakLeather3, ArmorCloakLeather4)
		elseif aiExtraCloakType == EXTRA_CLOAKFUR
			LinkedArrayAddArmor(theArmor, ArmorCloakFur1, ArmorCloakFur2, ArmorCloakFur3, ArmorCloakFur4)
		endif
	endif
endFunction

function SetArmorDataHead(int aiFormID, string asPluginName, int aiWarmthType, int aiCoverageType, int aiExtraCloakType = 0)
	Armor theArmor = Game.GetFormFromFile(aiFormID, asPluginName) as Armor
	if !theArmor
		return
	endif

	if aiWarmthType == WARMTH_FAIR
		; pass - this will be assigned automatically when not found
	elseif aiWarmthType == WARMTH_POOR
		LinkedArrayAddArmor(theArmor, ArmorHeadWarmthPoor1, ArmorHeadWarmthPoor2, ArmorHeadWarmthPoor3, ArmorHeadWarmthPoor4)
	elseif aiWarmthType == WARMTH_GOOD
		LinkedArrayAddArmor(theArmor, ArmorHeadWarmthGood1, ArmorHeadWarmthGood2, ArmorHeadWarmthGood3, ArmorHeadWarmthGood4)
	elseif aiWarmthType == WARMTH_EXCELLENT
		LinkedArrayAddArmor(theArmor, ArmorHeadWarmthExcellent1, ArmorHeadWarmthExcellent2, ArmorHeadWarmthExcellent3, ArmorHeadWarmthExcellent4)
	elseif aiWarmthType == WARMTH_MAX
		LinkedArrayAddArmor(theArmor, ArmorHeadWarmthMax1, ArmorHeadWarmthMax2, ArmorHeadWarmthMax3, ArmorHeadWarmthMax4)
	endif

	if aiCoverageType == COVERAGE_FAIR
		; pass - this will be assigned automatically when not found
	elseif aiCoverageType == COVERAGE_POOR
		LinkedArrayAddArmor(theArmor, ArmorHeadCoveragePoor1, ArmorHeadCoveragePoor2, ArmorHeadCoveragePoor3, ArmorHeadCoveragePoor4)
	elseif aiCoverageType == COVERAGE_GOOD
		LinkedArrayAddArmor(theArmor, ArmorHeadCoverageGood1, ArmorHeadCoverageGood2, ArmorHeadCoverageGood3, ArmorHeadCoverageGood4)
	elseif aiCoverageType == COVERAGE_EXCELLENT
		LinkedArrayAddArmor(theArmor, ArmorHeadCoverageExcellent1, ArmorHeadCoverageExcellent2, ArmorHeadCoverageExcellent3, ArmorHeadCoverageExcellent4)
	elseif aiCoverageType == COVERAGE_MAX
		LinkedArrayAddArmor(theArmor, ArmorHeadCoverageMax1, ArmorHeadCoverageMax2, ArmorHeadCoverageMax3, ArmorHeadCoverageMax4)
	endif

	if aiExtraCloakType != 0
		if aiExtraCloakType == EXTRA_CLOAKCLOTH
			LinkedArrayAddArmor(theArmor, ArmorCloakCloth1, ArmorCloakCloth2, ArmorCloakCloth3, ArmorCloakCloth4)
		elseif aiExtraCloakType == EXTRA_CLOAKLEATHER
			LinkedArrayAddArmor(theArmor, ArmorCloakLeather1, ArmorCloakLeather2, ArmorCloakLeather3, ArmorCloakLeather4)
		elseif aiExtraCloakType == EXTRA_CLOAKFUR
			LinkedArrayAddArmor(theArmor, ArmorCloakFur1, ArmorCloakFur2, ArmorCloakFur3, ArmorCloakFur4)
		endif
	endif
endFunction

function SetArmorDataHands(int aiFormID, string asPluginName, int aiWarmthType, int aiCoverageType)
	Armor theArmor = Game.GetFormFromFile(aiFormID, asPluginName) as Armor
	if !theArmor
		return
	endif

	if aiWarmthType == WARMTH_FAIR
		; pass - this will be assigned automatically when not found
	elseif aiWarmthType == WARMTH_POOR
		LinkedArrayAddArmor(theArmor, ArmorHandsWarmthPoor1, ArmorHandsWarmthPoor2, ArmorHandsWarmthPoor3, ArmorHandsWarmthPoor4)
	elseif aiWarmthType == WARMTH_GOOD
		LinkedArrayAddArmor(theArmor, ArmorHandsWarmthGood1, ArmorHandsWarmthGood2, ArmorHandsWarmthGood3, ArmorHandsWarmthGood4)
	elseif aiWarmthType == WARMTH_EXCELLENT
		LinkedArrayAddArmor(theArmor, ArmorHandsWarmthExcellent1, ArmorHandsWarmthExcellent2, ArmorHandsWarmthExcellent3, ArmorHandsWarmthExcellent4)
	elseif aiWarmthType == WARMTH_MAX
		LinkedArrayAddArmor(theArmor, ArmorHandsWarmthMax1, ArmorHandsWarmthMax2, ArmorHandsWarmthMax3, ArmorHandsWarmthMax4)
	endif

	if aiCoverageType == COVERAGE_FAIR
		; pass - this will be assigned automatically when not found
	elseif aiCoverageType == COVERAGE_POOR
		LinkedArrayAddArmor(theArmor, ArmorHandsCoveragePoor1, ArmorHandsCoveragePoor2, ArmorHandsCoveragePoor3, ArmorHandsCoveragePoor4)
	elseif aiCoverageType == COVERAGE_GOOD
		LinkedArrayAddArmor(theArmor, ArmorHandsCoverageGood1, ArmorHandsCoverageGood2, ArmorHandsCoverageGood3, ArmorHandsCoverageGood4)
	elseif aiCoverageType == COVERAGE_EXCELLENT
		LinkedArrayAddArmor(theArmor, ArmorHandsCoverageExcellent1, ArmorHandsCoverageExcellent2, ArmorHandsCoverageExcellent3, ArmorHandsCoverageExcellent4)
	elseif aiCoverageType == COVERAGE_MAX
		LinkedArrayAddArmor(theArmor, ArmorHandsCoverageMax1, ArmorHandsCoverageMax2, ArmorHandsCoverageMax3, ArmorHandsCoverageMax4)
	endif
endFunction

function SetArmorDataFeet(int aiFormID, string asPluginName, int aiWarmthType, int aiCoverageType)
	Armor theArmor = Game.GetFormFromFile(aiFormID, asPluginName) as Armor
	if !theArmor
		return
	endif

	if aiWarmthType == WARMTH_FAIR
		; pass - this will be assigned automatically when not found
	elseif aiWarmthType == WARMTH_POOR
		LinkedArrayAddArmor(theArmor, ArmorFeetWarmthPoor1, ArmorFeetWarmthPoor2, ArmorFeetWarmthPoor3, ArmorFeetWarmthPoor4)
	elseif aiWarmthType == WARMTH_GOOD
		LinkedArrayAddArmor(theArmor, ArmorFeetWarmthGood1, ArmorFeetWarmthGood2, ArmorFeetWarmthGood3, ArmorFeetWarmthGood4)
	elseif aiWarmthType == WARMTH_EXCELLENT
		LinkedArrayAddArmor(theArmor, ArmorFeetWarmthExcellent1, ArmorFeetWarmthExcellent2, ArmorFeetWarmthExcellent3, ArmorFeetWarmthExcellent4)
	elseif aiWarmthType == WARMTH_MAX
		LinkedArrayAddArmor(theArmor, ArmorFeetWarmthMax1, ArmorFeetWarmthMax2, ArmorFeetWarmthMax3, ArmorFeetWarmthMax4)
	endif

	if aiCoverageType == COVERAGE_FAIR
		; pass - this will be assigned automatically when not found
	elseif aiCoverageType == COVERAGE_POOR
		LinkedArrayAddArmor(theArmor, ArmorFeetCoveragePoor1, ArmorFeetCoveragePoor2, ArmorFeetCoveragePoor3, ArmorFeetCoveragePoor4)
	elseif aiCoverageType == COVERAGE_GOOD
		LinkedArrayAddArmor(theArmor, ArmorFeetCoverageGood1, ArmorFeetCoverageGood2, ArmorFeetCoverageGood3, ArmorFeetCoverageGood4)
	elseif aiCoverageType == COVERAGE_EXCELLENT
		LinkedArrayAddArmor(theArmor, ArmorFeetCoverageExcellent1, ArmorFeetCoverageExcellent2, ArmorFeetCoverageExcellent3, ArmorFeetCoverageExcellent4)
	elseif aiCoverageType == COVERAGE_MAX
		LinkedArrayAddArmor(theArmor, ArmorFeetCoverageMax1, ArmorFeetCoverageMax2, ArmorFeetCoverageMax3, ArmorFeetCoverageMax4)
	endif
endFunction

function SetArmorDataCloak(int aiFormID, string asPluginName, int aiCloakType)
	Armor theArmor = Game.GetFormFromFile(aiFormID, asPluginName) as Armor
	if !theArmor
		return
	endif

	if aiCloakType == EXTRA_CLOAKCLOTH
		LinkedArrayAddArmor(theArmor, ArmorCloakCloth1, ArmorCloakCloth2, ArmorCloakCloth3, ArmorCloakCloth4)
	elseif aiCloakType == EXTRA_CLOAKLEATHER
		LinkedArrayAddArmor(theArmor, ArmorCloakLeather1, ArmorCloakLeather2, ArmorCloakLeather3, ArmorCloakLeather4)
	elseif aiCloakType == EXTRA_CLOAKFUR
		LinkedArrayAddArmor(theArmor, ArmorCloakFur1, ArmorCloakFur2, ArmorCloakFur3, ArmorCloakFur4)
	endif
endFunction

function SetArmorDataMisc(int aiFormID, string asPluginName, int aiExtraType)
	Armor theArmor = Game.GetFormFromFile(aiFormID, asPluginName) as Armor
	if !theArmor
		return
	endif

	if aiExtraType == EXTRA_WARMACCESSORY
		LinkedArrayAddArmor(theArmor, ArmorAccessoryWarm1, ArmorAccessoryWarm2, ArmorAccessoryWarm3, ArmorAccessoryWarm4)
	elseif aiExtraType == EXTRA_WEATHERPROOFACCESSORY
		LinkedArrayAddArmor(theArmor, ArmorAccessoryWeatherproof1, ArmorAccessoryWeatherproof2, ArmorAccessoryWeatherproof3, ArmorAccessoryWeatherproof4)
	endif
endFunction

function SetArmorDataIgnore(int aiFormID, string asPluginName)
	Armor theArmor = Game.GetFormFromFile(aiFormID, asPluginName) as Armor
	if !theArmor
		return
	endif

	LinkedArrayAddArmor(theArmor, ArmorIgnore1, ArmorIgnore2, ArmorIgnore3, ArmorIgnore4)
endFunction


; CRUD

int[] function FindBodyProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	protectionLevels[0] = -1
	protectionLevels[1] = -1
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorBodyWarmthPoor1, ArmorBodyWarmthPoor2, ArmorBodyWarmthPoor3, ArmorBodyWarmthPoor4)
		protectionLevels[0] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorBodyWarmthGood1, ArmorBodyWarmthGood2, ArmorBodyWarmthGood3, ArmorBodyWarmthGood4)
		protectionLevels[0] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorBodyWarmthExcellent1, ArmorBodyWarmthExcellent2, ArmorBodyWarmthExcellent3, ArmorBodyWarmthExcellent4)
		protectionLevels[0] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorBodyWarmthMax1, ArmorBodyWarmthMax2, ArmorBodyWarmthMax3, ArmorBodyWarmthMax4)
		protectionLevels[0] = 4
		found = true
	endif

	if LinkedArrayHasArmor(akArmor, ArmorBodyCoveragePoor1, ArmorBodyCoveragePoor2, ArmorBodyCoveragePoor3, ArmorBodyCoveragePoor4)
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorBodyCoverageGood1, ArmorBodyCoverageGood2, ArmorBodyCoverageGood3, ArmorBodyCoverageGood4)
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorBodyCoverageExcellent1, ArmorBodyCoverageExcellent2, ArmorBodyCoverageExcellent3, ArmorBodyCoverageExcellent4)
		protectionLevels[1] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorBodyCoverageMax1, ArmorBodyCoverageMax2, ArmorBodyCoverageMax3, ArmorBodyCoverageMax4)
		protectionLevels[1] = 4
		found = true
	endif

	; If I found one, but not the other, it is implicit that the one I didn't find is "Fair" protection.
	; If I found neither, the geartype remains "not found".
	if found
		if protectionLevels[0] == -1
			protectionLevels[0] = 1
		elseif protectionLevels[1] == -1
			protectionLevels[1] = 1
		endif
		protectionLevels[2] = GEARTYPE_BODY
	endif

	return protectionLevels
endFunction

int[] function FindHeadProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	protectionLevels[0] = -1
	protectionLevels[1] = -1
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorHeadWarmthPoor1, ArmorHeadWarmthPoor2, ArmorHeadWarmthPoor3, ArmorHeadWarmthPoor4)
		protectionLevels[0] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHeadWarmthGood1, ArmorHeadWarmthGood2, ArmorHeadWarmthGood3, ArmorHeadWarmthGood4)
		protectionLevels[0] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHeadWarmthExcellent1, ArmorHeadWarmthExcellent2, ArmorHeadWarmthExcellent3, ArmorHeadWarmthExcellent4)
		protectionLevels[0] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHeadWarmthMax1, ArmorHeadWarmthMax2, ArmorHeadWarmthMax3, ArmorHeadWarmthMax4)
		protectionLevels[0] = 4
		found = true
	endif

	if LinkedArrayHasArmor(akArmor, ArmorHeadCoveragePoor1, ArmorHeadCoveragePoor2, ArmorHeadCoveragePoor3, ArmorHeadCoveragePoor4)
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHeadCoverageGood1, ArmorHeadCoverageGood2, ArmorHeadCoverageGood3, ArmorHeadCoverageGood4)
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHeadCoverageExcellent1, ArmorHeadCoverageExcellent2, ArmorHeadCoverageExcellent3, ArmorHeadCoverageExcellent4)
		protectionLevels[1] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHeadCoverageMax1, ArmorHeadCoverageMax2, ArmorHeadCoverageMax3, ArmorHeadCoverageMax4)
		protectionLevels[1] = 4
		found = true
	endif

	if found
		if protectionLevels[0] == -1
			protectionLevels[0] = 1
		elseif protectionLevels[1] == -1
			protectionLevels[1] = 1
		endif
		protectionLevels[2] = GEARTYPE_HEAD
	endif

	return protectionLevels
endFunction

int[] function FindHandsProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	protectionLevels[0] = -1
	protectionLevels[1] = -1
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorHandsWarmthPoor1, ArmorHandsWarmthPoor2, ArmorHandsWarmthPoor3, ArmorHandsWarmthPoor4)
		protectionLevels[0] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHandsWarmthGood1, ArmorHandsWarmthGood2, ArmorHandsWarmthGood3, ArmorHandsWarmthGood4)
		protectionLevels[0] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHandsWarmthExcellent1, ArmorHandsWarmthExcellent2, ArmorHandsWarmthExcellent3, ArmorHandsWarmthExcellent4)
		protectionLevels[0] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHandsWarmthMax1, ArmorHandsWarmthMax2, ArmorHandsWarmthMax3, ArmorHandsWarmthMax4)
		protectionLevels[0] = 4
		found = true
	endif

	if LinkedArrayHasArmor(akArmor, ArmorHandsCoveragePoor1, ArmorHandsCoveragePoor2, ArmorHandsCoveragePoor3, ArmorHandsCoveragePoor4)
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHandsCoverageGood1, ArmorHandsCoverageGood2, ArmorHandsCoverageGood3, ArmorHandsCoverageGood4)
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHandsCoverageExcellent1, ArmorHandsCoverageExcellent2, ArmorHandsCoverageExcellent3, ArmorHandsCoverageExcellent4)
		protectionLevels[1] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorHandsCoverageMax1, ArmorHandsCoverageMax2, ArmorHandsCoverageMax3, ArmorHandsCoverageMax4)
		protectionLevels[1] = 4
		found = true
	endif

	if found
		if protectionLevels[0] == -1
			protectionLevels[0] = 1
		elseif protectionLevels[1] == -1
			protectionLevels[1] = 1
		endif
		protectionLevels[2] = GEARTYPE_HANDS
	endif

	return protectionLevels
endFunction

int[] function FindFeetProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	protectionLevels[0] = -1
	protectionLevels[1] = -1
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorFeetWarmthPoor1, ArmorFeetWarmthPoor2, ArmorFeetWarmthPoor3, ArmorFeetWarmthPoor4)
		protectionLevels[0] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorFeetWarmthGood1, ArmorFeetWarmthGood2, ArmorFeetWarmthGood3, ArmorFeetWarmthGood4)
		protectionLevels[0] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorFeetWarmthExcellent1, ArmorFeetWarmthExcellent2, ArmorFeetWarmthExcellent3, ArmorFeetWarmthExcellent4)
		protectionLevels[0] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorFeetWarmthMax1, ArmorFeetWarmthMax2, ArmorFeetWarmthMax3, ArmorFeetWarmthMax4)
		protectionLevels[0] = 4
		found = true
	endif

	if LinkedArrayHasArmor(akArmor, ArmorFeetCoveragePoor1, ArmorFeetCoveragePoor2, ArmorFeetCoveragePoor3, ArmorFeetCoveragePoor4)
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorFeetCoverageGood1, ArmorFeetCoverageGood2, ArmorFeetCoverageGood3, ArmorFeetCoverageGood4)
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorFeetCoverageExcellent1, ArmorFeetCoverageExcellent2, ArmorFeetCoverageExcellent3, ArmorFeetCoverageExcellent4)
		protectionLevels[1] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorFeetCoverageMax1, ArmorFeetCoverageMax2, ArmorFeetCoverageMax3, ArmorFeetCoverageMax4)
		protectionLevels[1] = 4
		found = true
	endif

	if found
		if protectionLevels[0] == -1
			protectionLevels[0] = 1
		elseif protectionLevels[1] == -1
			protectionLevels[1] = 1
		endif
		protectionLevels[2] = GEARTYPE_FEET
	endif

	return protectionLevels
endFunction

int[] function FindCloakProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorCloakCloth1, ArmorCloakCloth2, ArmorCloakCloth3, ArmorCloakCloth4)
		protectionLevels[0] = 1
		protectionLevels[1] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCloakLeather1, ArmorCloakLeather2, ArmorCloakLeather3, ArmorCloakLeather4)
		protectionLevels[0] = 1
		protectionLevels[1] = 4
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCloakFur1, ArmorCloakFur2, ArmorCloakFur3, ArmorCloakFur4)
		protectionLevels[0] = 4
		protectionLevels[1] = 1
		found = true
	endif

	if found
		protectionLevels[2] = GEARTYPE_CLOAK
	endif

	return protectionLevels
endFunction

int[] function FindMiscProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorAccessoryWarm1, ArmorAccessoryWarm2, ArmorAccessoryWarm3, ArmorAccessoryWarm4)
		protectionLevels[0] = 1
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorAccessoryWeatherproof1, ArmorAccessoryWeatherproof2, ArmorAccessoryWeatherproof3, ArmorAccessoryWeatherproof4)
		protectionLevels[0] = 0
		protectionLevels[1] = 1
		found = true
	endif

	if found
		protectionLevels[2] = GEARTYPE_MISC
	endif

	return protectionLevels
endFunction

function DumpAllArrays()
	DumpArray("ArmorBodyWarmthPoor1", ArmorBodyWarmthPoor1)
	DumpArray("ArmorBodyWarmthPoor2", ArmorBodyWarmthPoor2)
	DumpArray("ArmorBodyWarmthPoor3", ArmorBodyWarmthPoor3)
	DumpArray("ArmorBodyWarmthPoor4", ArmorBodyWarmthPoor4)
	DumpArray("ArmorBodyWarmthGood1", ArmorBodyWarmthGood1)
	DumpArray("ArmorBodyWarmthGood2", ArmorBodyWarmthGood2)
	DumpArray("ArmorBodyWarmthGood3", ArmorBodyWarmthGood3)
	DumpArray("ArmorBodyWarmthGood4", ArmorBodyWarmthGood4)
	DumpArray("ArmorBodyWarmthExcellent1", ArmorBodyWarmthExcellent1)
	DumpArray("ArmorBodyWarmthExcellent2", ArmorBodyWarmthExcellent2)
	DumpArray("ArmorBodyWarmthExcellent3", ArmorBodyWarmthExcellent3)
	DumpArray("ArmorBodyWarmthExcellent4", ArmorBodyWarmthExcellent4)
	DumpArray("ArmorBodyWarmthMax1", ArmorBodyWarmthMax1)
	DumpArray("ArmorBodyWarmthMax2", ArmorBodyWarmthMax2)
	DumpArray("ArmorBodyWarmthMax3", ArmorBodyWarmthMax3)
	DumpArray("ArmorBodyWarmthMax4", ArmorBodyWarmthMax4)
	DumpArray("ArmorHandsWarmthPoor1", ArmorHandsWarmthPoor1)
	DumpArray("ArmorHandsWarmthPoor2", ArmorHandsWarmthPoor2)
	DumpArray("ArmorHandsWarmthPoor3", ArmorHandsWarmthPoor3)
	DumpArray("ArmorHandsWarmthPoor4", ArmorHandsWarmthPoor4)
	DumpArray("ArmorHandsWarmthGood1", ArmorHandsWarmthGood1)
	DumpArray("ArmorHandsWarmthGood2", ArmorHandsWarmthGood2)
	DumpArray("ArmorHandsWarmthGood3", ArmorHandsWarmthGood3)
	DumpArray("ArmorHandsWarmthGood4", ArmorHandsWarmthGood4)
	DumpArray("ArmorHandsWarmthExcellent1", ArmorHandsWarmthExcellent1)
	DumpArray("ArmorHandsWarmthExcellent2", ArmorHandsWarmthExcellent2)
	DumpArray("ArmorHandsWarmthExcellent3", ArmorHandsWarmthExcellent3)
	DumpArray("ArmorHandsWarmthExcellent4", ArmorHandsWarmthExcellent4)
	DumpArray("ArmorHandsWarmthMax1", ArmorHandsWarmthMax1)
	DumpArray("ArmorHandsWarmthMax2", ArmorHandsWarmthMax2)
	DumpArray("ArmorHandsWarmthMax3", ArmorHandsWarmthMax3)
	DumpArray("ArmorHandsWarmthMax4", ArmorHandsWarmthMax4)
	DumpArray("ArmorHeadWarmthPoor1", ArmorHeadWarmthPoor1)
	DumpArray("ArmorHeadWarmthPoor2", ArmorHeadWarmthPoor2)
	DumpArray("ArmorHeadWarmthPoor3", ArmorHeadWarmthPoor3)
	DumpArray("ArmorHeadWarmthPoor4", ArmorHeadWarmthPoor4)
	DumpArray("ArmorHeadWarmthGood1", ArmorHeadWarmthGood1)
	DumpArray("ArmorHeadWarmthGood2", ArmorHeadWarmthGood2)
	DumpArray("ArmorHeadWarmthGood3", ArmorHeadWarmthGood3)
	DumpArray("ArmorHeadWarmthGood4", ArmorHeadWarmthGood4)
	DumpArray("ArmorHeadWarmthExcellent1", ArmorHeadWarmthExcellent1)
	DumpArray("ArmorHeadWarmthExcellent2", ArmorHeadWarmthExcellent2)
	DumpArray("ArmorHeadWarmthExcellent3", ArmorHeadWarmthExcellent3)
	DumpArray("ArmorHeadWarmthExcellent4", ArmorHeadWarmthExcellent4)
	DumpArray("ArmorHeadWarmthMax1", ArmorHeadWarmthMax1)
	DumpArray("ArmorHeadWarmthMax2", ArmorHeadWarmthMax2)
	DumpArray("ArmorHeadWarmthMax3", ArmorHeadWarmthMax3)
	DumpArray("ArmorHeadWarmthMax4", ArmorHeadWarmthMax4)
	DumpArray("ArmorFeetWarmthPoor1", ArmorFeetWarmthPoor1)
	DumpArray("ArmorFeetWarmthPoor2", ArmorFeetWarmthPoor2)
	DumpArray("ArmorFeetWarmthPoor3", ArmorFeetWarmthPoor3)
	DumpArray("ArmorFeetWarmthPoor4", ArmorFeetWarmthPoor4)
	DumpArray("ArmorFeetWarmthGood1", ArmorFeetWarmthGood1)
	DumpArray("ArmorFeetWarmthGood2", ArmorFeetWarmthGood2)
	DumpArray("ArmorFeetWarmthGood3", ArmorFeetWarmthGood3)
	DumpArray("ArmorFeetWarmthGood4", ArmorFeetWarmthGood4)
	DumpArray("ArmorFeetWarmthExcellent1", ArmorFeetWarmthExcellent1)
	DumpArray("ArmorFeetWarmthExcellent2", ArmorFeetWarmthExcellent2)
	DumpArray("ArmorFeetWarmthExcellent3", ArmorFeetWarmthExcellent3)
	DumpArray("ArmorFeetWarmthExcellent4", ArmorFeetWarmthExcellent4)
	DumpArray("ArmorFeetWarmthMax1", ArmorFeetWarmthMax1)
	DumpArray("ArmorFeetWarmthMax2", ArmorFeetWarmthMax2)
	DumpArray("ArmorFeetWarmthMax3", ArmorFeetWarmthMax3)
	DumpArray("ArmorFeetWarmthMax4", ArmorFeetWarmthMax4)
	DumpArray("ArmorBodyCoveragePoor1", ArmorBodyCoveragePoor1)
	DumpArray("ArmorBodyCoveragePoor2", ArmorBodyCoveragePoor2)
	DumpArray("ArmorBodyCoveragePoor3", ArmorBodyCoveragePoor3)
	DumpArray("ArmorBodyCoveragePoor4", ArmorBodyCoveragePoor4)
	DumpArray("ArmorBodyCoverageGood1", ArmorBodyCoverageGood1)
	DumpArray("ArmorBodyCoverageGood2", ArmorBodyCoverageGood2)
	DumpArray("ArmorBodyCoverageGood3", ArmorBodyCoverageGood3)
	DumpArray("ArmorBodyCoverageGood4", ArmorBodyCoverageGood4)
	DumpArray("ArmorBodyCoverageExcellent1", ArmorBodyCoverageExcellent1)
	DumpArray("ArmorBodyCoverageExcellent2", ArmorBodyCoverageExcellent2)
	DumpArray("ArmorBodyCoverageExcellent3", ArmorBodyCoverageExcellent3)
	DumpArray("ArmorBodyCoverageExcellent4", ArmorBodyCoverageExcellent4)
	DumpArray("ArmorBodyCoverageMax1", ArmorBodyCoverageMax1)
	DumpArray("ArmorBodyCoverageMax2", ArmorBodyCoverageMax2)
	DumpArray("ArmorBodyCoverageMax3", ArmorBodyCoverageMax3)
	DumpArray("ArmorBodyCoverageMax4", ArmorBodyCoverageMax4)
	DumpArray("ArmorHandsCoveragePoor1", ArmorHandsCoveragePoor1)
	DumpArray("ArmorHandsCoveragePoor2", ArmorHandsCoveragePoor2)
	DumpArray("ArmorHandsCoveragePoor3", ArmorHandsCoveragePoor3)
	DumpArray("ArmorHandsCoveragePoor4", ArmorHandsCoveragePoor4)
	DumpArray("ArmorHandsCoverageGood1", ArmorHandsCoverageGood1)
	DumpArray("ArmorHandsCoverageGood2", ArmorHandsCoverageGood2)
	DumpArray("ArmorHandsCoverageGood3", ArmorHandsCoverageGood3)
	DumpArray("ArmorHandsCoverageGood4", ArmorHandsCoverageGood4)
	DumpArray("ArmorHandsCoverageExcellent1", ArmorHandsCoverageExcellent1)
	DumpArray("ArmorHandsCoverageExcellent2", ArmorHandsCoverageExcellent2)
	DumpArray("ArmorHandsCoverageExcellent3", ArmorHandsCoverageExcellent3)
	DumpArray("ArmorHandsCoverageExcellent4", ArmorHandsCoverageExcellent4)
	DumpArray("ArmorHandsCoverageMax1", ArmorHandsCoverageMax1)
	DumpArray("ArmorHandsCoverageMax2", ArmorHandsCoverageMax2)
	DumpArray("ArmorHandsCoverageMax3", ArmorHandsCoverageMax3)
	DumpArray("ArmorHandsCoverageMax4", ArmorHandsCoverageMax4)
	DumpArray("ArmorHeadCoveragePoor1", ArmorHeadCoveragePoor1)
	DumpArray("ArmorHeadCoveragePoor2", ArmorHeadCoveragePoor2)
	DumpArray("ArmorHeadCoveragePoor3", ArmorHeadCoveragePoor3)
	DumpArray("ArmorHeadCoveragePoor4", ArmorHeadCoveragePoor4)
	DumpArray("ArmorHeadCoverageGood1", ArmorHeadCoverageGood1)
	DumpArray("ArmorHeadCoverageGood2", ArmorHeadCoverageGood2)
	DumpArray("ArmorHeadCoverageGood3", ArmorHeadCoverageGood3)
	DumpArray("ArmorHeadCoverageGood4", ArmorHeadCoverageGood4)
	DumpArray("ArmorHeadCoverageExcellent1", ArmorHeadCoverageExcellent1)
	DumpArray("ArmorHeadCoverageExcellent2", ArmorHeadCoverageExcellent2)
	DumpArray("ArmorHeadCoverageExcellent3", ArmorHeadCoverageExcellent3)
	DumpArray("ArmorHeadCoverageExcellent4", ArmorHeadCoverageExcellent4)
	DumpArray("ArmorHeadCoverageMax1", ArmorHeadCoverageMax1)
	DumpArray("ArmorHeadCoverageMax2", ArmorHeadCoverageMax2)
	DumpArray("ArmorHeadCoverageMax3", ArmorHeadCoverageMax3)
	DumpArray("ArmorHeadCoverageMax4", ArmorHeadCoverageMax4)
	DumpArray("ArmorFeetCoveragePoor1", ArmorFeetCoveragePoor1)
	DumpArray("ArmorFeetCoveragePoor2", ArmorFeetCoveragePoor2)
	DumpArray("ArmorFeetCoveragePoor3", ArmorFeetCoveragePoor3)
	DumpArray("ArmorFeetCoveragePoor4", ArmorFeetCoveragePoor4)
	DumpArray("ArmorFeetCoverageGood1", ArmorFeetCoverageGood1)
	DumpArray("ArmorFeetCoverageGood2", ArmorFeetCoverageGood2)
	DumpArray("ArmorFeetCoverageGood3", ArmorFeetCoverageGood3)
	DumpArray("ArmorFeetCoverageGood4", ArmorFeetCoverageGood4)
	DumpArray("ArmorFeetCoverageExcellent1", ArmorFeetCoverageExcellent1)
	DumpArray("ArmorFeetCoverageExcellent2", ArmorFeetCoverageExcellent2)
	DumpArray("ArmorFeetCoverageExcellent3", ArmorFeetCoverageExcellent3)
	DumpArray("ArmorFeetCoverageExcellent4", ArmorFeetCoverageExcellent4)
	DumpArray("ArmorFeetCoverageMax1", ArmorFeetCoverageMax1)
	DumpArray("ArmorFeetCoverageMax2", ArmorFeetCoverageMax2)
	DumpArray("ArmorFeetCoverageMax3", ArmorFeetCoverageMax3)
	DumpArray("ArmorFeetCoverageMax4", ArmorFeetCoverageMax4)
	DumpArray("ArmorAccessoryWarm1", ArmorAccessoryWarm1)
	DumpArray("ArmorAccessoryWarm2", ArmorAccessoryWarm2)
	DumpArray("ArmorAccessoryWarm3", ArmorAccessoryWarm3)
	DumpArray("ArmorAccessoryWarm4", ArmorAccessoryWarm4)
	DumpArray("ArmorAccessoryWeatherproof1", ArmorAccessoryWeatherproof1)
	DumpArray("ArmorAccessoryWeatherproof2", ArmorAccessoryWeatherproof2)
	DumpArray("ArmorAccessoryWeatherproof3", ArmorAccessoryWeatherproof3)
	DumpArray("ArmorAccessoryWeatherproof4", ArmorAccessoryWeatherproof4)
	DumpArray("ArmorCloakCloth1", ArmorCloakCloth1)
	DumpArray("ArmorCloakCloth2", ArmorCloakCloth2)
	DumpArray("ArmorCloakCloth3", ArmorCloakCloth3)
	DumpArray("ArmorCloakCloth4", ArmorCloakCloth4)
	DumpArray("ArmorCloakLeather1", ArmorCloakLeather1)
	DumpArray("ArmorCloakLeather2", ArmorCloakLeather2)
	DumpArray("ArmorCloakLeather3", ArmorCloakLeather3)
	DumpArray("ArmorCloakLeather4", ArmorCloakLeather4)
	DumpArray("ArmorCloakFur1", ArmorCloakFur1)
	DumpArray("ArmorCloakFur2", ArmorCloakFur2)
	DumpArray("ArmorCloakFur3", ArmorCloakFur3)
	DumpArray("ArmorCloakFur4", ArmorCloakFur4)
	DumpArray("ArmorIgnore1", ArmorIgnore1)
	DumpArray("ArmorIgnore2", ArmorIgnore2)
	DumpArray("ArmorIgnore3", ArmorIgnore3)
	DumpArray("ArmorIgnore4", ArmorIgnore4)
endFunction

function DumpArray(string asArrayName, Armor[] akArray)
	debug.trace("Dumping " + asArrayName + ", length " + akArray.Length)
	int i = 0
	while i < akArray.Length
		if akArray[i] != None
			debug.trace(asArrayName + "[" + i + "] = " + akArray[i])
		endif
		i += 1
	endWhile
endFunction