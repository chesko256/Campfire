scriptname _Frost_ClothingSystem_SEtest extends Lilac

import _FrostInternal

_Frost_ClothingSystem clothing
_Frost_ArmorProtectionDatastoreHandler ds

Armor property _Frost_DummyCuirass auto
Armor property ArmorIronCuirass auto
Armor property ArmorIronGauntlets auto
Armor property ArmorIronBoots auto
Armor property ArmorIronHelmet auto
Armor property ArmorIronShield auto
Armor property _Camp_Cloak_BasicBurlap auto
Armor property _Camp_Cloak_BasicFur auto
Armor property _Frost_UnitTestBodyExtraHead auto
Armor property _Frost_UnitTestBodyExtraCloak auto
Armor property _Frost_UnitTestMiscGear1 auto
Armor property _Frost_UnitTestMiscGear2 auto
Armor property _Frost_UnitTestMiscGear3 auto
Armor property _Frost_UnitTestMiscGear4 auto
Weapon property Axe01 auto

Armor[] property mockWornGearMainForms auto hidden
Armor[] property mockWornGearForms auto hidden
int[] property mockWornGearValues auto hidden
Keyword property _Frost_WornGearData_mock auto

function beforeAll()
	clothing = FrostUtil.GetClothingSystem()
	ds = FrostUtil.GetClothingDatastoreHandler()
	ds.InitializeDatastore()
	FrostUtil.GetCompatibilitySystem().CheckDatastore()
endFunction

function SetUp()
	; EnableVerboseLogging()
	EnableWarningOnSlowTests(1.0)
endFunction

function TestSuites()
	describe("Clothing System ObjectEquipped", ClothingSystem_ObjectEquippedSuite())
	describe("Clothing System ObjectUnequipped", ClothingSystem_ObjectUnequippedSuite())
	describe("Clothing System AddWornGearEntryForArmorEquipped", ClothingSystem_AddWornGearEntryForArmorEquippedSuite())
	describe("Clothing System RemoveWornGearEntryForArmorUnequipped", ClothingSystem_RemoveWornGearEntryForArmorUnequippedSuite())
	describe("Clothing System RecalculateProtectionData", ClothingSystem_RecalculateProtectionDataSuite())
	describe("Clothing System GetArmorData", ClothingSystem_GetArmorDataSuite())
endFunction


; Test Suites =================================================================


function ClothingSystem_ObjectEquippedSuite()
	it("should abort if akBaseObject is None", testObjectEquipped_None())
	it("should abort if akBaseObject is not Armor", testObjectEquipped_NotArmor())
	it("should abort if akBaseObject has the dummy keyword", testObjectEquipped_DummyKeyword())
	it("should run AddWornGearEntryForArmorEquipped if the equipment is valid", testObjectEquipped_Success())
endFunction

function ClothingSystem_ObjectUnequippedSuite()
	it("should abort if akBaseObject is None", testObjectUnequipped_None())
	it("should abort if akBaseObject is not Armor", testObjectUnequipped_NotArmor())
	it("should abort if akBaseObject has the dummy keyword", testObjectUnequipped_DummyKeyword())
	it("should run RemoveWornGearEntryForArmorUnequipped if the equipment is valid", testObjectUnequipped_Success())
endFunction

function ClothingSystem_AddWornGearEntryForArmorEquippedSuite()
	it("should store the correct worn item data for body equipment", testAddWornGearEntryForArmorEquipped_BodyGear())
	it("should store the correct worn item data for head equipment", testAddWornGearEntryForArmorEquipped_HeadGear())
	it("should store the correct worn item data for hands equipment", testAddWornGearEntryForArmorEquipped_HandsGear())
	it("should store the correct worn item data for feet equipment", testAddWornGearEntryForArmorEquipped_FeetGear())
	it("should store the correct worn item data for cloak equipment", testAddWornGearEntryForArmorEquipped_CloakGear())
	it("should store the correct worn item data for misc equipment", testAddWornGearEntryForArmorEquipped_MiscGear())
	it("should store the correct worn item data for all equipment types simultaneously", testAddWornGearEntryForArmorEquipped_AllGear())
endFunction

function ClothingSystem_RemoveWornGearEntryForArmorUnequippedSuite()
	it("should not do anything if the gear wasn't found in the keys array", testRemoveWornGearEntryForArmorUnequipped_Fail())
	it("should remove the gear from the worn gear array and resort the array with one removed element", testRemoveWornGearEntryForArmorUnequipped_Success())
	it("should remove the gear from the worn gear array and resort the array with many removed elements", testRemoveWornGearEntryForArmorUnequipped_SuccessMany())
endFunction

function ClothingSystem_RecalculateProtectionDataSuite()
	it("should calc the right warmth and coverage when wearing body gear", testRecalculate_BodyGear())
	it("should calc the right warmth and coverage when wearing body and head gear", testRecalculate_BodyHeadGear())
	it("should calc the right warmth and coverage when wearing body, head, hands and feet gear", testRecalculate_FullGear())
	it("should calc the right warmth and coverage when wearing body, head, hands, feet, cloak, and shield", testRecalculate_AllGear())
	it("should calc the right warmth and coverage when wearing a body gear with extra head data", testRecalculate_ExtraHead())
	it("should calc the right warmth and coverage when wearing a body gear with extra head data, and real head gear", testRecalculate_ConflictHead())
	it("should calc the right warmth and coverage when wearing a body gear with extra cloak data", testRecalculate_ExtraCloak())
	it("should calc the right warmth and coverage when wearing a body gear with extra cloak and head data and a real cloak", testRecalculate_ConflictCloak())
	it("should calc the right warmth and coverage when wearing body, head, hands, feet, cloak and sum all Misc gear", testRecalculate_Misc())
endfunction

function ClothingSystem_GetArmorDataSuite()
	it("should return the player's total armor warmth", testGetArmorWarmth())
	it("should return the player's total armor coverage", testGetArmorCoverage())
endFunction


; Before / After Each =========================================================

function beforeEach_ObjectEquippedSuite()
	clothing.mock_AddWornGearEntryForArmorEquipped_callcount = 0
	clothing.GoToState("mock_testObjectEquipped")
endFunction

function afterEach_ObjectEquippedSuite()
	clothing.mock_AddWornGearEntryForArmorEquipped_callcount = 0
	clothing.GoToState("")
endFunction

function beforeEach_ObjectUnequippedSuite()
	clothing.mock_RemoveWornGearEntryForArmorUnequipped_callcount = 0
	clothing.GoToState("mock_testObjectEquipped")
endFunction

function afterEach_ObjectUnequippedSuite()
	clothing.mock_RemoveWornGearEntryForArmorUnequipped_callcount = 0
	clothing.GoToState("")
endFunction

function beforeEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_callcount = 0
	ds.mock_GetArmorProtectionData_value = new int[15]
	mockWornGearMainForms = new Armor[5]
	mockWornGearForms = new Armor[26]
	mockWornGearValues = new int[12]
	ds.GoToState("mock_GetArmorProtectionData")
	;@TODO: Do this some other way as to not rely on the system running
	clothing.StartUp()
endFunction

function afterEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_callcount = 0
	ds.mock_GetArmorProtectionData_value = new int[15]
	mockWornGearMainForms = new Armor[5]
	mockWornGearForms = new Armor[26]
	mockWornGearValues = new int[12]
	ds.GoToState("")
endFunction

function beforeEach_RemoveWornGearEntryForArmorUnequippedSuite()
	mockWornGearMainForms = new Armor[5]
	mockWornGearForms = new Armor[26]
	clothing.StartUp()
endFunction

function afterEach_RemoveWornGearEntryForArmorUnequippedSuite()
	mockWornGearMainForms = new Armor[5]
	mockWornGearForms = new Armor[26]
endFunction

function beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms = new Armor[5]
	mockWornGearForms = new Armor[26]
	mockWornGearValues = new int[12]
	clothing.StartUp()
	clothing.GoToState("mock_testRecalculateProtectionData")
endFunction

function afterEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms = new Armor[5]
	mockWornGearForms = new Armor[26]
	mockWornGearValues = new int[12]
	clothing.GoToState("")
endFunction

function beforeEach_GetArmorData()
	mockWornGearValues = new int[12]
endFunction

function afterEach_GetArmorData()
	mockWornGearValues = new int[12]
endFunction


; Test Cases ==================================================================


function testObjectEquipped_None()
	beforeEach_ObjectEquippedSuite()

	clothing.ObjectEquipped(None)
	expectInt(clothing.mock_AddWornGearEntryForArmorEquipped_callcount, to, beEqualTo, 0)

	afterEach_ObjectEquippedSuite()
endFunction

function testObjectEquipped_NotArmor()
	beforeEach_ObjectEquippedSuite()

	clothing.ObjectEquipped(Axe01)
	expectInt(clothing.mock_AddWornGearEntryForArmorEquipped_callcount, to, beEqualTo, 0)

	afterEach_ObjectEquippedSuite()
endFunction

function testObjectEquipped_DummyKeyword()
	beforeEach_ObjectEquippedSuite()

	clothing.ObjectEquipped(_Frost_DummyCuirass)
	expectInt(clothing.mock_AddWornGearEntryForArmorEquipped_callcount, to, beEqualTo, 0)

	afterEach_ObjectEquippedSuite()
endFunction

function testObjectEquipped_Success()
	beforeEach_ObjectEquippedSuite()

	clothing.ObjectEquipped(ArmorIronCuirass)
	expectInt(clothing.mock_AddWornGearEntryForArmorEquipped_callcount, to, beEqualTo, 1)

	afterEach_ObjectEquippedSuite()
endFunction


function testObjectUnequipped_None()
	beforeEach_ObjectUnequippedSuite()

	clothing.ObjectUnequipped(None)
	expectInt(clothing.mock_RemoveWornGearEntryForArmorUnequipped_callcount, to, beEqualTo, 0)

	afterEach_ObjectUnequippedSuite()
endFunction

function testObjectUnequipped_NotArmor()
	beforeEach_ObjectUnequippedSuite()

	clothing.ObjectUnequipped(Axe01)
	expectInt(clothing.mock_RemoveWornGearEntryForArmorUnequipped_callcount, to, beEqualTo, 0)

	afterEach_ObjectUnequippedSuite()
endFunction

function testObjectUnequipped_DummyKeyword()
	beforeEach_ObjectUnequippedSuite()

	clothing.ObjectUnequipped(_Frost_DummyCuirass)
	expectInt(clothing.mock_RemoveWornGearEntryForArmorUnequipped_callcount, to, beEqualTo, 0)

	afterEach_ObjectUnequippedSuite()
endFunction

function testObjectUnequipped_Success()
	beforeEach_ObjectUnequippedSuite()

	clothing.ObjectUnequipped(ArmorIronCuirass)
	expectInt(clothing.mock_RemoveWornGearEntryForArmorUnequipped_callcount, to, beEqualTo, 1)

	afterEach_ObjectUnequippedSuite()
endFunction


function testAddWornGearEntryForArmorEquipped_BodyGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_BODY
	ds.mock_GetArmorProtectionData_value[1] = 75
	ds.mock_GetArmorProtectionData_value[2] = 35
	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronCuirass, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	expectForm(mockWornGearMainForms[0], to, beEqualTo, ArmorIronCuirass)
	
	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_HeadGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_HEAD
	ds.mock_GetArmorProtectionData_value[1] = 15
	ds.mock_GetArmorProtectionData_value[2] = 3
	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronHelmet, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)
	
	expectForm(mockWornGearMainForms[1], to, beEqualTo, ArmorIronHelmet)

	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_HandsGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_HANDS
	ds.mock_GetArmorProtectionData_value[1] = 7
	ds.mock_GetArmorProtectionData_value[2] = 6
	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronGauntlets, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	expectForm(mockWornGearMainForms[2], to, beEqualTo, ArmorIronGauntlets)

	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_FeetGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_FEET
	ds.mock_GetArmorProtectionData_value[1] = 7
	ds.mock_GetArmorProtectionData_value[2] = 6
	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronBoots, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	expectForm(mockWornGearMainForms[3], to, beEqualTo, ArmorIronBoots)

	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_CloakGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_CLOAK
	ds.mock_GetArmorProtectionData_value[1] = 12
	ds.mock_GetArmorProtectionData_value[2] = 12
	bool b = clothing.AddWornGearEntryForArmorEquipped(_Camp_Cloak_BasicBurlap, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	expectForm(mockWornGearMainForms[4], to, beEqualTo, _Camp_Cloak_BasicBurlap)

	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_MiscGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_MISC
	ds.mock_GetArmorProtectionData_value[1] = 0
	ds.mock_GetArmorProtectionData_value[2] = 20
	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronShield, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	expectForm(mockWornGearForms[0], to, beEqualTo, ArmorIronShield)

	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_AllGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()
	
	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_BODY
	ds.mock_GetArmorProtectionData_value[1] = 60
	ds.mock_GetArmorProtectionData_value[2] = 35
	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronCuirass, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_HEAD
	ds.mock_GetArmorProtectionData_value[1] = 15
	ds.mock_GetArmorProtectionData_value[2] = 3
	b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronHelmet, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_HANDS
	ds.mock_GetArmorProtectionData_value[1] = 7
	ds.mock_GetArmorProtectionData_value[2] = 6
	b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronGauntlets, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_FEET
	ds.mock_GetArmorProtectionData_value[1] = 7
	ds.mock_GetArmorProtectionData_value[2] = 6
	b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronBoots, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_CLOAK
	ds.mock_GetArmorProtectionData_value[1] = 5
	ds.mock_GetArmorProtectionData_value[2] = 5
	b = clothing.AddWornGearEntryForArmorEquipped(_Camp_Cloak_BasicBurlap, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[15]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_MISC
	ds.mock_GetArmorProtectionData_value[1] = 1
	ds.mock_GetArmorProtectionData_value[2] = 20
	b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronShield, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	expectForm(mockWornGearMainForms[0], to, beEqualTo, ArmorIronCuirass)
	expectForm(mockWornGearMainForms[1], to, beEqualTo, ArmorIronHelmet)
	expectForm(mockWornGearMainForms[2], to, beEqualTo, ArmorIronGauntlets)
	expectForm(mockWornGearMainForms[3], to, beEqualTo, ArmorIronBoots)
	expectForm(mockWornGearMainForms[4], to, beEqualTo, _Camp_Cloak_BasicBurlap)
	expectForm(mockWornGearForms[0], to, beEqualTo, ArmorIronShield)
	expectInt(ds.mock_GetArmorProtectionData_callcount, to, beEqualTo, 6)

	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testRemoveWornGearEntryForArmorUnequipped_Fail()
	beforeEach_RemoveWornGearEntryForArmorUnequippedSuite()

	mockWornGearMainForms[0] = ArmorIronCuirass
	mockWornGearMainForms[1] = ArmorIronHelmet

	bool result = clothing.RemoveWornGearEntryForArmorUnequipped(ArmorIronBoots, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

	expectBool(result, to, beFalsy)
	expectForm(mockWornGearMainForms[0], to, beEqualTo, ArmorIronCuirass)
	expectForm(mockWornGearMainForms[1], to, beEqualTo, ArmorIronHelmet)
	expectForm(mockWornGearMainForms[2], to, beNone)

	afterEach_RemoveWornGearEntryForArmorUnequippedSuite()
endFunction

function testRemoveWornGearEntryForArmorUnequipped_Success()
	beforeEach_RemoveWornGearEntryForArmorUnequippedSuite()
	mockWornGearMainForms[0] = ArmorIronCuirass
	mockWornGearMainForms[1] = ArmorIronHelmet
	mockWornGearMainForms[2] = ArmorIronGauntlets
	mockWornGearMainForms[3] = ArmorIronBoots
	mockWornGearMainForms[4] = _Camp_Cloak_BasicBurlap
    bool result = clothing.RemoveWornGearEntryForArmorUnequipped(ArmorIronGauntlets, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)

    expectBool(result, to, beTruthy)
    expectForm(mockWornGearMainForms[0], to, beEqualTo, ArmorIronCuirass)
    expectForm(mockWornGearMainForms[1], to, beEqualTo, ArmorIronHelmet)
    expectForm(mockWornGearMainForms[2], to, beNone)
    expectForm(mockWornGearMainForms[3], to, beEqualTo, ArmorIronBoots)
    expectForm(mockWornGearMainForms[4], to, beEqualTo, _Camp_Cloak_BasicBurlap)

	afterEach_RemoveWornGearEntryForArmorUnequippedSuite()
endFunction

function testRemoveWornGearEntryForArmorUnequipped_SuccessMany()
	beforeEach_RemoveWornGearEntryForArmorUnequippedSuite()
	mockWornGearMainForms[0] = ArmorIronCuirass
	mockWornGearMainForms[1] = ArmorIronHelmet
	mockWornGearMainForms[2] = ArmorIronGauntlets
	mockWornGearMainForms[3] = ArmorIronBoots
	mockWornGearMainForms[4] = _Camp_Cloak_BasicBurlap

    bool result = clothing.RemoveWornGearEntryForArmorUnequipped(ArmorIronHelmet, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)
    expectBool(result, to, beTruthy)
    result = clothing.RemoveWornGearEntryForArmorUnequipped(ArmorIronGauntlets, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)
    expectBool(result, to, beTruthy)
    result = clothing.RemoveWornGearEntryForArmorUnequipped(ArmorIronBoots, mockWornGearMainForms, mockWornGearForms, _Frost_WornGearData_mock)
    expectBool(result, to, beTruthy)
   
    expectForm(mockWornGearMainForms[0], to, beEqualTo, ArmorIronCuirass)
    expectForm(mockWornGearMainForms[1], to, beNone)
    expectForm(mockWornGearMainForms[2], to, beNone)
    expectForm(mockWornGearMainForms[3], to, beNone)
    expectForm(mockWornGearMainForms[4], to, beEqualTo, _Camp_Cloak_BasicBurlap)

	afterEach_RemoveWornGearEntryForArmorUnequippedSuite()
endFunction


function testRecalculate_BodyGear()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = ArmorIronCuirass
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 0)
    expectInt(mockWornGearValues[3], to, beEqualTo, 0)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_BodyHeadGear()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = ArmorIronCuirass
	mockWornGearMainForms[1] = ArmorIronHelmet
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 14)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_FullGear()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = ArmorIronCuirass
	mockWornGearMainForms[1] = ArmorIronHelmet
	mockWornGearMainForms[2] = ArmorIronGauntlets
	mockWornGearMainForms[3] = ArmorIronBoots
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 14)
    expectInt(mockWornGearValues[4], to, beEqualTo, 9)
    expectInt(mockWornGearValues[5], to, beEqualTo, 6)
    expectInt(mockWornGearValues[6], to, beEqualTo, 7)
    expectInt(mockWornGearValues[7], to, beEqualTo, 6)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_AllGear()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = ArmorIronCuirass
	mockWornGearMainForms[1] = ArmorIronHelmet
	mockWornGearMainForms[2] = ArmorIronGauntlets
	mockWornGearMainForms[3] = ArmorIronBoots
	mockWornGearMainForms[4] = _Camp_Cloak_BasicBurlap
	mockWornGearForms[0] = ArmorIronShield
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 14)
    expectInt(mockWornGearValues[4], to, beEqualTo, 9)
    expectInt(mockWornGearValues[5], to, beEqualTo, 6)
    expectInt(mockWornGearValues[6], to, beEqualTo, 7)
    expectInt(mockWornGearValues[7], to, beEqualTo, 6)
    expectInt(mockWornGearValues[8], to, beEqualTo, 12)
    expectInt(mockWornGearValues[9], to, beEqualTo, 12)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 20)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_ExtraHead()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = _Frost_UnitTestBodyExtraHead
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 40)
    expectInt(mockWornGearValues[3], to, beEqualTo, 29)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_ConflictHead()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = _Frost_UnitTestBodyExtraHead
	mockWornGearMainForms[1] = ArmorIronHelmet
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 14)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_ExtraCloak()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = _Frost_UnitTestBodyExtraCloak
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 0)
    expectInt(mockWornGearValues[3], to, beEqualTo, 0)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 12)
    expectInt(mockWornGearValues[9], to, beEqualTo, 40)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_ConflictCloak()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = _Frost_UnitTestBodyExtraCloak
	mockWornGearMainForms[4] = _Camp_Cloak_BasicFur
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 0)
    expectInt(mockWornGearValues[3], to, beEqualTo, 0)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 40)
    expectInt(mockWornGearValues[9], to, beEqualTo, 12)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_Misc()
	beforeEach_RecalculateProtectionDataSuite()
	mockWornGearMainForms[0] = ArmorIronCuirass
	mockWornGearMainForms[1] = ArmorIronHelmet
	mockWornGearMainForms[2] = ArmorIronGauntlets
	mockWornGearMainForms[3] = ArmorIronBoots
	mockWornGearMainForms[4] = _Camp_Cloak_BasicBurlap
	mockWornGearForms[0] = _Frost_UnitTestMiscGear1
	mockWornGearForms[1] = _Frost_UnitTestMiscGear2
	mockWornGearForms[2] = _Frost_UnitTestMiscGear3
	mockWornGearForms[3] = _Frost_UnitTestMiscGear4
    clothing.RecalculateProtectionData(mockWornGearMainForms, mockWornGearForms, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 60)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 14)
    expectInt(mockWornGearValues[4], to, beEqualTo, 9)
    expectInt(mockWornGearValues[5], to, beEqualTo, 6)
    expectInt(mockWornGearValues[6], to, beEqualTo, 7)
    expectInt(mockWornGearValues[7], to, beEqualTo, 6)
    expectInt(mockWornGearValues[8], to, beEqualTo, 12)
    expectInt(mockWornGearValues[9], to, beEqualTo, 12)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 80)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction


function testGetArmorWarmth()
	beforeEach_GetArmorData()

	mockWornGearValues[0] = 75
	mockWornGearValues[1] = 35
	mockWornGearValues[2] = 15
	mockWornGearValues[3] = 3
	mockWornGearValues[4] = 7
	mockWornGearValues[5] = 6
	mockWornGearValues[6] = 7
	mockWornGearValues[7] = 6
	mockWornGearValues[8] = 5
	mockWornGearValues[9] = 5
	mockWornGearValues[10] = 31
	mockWornGearValues[11] = 42

	int warmth = clothing.GetArmorWarmth(mockWornGearValues)

	expectInt(warmth, to, beEqualTo, 140)

	afterEach_GetArmorData()
endFunction

function testGetArmorCoverage()
	beforeEach_GetArmorData()

	mockWornGearValues[0] = 75
	mockWornGearValues[1] = 35
	mockWornGearValues[2] = 15
	mockWornGearValues[3] = 3
	mockWornGearValues[4] = 7
	mockWornGearValues[5] = 6
	mockWornGearValues[6] = 7
	mockWornGearValues[7] = 6
	mockWornGearValues[8] = 5
	mockWornGearValues[9] = 5
	mockWornGearValues[10] = 31
	mockWornGearValues[11] = 42

	int coverage = clothing.GetArmorCoverage(mockWornGearValues)

	expectInt(coverage, to, beEqualTo, 97)

	afterEach_GetArmorData()
endFunction