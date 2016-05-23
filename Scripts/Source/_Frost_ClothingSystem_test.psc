scriptname _Frost_ClothingSystem_test extends Lilac

_Frost_ClothingSystem clothing
_Frost_ArmorProtectionDatastoreHandler ds

Armor property _Frost_DummyCuirass auto
Armor property ArmorIronCuirass auto
Armor property ArmorIronGauntlets auto
Armor property ArmorIronBoots auto
Armor property ArmorIronHelmet auto
Armor property ArmorIronShield auto
Armor property _Camp_Cloak_BasicBurlap auto
Weapon property Axe01 auto

string[] property mockWornGearKeys auto hidden
int[] property mockWornGearValues auto hidden
Keyword property _Frost_WornGearData_mock auto

function beforeAll()
	clothing = FrostUtil.GetClothingSystem()
	ds = FrostUtil.GetClothingDatastoreHandler()
endFunction

function SetUp()
	EnableWarningOnSlowTests(1.0)
endFunction

function TestSuites()
	describe("Clothing System ObjectEquipped", ClothingSystem_ObjectEquippedSuite())
	describe("Clothing System AddWornGearEntryForArmorEquipped", ClothingSystem_AddWornGearEntryForArmorEquippedSuite())
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

function ClothingSystem_AddWornGearEntryForArmorEquippedSuite()
	it("should store the correct worn item data for body equipment", testAddWornGearEntryForArmorEquipped_BodyGear())
	it("should store the correct worn item data for head equipment", testAddWornGearEntryForArmorEquipped_HeadGear())
	it("should store the correct worn item data for hands equipment", testAddWornGearEntryForArmorEquipped_HandsGear())
	it("should store the correct worn item data for feet equipment", testAddWornGearEntryForArmorEquipped_FeetGear())
	it("should store the correct worn item data for cloak equipment", testAddWornGearEntryForArmorEquipped_CloakGear())
	it("should store the correct worn item data for misc equipment", testAddWornGearEntryForArmorEquipped_MiscGear())
	it("should store the correct worn item data for all equipment types simultaneously", testAddWornGearEntryForArmorEquipped_AllGear())
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

function beforeEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_callcount = 0
	ds.mock_GetArmorProtectionData_value = new int[15]
	mockWornGearKeys = new string[31]
	mockWornGearValues = new int[12]
	ds.GoToState("mock_GetArmorProtectionData")
	;@TODO: Do this some other way as to not rely on the system running
	clothing.StartUp()
endFunction

function afterEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_callcount = 0
	ds.mock_GetArmorProtectionData_value = new int[15]
	mockWornGearKeys = new string[31]
	mockWornGearValues = new int[12]
	ds.GoToState("")
endFunction

function beforeEach_RecalculateProtectionDataSuite()
	mockWornGearKeys = new string[31]
	mockWornGearValues = new int[12]
	clothing.StartUp()
endFunction

function afterEach_RecalculateProtectionDataSuite()
	mockWornGearKeys = new string[31]
	mockWornGearValues = new int[12]
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


function testAddWornGearEntryForArmorEquipped_BodyGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_BODY
	ds.mock_GetArmorProtectionData_value[1] = 75
	ds.mock_GetArmorProtectionData_value[2] = 35

	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronCuirass, mockWornGearKeys, _Frost_WornGearData_mock)

	string armor_key = "77385___Skyrim.esm"
	expectString(mockWornGearKeys[0], to, beEqualTo, armor_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 0), to, beEqualTo, ds.GEARTYPE_BODY)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 1), to, beEqualTo, 75)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 2), to, beEqualTo, 35)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 12), to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, armor_key)
	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_HeadGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_HEAD
	ds.mock_GetArmorProtectionData_value[1] = 15
	ds.mock_GetArmorProtectionData_value[2] = 3

	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronHelmet, mockWornGearKeys, _Frost_WornGearData_mock)

	string armor_key = "77389___Skyrim.esm"
	expectString(mockWornGearKeys[0], to, beEqualTo, armor_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 0), to, beEqualTo, ds.GEARTYPE_HEAD)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 3), to, beEqualTo, 15)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 4), to, beEqualTo, 3)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 12), to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, armor_key)
	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_HandsGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_HANDS
	ds.mock_GetArmorProtectionData_value[1] = 7
	ds.mock_GetArmorProtectionData_value[2] = 6

	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronGauntlets, mockWornGearKeys, _Frost_WornGearData_mock)

	string armor_key = "77382___Skyrim.esm"
	expectString(mockWornGearKeys[0], to, beEqualTo, armor_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 0), to, beEqualTo, ds.GEARTYPE_HANDS)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 5), to, beEqualTo, 7)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 6), to, beEqualTo, 6)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 12), to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, armor_key)
	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_FeetGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_FEET
	ds.mock_GetArmorProtectionData_value[1] = 7
	ds.mock_GetArmorProtectionData_value[2] = 6

	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronBoots, mockWornGearKeys, _Frost_WornGearData_mock)

	string armor_key = "77387___Skyrim.esm"
	expectString(mockWornGearKeys[0], to, beEqualTo, armor_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 0), to, beEqualTo, ds.GEARTYPE_FEET)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 7), to, beEqualTo, 7)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 8), to, beEqualTo, 6)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 12), to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, armor_key)
	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_CloakGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_CLOAK
	ds.mock_GetArmorProtectionData_value[1] = 5
	ds.mock_GetArmorProtectionData_value[2] = 5

	bool b = clothing.AddWornGearEntryForArmorEquipped(_Camp_Cloak_BasicBurlap, mockWornGearKeys, _Frost_WornGearData_mock)

	string armor_key = "260764___Campfire.esm"
	expectString(mockWornGearKeys[0], to, beEqualTo, armor_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 0), to, beEqualTo, ds.GEARTYPE_CLOAK)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 9), to, beEqualTo, 5)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 10), to, beEqualTo, 5)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, armor_key, 12), to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, armor_key)
	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_MiscGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_MISC
	ds.mock_GetArmorProtectionData_value[1] = 0
	ds.mock_GetArmorProtectionData_value[2] = 20
	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronShield, mockWornGearKeys, _Frost_WornGearData_mock)

	string misc_key = "77494___Skyrim.esm"
	expectString(mockWornGearKeys[0], to, beEqualTo, misc_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 0), to, beEqualTo, ds.GEARTYPE_MISC)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 12), to, beEqualTo, 20)

	StorageUtil.IntListClear(_Frost_WornGearData_mock, misc_key)
	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction

function testAddWornGearEntryForArmorEquipped_AllGear()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_BODY
	ds.mock_GetArmorProtectionData_value[1] = 75
	ds.mock_GetArmorProtectionData_value[2] = 35
	bool b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronCuirass, mockWornGearKeys, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_HEAD
	ds.mock_GetArmorProtectionData_value[1] = 15
	ds.mock_GetArmorProtectionData_value[2] = 3
	b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronHelmet, mockWornGearKeys, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_HANDS
	ds.mock_GetArmorProtectionData_value[1] = 7
	ds.mock_GetArmorProtectionData_value[2] = 6
	b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronGauntlets, mockWornGearKeys, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_FEET
	ds.mock_GetArmorProtectionData_value[1] = 7
	ds.mock_GetArmorProtectionData_value[2] = 6
	b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronBoots, mockWornGearKeys, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_CLOAK
	ds.mock_GetArmorProtectionData_value[1] = 5
	ds.mock_GetArmorProtectionData_value[2] = 5
	b = clothing.AddWornGearEntryForArmorEquipped(_Camp_Cloak_BasicBurlap, mockWornGearKeys, _Frost_WornGearData_mock)

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_MISC
	ds.mock_GetArmorProtectionData_value[1] = 1
	ds.mock_GetArmorProtectionData_value[2] = 20
	b = clothing.AddWornGearEntryForArmorEquipped(ArmorIronShield, mockWornGearKeys, _Frost_WornGearData_mock)

	string body_key = "77385___Skyrim.esm"
	string head_key = "77389___Skyrim.esm"
	string hands_key = "77382___Skyrim.esm"
	string feet_key = "77387___Skyrim.esm"
	string cloak_key = "260764___Campfire.esm"
	string misc_key = "77494___Skyrim.esm"

	expectString(mockWornGearKeys[0], to, beEqualTo, body_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 0), to, beEqualTo, ds.GEARTYPE_BODY)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 1), to, beEqualTo, 75)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 2), to, beEqualTo, 35)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, body_key, 12), to, beEqualTo, 0)

	expectString(mockWornGearKeys[1], to, beEqualTo, head_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 0), to, beEqualTo, ds.GEARTYPE_HEAD)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 3), to, beEqualTo, 15)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 4), to, beEqualTo, 3)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, head_key, 12), to, beEqualTo, 0)

	expectString(mockWornGearKeys[2], to, beEqualTo, hands_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 0), to, beEqualTo, ds.GEARTYPE_HANDS)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 5), to, beEqualTo, 7)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 6), to, beEqualTo, 6)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, hands_key, 12), to, beEqualTo, 0)

	expectString(mockWornGearKeys[3], to, beEqualTo, feet_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 0), to, beEqualTo, ds.GEARTYPE_FEET)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 7), to, beEqualTo, 7)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 8), to, beEqualTo, 6)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, feet_key, 12), to, beEqualTo, 0)

	expectString(mockWornGearKeys[4], to, beEqualTo, cloak_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 0), to, beEqualTo, ds.GEARTYPE_CLOAK)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 9), to, beEqualTo, 5)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 10), to, beEqualTo, 5)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 11), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, cloak_key, 12), to, beEqualTo, 0)

	expectString(mockWornGearKeys[5], to, beEqualTo, misc_key)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 0), to, beEqualTo, ds.GEARTYPE_MISC)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 1), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 2), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 3), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 4), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 5), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 6), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 7), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 8), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 9), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 10), to, beEqualTo, 0)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 11), to, beEqualTo, 1)
	expectInt(StorageUtil.IntListGet(_Frost_WornGearData_mock, misc_key, 12), to, beEqualTo, 20)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, head_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, hands_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, feet_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, cloak_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, misc_key)

	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction


function testRecalculate_BodyGear()
	beforeEach_RecalculateProtectionDataSuite()

	string body_key = "77385___Skyrim.esm"
	mockWornGearKeys[0] = body_key
	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
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
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_BodyHeadGear()
	beforeEach_RecalculateProtectionDataSuite()

	string body_key = "77385___Skyrim.esm"
	string head_key = "77389___Skyrim.esm"
	mockWornGearKeys[0] = body_key
	mockWornGearKeys[1] = head_key

	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, head_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 0, ds.GEARTYPE_HEAD) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 3, 15)    ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 4, 3)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 12, 0)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 3)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, head_key)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_FullGear()
	beforeEach_RecalculateProtectionDataSuite()
	
	string body_key = "77385___Skyrim.esm"
	string head_key = "77389___Skyrim.esm"
	string hands_key = "77382___Skyrim.esm"
	string feet_key = "77387___Skyrim.esm"
	mockWornGearKeys[0] = body_key
	mockWornGearKeys[1] = head_key
	mockWornGearKeys[2] = hands_key
	mockWornGearKeys[3] = feet_key

	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, head_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 0, ds.GEARTYPE_HEAD) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 3, 15)    ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 4, 3)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, hands_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 0, ds.GEARTYPE_HANDS) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 5, 7)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 6, 6)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, feet_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 0, ds.GEARTYPE_FEET) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 7, 7)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 8, 6)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 12, 0)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 3)
    expectInt(mockWornGearValues[4], to, beEqualTo, 7)
    expectInt(mockWornGearValues[5], to, beEqualTo, 6)
    expectInt(mockWornGearValues[6], to, beEqualTo, 7)
    expectInt(mockWornGearValues[7], to, beEqualTo, 6)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, head_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, hands_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, feet_key)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_AllGear()
	beforeEach_RecalculateProtectionDataSuite()
	
	string body_key = "77385___Skyrim.esm"
	string head_key = "77389___Skyrim.esm"
	string hands_key = "77382___Skyrim.esm"
	string feet_key = "77387___Skyrim.esm"
	string cloak_key = "260764___Campfire.esm"
	string misc_key = "77494___Skyrim.esm"
	mockWornGearKeys[0] = body_key
	mockWornGearKeys[1] = head_key
	mockWornGearKeys[2] = hands_key
	mockWornGearKeys[3] = feet_key
	mockWornGearKeys[4] = cloak_key
	mockWornGearKeys[5] = misc_key

	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, head_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 0, ds.GEARTYPE_HEAD) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 3, 15)    ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 4, 3)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, hands_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 0, ds.GEARTYPE_HANDS) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 5, 7)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 6, 6)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, feet_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 0, ds.GEARTYPE_FEET) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 7, 7)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 8, 6)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, cloak_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 0, ds.GEARTYPE_CLOAK) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 9, 5)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 10, 5)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, misc_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 0, ds.GEARTYPE_MISC) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 11, 1)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key, 12, 20)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 3)
    expectInt(mockWornGearValues[4], to, beEqualTo, 7)
    expectInt(mockWornGearValues[5], to, beEqualTo, 6)
    expectInt(mockWornGearValues[6], to, beEqualTo, 7)
    expectInt(mockWornGearValues[7], to, beEqualTo, 6)
    expectInt(mockWornGearValues[8], to, beEqualTo, 5)
    expectInt(mockWornGearValues[9], to, beEqualTo, 5)
    expectInt(mockWornGearValues[10], to, beEqualTo, 1)
    expectInt(mockWornGearValues[11], to, beEqualTo, 20)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, head_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, hands_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, feet_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, cloak_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, misc_key)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_ExtraHead()
	beforeEach_RecalculateProtectionDataSuite()
	
	string body_key = "77385___Skyrim.esm"
	mockWornGearKeys[0] = body_key

	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 30)    ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 45)    ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 30)
    expectInt(mockWornGearValues[3], to, beEqualTo, 45)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_ConflictHead()
	beforeEach_RecalculateProtectionDataSuite()
	
	string body_key = "77385___Skyrim.esm"
	string head_key = "77389___Skyrim.esm"
	mockWornGearKeys[0] = body_key
	mockWornGearKeys[1] = head_key

	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 30)    ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 45)    ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, head_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 0, ds.GEARTYPE_HEAD) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 3, 15)    ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 4, 3)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 12, 0)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 3)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 0)
    expectInt(mockWornGearValues[9], to, beEqualTo, 0)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, head_key)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_ExtraCloak()
	beforeEach_RecalculateProtectionDataSuite()
	
	string body_key = "77385___Skyrim.esm"
	string cloak_key = "260764___Campfire.esm"
	mockWornGearKeys[0] = body_key
	mockWornGearKeys[1] = cloak_key

	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 15)    ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 15)   ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 0)
    expectInt(mockWornGearValues[3], to, beEqualTo, 0)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 15)
    expectInt(mockWornGearValues[9], to, beEqualTo, 15)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_ConflictCloak()
	beforeEach_RecalculateProtectionDataSuite()
	
	string body_key = "77385___Skyrim.esm"
	string cloak_key = "260764___Campfire.esm"
	mockWornGearKeys[0] = body_key
	mockWornGearKeys[1] = cloak_key

	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 29)    ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 14)    ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 5)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 5)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, cloak_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 0, ds.GEARTYPE_CLOAK) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 9, 20)    ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 10, 20)   ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 12, 0)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 29)
    expectInt(mockWornGearValues[3], to, beEqualTo, 14)
    expectInt(mockWornGearValues[4], to, beEqualTo, 0)
    expectInt(mockWornGearValues[5], to, beEqualTo, 0)
    expectInt(mockWornGearValues[6], to, beEqualTo, 0)
    expectInt(mockWornGearValues[7], to, beEqualTo, 0)
    expectInt(mockWornGearValues[8], to, beEqualTo, 20)
    expectInt(mockWornGearValues[9], to, beEqualTo, 20)
    expectInt(mockWornGearValues[10], to, beEqualTo, 0)
    expectInt(mockWornGearValues[11], to, beEqualTo, 0)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, cloak_key)
	
	afterEach_RecalculateProtectionDataSuite()
endFunction

function testRecalculate_Misc()
	beforeEach_RecalculateProtectionDataSuite()
	
	string body_key = "77385___Skyrim.esm"
	string head_key = "77389___Skyrim.esm"
	string hands_key = "77382___Skyrim.esm"
	string feet_key = "77387___Skyrim.esm"
	string cloak_key = "260764___Campfire.esm"
	string misc_key1 = "first_misc_key"
	string misc_key2 = "second_misc_key"
	string misc_key3 = "third_misc_key"
	string misc_key4 = "fourth_misc_key"
	mockWornGearKeys[0] = body_key
	mockWornGearKeys[1] = head_key
	mockWornGearKeys[2] = hands_key
	mockWornGearKeys[3] = feet_key
	mockWornGearKeys[4] = cloak_key
	mockWornGearKeys[5] = misc_key1
	mockWornGearKeys[6] = misc_key2
	mockWornGearKeys[7] = misc_key3
	mockWornGearKeys[8] = misc_key4

	StorageUtil.IntListResize(_Frost_WornGearData_mock, body_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 0, ds.GEARTYPE_BODY) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 1, 75)    ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 2, 35)    ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, body_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, head_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 0, ds.GEARTYPE_HEAD) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 3, 15)    ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 4, 3)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, head_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, hands_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 0, ds.GEARTYPE_HANDS) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 5, 7)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 6, 6)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, hands_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, feet_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 0, ds.GEARTYPE_FEET) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 7, 7)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 8, 6)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, feet_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, cloak_key, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 0, ds.GEARTYPE_CLOAK) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 9, 5)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 10, 5)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 11, 0)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, cloak_key, 12, 0)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, misc_key1, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 0, ds.GEARTYPE_MISC) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 11, 5)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key1, 12, 8)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, misc_key2, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 0, ds.GEARTYPE_MISC) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 11, 12)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key2, 12, 18)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, misc_key3, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 0, ds.GEARTYPE_MISC) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 11, 4)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key3, 12, 7)    ; misc coverage

    StorageUtil.IntListResize(_Frost_WornGearData_mock, misc_key4, 13)
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 0, ds.GEARTYPE_MISC) ; type
	StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 1, 0)     ; body warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 2, 0)     ; body coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 3, 0)     ; head warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 4, 0)     ; head coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 5, 0)     ; hands warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 6, 0)     ; hands coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 7, 0)     ; feet warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 8, 0)     ; feet coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 9, 0)     ; cloak warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 10, 0)    ; cloak coverage
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 11, 10)    ; misc warmth
    StorageUtil.IntListSet(_Frost_WornGearData_mock, misc_key4, 12, 9)    ; misc coverage

    clothing.RecalculateProtectionData(mockWornGearKeys, mockWornGearValues, _Frost_WornGearData_mock)

    expectInt(mockWornGearValues[0], to, beEqualTo, 75)
    expectInt(mockWornGearValues[1], to, beEqualTo, 35)
    expectInt(mockWornGearValues[2], to, beEqualTo, 15)
    expectInt(mockWornGearValues[3], to, beEqualTo, 3)
    expectInt(mockWornGearValues[4], to, beEqualTo, 7)
    expectInt(mockWornGearValues[5], to, beEqualTo, 6)
    expectInt(mockWornGearValues[6], to, beEqualTo, 7)
    expectInt(mockWornGearValues[7], to, beEqualTo, 6)
    expectInt(mockWornGearValues[8], to, beEqualTo, 5)
    expectInt(mockWornGearValues[9], to, beEqualTo, 5)
    expectInt(mockWornGearValues[10], to, beEqualTo, 31)
    expectInt(mockWornGearValues[11], to, beEqualTo, 42)
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, head_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, hands_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, feet_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, cloak_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, misc_key1)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, misc_key2)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, misc_key3)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, misc_key4)
	
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