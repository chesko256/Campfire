scriptname _Frost_ClothingSystem_test extends Lilac

_Frost_ClothingSystem clothing
_Frost_ArmorProtectionDatastoreHandler ds

Armor property _Frost_DummyCuirass auto
Armor property ArmorIronCuirass auto
Armor property ArmorIronGauntlets auto
Armor property ArmorIronBoots auto
Armor property ArmorIronHelmet auto
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
endFunction

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
	;it("should store the correct worn item data for misc equipment", testAddWornGearEntryForArmorEquipped_MiscGear())
	it("should store the correct worn item data for all equipment types simultaneously", testAddWornGearEntryForArmorEquipped_AllGear())
endFunction

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
	clothing.StartUp()
	clothing.GoToState("mock_testHandleObjectEquipped")
endFunction

function afterEach_AddWornGearEntryForArmorEquippedSuite()
	ds.mock_GetArmorProtectionData_callcount = 0
	ds.mock_GetArmorProtectionData_value = new int[15]
	mockWornGearKeys = new string[31]
	mockWornGearValues = new int[12]
	ds.GoToState("")
	clothing.GoToState("")
endFunction


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

	string body_key = "77385___Skyrim.esm"
	string head_key = "77389___Skyrim.esm"
	string hands_key = "77382___Skyrim.esm"
	string feet_key = "77387___Skyrim.esm"
	string cloak_key = "260764___Campfire.esm"

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
	
	StorageUtil.IntListClear(_Frost_WornGearData_mock, body_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, head_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, hands_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, feet_key)
	StorageUtil.IntListClear(_Frost_WornGearData_mock, cloak_key)

	afterEach_AddWornGearEntryForArmorEquippedSuite()
endFunction
