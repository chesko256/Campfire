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
	SetArmorData(1099416, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_FAIR) ; ClothesThalmorRobesHooded 		@MULTI
	SetArmorData(383878, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer01  @MULTI
	SetArmorData(1035278, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer02 @MULTI
	SetArmorData(1035279, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer03 @MULTI
	SetArmorData(46555, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiExtraType = EXTRA_CLOAKLEATHER) ; DLC1ArmorVampireArmorRoyalRed 	@MULTI
	SetArmorData(103621, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiExtraType = EXTRA_CLOAKLEATHER) ; DLC1ArmorVampireArmorValerica	@MULTI
	SetArmorData(118186, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfit 		@MULTI
	SetArmorData(225381, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfitBlue	@MULTI
	SetArmorData(225382, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfitRed	@MULTI
endFunction

function SetDefaults_Head()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()

endFunction

function SetDefaults_Hands()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()

endFunction

function SetDefaults_Feet()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()

endFunction

function SetDefaults_Cloak()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()

endFunction

function SetDefaults_Shield()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()

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
	debug.trace("SetArmorDataBody " + aiFormID + " " + asPluginName + " " + aiWarmthType + " " + aiCoverageType + " " + aiHeadWarmthType + " " + aiHeadCoverageType + " " + aiExtraCloakType)
	
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
		protectionLevels[1] = 5
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCloakFur1, ArmorCloakFur2, ArmorCloakFur3, ArmorCloakFur4)
		protectionLevels[0] = 5
		protectionLevels[1] = 1
		found = true
	endif

	if found
		protectionLevels[2] = GEARTYPE_CLOAK
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