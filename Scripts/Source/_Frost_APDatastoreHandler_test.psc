scriptname _Frost_APDatastoreHandler_test extends Lilac

import FrostUtil

_Frost_ArmorProtectionDatastoreHandler ap

Armor property ArmorIronCuirass auto
Armor property _Frost_UnitTestIgnoreBody auto
Armor property _Frost_UnitTestNormalBody auto
Armor property _Frost_UnitTestWarmHead auto
Armor property _Frost_UnitTestVeryWarmFeet auto
Armor property _Frost_UnitTestWaterproofHands auto
Armor property _Frost_UnitTestWarmCloak auto
Armor property _Frost_UnitTestBodyExtraCloak auto
Armor property _Frost_UnitTestBodyExtraCloakHead auto
Armor property _Frost_UnitTestBodyExtraAll auto

function SetUp()
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
	it("should return data if found in the datastore", testGetArmorProtectionData_FoundData())
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
	it("should return the correct gear type for shields in strict mode", testGetGearType_ShieldStrict())
	it("should return -1 if type couldn't be found in strict mode", testGetGearType_UnknownStrict())
	it("should return misc type if type could not be found in non-strict mode", testGetGearType_UnknownNonStrict())
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
	ap.mock_GetArmorData_value = new int[16]
	ap.mock_GetArmorProtectionDataByKeyword_value = new int[16]
	ap.mock_GetArmorProtectionDataByType_value = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value = new int[16]
	ap.mock_GetArmorData_callcount = 0
	ap.mock_GetArmorProtectionDataByKeyword_callcount = 0
	ap.mock_GetArmorProtectionDataByType_callcount = 0
	ap.mock_GetArmorProtectionDataByAnalysis_callcount = 0
endFunction

function afterEach_GetArmorProtectionDataByX()
	ap.GoToState("")
	ap.mock_GetArmorData_value = new int[16]
	ap.mock_GetArmorProtectionDataByKeyword_value = new int[16]
	ap.mock_GetArmorProtectionDataByType_value = 0
	ap.mock_GetArmorProtectionDataByAnalysis_value = new int[16]
	ap.mock_GetArmorData_callcount = 0
	ap.mock_GetArmorProtectionDataByKeyword_callcount = 0
	ap.mock_GetArmorProtectionDataByType_callcount = 0
	ap.mock_GetArmorProtectionDataByAnalysis_callcount = 0
endFunction


; Test Cases ==================================================================


function testGetArmorProtectionData_FoundData()
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
	ap.mock_GetArmorData_value[15] = 0

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
	expectInt(result[15], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_IgnoreFlag()
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
	ap.mock_GetArmorData_value[15] = 1 ; Ignore flag

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
	expectInt(result[15], to, beEqualTo, 1)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_Keyword()
	beforeEach_GetArmorProtectionDataByX()

	int i = 0
	while i < 16
		; [0] - [15] == -1
		ap.mock_GetArmorData_value[i] = -1
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
	ap.mock_GetArmorProtectionDataByKeyword_value[15] = 0

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
	expectInt(result[15], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_KeywordIgnore()
	beforeEach_GetArmorProtectionDataByX()

	int i = 0
	while i < 16
		; [0] - [15] == -1
		ap.mock_GetArmorData_value[i] = -1
		i += 1
	endWhile

	ap.mock_GetArmorProtectionDataByKeyword_value[0] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[1] = -1
	ap.mock_GetArmorProtectionDataByKeyword_value[2] = 0
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
	ap.mock_GetArmorProtectionDataByKeyword_value[15] = 1 ; Ignore flag

	int[] result = ap.GetArmorProtectionData(ArmorIronCuirass)

	expectInt(ap.mock_GetArmorData_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByKeyword_callcount, to, beEqualTo, 1)
	expectInt(ap.mock_GetArmorProtectionDataByType_callcount, to, beEqualTo, 0)
	expectInt(ap.mock_GetArmorProtectionDataByAnalysis_callcount, to, beEqualTo, 0)
	
	expectInt(result[0], to, beEqualTo, 0)
	expectInt(result[1], to, beEqualTo, -1)
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
	expectInt(result[15], to, beEqualTo, 1)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionData_Analysis()
	beforeEach_GetArmorProtectionDataByX()

	int i = 0
	while i < 16
		; [0] - [15] == -1
		ap.mock_GetArmorData_value[i] = -1
		i += 1
	endWhile

	ap.mock_GetArmorProtectionDataByKeyword_value[0] = 0
	ap.mock_GetArmorProtectionDataByKeyword_value[1] = -1
	ap.mock_GetArmorProtectionDataByKeyword_value[2] = 0
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
	ap.mock_GetArmorProtectionDataByKeyword_value[15] = 0

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
	ap.mock_GetArmorProtectionDataByAnalysis_value[15] = 0

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
	expectInt(result[15], to, beEqualTo, 0)

	afterEach_GetArmorProtectionDataByX()
endFunction

function testGetArmorProtectionDataByKeyword_IgnoreKeyword()
	int[] result = ap.GetArmorProtectionDataByKeyword(_Frost_UnitTestIgnoreBody)
	expectInt(result[0], to, beEqualTo, 0)
	expectInt(result[1], to, beEqualTo, -1)
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
	expectInt(result[15], to, beEqualTo, 1)
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
	expectInt(result[15], to, beEqualTo, 0)
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
	expectInt(result[15], to, beEqualTo, 0)
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
	expectInt(result[15], to, beEqualTo, 0)
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
	expectInt(result[15], to, beEqualTo, 0)
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
	expectInt(result[15], to, beEqualTo, 0)
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
	expectInt(result[15], to, beEqualTo, 0)
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
	expectInt(result[15], to, beEqualTo, 0)
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
	expectInt(result[15], to, beEqualTo, 0)
endFunction


function testGetArmorProtectionDataByAnalysis_NoGearType()

endFunction

function testGetArmorProtectionDataByAnalysis_BodyGear()

endFunction

function testGetArmorProtectionDataByAnalysis_HeadGear()

endFunction

function testGetArmorProtectionDataByAnalysis_HandsGear()

endFunction

function testGetArmorProtectionDataByAnalysis_FeetGear()

endFunction

function testGetArmorProtectionDataByAnalysis_CloakGear()

endFunction

function testGetArmorProtectionDataByAnalysis_Shields()

endFunction

function testGetArmorProtectionDataByAnalysis_HeadGearHoods()

endFunction

function testGetArmorProtectionDataByAnalysis_HeadGearCirclet()

endFunction

function testGetArmorProtectionDataByAnalysis_Ring()

endFunction

function testGetArmorProtectionDataByAnalysis_Amulet()

endFunction

function testGetGearType_Body()

endFunction

function testGetGearType_Head()

endFunction

function testGetGearType_Hands()

endFunction

function testGetGearType_Feet()

endFunction

function testGetGearType_Cloak()

endFunction

function testGetGearType_ShieldStrict()

endFunction

function testGetGearType_UnknownStrict()

endFunction

function testGetGearType_UnknownNonStrict()

endFunction

function testGetDatastoreKeyFromForm()

endFunction

function testGetDatastoreKeyFromID()

endFunction
