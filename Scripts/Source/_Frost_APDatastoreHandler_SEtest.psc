scriptname _Frost_APDatastoreHandler_SEtest extends Lilac

import FrostUtil

_Frost_ArmorProtectionDatastoreHandler ap
_Frost_LegacyArmorDatastore ds

Armor property ArmorIronCuirass auto
Armor property ArmorIronHelmet auto
Armor property ArmorIronGauntlets auto
Armor property ArmorIronBoots auto
Armor property ArmorIronShield auto
Armor property _Frost_UnitTestIgnoreBody auto
Armor property _Frost_UnitTestNormalBody auto
Armor property _Frost_UnitTestWarmHead auto
Armor property _Frost_UnitTestVeryWarmFeet auto
Armor property _Frost_UnitTestWaterproofHands auto
Armor property _Frost_UnitTestWarmCloak auto
Armor property _Frost_UnitTestBodyExtraCloak auto
Armor property _Frost_UnitTestBodyExtraCloakHead auto
Armor property _Frost_UnitTestHeadExtraCloak auto

Armor property _Frost_UnitTestUnknownBody1 auto
Armor property _Frost_UnitTestUnknownHead1 auto
Armor property _Frost_UnitTestUnknownHands1 auto
Armor property _Frost_UnitTestUnknownFeet1 auto
Armor property _Frost_UnitTestUnknownCloak1 auto
Armor property _Frost_UnitTestUnknownShield1 auto

Armor property ClothesCirclet01 auto
Armor property JewelryRingGold auto
Armor property JewelryNecklaceGoldGems auto
Armor property _Camp_Backpack_Brown auto
Armor property ClothesCollegeHood auto
Armor property EnchClothesWarlockRobesHoodedAlteration01 auto

function SetUp()
	; EnableVerboseLogging()
	EnableWarningOnSlowTests(1.0)
endFunction

function TestSuites()
	describe("Armor Datastore GetArmorProtectionData", GetArmorProtectionDataSuite())
	describe("Armor Datastore GetArmorProtectionDataByKeyword", GetArmorProtectionDataByKeywordSuite())
	describe("Armor Datastore GetDefaultArmorProtectionDataBy_Vanilla", GetDefaultArmorProtectionSuite())
	describe("Armor Datastore GetGearType", GetGearTypeSuite())
endFunction

function GetArmorProtectionDataSuite()
	it("should return body armor data if found in the default datastore", testGetArmorProtectionData_FoundDataBody())
	it("should return head armor data if found in the default datastore", testGetArmorProtectionData_FoundDataHead())
	it("should return hands armor data if found in the default datastore", testGetArmorProtectionData_FoundDataHands())
	it("should return feet armor data if found in the default datastore", testGetArmorProtectionData_FoundDataFeet())
	it("should return immediately if ignore flag is set", testGetArmorProtectionData_IgnoreFlag())
	it("should attempt to call GetArmorProtectionDataByKeyword if no custom data found", testGetArmorProtectionData_Keyword())
	it("should attempt to call GetArmorProtectionDataByKeyword and return immediately if ignore flag set", testGetArmorProtectionData_KeywordIgnore())
endFunction

function GetArmorProtectionDataByKeywordSuite()
	; Also exercises GetArmorProtectionDataByType().
	it("should return immediately if the ignore keyword is set", testGetArmorProtectionDataByKeyword_IgnoreKeyword())
	it("should get correct data when keyword set for normal body gear", testGetArmorProtectionDataByKeyword_NormalBody())
	it("should get correct data when keyword set for warm head gear", testGetArmorProtectionDataByKeyword_WarmHead())
	it("should get correct data when keyword set for high coverage hands gear", testGetArmorProtectionDataByKeyword_WaterproofHands())
	it("should get correct data when keyword set for very warm feet gear", testGetArmorProtectionDataByKeyword_VeryWarmFeet())
	it("should get correct data when keyword set for warm cloak gear", testGetArmorProtectionDataByKeyword_WarmCloak())
	it("should get correct data when keyword set for body gear with extra cloak keyword", testGetArmorProtectionDataByKeyword_BodyExtraCloak())
	it("should get correct data when keyword set for body gear with extra cloak and head keyword", testGetArmorProtectionDataByKeyword_BodyExtraHeadCloak())
endFunction

function GetDefaultArmorProtectionSuite()
	it("should get correct default data for body gear", testGetArmorProtectionDataByAnalysis_BodyGear())
	it("should get correct default data for robes with hood", testGetArmorProtectionDataByAnalysis_BodyGearExtraHood())
	it("should get correct default data for head gear", testGetArmorProtectionDataByAnalysis_HeadGear())
	it("should get correct default data for hands gear", testGetArmorProtectionDataByAnalysis_HandsGear())
	it("should get correct default data for feet gear", testGetArmorProtectionDataByAnalysis_FeetGear())
	it("should get correct default data for cloak gear", testGetArmorProtectionDataByAnalysis_CloakGear())
	it("should get correct default data for shields", testGetArmorProtectionDataByAnalysis_Shields())
	it("should get correct default data for head gear with jewelry keyword (circlets)", testGetArmorProtectionDataByAnalysis_HeadGearCirclet())
	it("should get correct default data for gear with jewelry keyword (rings)", testGetArmorProtectionDataByAnalysis_Ring())
	it("should get correct default data for gear with jewelry keyword (amulets)", testGetArmorProtectionDataByAnalysis_Amulet())
endFunction

function GetGearTypeSuite()
	it("should return the correct gear type for body gear", testGetGearType_Body())
	it("should return the correct gear type for head gear", testGetGearType_Head())
	it("should return the correct gear type for hands gear", testGetGearType_Hands())
	it("should return the correct gear type for feet gear", testGetGearType_Feet())
	it("should return the correct gear type for cloak gear", testGetGearType_Cloak())
	it("should return the correct gear type for shields", testGetGearType_Shield())
	it("should return the NOTFOUND gear type if type couldn't be found", testGetGearType_Unknown())
endFunction

function beforeAll()
	ap = GetClothingDatastoreHandler()
	ds = GetLegacyArmorDatastore()
	ap.CreateProtectionKeywordValueMaps()
	ds.InitializeDatastore()
	ds.PopulateDefaultArmorData()
endFunction

function beforeEach_GetArmorProtectionDataByX()
	ap.GoToState("mock_getArmorProtectionDataByX")
	ap.mock_GetArmorData_value = new int[15]
	ap.mock_GetArmorProtectionDataByKeyword_value = new int[15]
	ap.mock_GetArmorProtectionDataByAnalysis_value = new int[15]
	ap.mock_GetArmorDefaultData_value = new int[15]
	ap.mock_GetArmorProtectionDataByType_value = 0
	ap.mock_GetArmorData_callcount = 0
	ap.mock_GetArmorDataVanilla_callcount = 0
	ap.mock_GetArmorProtectionDataByKeyword_callcount = 0
	ap.mock_GetArmorProtectionDataByType_callcount = 0
	ap.mock_GetArmorDefaultData_Vanilla_callcount = 0
	ap.mock_GetArmorProtectionDataByAnalysis_callcount = 0
endFunction

function afterEach_GetArmorProtectionDataByX()
	ap.GoToState("")
	ap.mock_GetArmorData_value = new int[15]
	ap.mock_GetArmorProtectionDataByKeyword_value = new int[15]
	ap.mock_GetArmorProtectionDataByAnalysis_value = new int[15]
	ap.mock_GetArmorDefaultData_value = new int[15]
	ap.mock_GetArmorProtectionDataByType_value = 0
	ap.mock_GetArmorData_callcount = 0
	ap.mock_GetArmorDataVanilla_callcount = 0
	ap.mock_GetArmorProtectionDataByKeyword_callcount = 0
	ap.mock_GetArmorProtectionDataByType_callcount = 0
	ap.mock_GetArmorDefaultData_Vanilla_callcount = 0
	ap.mock_GetArmorProtectionDataByAnalysis_callcount = 0
endFunction


; Test Cases ==================================================================


function testGetArmorProtectionData_FoundDataBody()
	beforeEach_GetArmorProtectionDataByX()

	ap.mock_GetArmorDefaultData_value[0] = ap.GEARTYPE_BODY
	ap.mock_GetArmorDefaultData_value[1] = 60
	ap.mock_GetArmorDefaultData_value[2] = 35
	ap.mock_GetArmorDefaultData_value[3] = 0
	ap.mock_GetArmorDefaultData_value[4] = 0
	ap.mock_GetArmorDefaultData_value[5] = 0
	ap.mock_GetArmorDefaultData_value[6] = 0
	ap.mock_GetArmorDefaultData_value[7] = 0
	ap.mock_GetArmorDefaultData_value[8] = 0
	ap.mock_GetArmorDefaultData_value[9] = 0
	ap.mock_GetArmorDefaultData_value[10] = 0
	ap.mock_GetArmorDefaultData_value[11] = 0
	ap.mock_GetArmorDefaultData_value[12] = 0
	ap.mock_GetArmorDefaultData_value[13] = 0
	ap.mock_GetArmorDefaultData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorDataVanilla_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorDefaultData_Vanilla_callcount, to, beEqualTo, 1)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 60)
	expectInt(result[2], to, beEqualTo, 35)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_FoundDataHead()
	beforeEach_GetArmorProtectionDataByX()

	ap.mock_GetArmorDefaultData_value[0] = ap.GEARTYPE_HEAD
	ap.mock_GetArmorDefaultData_value[1] = 15
	ap.mock_GetArmorDefaultData_value[2] = 14
	ap.mock_GetArmorDefaultData_value[3] = 0
	ap.mock_GetArmorDefaultData_value[4] = 0
	ap.mock_GetArmorDefaultData_value[5] = 0
	ap.mock_GetArmorDefaultData_value[6] = 0
	ap.mock_GetArmorDefaultData_value[7] = 0
	ap.mock_GetArmorDefaultData_value[8] = 0
	ap.mock_GetArmorDefaultData_value[9] = 0
	ap.mock_GetArmorDefaultData_value[10] = 0
	ap.mock_GetArmorDefaultData_value[11] = 0
	ap.mock_GetArmorDefaultData_value[12] = 0
	ap.mock_GetArmorDefaultData_value[13] = 0
	ap.mock_GetArmorDefaultData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronHelmet)

	expectInt(ap.mock_GetArmorDataVanilla_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorDefaultData_Vanilla_callcount, to, beEqualTo, 1)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HEAD)
	expectInt(result[1], to, beEqualTo, 15)
	expectInt(result[2], to, beEqualTo, 14)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_FoundDataHands()
	beforeEach_GetArmorProtectionDataByX()

	ap.mock_GetArmorDefaultData_value[0] = ap.GEARTYPE_HANDS
	ap.mock_GetArmorDefaultData_value[1] = 9
	ap.mock_GetArmorDefaultData_value[2] = 6
	ap.mock_GetArmorDefaultData_value[3] = 0
	ap.mock_GetArmorDefaultData_value[4] = 0
	ap.mock_GetArmorDefaultData_value[5] = 0
	ap.mock_GetArmorDefaultData_value[6] = 0
	ap.mock_GetArmorDefaultData_value[7] = 0
	ap.mock_GetArmorDefaultData_value[8] = 0
	ap.mock_GetArmorDefaultData_value[9] = 0
	ap.mock_GetArmorDefaultData_value[10] = 0
	ap.mock_GetArmorDefaultData_value[11] = 0
	ap.mock_GetArmorDefaultData_value[12] = 0
	ap.mock_GetArmorDefaultData_value[13] = 0
	ap.mock_GetArmorDefaultData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronGauntlets)

	expectInt(ap.mock_GetArmorDataVanilla_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorDefaultData_Vanilla_callcount, to, beEqualTo, 1)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HANDS)
	expectInt(result[1], to, beEqualTo, 9)
	expectInt(result[2], to, beEqualTo, 6)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_FoundDataFeet()
	beforeEach_GetArmorProtectionDataByX()

	ap.mock_GetArmorDefaultData_value[0] = ap.GEARTYPE_FEET
	ap.mock_GetArmorDefaultData_value[1] = 7
	ap.mock_GetArmorDefaultData_value[2] = 6
	ap.mock_GetArmorDefaultData_value[3] = 0
	ap.mock_GetArmorDefaultData_value[4] = 0
	ap.mock_GetArmorDefaultData_value[5] = 0
	ap.mock_GetArmorDefaultData_value[6] = 0
	ap.mock_GetArmorDefaultData_value[7] = 0
	ap.mock_GetArmorDefaultData_value[8] = 0
	ap.mock_GetArmorDefaultData_value[9] = 0
	ap.mock_GetArmorDefaultData_value[10] = 0
	ap.mock_GetArmorDefaultData_value[11] = 0
	ap.mock_GetArmorDefaultData_value[12] = 0
	ap.mock_GetArmorDefaultData_value[13] = 0
	ap.mock_GetArmorDefaultData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronBoots)

	expectInt(ap.mock_GetArmorDataVanilla_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorDefaultData_Vanilla_callcount, to, beEqualTo, 1)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_FEET)
	expectInt(result[1], to, beEqualTo, 7)
	expectInt(result[2], to, beEqualTo, 6)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_IgnoreFlag()
	beforeEach_GetArmorProtectionDataByX()

	ap.mock_GetArmorDefaultData_value[0] = ap.GEARTYPE_IGNORE
	ap.mock_GetArmorDefaultData_value[1] = 75
	ap.mock_GetArmorDefaultData_value[2] = 35
	ap.mock_GetArmorDefaultData_value[3] = 0
	ap.mock_GetArmorDefaultData_value[4] = 0
	ap.mock_GetArmorDefaultData_value[5] = 0
	ap.mock_GetArmorDefaultData_value[6] = 0
	ap.mock_GetArmorDefaultData_value[7] = 0
	ap.mock_GetArmorDefaultData_value[8] = 0
	ap.mock_GetArmorDefaultData_value[9] = 0
	ap.mock_GetArmorDefaultData_value[10] = 0
	ap.mock_GetArmorDefaultData_value[11] = 0
	ap.mock_GetArmorDefaultData_value[12] = 0
	ap.mock_GetArmorDefaultData_value[13] = 0
	ap.mock_GetArmorDefaultData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorDataVanilla_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorDefaultData_Vanilla_callcount, to, beEqualTo, 1)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_IGNORE)
	expectInt(result[1], to, beEqualTo, 75)
	expectInt(result[2], to, beEqualTo, 35)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_Keyword()
	beforeEach_GetArmorProtectionDataByX()

	int i = 0
	while i < 15
		; [0] - [14] == 0
		ap.mock_GetArmorData_value[i] = 0
		i += 1
	endWhile

	ap.mock_GetArmorProtectionDataByKeyword_value[0] = ap.GEARTYPE_BODY
	ap.mock_GetArmorProtectionDataByKeyword_value[1] = 75
	ap.mock_GetArmorProtectionDataByKeyword_value[2] = 35
	ap.mock_GetArmorProtectionDataByKeyword_value[3] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[4] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[5] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[6] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[7] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[8] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[9] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[10] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[11] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[12] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[13] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorDataVanilla_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorDefaultData_Vanilla_callcount, to, beEqualTo, 0)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 75)
	expectInt(result[2], to, beEqualTo, 35)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_KeywordIgnore()
	beforeEach_GetArmorProtectionDataByX()

	int i = 0
	while i < 15
		; [0] - [14] == 0
		ap.mock_GetArmorData_value[i] = 0
		i += 1
	endWhile

	ap.mock_GetArmorProtectionDataByKeyword_value[0] = 7	; GEARTYPE_IGNORE
	i = 1
	while i < 15
		; [1] - [14] == 0
		ap.mock_GetArmorProtectionDataByKeyword_value[i] = 0
		i += 1
	endWhile

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorDataVanilla_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorDefaultData_Vanilla_callcount, to, beEqualTo, 0)
	
	expectInt(result[0], to, beEqualTo, 7)
	expectInt(result[1], to, beEqualTo, 0)
	expectInt(result[2], to, beEqualTo, 0)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetDefaultArmorData_Vanilla()
	beforeEach_GetArmorProtectionDataByX()

	int i = 0
	while i < 15
		; [0] - [14] == 0
		ap.mock_GetArmorData_value[i] = 0
		i += 1
	endWhile

	i = 0
	while i < 15
		; [0] - [14] == 0
		ap.mock_GetArmorProtectionDataByKeyword_value[i] = 0
		i += 1
	endWhile

	ap.mock_GetArmorDefaultData_value[0] = ap.GEARTYPE_BODY
	ap.mock_GetArmorDefaultData_value[1] = ap.DEFAULT_BODY_WARMTH
	ap.mock_GetArmorDefaultData_value[2] = ap.DEFAULT_BODY_COVERAGE
	ap.mock_GetArmorDefaultData_value[3] = 0
	ap.mock_GetArmorDefaultData_value[4] = 0
	ap.mock_GetArmorDefaultData_value[5] = 0
	ap.mock_GetArmorDefaultData_value[6] = 0
	ap.mock_GetArmorDefaultData_value[7] = 0
	ap.mock_GetArmorDefaultData_value[8] = 0
	ap.mock_GetArmorDefaultData_value[9] = 0
	ap.mock_GetArmorDefaultData_value[10] = 0
	ap.mock_GetArmorDefaultData_value[11] = 0
	ap.mock_GetArmorDefaultData_value[12] = 0
	ap.mock_GetArmorDefaultData_value[13] = 0
	ap.mock_GetArmorDefaultData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorDataVanilla_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorDefaultData_Vanilla_callcount, to, beEqualTo, 1)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, ap.DEFAULT_BODY_WARMTH)
	expectInt(result[2], to, beEqualTo, ap.DEFAULT_BODY_COVERAGE)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionDataByKeyword_IgnoreKeyword()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestIgnoreBody, ap.GEARTYPE_BODY)
	expectInt(result[0], to, beEqualTo, 7)
	expectInt(result[1], to, beEqualTo, 0)
	expectInt(result[2], to, beEqualTo, 0)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction


function testGetArmorProtectionDataByKeyword_NormalBody()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestNormalBody, ap.GEARTYPE_BODY)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 110)
	expectInt(result[2], to, beEqualTo, 54)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_WarmHead()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestWarmHead, ap.GEARTYPE_HEAD)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HEAD)
	expectInt(result[1], to, beEqualTo, 40)
	expectInt(result[2], to, beEqualTo, 29)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_WaterproofHands()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestWaterproofHands, ap.GEARTYPE_HANDS)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HANDS)
	expectInt(result[1], to, beEqualTo, 15)
	expectInt(result[2], to, beEqualTo, 29)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_VeryWarmFeet()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestVeryWarmFeet, ap.GEARTYPE_FEET)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_FEET)
	expectInt(result[1], to, beEqualTo, 24)
	expectInt(result[2], to, beEqualTo, 21)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_WarmCloak()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestWarmCloak, ap.GEARTYPE_CLOAK)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_CLOAK)
	expectInt(result[1], to, beEqualTo, 40)
	expectInt(result[2], to, beEqualTo, 12)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_BodyExtraCloak()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestBodyExtraCloak, ap.GEARTYPE_BODY)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 60)
	expectInt(result[2], to, beEqualTo, 35)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 12)
	expectInt(result[12], to, beEqualTo, 40)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_HeadExtraCloak()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestHeadExtraCloak, ap.GEARTYPE_HEAD)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HEAD)
	expectInt(result[1], to, beEqualTo, 40)
	expectInt(result[2], to, beEqualTo, 29)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 12)
	expectInt(result[12], to, beEqualTo, 12)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_BodyExtraHeadCloak()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestBodyExtraCloakHead, ap.GEARTYPE_BODY)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 190)
	expectInt(result[2], to, beEqualTo, 109)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 40)
	expectInt(result[6], to, beEqualTo, 29)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 40)
	expectInt(result[12], to, beEqualTo, 12)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_BodyGear()
	int[] result = ap.GetDefaultArmorData_Vanilla(_Frost_UnitTestUnknownBody1, ap.GEARTYPE_BODY, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 110)
	expectInt(result[2], to, beEqualTo, 54)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_BodyGearExtraHood()
	int[] result = ap.GetDefaultArmorData_Vanilla(EnchClothesWarlockRobesHoodedAlteration01, ap.GEARTYPE_BODY, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 110)
	expectInt(result[2], to, beEqualTo, 72)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 30)
	expectInt(result[6], to, beEqualTo, 43)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_HeadGear()
	int[] result = ap.GetDefaultArmorData_Vanilla(_Frost_UnitTestUnknownHead1, ap.GEARTYPE_HEAD, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HEAD)
	expectInt(result[1], to, beEqualTo, 30)
	expectInt(result[2], to, beEqualTo, 29)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_HandsGear()
	int[] result = ap.GetDefaultArmorData_Vanilla(_Frost_UnitTestUnknownHands1, ap.GEARTYPE_HANDS, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HANDS)
	expectInt(result[1], to, beEqualTo, 12)
	expectInt(result[2], to, beEqualTo, 14)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_FeetGear()
	int[] result = ap.GetDefaultArmorData_Vanilla(_Frost_UnitTestUnknownFeet1, ap.GEARTYPE_FEET, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_FEET)
	expectInt(result[1], to, beEqualTo, 12)
	expectInt(result[2], to, beEqualTo, 14)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_CloakGear()
	int[] result = ap.GetDefaultArmorData_Vanilla(_Frost_UnitTestUnknownCloak1, ap.GEARTYPE_CLOAK, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_CLOAK)
	expectInt(result[1], to, beEqualTo, 12)
	expectInt(result[2], to, beEqualTo, 12)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_Shields()
	int[] result = ap.GetDefaultArmorData_Vanilla(_Frost_UnitTestUnknownShield1, ap.GEARTYPE_MISC, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_MISC)
	expectInt(result[1], to, beEqualTo, 0)
	expectInt(result[2], to, beEqualTo, 20)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_HeadGearCirclet()
	int[] result = ap.GetDefaultArmorData_Vanilla(ClothesCirclet01, ap.GEARTYPE_HEAD, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_IGNORE)
	expectInt(result[1], to, beEqualTo, 0)
	expectInt(result[2], to, beEqualTo, 0)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_Ring()
	int[] result = ap.GetDefaultArmorData_Vanilla(JewelryRingGold, ap.GEARTYPE_NOTFOUND, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_IGNORE)
	expectInt(result[1], to, beEqualTo, 0)
	expectInt(result[2], to, beEqualTo, 0)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByAnalysis_Amulet()
	int[] result = ap.GetDefaultArmorData_Vanilla(JewelryNecklaceGoldGems, ap.GEARTYPE_NOTFOUND, ds)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_IGNORE)
	expectInt(result[1], to, beEqualTo, 0)
	expectInt(result[2], to, beEqualTo, 0)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 0)
	expectInt(result[12], to, beEqualTo, 0)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetGearType_Body()
	int result = ap.GetGearType_Vanilla(ArmorIronCuirass)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_BODY)
endFunction

function testGetGearType_Head()
	int result = ap.GetGearType_Vanilla(ArmorIronHelmet)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_HEAD)
endFunction

function testGetGearType_Hands()
	int result = ap.GetGearType_Vanilla(ArmorIronGauntlets)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_HANDS)
endFunction

function testGetGearType_Feet()
	int result = ap.GetGearType_Vanilla(ArmorIronBoots)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_FEET)
endFunction

function testGetGearType_Cloak()
	int result = ap.GetGearType_Vanilla(_Frost_UnitTestWarmCloak)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_CLOAK)
endFunction

function testGetGearType_Shield()
	int result = ap.GetGearType_Vanilla(ArmorIronShield)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_MISC)
endFunction

function testGetGearType_Unknown()
	int result = ap.GetGearType_Vanilla(_Camp_Backpack_Brown)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_NOTFOUND)
endFunction
