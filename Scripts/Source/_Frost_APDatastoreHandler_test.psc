scriptname _Frost_APDatastoreHandler_test extends Lilac

import FrostUtil

_Frost_ArmorProtectionDatastoreHandler ap

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
Armor property _Frost_UnitTestBodyExtraAll auto
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
	describe("Armor Datastore GetArmorProtectionDataByAnalysis", GetArmorProtectionDataByAnalysisSuite())
	describe("Armor Datastore GetGearType", GetGearTypeSuite())
	describe("GetDatastoreKeyFromForm", GetDatastoreKeyFromFormSuite())
	describe("GetDatastoreKeyFromID", GetDatastoreKeyFromIDSuite())
endFunction

function GetArmorProtectionDataSuite()
	it("should return body armor data if found in the datastore", testGetArmorProtectionData_FoundDataBody())
	it("should return head armor data if found in the datastore", testGetArmorProtectionData_FoundDataHead())
	it("should return hands armor data if found in the datastore", testGetArmorProtectionData_FoundDataHands())
	it("should return feet armor data if found in the datastore", testGetArmorProtectionData_FoundDataFeet())
	it("should return immediately if ignore flag is set", testGetArmorProtectionData_IgnoreFlag())
	it("should attempt to call GetArmorProtectionDataByKeyword if no data found", testGetArmorProtectionData_Keyword())
	it("should attempt to call GetArmorProtectionDataByKeyword and return immediately if ignore flag set", testGetArmorProtectionData_KeywordIgnore())
	it("should attempt to call GetArmorProtectionDataByAnalysis if no data found", testGetArmorProtectionData_Analysis())
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
	it("should get correct data when keyword set for body gear with extra head, hands, feet, cloak, and misc keyword", testGetArmorProtectionDataByKeyword_BodyExtraAll())
endFunction

function GetArmorProtectionDataByAnalysisSuite()
	it("should return immediately if the gear type couldn't be found", testGetArmorProtectionDataByAnalysis_NoGearType())
	it("should get correct default data for body gear", testGetArmorProtectionDataByAnalysis_BodyGear())
	it("should get correct default data for robes with hood", testGetArmorProtectionDataByAnalysis_BodyGearExtraHood())
	it("should get correct default data for head gear", testGetArmorProtectionDataByAnalysis_HeadGear())
	it("should get correct default data for hands gear", testGetArmorProtectionDataByAnalysis_HandsGear())
	it("should get correct default data for feet gear", testGetArmorProtectionDataByAnalysis_FeetGear())
	it("should get correct default data for cloak gear", testGetArmorProtectionDataByAnalysis_CloakGear())
	it("should get correct default data for shields", testGetArmorProtectionDataByAnalysis_Shields())
	it("should get correct default data for head gear with 'hood' in the name", testGetArmorProtectionDataByAnalysis_HeadGearHoods())
	it("should get correct default data for head gear with circlet slotmask", testGetArmorProtectionDataByAnalysis_HeadGearCirclet())
	it("should get correct default data for gear with ring slotmask", testGetArmorProtectionDataByAnalysis_Ring())
	it("should get correct default data for gear with amulet slotmask", testGetArmorProtectionDataByAnalysis_Amulet())
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

function GetDatastoreKeyFromFormSuite()
	it("should get the correct datastore key for a piece of armor", testGetDatastoreKeyFromForm())
endFunction

function GetDatastoreKeyFromIDSuite()
	it("should get the correct datastore key for a formID", testGetDatastoreKeyFromID())
endFunction

function beforeAll()
	ap = GetClothingDatastoreHandler()
	ap.CreateProtectionKeywordValueMaps()
endFunction

function beforeEach_GetArmorProtectionDataByX()
	ap.GoToState("mock_getArmorProtectionDataByX")
	ap.mock_GetArmorData_value = new int[15]
	ap.mock_GetArmorProtectionDataByKeyword_value = new int[15]
	ap.mock_GetArmorProtectionDataByType_value = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value = new int[15]
	ap.mock_GetArmorData_callcount = 0
	ap.mock_GetArmorProtectionDataByKeyword_callcount = 0
	ap.mock_GetArmorProtectionDataByType_callcount = 0
	ap.mock_GetArmorProtectionDataByAnalysis_callcount = 0
endFunction

function afterEach_GetArmorProtectionDataByX()
	ap.GoToState("")
	ap.mock_GetArmorData_value = new int[15]
	ap.mock_GetArmorProtectionDataByKeyword_value = new int[15]
	ap.mock_GetArmorProtectionDataByType_value = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value = new int[15]
	ap.mock_GetArmorData_callcount = 0
	ap.mock_GetArmorProtectionDataByKeyword_callcount = 0
	ap.mock_GetArmorProtectionDataByType_callcount = 0
	ap.mock_GetArmorProtectionDataByAnalysis_callcount = 0
endFunction


; Test Cases ==================================================================


function testGetArmorProtectionData_FoundDataBody()
	beforeEach_GetArmorProtectionDataByX()

	ap.mock_GetArmorData_value[0] = ap.GEARTYPE_BODY
	ap.mock_GetArmorData_value[1] = 75
	ap.mock_GetArmorData_value[2] = 35
	ap.mock_GetArmorData_value[3] = 0
	ap.mock_GetArmorData_value[4] = 0
	ap.mock_GetArmorData_value[5] = 0
	ap.mock_GetArmorData_value[6] = 0
	ap.mock_GetArmorData_value[7] = 0
	ap.mock_GetArmorData_value[8] = 0
	ap.mock_GetArmorData_value[9] = 0
	ap.mock_GetArmorData_value[10] = 0
	ap.mock_GetArmorData_value[11] = 0
	ap.mock_GetArmorData_value[12] = 0
	ap.mock_GetArmorData_value[13] = 0
	ap.mock_GetArmorData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 0)
	
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

function testGetArmorProtectionData_FoundDataHead()
	beforeEach_GetArmorProtectionDataByX()

	ap.mock_GetArmorData_value[0] = ap.GEARTYPE_HEAD
	ap.mock_GetArmorData_value[1] = 15
	ap.mock_GetArmorData_value[2] = 3
	ap.mock_GetArmorData_value[3] = 0
	ap.mock_GetArmorData_value[4] = 0
	ap.mock_GetArmorData_value[5] = 0
	ap.mock_GetArmorData_value[6] = 0
	ap.mock_GetArmorData_value[7] = 0
	ap.mock_GetArmorData_value[8] = 0
	ap.mock_GetArmorData_value[9] = 0
	ap.mock_GetArmorData_value[10] = 0
	ap.mock_GetArmorData_value[11] = 0
	ap.mock_GetArmorData_value[12] = 0
	ap.mock_GetArmorData_value[13] = 0
	ap.mock_GetArmorData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronHelmet)

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 0)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HEAD)
	expectInt(result[1], to, beEqualTo, 15)
	expectInt(result[2], to, beEqualTo, 3)
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

	ap.mock_GetArmorData_value[0] = ap.GEARTYPE_HANDS
	ap.mock_GetArmorData_value[1] = 7
	ap.mock_GetArmorData_value[2] = 6
	ap.mock_GetArmorData_value[3] = 0
	ap.mock_GetArmorData_value[4] = 0
	ap.mock_GetArmorData_value[5] = 0
	ap.mock_GetArmorData_value[6] = 0
	ap.mock_GetArmorData_value[7] = 0
	ap.mock_GetArmorData_value[8] = 0
	ap.mock_GetArmorData_value[9] = 0
	ap.mock_GetArmorData_value[10] = 0
	ap.mock_GetArmorData_value[11] = 0
	ap.mock_GetArmorData_value[12] = 0
	ap.mock_GetArmorData_value[13] = 0
	ap.mock_GetArmorData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronGauntlets)

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 0)
	
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HANDS)
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

function testGetArmorProtectionData_FoundDataFeet()
	beforeEach_GetArmorProtectionDataByX()

	ap.mock_GetArmorData_value[0] = ap.GEARTYPE_FEET
	ap.mock_GetArmorData_value[1] = 7
	ap.mock_GetArmorData_value[2] = 6
	ap.mock_GetArmorData_value[3] = 0
	ap.mock_GetArmorData_value[4] = 0
	ap.mock_GetArmorData_value[5] = 0
	ap.mock_GetArmorData_value[6] = 0
	ap.mock_GetArmorData_value[7] = 0
	ap.mock_GetArmorData_value[8] = 0
	ap.mock_GetArmorData_value[9] = 0
	ap.mock_GetArmorData_value[10] = 0
	ap.mock_GetArmorData_value[11] = 0
	ap.mock_GetArmorData_value[12] = 0
	ap.mock_GetArmorData_value[13] = 0
	ap.mock_GetArmorData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronBoots)

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 0)
	
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

	ap.mock_GetArmorData_value[0] = ap.GEARTYPE_IGNORE
	ap.mock_GetArmorData_value[1] = 75
	ap.mock_GetArmorData_value[2] = 35
	ap.mock_GetArmorData_value[3] = 0
	ap.mock_GetArmorData_value[4] = 0
	ap.mock_GetArmorData_value[5] = 0
	ap.mock_GetArmorData_value[6] = 0
	ap.mock_GetArmorData_value[7] = 0
	ap.mock_GetArmorData_value[8] = 0
	ap.mock_GetArmorData_value[9] = 0
	ap.mock_GetArmorData_value[10] = 0
	ap.mock_GetArmorData_value[11] = 0
	ap.mock_GetArmorData_value[12] = 0
	ap.mock_GetArmorData_value[13] = 0
	ap.mock_GetArmorData_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 0)
	
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

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 0)
	
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

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 0)
	
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

function testGetArmorProtectionData_Analysis()
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

	ap.mock_GetArmorProtectionDataByAnalysis_value[0] = ap.GEARTYPE_BODY
	ap.mock_GetArmorProtectionDataByAnalysis_value[1] = ap.DEFAULT_BODY_WARMTH
	ap.mock_GetArmorProtectionDataByAnalysis_value[2] = ap.DEFAULT_BODY_COVERAGE
	ap.mock_GetArmorProtectionDataByAnalysis_value[3] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[4] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[5] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[6] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[7] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[8] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[9] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[10] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[11] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[12] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[13] = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value[14] = 0

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 1)
	
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
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestIgnoreBody)
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
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestNormalBody)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 125)
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
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestWarmHead)
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
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestWaterproofHands)
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
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestVeryWarmFeet)
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
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestWarmCloak)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_CLOAK)
	expectInt(result[1], to, beEqualTo, 30)
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

function testGetArmorProtectionDataByKeyword_BodyExtraCloak()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestBodyExtraCloak)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 30)
	expectInt(result[2], to, beEqualTo, 35)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 0)
	expectInt(result[6], to, beEqualTo, 0)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 20)
	expectInt(result[12], to, beEqualTo, 30)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_BodyExtraHeadCloak()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestBodyExtraCloakHead)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 190)
	expectInt(result[2], to, beEqualTo, 109)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 40)
	expectInt(result[6], to, beEqualTo, 58)
	expectInt(result[7], to, beEqualTo, 0)
	expectInt(result[8], to, beEqualTo, 0)
	expectInt(result[9], to, beEqualTo, 0)
	expectInt(result[10], to, beEqualTo, 0)
	expectInt(result[11], to, beEqualTo, 30)
	expectInt(result[12], to, beEqualTo, 6)
	expectInt(result[13], to, beEqualTo, 0)
	expectInt(result[14], to, beEqualTo, 0)
endFunction

function testGetArmorProtectionDataByKeyword_BodyExtraAll()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestBodyExtraAll)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 190)
	expectInt(result[2], to, beEqualTo, 109)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 40)
	expectInt(result[6], to, beEqualTo, 58)
	expectInt(result[7], to, beEqualTo, 15)
	expectInt(result[8], to, beEqualTo, 3)
	expectInt(result[9], to, beEqualTo, 12)
	expectInt(result[10], to, beEqualTo, 6)
	expectInt(result[11], to, beEqualTo, 30)
	expectInt(result[12], to, beEqualTo, 6)
	expectInt(result[13], to, beEqualTo, 12)
	expectInt(result[14], to, beEqualTo, 20)
endFunction


function testGetArmorProtectionDataByAnalysis_NoGearType()
	int[] result = ap.GetArmorProtectionDataByAnalysis(_Camp_Backpack_Brown)
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

function testGetArmorProtectionDataByAnalysis_BodyGear()
	int[] result = ap.GetArmorProtectionDataByAnalysis(ArmorIronCuirass)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 110)
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
endFunction

function testGetArmorProtectionDataByAnalysis_BodyGearExtraHood()
	int[] result = ap.GetArmorProtectionDataByAnalysis(EnchClothesWarlockRobesHoodedAlteration01)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_BODY)
	expectInt(result[1], to, beEqualTo, 110)
	expectInt(result[2], to, beEqualTo, 35)
	expectInt(result[3], to, beEqualTo, 0)
	expectInt(result[4], to, beEqualTo, 0)
	expectInt(result[5], to, beEqualTo, 25)
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
	int[] result = ap.GetArmorProtectionDataByAnalysis(ArmorIronHelmet)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HEAD)
	expectInt(result[1], to, beEqualTo, 30)
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

function testGetArmorProtectionDataByAnalysis_HandsGear()
	int[] result = ap.GetArmorProtectionDataByAnalysis(ArmorIronGauntlets)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HANDS)
	expectInt(result[1], to, beEqualTo, 12)
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
endFunction

function testGetArmorProtectionDataByAnalysis_FeetGear()
	int[] result = ap.GetArmorProtectionDataByAnalysis(ArmorIronBoots)
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
	int[] result = ap.GetArmorProtectionDataByAnalysis(_Frost_UnitTestWarmCloak)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_CLOAK)
	expectInt(result[1], to, beEqualTo, 10)
	expectInt(result[2], to, beEqualTo, 10)
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
	int[] result = ap.GetArmorProtectionDataByAnalysis(ArmorIronShield)
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

function testGetArmorProtectionDataByAnalysis_HeadGearHoods()
	int[] result = ap.GetArmorProtectionDataByAnalysis(ClothesCollegeHood)
	expectInt(result[0], to, beEqualTo, ap.GEARTYPE_HEAD)
	expectInt(result[1], to, beEqualTo, 25)
	expectInt(result[2], to, beEqualTo, 43)
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
	int[] result = ap.GetArmorProtectionDataByAnalysis(ClothesCirclet01)
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

function testGetArmorProtectionDataByAnalysis_Ring()
	int[] result = ap.GetArmorProtectionDataByAnalysis(JewelryRingGold)
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

function testGetArmorProtectionDataByAnalysis_Amulet()
	int[] result = ap.GetArmorProtectionDataByAnalysis(JewelryNecklaceGoldGems)
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

function testGetGearType_Body()
	int slotmask = ArmorIronCuirass.GetSlotMask()
	int result = ap.GetGearType(ArmorIronCuirass, slotmask)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_BODY)
endFunction

function testGetGearType_Head()
	int slotmask = ArmorIronHelmet.GetSlotMask()
	int result = ap.GetGearType(ArmorIronHelmet, slotmask)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_HEAD)
endFunction

function testGetGearType_Hands()
	int slotmask = ArmorIronGauntlets.GetSlotMask()
	int result = ap.GetGearType(ArmorIronGauntlets, slotmask)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_HANDS)
endFunction

function testGetGearType_Feet()
	int slotmask = ArmorIronBoots.GetSlotMask()
	int result = ap.GetGearType(ArmorIronBoots, slotmask)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_FEET)
endFunction

function testGetGearType_Cloak()
	int slotmask = _Frost_UnitTestWarmCloak.GetSlotMask()
	int result = ap.GetGearType(_Frost_UnitTestWarmCloak, slotmask)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_CLOAK)
endFunction

function testGetGearType_Shield()
	int slotmask = ArmorIronShield.GetSlotMask()
	int result = ap.GetGearType(ArmorIronShield, slotmask)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_MISC)
endFunction

function testGetGearType_Unknown()
	int slotmask = _Camp_Backpack_Brown.GetSlotMask()
	int result = ap.GetGearType(_Camp_Backpack_Brown, slotmask)
	expectInt(result, to, beEqualTo, ap.GEARTYPE_NOTFOUND)
endFunction

function testGetDatastoreKeyFromForm()
	string result = ap.GetDatastoreKeyFromForm(ArmorIronCuirass)
	expectString(result, to, beEqualTo, "77385___Skyrim.esm")

	result = ap.GetDatastoreKeyFromForm(_Frost_UnitTestWarmCloak)
	expectString(result, to, beEqualTo, "492662___Frostfall.esp")
endFunction

function testGetDatastoreKeyFromID()
	string result = ap.GetDatastoreKeyFromID(ArmorIronCuirass.GetFormID())
	expectString(result, to, beEqualTo, "77385___Skyrim.esm")

	result = ap.GetDatastoreKeyFromID(_Frost_UnitTestWarmCloak.GetFormID())
	expectString(result, to, beEqualTo, "492662___Frostfall.esp")
endFunction
