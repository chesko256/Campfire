scriptname _Frost_LegacyArmorDatastore extends Quest

import FrostUtil
import CommonArrayHelper

GlobalVariable property _Frost_DatastoreInitialized auto

int property WARMTH_POOR 		= 1 autoReadOnly
int property WARMTH_FAIR 		= 2 autoReadOnly
int property WARMTH_GOOD 		= 3 autoReadOnly
int property WARMTH_EXCELLENT 	= 4 autoReadOnly
int property WARMTH_MAX 		= 5 autoReadOnly

int property COVERAGE_POOR 		= 1 autoReadOnly
int property COVERAGE_FAIR 		= 2 autoReadOnly
int property COVERAGE_GOOD 		= 3 autoReadOnly
int property COVERAGE_EXCELLENT = 4 autoReadOnly
int property COVERAGE_MAX 		= 5 autoReadOnly

int property EXTRA_WARMACCESSORY = 1 autoReadOnly
int property EXTRA_WEATHERPROOFACCESSORY = 2 autoReadOnly
int property EXTRA_CLOAKCLOTH 	 = 3 autoReadOnly
int property EXTRA_CLOAKLEATHER  = 4 autoReadOnly
int property EXTRA_CLOAKFUR 	 = 5 autoReadOnly

int property GEARTYPE_BODY 		= 1 autoReadOnly
int property GEARTYPE_HEAD 		= 2 autoReadOnly
int property GEARTYPE_HANDS 	= 3 autoReadOnly
int property GEARTYPE_FEET 		= 4 autoReadOnly
int property GEARTYPE_CLOAK 	= 5 autoReadOnly
int property GEARTYPE_MISC 		= 6 autoReadOnly
int property GEARTYPE_IGNORE 	= 7 autoReadOnly

;
; Default Value arrays
;

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

;
; Custom Value arrays
;
Armor[] ArmorCustomBodyWarmthPoor1
Armor[] ArmorCustomBodyWarmthPoor2
Armor[] ArmorCustomBodyWarmthPoor3
Armor[] ArmorCustomBodyWarmthPoor4
Armor[] ArmorCustomBodyWarmthFair1
Armor[] ArmorCustomBodyWarmthFair2
Armor[] ArmorCustomBodyWarmthFair3
Armor[] ArmorCustomBodyWarmthFair4
Armor[] ArmorCustomBodyWarmthGood1
Armor[] ArmorCustomBodyWarmthGood2
Armor[] ArmorCustomBodyWarmthGood3
Armor[] ArmorCustomBodyWarmthGood4
Armor[] ArmorCustomBodyWarmthExcellent1
Armor[] ArmorCustomBodyWarmthExcellent2
Armor[] ArmorCustomBodyWarmthExcellent3
Armor[] ArmorCustomBodyWarmthExcellent4
Armor[] ArmorCustomBodyWarmthMax1
Armor[] ArmorCustomBodyWarmthMax2
Armor[] ArmorCustomBodyWarmthMax3
Armor[] ArmorCustomBodyWarmthMax4

Armor[] ArmorCustomHandsWarmthPoor1
Armor[] ArmorCustomHandsWarmthPoor2
Armor[] ArmorCustomHandsWarmthPoor3
Armor[] ArmorCustomHandsWarmthPoor4
Armor[] ArmorCustomHandsWarmthFair1
Armor[] ArmorCustomHandsWarmthFair2
Armor[] ArmorCustomHandsWarmthFair3
Armor[] ArmorCustomHandsWarmthFair4
Armor[] ArmorCustomHandsWarmthGood1
Armor[] ArmorCustomHandsWarmthGood2
Armor[] ArmorCustomHandsWarmthGood3
Armor[] ArmorCustomHandsWarmthGood4
Armor[] ArmorCustomHandsWarmthExcellent1
Armor[] ArmorCustomHandsWarmthExcellent2
Armor[] ArmorCustomHandsWarmthExcellent3
Armor[] ArmorCustomHandsWarmthExcellent4
Armor[] ArmorCustomHandsWarmthMax1
Armor[] ArmorCustomHandsWarmthMax2
Armor[] ArmorCustomHandsWarmthMax3
Armor[] ArmorCustomHandsWarmthMax4

Armor[] ArmorCustomHeadWarmthPoor1
Armor[] ArmorCustomHeadWarmthPoor2
Armor[] ArmorCustomHeadWarmthPoor3
Armor[] ArmorCustomHeadWarmthPoor4
Armor[] ArmorCustomHeadWarmthFair1
Armor[] ArmorCustomHeadWarmthFair2
Armor[] ArmorCustomHeadWarmthFair3
Armor[] ArmorCustomHeadWarmthFair4
Armor[] ArmorCustomHeadWarmthGood1
Armor[] ArmorCustomHeadWarmthGood2
Armor[] ArmorCustomHeadWarmthGood3
Armor[] ArmorCustomHeadWarmthGood4
Armor[] ArmorCustomHeadWarmthExcellent1
Armor[] ArmorCustomHeadWarmthExcellent2
Armor[] ArmorCustomHeadWarmthExcellent3
Armor[] ArmorCustomHeadWarmthExcellent4
Armor[] ArmorCustomHeadWarmthMax1
Armor[] ArmorCustomHeadWarmthMax2
Armor[] ArmorCustomHeadWarmthMax3
Armor[] ArmorCustomHeadWarmthMax4

Armor[] ArmorCustomFeetWarmthPoor1
Armor[] ArmorCustomFeetWarmthPoor2
Armor[] ArmorCustomFeetWarmthPoor3
Armor[] ArmorCustomFeetWarmthPoor4
Armor[] ArmorCustomFeetWarmthFair1
Armor[] ArmorCustomFeetWarmthFair2
Armor[] ArmorCustomFeetWarmthFair3
Armor[] ArmorCustomFeetWarmthFair4
Armor[] ArmorCustomFeetWarmthGood1
Armor[] ArmorCustomFeetWarmthGood2
Armor[] ArmorCustomFeetWarmthGood3
Armor[] ArmorCustomFeetWarmthGood4
Armor[] ArmorCustomFeetWarmthExcellent1
Armor[] ArmorCustomFeetWarmthExcellent2
Armor[] ArmorCustomFeetWarmthExcellent3
Armor[] ArmorCustomFeetWarmthExcellent4
Armor[] ArmorCustomFeetWarmthMax1
Armor[] ArmorCustomFeetWarmthMax2
Armor[] ArmorCustomFeetWarmthMax3
Armor[] ArmorCustomFeetWarmthMax4

Armor[] ArmorCustomBodyCoveragePoor1
Armor[] ArmorCustomBodyCoveragePoor2
Armor[] ArmorCustomBodyCoveragePoor3
Armor[] ArmorCustomBodyCoveragePoor4
Armor[] ArmorCustomBodyCoverageFair1
Armor[] ArmorCustomBodyCoverageFair2
Armor[] ArmorCustomBodyCoverageFair3
Armor[] ArmorCustomBodyCoverageFair4
Armor[] ArmorCustomBodyCoverageGood1
Armor[] ArmorCustomBodyCoverageGood2
Armor[] ArmorCustomBodyCoverageGood3
Armor[] ArmorCustomBodyCoverageGood4
Armor[] ArmorCustomBodyCoverageExcellent1
Armor[] ArmorCustomBodyCoverageExcellent2
Armor[] ArmorCustomBodyCoverageExcellent3
Armor[] ArmorCustomBodyCoverageExcellent4
Armor[] ArmorCustomBodyCoverageMax1
Armor[] ArmorCustomBodyCoverageMax2
Armor[] ArmorCustomBodyCoverageMax3
Armor[] ArmorCustomBodyCoverageMax4

Armor[] ArmorCustomHandsCoveragePoor1
Armor[] ArmorCustomHandsCoveragePoor2
Armor[] ArmorCustomHandsCoveragePoor3
Armor[] ArmorCustomHandsCoveragePoor4
Armor[] ArmorCustomHandsCoverageFair1
Armor[] ArmorCustomHandsCoverageFair2
Armor[] ArmorCustomHandsCoverageFair3
Armor[] ArmorCustomHandsCoverageFair4
Armor[] ArmorCustomHandsCoverageGood1
Armor[] ArmorCustomHandsCoverageGood2
Armor[] ArmorCustomHandsCoverageGood3
Armor[] ArmorCustomHandsCoverageGood4
Armor[] ArmorCustomHandsCoverageExcellent1
Armor[] ArmorCustomHandsCoverageExcellent2
Armor[] ArmorCustomHandsCoverageExcellent3
Armor[] ArmorCustomHandsCoverageExcellent4
Armor[] ArmorCustomHandsCoverageMax1
Armor[] ArmorCustomHandsCoverageMax2
Armor[] ArmorCustomHandsCoverageMax3
Armor[] ArmorCustomHandsCoverageMax4

Armor[] ArmorCustomHeadCoveragePoor1
Armor[] ArmorCustomHeadCoveragePoor2
Armor[] ArmorCustomHeadCoveragePoor3
Armor[] ArmorCustomHeadCoveragePoor4
Armor[] ArmorCustomHeadCoverageFair1
Armor[] ArmorCustomHeadCoverageFair2
Armor[] ArmorCustomHeadCoverageFair3
Armor[] ArmorCustomHeadCoverageFair4
Armor[] ArmorCustomHeadCoverageGood1
Armor[] ArmorCustomHeadCoverageGood2
Armor[] ArmorCustomHeadCoverageGood3
Armor[] ArmorCustomHeadCoverageGood4
Armor[] ArmorCustomHeadCoverageExcellent1
Armor[] ArmorCustomHeadCoverageExcellent2
Armor[] ArmorCustomHeadCoverageExcellent3
Armor[] ArmorCustomHeadCoverageExcellent4
Armor[] ArmorCustomHeadCoverageMax1
Armor[] ArmorCustomHeadCoverageMax2
Armor[] ArmorCustomHeadCoverageMax3
Armor[] ArmorCustomHeadCoverageMax4

Armor[] ArmorCustomFeetCoveragePoor1
Armor[] ArmorCustomFeetCoveragePoor2
Armor[] ArmorCustomFeetCoveragePoor3
Armor[] ArmorCustomFeetCoveragePoor4
Armor[] ArmorCustomFeetCoverageFair1
Armor[] ArmorCustomFeetCoverageFair2
Armor[] ArmorCustomFeetCoverageFair3
Armor[] ArmorCustomFeetCoverageFair4
Armor[] ArmorCustomFeetCoverageGood1
Armor[] ArmorCustomFeetCoverageGood2
Armor[] ArmorCustomFeetCoverageGood3
Armor[] ArmorCustomFeetCoverageGood4
Armor[] ArmorCustomFeetCoverageExcellent1
Armor[] ArmorCustomFeetCoverageExcellent2
Armor[] ArmorCustomFeetCoverageExcellent3
Armor[] ArmorCustomFeetCoverageExcellent4
Armor[] ArmorCustomFeetCoverageMax1
Armor[] ArmorCustomFeetCoverageMax2
Armor[] ArmorCustomFeetCoverageMax3
Armor[] ArmorCustomFeetCoverageMax4

Armor[] ArmorCustomAccessoryWarm1
Armor[] ArmorCustomAccessoryWarm2
Armor[] ArmorCustomAccessoryWarm3
Armor[] ArmorCustomAccessoryWarm4

Armor[] ArmorCustomAccessoryWeatherproof1
Armor[] ArmorCustomAccessoryWeatherproof2
Armor[] ArmorCustomAccessoryWeatherproof3
Armor[] ArmorCustomAccessoryWeatherproof4

Armor[] ArmorCustomCloakCloth1
Armor[] ArmorCustomCloakCloth2
Armor[] ArmorCustomCloakCloth3
Armor[] ArmorCustomCloakCloth4

Armor[] ArmorCustomCloakLeather1
Armor[] ArmorCustomCloakLeather2
Armor[] ArmorCustomCloakLeather3
Armor[] ArmorCustomCloakLeather4

Armor[] ArmorCustomCloakFur1
Armor[] ArmorCustomCloakFur2
Armor[] ArmorCustomCloakFur3
Armor[] ArmorCustomCloakFur4

Armor[] ArmorCustomIgnore1
Armor[] ArmorCustomIgnore2
Armor[] ArmorCustomIgnore3
Armor[] ArmorCustomIgnore4

function InitializeDatastore()
	InitializeArrays()
	InitializeCustomArrays()
	_Frost_DatastoreInitialized.SetValueInt(2)
endFunction

function PopulateDefaultArmorData()	
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

function InitializeCustomArrays()
	ArmorCustomBodyWarmthPoor1 = new Armor[128]
	ArmorCustomBodyWarmthPoor2 = new Armor[128]
	ArmorCustomBodyWarmthPoor3 = new Armor[128]
	ArmorCustomBodyWarmthPoor4 = new Armor[128]
	ArmorCustomBodyWarmthGood1 = new Armor[128]
	ArmorCustomBodyWarmthGood2 = new Armor[128]
	ArmorCustomBodyWarmthGood3 = new Armor[128]
	ArmorCustomBodyWarmthGood4 = new Armor[128]
	ArmorCustomBodyWarmthExcellent1 = new Armor[128]
	ArmorCustomBodyWarmthExcellent2 = new Armor[128]
	ArmorCustomBodyWarmthExcellent3 = new Armor[128]
	ArmorCustomBodyWarmthExcellent4 = new Armor[128]
	ArmorCustomBodyWarmthMax1 = new Armor[128]
	ArmorCustomBodyWarmthMax2 = new Armor[128]
	ArmorCustomBodyWarmthMax3 = new Armor[128]
	ArmorCustomBodyWarmthMax4 = new Armor[128]
	ArmorCustomHandsWarmthPoor1 = new Armor[128]
	ArmorCustomHandsWarmthPoor2 = new Armor[128]
	ArmorCustomHandsWarmthPoor3 = new Armor[128]
	ArmorCustomHandsWarmthPoor4 = new Armor[128]
	ArmorCustomHandsWarmthGood1 = new Armor[128]
	ArmorCustomHandsWarmthGood2 = new Armor[128]
	ArmorCustomHandsWarmthGood3 = new Armor[128]
	ArmorCustomHandsWarmthGood4 = new Armor[128]
	ArmorCustomHandsWarmthExcellent1 = new Armor[128]
	ArmorCustomHandsWarmthExcellent2 = new Armor[128]
	ArmorCustomHandsWarmthExcellent3 = new Armor[128]
	ArmorCustomHandsWarmthExcellent4 = new Armor[128]
	ArmorCustomHandsWarmthMax1 = new Armor[128]
	ArmorCustomHandsWarmthMax2 = new Armor[128]
	ArmorCustomHandsWarmthMax3 = new Armor[128]
	ArmorCustomHandsWarmthMax4 = new Armor[128]
	ArmorCustomHeadWarmthPoor1 = new Armor[128]
	ArmorCustomHeadWarmthPoor2 = new Armor[128]
	ArmorCustomHeadWarmthPoor3 = new Armor[128]
	ArmorCustomHeadWarmthPoor4 = new Armor[128]
	ArmorCustomHeadWarmthGood1 = new Armor[128]
	ArmorCustomHeadWarmthGood2 = new Armor[128]
	ArmorCustomHeadWarmthGood3 = new Armor[128]
	ArmorCustomHeadWarmthGood4 = new Armor[128]
	ArmorCustomHeadWarmthExcellent1 = new Armor[128]
	ArmorCustomHeadWarmthExcellent2 = new Armor[128]
	ArmorCustomHeadWarmthExcellent3 = new Armor[128]
	ArmorCustomHeadWarmthExcellent4 = new Armor[128]
	ArmorCustomHeadWarmthMax1 = new Armor[128]
	ArmorCustomHeadWarmthMax2 = new Armor[128]
	ArmorCustomHeadWarmthMax3 = new Armor[128]
	ArmorCustomHeadWarmthMax4 = new Armor[128]
	ArmorCustomFeetWarmthPoor1 = new Armor[128]
	ArmorCustomFeetWarmthPoor2 = new Armor[128]
	ArmorCustomFeetWarmthPoor3 = new Armor[128]
	ArmorCustomFeetWarmthPoor4 = new Armor[128]
	ArmorCustomFeetWarmthGood1 = new Armor[128]
	ArmorCustomFeetWarmthGood2 = new Armor[128]
	ArmorCustomFeetWarmthGood3 = new Armor[128]
	ArmorCustomFeetWarmthGood4 = new Armor[128]
	ArmorCustomFeetWarmthExcellent1 = new Armor[128]
	ArmorCustomFeetWarmthExcellent2 = new Armor[128]
	ArmorCustomFeetWarmthExcellent3 = new Armor[128]
	ArmorCustomFeetWarmthExcellent4 = new Armor[128]
	ArmorCustomFeetWarmthMax1 = new Armor[128]
	ArmorCustomFeetWarmthMax2 = new Armor[128]
	ArmorCustomFeetWarmthMax3 = new Armor[128]
	ArmorCustomFeetWarmthMax4 = new Armor[128]
	ArmorCustomBodyCoveragePoor1 = new Armor[128]
	ArmorCustomBodyCoveragePoor2 = new Armor[128]
	ArmorCustomBodyCoveragePoor3 = new Armor[128]
	ArmorCustomBodyCoveragePoor4 = new Armor[128]
	ArmorCustomBodyCoverageGood1 = new Armor[128]
	ArmorCustomBodyCoverageGood2 = new Armor[128]
	ArmorCustomBodyCoverageGood3 = new Armor[128]
	ArmorCustomBodyCoverageGood4 = new Armor[128]
	ArmorCustomBodyCoverageExcellent1 = new Armor[128]
	ArmorCustomBodyCoverageExcellent2 = new Armor[128]
	ArmorCustomBodyCoverageExcellent3 = new Armor[128]
	ArmorCustomBodyCoverageExcellent4 = new Armor[128]
	ArmorCustomBodyCoverageMax1 = new Armor[128]
	ArmorCustomBodyCoverageMax2 = new Armor[128]
	ArmorCustomBodyCoverageMax3 = new Armor[128]
	ArmorCustomBodyCoverageMax4 = new Armor[128]
	ArmorCustomHandsCoveragePoor1 = new Armor[128]
	ArmorCustomHandsCoveragePoor2 = new Armor[128]
	ArmorCustomHandsCoveragePoor3 = new Armor[128]
	ArmorCustomHandsCoveragePoor4 = new Armor[128]
	ArmorCustomHandsCoverageGood1 = new Armor[128]
	ArmorCustomHandsCoverageGood2 = new Armor[128]
	ArmorCustomHandsCoverageGood3 = new Armor[128]
	ArmorCustomHandsCoverageGood4 = new Armor[128]
	ArmorCustomHandsCoverageExcellent1 = new Armor[128]
	ArmorCustomHandsCoverageExcellent2 = new Armor[128]
	ArmorCustomHandsCoverageExcellent3 = new Armor[128]
	ArmorCustomHandsCoverageExcellent4 = new Armor[128]
	ArmorCustomHandsCoverageMax1 = new Armor[128]
	ArmorCustomHandsCoverageMax2 = new Armor[128]
	ArmorCustomHandsCoverageMax3 = new Armor[128]
	ArmorCustomHandsCoverageMax4 = new Armor[128]
	ArmorCustomHeadCoveragePoor1 = new Armor[128]
	ArmorCustomHeadCoveragePoor2 = new Armor[128]
	ArmorCustomHeadCoveragePoor3 = new Armor[128]
	ArmorCustomHeadCoveragePoor4 = new Armor[128]
	ArmorCustomHeadCoverageGood1 = new Armor[128]
	ArmorCustomHeadCoverageGood2 = new Armor[128]
	ArmorCustomHeadCoverageGood3 = new Armor[128]
	ArmorCustomHeadCoverageGood4 = new Armor[128]
	ArmorCustomHeadCoverageExcellent1 = new Armor[128]
	ArmorCustomHeadCoverageExcellent2 = new Armor[128]
	ArmorCustomHeadCoverageExcellent3 = new Armor[128]
	ArmorCustomHeadCoverageExcellent4 = new Armor[128]
	ArmorCustomHeadCoverageMax1 = new Armor[128]
	ArmorCustomHeadCoverageMax2 = new Armor[128]
	ArmorCustomHeadCoverageMax3 = new Armor[128]
	ArmorCustomHeadCoverageMax4 = new Armor[128]
	ArmorCustomFeetCoveragePoor1 = new Armor[128]
	ArmorCustomFeetCoveragePoor2 = new Armor[128]
	ArmorCustomFeetCoveragePoor3 = new Armor[128]
	ArmorCustomFeetCoveragePoor4 = new Armor[128]
	ArmorCustomFeetCoverageGood1 = new Armor[128]
	ArmorCustomFeetCoverageGood2 = new Armor[128]
	ArmorCustomFeetCoverageGood3 = new Armor[128]
	ArmorCustomFeetCoverageGood4 = new Armor[128]
	ArmorCustomFeetCoverageExcellent1 = new Armor[128]
	ArmorCustomFeetCoverageExcellent2 = new Armor[128]
	ArmorCustomFeetCoverageExcellent3 = new Armor[128]
	ArmorCustomFeetCoverageExcellent4 = new Armor[128]
	ArmorCustomFeetCoverageMax1 = new Armor[128]
	ArmorCustomFeetCoverageMax2 = new Armor[128]
	ArmorCustomFeetCoverageMax3 = new Armor[128]
	ArmorCustomFeetCoverageMax4 = new Armor[128]
	ArmorCustomAccessoryWarm1 = new Armor[128]
	ArmorCustomAccessoryWarm2 = new Armor[128]
	ArmorCustomAccessoryWarm3 = new Armor[128]
	ArmorCustomAccessoryWarm4 = new Armor[128]
	ArmorCustomAccessoryWeatherproof1 = new Armor[128]
	ArmorCustomAccessoryWeatherproof2 = new Armor[128]
	ArmorCustomAccessoryWeatherproof3 = new Armor[128]
	ArmorCustomAccessoryWeatherproof4 = new Armor[128]
	ArmorCustomCloakCloth1 = new Armor[128]
	ArmorCustomCloakCloth2 = new Armor[128]
	ArmorCustomCloakCloth3 = new Armor[128]
	ArmorCustomCloakCloth4 = new Armor[128]
	ArmorCustomCloakLeather1 = new Armor[128]
	ArmorCustomCloakLeather2 = new Armor[128]
	ArmorCustomCloakLeather3 = new Armor[128]
	ArmorCustomCloakLeather4 = new Armor[128]
	ArmorCustomCloakFur1 = new Armor[128]
	ArmorCustomCloakFur2 = new Armor[128]
	ArmorCustomCloakFur3 = new Armor[128]
	ArmorCustomCloakFur4 = new Armor[128]

	ArmorCustomBodyWarmthFair1 = new Armor[128]
	ArmorCustomBodyWarmthFair2 = new Armor[128]
	ArmorCustomBodyWarmthFair3 = new Armor[128]
	ArmorCustomBodyWarmthFair4 = new Armor[128]
	ArmorCustomHandsWarmthFair1 = new Armor[128]
	ArmorCustomHandsWarmthFair2 = new Armor[128]
	ArmorCustomHandsWarmthFair3 = new Armor[128]
	ArmorCustomHandsWarmthFair4 = new Armor[128]
	ArmorCustomHeadWarmthFair1 = new Armor[128]
	ArmorCustomHeadWarmthFair2 = new Armor[128]
	ArmorCustomHeadWarmthFair3 = new Armor[128]
	ArmorCustomHeadWarmthFair4 = new Armor[128]
	ArmorCustomFeetWarmthFair1 = new Armor[128]
	ArmorCustomFeetWarmthFair2 = new Armor[128]
	ArmorCustomFeetWarmthFair3 = new Armor[128]
	ArmorCustomFeetWarmthFair4 = new Armor[128]
	ArmorCustomBodyCoverageFair1 = new Armor[128]
	ArmorCustomBodyCoverageFair2 = new Armor[128]
	ArmorCustomBodyCoverageFair3 = new Armor[128]
	ArmorCustomBodyCoverageFair4 = new Armor[128]
	ArmorCustomHandsCoverageFair1 = new Armor[128]
	ArmorCustomHandsCoverageFair2 = new Armor[128]
	ArmorCustomHandsCoverageFair3 = new Armor[128]
	ArmorCustomHandsCoverageFair4 = new Armor[128]
	ArmorCustomHeadCoverageFair1 = new Armor[128]
	ArmorCustomHeadCoverageFair2 = new Armor[128]
	ArmorCustomHeadCoverageFair3 = new Armor[128]
	ArmorCustomHeadCoverageFair4 = new Armor[128]
	ArmorCustomFeetCoverageFair1 = new Armor[128]
	ArmorCustomFeetCoverageFair2 = new Armor[128]
	ArmorCustomFeetCoverageFair3 = new Armor[128]
	ArmorCustomFeetCoverageFair4 = new Armor[128]

	ArmorCustomIgnore1 = new Armor[128]
	ArmorCustomIgnore2 = new Armor[128]
	ArmorCustomIgnore3 = new Armor[128]
	ArmorCustomIgnore4 = new Armor[128]
endFunction

function SetDefaults_Body()
	SetDefaultArmorData(80145, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorHideCuirass
	SetDefaultArmorData(1101736, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassAlteration01
	SetDefaultArmorData(1101737, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassAlteration02
	SetDefaultArmorData(1101738, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassAlteration03
	SetDefaultArmorData(1101739, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassConjuration01
	SetDefaultArmorData(1101740, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassConjuration02
	SetDefaultArmorData(1101741, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassConjuration03
	SetDefaultArmorData(1101742, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassDestruction01
	SetDefaultArmorData(1101743, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassDestruction02
	SetDefaultArmorData(1101744, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassDestruction03
	SetDefaultArmorData(500027, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassHealth01
	SetDefaultArmorData(709777, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassHealth02
	SetDefaultArmorData(709778, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassHealth03
	SetDefaultArmorData(1101745, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassIllusion01
	SetDefaultArmorData(1101746, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassIllusion02
	SetDefaultArmorData(1101747, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassIllusion03
	SetDefaultArmorData(500028, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassLightArmor01
	SetDefaultArmorData(709780, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassLightArmor02
	SetDefaultArmorData(709781, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassLightArmor03
	SetDefaultArmorData(1101748, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassRestoration01
	SetDefaultArmorData(1101749, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassRestoration02
	SetDefaultArmorData(1101750, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideCuirassRestoration03
	SetDefaultArmorData(1071435, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorBanditCuirass1 		;Shirtless
	SetDefaultArmorData(1071437, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorBanditCuirass2 		;Shirtless / shawl
	SetDefaultArmorData(111522, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorStuddedCuirass
	SetDefaultArmorData(707731, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassHealth01
	SetDefaultArmorData(709843, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassHealth02
	SetDefaultArmorData(709844, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassHealth03
	SetDefaultArmorData(707732, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassLightArmor01
	SetDefaultArmorData(709845, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassLightArmor02
	SetDefaultArmorData(709846, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorStuddedCuirassLightArmor03
	SetDefaultArmorData(77385, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorIronCuirass
	SetDefaultArmorData(1101752, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassAlteration01
	SetDefaultArmorData(1101753, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassAlteration02
	SetDefaultArmorData(1101755, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassAlteration03
	SetDefaultArmorData(1101754, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronArmorAlteration03
	SetDefaultArmorData(1101756, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassConjuration01
	SetDefaultArmorData(1101757, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassConjuration02
	SetDefaultArmorData(1101758, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassConjuration03
	SetDefaultArmorData(1101759, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassDestruction01
	SetDefaultArmorData(1101760, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassDestruction02
	SetDefaultArmorData(1101761, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassDestruction03
	SetDefaultArmorData(300302, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHealth01
	SetDefaultArmorData(709987, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHealth02
	SetDefaultArmorData(709988, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHealth03
	SetDefaultArmorData(500008, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHeavyArmor01
	SetDefaultArmorData(709989, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHeavyArmor02
	SetDefaultArmorData(709990, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassHeavyArmor03
	SetDefaultArmorData(1101762, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassIllusion01
	SetDefaultArmorData(1101763, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassIllusion02
	SetDefaultArmorData(1101764, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassIllusion03
	SetDefaultArmorData(1101765, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassRestoration01
	SetDefaultArmorData(1101766, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassRestoration02
	SetDefaultArmorData(1101767, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronCuirassRestoration03
	SetDefaultArmorData(586138, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerRags
	SetDefaultArmorData(248318, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerTunic
	SetDefaultArmorData(962512, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; MS02ForswornArmor
	SetDefaultArmorData(888144, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ForswornCuirass
	SetDefaultArmorData(754635, "Skyrim.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ArmorFalmerCuirass
	SetDefaultArmorData(59883, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerRagsBloody

	SetDefaultArmorData(1071439, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; ArmorBanditCuirass3 	;Sleeveless
	SetDefaultArmorData(221598, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorLeatherCuirass
	SetDefaultArmorData(1105605, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassAlteration01
	SetDefaultArmorData(1105606, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassAlteration02
	SetDefaultArmorData(1105607, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassAlteration03
	SetDefaultArmorData(1105608, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassConjuration01
	SetDefaultArmorData(1105609, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassConjuration02
	SetDefaultArmorData(1105610, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassConjuration03
	SetDefaultArmorData(1105611, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassDestruction01
	SetDefaultArmorData(1105612, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassDestruction02
	SetDefaultArmorData(1105613, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassDestruction03
	SetDefaultArmorData(737844, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassHealth01
	SetDefaultArmorData(737845, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassHealth02
	SetDefaultArmorData(737846, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassHealth03
	SetDefaultArmorData(1105614, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassIllusion01
	SetDefaultArmorData(1105615, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassIllusion02
	SetDefaultArmorData(1105616, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassIllusion03
	SetDefaultArmorData(737847, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassLightArmor01
	SetDefaultArmorData(737848, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassLightArmor02
	SetDefaultArmorData(737849, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassLightArmor03
	SetDefaultArmorData(1105617, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassRestoration01
	SetDefaultArmorData(1105618, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassRestoration02
	SetDefaultArmorData(1105619, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; EnchArmorLeatherCuirassRestoration03
	SetDefaultArmorData(562851, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorElvenCuirass
	SetDefaultArmorData(1072914, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorElvenLightCuirass
	SetDefaultArmorData(80170, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorElvenGildedCuirass
	SetDefaultArmorData(1101690, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassAlteration02
	SetDefaultArmorData(1101691, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassAlteration03
	SetDefaultArmorData(1101692, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassAlteration04
	SetDefaultArmorData(1101693, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassConjuration02
	SetDefaultArmorData(1101694, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassConjuration03
	SetDefaultArmorData(1101695, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassConjuration04
	SetDefaultArmorData(1101696, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassDestruction02
	SetDefaultArmorData(1101697, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassDestruction03
	SetDefaultArmorData(1101698, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassDestruction04
	SetDefaultArmorData(778180, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassHealth02
	SetDefaultArmorData(778181, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassHealth03
	SetDefaultArmorData(778301, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassHealth04
	SetDefaultArmorData(1101699, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassIllusion02
	SetDefaultArmorData(1101700, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassIllusion03
	SetDefaultArmorData(1101701, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassIllusion04
	SetDefaultArmorData(778182, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassLightArmor02
	SetDefaultArmorData(778183, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassLightArmor03
	SetDefaultArmorData(778302, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassLightArmor04
	SetDefaultArmorData(1101702, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassRestoration02
	SetDefaultArmorData(1101703, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassRestoration03
	SetDefaultArmorData(1101704, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenCuirassRestoration04
	SetDefaultArmorData(1101705, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassAlteration03
	SetDefaultArmorData(1101706, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassAlteration04
	SetDefaultArmorData(1101715, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassAlteration05
	SetDefaultArmorData(1101707, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassConjuration03
	SetDefaultArmorData(1101708, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassConjuration04
	SetDefaultArmorData(1101716, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassConjuration05
	SetDefaultArmorData(1101709, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassDestruction03
	SetDefaultArmorData(1101710, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassDestruction04
	SetDefaultArmorData(1101717, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassDestruction05
	SetDefaultArmorData(1038874, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealRate03
	SetDefaultArmorData(1038875, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealRate04
	SetDefaultArmorData(1038876, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealRate05
	SetDefaultArmorData(844205, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealth03
	SetDefaultArmorData(844206, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealth04
	SetDefaultArmorData(844207, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassHealth05
	SetDefaultArmorData(1101711, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassIllusion03
	SetDefaultArmorData(1101712, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassIllusion04
	SetDefaultArmorData(1101718, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassIllusion05
	SetDefaultArmorData(844208, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassLightArmor03
	SetDefaultArmorData(844209, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassLightArmor04
	SetDefaultArmorData(844210, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassLightArmor05
	SetDefaultArmorData(1101713, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassRestoration03
	SetDefaultArmorData(1101714, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassRestoration04
	SetDefaultArmorData(1101719, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassRestoration05
	SetDefaultArmorData(1038877, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassStaminaRate03
	SetDefaultArmorData(1038878, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassStaminaRate04
	SetDefaultArmorData(1038879, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorElvenGildedCuirassStaminaRate05
	SetDefaultArmorData(111523, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; ArmorScaledCuirass
	SetDefaultArmorData(111524, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorScaledCuirassB
	SetDefaultArmorData(1105635, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassAlteration02
	SetDefaultArmorData(1105636, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassAlteration03
	SetDefaultArmorData(1105637, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassAlteration04
	SetDefaultArmorData(1105638, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassConjuration02
	SetDefaultArmorData(1105639, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassConjuration03
	SetDefaultArmorData(1105640, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassConjuration04
	SetDefaultArmorData(1105641, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassDestruction02
	SetDefaultArmorData(1105642, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassDestruction03
	SetDefaultArmorData(1105643, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassDestruction04
	SetDefaultArmorData(873461, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassHealth02
	SetDefaultArmorData(873462, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassHealth03
	SetDefaultArmorData(873463, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassHealth04
	SetDefaultArmorData(1105644, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassIllusion02
	SetDefaultArmorData(1105645, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassIllusion03
	SetDefaultArmorData(1105646, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassIllusion04
	SetDefaultArmorData(873464, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassLightArmor02
	SetDefaultArmorData(873465, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassLightArmor03
	SetDefaultArmorData(873466, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassLightArmor04
	SetDefaultArmorData(1105647, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassRestoration02
	SetDefaultArmorData(1105648, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassRestoration03
	SetDefaultArmorData(1105649, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledCuirassRestoration04
	SetDefaultArmorData(80185, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorGlassCuirass
	SetDefaultArmorData(1101720, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassAlteration03
	SetDefaultArmorData(1101721, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassAlteration04
	SetDefaultArmorData(1101722, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassAlteration05
	SetDefaultArmorData(1101723, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassConjuration03
	SetDefaultArmorData(1101724, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassConjuration04
	SetDefaultArmorData(1101725, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassConjuration05
	SetDefaultArmorData(1101726, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassDestruction03
	SetDefaultArmorData(1101728, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassDestruction04
	SetDefaultArmorData(1101729, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassDestruction05
	SetDefaultArmorData(1041111, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealRate03
	SetDefaultArmorData(1041112, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealRate04
	SetDefaultArmorData(1041113, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealRate05
	SetDefaultArmorData(873345, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealth03
	SetDefaultArmorData(873346, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealth04
	SetDefaultArmorData(873347, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassHealth05
	SetDefaultArmorData(1101730, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassIllusion03
	SetDefaultArmorData(1101731, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassIllusion04
	SetDefaultArmorData(1101732, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassIllusion05
	SetDefaultArmorData(873348, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassLightArmor03
	SetDefaultArmorData(873349, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassLightArmor04
	SetDefaultArmorData(873350, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassLightArmor05
	SetDefaultArmorData(1101733, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassRestoration03
	SetDefaultArmorData(1101734, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassRestoration04
	SetDefaultArmorData(1101735, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassRestoration05
	SetDefaultArmorData(1041116, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassStaminaRate03
	SetDefaultArmorData(1041117, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassStaminaRate04
	SetDefaultArmorData(1041118, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassCuirassStaminaRate05
	SetDefaultArmorData(1101727, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorGlassVsDestruction04
	SetDefaultArmorData(80200, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; ArmorIronBandedCuirass
	SetDefaultArmorData(1101768, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassAlteration01
	SetDefaultArmorData(1101769, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassAlteration02
	SetDefaultArmorData(1101770, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassAlteration03
	SetDefaultArmorData(1101771, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassConjuration01
	SetDefaultArmorData(1101772, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassConjuration02
	SetDefaultArmorData(1101773, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassConjuration03
	SetDefaultArmorData(1101774, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassDestruction01
	SetDefaultArmorData(1101775, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassDestruction02
	SetDefaultArmorData(1101776, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassDestruction03
	SetDefaultArmorData(707741, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHealth01
	SetDefaultArmorData(709919, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHealth02
	SetDefaultArmorData(709920, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHealth03
	SetDefaultArmorData(707742, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHeavyArmor01
	SetDefaultArmorData(709921, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHeavyArmor02
	SetDefaultArmorData(709922, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassHeavyArmor03
	SetDefaultArmorData(1101777, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassIllusion01
	SetDefaultArmorData(1101778, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassIllusion02
	SetDefaultArmorData(1101779, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassIllusion03
	SetDefaultArmorData(1101780, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassRestoration01
	SetDefaultArmorData(1101781, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassRestoration02
	SetDefaultArmorData(1101782, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorIronBandedCuirassRestoration03
	SetDefaultArmorData(80210, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorSteelCuirassA
	SetDefaultArmorData(1011490, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorSteelCuirassB
	SetDefaultArmorData(1105650, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassAlteration01
	SetDefaultArmorData(1105651, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassAlteration02
	SetDefaultArmorData(1105652, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassAlteration03
	SetDefaultArmorData(1105653, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassConjuration01
	SetDefaultArmorData(1105654, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassConjuration02
	SetDefaultArmorData(1105655, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassConjuration03
	SetDefaultArmorData(1105656, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassDestruction01
	SetDefaultArmorData(1105657, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassDestruction02
	SetDefaultArmorData(1105658, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassDestruction03
	SetDefaultArmorData(741541, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHealth01
	SetDefaultArmorData(741542, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHealth02
	SetDefaultArmorData(741543, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHealth03
	SetDefaultArmorData(741544, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHeavyArmor01
	SetDefaultArmorData(741545, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHeavyArmor02
	SetDefaultArmorData(741546, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassHeavyArmor03
	SetDefaultArmorData(1105659, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassIllusion01
	SetDefaultArmorData(1105660, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassIllusion02
	SetDefaultArmorData(1105661, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassIllusion03
	SetDefaultArmorData(1105662, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassRestoration01
	SetDefaultArmorData(1105663, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassRestoration02
	SetDefaultArmorData(1105664, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelCuirassRestoration03
	SetDefaultArmorData(80220, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorSteelPlateCuirass
	SetDefaultArmorData(1105665, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassAlteration02
	SetDefaultArmorData(1105666, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassAlteration03
	SetDefaultArmorData(1105667, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassAlteration04
	SetDefaultArmorData(1105668, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassConjuration02
	SetDefaultArmorData(1105669, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassConjuration03
	SetDefaultArmorData(1105670, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassConjuration04
	SetDefaultArmorData(1105671, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassDestruction02
	SetDefaultArmorData(1105672, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassDestruction03
	SetDefaultArmorData(1105673, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassDestruction04
	SetDefaultArmorData(111628, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHealth02
	SetDefaultArmorData(111629, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHealth03
	SetDefaultArmorData(111630, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHealth04
	SetDefaultArmorData(111686, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHeavyArmor02
	SetDefaultArmorData(111950, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHeavyArmor03
	SetDefaultArmorData(111957, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassHeavyArmor04
	SetDefaultArmorData(1105674, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassIllusion02
	SetDefaultArmorData(1105675, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassIllusion03
	SetDefaultArmorData(1105676, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassIllusion04
	SetDefaultArmorData(1105677, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassRestoration02
	SetDefaultArmorData(1105678, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassRestoration03
	SetDefaultArmorData(1105679, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorSteelPlateCuirassRestoration04
	SetDefaultArmorData(307851, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorBladesCuirass
	SetDefaultArmorData(1108827, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; DBArmorWornPlayable
	SetDefaultArmorData(99208, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; ArmorDraugrCuirass
	SetDefaultArmorData(136478, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassFalkreath
	SetDefaultArmorData(136480, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassHjaalmarch
	SetDefaultArmorData(136456, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassMarkarth
	SetDefaultArmorData(136455, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassRiften
	SetDefaultArmorData(819035, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassSolitude
	SetDefaultArmorData(136485, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassThePale
	SetDefaultArmorData(136461, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassWhiterun
	SetDefaultArmorData(136482, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGuardCuirassWinterhold
	SetDefaultArmorData(683387, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorStormcloakCuirass
	SetDefaultArmorData(710048, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorStormcloakCuirassSleeves
	SetDefaultArmorData(79573, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorImperialCuirass
	SetDefaultArmorData(81625, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorImperialLightCuirass
	SetDefaultArmorData(81624, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorImperialStuddedCuirass
	SetDefaultArmorData(707776, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHealth01
	SetDefaultArmorData(709865, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHealth02
	SetDefaultArmorData(709866, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHealth03
	SetDefaultArmorData(707777, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHeavyArmor01
	SetDefaultArmorData(709867, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHeavyArmor02
	SetDefaultArmorData(709868, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassHeavyArmor03
	SetDefaultArmorData(709872, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialCuirassResistFrost03
	SetDefaultArmorData(759580, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassHealth01
	SetDefaultArmorData(759581, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassHealth02
	SetDefaultArmorData(759582, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassHealth03
	SetDefaultArmorData(759583, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassLightArmor01
	SetDefaultArmorData(759584, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassLightArmor02
	SetDefaultArmorData(759585, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialLightCuirassLightArmor03
	SetDefaultArmorData(289716, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassHealth01
	SetDefaultArmorData(289717, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassHealth02
	SetDefaultArmorData(289718, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassHealth03
	SetDefaultArmorData(289719, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassLightArmor01
	SetDefaultArmorData(289720, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassLightArmor02
	SetDefaultArmorData(289721, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorImperialStuddedCuirassLightArmor03
	SetDefaultArmorData(867011, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; ArmorThievesGuildCuirassPlayer
	SetDefaultArmorData(1082692, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; ArmorLinweCuirass
	SetDefaultArmorData(867020, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; ArmorThievesGuildCuirassPlayerImproved
	SetDefaultArmorData(931287, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; ArmorThievesGuildLeaderCuirass
	SetDefaultArmorData(862276, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; DBArmor
	SetDefaultArmorData(925461, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; DBArmorSP
	SetDefaultArmorData(62455, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassHeavy1
	SetDefaultArmorData(62458, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassHeavy2
	SetDefaultArmorData(62459, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassLight1
	SetDefaultArmorData(62466, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassLight2
	SetDefaultArmorData(62468, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorDawnguardCuirassLight3
	SetDefaultArmorData(59614, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorFalmerHardenedCuirass
	SetDefaultArmorData(9193, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorFalmerHeavyCuirass
	SetDefaultArmorData(82631, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorVampireArmorGray
	SetDefaultArmorData(102898, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorVampireArmorGrayLight
	SetDefaultArmorData(102899, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorVampireArmorRed
	SetDefaultArmorData(84997, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC1LD_ArmorKatria
	SetDefaultArmorData(226660, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldCuirassGuard
	SetDefaultArmorData(226659, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldCuirassVariant01
	SetDefaultArmorData(118163, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldCuirassVariant02
	SetDefaultArmorData(240422, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2ArmorBonemoldImprovedCuirass
	SetDefaultArmorData(165077, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassHealth01
	SetDefaultArmorData(165078, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassHealth02
	SetDefaultArmorData(165079, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassHealth03
	SetDefaultArmorData(165080, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassLightArmor01
	SetDefaultArmorData(165081, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassLightArmor02
	SetDefaultArmorData(165082, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldCuirassLightArmor03
	SetDefaultArmorData(118154, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2ArmorChitinHeavyCuirass
	SetDefaultArmorData(168291, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassAlteration02
	SetDefaultArmorData(168292, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassAlteration03
	SetDefaultArmorData(168293, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassAlteration04
	SetDefaultArmorData(168294, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassConjuration02
	SetDefaultArmorData(168295, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassConjuration03
	SetDefaultArmorData(168296, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassConjuration04
	SetDefaultArmorData(168297, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassDestruction02
	SetDefaultArmorData(168298, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassDestruction03
	SetDefaultArmorData(168299, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassDestruction04
	SetDefaultArmorData(168300, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHealth02
	SetDefaultArmorData(168301, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHealth03
	SetDefaultArmorData(168302, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHealth04
	SetDefaultArmorData(168303, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor02
	SetDefaultArmorData(168304, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor03
	SetDefaultArmorData(168305, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor04
	SetDefaultArmorData(168306, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassIllusion02
	SetDefaultArmorData(168307, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassIllusion03
	SetDefaultArmorData(168308, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassIllusion04
	SetDefaultArmorData(168309, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassRestoration02
	SetDefaultArmorData(168310, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassRestoration03
	SetDefaultArmorData(168311, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinHeavyCuirassRestoration04
	SetDefaultArmorData(118151, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2ArmorChitinLightCuirass
	SetDefaultArmorData(167920, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassAlteration02
	SetDefaultArmorData(167921, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassAlteration03
	SetDefaultArmorData(167922, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassAlteration04
	SetDefaultArmorData(167923, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassConjuration02
	SetDefaultArmorData(167924, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassConjuration03
	SetDefaultArmorData(167925, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassConjuration04
	SetDefaultArmorData(167926, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassDestruction02
	SetDefaultArmorData(167927, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassDestruction03
	SetDefaultArmorData(167928, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassDestruction04
	SetDefaultArmorData(167929, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassHealth02
	SetDefaultArmorData(167934, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassHealth03
	SetDefaultArmorData(167930, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassHealth04
	SetDefaultArmorData(167931, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassLightArmor02
	SetDefaultArmorData(167932, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassLightArmor03
	SetDefaultArmorData(167935, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassLightArmor04
	SetDefaultArmorData(167936, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassRestoration02
	SetDefaultArmorData(167937, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassRestoration03
	SetDefaultArmorData(167938, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2EnchArmorChitinLightCuirassRestoration04
	SetDefaultArmorData(168620, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2MoragTongCuirass
	SetDefaultArmorData(121751, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_POOR) ; DLC2dunKolbjornCuirass
	SetDefaultArmorData(175411, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX) ; DLC2TGArmorVariantCuirass

	SetDefaultArmorData(80190, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; ArmorDragonscaleCuirass
	SetDefaultArmorData(1101646, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassAlteration04
	SetDefaultArmorData(1101647, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassAlteration05
	SetDefaultArmorData(1101648, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassAlteration06
	SetDefaultArmorData(1101649, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassConjuration04
	SetDefaultArmorData(1101650, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassConjuration05
	SetDefaultArmorData(1101651, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassConjuration06
	SetDefaultArmorData(1101652, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassDestruction04
	SetDefaultArmorData(1101653, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassDestruction05
	SetDefaultArmorData(1101654, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassDestruction06
	SetDefaultArmorData(1041120, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealRate04
	SetDefaultArmorData(1041121, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealRate05
	SetDefaultArmorData(1041122, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealRate06
	SetDefaultArmorData(883130, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealth04
	SetDefaultArmorData(883131, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealth05
	SetDefaultArmorData(883132, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassHealth06
	SetDefaultArmorData(1101655, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassIllusion04
	SetDefaultArmorData(1101656, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassIllusion05
	SetDefaultArmorData(1101657, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassIllusion06
	SetDefaultArmorData(883133, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassLightArmor04
	SetDefaultArmorData(883134, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassLightArmor05
	SetDefaultArmorData(883135, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassLightArmor06
	SetDefaultArmorData(1101658, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassRestoration04
	SetDefaultArmorData(1101660, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassRestoration05
	SetDefaultArmorData(1101659, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassRestoration06
	SetDefaultArmorData(1041123, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassStaminaRate04
	SetDefaultArmorData(1041124, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassStaminaRate05
	SetDefaultArmorData(1041125, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonscaleCuirassStaminaRate06
	SetDefaultArmorData(80205, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDwarvenCuirass
	SetDefaultArmorData(1101661, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassAlteration02
	SetDefaultArmorData(571002, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassAlteration03
	SetDefaultArmorData(1101662, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassAlteration04
	SetDefaultArmorData(1101663, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassConjuration02
	SetDefaultArmorData(1101664, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassConjuration03
	SetDefaultArmorData(1101665, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassConjuration04
	SetDefaultArmorData(1101666, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassDestruction02
	SetDefaultArmorData(1101667, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassDestruction03
	SetDefaultArmorData(1101668, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassDestruction04
	SetDefaultArmorData(111576, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHealth02
	SetDefaultArmorData(111577, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHealth03
	SetDefaultArmorData(111578, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHealth04
	SetDefaultArmorData(111579, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHeavyArmor02
	SetDefaultArmorData(111631, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHeavyArmor03
	SetDefaultArmorData(111680, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassHeavyArmor04
	SetDefaultArmorData(1101669, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassIllusion02
	SetDefaultArmorData(1101670, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassIllusion03
	SetDefaultArmorData(1101671, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassIllusion04
	SetDefaultArmorData(1101672, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassRestoration02
	SetDefaultArmorData(1101673, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassRestoration03
	SetDefaultArmorData(1101674, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenCuirassRestoration04
	SetDefaultArmorData(80225, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorEbonyCuirass
	SetDefaultArmorData(1101675, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassAlteration03
	SetDefaultArmorData(1101676, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassAlteration04
	SetDefaultArmorData(1101677, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassAlteration05
	SetDefaultArmorData(1101678, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassConjuration03
	SetDefaultArmorData(1101679, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassConjuration04
	SetDefaultArmorData(1101680, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassConjuration05
	SetDefaultArmorData(1101681, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassDestruction03
	SetDefaultArmorData(1101682, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassDestruction04
	SetDefaultArmorData(1101688, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassDestruction05
	SetDefaultArmorData(849975, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealth03
	SetDefaultArmorData(849976, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealth04
	SetDefaultArmorData(849977, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealth05
	SetDefaultArmorData(1041129, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealthRate03
	SetDefaultArmorData(1041130, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealthRate04
	SetDefaultArmorData(1041131, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHealthRate05
	SetDefaultArmorData(849978, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHeavyArmor03
	SetDefaultArmorData(849979, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHeavyArmor04
	SetDefaultArmorData(849980, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassHeavyArmor05
	SetDefaultArmorData(1101683, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassIllusion03
	SetDefaultArmorData(1101684, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassIllusion04
	SetDefaultArmorData(1101689, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassIllusion05
	SetDefaultArmorData(1101685, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassRestoration03
	SetDefaultArmorData(1101686, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassRestoration04
	SetDefaultArmorData(1101687, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassRestoration05
	SetDefaultArmorData(1041132, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassStaminaRate03
	SetDefaultArmorData(1041133, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassStaminaRate04
	SetDefaultArmorData(1041134, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyCuirassStaminaRate05
	SetDefaultArmorData(80230, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; ArmorDragonplateCuirass
	SetDefaultArmorData(1101631, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassAlteration04
	SetDefaultArmorData(1101644, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassAlteration05
	SetDefaultArmorData(1101632, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassAlteration06
	SetDefaultArmorData(1101633, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassConjuration04
	SetDefaultArmorData(1101634, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassConjuration05
	SetDefaultArmorData(1101635, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassConjuration06
	SetDefaultArmorData(1101636, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassDestruction04
	SetDefaultArmorData(1101645, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassDestruction05
	SetDefaultArmorData(1101637, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassDestruction06
	SetDefaultArmorData(883238, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealth04
	SetDefaultArmorData(883239, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealth05
	SetDefaultArmorData(883240, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealth06
	SetDefaultArmorData(1041141, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealthRate04
	SetDefaultArmorData(1041142, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealthRate05
	SetDefaultArmorData(1041143, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHealthRate06
	SetDefaultArmorData(883241, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHeavyArmor04
	SetDefaultArmorData(883242, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHeavyArmor05
	SetDefaultArmorData(883243, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassHeavyArmor06
	SetDefaultArmorData(1101638, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassIllusion04
	SetDefaultArmorData(1101639, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassIllusion05
	SetDefaultArmorData(1101640, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassIllusion06
	SetDefaultArmorData(1101641, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassRestoration04
	SetDefaultArmorData(1101642, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassRestoration05
	SetDefaultArmorData(1101643, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassRestoration06
	SetDefaultArmorData(1041144, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassStaminaRate04
	SetDefaultArmorData(1041145, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassStaminaRate05
	SetDefaultArmorData(1041146, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_MAX) ; EnchArmorDragonplateCuirassStaminaRate06
	SetDefaultArmorData(80235, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDaedricCuirass
	SetDefaultArmorData(1101616, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassAlteration04
	SetDefaultArmorData(1101617, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassAlteration05
	SetDefaultArmorData(1101618, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassAlteration06
	SetDefaultArmorData(1101619, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassConjuration04
	SetDefaultArmorData(1101620, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassConjuration05
	SetDefaultArmorData(1101621, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassConjuration06
	SetDefaultArmorData(1101622, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassDestruction04
	SetDefaultArmorData(1101623, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassDestruction05
	SetDefaultArmorData(1101624, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassDestruction06
	SetDefaultArmorData(1041150, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealRate04
	SetDefaultArmorData(1041151, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealRate05
	SetDefaultArmorData(1041152, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealRate06
	SetDefaultArmorData(883352, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealth04
	SetDefaultArmorData(883353, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealth05
	SetDefaultArmorData(883354, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHealth06
	SetDefaultArmorData(883355, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHeavyArmor04
	SetDefaultArmorData(883356, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHeavyArmor05
	SetDefaultArmorData(883357, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassHeavyArmor06
	SetDefaultArmorData(1101625, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassIllusion04
	SetDefaultArmorData(1101626, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassIllusion05
	SetDefaultArmorData(1101627, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassIllusion06
	SetDefaultArmorData(1101628, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassRestoration04
	SetDefaultArmorData(1101629, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassRestoration05
	SetDefaultArmorData(1101630, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassRestoration06
	SetDefaultArmorData(1041147, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassStaminaRate04
	SetDefaultArmorData(1041148, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassStaminaRate05
	SetDefaultArmorData(1041149, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDaedricCuirassStaminaRate06
	SetDefaultArmorData(379902, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; GeneralTulliusArmor
	SetDefaultArmorData(868000, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorPenitusCuirass
	SetDefaultArmorData(51222, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; DLC1IvoryCuirass
	SetDefaultArmorData(51923, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_GOOD) ; DLC1IvoryCuirassAlternate
	
	SetDefaultArmorData(80215, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorOrcishCuirass
	SetDefaultArmorData(1105620, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassAlteration03
	SetDefaultArmorData(1105621, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassAlteration04
	SetDefaultArmorData(1105622, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassAlteration05
	SetDefaultArmorData(1105623, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassConjuration03
	SetDefaultArmorData(1105624, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassConjuration04
	SetDefaultArmorData(1105625, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassConjuration05
	SetDefaultArmorData(1105626, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassDestruction03
	SetDefaultArmorData(1105627, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassDestruction04
	SetDefaultArmorData(1105628, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassDestruction05
	SetDefaultArmorData(849858, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHealth03
	SetDefaultArmorData(849859, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHealth04
	SetDefaultArmorData(849860, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHealth05
	SetDefaultArmorData(849861, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHeavyArmor03
	SetDefaultArmorData(849862, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHeavyArmor04
	SetDefaultArmorData(849863, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassHeavyArmor05
	SetDefaultArmorData(1105629, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassIllusion03
	SetDefaultArmorData(1105630, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassIllusion04
	SetDefaultArmorData(1105631, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassIllusion05
	SetDefaultArmorData(1105632, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassRestoration03
	SetDefaultArmorData(1105633, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassRestoration04
	SetDefaultArmorData(1105634, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishCuirassRestoration05
	SetDefaultArmorData(455571, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_POOR) ; ArmorBanditCuirass 		;Full
	SetDefaultArmorData(830997, "Skyrim.esm", GEARTYPE_BODY, WARMTH_EXCELLENT, COVERAGE_GOOD) ; ArmorCompanionsCuirass

	SetDefaultArmorData(118175, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2ArmorStalhrimHeavyCuirass
	SetDefaultArmorData(168460, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration04
	SetDefaultArmorData(168461, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration05
	SetDefaultArmorData(168462, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration06
	SetDefaultArmorData(168463, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration04
	SetDefaultArmorData(168464, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration05
	SetDefaultArmorData(168465, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration06
	SetDefaultArmorData(168466, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction04
	SetDefaultArmorData(168467, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction05
	SetDefaultArmorData(168468, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction06
	SetDefaultArmorData(168469, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealth04
	SetDefaultArmorData(168470, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealth05
	SetDefaultArmorData(168472, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealth06
	SetDefaultArmorData(168473, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate04
	SetDefaultArmorData(168474, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate05
	SetDefaultArmorData(168471, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate06
	SetDefaultArmorData(168475, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor04
	SetDefaultArmorData(168476, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor05
	SetDefaultArmorData(168477, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor06
	SetDefaultArmorData(168478, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion04
	SetDefaultArmorData(168479, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion05
	SetDefaultArmorData(168480, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion06
	SetDefaultArmorData(168481, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration04
	SetDefaultArmorData(168482, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration05
	SetDefaultArmorData(168483, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration06
	SetDefaultArmorData(168484, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate04
	SetDefaultArmorData(168485, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate05
	SetDefaultArmorData(168486, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate06
	SetDefaultArmorData(118178, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2ArmorStalhrimLightCuirass
	SetDefaultArmorData(168101, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassAlteration03
	SetDefaultArmorData(168102, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassAlteration04
	SetDefaultArmorData(168103, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassAlteration05
	SetDefaultArmorData(168104, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassConjuration03
	SetDefaultArmorData(168105, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassConjuration04
	SetDefaultArmorData(168106, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassConjuration05
	SetDefaultArmorData(168107, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassDestruction03
	SetDefaultArmorData(168108, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassDestruction04
	SetDefaultArmorData(168109, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassDestruction05
	SetDefaultArmorData(168110, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealRate03
	SetDefaultArmorData(168111, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealRate04
	SetDefaultArmorData(168112, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealRate05
	SetDefaultArmorData(168113, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealth03
	SetDefaultArmorData(168114, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealth04
	SetDefaultArmorData(168115, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassHealth05
	SetDefaultArmorData(168116, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassIllusion03
	SetDefaultArmorData(168117, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassIllusion04
	SetDefaultArmorData(168118, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassIllusion05
	SetDefaultArmorData(168119, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassLightArmor03
	SetDefaultArmorData(168120, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassLightArmor04
	SetDefaultArmorData(168121, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassLightArmor05
	SetDefaultArmorData(168122, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassRestoration03
	SetDefaultArmorData(168123, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassRestoration04
	SetDefaultArmorData(168124, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassRestoration05
	SetDefaultArmorData(168125, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate03
	SetDefaultArmorData(168126, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate04
	SetDefaultArmorData(168127, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate05
	SetDefaultArmorData(118167, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2ArmorNordicHeavyCuirass
	SetDefaultArmorData(168368, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassAlteration03
	SetDefaultArmorData(168369, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassAlteration04
	SetDefaultArmorData(168370, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassAlteration05
	SetDefaultArmorData(168371, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassConjuration03
	SetDefaultArmorData(168372, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassConjuration04
	SetDefaultArmorData(168373, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassConjuration05
	SetDefaultArmorData(168374, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassDestruction03
	SetDefaultArmorData(168375, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassDestruction04
	SetDefaultArmorData(168376, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassDestruction05
	SetDefaultArmorData(168377, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHealth03
	SetDefaultArmorData(168378, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHealth04
	SetDefaultArmorData(168379, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHealth05
	SetDefaultArmorData(168380, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor03
	SetDefaultArmorData(168381, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor04
	SetDefaultArmorData(168382, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor05
	SetDefaultArmorData(168383, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassIllusion03
	SetDefaultArmorData(168384, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassIllusion04
	SetDefaultArmorData(168385, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassIllusion05
	SetDefaultArmorData(168386, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassRestoration03
	SetDefaultArmorData(168387, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassRestoration04
	SetDefaultArmorData(168388, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyCuirassRestoration05
	SetDefaultArmorData(233742, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ClothesSkaalCoat
	SetDefaultArmorData(118185, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_FAIR) ; DLC2SkaalVillagerOutfit
	SetDefaultArmorData(147483, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_MAX, COVERAGE_EXCELLENT) ; DLC2dunHaknirArmorCuirass


	SetDefaultArmorData(551294, "Skyrim.esm", GEARTYPE_BODY, WARMTH_GOOD, COVERAGE_POOR, aiExtraType = EXTRA_CLOAKFUR) ; ArmorStormcloakBearCuirass 		@MULTI
	SetDefaultArmorData(383878, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer01  @MULTI
	SetDefaultArmorData(1035278, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer02 @MULTI
	SetDefaultArmorData(1035279, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_MAX, aiExtraType = EXTRA_CLOAKLEATHER) ; ArmorNightingaleCuirassPlayer03 @MULTI
	SetDefaultArmorData(46555, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiExtraType = EXTRA_CLOAKLEATHER) ; DLC1ArmorVampireArmorRoyalRed 	@MULTI
	SetDefaultArmorData(103621, "Dawnguard.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiExtraType = EXTRA_CLOAKLEATHER) ; DLC1ArmorVampireArmorValerica	@MULTI
	SetDefaultArmorData(118186, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfit 		@MULTI
	SetDefaultArmorData(225381, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfitBlue	@MULTI
	SetDefaultArmorData(225382, "Dragonborn.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_GOOD, aiHeadCoverageType = COVERAGE_GOOD) ; DLC2DarkElfOutfitRed	@MULTI

	; Robes
	SetDefaultArmorData(0x10F570, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMGRobesArchmage1Hooded
	SetDefaultArmorData(0x10CFE4, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesColorBrownHooded
	SetDefaultArmorData(0x10CFEC, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesColorGreenHooded
	SetDefaultArmorData(0x10CFEA, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesColorGreyHooded
	SetDefaultArmorData(0x10CFEB, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesColorRedHooded
	SetDefaultArmorData(0x107106, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesMonkRobesHooded
	SetDefaultArmorData(0x10710D, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesNecromancerRobesHooded
	SetDefaultArmorData(0x107108, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesRobesBlackHooded
	SetDefaultArmorData(0x10710A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesRobesBlueHooded
	SetDefaultArmorData(0x10C698, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesThalmorRobesHooded
	SetDefaultArmorData(0x10710C, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; ClothesWarlockRobesHooded
	SetDefaultArmorData(0x109008, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration01
	SetDefaultArmorData(0x109009, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration02
	SetDefaultArmorData(0x10900A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration03
	SetDefaultArmorData(0x10900B, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration04
	SetDefaultArmorData(0x10900C, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration05
	SetDefaultArmorData(0x10900D, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedAlteration06
	SetDefaultArmorData(0x10900E, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration01
	SetDefaultArmorData(0x10900F, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration02
	SetDefaultArmorData(0x109010, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration03
	SetDefaultArmorData(0x109011, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration04
	SetDefaultArmorData(0x109012, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration05
	SetDefaultArmorData(0x109013, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedConjuration06
	SetDefaultArmorData(0x109014, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction01
	SetDefaultArmorData(0x109015, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction02
	SetDefaultArmorData(0x109016, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction03
	SetDefaultArmorData(0x109017, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction04
	SetDefaultArmorData(0x109018, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction05
	SetDefaultArmorData(0x109019, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedDestruction06
	SetDefaultArmorData(0x109020, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion01
	SetDefaultArmorData(0x109021, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion02
	SetDefaultArmorData(0x109022, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion03
	SetDefaultArmorData(0x109023, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion04
	SetDefaultArmorData(0x109024, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion05
	SetDefaultArmorData(0x109025, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedIllusion06
	SetDefaultArmorData(0x109048, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedMagickaRate02
	SetDefaultArmorData(0x109047, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedMagickaRate03
	SetDefaultArmorData(0x109046, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedMagickaRate04
	SetDefaultArmorData(0x109045, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedMagickaRate05
	SetDefaultArmorData(0x10902B, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration01
	SetDefaultArmorData(0x10902A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration02
	SetDefaultArmorData(0x109029, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration03
	SetDefaultArmorData(0x109028, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration04
	SetDefaultArmorData(0x109027, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration05
	SetDefaultArmorData(0x109026, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesNecroRobesHoodedRestoration06
	SetDefaultArmorData(0x109049, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration01
	SetDefaultArmorData(0x10904A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration02
	SetDefaultArmorData(0x10904B, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration03
	SetDefaultArmorData(0x10904C, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration04
	SetDefaultArmorData(0x10904D, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration05
	SetDefaultArmorData(0x10904E, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedAlteration06
	SetDefaultArmorData(0x10904F, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration01
	SetDefaultArmorData(0x109050, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration02
	SetDefaultArmorData(0x109051, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration03
	SetDefaultArmorData(0x109052, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration04
	SetDefaultArmorData(0x109053, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration05
	SetDefaultArmorData(0x109054, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedConjuration06
	SetDefaultArmorData(0x109055, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction01
	SetDefaultArmorData(0x109056, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction02
	SetDefaultArmorData(0x109057, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction03
	SetDefaultArmorData(0x109058, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction04
	SetDefaultArmorData(0x109059, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction05
	SetDefaultArmorData(0x10905A, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedDestruction06
	SetDefaultArmorData(0x109089, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion01
	SetDefaultArmorData(0x109088, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion02
	SetDefaultArmorData(0x109087, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion03
	SetDefaultArmorData(0x109086, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion04
	SetDefaultArmorData(0x109085, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion05
	SetDefaultArmorData(0x109084, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedIllusion06
	SetDefaultArmorData(0x109083, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedMagickaRate02
	SetDefaultArmorData(0x109082, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedMagickaRate03
	SetDefaultArmorData(0x109081, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedMagickaRate04
	SetDefaultArmorData(0x109080, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedMagickaRate05
	SetDefaultArmorData(0x109066, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration01
	SetDefaultArmorData(0x109065, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration02
	SetDefaultArmorData(0x109064, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration03
	SetDefaultArmorData(0x109063, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration04
	SetDefaultArmorData(0x109062, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration05
	SetDefaultArmorData(0x109061, "Skyrim.esm", GEARTYPE_BODY, WARMTH_FAIR, COVERAGE_GOOD, aiHeadWarmthType = WARMTH_FAIR, aiHeadCoverageType = COVERAGE_GOOD) ; EnchClothesWarlockRobesHoodedRestoration06
endFunction

function SetDefaults_Head()
	; Poor (0 - 20)
	SetDefaultArmorData(80147, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorHideHelmet
	SetDefaultArmorData(570983, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlchemy01
	SetDefaultArmorData(570984, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlchemy02
	SetDefaultArmorData(570985, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlchemy03
	SetDefaultArmorData(500048, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlteration01
	SetDefaultArmorData(709819, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlteration02
	SetDefaultArmorData(709820, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetAlteration03
	SetDefaultArmorData(500049, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetConjuration01
	SetDefaultArmorData(709821, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetConjuration02
	SetDefaultArmorData(709822, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetConjuration03
	SetDefaultArmorData(500050, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetDestruction01
	SetDefaultArmorData(709823, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetDestruction02
	SetDefaultArmorData(709824, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetDestruction03
	SetDefaultArmorData(500052, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetIllusion01
	SetDefaultArmorData(709827, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetIllusion02
	SetDefaultArmorData(709828, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetIllusion03
	SetDefaultArmorData(500053, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMagicka01
	SetDefaultArmorData(709829, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMagicka02
	SetDefaultArmorData(709830, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMagicka03
	SetDefaultArmorData(500055, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMarksman01
	SetDefaultArmorData(709831, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMarksman02
	SetDefaultArmorData(709832, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetMarksman03
	SetDefaultArmorData(500056, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetRestoration01
	SetDefaultArmorData(709833, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetRestoration02
	SetDefaultArmorData(709834, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideHelmetRestoration03
	SetDefaultArmorData(77389, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorIronHelmet
	SetDefaultArmorData(570986, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlchemy01
	SetDefaultArmorData(570987, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlchemy02
	SetDefaultArmorData(570988, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlchemy03
	SetDefaultArmorData(499996, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlteration01
	SetDefaultArmorData(710023, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlteration02
	SetDefaultArmorData(710024, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetAlteration03
	SetDefaultArmorData(500003, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetConjuration01
	SetDefaultArmorData(710025, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetConjuration02
	SetDefaultArmorData(710026, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetConjuration03
	SetDefaultArmorData(500005, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetDestruction01
	SetDefaultArmorData(710027, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetDestruction02
	SetDefaultArmorData(710028, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetDestruction03
	SetDefaultArmorData(500009, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetIllusion01
	SetDefaultArmorData(710031, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetIllusion02
	SetDefaultArmorData(710032, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetIllusion03
	SetDefaultArmorData(303537, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMagicka01
	SetDefaultArmorData(710033, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMagicka02
	SetDefaultArmorData(710034, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMagicka03
	SetDefaultArmorData(500013, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMarksman01
	SetDefaultArmorData(710035, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMarksman02
	SetDefaultArmorData(710036, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetMarksman03
	SetDefaultArmorData(500017, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetRestoration01
	SetDefaultArmorData(710037, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetRestoration02
	SetDefaultArmorData(710039, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronHelmetRestoration03
	SetDefaultArmorData(400569, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskBronzeHelmet
	SetDefaultArmorData(400555, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskCorondrumHelmet
	SetDefaultArmorData(400549, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskEbonyHelmet
	SetDefaultArmorData(400577, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskIronHelmet
	SetDefaultArmorData(400578, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskMarbleHelmet
	SetDefaultArmorData(400523, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskMoonstoneHelmet
	SetDefaultArmorData(400576, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskOrichalumHelmet
	SetDefaultArmorData(400585, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskSteelHelmet
	SetDefaultArmorData(400598, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskUltraHelmet
	SetDefaultArmorData(400586, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; ArmorDragonPriestMaskWoodHelmet
	SetDefaultArmorData(147710, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2ArmorAcolyteMaskFire
	SetDefaultArmorData(147711, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2ArmorAcolyteMaskFrost
	SetDefaultArmorData(147511, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2ArmorAcolyteMaskShock
	SetDefaultArmorData(170594, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MiraakMaskNew
	SetDefaultArmorData(237473, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask1H
	SetDefaultArmorData(236843, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask1L
	SetDefaultArmorData(237474, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask2H
	SetDefaultArmorData(236846, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask2L
	SetDefaultArmorData(237475, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask3H
	SetDefaultArmorData(236847, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_POOR, COVERAGE_POOR) ; DLC2MKMiraakMask3L
	
	;Fair (21 - 32)
	SetDefaultArmorData(80157, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorElvenHelmet
	SetDefaultArmorData(1072916, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorElvenLightHelmet
	SetDefaultArmorData(570980, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlchemy02
	SetDefaultArmorData(570981, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlchemy03
	SetDefaultArmorData(570982, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlchemy04
	SetDefaultArmorData(778216, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlteration02
	SetDefaultArmorData(778217, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlteration03
	SetDefaultArmorData(778319, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetAlteration04
	SetDefaultArmorData(778218, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetConjuration02
	SetDefaultArmorData(778219, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetConjuration03
	SetDefaultArmorData(778320, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetConjuration04
	SetDefaultArmorData(778220, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetDestruction02
	SetDefaultArmorData(778221, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetDestruction03
	SetDefaultArmorData(778321, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetDestruction04
	SetDefaultArmorData(778224, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetIllusion02
	SetDefaultArmorData(778225, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetIllusion03
	SetDefaultArmorData(778323, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetIllusion04
	SetDefaultArmorData(778226, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMagicka02
	SetDefaultArmorData(778227, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMagicka03
	SetDefaultArmorData(778324, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMagicka04
	SetDefaultArmorData(778228, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMarksman02
	SetDefaultArmorData(778229, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMarksman03
	SetDefaultArmorData(778325, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetMarksman04
	SetDefaultArmorData(778230, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetRestoration02
	SetDefaultArmorData(778231, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetRestoration03
	SetDefaultArmorData(778326, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenHelmetRestoration04
	SetDefaultArmorData(111521, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorScaledHelmet
	SetDefaultArmorData(290039, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlchemy02
	SetDefaultArmorData(290038, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlchemy03
	SetDefaultArmorData(290040, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlchemy04
	SetDefaultArmorData(290074, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlteration02
	SetDefaultArmorData(290079, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlteration03
	SetDefaultArmorData(290080, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetAlteration04
	SetDefaultArmorData(290081, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetConjuration02
	SetDefaultArmorData(290225, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetConjuration03
	SetDefaultArmorData(290226, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetConjuration04
	SetDefaultArmorData(290227, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetDestruction02
	SetDefaultArmorData(290228, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetDestruction03
	SetDefaultArmorData(290229, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetDestruction04
	SetDefaultArmorData(290242, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetIllusion02
	SetDefaultArmorData(290243, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetIllusion03
	SetDefaultArmorData(290244, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetIllusion04
	SetDefaultArmorData(290247, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMagicka02
	SetDefaultArmorData(290250, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMagicka03
	SetDefaultArmorData(290251, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMagicka04
	SetDefaultArmorData(290259, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMarksman02
	SetDefaultArmorData(290265, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMarksman03
	SetDefaultArmorData(290274, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetMarksman04
	SetDefaultArmorData(290285, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetRestoration02
	SetDefaultArmorData(290286, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetRestoration03
	SetDefaultArmorData(290287, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetRestoration04
	SetDefaultArmorData(290288, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorScaledHelmetWaterbreathing
	SetDefaultArmorData(80187, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGlassHelmet
	SetDefaultArmorData(873406, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlchemy03
	SetDefaultArmorData(873407, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlchemy04
	SetDefaultArmorData(873408, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlchemy05
	SetDefaultArmorData(873409, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlteration03
	SetDefaultArmorData(873410, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlteration04
	SetDefaultArmorData(873411, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetAlteration05
	SetDefaultArmorData(873412, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetConjuration03
	SetDefaultArmorData(873413, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetConjuration04
	SetDefaultArmorData(873414, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetConjuration05
	SetDefaultArmorData(873415, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetDestruction03
	SetDefaultArmorData(873416, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetDestruction04
	SetDefaultArmorData(873417, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetDestruction05
	SetDefaultArmorData(873421, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetIllusion03
	SetDefaultArmorData(873422, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetIllusion04
	SetDefaultArmorData(873423, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetIllusion05
	SetDefaultArmorData(873424, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagicka03
	SetDefaultArmorData(873425, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagicka04
	SetDefaultArmorData(873426, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagicka05
	SetDefaultArmorData(1041114, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagickaRate03
	SetDefaultArmorData(1041115, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagickaRate04
	SetDefaultArmorData(1041119, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMagickaRate05
	SetDefaultArmorData(873427, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMarksman03
	SetDefaultArmorData(873428, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMarksman04
	SetDefaultArmorData(873429, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetMarksman05
	SetDefaultArmorData(873430, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetRestoration03
	SetDefaultArmorData(873431, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetRestoration04
	SetDefaultArmorData(873432, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetRestoration05
	SetDefaultArmorData(873433, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassHelmetWaterbreathing
	SetDefaultArmorData(354974, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorDraugrHelmet
	SetDefaultArmorData(1001806, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorDraugrHelmetResistFire03
	SetDefaultArmorData(1070493, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorEastmarchHelmetFull
	SetDefaultArmorData(136729, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullFalkreath
	SetDefaultArmorData(819036, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullHaafingar
	SetDefaultArmorData(136731, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullHjaalmarch
	SetDefaultArmorData(136735, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullPale
	SetDefaultArmorData(136723, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullReach
	SetDefaultArmorData(136738, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullRift
	SetDefaultArmorData(136725, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullWhiterun
	SetDefaultArmorData(136733, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorGuardHelmetFullWinterhold
	SetDefaultArmorData(683385, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; ArmorStormcloakHelmetFull
	SetDefaultArmorData(105182, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC01ClothesVampireHood
	SetDefaultArmorData(168622, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2MoragTongHood
	SetDefaultArmorData(121752, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2dunKolbjornHelm
	SetDefaultArmorData(118156, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2ArmorChitinHeavyHelmet
	SetDefaultArmorData(168327, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlchemy02
	SetDefaultArmorData(168328, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlchemy03
	SetDefaultArmorData(168329, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlchemy04
	SetDefaultArmorData(168330, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlteration02
	SetDefaultArmorData(168331, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlteration03
	SetDefaultArmorData(168332, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetAlteration04
	SetDefaultArmorData(168333, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetConjuration02
	SetDefaultArmorData(168334, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetConjuration03
	SetDefaultArmorData(168335, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetConjuration04
	SetDefaultArmorData(168336, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetDestruction02
	SetDefaultArmorData(168337, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetDestruction03
	SetDefaultArmorData(168338, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetDestruction04
	SetDefaultArmorData(168339, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetIllusion02
	SetDefaultArmorData(168340, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetIllusion03
	SetDefaultArmorData(168341, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetIllusion04
	SetDefaultArmorData(168342, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMagicka02
	SetDefaultArmorData(168343, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMagicka03
	SetDefaultArmorData(168344, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMagicka04
	SetDefaultArmorData(168345, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMarksman02
	SetDefaultArmorData(168346, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMarksman03
	SetDefaultArmorData(168347, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetMarksman04
	SetDefaultArmorData(168348, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetRestoration02
	SetDefaultArmorData(168349, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetRestoration03
	SetDefaultArmorData(168350, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetRestoration04
	SetDefaultArmorData(168351, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinHeavyHelmetWaterbreathing
	SetDefaultArmorData(118153, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2ArmorChitinLightHelmet
	SetDefaultArmorData(167960, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlchemy02
	SetDefaultArmorData(167961, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlchemy03
	SetDefaultArmorData(167962, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlchemy04
	SetDefaultArmorData(167963, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlteration02
	SetDefaultArmorData(167964, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlteration03
	SetDefaultArmorData(167965, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetAlteration04
	SetDefaultArmorData(167966, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetConjuration02
	SetDefaultArmorData(167967, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetConjuration03
	SetDefaultArmorData(167968, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetConjuration04
	SetDefaultArmorData(167969, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetDestruction02
	SetDefaultArmorData(167970, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetDestruction03
	SetDefaultArmorData(167972, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetDestruction04
	SetDefaultArmorData(167971, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetIllusion02
	SetDefaultArmorData(167973, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetIllusion03
	SetDefaultArmorData(167974, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetIllusion04
	SetDefaultArmorData(167975, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMagicka02
	SetDefaultArmorData(167976, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMagicka03
	SetDefaultArmorData(167977, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMagicka04
	SetDefaultArmorData(167978, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMarksman02
	SetDefaultArmorData(167979, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMarksman03
	SetDefaultArmorData(167980, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetMarksman04
	SetDefaultArmorData(167981, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetRestoration02
	SetDefaultArmorData(167982, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetRestoration03
	SetDefaultArmorData(167983, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_FAIR, COVERAGE_POOR) ; DLC2EnchArmorChitinLightHelmetRestoration04


	; Good (33 - 42)
	SetDefaultArmorData(80162, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorLeatherHelmet
	SetDefaultArmorData(570989, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlchemy01
	SetDefaultArmorData(570990, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlchemy02
	SetDefaultArmorData(570991, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlchemy03
	SetDefaultArmorData(741474, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlteration01
	SetDefaultArmorData(741475, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlteration02
	SetDefaultArmorData(741476, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetAlteration03
	SetDefaultArmorData(741477, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetConjuration01
	SetDefaultArmorData(741478, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetConjuration02
	SetDefaultArmorData(741479, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetConjuration03
	SetDefaultArmorData(741480, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetDestruction01
	SetDefaultArmorData(741481, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetDestruction02
	SetDefaultArmorData(741482, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetDestruction03
	SetDefaultArmorData(741495, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetIllusion01
	SetDefaultArmorData(741496, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetIllusion02
	SetDefaultArmorData(741497, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetIllusion03
	SetDefaultArmorData(741498, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMagicka01
	SetDefaultArmorData(741499, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMagicka02
	SetDefaultArmorData(741500, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMagicka03
	SetDefaultArmorData(741501, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMarksman01
	SetDefaultArmorData(741502, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMarksman02
	SetDefaultArmorData(741503, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetMarksman03
	SetDefaultArmorData(741483, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetRestoration01
	SetDefaultArmorData(741484, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetRestoration02
	SetDefaultArmorData(741485, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorLeatherHelmetRestoration03
	SetDefaultArmorData(80192, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonscaleHelmet
	SetDefaultArmorData(883188, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlchemy04
	SetDefaultArmorData(883189, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlchemy05
	SetDefaultArmorData(883190, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlchemy06
	SetDefaultArmorData(883191, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlteration04
	SetDefaultArmorData(883192, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlteration05
	SetDefaultArmorData(883193, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetAlteration06
	SetDefaultArmorData(883194, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetConjuration04
	SetDefaultArmorData(883195, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetConjuration05
	SetDefaultArmorData(883196, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetConjuration06
	SetDefaultArmorData(883197, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetDestruction04
	SetDefaultArmorData(883198, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetDestruction05
	SetDefaultArmorData(883199, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetDestruction06
	SetDefaultArmorData(883203, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetIllusion04
	SetDefaultArmorData(883204, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetIllusion05
	SetDefaultArmorData(883205, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetIllusion06
	SetDefaultArmorData(883206, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagicka04
	SetDefaultArmorData(883207, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagicka05
	SetDefaultArmorData(883208, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagicka06
	SetDefaultArmorData(1041126, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagickaRate04
	SetDefaultArmorData(1041127, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagickaRate05
	SetDefaultArmorData(1041128, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMagickaRate06
	SetDefaultArmorData(883209, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMarksman04
	SetDefaultArmorData(883210, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMarksman05
	SetDefaultArmorData(883211, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetMarksman06
	SetDefaultArmorData(883212, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetRestoration04
	SetDefaultArmorData(883213, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetRestoration05
	SetDefaultArmorData(883214, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetRestoration06
	SetDefaultArmorData(883215, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleHelmetWaterbreathing
	SetDefaultArmorData(80212, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorSteelHelmetA
	SetDefaultArmorData(1011492, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorSteelHelmetB
	SetDefaultArmorData(571039, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlchemy01
	SetDefaultArmorData(571040, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlchemy02
	SetDefaultArmorData(571041, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlchemy03
	SetDefaultArmorData(741587, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlteration01
	SetDefaultArmorData(741595, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlteration02
	SetDefaultArmorData(741596, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetAlteration03
	SetDefaultArmorData(741588, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetConjuration01
	SetDefaultArmorData(741597, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetConjuration02
	SetDefaultArmorData(741598, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetConjuration03
	SetDefaultArmorData(741589, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetDestruction01
	SetDefaultArmorData(741599, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetDestruction02
	SetDefaultArmorData(741600, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetDestruction03
	SetDefaultArmorData(741591, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetIllusion01
	SetDefaultArmorData(741603, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetIllusion02
	SetDefaultArmorData(741604, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetIllusion03
	SetDefaultArmorData(741592, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMagicka01
	SetDefaultArmorData(741605, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMagicka02
	SetDefaultArmorData(741606, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMagicka03
	SetDefaultArmorData(741593, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMarksman01
	SetDefaultArmorData(741609, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMarksman02
	SetDefaultArmorData(741610, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetMarksman03
	SetDefaultArmorData(741594, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetRestoration01
	SetDefaultArmorData(741607, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetRestoration02
	SetDefaultArmorData(741608, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetRestoration03
	SetDefaultArmorData(600710, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelHelmetWaterbreathing
	SetDefaultArmorData(80207, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorDwarvenHelmet
	SetDefaultArmorData(570970, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlchemy02
	SetDefaultArmorData(570978, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlchemy03
	SetDefaultArmorData(570979, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlchemy04
	SetDefaultArmorData(112491, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlteration02
	SetDefaultArmorData(112492, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlteration03
	SetDefaultArmorData(112493, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetAlteration04
	SetDefaultArmorData(112494, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetConjuration02
	SetDefaultArmorData(112495, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetConjuration03
	SetDefaultArmorData(112496, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetConjuration04
	SetDefaultArmorData(112497, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetDestruction02
	SetDefaultArmorData(112498, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetDestruction03
	SetDefaultArmorData(112522, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetDestruction04
	SetDefaultArmorData(113072, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetIllusion02
	SetDefaultArmorData(113079, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetIllusion03
	SetDefaultArmorData(113080, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetIllusion04
	SetDefaultArmorData(113083, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMagicka02
	SetDefaultArmorData(113084, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMagicka03
	SetDefaultArmorData(113086, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMagicka04
	SetDefaultArmorData(113088, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMarksman02
	SetDefaultArmorData(113089, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMarksman03
	SetDefaultArmorData(113091, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetMarksman04
	SetDefaultArmorData(113092, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetRestoration02
	SetDefaultArmorData(113093, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetRestoration03
	SetDefaultArmorData(113095, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetRestoration04
	SetDefaultArmorData(600717, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorDwarvenHelmetWaterbreathing
	SetDefaultArmorData(80222, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorSteelPlateHelmet
	SetDefaultArmorData(570992, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlchemy02
	SetDefaultArmorData(570993, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlchemy03
	SetDefaultArmorData(570994, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlchemy04
	SetDefaultArmorData(253817, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlteration02
	SetDefaultArmorData(253818, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlteration03
	SetDefaultArmorData(253819, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetAlteration04
	SetDefaultArmorData(253820, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetConjuration02
	SetDefaultArmorData(253821, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetConjuration03
	SetDefaultArmorData(253822, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetConjuration04
	SetDefaultArmorData(253823, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetDestruction02
	SetDefaultArmorData(253824, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetDestruction03
	SetDefaultArmorData(253825, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetDestruction04
	SetDefaultArmorData(253829, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetIllusion02
	SetDefaultArmorData(266270, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetIllusion03
	SetDefaultArmorData(266272, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetIllusion04
	SetDefaultArmorData(266273, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMagicka02
	SetDefaultArmorData(266274, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMagicka03
	SetDefaultArmorData(266279, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMagicka04
	SetDefaultArmorData(266284, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMarksman02
	SetDefaultArmorData(266291, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMarksman03
	SetDefaultArmorData(266292, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetMarksman04
	SetDefaultArmorData(266293, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetRestoration02
	SetDefaultArmorData(266294, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetRestoration03
	SetDefaultArmorData(266295, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetRestoration04
	SetDefaultArmorData(600778, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; EnchArmorSteelPlateHelmetWaterbreathing
	SetDefaultArmorData(80227, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorEbonyHelmet
	SetDefaultArmorData(850033, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlchemy03
	SetDefaultArmorData(850034, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlchemy04
	SetDefaultArmorData(850035, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlchemy05
	SetDefaultArmorData(850036, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlteration03
	SetDefaultArmorData(850037, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlteration04
	SetDefaultArmorData(850038, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetAlteration05
	SetDefaultArmorData(850039, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetConjuration03
	SetDefaultArmorData(850040, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetConjuration04
	SetDefaultArmorData(850041, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetConjuration05
	SetDefaultArmorData(850042, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetDestruction03
	SetDefaultArmorData(850043, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetDestruction04
	SetDefaultArmorData(850044, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetDestruction05
	SetDefaultArmorData(850048, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetIllusion03
	SetDefaultArmorData(850049, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetIllusion04
	SetDefaultArmorData(850050, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetIllusion05
	SetDefaultArmorData(850051, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagicka03
	SetDefaultArmorData(850052, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagicka04
	SetDefaultArmorData(850053, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagicka05
	SetDefaultArmorData(1041135, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagickaRate03
	SetDefaultArmorData(1041136, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagickaRate04
	SetDefaultArmorData(1041137, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMagickaRate05
	SetDefaultArmorData(850054, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMarksman03
	SetDefaultArmorData(850055, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMarksman04
	SetDefaultArmorData(850056, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetMarksman05
	SetDefaultArmorData(850057, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetRestoration03
	SetDefaultArmorData(850058, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetRestoration04
	SetDefaultArmorData(850059, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetRestoration05
	SetDefaultArmorData(850060, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyHelmetWaterbreathing
	SetDefaultArmorData(80233, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonplateHelmet
	SetDefaultArmorData(883296, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlchemy04
	SetDefaultArmorData(883297, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlchemy05
	SetDefaultArmorData(883298, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlchemy06
	SetDefaultArmorData(883299, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlteration04
	SetDefaultArmorData(883300, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlteration05
	SetDefaultArmorData(883301, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetAlteration06
	SetDefaultArmorData(883302, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetConjuration04
	SetDefaultArmorData(883303, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetConjuration05
	SetDefaultArmorData(883304, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetConjuration06
	SetDefaultArmorData(883305, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetDestruction04
	SetDefaultArmorData(883306, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetDestruction05
	SetDefaultArmorData(883307, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetDestruction06
	SetDefaultArmorData(883311, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetIllusion04
	SetDefaultArmorData(883312, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetIllusion05
	SetDefaultArmorData(883313, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetIllusion06
	SetDefaultArmorData(883314, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagicka04
	SetDefaultArmorData(883315, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagicka05
	SetDefaultArmorData(883316, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagicka06
	SetDefaultArmorData(1041138, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagickaRate04
	SetDefaultArmorData(1041139, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagickaRate05
	SetDefaultArmorData(1041140, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMagickaRate06
	SetDefaultArmorData(883317, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMarksman04
	SetDefaultArmorData(883318, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMarksman05
	SetDefaultArmorData(883319, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetMarksman06
	SetDefaultArmorData(883320, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetRestoration04
	SetDefaultArmorData(883321, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetRestoration05
	SetDefaultArmorData(883322, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetRestoration06
	SetDefaultArmorData(883323, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateHelmetWaterbreathing
	SetDefaultArmorData(307855, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorBladesHelmet
	SetDefaultArmorData(81628, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorImperialHelmet
	SetDefaultArmorData(81627, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorImperialLightHelmet
	SetDefaultArmorData(614669, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorImperialHelmetFull
	SetDefaultArmorData(79567, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorImperialHelmetOfficer
	SetDefaultArmorData(571042, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlchemy01
	SetDefaultArmorData(571043, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlchemy02
	SetDefaultArmorData(571044, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlchemy03
	SetDefaultArmorData(571045, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlteration01
	SetDefaultArmorData(571046, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlteration02
	SetDefaultArmorData(571047, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetAlteration03
	SetDefaultArmorData(571048, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetConjuration01
	SetDefaultArmorData(571049, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetConjuration02
	SetDefaultArmorData(571050, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetConjuration03
	SetDefaultArmorData(571051, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetDestruction01
	SetDefaultArmorData(571052, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetDestruction02
	SetDefaultArmorData(571053, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetDestruction03
	SetDefaultArmorData(571057, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetIllusion01
	SetDefaultArmorData(571058, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetIllusion02
	SetDefaultArmorData(571059, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetIllusion03
	SetDefaultArmorData(571060, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMagicka01
	SetDefaultArmorData(571061, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMagicka02
	SetDefaultArmorData(571063, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMarksman01
	SetDefaultArmorData(571064, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMarksman02
	SetDefaultArmorData(571065, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetMarksman03
	SetDefaultArmorData(571066, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetRestoration01
	SetDefaultArmorData(571067, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetRestoration02
	SetDefaultArmorData(571068, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialHelmetRestoration03
	SetDefaultArmorData(571069, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlchemy01
	SetDefaultArmorData(571075, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlchemy02
	SetDefaultArmorData(571070, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlchemy03
	SetDefaultArmorData(571071, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlteration01
	SetDefaultArmorData(571072, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlteration02
	SetDefaultArmorData(571073, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetAlteration03
	SetDefaultArmorData(571074, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetConjuration01
	SetDefaultArmorData(571076, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetConjuration02
	SetDefaultArmorData(571077, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetConjuration03
	SetDefaultArmorData(571078, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetDestruction01
	SetDefaultArmorData(571079, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetDestruction02
	SetDefaultArmorData(571080, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetDestruction03
	SetDefaultArmorData(571084, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetIllusion01
	SetDefaultArmorData(571085, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetIllusion02
	SetDefaultArmorData(571086, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetIllusion03
	SetDefaultArmorData(571087, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetMagicka01
	SetDefaultArmorData(571088, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetMagicka02
	SetDefaultArmorData(571062, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorImperialLightHelmetMagicka03
	SetDefaultArmorData(862274, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DBArmorHelmet
	SetDefaultArmorData(371652, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DBArmorHelmetMaskLess
	SetDefaultArmorData(925463, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DBArmorHelmetSP
	SetDefaultArmorData(1108829, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DBArmorHelmetWornPlayable
	SetDefaultArmorData(867013, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorThievesGuildHelmetPlayer
	SetDefaultArmorData(867022, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorThievesGuildHelmetPlayerImproved
	SetDefaultArmorData(931289, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorThievesGuildLeaderHelmet
	SetDefaultArmorData(1082694, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorLinweHelmet
	SetDefaultArmorData(383880, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_MAX) ; ArmorNightingaleHelmetPlayer01
	SetDefaultArmorData(1035283, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_MAX) ; ArmorNightingaleHelmetPlayer02
	SetDefaultArmorData(1035282, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_MAX) ; ArmorNightingaleHelmetPlayer03
	SetDefaultArmorData(962513, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; MS02ForswornHelmet
	SetDefaultArmorData(888146, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ForswornHelmet
	SetDefaultArmorData(868010, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorPenitusHelmet
	SetDefaultArmorData(455582, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; ArmorBanditHelmet
	SetDefaultArmorData(20688, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorDawnguardHelmetHeavy
	SetDefaultArmorData(104606, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorDawnguardHelmetLight
	SetDefaultArmorData(59616, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorFAlmerHardenedHelmet
	SetDefaultArmorData(9195, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorFAlmerHeavyHelmet
	SetDefaultArmorData(77450, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC1ArmorShellbugHelmet
	SetDefaultArmorData(51220, "Dawnguard.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; DLC1IvoryCrown
	SetDefaultArmorData(118165, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2ArmorBonemoldHelmet
	SetDefaultArmorData(240419, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; DLC2ArmorBonemoldImprovedHelmet
	SetDefaultArmorData(165113, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlchemy01
	SetDefaultArmorData(165114, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlchemy02
	SetDefaultArmorData(165115, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlchemy03
	SetDefaultArmorData(165116, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlteration01
	SetDefaultArmorData(165117, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlteration02
	SetDefaultArmorData(165118, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetAlteration03
	SetDefaultArmorData(165119, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetConjuration01
	SetDefaultArmorData(165120, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetConjuration02
	SetDefaultArmorData(165121, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetConjuration03
	SetDefaultArmorData(165122, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetDestruction01
	SetDefaultArmorData(165123, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetDestruction02
	SetDefaultArmorData(165124, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetDestruction03
	SetDefaultArmorData(165125, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetIllusion01
	SetDefaultArmorData(165126, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetIllusion02
	SetDefaultArmorData(165127, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetIllusion03
	SetDefaultArmorData(165128, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetMagicka01
	SetDefaultArmorData(165129, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetMagicka02
	SetDefaultArmorData(165130, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_POOR) ; DLC2EnchArmorBonemoldHelmetMagicka03
	SetDefaultArmorData(232157, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_FAIR) ; DLC2dunFahlbtharzDwarvenHelmet
	SetDefaultArmorData(175409, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_GOOD, COVERAGE_EXCELLENT) ; DLC2TGArmorVariantHood
	
	; Excellent (43 - 50)
	SetDefaultArmorData(80217, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; ArmorOrcishHelmet
	SetDefaultArmorData(849916, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlchemy03
	SetDefaultArmorData(849917, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlchemy04
	SetDefaultArmorData(849918, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlchemy05
	SetDefaultArmorData(849919, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlteration03
	SetDefaultArmorData(849920, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlteration04
	SetDefaultArmorData(849921, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetAlteration05
	SetDefaultArmorData(849922, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetConjuration03
	SetDefaultArmorData(849923, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetConjuration04
	SetDefaultArmorData(849924, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetConjuration05
	SetDefaultArmorData(849925, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetDestruction03
	SetDefaultArmorData(849926, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetDestruction04
	SetDefaultArmorData(849927, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetDestruction05
	SetDefaultArmorData(849931, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetIllusion03
	SetDefaultArmorData(849932, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetIllusion04
	SetDefaultArmorData(849933, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetIllusion05
	SetDefaultArmorData(849934, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMagicka03
	SetDefaultArmorData(849935, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMagicka04
	SetDefaultArmorData(849936, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMagicka05
	SetDefaultArmorData(849937, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMarksman03
	SetDefaultArmorData(849938, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMarksman04
	SetDefaultArmorData(849939, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetMarksman05
	SetDefaultArmorData(849940, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetRestoration03
	SetDefaultArmorData(849941, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetRestoration04
	SetDefaultArmorData(849942, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetRestoration05
	SetDefaultArmorData(849943, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; EnchArmorOrcishHelmetWaterbreathing
	SetDefaultArmorData(80237, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; ArmorDaedricHelmet
	SetDefaultArmorData(883410, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlchemy04
	SetDefaultArmorData(883411, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlchemy05
	SetDefaultArmorData(883412, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlchemy06
	SetDefaultArmorData(883413, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlteration04
	SetDefaultArmorData(883414, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlteration05
	SetDefaultArmorData(883415, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetAlteration06
	SetDefaultArmorData(883416, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetConjuration04
	SetDefaultArmorData(883417, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetConjuration05
	SetDefaultArmorData(883418, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetConjuration06
	SetDefaultArmorData(883419, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetDestruction04
	SetDefaultArmorData(883420, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetDestruction05
	SetDefaultArmorData(883421, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetDestruction06
	SetDefaultArmorData(883425, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetIllusion04
	SetDefaultArmorData(883426, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetIllusion05
	SetDefaultArmorData(883427, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetIllusion06
	SetDefaultArmorData(883428, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagicka04
	SetDefaultArmorData(883429, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagicka05
	SetDefaultArmorData(883430, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagicka06
	SetDefaultArmorData(1041153, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagickaRate04
	SetDefaultArmorData(1041154, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagickaRate05
	SetDefaultArmorData(1041155, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMagickaRate06
	SetDefaultArmorData(883431, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMarksman04
	SetDefaultArmorData(883432, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMarksman05
	SetDefaultArmorData(883433, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetMarksman06
	SetDefaultArmorData(883434, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetRestoration04
	SetDefaultArmorData(883435, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetRestoration05
	SetDefaultArmorData(883436, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetRestoration06
	SetDefaultArmorData(883437, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_GOOD) ; EnchArmorDaedricHelmetWaterbreathing
	SetDefaultArmorData(312272, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; ArmorCompanionsHelmet
	SetDefaultArmorData(551301, "Skyrim.esm", GEARTYPE_HEAD, WARMTH_EXCELLENT, COVERAGE_POOR) ; ArmorStormcloakBearHelmet
	
	
	

	SetDefaultArmorData(233748, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_POOR) ; DLC2ClothesSkaalHat
	SetDefaultArmorData(147485, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2dunHaknirArmorHelm
	SetDefaultArmorData(118177, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimHeavyHelmet
	SetDefaultArmorData(168502, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy04
	SetDefaultArmorData(168503, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy05
	SetDefaultArmorData(168504, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy06
	SetDefaultArmorData(168505, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration04
	SetDefaultArmorData(168506, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration05
	SetDefaultArmorData(168507, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration06
	SetDefaultArmorData(168508, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration04
	SetDefaultArmorData(168509, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration05
	SetDefaultArmorData(168510, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration06
	SetDefaultArmorData(168511, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction04
	SetDefaultArmorData(168512, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction05
	SetDefaultArmorData(168513, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction06
	SetDefaultArmorData(168514, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion04
	SetDefaultArmorData(168515, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion05
	SetDefaultArmorData(168516, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion06
	SetDefaultArmorData(168517, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka04
	SetDefaultArmorData(168518, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka05
	SetDefaultArmorData(168519, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka06
	SetDefaultArmorData(168520, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate04
	SetDefaultArmorData(168521, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate05
	SetDefaultArmorData(168522, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate06
	SetDefaultArmorData(168523, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman04
	SetDefaultArmorData(168524, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman05
	SetDefaultArmorData(168525, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman06
	SetDefaultArmorData(168526, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration04
	SetDefaultArmorData(168527, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration05
	SetDefaultArmorData(168528, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration06
	SetDefaultArmorData(168529, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyHelmetWaterbreathing
	SetDefaultArmorData(118179, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimLightHelmet
	SetDefaultArmorData(168149, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlchemy03
	SetDefaultArmorData(168150, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlchemy04
	SetDefaultArmorData(168151, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlchemy05
	SetDefaultArmorData(168152, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlteration03
	SetDefaultArmorData(168153, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlteration04
	SetDefaultArmorData(168154, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetAlteration05
	SetDefaultArmorData(168155, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetConjuration03
	SetDefaultArmorData(168156, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetConjuration04
	SetDefaultArmorData(168157, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetConjuration05
	SetDefaultArmorData(168158, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetDestruction03
	SetDefaultArmorData(168159, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetDestruction04
	SetDefaultArmorData(168160, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetDestruction05
	SetDefaultArmorData(168161, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetIllusion03
	SetDefaultArmorData(168162, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetIllusion04
	SetDefaultArmorData(168163, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetIllusion05
	SetDefaultArmorData(168164, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagicka03
	SetDefaultArmorData(168165, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagicka04
	SetDefaultArmorData(168166, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagicka05
	SetDefaultArmorData(168167, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate03
	SetDefaultArmorData(168168, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate04
	SetDefaultArmorData(168169, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate05
	SetDefaultArmorData(168170, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMarksman03
	SetDefaultArmorData(168171, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMarksman04
	SetDefaultArmorData(168172, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetMarksman05
	SetDefaultArmorData(168173, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetRestoration03
	SetDefaultArmorData(168174, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetRestoration04
	SetDefaultArmorData(168175, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetRestoration05
	SetDefaultArmorData(168191, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightHelmetWaterbreathing
	SetDefaultArmorData(118169, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorNordicHeavyHelmet
	SetDefaultArmorData(168404, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlchemy03
	SetDefaultArmorData(168405, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlchemy04
	SetDefaultArmorData(168406, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlchemy05
	SetDefaultArmorData(168407, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlteration03
	SetDefaultArmorData(168408, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlteration04
	SetDefaultArmorData(168409, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetAlteration05
	SetDefaultArmorData(168410, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetConjuration03
	SetDefaultArmorData(168411, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetConjuration04
	SetDefaultArmorData(168412, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetConjuration05
	SetDefaultArmorData(168413, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetDestruction03
	SetDefaultArmorData(168414, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetDestruction04
	SetDefaultArmorData(168415, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetDestruction05
	SetDefaultArmorData(168416, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetIllusion03
	SetDefaultArmorData(168417, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetIllusion04
	SetDefaultArmorData(168418, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetIllusion05
	SetDefaultArmorData(168419, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMagicka03
	SetDefaultArmorData(168420, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMagicka04
	SetDefaultArmorData(168421, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMagicka05
	SetDefaultArmorData(168422, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMarksman03
	SetDefaultArmorData(168423, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMarksman04
	SetDefaultArmorData(168424, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetMarksman05
	SetDefaultArmorData(168425, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetRestoration03
	SetDefaultArmorData(168426, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetRestoration04
	SetDefaultArmorData(168427, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetRestoration05
	SetDefaultArmorData(168428, "Dragonborn.esm", GEARTYPE_HEAD, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorNordicHeavyHelmetWaterbreathing
endFunction

function SetDefaults_Hands()
	; Poor (0 - 10)
	SetDefaultArmorData(80146, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ArmorHideGauntlets
	SetDefaultArmorData(571007, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsAlchemy01
	SetDefaultArmorData(571008, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsAlchemy02
	SetDefaultArmorData(571009, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsAlchemy03
	SetDefaultArmorData(500041, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsLockpicking01
	SetDefaultArmorData(709805, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsLockpicking02
	SetDefaultArmorData(709806, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsLockpicking03
	SetDefaultArmorData(500042, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsMarksman01
	SetDefaultArmorData(709807, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsMarksman02
	SetDefaultArmorData(709808, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsMarksman03
	SetDefaultArmorData(500043, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsOneHanded01
	SetDefaultArmorData(709809, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsOneHanded02
	SetDefaultArmorData(709810, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsOneHanded03
	SetDefaultArmorData(500044, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsPickpocket01
	SetDefaultArmorData(709811, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsPickpocket02
	SetDefaultArmorData(709812, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsPickpocket03
	SetDefaultArmorData(500046, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsSmithing01
	SetDefaultArmorData(709815, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsSmithing02
	SetDefaultArmorData(709816, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsSmithing03
	SetDefaultArmorData(500047, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsTwoHanded01
	SetDefaultArmorData(709817, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsTwoHanded02
	SetDefaultArmorData(709818, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorHideGauntletsTwoHanded03
	SetDefaultArmorData(77382, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ArmorIronGauntlets
	SetDefaultArmorData(802022, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; FavorOrcsGauntlets
	SetDefaultArmorData(571016, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsAlchemy01
	SetDefaultArmorData(571017, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsAlchemy02
	SetDefaultArmorData(571018, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsAlchemy03
	SetDefaultArmorData(500012, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsMarksman01
	SetDefaultArmorData(710011, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsMarksman02
	SetDefaultArmorData(710012, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsMarksman03
	SetDefaultArmorData(500014, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsOneHanded01
	SetDefaultArmorData(710013, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsOneHanded02
	SetDefaultArmorData(710014, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsOneHanded03
	SetDefaultArmorData(500018, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsSmithing01
	SetDefaultArmorData(710019, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsSmithing02
	SetDefaultArmorData(710020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsSmithing03
	SetDefaultArmorData(500020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsTwoHanded01
	SetDefaultArmorData(710021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsTwoHanded02
	SetDefaultArmorData(710022, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronGauntletsTwoHanded03
	SetDefaultArmorData(80161, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ArmorLeatherGauntlets
	SetDefaultArmorData(571019, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsAlchemy01
	SetDefaultArmorData(571020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsAlchemy02
	SetDefaultArmorData(571021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsAlchemy03
	SetDefaultArmorData(741453, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsLockpicking01
	SetDefaultArmorData(741454, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsLockpicking02
	SetDefaultArmorData(741455, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsLockpicking03
	SetDefaultArmorData(741456, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsMarksman01
	SetDefaultArmorData(741457, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsMarksman02
	SetDefaultArmorData(741458, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsMarksman03
	SetDefaultArmorData(741459, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsOneHanded01
	SetDefaultArmorData(741460, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsOneHanded02
	SetDefaultArmorData(741461, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsOneHanded03
	SetDefaultArmorData(741462, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsPickpocket01
	SetDefaultArmorData(741463, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsPickpocket02
	SetDefaultArmorData(741464, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsPickpocket03
	SetDefaultArmorData(741468, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsSmithing01
	SetDefaultArmorData(741469, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsSmithing02
	SetDefaultArmorData(741470, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsSmithing03
	SetDefaultArmorData(741471, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsTwoHanded01
	SetDefaultArmorData(741472, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsTwoHanded02
	SetDefaultArmorData(741473, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorLeatherGauntletsTwoHanded03
	SetDefaultArmorData(80156, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; ArmorElvenGauntlets
	SetDefaultArmorData(1072915, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; ArmorElvenLightGauntlets
	SetDefaultArmorData(570998, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsAlchemy02
	SetDefaultArmorData(570999, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsAlchemy03
	SetDefaultArmorData(571000, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsAlchemy04
	SetDefaultArmorData(778202, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsLockpicking02
	SetDefaultArmorData(778203, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsLockpicking03
	SetDefaultArmorData(778312, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsLockpicking04
	SetDefaultArmorData(778204, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsMarksman02
	SetDefaultArmorData(778205, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsMarksman03
	SetDefaultArmorData(778313, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsMarksman04
	SetDefaultArmorData(778206, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsOneHanded02
	SetDefaultArmorData(778207, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsOneHanded03
	SetDefaultArmorData(778314, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsOneHanded04
	SetDefaultArmorData(778208, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsPickpocket02
	SetDefaultArmorData(778209, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsPickpocket03
	SetDefaultArmorData(778315, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsPickpocket04
	SetDefaultArmorData(778212, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsSmithing02
	SetDefaultArmorData(778213, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsSmithing03
	SetDefaultArmorData(778317, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsSmithing04
	SetDefaultArmorData(778214, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsTwoHanded02
	SetDefaultArmorData(778215, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsTwoHanded03
	SetDefaultArmorData(778318, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; EnchArmorElvenGauntletsTwoHanded04
	SetDefaultArmorData(1105977, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; PrisonerCuffsPlayer
	SetDefaultArmorData(416691, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ClothesThalmorGloves
	SetDefaultArmorData(962514, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; MS02ForswornGauntlets
	SetDefaultArmorData(888149, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ForswornGauntlets
	SetDefaultArmorData(59615, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; DLC1ArmorFalmerHardenedGauntlets
	SetDefaultArmorData(9197, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; DLC1ArmorFalmerHeavyGauntlets
	SetDefaultArmorData(355095, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; ArmorDraugrGauntlets
	SetDefaultArmorData(118155, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2ArmorChitinHeavyGauntlets
	SetDefaultArmorData(168312, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy02
	SetDefaultArmorData(168313, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy03
	SetDefaultArmorData(168314, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy04
	SetDefaultArmorData(168315, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsMarksman02
	SetDefaultArmorData(168316, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsMarksman03
	SetDefaultArmorData(168317, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsMarksman04
	SetDefaultArmorData(168318, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded02
	SetDefaultArmorData(168319, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded03
	SetDefaultArmorData(168320, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded04
	SetDefaultArmorData(168321, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsSmithing02
	SetDefaultArmorData(168322, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsSmithing03
	SetDefaultArmorData(168323, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsSmithing04
	SetDefaultArmorData(168324, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded02
	SetDefaultArmorData(168325, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded03
	SetDefaultArmorData(168326, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded04
	SetDefaultArmorData(118152, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2ArmorChitinLightGauntlets
	SetDefaultArmorData(167939, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsAlchemy02
	SetDefaultArmorData(167940, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsAlchemy03
	SetDefaultArmorData(167941, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsAlchemy04
	SetDefaultArmorData(167942, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsLockpicking02
	SetDefaultArmorData(167943, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsLockpicking03
	SetDefaultArmorData(167944, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsLockpicking04
	SetDefaultArmorData(167945, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsMarksman02
	SetDefaultArmorData(167946, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsMarksman03
	SetDefaultArmorData(167947, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsMarksman04
	SetDefaultArmorData(167948, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsOneHanded02
	SetDefaultArmorData(167949, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsOneHanded03
	SetDefaultArmorData(167950, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsOneHanded04
	SetDefaultArmorData(167951, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsPickpocket02
	SetDefaultArmorData(167952, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsPickpocket03
	SetDefaultArmorData(167953, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsPickpocket04
	SetDefaultArmorData(167954, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsSmithing02
	SetDefaultArmorData(167955, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsSmithing03
	SetDefaultArmorData(167956, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsSmithing04
	SetDefaultArmorData(167957, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsTwoHanded02
	SetDefaultArmorData(167958, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsTwoHanded03
	SetDefaultArmorData(167959, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightGauntletsTwoHanded04
	SetDefaultArmorData(168621, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_FAIR) ; DLC2MoragTongGauntlets
	SetDefaultArmorData(121753, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_POOR, COVERAGE_POOR) ; DLC2dunKolbjornGauntlets


	; Fair (11 - 14)
	SetDefaultArmorData(455579, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; ArmorBanditGauntlets
	SetDefaultArmorData(111520, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; ArmorScaledGauntlets
	SetDefaultArmorData(289744, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsAlchemy02
	SetDefaultArmorData(289745, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsAlchemy03
	SetDefaultArmorData(289746, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsAlchemy04
	SetDefaultArmorData(289766, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsLockpicking02
	SetDefaultArmorData(289767, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsLockpicking03
	SetDefaultArmorData(289768, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsLockpicking04
	SetDefaultArmorData(289769, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsMarksman02
	SetDefaultArmorData(289770, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsMarksman03
	SetDefaultArmorData(289771, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsMarksman04
	SetDefaultArmorData(289913, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsOneHanded02
	SetDefaultArmorData(289914, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsOneHanded03
	SetDefaultArmorData(289916, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsOneHanded04
	SetDefaultArmorData(289917, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsPickpocket02
	SetDefaultArmorData(289919, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsPickpocket03
	SetDefaultArmorData(289920, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsPickpocket04
	SetDefaultArmorData(289950, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsSmithing02
	SetDefaultArmorData(290010, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsSmithing03
	SetDefaultArmorData(290026, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsSmithing04
	SetDefaultArmorData(290035, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsTwoHanded02
	SetDefaultArmorData(290036, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsTwoHanded03
	SetDefaultArmorData(290037, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledGauntletsTwoHanded04
	SetDefaultArmorData(80186, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGlassGauntlets
	SetDefaultArmorData(873367, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsAlchemy03
	SetDefaultArmorData(873368, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsAlchemy04
	SetDefaultArmorData(873369, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsAlchemy05
	SetDefaultArmorData(1036017, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsLockpicking03
	SetDefaultArmorData(1036018, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsLockpicking04
	SetDefaultArmorData(1036019, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsLockpicking05
	SetDefaultArmorData(873388, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsMarksman03
	SetDefaultArmorData(873389, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsMarksman04
	SetDefaultArmorData(873390, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsMarksman05
	SetDefaultArmorData(873391, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsOneHanded03
	SetDefaultArmorData(873392, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsOneHanded04
	SetDefaultArmorData(873393, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsOneHanded05
	SetDefaultArmorData(1036020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsPickpocket03
	SetDefaultArmorData(1036021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsPickpocket04
	SetDefaultArmorData(1036022, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsPickpocket05
	SetDefaultArmorData(873397, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsSmithing03
	SetDefaultArmorData(873398, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsSmithing04
	SetDefaultArmorData(873399, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsSmithing05
	SetDefaultArmorData(873403, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsTwoHanded03
	SetDefaultArmorData(873404, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsTwoHanded04
	SetDefaultArmorData(873405, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassGauntletsTwoHanded05
	SetDefaultArmorData(80211, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; ArmorSteelGauntletsA
	SetDefaultArmorData(1011491, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; ArmorSteelGauntletsB
	SetDefaultArmorData(571025, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsAlchemy01
	SetDefaultArmorData(571026, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsAlchemy02
	SetDefaultArmorData(571027, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsAlchemy03
	SetDefaultArmorData(741566, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsMarksman01
	SetDefaultArmorData(741579, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsMarksman02
	SetDefaultArmorData(741580, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsMarksman03
	SetDefaultArmorData(741567, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsOneHanded01
	SetDefaultArmorData(741581, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsOneHanded02
	SetDefaultArmorData(741582, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsOneHanded03
	SetDefaultArmorData(741569, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsSmithing01
	SetDefaultArmorData(571028, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsSmithing02
	SetDefaultArmorData(571029, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsSmithing03
	SetDefaultArmorData(741570, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsTwoHanded01
	SetDefaultArmorData(741585, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsTwoHanded02
	SetDefaultArmorData(741586, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorSteelGauntletsTwoHanded03
	SetDefaultArmorData(307853, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorBladesGauntlets
	SetDefaultArmorData(862275, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorGloves
	SetDefaultArmorData(1005953, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorGlovesReward
	SetDefaultArmorData(925462, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorGlovesSP
	SetDefaultArmorData(1108830, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorGlovesWornPlayable
	SetDefaultArmorData(79572, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorImperialGauntlets
	SetDefaultArmorData(81626, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorImperialLightGauntlets
	SetDefaultArmorData(571010, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlchemy01
	SetDefaultArmorData(571011, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlchemy02
	SetDefaultArmorData(571012, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlchemy03
	SetDefaultArmorData(707782, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlteration01
	SetDefaultArmorData(709877, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlteration02
	SetDefaultArmorData(709878, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsAlteration03
	SetDefaultArmorData(707784, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsConjuration01
	SetDefaultArmorData(709881, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsConjuration02
	SetDefaultArmorData(709882, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsConjuration03
	SetDefaultArmorData(707785, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsDestruction01
	SetDefaultArmorData(709883, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsDestruction02
	SetDefaultArmorData(709884, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsDestruction03
	SetDefaultArmorData(707789, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsMarksman01
	SetDefaultArmorData(709891, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsMarksman02
	SetDefaultArmorData(709892, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsMarksman03
	SetDefaultArmorData(707790, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsOneHanded01
	SetDefaultArmorData(759623, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsOneHanded02
	SetDefaultArmorData(709894, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsOneHanded03
	SetDefaultArmorData(707793, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsSmithing01
	SetDefaultArmorData(709899, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsSmithing02
	SetDefaultArmorData(709900, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsSmithing03
	SetDefaultArmorData(707794, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsTwoHanded01
	SetDefaultArmorData(709901, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsTwoHanded02
	SetDefaultArmorData(709902, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialGauntletsTwoHanded03
	SetDefaultArmorData(571013, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlchemy01
	SetDefaultArmorData(571014, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlchemy02
	SetDefaultArmorData(571015, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlchemy03
	SetDefaultArmorData(759598, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlteration01
	SetDefaultArmorData(759599, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlteration02
	SetDefaultArmorData(759600, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsAlteration03
	SetDefaultArmorData(759604, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsConjuration01
	SetDefaultArmorData(759605, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsConjuration02
	SetDefaultArmorData(759606, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsConjuration03
	SetDefaultArmorData(759607, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsDestruction01
	SetDefaultArmorData(759608, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsDestruction02
	SetDefaultArmorData(759609, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsDestruction03
	SetDefaultArmorData(759616, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsLockpicking01
	SetDefaultArmorData(759617, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsLockpicking02
	SetDefaultArmorData(759618, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsLockpicking03
	SetDefaultArmorData(759619, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsMarksman01
	SetDefaultArmorData(759620, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsMarksman02
	SetDefaultArmorData(759621, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsMarksman03
	SetDefaultArmorData(759622, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsOneHanded01
	SetDefaultArmorData(709893, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsOneHanded02
	SetDefaultArmorData(759624, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsOneHanded03
	SetDefaultArmorData(759625, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsPickpocket01
	SetDefaultArmorData(759626, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsPickpocket02
	SetDefaultArmorData(759627, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsPickpocket03
	SetDefaultArmorData(759631, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsSmithing01
	SetDefaultArmorData(759632, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsSmithing02
	SetDefaultArmorData(759633, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsSmithing03
	SetDefaultArmorData(759634, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsTwoHanded01
	SetDefaultArmorData(759635, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsTwoHanded02
	SetDefaultArmorData(759636, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightGauntletsTwoHanded03
	SetDefaultArmorData(118164, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldGauntlets
	SetDefaultArmorData(240418, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_GOOD) ; DLC2ArmorBonemoldImprovedGauntlets
	SetDefaultArmorData(165083, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlchemy01
	SetDefaultArmorData(165084, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlchemy02
	SetDefaultArmorData(165085, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlchemy03
	SetDefaultArmorData(165086, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlteration01
	SetDefaultArmorData(165087, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlteration02
	SetDefaultArmorData(165088, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsAlteration03
	SetDefaultArmorData(165089, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsConjuration01
	SetDefaultArmorData(165090, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsConjuration02
	SetDefaultArmorData(165091, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsConjuration03
	SetDefaultArmorData(165092, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsDestruction01
	SetDefaultArmorData(165093, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsDestruction02
	SetDefaultArmorData(165094, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsDestruction03
	SetDefaultArmorData(165095, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsLockpicking01
	SetDefaultArmorData(165096, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsLockpicking02
	SetDefaultArmorData(165097, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsLockpicking03
	SetDefaultArmorData(165098, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsMarksman01
	SetDefaultArmorData(165099, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsMarksman02
	SetDefaultArmorData(165100, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsMarksman03
	SetDefaultArmorData(165101, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsOneHanded01
	SetDefaultArmorData(165102, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsOneHanded02
	SetDefaultArmorData(165103, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsOneHanded03
	SetDefaultArmorData(165104, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsPickpocket01
	SetDefaultArmorData(165105, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsPickpocket02
	SetDefaultArmorData(165106, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsPickpocket03
	SetDefaultArmorData(165107, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsSmithing01
	SetDefaultArmorData(165108, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsSmithing02
	SetDefaultArmorData(165109, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsSmithing03
	SetDefaultArmorData(165110, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsTwoHanded01
	SetDefaultArmorData(165111, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsTwoHanded02
	SetDefaultArmorData(165112, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldGauntletsTwoHanded03
	SetDefaultArmorData(867012, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildGauntletsPlayer
	SetDefaultArmorData(867021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildGauntletsPlayerImproved
	SetDefaultArmorData(931288, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildLeaderGauntlets
	SetDefaultArmorData(1082693, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorLinweGauntlets
	SetDefaultArmorData(383879, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleGauntletsPlayer01
	SetDefaultArmorData(1035280, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleGauntletsPlayer02
	SetDefaultArmorData(1035281, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleGauntletsPlayer03
	SetDefaultArmorData(83800, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorDawnguardGauntletsHeavy
	SetDefaultArmorData(62462, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorDawnguardGauntletsLight
	SetDefaultArmorData(107807, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_GOOD) ; DLC1ArmorVampireGauntlets
	SetDefaultArmorData(175410, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC2TGArmorVariantGloves


	; Good (15 - 18)
	SetDefaultArmorData(80191, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonscaleGauntlets
	SetDefaultArmorData(883152, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsAlchemy04
	SetDefaultArmorData(883153, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsAlchemy05
	SetDefaultArmorData(883154, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsAlchemy06
	SetDefaultArmorData(1105777, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsLockpicking04
	SetDefaultArmorData(1105778, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsLockpicking05
	SetDefaultArmorData(1105779, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsLockpicking06
	SetDefaultArmorData(883173, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsMarksman04
	SetDefaultArmorData(883174, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsMarksman05
	SetDefaultArmorData(883175, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsMarksman06
	SetDefaultArmorData(883176, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsOneHanded04
	SetDefaultArmorData(883177, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsOneHanded05
	SetDefaultArmorData(883178, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsOneHanded06
	SetDefaultArmorData(1105774, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsPickpocket04
	SetDefaultArmorData(1105775, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsPickpocket05
	SetDefaultArmorData(1105776, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsPickpocket06
	SetDefaultArmorData(883182, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsSmithing04
	SetDefaultArmorData(883183, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsSmithing05
	SetDefaultArmorData(883184, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsSmithing06
	SetDefaultArmorData(883185, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsTwoHanded04
	SetDefaultArmorData(883186, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsTwoHanded05
	SetDefaultArmorData(883187, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleGauntletsTwoHanded06
	SetDefaultArmorData(80206, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDwarvenGauntlets
	SetDefaultArmorData(570995, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsAlchemy02
	SetDefaultArmorData(570996, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsAlchemy03
	SetDefaultArmorData(570997, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsAlchemy04
	SetDefaultArmorData(111611, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsMarksman02
	SetDefaultArmorData(111612, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsMarksman03
	SetDefaultArmorData(111613, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsMarksman04
	SetDefaultArmorData(112469, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsOneHanded02
	SetDefaultArmorData(112470, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsOneHanded03
	SetDefaultArmorData(112471, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsOneHanded04
	SetDefaultArmorData(112481, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsSmithing02
	SetDefaultArmorData(112482, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsSmithing03
	SetDefaultArmorData(112486, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsSmithing04
	SetDefaultArmorData(112487, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsTwoHanded02
	SetDefaultArmorData(112488, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsTwoHanded03
	SetDefaultArmorData(112490, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenGauntletsTwoHanded04
	SetDefaultArmorData(80221, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorSteelPlateGauntlets
	SetDefaultArmorData(571033, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsAlchemy02
	SetDefaultArmorData(571034, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsAlchemy03
	SetDefaultArmorData(571035, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsAlchemy04
	SetDefaultArmorData(253739, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsMarksman02
	SetDefaultArmorData(253772, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsMarksman03
	SetDefaultArmorData(253794, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsMarksman04
	SetDefaultArmorData(253798, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsOneHanded02
	SetDefaultArmorData(253799, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsOneHanded03
	SetDefaultArmorData(253803, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsOneHanded04
	SetDefaultArmorData(253811, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsSmithing02
	SetDefaultArmorData(253812, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsSmithing03
	SetDefaultArmorData(253813, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsSmithing04
	SetDefaultArmorData(253814, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsTwoHanded02
	SetDefaultArmorData(253815, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsTwoHanded03
	SetDefaultArmorData(253816, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateGauntletsTwoHanded04
	SetDefaultArmorData(80226, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorEbonyGauntlets
	SetDefaultArmorData(849997, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsAlchemy03
	SetDefaultArmorData(849998, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsAlchemy04
	SetDefaultArmorData(849999, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsAlchemy05
	SetDefaultArmorData(850018, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsMarksman03
	SetDefaultArmorData(850019, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsMarksman04
	SetDefaultArmorData(850020, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsMarksman05
	SetDefaultArmorData(850021, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsOneHanded03
	SetDefaultArmorData(850022, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsOneHanded04
	SetDefaultArmorData(850023, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsOneHanded05
	SetDefaultArmorData(850027, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsSmithing03
	SetDefaultArmorData(850028, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsSmithing04
	SetDefaultArmorData(850029, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsSmithing05
	SetDefaultArmorData(850030, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsTwoHanded03
	SetDefaultArmorData(850031, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsTwoHanded04
	SetDefaultArmorData(850032, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyGauntletsTwoHanded05
	SetDefaultArmorData(80231, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonplateGauntlets
	SetDefaultArmorData(883260, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsAlchemy04
	SetDefaultArmorData(883261, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsAlchemy05
	SetDefaultArmorData(883262, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsAlchemy06
	SetDefaultArmorData(883281, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsMarksman04
	SetDefaultArmorData(883282, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsMarksman05
	SetDefaultArmorData(883283, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsMarksman06
	SetDefaultArmorData(883284, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsOneHanded04
	SetDefaultArmorData(883285, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsOneHanded05
	SetDefaultArmorData(883286, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsOneHanded06
	SetDefaultArmorData(883290, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsSmithing04
	SetDefaultArmorData(883291, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsSmithing05
	SetDefaultArmorData(883292, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsSmithing06
	SetDefaultArmorData(883293, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsTwoHanded04
	SetDefaultArmorData(883294, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsTwoHanded05
	SetDefaultArmorData(883295, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateGauntletsTwoHanded06
	SetDefaultArmorData(80236, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDaedricGauntlets
	SetDefaultArmorData(883374, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsAlchemy04
	SetDefaultArmorData(883375, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsAlchemy05
	SetDefaultArmorData(883376, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsAlchemy06
	SetDefaultArmorData(883395, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsMarksman04
	SetDefaultArmorData(883396, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsMarksman05
	SetDefaultArmorData(883397, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsMarksman06
	SetDefaultArmorData(883398, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsOneHanded04
	SetDefaultArmorData(883399, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsOneHanded05
	SetDefaultArmorData(883400, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsOneHanded06
	SetDefaultArmorData(883404, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsSmithing04
	SetDefaultArmorData(883405, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsSmithing05
	SetDefaultArmorData(883406, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsSmithing06
	SetDefaultArmorData(883407, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsTwoHanded04
	SetDefaultArmorData(883408, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsTwoHanded05
	SetDefaultArmorData(883409, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricGauntletsTwoHanded06
	SetDefaultArmorData(551299, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorStormcloakBearGauntlets
	SetDefaultArmorData(868011, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorPenitusGauntlets
	SetDefaultArmorData(51223, "Dawnguard.esm", GEARTYPE_HANDS, WARMTH_GOOD, COVERAGE_GOOD) ; DLC1IvoryGauntlets


	; Excellent (19 - 21)
	SetDefaultArmorData(80216, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorOrcishGauntlets
	SetDefaultArmorData(849880, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsAlchemy03
	SetDefaultArmorData(849881, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsAlchemy04
	SetDefaultArmorData(849882, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsAlchemy05
	SetDefaultArmorData(849901, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsMarksman03
	SetDefaultArmorData(849902, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsMarksman04
	SetDefaultArmorData(849903, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsMarksman05
	SetDefaultArmorData(849904, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsOneHanded03
	SetDefaultArmorData(849905, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsOneHanded04
	SetDefaultArmorData(849906, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsOneHanded05
	SetDefaultArmorData(849910, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsSmithing03
	SetDefaultArmorData(849911, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsSmithing04
	SetDefaultArmorData(849912, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsSmithing05
	SetDefaultArmorData(849913, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsTwoHanded03
	SetDefaultArmorData(849914, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsTwoHanded04
	SetDefaultArmorData(849915, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishGauntletsTwoHanded05
	SetDefaultArmorData(847486, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorCompanionsGauntlets
	SetDefaultArmorData(683389, "Skyrim.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorStormcloakGauntlets
	SetDefaultArmorData(267721, "Campfire.esm", GEARTYPE_HANDS, WARMTH_EXCELLENT, COVERAGE_FAIR) ; _Camp_ArmorSonsGauntlets
	
	
	; Max (22 - 24)
	SetDefaultArmorData(118176, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimHeavyGauntlets
	SetDefaultArmorData(168487, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy04
	SetDefaultArmorData(168488, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy05
	SetDefaultArmorData(168489, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy06
	SetDefaultArmorData(168490, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman04
	SetDefaultArmorData(168491, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman05
	SetDefaultArmorData(168492, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman06
	SetDefaultArmorData(168493, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded04
	SetDefaultArmorData(168494, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded05
	SetDefaultArmorData(168495, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded06
	SetDefaultArmorData(168496, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing04
	SetDefaultArmorData(168497, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing05
	SetDefaultArmorData(168498, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing06
	SetDefaultArmorData(168499, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded04
	SetDefaultArmorData(168500, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded05
	SetDefaultArmorData(168501, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded06
	SetDefaultArmorData(118181, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimLightGauntlets
	SetDefaultArmorData(168128, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy03
	SetDefaultArmorData(168129, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy04
	SetDefaultArmorData(168130, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy05
	SetDefaultArmorData(168131, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking03
	SetDefaultArmorData(168132, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking04
	SetDefaultArmorData(168133, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking05
	SetDefaultArmorData(168134, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsMarksman03
	SetDefaultArmorData(168135, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsMarksman04
	SetDefaultArmorData(168136, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsMarksman05
	SetDefaultArmorData(168137, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded03
	SetDefaultArmorData(168138, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded04
	SetDefaultArmorData(168139, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded05
	SetDefaultArmorData(168140, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket03
	SetDefaultArmorData(168141, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket04
	SetDefaultArmorData(168142, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket05
	SetDefaultArmorData(168143, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsSmithing03
	SetDefaultArmorData(168144, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsSmithing04
	SetDefaultArmorData(168145, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsSmithing05
	SetDefaultArmorData(168146, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded03
	SetDefaultArmorData(168147, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded04
	SetDefaultArmorData(168148, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded05
	SetDefaultArmorData(118168, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2ArmorNordicHeavyGauntlets
	SetDefaultArmorData(168389, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy03
	SetDefaultArmorData(168390, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy04
	SetDefaultArmorData(168391, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy05
	SetDefaultArmorData(168392, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsMarksman03
	SetDefaultArmorData(168393, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsMarksman04
	SetDefaultArmorData(168394, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsMarksman05
	SetDefaultArmorData(168395, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded03
	SetDefaultArmorData(168396, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded04
	SetDefaultArmorData(168397, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded05
	SetDefaultArmorData(168398, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsSmithing03
	SetDefaultArmorData(168399, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsSmithing04
	SetDefaultArmorData(168400, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsSmithing05
	SetDefaultArmorData(168401, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded03
	SetDefaultArmorData(168402, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded04
	SetDefaultArmorData(168403, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded05
	SetDefaultArmorData(233744, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ClothesSkaalGloves
	SetDefaultArmorData(147484, "Dragonborn.esm", GEARTYPE_HANDS, WARMTH_MAX, COVERAGE_FAIR) ; DLC2dunHaknirArmorGauntlets
endFunction

function SetDefaults_Feet()
	; Poor (0 - 8)
	SetDefaultArmorData(77387, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; ArmorIronBoots
	SetDefaultArmorData(500000, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsCarry01
	SetDefaultArmorData(709979, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsCarry02
	SetDefaultArmorData(709980, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsCarry03
	SetDefaultArmorData(499952, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFire01
	SetDefaultArmorData(709981, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFire02
	SetDefaultArmorData(709982, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFire03
	SetDefaultArmorData(499953, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFrost01
	SetDefaultArmorData(709983, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFrost02
	SetDefaultArmorData(709984, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistFrost03
	SetDefaultArmorData(301970, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistShock01
	SetDefaultArmorData(709985, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistShock02
	SetDefaultArmorData(709986, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsResistShock03
	SetDefaultArmorData(1105807, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsStamina01
	SetDefaultArmorData(1105808, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsStamina02
	SetDefaultArmorData(1105809, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; EnchArmorIronBootsStamina03
	SetDefaultArmorData(248320, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerShoes
	SetDefaultArmorData(962515, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; MS02ForswornBoots
	SetDefaultArmorData(888142, "Skyrim.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; ForswornBoots
	SetDefaultArmorData(59882, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; ClothesPrisonerBloodyShoes
	SetDefaultArmorData(18393, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; DLC1ClothesMothPriestSandals
	SetDefaultArmorData(59613, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; DLC1ArmorFalmerHardenedBoots
	SetDefaultArmorData(9199, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_POOR, COVERAGE_POOR) ; DLC1ArmorFalmerHeavyBoots

	; Fair (9 - 13)
	SetDefaultArmorData(80144, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; ArmorHideBoots
	SetDefaultArmorData(500021, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsCarry01
	SetDefaultArmorData(709713, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsCarry02
	SetDefaultArmorData(709714, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsCarry03
	SetDefaultArmorData(500022, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFire01
	SetDefaultArmorData(709769, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFire02
	SetDefaultArmorData(709770, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFire03
	SetDefaultArmorData(500023, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFrost01
	SetDefaultArmorData(709771, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFrost02
	SetDefaultArmorData(709772, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistFrost03
	SetDefaultArmorData(500024, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistShock01
	SetDefaultArmorData(709773, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistShock02
	SetDefaultArmorData(709774, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsResistShock03
	SetDefaultArmorData(500025, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsSneak01
	SetDefaultArmorData(709775, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsSneak02
	SetDefaultArmorData(709776, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsSneak03
	SetDefaultArmorData(1105804, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsStamina01
	SetDefaultArmorData(1105805, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsStamina02
	SetDefaultArmorData(1105806, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorHideBootsStamina03
	SetDefaultArmorData(80160, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; ArmorLeatherBoots
	SetDefaultArmorData(737829, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsCarry01
	SetDefaultArmorData(737830, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsCarry02
	SetDefaultArmorData(737831, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsCarry03
	SetDefaultArmorData(737832, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFire01
	SetDefaultArmorData(737833, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFire02
	SetDefaultArmorData(737834, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFire03
	SetDefaultArmorData(737835, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFrost01
	SetDefaultArmorData(737836, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFrost02
	SetDefaultArmorData(737837, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistFrost03
	SetDefaultArmorData(737838, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistShock01
	SetDefaultArmorData(737839, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistShock02
	SetDefaultArmorData(737840, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsResistShock03
	SetDefaultArmorData(737841, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsSneak01
	SetDefaultArmorData(737842, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsSneak02
	SetDefaultArmorData(737843, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsSneak03
	SetDefaultArmorData(1105810, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsStamina01
	SetDefaultArmorData(1105811, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsStamina02
	SetDefaultArmorData(1105812, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_GOOD) ; EnchArmorLeatherBootsStamina03
	SetDefaultArmorData(80154, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorElvenBoots
	SetDefaultArmorData(1072913, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorElvenLightBoots
	SetDefaultArmorData(778169, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsCarry02
	SetDefaultArmorData(778170, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsCarry03
	SetDefaultArmorData(778171, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsCarry04
	SetDefaultArmorData(778172, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFire02
	SetDefaultArmorData(778173, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFire03
	SetDefaultArmorData(778232, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFire04
	SetDefaultArmorData(778174, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFrost02
	SetDefaultArmorData(778175, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFrost03
	SetDefaultArmorData(778298, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistFrost04
	SetDefaultArmorData(778176, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistShock02
	SetDefaultArmorData(778177, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistShock03
	SetDefaultArmorData(778299, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsResistShock04
	SetDefaultArmorData(778178, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsSneak02
	SetDefaultArmorData(778179, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsSneak03
	SetDefaultArmorData(778300, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsSneak04
	SetDefaultArmorData(1105798, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsStamina02
	SetDefaultArmorData(1105799, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsStamina03
	SetDefaultArmorData(1105800, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorElvenBootsStamina04
	SetDefaultArmorData(111519, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; ArmorScaledBoots
	SetDefaultArmorData(873446, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsCarry02
	SetDefaultArmorData(873447, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsCarry03
	SetDefaultArmorData(873448, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsCarry04
	SetDefaultArmorData(873449, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFire02
	SetDefaultArmorData(873450, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFire03
	SetDefaultArmorData(873451, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFire04
	SetDefaultArmorData(873452, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFrost02
	SetDefaultArmorData(873453, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFrost03
	SetDefaultArmorData(873454, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistFrost04
	SetDefaultArmorData(873455, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistShock02
	SetDefaultArmorData(873456, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistShock03
	SetDefaultArmorData(873457, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsResistShock04
	SetDefaultArmorData(873458, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsSneak02
	SetDefaultArmorData(873459, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsSneak03
	SetDefaultArmorData(873460, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsSneak04
	SetDefaultArmorData(1105816, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsStamina02
	SetDefaultArmorData(1105817, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsStamina03
	SetDefaultArmorData(1105818, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; EnchArmorScaledBootsStamina04
	SetDefaultArmorData(80184, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorGlassBoots
	SetDefaultArmorData(873326, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsCarry03
	SetDefaultArmorData(873327, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsCarry04
	SetDefaultArmorData(873328, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsCarry05
	SetDefaultArmorData(873329, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsMuffle
	SetDefaultArmorData(873330, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFire03
	SetDefaultArmorData(873331, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFire04
	SetDefaultArmorData(873332, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFire05
	SetDefaultArmorData(873333, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFrost03
	SetDefaultArmorData(873334, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFrost04
	SetDefaultArmorData(873335, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistFrost05
	SetDefaultArmorData(873336, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistShock03
	SetDefaultArmorData(873337, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistShock04
	SetDefaultArmorData(873338, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsResistShock05
	SetDefaultArmorData(1105780, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsSneak03
	SetDefaultArmorData(1105781, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsSneak04
	SetDefaultArmorData(1105782, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsSneak05
	SetDefaultArmorData(1105801, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsStamina03
	SetDefaultArmorData(1105802, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsStamina04
	SetDefaultArmorData(1105803, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorGlassBootsStamina05
	SetDefaultArmorData(80209, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorSteelBootsA
	SetDefaultArmorData(1011489, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorSteelBootsB
	SetDefaultArmorData(741530, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsCarry01
	SetDefaultArmorData(741531, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsCarry02
	SetDefaultArmorData(741532, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsCarry03
	SetDefaultArmorData(600693, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsMuffle
	SetDefaultArmorData(741533, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFire01
	SetDefaultArmorData(741534, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFire02
	SetDefaultArmorData(741535, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFire03
	SetDefaultArmorData(741536, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFrost01
	SetDefaultArmorData(741625, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFrost02
	SetDefaultArmorData(741537, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistFrost03
	SetDefaultArmorData(741538, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistShock01
	SetDefaultArmorData(741539, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistShock02
	SetDefaultArmorData(741540, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsResistShock03
	SetDefaultArmorData(1105819, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsStamina01
	SetDefaultArmorData(1105820, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsStamina02
	SetDefaultArmorData(1105821, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorSteelBootsStamina03
	SetDefaultArmorData(862277, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorBoots
	SetDefaultArmorData(925460, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorBootsSP
	SetDefaultArmorData(1108828, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DBArmorBootsWornPlayable
	SetDefaultArmorData(354973, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; ArmorDraugrBoots
	SetDefaultArmorData(307848, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorBladesBoots
	SetDefaultArmorData(79574, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorImperialBoots
	SetDefaultArmorData(81623, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; ArmorImperialLightBoots
	SetDefaultArmorData(707771, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsCarry01
	SetDefaultArmorData(709855, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsCarry02
	SetDefaultArmorData(709856, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsCarry03
	SetDefaultArmorData(707772, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFire01
	SetDefaultArmorData(709857, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFire02
	SetDefaultArmorData(709858, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFire03
	SetDefaultArmorData(707773, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFrost01
	SetDefaultArmorData(709859, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFrost02
	SetDefaultArmorData(709860, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistFrost03
	SetDefaultArmorData(707774, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistShock01
	SetDefaultArmorData(709861, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistShock02
	SetDefaultArmorData(709862, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsResistShock03
	SetDefaultArmorData(707775, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsSneak01
	SetDefaultArmorData(709863, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsSneak02
	SetDefaultArmorData(709864, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialBootsSneak03
	SetDefaultArmorData(759565, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsCarry01
	SetDefaultArmorData(759566, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsCarry02
	SetDefaultArmorData(759567, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsCarry03
	SetDefaultArmorData(759568, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFire01
	SetDefaultArmorData(759569, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFire02
	SetDefaultArmorData(759570, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFire03
	SetDefaultArmorData(759571, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFrost01
	SetDefaultArmorData(759572, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFrost02
	SetDefaultArmorData(759573, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistFrost03
	SetDefaultArmorData(759574, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistShock01
	SetDefaultArmorData(759575, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistShock02
	SetDefaultArmorData(759576, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsResistShock03
	SetDefaultArmorData(759577, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsSneak01
	SetDefaultArmorData(759578, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsSneak02
	SetDefaultArmorData(759579, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; EnchArmorImperialLightBootsSneak03
	SetDefaultArmorData(416684, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; ClothesThalmorBoots
	SetDefaultArmorData(867010, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildBootsPlayer
	SetDefaultArmorData(867019, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildBootsPlayerImproved
	SetDefaultArmorData(931286, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorThievesGuildLeaderBoots
	SetDefaultArmorData(1082691, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; ArmorLinweBoots
	SetDefaultArmorData(1035276, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleBootsPlayer01
	SetDefaultArmorData(383877, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleBootsPlayer02
	SetDefaultArmorData(1035277, "Skyrim.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_MAX) ; ArmorNightingaleBootsPlayer03
	SetDefaultArmorData(83799, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorDawnguardBootsHeavy
	SetDefaultArmorData(62464, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC1ArmorDawnguardBootsLight
	SetDefaultArmorData(46558, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC1ArmorVampireBoots
	SetDefaultArmorData(165062, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsCarry01
	SetDefaultArmorData(165063, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsCarry02
	SetDefaultArmorData(165064, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsCarry03
	SetDefaultArmorData(165065, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFire01
	SetDefaultArmorData(165066, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFire02
	SetDefaultArmorData(165067, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFire03
	SetDefaultArmorData(165068, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFrost01
	SetDefaultArmorData(165069, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFrost02
	SetDefaultArmorData(165070, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistFrost03
	SetDefaultArmorData(165071, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistShock01
	SetDefaultArmorData(165072, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistShock02
	SetDefaultArmorData(165073, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsResistShock03
	SetDefaultArmorData(165074, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsSneak01
	SetDefaultArmorData(165075, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsSneak02
	SetDefaultArmorData(165076, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorBonemoldBootsSneak03
	SetDefaultArmorData(118150, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorChitinLightBoots
	SetDefaultArmorData(167903, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsCarry02
	SetDefaultArmorData(167933, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsCarry03
	SetDefaultArmorData(167904, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsCarry04
	SetDefaultArmorData(167905, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFire02
	SetDefaultArmorData(167906, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFire03
	SetDefaultArmorData(167907, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFire04
	SetDefaultArmorData(167908, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFrost02
	SetDefaultArmorData(167909, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFrost03
	SetDefaultArmorData(167910, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistFrost04
	SetDefaultArmorData(167911, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistShock02
	SetDefaultArmorData(167912, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistShock03
	SetDefaultArmorData(167913, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsResistShock04
	SetDefaultArmorData(167914, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsSneak02
	SetDefaultArmorData(167915, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsSneak03
	SetDefaultArmorData(167916, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsSneak04
	SetDefaultArmorData(167917, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsStamina02
	SetDefaultArmorData(167918, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsStamina03
	SetDefaultArmorData(167919, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinLightBootsStamina04
	SetDefaultArmorData(118146, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorChitinHeavyBoots
	SetDefaultArmorData(168275, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsCarry02
	SetDefaultArmorData(168276, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsCarry03
	SetDefaultArmorData(168277, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsCarry04
	SetDefaultArmorData(168278, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsMuffle
	SetDefaultArmorData(168279, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFire02
	SetDefaultArmorData(168280, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFire03
	SetDefaultArmorData(168281, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFire04
	SetDefaultArmorData(168282, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFrost02
	SetDefaultArmorData(168283, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFrost03
	SetDefaultArmorData(168284, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistFrost04
	SetDefaultArmorData(168285, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistShock02
	SetDefaultArmorData(168286, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistShock03
	SetDefaultArmorData(168287, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsResistShock04
	SetDefaultArmorData(168288, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsStamina02
	SetDefaultArmorData(168289, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsStamina03
	SetDefaultArmorData(168290, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2EnchArmorChitinHeavyBootsStamina04
	SetDefaultArmorData(168619, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2MoragTongBoots
	SetDefaultArmorData(116309, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_POOR) ; DLC2dunKolbjornBoots
	SetDefaultArmorData(175412, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_EXCELLENT) ; DLC2TGArmorVariantBoots
	SetDefaultArmorData(118162, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_FAIR, COVERAGE_FAIR) ; DLC2ArmorBonemoldBoots

	; Good (14 - 18)
	SetDefaultArmorData(455576, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_POOR) ; ArmorBanditBoots
	SetDefaultArmorData(80189, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonscaleBoots
	SetDefaultArmorData(883111, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsCarry04
	SetDefaultArmorData(883112, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsCarry05
	SetDefaultArmorData(883113, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsCarry06
	SetDefaultArmorData(883115, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFire04
	SetDefaultArmorData(883116, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFire05
	SetDefaultArmorData(883117, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFire06
	SetDefaultArmorData(883118, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFrost04
	SetDefaultArmorData(883119, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFrost05
	SetDefaultArmorData(883120, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistFrost06
	SetDefaultArmorData(883121, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistShock04
	SetDefaultArmorData(883122, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistShock05
	SetDefaultArmorData(883123, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsResistShock06
	SetDefaultArmorData(883114, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsSneak04
	SetDefaultArmorData(1038853, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsSneak05
	SetDefaultArmorData(1038854, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsSneak06
	SetDefaultArmorData(1105789, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsStamina04
	SetDefaultArmorData(1105790, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsStamina05
	SetDefaultArmorData(1105791, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonscaleBootsStamina06
	SetDefaultArmorData(80204, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDwarvenBoots
	SetDefaultArmorData(111413, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsCarry02
	SetDefaultArmorData(111421, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsCarry03
	SetDefaultArmorData(111563, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsCarry04
	SetDefaultArmorData(600713, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsMuffle
	SetDefaultArmorData(111564, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFire02
	SetDefaultArmorData(111565, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFire03
	SetDefaultArmorData(111566, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFire04
	SetDefaultArmorData(111567, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFrost02
	SetDefaultArmorData(111568, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFrost03
	SetDefaultArmorData(111569, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistFrost04
	SetDefaultArmorData(111570, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistShock02
	SetDefaultArmorData(111571, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistShock03
	SetDefaultArmorData(111572, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsResistShock04
	SetDefaultArmorData(1105792, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsStamina02
	SetDefaultArmorData(1105793, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsStamina03
	SetDefaultArmorData(1105794, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDwarvenBootsStamina04
	SetDefaultArmorData(80219, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorSteelPlateBoots
	SetDefaultArmorData(111391, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsCarry02
	SetDefaultArmorData(111614, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsCarry03
	SetDefaultArmorData(111615, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsCarry04
	SetDefaultArmorData(600718, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsMuffle
	SetDefaultArmorData(111616, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFire02
	SetDefaultArmorData(111617, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFire03
	SetDefaultArmorData(111618, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFire04
	SetDefaultArmorData(111619, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFrost02
	SetDefaultArmorData(111620, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFrost03
	SetDefaultArmorData(111621, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistFrost04
	SetDefaultArmorData(111622, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistShock02
	SetDefaultArmorData(111623, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistShock03
	SetDefaultArmorData(111624, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsResistShock04
	SetDefaultArmorData(1105822, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsStamina02
	SetDefaultArmorData(1105823, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsStamina03
	SetDefaultArmorData(1105824, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorSteelPlateBootsStamina04
	SetDefaultArmorData(80224, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorEbonyBoots
	SetDefaultArmorData(849956, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsCarry03
	SetDefaultArmorData(849957, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsCarry04
	SetDefaultArmorData(849958, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsCarry05
	SetDefaultArmorData(849959, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsMuffle
	SetDefaultArmorData(849960, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFire03
	SetDefaultArmorData(849961, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFire04
	SetDefaultArmorData(849962, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFire05
	SetDefaultArmorData(849963, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFrost03
	SetDefaultArmorData(849964, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFrost04
	SetDefaultArmorData(849965, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistFrost05
	SetDefaultArmorData(849966, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistShock03
	SetDefaultArmorData(849967, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistShock04
	SetDefaultArmorData(849968, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsResistShock05
	SetDefaultArmorData(1105795, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsStamina03
	SetDefaultArmorData(1105796, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsStamina04
	SetDefaultArmorData(1105797, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; EnchArmorEbonyBootsStamina05
	SetDefaultArmorData(80229, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; ArmorDragonplateBoots
	SetDefaultArmorData(883228, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsCarry04
	SetDefaultArmorData(883229, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsCarry05
	SetDefaultArmorData(883230, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsCarry06
	SetDefaultArmorData(883231, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsMuffle
	SetDefaultArmorData(883232, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFire04
	SetDefaultArmorData(883233, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFire05
	SetDefaultArmorData(883234, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFire06
	SetDefaultArmorData(883235, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFrost04
	SetDefaultArmorData(883236, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFrost05
	SetDefaultArmorData(883237, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistFrost06
	SetDefaultArmorData(883349, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistShock04
	SetDefaultArmorData(883350, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistShock05
	SetDefaultArmorData(883351, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsResistShock06
	SetDefaultArmorData(1105786, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsStamina04
	SetDefaultArmorData(1105787, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsStamina05
	SetDefaultArmorData(1105788, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_EXCELLENT) ; EnchArmorDragonplateBootsStamina06
	SetDefaultArmorData(80234, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorDaedricBoots
	SetDefaultArmorData(883336, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsCarry04
	SetDefaultArmorData(883337, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsCarry05
	SetDefaultArmorData(883338, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsCarry06
	SetDefaultArmorData(883339, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsMuffle
	SetDefaultArmorData(883340, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFire04
	SetDefaultArmorData(883341, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFire05
	SetDefaultArmorData(883342, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFire06
	SetDefaultArmorData(883343, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFrost04
	SetDefaultArmorData(883344, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFrost05
	SetDefaultArmorData(883345, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistFrost06
	SetDefaultArmorData(883346, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistShock04
	SetDefaultArmorData(883347, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistShock05
	SetDefaultArmorData(883348, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsResistShock06
	SetDefaultArmorData(1105783, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsStamina04
	SetDefaultArmorData(1105784, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsStamina05
	SetDefaultArmorData(1105785, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; EnchArmorDaedricBootsStamina06
	SetDefaultArmorData(551297, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_FAIR) ; ArmorStormcloakBearBoots
	SetDefaultArmorData(868007, "Skyrim.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; ArmorPenitusBoots
	SetDefaultArmorData(51221, "Dawnguard.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; DLC1IvoryBoots
	SetDefaultArmorData(240421, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_GOOD, COVERAGE_GOOD) ; DLC2ArmorBonemoldImprovedBoots


	; Excellent (21)
	SetDefaultArmorData(80214, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorOrcishBoots
	SetDefaultArmorData(849839, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsCarry03
	SetDefaultArmorData(849840, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsCarry04
	SetDefaultArmorData(849841, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsCarry05
	SetDefaultArmorData(849842, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsMuffle
	SetDefaultArmorData(849843, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFire03
	SetDefaultArmorData(849844, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFire04
	SetDefaultArmorData(849845, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFire05
	SetDefaultArmorData(849846, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFrost03
	SetDefaultArmorData(849847, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFrost04
	SetDefaultArmorData(849848, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistFrost05
	SetDefaultArmorData(849849, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistShock03
	SetDefaultArmorData(849850, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistShock04
	SetDefaultArmorData(849851, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsResistShock05
	SetDefaultArmorData(1105813, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsStamina03
	SetDefaultArmorData(1105814, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsStamina04
	SetDefaultArmorData(1105815, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; EnchArmorOrcishBootsStamina05
	SetDefaultArmorData(267720, "Campfire.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; _Camp_ArmorSonsBoots
	SetDefaultArmorData(847484, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorCompanionsBoots
	SetDefaultArmorData(683391, "Skyrim.esm", GEARTYPE_FEET, WARMTH_EXCELLENT, COVERAGE_FAIR) ; ArmorStormcloakBoots
	

	; Max (24)
	SetDefaultArmorData(118174, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimHeavyBoots
	SetDefaultArmorData(168444, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsCarry04
	SetDefaultArmorData(168445, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsCarry05
	SetDefaultArmorData(168446, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsCarry06
	SetDefaultArmorData(168447, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsMuffle
	SetDefaultArmorData(168448, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFire04
	SetDefaultArmorData(168449, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFire05
	SetDefaultArmorData(168450, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFire06
	SetDefaultArmorData(168451, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost04
	SetDefaultArmorData(168452, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost05
	SetDefaultArmorData(168453, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost06
	SetDefaultArmorData(168454, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistShock04
	SetDefaultArmorData(168455, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistShock05
	SetDefaultArmorData(168456, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsResistShock06
	SetDefaultArmorData(168457, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsStamina04
	SetDefaultArmorData(168458, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsStamina05
	SetDefaultArmorData(168459, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimHeavyBootsStamina06
	SetDefaultArmorData(118142, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ArmorStalhrimLightBoots
	SetDefaultArmorData(168083, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsCarry03
	SetDefaultArmorData(168084, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsCarry04
	SetDefaultArmorData(168085, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsCarry05
	SetDefaultArmorData(168192, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsMuffle
	SetDefaultArmorData(168086, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFire03
	SetDefaultArmorData(168087, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFire04
	SetDefaultArmorData(168088, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFire05
	SetDefaultArmorData(168089, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFrost03
	SetDefaultArmorData(168090, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFrost04
	SetDefaultArmorData(168091, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistFrost05
	SetDefaultArmorData(168093, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistShock03
	SetDefaultArmorData(168094, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistShock04
	SetDefaultArmorData(168095, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsResistShock05
	SetDefaultArmorData(168092, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsSneak03
	SetDefaultArmorData(168096, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsSneak04
	SetDefaultArmorData(168097, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsSneak05
	SetDefaultArmorData(168098, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsStamina03
	SetDefaultArmorData(168099, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsStamina04
	SetDefaultArmorData(168100, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2EnchArmorStalhrimLightBootsStamina05
	SetDefaultArmorData(118166, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2ArmorNordicHeavyBoots
	SetDefaultArmorData(168352, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsCarry03
	SetDefaultArmorData(168353, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsCarry04
	SetDefaultArmorData(168354, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsCarry05
	SetDefaultArmorData(168355, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsMuffle
	SetDefaultArmorData(168356, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFire03
	SetDefaultArmorData(168357, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFire04
	SetDefaultArmorData(168358, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFire05
	SetDefaultArmorData(168359, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFrost03
	SetDefaultArmorData(168360, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFrost04
	SetDefaultArmorData(168361, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistFrost05
	SetDefaultArmorData(168362, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistShock03
	SetDefaultArmorData(168363, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistShock04
	SetDefaultArmorData(168364, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsResistShock05
	SetDefaultArmorData(168365, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsStamina03
	SetDefaultArmorData(168366, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsStamina04
	SetDefaultArmorData(168367, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_GOOD) ; DLC2EnchArmorNordicHeavyBootsStamina05
	SetDefaultArmorData(233746, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2ClothesSkaalBoots
	SetDefaultArmorData(147482, "Dragonborn.esm", GEARTYPE_FEET, WARMTH_MAX, COVERAGE_FAIR) ; DLC2dunHaknirArmorBoots
endFunction

function SetDefaults_Cloak()
	SetDefaultArmorData(260764, "Campfire.esm", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKCLOTH) ; _Camp_Cloak_BasicBurlap
	SetDefaultArmorData(260765, "Campfire.esm", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKCLOTH) ; _Camp_Cloak_BasicLinen
	SetDefaultArmorData(260766, "Campfire.esm", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKFUR) ; _Camp_Cloak_BasicFur
	SetDefaultArmorData(260767, "Campfire.esm", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKLEATHER) ; _Camp_Cloak_BasicHide
	SetDefaultArmorData(356637, "Frostfall.esp", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKCLOTH) ; _Frost_Cloak_BoundLesser
	SetDefaultArmorData(359400, "Frostfall.esp", GEARTYPE_CLOAK, aiExtraType = EXTRA_CLOAKFUR) ; _Frost_Cloak_BoundGreater
endFunction

function SetDefaults_Shield()
	SetDefaultArmorData(151754, "Campfire.esm", GEARTYPE_IGNORE) ; _Camp_WalkingStickShield
endFunction

;
; Defaults
;

function SetDefaultArmorData(int aiFormID, string asPluginName, int aiGearType, int aiWarmthType = 0, int aiCoverageType = 0, int aiHeadWarmthType = 0, int aiHeadCoverageType = 0, int aiExtraType = 0)
	;debug.trace("SetDefaultArmorData " + aiFormID + " " + asPluginName + " " + aiGearType + " " + aiWarmthType + " " + aiCoverageType + " " + aiHeadWarmthType + " " + aiHeadCoverageType + " " + aiExtraType)
	if aiGearType == GEARTYPE_BODY
		SetDefaultArmorDataBody(aiFormID, asPluginName, aiWarmthType, aiCoverageType, aiHeadWarmthType, aiHeadCoverageType, aiExtraType)
	elseif aiGearType == GEARTYPE_HEAD
		SetDefaultArmorDataHead(aiFormID, asPluginName, aiWarmthType, aiCoverageType, aiExtraType)
	elseif aiGearType == GEARTYPE_HANDS
		SetDefaultArmorDataHands(aiFormID, asPluginName, aiWarmthType, aiCoverageType)
	elseif aiGearType == GEARTYPE_FEET
		SetDefaultArmorDataFeet(aiFormID, asPluginName, aiWarmthType, aiCoverageType)
	elseif aiGearType == GEARTYPE_CLOAK
		SetDefaultArmorDataCloak(aiFormID, asPluginName, aiExtraType)
	elseif aiGearType == GEARTYPE_MISC
		SetDefaultArmorDataMisc(aiFormID, asPluginName, aiExtraType)
	elseif aiGearType == GEARTYPE_IGNORE
		SetDefaultArmorDataIgnore(aiFormID, asPluginName)
	endif
endFunction

function SetDefaultArmorDataBody(int aiFormID, string asPluginName, int aiWarmthType, int aiCoverageType, int aiHeadWarmthType = 0, int aiHeadCoverageType = 0, int aiExtraCloakType = 0)	
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
		SetDefaultArmorDataHead(aiFormID, asPluginName, aiHeadWarmthType, aiHeadCoverageType)
	endif

	if aiExtraCloakType != 0
		SetDefaultArmorDataCloak(aiFormID, asPluginName, aiExtraCloakType)
	endif
endFunction

function SetDefaultArmorDataHead(int aiFormID, string asPluginName, int aiWarmthType, int aiCoverageType, int aiExtraCloakType = 0)
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
		SetDefaultArmorDataCloak(aiFormID, asPluginName, aiExtraCloakType)
	endif
endFunction

function SetDefaultArmorDataHands(int aiFormID, string asPluginName, int aiWarmthType, int aiCoverageType)
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

function SetDefaultArmorDataFeet(int aiFormID, string asPluginName, int aiWarmthType, int aiCoverageType)
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

function SetDefaultArmorDataCloak(int aiFormID, string asPluginName, int aiCloakType)
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

function SetDefaultArmorDataMisc(int aiFormID, string asPluginName, int aiExtraType)
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

function SetDefaultArmorDataIgnore(int aiFormID, string asPluginName)
	Armor theArmor = Game.GetFormFromFile(aiFormID, asPluginName) as Armor
	if !theArmor
		return
	endif

	LinkedArrayAddArmor(theArmor, ArmorIgnore1, ArmorIgnore2, ArmorIgnore3, ArmorIgnore4)
endFunction

;
; Custom Values
;

function SetArmorData(Armor akArmor, int aiGearType, int aiWarmthType = 0, int aiCoverageType = 0, int aiHeadWarmthType = 0, int aiHeadCoverageType = 0, int aiExtraType = 0)
	;debug.trace("SetArmorData " + aiFormID + " " + asPluginName + " " + aiGearType + " " + aiWarmthType + " " + aiCoverageType + " " + aiHeadWarmthType + " " + aiHeadCoverageType + " " + aiExtraType)
	if aiGearType == GEARTYPE_BODY
		SetArmorDataBody(akArmor, aiWarmthType, aiCoverageType, aiHeadWarmthType, aiHeadCoverageType, aiExtraType)
	elseif aiGearType == GEARTYPE_HEAD
		SetArmorDataHead(akArmor, aiWarmthType, aiCoverageType, aiExtraType)
	elseif aiGearType == GEARTYPE_HANDS
		SetArmorDataHands(akArmor, aiWarmthType, aiCoverageType)
	elseif aiGearType == GEARTYPE_FEET
		SetArmorDataFeet(akArmor, aiWarmthType, aiCoverageType)
	elseif aiGearType == GEARTYPE_CLOAK
		SetArmorDataCloak(akArmor, aiExtraType)
	elseif aiGearType == GEARTYPE_MISC
		SetArmorDataMisc(akArmor, aiExtraType)
	elseif aiGearType == GEARTYPE_IGNORE
		SetArmorDataIgnore(akArmor)
	endif
endFunction

function UnsetArmorData(Armor akArmor, int aiGearType)
	if aiGearType == GEARTYPE_BODY
		UnsetArmorDataBody(akArmor)
	elseif aiGearType == GEARTYPE_HEAD
		UnsetArmorDataHead(akArmor)
	elseif aiGearType == GEARTYPE_HANDS
		UnsetArmorDataHands(akArmor)
	elseif aiGearType == GEARTYPE_FEET
		UnsetArmorDataFeet(akArmor)
	elseif aiGearType == GEARTYPE_CLOAK
		UnsetArmorDataCloak(akArmor)
	elseif aiGearType == GEARTYPE_MISC
		UnsetArmorDataMisc(akArmor)
	endif
endFunction

function SetArmorDataBody(Armor akArmor, int aiWarmthType, int aiCoverageType, int aiHeadWarmthType = 0, int aiHeadCoverageType = 0, int aiExtraCloakType = 0)
	; Remove the armor from any existing arrays.
	UnsetArmorDataBody(akArmor)

	; Add the new entry.
	if aiWarmthType == WARMTH_POOR
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyWarmthPoor1, ArmorCustomBodyWarmthPoor2, ArmorCustomBodyWarmthPoor3, ArmorCustomBodyWarmthPoor4)
	elseif aiWarmthType == WARMTH_FAIR
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyWarmthFair1, ArmorCustomBodyWarmthFair2, ArmorCustomBodyWarmthFair3, ArmorCustomBodyWarmthFair4)
	elseif aiWarmthType == WARMTH_GOOD
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyWarmthGood1, ArmorCustomBodyWarmthGood2, ArmorCustomBodyWarmthGood3, ArmorCustomBodyWarmthGood4)
	elseif aiWarmthType == WARMTH_EXCELLENT
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyWarmthExcellent1, ArmorCustomBodyWarmthExcellent2, ArmorCustomBodyWarmthExcellent3, ArmorCustomBodyWarmthExcellent4)
	elseif aiWarmthType == WARMTH_MAX
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyWarmthMax1, ArmorCustomBodyWarmthMax2, ArmorCustomBodyWarmthMax3, ArmorCustomBodyWarmthMax4)
	endif

	if aiCoverageType == COVERAGE_POOR
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyCoveragePoor1, ArmorCustomBodyCoveragePoor2, ArmorCustomBodyCoveragePoor3, ArmorCustomBodyCoveragePoor4)
	elseif aiCoverageType == COVERAGE_FAIR
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyCoverageFair1, ArmorCustomBodyCoverageFair2, ArmorCustomBodyCoverageFair3, ArmorCustomBodyCoverageFair4)
	elseif aiCoverageType == COVERAGE_GOOD
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyCoverageGood1, ArmorCustomBodyCoverageGood2, ArmorCustomBodyCoverageGood3, ArmorCustomBodyCoverageGood4)
	elseif aiCoverageType == COVERAGE_EXCELLENT
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyCoverageExcellent1, ArmorCustomBodyCoverageExcellent2, ArmorCustomBodyCoverageExcellent3, ArmorCustomBodyCoverageExcellent4)
	elseif aiCoverageType == COVERAGE_MAX
		LinkedArrayAddArmor(akArmor, ArmorCustomBodyCoverageMax1, ArmorCustomBodyCoverageMax2, ArmorCustomBodyCoverageMax3, ArmorCustomBodyCoverageMax4)
	endif

	if aiHeadWarmthType > 0 || aiHeadCoverageType > 0
		SetArmorDataHead(akArmor, aiHeadWarmthType, aiHeadCoverageType)
	endif

	if aiExtraCloakType != 0
		SetArmorDataCloak(akArmor, aiExtraCloakType)
	endif
endFunction

function UnsetArmorDataBody(Armor akArmor)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyWarmthPoor1, ArmorCustomBodyWarmthPoor2, ArmorCustomBodyWarmthPoor3, ArmorCustomBodyWarmthPoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyWarmthFair1, ArmorCustomBodyWarmthFair2, ArmorCustomBodyWarmthFair3, ArmorCustomBodyWarmthFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyWarmthGood1, ArmorCustomBodyWarmthGood2, ArmorCustomBodyWarmthGood3, ArmorCustomBodyWarmthGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyWarmthExcellent1, ArmorCustomBodyWarmthExcellent2, ArmorCustomBodyWarmthExcellent3, ArmorCustomBodyWarmthExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyWarmthMax1, ArmorCustomBodyWarmthMax2, ArmorCustomBodyWarmthMax3, ArmorCustomBodyWarmthMax4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyCoveragePoor1, ArmorCustomBodyCoveragePoor2, ArmorCustomBodyCoveragePoor3, ArmorCustomBodyCoveragePoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyCoverageFair1, ArmorCustomBodyCoverageFair2, ArmorCustomBodyCoverageFair3, ArmorCustomBodyCoverageFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyCoverageGood1, ArmorCustomBodyCoverageGood2, ArmorCustomBodyCoverageGood3, ArmorCustomBodyCoverageGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyCoverageExcellent1, ArmorCustomBodyCoverageExcellent2, ArmorCustomBodyCoverageExcellent3, ArmorCustomBodyCoverageExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomBodyCoverageMax1, ArmorCustomBodyCoverageMax2, ArmorCustomBodyCoverageMax3, ArmorCustomBodyCoverageMax4)

	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthPoor1, ArmorCustomHeadWarmthPoor2, ArmorCustomHeadWarmthPoor3, ArmorCustomHeadWarmthPoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthFair1, ArmorCustomHeadWarmthFair2, ArmorCustomHeadWarmthFair3, ArmorCustomHeadWarmthFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthGood1, ArmorCustomHeadWarmthGood2, ArmorCustomHeadWarmthGood3, ArmorCustomHeadWarmthGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthExcellent1, ArmorCustomHeadWarmthExcellent2, ArmorCustomHeadWarmthExcellent3, ArmorCustomHeadWarmthExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthMax1, ArmorCustomHeadWarmthMax2, ArmorCustomHeadWarmthMax3, ArmorCustomHeadWarmthMax4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoveragePoor1, ArmorCustomHeadCoveragePoor2, ArmorCustomHeadCoveragePoor3, ArmorCustomHeadCoveragePoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoverageFair1, ArmorCustomHeadCoverageFair2, ArmorCustomHeadCoverageFair3, ArmorCustomHeadCoverageFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoverageGood1, ArmorCustomHeadCoverageGood2, ArmorCustomHeadCoverageGood3, ArmorCustomHeadCoverageGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoverageExcellent1, ArmorCustomHeadCoverageExcellent2, ArmorCustomHeadCoverageExcellent3, ArmorCustomHeadCoverageExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoverageMax1, ArmorCustomHeadCoverageMax2, ArmorCustomHeadCoverageMax3, ArmorCustomHeadCoverageMax4)

	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakCloth1, ArmorCustomCloakCloth2, ArmorCustomCloakCloth3, ArmorCustomCloakCloth4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakLeather1, ArmorCustomCloakLeather2, ArmorCustomCloakLeather3, ArmorCustomCloakLeather4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakFur1, ArmorCustomCloakFur2, ArmorCustomCloakFur3, ArmorCustomCloakFur4)
endFunction

function SetArmorDataHead(Armor akArmor, int aiWarmthType, int aiCoverageType, int aiExtraCloakType = 0)
	; Remove the armor from any existing arrays.
	UnsetArmorDataHead(akArmor)

	; Add the new entry.
	if aiWarmthType == WARMTH_POOR
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadWarmthPoor1, ArmorCustomHeadWarmthPoor2, ArmorCustomHeadWarmthPoor3, ArmorCustomHeadWarmthPoor4)
	elseif aiWarmthType == WARMTH_FAIR
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadWarmthFair1, ArmorCustomHeadWarmthFair2, ArmorCustomHeadWarmthFair3, ArmorCustomHeadWarmthFair4)
	elseif aiWarmthType == WARMTH_GOOD
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadWarmthGood1, ArmorCustomHeadWarmthGood2, ArmorCustomHeadWarmthGood3, ArmorCustomHeadWarmthGood4)
	elseif aiWarmthType == WARMTH_EXCELLENT
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadWarmthExcellent1, ArmorCustomHeadWarmthExcellent2, ArmorCustomHeadWarmthExcellent3, ArmorCustomHeadWarmthExcellent4)
	elseif aiWarmthType == WARMTH_MAX
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadWarmthMax1, ArmorCustomHeadWarmthMax2, ArmorCustomHeadWarmthMax3, ArmorCustomHeadWarmthMax4)
	endif

	if aiCoverageType == COVERAGE_POOR
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadCoveragePoor1, ArmorCustomHeadCoveragePoor2, ArmorCustomHeadCoveragePoor3, ArmorCustomHeadCoveragePoor4)
	elseif aiCoverageType == COVERAGE_FAIR
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadCoverageFair1, ArmorCustomHeadCoverageFair2, ArmorCustomHeadCoverageFair3, ArmorCustomHeadCoverageFair4)
	elseif aiCoverageType == COVERAGE_GOOD
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadCoverageGood1, ArmorCustomHeadCoverageGood2, ArmorCustomHeadCoverageGood3, ArmorCustomHeadCoverageGood4)
	elseif aiCoverageType == COVERAGE_EXCELLENT
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadCoverageExcellent1, ArmorCustomHeadCoverageExcellent2, ArmorCustomHeadCoverageExcellent3, ArmorCustomHeadCoverageExcellent4)
	elseif aiCoverageType == COVERAGE_MAX
		LinkedArrayAddArmor(akArmor, ArmorCustomHeadCoverageMax1, ArmorCustomHeadCoverageMax2, ArmorCustomHeadCoverageMax3, ArmorCustomHeadCoverageMax4)
	endif

	if aiExtraCloakType != 0
		SetArmorDataCloak(akArmor, aiExtraCloakType)
	endif
endFunction

function UnsetArmorDataHead(Armor akArmor)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthPoor1, ArmorCustomHeadWarmthPoor2, ArmorCustomHeadWarmthPoor3, ArmorCustomHeadWarmthPoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthFair1, ArmorCustomHeadWarmthFair2, ArmorCustomHeadWarmthFair3, ArmorCustomHeadWarmthFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthGood1, ArmorCustomHeadWarmthGood2, ArmorCustomHeadWarmthGood3, ArmorCustomHeadWarmthGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthExcellent1, ArmorCustomHeadWarmthExcellent2, ArmorCustomHeadWarmthExcellent3, ArmorCustomHeadWarmthExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadWarmthMax1, ArmorCustomHeadWarmthMax2, ArmorCustomHeadWarmthMax3, ArmorCustomHeadWarmthMax4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoveragePoor1, ArmorCustomHeadCoveragePoor2, ArmorCustomHeadCoveragePoor3, ArmorCustomHeadCoveragePoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoverageFair1, ArmorCustomHeadCoverageFair2, ArmorCustomHeadCoverageFair3, ArmorCustomHeadCoverageFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoverageGood1, ArmorCustomHeadCoverageGood2, ArmorCustomHeadCoverageGood3, ArmorCustomHeadCoverageGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoverageExcellent1, ArmorCustomHeadCoverageExcellent2, ArmorCustomHeadCoverageExcellent3, ArmorCustomHeadCoverageExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHeadCoverageMax1, ArmorCustomHeadCoverageMax2, ArmorCustomHeadCoverageMax3, ArmorCustomHeadCoverageMax4)

	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakCloth1, ArmorCustomCloakCloth2, ArmorCustomCloakCloth3, ArmorCustomCloakCloth4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakLeather1, ArmorCustomCloakLeather2, ArmorCustomCloakLeather3, ArmorCustomCloakLeather4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakFur1, ArmorCustomCloakFur2, ArmorCustomCloakFur3, ArmorCustomCloakFur4)
endFunction

function SetArmorDataHands(Armor akArmor, int aiWarmthType, int aiCoverageType)
	; Remove the armor from any existing arrays.
	UnsetArmorDataHands(akArmor)

	; Add the new entry.
	if aiWarmthType == WARMTH_POOR
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsWarmthPoor1, ArmorCustomHandsWarmthPoor2, ArmorCustomHandsWarmthPoor3, ArmorCustomHandsWarmthPoor4)
	elseif aiWarmthType == WARMTH_FAIR
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsWarmthFair1, ArmorCustomHandsWarmthFair2, ArmorCustomHandsWarmthFair3, ArmorCustomHandsWarmthFair4)
	elseif aiWarmthType == WARMTH_GOOD
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsWarmthGood1, ArmorCustomHandsWarmthGood2, ArmorCustomHandsWarmthGood3, ArmorCustomHandsWarmthGood4)
	elseif aiWarmthType == WARMTH_EXCELLENT
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsWarmthExcellent1, ArmorCustomHandsWarmthExcellent2, ArmorCustomHandsWarmthExcellent3, ArmorCustomHandsWarmthExcellent4)
	elseif aiWarmthType == WARMTH_MAX
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsWarmthMax1, ArmorCustomHandsWarmthMax2, ArmorCustomHandsWarmthMax3, ArmorCustomHandsWarmthMax4)
	endif

	if aiCoverageType == COVERAGE_POOR
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsCoveragePoor1, ArmorCustomHandsCoveragePoor2, ArmorCustomHandsCoveragePoor3, ArmorCustomHandsCoveragePoor4)
	elseif aiCoverageType == COVERAGE_FAIR
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsCoverageFair1, ArmorCustomHandsCoverageFair2, ArmorCustomHandsCoverageFair3, ArmorCustomHandsCoverageFair4)
	elseif aiCoverageType == COVERAGE_GOOD
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsCoverageGood1, ArmorCustomHandsCoverageGood2, ArmorCustomHandsCoverageGood3, ArmorCustomHandsCoverageGood4)
	elseif aiCoverageType == COVERAGE_EXCELLENT
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsCoverageExcellent1, ArmorCustomHandsCoverageExcellent2, ArmorCustomHandsCoverageExcellent3, ArmorCustomHandsCoverageExcellent4)
	elseif aiCoverageType == COVERAGE_MAX
		LinkedArrayAddArmor(akArmor, ArmorCustomHandsCoverageMax1, ArmorCustomHandsCoverageMax2, ArmorCustomHandsCoverageMax3, ArmorCustomHandsCoverageMax4)
	endif
endFunction

function UnsetArmorDataHands(Armor akArmor)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsWarmthPoor1, ArmorCustomHandsWarmthPoor2, ArmorCustomHandsWarmthPoor3, ArmorCustomHandsWarmthPoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsWarmthFair1, ArmorCustomHandsWarmthFair2, ArmorCustomHandsWarmthFair3, ArmorCustomHandsWarmthFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsWarmthGood1, ArmorCustomHandsWarmthGood2, ArmorCustomHandsWarmthGood3, ArmorCustomHandsWarmthGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsWarmthExcellent1, ArmorCustomHandsWarmthExcellent2, ArmorCustomHandsWarmthExcellent3, ArmorCustomHandsWarmthExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsWarmthMax1, ArmorCustomHandsWarmthMax2, ArmorCustomHandsWarmthMax3, ArmorCustomHandsWarmthMax4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsCoveragePoor1, ArmorCustomHandsCoveragePoor2, ArmorCustomHandsCoveragePoor3, ArmorCustomHandsCoveragePoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsCoverageFair1, ArmorCustomHandsCoverageFair2, ArmorCustomHandsCoverageFair3, ArmorCustomHandsCoverageFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsCoverageGood1, ArmorCustomHandsCoverageGood2, ArmorCustomHandsCoverageGood3, ArmorCustomHandsCoverageGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsCoverageExcellent1, ArmorCustomHandsCoverageExcellent2, ArmorCustomHandsCoverageExcellent3, ArmorCustomHandsCoverageExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomHandsCoverageMax1, ArmorCustomHandsCoverageMax2, ArmorCustomHandsCoverageMax3, ArmorCustomHandsCoverageMax4)
endFunction

function SetArmorDataFeet(Armor akArmor, int aiWarmthType, int aiCoverageType)
	; Remove the armor from any existing arrays.
	UnsetArmorDataFeet(akArmor)

	; Add the new entry.
	if aiWarmthType == WARMTH_POOR
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetWarmthPoor1, ArmorCustomFeetWarmthPoor2, ArmorCustomFeetWarmthPoor3, ArmorCustomFeetWarmthPoor4)
	elseif aiWarmthType == WARMTH_FAIR
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetWarmthFair1, ArmorCustomFeetWarmthFair2, ArmorCustomFeetWarmthFair3, ArmorCustomFeetWarmthFair4)
	elseif aiWarmthType == WARMTH_GOOD
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetWarmthGood1, ArmorCustomFeetWarmthGood2, ArmorCustomFeetWarmthGood3, ArmorCustomFeetWarmthGood4)
	elseif aiWarmthType == WARMTH_EXCELLENT
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetWarmthExcellent1, ArmorCustomFeetWarmthExcellent2, ArmorCustomFeetWarmthExcellent3, ArmorCustomFeetWarmthExcellent4)
	elseif aiWarmthType == WARMTH_MAX
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetWarmthMax1, ArmorCustomFeetWarmthMax2, ArmorCustomFeetWarmthMax3, ArmorCustomFeetWarmthMax4)
	endif

	if aiCoverageType == COVERAGE_POOR
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetCoveragePoor1, ArmorCustomFeetCoveragePoor2, ArmorCustomFeetCoveragePoor3, ArmorCustomFeetCoveragePoor4)
	elseif aiCoverageType == COVERAGE_FAIR
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetCoverageFair1, ArmorCustomFeetCoverageFair2, ArmorCustomFeetCoverageFair3, ArmorCustomFeetCoverageFair4)
	elseif aiCoverageType == COVERAGE_GOOD
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetCoverageGood1, ArmorCustomFeetCoverageGood2, ArmorCustomFeetCoverageGood3, ArmorCustomFeetCoverageGood4)
	elseif aiCoverageType == COVERAGE_EXCELLENT
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetCoverageExcellent1, ArmorCustomFeetCoverageExcellent2, ArmorCustomFeetCoverageExcellent3, ArmorCustomFeetCoverageExcellent4)
	elseif aiCoverageType == COVERAGE_MAX
		LinkedArrayAddArmor(akArmor, ArmorCustomFeetCoverageMax1, ArmorCustomFeetCoverageMax2, ArmorCustomFeetCoverageMax3, ArmorCustomFeetCoverageMax4)
	endif
endFunction

function UnsetArmorDataFeet(Armor akArmor)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetWarmthPoor1, ArmorCustomFeetWarmthPoor2, ArmorCustomFeetWarmthPoor3, ArmorCustomFeetWarmthPoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetWarmthFair1, ArmorCustomFeetWarmthFair2, ArmorCustomFeetWarmthFair3, ArmorCustomFeetWarmthFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetWarmthGood1, ArmorCustomFeetWarmthGood2, ArmorCustomFeetWarmthGood3, ArmorCustomFeetWarmthGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetWarmthExcellent1, ArmorCustomFeetWarmthExcellent2, ArmorCustomFeetWarmthExcellent3, ArmorCustomFeetWarmthExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetWarmthMax1, ArmorCustomFeetWarmthMax2, ArmorCustomFeetWarmthMax3, ArmorCustomFeetWarmthMax4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetCoveragePoor1, ArmorCustomFeetCoveragePoor2, ArmorCustomFeetCoveragePoor3, ArmorCustomFeetCoveragePoor4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetCoverageFair1, ArmorCustomFeetCoverageFair2, ArmorCustomFeetCoverageFair3, ArmorCustomFeetCoverageFair4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetCoverageGood1, ArmorCustomFeetCoverageGood2, ArmorCustomFeetCoverageGood3, ArmorCustomFeetCoverageGood4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetCoverageExcellent1, ArmorCustomFeetCoverageExcellent2, ArmorCustomFeetCoverageExcellent3, ArmorCustomFeetCoverageExcellent4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomFeetCoverageMax1, ArmorCustomFeetCoverageMax2, ArmorCustomFeetCoverageMax3, ArmorCustomFeetCoverageMax4)
endFunction

function SetArmorDataCloak(Armor akArmor, int aiCloakType)
	; Remove the armor from any existing arrays.
	UnsetArmorDataCloak(akArmor)

	; Add the new entry.
	if aiCloakType == EXTRA_CLOAKCLOTH
		LinkedArrayAddArmor(akArmor, ArmorCustomCloakCloth1, ArmorCustomCloakCloth2, ArmorCustomCloakCloth3, ArmorCustomCloakCloth4)
	elseif aiCloakType == EXTRA_CLOAKLEATHER
		LinkedArrayAddArmor(akArmor, ArmorCustomCloakLeather1, ArmorCustomCloakLeather2, ArmorCustomCloakLeather3, ArmorCustomCloakLeather4)
	elseif aiCloakType == EXTRA_CLOAKFUR
		LinkedArrayAddArmor(akArmor, ArmorCustomCloakFur1, ArmorCustomCloakFur2, ArmorCustomCloakFur3, ArmorCustomCloakFur4)
	endif
endFunction

function UnsetArmorDataCloak(Armor akArmor)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakCloth1, ArmorCustomCloakCloth2, ArmorCustomCloakCloth3, ArmorCustomCloakCloth4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakLeather1, ArmorCustomCloakLeather2, ArmorCustomCloakLeather3, ArmorCustomCloakLeather4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomCloakFur1, ArmorCustomCloakFur2, ArmorCustomCloakFur3, ArmorCustomCloakFur4)
endFunction

function SetArmorDataMisc(Armor akArmor, int aiExtraType)
	; Remove the armor from any existing arrays.
	UnsetArmorDataMisc(akArmor)

	; Add the new entry.
	if aiExtraType == EXTRA_WARMACCESSORY
		LinkedArrayAddArmor(akArmor, ArmorCustomAccessoryWarm1, ArmorCustomAccessoryWarm2, ArmorCustomAccessoryWarm3, ArmorCustomAccessoryWarm4)
	elseif aiExtraType == EXTRA_WEATHERPROOFACCESSORY
		LinkedArrayAddArmor(akArmor, ArmorCustomAccessoryWeatherproof1, ArmorCustomAccessoryWeatherproof2, ArmorCustomAccessoryWeatherproof3, ArmorCustomAccessoryWeatherproof4)
	endif
endFunction

function UnsetArmorDataMisc(Armor akArmor)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomAccessoryWarm1, ArmorCustomAccessoryWarm2, ArmorCustomAccessoryWarm3, ArmorCustomAccessoryWarm4)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomAccessoryWeatherproof1, ArmorCustomAccessoryWeatherproof2, ArmorCustomAccessoryWeatherproof3, ArmorCustomAccessoryWeatherproof4)
endFunction

function SetArmorDataIgnore(Armor akArmor)
	LinkedArrayAddArmor(akArmor, ArmorCustomIgnore1, ArmorCustomIgnore2, ArmorCustomIgnore3, ArmorCustomIgnore4)
endFunction

function UnsetArmorDataIgnore(Armor akArmor)
	LinkedArrayRemoveArmor(akArmor, ArmorCustomIgnore1, ArmorCustomIgnore2, ArmorCustomIgnore3, ArmorCustomIgnore4)
endFunction

;
; Fetch Data - Defaults
;

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
		protectionLevels[0] = 2
		protectionLevels[1] = 2
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

bool function IsArmorIgnored(Armor akArmor)
	if LinkedArrayHasArmor(akArmor, ArmorCustomIgnore1, ArmorCustomIgnore2, ArmorCustomIgnore3, ArmorCustomIgnore4)
		return true
	elseif LinkedArrayHasArmor(akArmor, ArmorIgnore1, ArmorIgnore2, ArmorIgnore3, ArmorIgnore4)
		return true
	else
		return false
	endif
endFunction

;
; Fetch Data - Custom
;

int[] function FindCustomBodyProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	protectionLevels[0] = -1
	protectionLevels[1] = -1
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorCustomBodyWarmthPoor1, ArmorCustomBodyWarmthPoor2, ArmorCustomBodyWarmthPoor3, ArmorCustomBodyWarmthPoor4)
		protectionLevels[0] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomBodyWarmthFair1, ArmorCustomBodyWarmthFair2, ArmorCustomBodyWarmthFair3, ArmorCustomBodyWarmthFair4)
		protectionLevels[0] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomBodyWarmthGood1, ArmorCustomBodyWarmthGood2, ArmorCustomBodyWarmthGood3, ArmorCustomBodyWarmthGood4)
		protectionLevels[0] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomBodyWarmthExcellent1, ArmorCustomBodyWarmthExcellent2, ArmorCustomBodyWarmthExcellent3, ArmorCustomBodyWarmthExcellent4)
		protectionLevels[0] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomBodyWarmthMax1, ArmorCustomBodyWarmthMax2, ArmorCustomBodyWarmthMax3, ArmorCustomBodyWarmthMax4)
		protectionLevels[0] = 4
		found = true
	endif

	if LinkedArrayHasArmor(akArmor, ArmorCustomBodyCoveragePoor1, ArmorCustomBodyCoveragePoor2, ArmorCustomBodyCoveragePoor3, ArmorCustomBodyCoveragePoor4)
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomBodyCoverageFair1, ArmorCustomBodyCoverageFair2, ArmorCustomBodyCoverageFair3, ArmorCustomBodyCoverageFair4)
		protectionLevels[1] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomBodyCoverageGood1, ArmorCustomBodyCoverageGood2, ArmorCustomBodyCoverageGood3, ArmorCustomBodyCoverageGood4)
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomBodyCoverageExcellent1, ArmorCustomBodyCoverageExcellent2, ArmorCustomBodyCoverageExcellent3, ArmorCustomBodyCoverageExcellent4)
		protectionLevels[1] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomBodyCoverageMax1, ArmorCustomBodyCoverageMax2, ArmorCustomBodyCoverageMax3, ArmorCustomBodyCoverageMax4)
		protectionLevels[1] = 4
		found = true
	endif

	; If not found, the geartype remains "not found".
	if found
		protectionLevels[2] = GEARTYPE_BODY
	endif

	return protectionLevels
endFunction

int[] function FindCustomHeadProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	protectionLevels[0] = -1
	protectionLevels[1] = -1
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorCustomHeadWarmthPoor1, ArmorCustomHeadWarmthPoor2, ArmorCustomHeadWarmthPoor3, ArmorCustomHeadWarmthPoor4)
		protectionLevels[0] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHeadWarmthFair1, ArmorCustomHeadWarmthFair2, ArmorCustomHeadWarmthFair3, ArmorCustomHeadWarmthFair4)
		protectionLevels[0] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHeadWarmthGood1, ArmorCustomHeadWarmthGood2, ArmorCustomHeadWarmthGood3, ArmorCustomHeadWarmthGood4)
		protectionLevels[0] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHeadWarmthExcellent1, ArmorCustomHeadWarmthExcellent2, ArmorCustomHeadWarmthExcellent3, ArmorCustomHeadWarmthExcellent4)
		protectionLevels[0] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHeadWarmthMax1, ArmorCustomHeadWarmthMax2, ArmorCustomHeadWarmthMax3, ArmorCustomHeadWarmthMax4)
		protectionLevels[0] = 4
		found = true
	endif

	if LinkedArrayHasArmor(akArmor, ArmorCustomHeadCoveragePoor1, ArmorCustomHeadCoveragePoor2, ArmorCustomHeadCoveragePoor3, ArmorCustomHeadCoveragePoor4)
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHeadCoverageFair1, ArmorCustomHeadCoverageFair2, ArmorCustomHeadCoverageFair3, ArmorCustomHeadCoverageFair4)
		protectionLevels[1] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHeadCoverageGood1, ArmorCustomHeadCoverageGood2, ArmorCustomHeadCoverageGood3, ArmorCustomHeadCoverageGood4)
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHeadCoverageExcellent1, ArmorCustomHeadCoverageExcellent2, ArmorCustomHeadCoverageExcellent3, ArmorCustomHeadCoverageExcellent4)
		protectionLevels[1] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHeadCoverageMax1, ArmorCustomHeadCoverageMax2, ArmorCustomHeadCoverageMax3, ArmorCustomHeadCoverageMax4)
		protectionLevels[1] = 4
		found = true
	endif

	if found
		protectionLevels[2] = GEARTYPE_HEAD
	endif

	return protectionLevels
endFunction

int[] function FindCustomHandsProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	protectionLevels[0] = -1
	protectionLevels[1] = -1
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorCustomHandsWarmthPoor1, ArmorCustomHandsWarmthPoor2, ArmorCustomHandsWarmthPoor3, ArmorCustomHandsWarmthPoor4)
		protectionLevels[0] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHandsWarmthFair1, ArmorCustomHandsWarmthFair2, ArmorCustomHandsWarmthFair3, ArmorCustomHandsWarmthFair4)
		protectionLevels[0] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHandsWarmthGood1, ArmorCustomHandsWarmthGood2, ArmorCustomHandsWarmthGood3, ArmorCustomHandsWarmthGood4)
		protectionLevels[0] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHandsWarmthExcellent1, ArmorCustomHandsWarmthExcellent2, ArmorCustomHandsWarmthExcellent3, ArmorCustomHandsWarmthExcellent4)
		protectionLevels[0] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHandsWarmthMax1, ArmorCustomHandsWarmthMax2, ArmorCustomHandsWarmthMax3, ArmorCustomHandsWarmthMax4)
		protectionLevels[0] = 4
		found = true
	endif

	if LinkedArrayHasArmor(akArmor, ArmorCustomHandsCoveragePoor1, ArmorCustomHandsCoveragePoor2, ArmorCustomHandsCoveragePoor3, ArmorCustomHandsCoveragePoor4)
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHandsCoverageFair1, ArmorCustomHandsCoverageFair2, ArmorCustomHandsCoverageFair3, ArmorCustomHandsCoverageFair4)
		protectionLevels[1] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHandsCoverageGood1, ArmorCustomHandsCoverageGood2, ArmorCustomHandsCoverageGood3, ArmorCustomHandsCoverageGood4)
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHandsCoverageExcellent1, ArmorCustomHandsCoverageExcellent2, ArmorCustomHandsCoverageExcellent3, ArmorCustomHandsCoverageExcellent4)
		protectionLevels[1] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomHandsCoverageMax1, ArmorCustomHandsCoverageMax2, ArmorCustomHandsCoverageMax3, ArmorCustomHandsCoverageMax4)
		protectionLevels[1] = 4
		found = true
	endif

	if found
		protectionLevels[2] = GEARTYPE_HANDS
	endif

	return protectionLevels
endFunction

int[] function FindCustomFeetProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	protectionLevels[0] = -1
	protectionLevels[1] = -1
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorCustomFeetWarmthPoor1, ArmorCustomFeetWarmthPoor2, ArmorCustomFeetWarmthPoor3, ArmorCustomFeetWarmthPoor4)
		protectionLevels[0] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomFeetWarmthFair1, ArmorCustomFeetWarmthFair2, ArmorCustomFeetWarmthFair3, ArmorCustomFeetWarmthFair4)
		protectionLevels[0] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomFeetWarmthGood1, ArmorCustomFeetWarmthGood2, ArmorCustomFeetWarmthGood3, ArmorCustomFeetWarmthGood4)
		protectionLevels[0] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomFeetWarmthExcellent1, ArmorCustomFeetWarmthExcellent2, ArmorCustomFeetWarmthExcellent3, ArmorCustomFeetWarmthExcellent4)
		protectionLevels[0] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomFeetWarmthMax1, ArmorCustomFeetWarmthMax2, ArmorCustomFeetWarmthMax3, ArmorCustomFeetWarmthMax4)
		protectionLevels[0] = 4
		found = true
	endif

	if LinkedArrayHasArmor(akArmor, ArmorCustomFeetCoveragePoor1, ArmorCustomFeetCoveragePoor2, ArmorCustomFeetCoveragePoor3, ArmorCustomFeetCoveragePoor4)
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomFeetCoverageFair1, ArmorCustomFeetCoverageFair2, ArmorCustomFeetCoverageFair3, ArmorCustomFeetCoverageFair4)
		protectionLevels[1] = 1
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomFeetCoverageGood1, ArmorCustomFeetCoverageGood2, ArmorCustomFeetCoverageGood3, ArmorCustomFeetCoverageGood4)
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomFeetCoverageExcellent1, ArmorCustomFeetCoverageExcellent2, ArmorCustomFeetCoverageExcellent3, ArmorCustomFeetCoverageExcellent4)
		protectionLevels[1] = 3
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomFeetCoverageMax1, ArmorCustomFeetCoverageMax2, ArmorCustomFeetCoverageMax3, ArmorCustomFeetCoverageMax4)
		protectionLevels[1] = 4
		found = true
	endif

	if found
		protectionLevels[2] = GEARTYPE_FEET
	endif

	return protectionLevels
endFunction

int[] function FindCustomCloakProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorCustomCloakCloth1, ArmorCustomCloakCloth2, ArmorCustomCloakCloth3, ArmorCustomCloakCloth4)
		protectionLevels[0] = 2
		protectionLevels[1] = 2
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomCloakLeather1, ArmorCustomCloakLeather2, ArmorCustomCloakLeather3, ArmorCustomCloakLeather4)
		protectionLevels[0] = 1
		protectionLevels[1] = 4
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomCloakFur1, ArmorCustomCloakFur2, ArmorCustomCloakFur3, ArmorCustomCloakFur4)
		protectionLevels[0] = 4
		protectionLevels[1] = 1
		found = true
	endif

	if found
		protectionLevels[2] = GEARTYPE_CLOAK
	endif

	return protectionLevels
endFunction

int[] function FindCustomMiscProtectionLevels(Armor akArmor)
	int[] protectionLevels = new int[3]
	bool found = false

	if LinkedArrayHasArmor(akArmor, ArmorCustomAccessoryWarm1, ArmorCustomAccessoryWarm2, ArmorCustomAccessoryWarm3, ArmorCustomAccessoryWarm4)
		protectionLevels[0] = 1
		protectionLevels[1] = 0
		found = true
	elseif LinkedArrayHasArmor(akArmor, ArmorCustomAccessoryWeatherproof1, ArmorCustomAccessoryWeatherproof2, ArmorCustomAccessoryWeatherproof3, ArmorCustomAccessoryWeatherproof4)
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

	DumpArray("ArmorCustomBodyWarmthPoor1", ArmorCustomBodyWarmthPoor1)
	DumpArray("ArmorCustomBodyWarmthPoor2", ArmorCustomBodyWarmthPoor2)
	DumpArray("ArmorCustomBodyWarmthPoor3", ArmorCustomBodyWarmthPoor3)
	DumpArray("ArmorCustomBodyWarmthPoor4", ArmorCustomBodyWarmthPoor4)
	DumpArray("ArmorCustomBodyWarmthGood1", ArmorCustomBodyWarmthGood1)
	DumpArray("ArmorCustomBodyWarmthGood2", ArmorCustomBodyWarmthGood2)
	DumpArray("ArmorCustomBodyWarmthGood3", ArmorCustomBodyWarmthGood3)
	DumpArray("ArmorCustomBodyWarmthGood4", ArmorCustomBodyWarmthGood4)
	DumpArray("ArmorCustomBodyWarmthExcellent1", ArmorCustomBodyWarmthExcellent1)
	DumpArray("ArmorCustomBodyWarmthExcellent2", ArmorCustomBodyWarmthExcellent2)
	DumpArray("ArmorCustomBodyWarmthExcellent3", ArmorCustomBodyWarmthExcellent3)
	DumpArray("ArmorCustomBodyWarmthExcellent4", ArmorCustomBodyWarmthExcellent4)
	DumpArray("ArmorCustomBodyWarmthMax1", ArmorCustomBodyWarmthMax1)
	DumpArray("ArmorCustomBodyWarmthMax2", ArmorCustomBodyWarmthMax2)
	DumpArray("ArmorCustomBodyWarmthMax3", ArmorCustomBodyWarmthMax3)
	DumpArray("ArmorCustomBodyWarmthMax4", ArmorCustomBodyWarmthMax4)
	DumpArray("ArmorCustomHandsWarmthPoor1", ArmorCustomHandsWarmthPoor1)
	DumpArray("ArmorCustomHandsWarmthPoor2", ArmorCustomHandsWarmthPoor2)
	DumpArray("ArmorCustomHandsWarmthPoor3", ArmorCustomHandsWarmthPoor3)
	DumpArray("ArmorCustomHandsWarmthPoor4", ArmorCustomHandsWarmthPoor4)
	DumpArray("ArmorCustomHandsWarmthGood1", ArmorCustomHandsWarmthGood1)
	DumpArray("ArmorCustomHandsWarmthGood2", ArmorCustomHandsWarmthGood2)
	DumpArray("ArmorCustomHandsWarmthGood3", ArmorCustomHandsWarmthGood3)
	DumpArray("ArmorCustomHandsWarmthGood4", ArmorCustomHandsWarmthGood4)
	DumpArray("ArmorCustomHandsWarmthExcellent1", ArmorCustomHandsWarmthExcellent1)
	DumpArray("ArmorCustomHandsWarmthExcellent2", ArmorCustomHandsWarmthExcellent2)
	DumpArray("ArmorCustomHandsWarmthExcellent3", ArmorCustomHandsWarmthExcellent3)
	DumpArray("ArmorCustomHandsWarmthExcellent4", ArmorCustomHandsWarmthExcellent4)
	DumpArray("ArmorCustomHandsWarmthMax1", ArmorCustomHandsWarmthMax1)
	DumpArray("ArmorCustomHandsWarmthMax2", ArmorCustomHandsWarmthMax2)
	DumpArray("ArmorCustomHandsWarmthMax3", ArmorCustomHandsWarmthMax3)
	DumpArray("ArmorCustomHandsWarmthMax4", ArmorCustomHandsWarmthMax4)
	DumpArray("ArmorCustomHeadWarmthPoor1", ArmorCustomHeadWarmthPoor1)
	DumpArray("ArmorCustomHeadWarmthPoor2", ArmorCustomHeadWarmthPoor2)
	DumpArray("ArmorCustomHeadWarmthPoor3", ArmorCustomHeadWarmthPoor3)
	DumpArray("ArmorCustomHeadWarmthPoor4", ArmorCustomHeadWarmthPoor4)
	DumpArray("ArmorCustomHeadWarmthGood1", ArmorCustomHeadWarmthGood1)
	DumpArray("ArmorCustomHeadWarmthGood2", ArmorCustomHeadWarmthGood2)
	DumpArray("ArmorCustomHeadWarmthGood3", ArmorCustomHeadWarmthGood3)
	DumpArray("ArmorCustomHeadWarmthGood4", ArmorCustomHeadWarmthGood4)
	DumpArray("ArmorCustomHeadWarmthExcellent1", ArmorCustomHeadWarmthExcellent1)
	DumpArray("ArmorCustomHeadWarmthExcellent2", ArmorCustomHeadWarmthExcellent2)
	DumpArray("ArmorCustomHeadWarmthExcellent3", ArmorCustomHeadWarmthExcellent3)
	DumpArray("ArmorCustomHeadWarmthExcellent4", ArmorCustomHeadWarmthExcellent4)
	DumpArray("ArmorCustomHeadWarmthMax1", ArmorCustomHeadWarmthMax1)
	DumpArray("ArmorCustomHeadWarmthMax2", ArmorCustomHeadWarmthMax2)
	DumpArray("ArmorCustomHeadWarmthMax3", ArmorCustomHeadWarmthMax3)
	DumpArray("ArmorCustomHeadWarmthMax4", ArmorCustomHeadWarmthMax4)
	DumpArray("ArmorCustomFeetWarmthPoor1", ArmorCustomFeetWarmthPoor1)
	DumpArray("ArmorCustomFeetWarmthPoor2", ArmorCustomFeetWarmthPoor2)
	DumpArray("ArmorCustomFeetWarmthPoor3", ArmorCustomFeetWarmthPoor3)
	DumpArray("ArmorCustomFeetWarmthPoor4", ArmorCustomFeetWarmthPoor4)
	DumpArray("ArmorCustomFeetWarmthGood1", ArmorCustomFeetWarmthGood1)
	DumpArray("ArmorCustomFeetWarmthGood2", ArmorCustomFeetWarmthGood2)
	DumpArray("ArmorCustomFeetWarmthGood3", ArmorCustomFeetWarmthGood3)
	DumpArray("ArmorCustomFeetWarmthGood4", ArmorCustomFeetWarmthGood4)
	DumpArray("ArmorCustomFeetWarmthExcellent1", ArmorCustomFeetWarmthExcellent1)
	DumpArray("ArmorCustomFeetWarmthExcellent2", ArmorCustomFeetWarmthExcellent2)
	DumpArray("ArmorCustomFeetWarmthExcellent3", ArmorCustomFeetWarmthExcellent3)
	DumpArray("ArmorCustomFeetWarmthExcellent4", ArmorCustomFeetWarmthExcellent4)
	DumpArray("ArmorCustomFeetWarmthMax1", ArmorCustomFeetWarmthMax1)
	DumpArray("ArmorCustomFeetWarmthMax2", ArmorCustomFeetWarmthMax2)
	DumpArray("ArmorCustomFeetWarmthMax3", ArmorCustomFeetWarmthMax3)
	DumpArray("ArmorCustomFeetWarmthMax4", ArmorCustomFeetWarmthMax4)
	DumpArray("ArmorCustomBodyCoveragePoor1", ArmorCustomBodyCoveragePoor1)
	DumpArray("ArmorCustomBodyCoveragePoor2", ArmorCustomBodyCoveragePoor2)
	DumpArray("ArmorCustomBodyCoveragePoor3", ArmorCustomBodyCoveragePoor3)
	DumpArray("ArmorCustomBodyCoveragePoor4", ArmorCustomBodyCoveragePoor4)
	DumpArray("ArmorCustomBodyCoverageGood1", ArmorCustomBodyCoverageGood1)
	DumpArray("ArmorCustomBodyCoverageGood2", ArmorCustomBodyCoverageGood2)
	DumpArray("ArmorCustomBodyCoverageGood3", ArmorCustomBodyCoverageGood3)
	DumpArray("ArmorCustomBodyCoverageGood4", ArmorCustomBodyCoverageGood4)
	DumpArray("ArmorCustomBodyCoverageExcellent1", ArmorCustomBodyCoverageExcellent1)
	DumpArray("ArmorCustomBodyCoverageExcellent2", ArmorCustomBodyCoverageExcellent2)
	DumpArray("ArmorCustomBodyCoverageExcellent3", ArmorCustomBodyCoverageExcellent3)
	DumpArray("ArmorCustomBodyCoverageExcellent4", ArmorCustomBodyCoverageExcellent4)
	DumpArray("ArmorCustomBodyCoverageMax1", ArmorCustomBodyCoverageMax1)
	DumpArray("ArmorCustomBodyCoverageMax2", ArmorCustomBodyCoverageMax2)
	DumpArray("ArmorCustomBodyCoverageMax3", ArmorCustomBodyCoverageMax3)
	DumpArray("ArmorCustomBodyCoverageMax4", ArmorCustomBodyCoverageMax4)
	DumpArray("ArmorCustomHandsCoveragePoor1", ArmorCustomHandsCoveragePoor1)
	DumpArray("ArmorCustomHandsCoveragePoor2", ArmorCustomHandsCoveragePoor2)
	DumpArray("ArmorCustomHandsCoveragePoor3", ArmorCustomHandsCoveragePoor3)
	DumpArray("ArmorCustomHandsCoveragePoor4", ArmorCustomHandsCoveragePoor4)
	DumpArray("ArmorCustomHandsCoverageGood1", ArmorCustomHandsCoverageGood1)
	DumpArray("ArmorCustomHandsCoverageGood2", ArmorCustomHandsCoverageGood2)
	DumpArray("ArmorCustomHandsCoverageGood3", ArmorCustomHandsCoverageGood3)
	DumpArray("ArmorCustomHandsCoverageGood4", ArmorCustomHandsCoverageGood4)
	DumpArray("ArmorCustomHandsCoverageExcellent1", ArmorCustomHandsCoverageExcellent1)
	DumpArray("ArmorCustomHandsCoverageExcellent2", ArmorCustomHandsCoverageExcellent2)
	DumpArray("ArmorCustomHandsCoverageExcellent3", ArmorCustomHandsCoverageExcellent3)
	DumpArray("ArmorCustomHandsCoverageExcellent4", ArmorCustomHandsCoverageExcellent4)
	DumpArray("ArmorCustomHandsCoverageMax1", ArmorCustomHandsCoverageMax1)
	DumpArray("ArmorCustomHandsCoverageMax2", ArmorCustomHandsCoverageMax2)
	DumpArray("ArmorCustomHandsCoverageMax3", ArmorCustomHandsCoverageMax3)
	DumpArray("ArmorCustomHandsCoverageMax4", ArmorCustomHandsCoverageMax4)
	DumpArray("ArmorCustomHeadCoveragePoor1", ArmorCustomHeadCoveragePoor1)
	DumpArray("ArmorCustomHeadCoveragePoor2", ArmorCustomHeadCoveragePoor2)
	DumpArray("ArmorCustomHeadCoveragePoor3", ArmorCustomHeadCoveragePoor3)
	DumpArray("ArmorCustomHeadCoveragePoor4", ArmorCustomHeadCoveragePoor4)
	DumpArray("ArmorCustomHeadCoverageGood1", ArmorCustomHeadCoverageGood1)
	DumpArray("ArmorCustomHeadCoverageGood2", ArmorCustomHeadCoverageGood2)
	DumpArray("ArmorCustomHeadCoverageGood3", ArmorCustomHeadCoverageGood3)
	DumpArray("ArmorCustomHeadCoverageGood4", ArmorCustomHeadCoverageGood4)
	DumpArray("ArmorCustomHeadCoverageExcellent1", ArmorCustomHeadCoverageExcellent1)
	DumpArray("ArmorCustomHeadCoverageExcellent2", ArmorCustomHeadCoverageExcellent2)
	DumpArray("ArmorCustomHeadCoverageExcellent3", ArmorCustomHeadCoverageExcellent3)
	DumpArray("ArmorCustomHeadCoverageExcellent4", ArmorCustomHeadCoverageExcellent4)
	DumpArray("ArmorCustomHeadCoverageMax1", ArmorCustomHeadCoverageMax1)
	DumpArray("ArmorCustomHeadCoverageMax2", ArmorCustomHeadCoverageMax2)
	DumpArray("ArmorCustomHeadCoverageMax3", ArmorCustomHeadCoverageMax3)
	DumpArray("ArmorCustomHeadCoverageMax4", ArmorCustomHeadCoverageMax4)
	DumpArray("ArmorCustomFeetCoveragePoor1", ArmorCustomFeetCoveragePoor1)
	DumpArray("ArmorCustomFeetCoveragePoor2", ArmorCustomFeetCoveragePoor2)
	DumpArray("ArmorCustomFeetCoveragePoor3", ArmorCustomFeetCoveragePoor3)
	DumpArray("ArmorCustomFeetCoveragePoor4", ArmorCustomFeetCoveragePoor4)
	DumpArray("ArmorCustomFeetCoverageGood1", ArmorCustomFeetCoverageGood1)
	DumpArray("ArmorCustomFeetCoverageGood2", ArmorCustomFeetCoverageGood2)
	DumpArray("ArmorCustomFeetCoverageGood3", ArmorCustomFeetCoverageGood3)
	DumpArray("ArmorCustomFeetCoverageGood4", ArmorCustomFeetCoverageGood4)
	DumpArray("ArmorCustomFeetCoverageExcellent1", ArmorCustomFeetCoverageExcellent1)
	DumpArray("ArmorCustomFeetCoverageExcellent2", ArmorCustomFeetCoverageExcellent2)
	DumpArray("ArmorCustomFeetCoverageExcellent3", ArmorCustomFeetCoverageExcellent3)
	DumpArray("ArmorCustomFeetCoverageExcellent4", ArmorCustomFeetCoverageExcellent4)
	DumpArray("ArmorCustomFeetCoverageMax1", ArmorCustomFeetCoverageMax1)
	DumpArray("ArmorCustomFeetCoverageMax2", ArmorCustomFeetCoverageMax2)
	DumpArray("ArmorCustomFeetCoverageMax3", ArmorCustomFeetCoverageMax3)
	DumpArray("ArmorCustomFeetCoverageMax4", ArmorCustomFeetCoverageMax4)
	DumpArray("ArmorCustomAccessoryWarm1", ArmorCustomAccessoryWarm1)
	DumpArray("ArmorCustomAccessoryWarm2", ArmorCustomAccessoryWarm2)
	DumpArray("ArmorCustomAccessoryWarm3", ArmorCustomAccessoryWarm3)
	DumpArray("ArmorCustomAccessoryWarm4", ArmorCustomAccessoryWarm4)
	DumpArray("ArmorCustomAccessoryWeatherproof1", ArmorCustomAccessoryWeatherproof1)
	DumpArray("ArmorCustomAccessoryWeatherproof2", ArmorCustomAccessoryWeatherproof2)
	DumpArray("ArmorCustomAccessoryWeatherproof3", ArmorCustomAccessoryWeatherproof3)
	DumpArray("ArmorCustomAccessoryWeatherproof4", ArmorCustomAccessoryWeatherproof4)
	DumpArray("ArmorCustomCloakCloth1", ArmorCustomCloakCloth1)
	DumpArray("ArmorCustomCloakCloth2", ArmorCustomCloakCloth2)
	DumpArray("ArmorCustomCloakCloth3", ArmorCustomCloakCloth3)
	DumpArray("ArmorCustomCloakCloth4", ArmorCustomCloakCloth4)
	DumpArray("ArmorCustomCloakLeather1", ArmorCustomCloakLeather1)
	DumpArray("ArmorCustomCloakLeather2", ArmorCustomCloakLeather2)
	DumpArray("ArmorCustomCloakLeather3", ArmorCustomCloakLeather3)
	DumpArray("ArmorCustomCloakLeather4", ArmorCustomCloakLeather4)
	DumpArray("ArmorCustomCloakFur1", ArmorCustomCloakFur1)
	DumpArray("ArmorCustomCloakFur2", ArmorCustomCloakFur2)
	DumpArray("ArmorCustomCloakFur3", ArmorCustomCloakFur3)
	DumpArray("ArmorCustomCloakFur4", ArmorCustomCloakFur4)
	DumpArray("ArmorCustomIgnore1", ArmorCustomIgnore1)
	DumpArray("ArmorCustomIgnore2", ArmorCustomIgnore2)
	DumpArray("ArmorCustomIgnore3", ArmorCustomIgnore3)
	DumpArray("ArmorCustomIgnore4", ArmorCustomIgnore4)
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