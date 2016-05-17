scriptname _Frost_ClothingSystem_test extends Lilac

_Frost_ClothingSystem clothing
_Frost_ArmorProtectionDatastoreHandler ds

Armor property _Frost_DummyCuirass auto
Armor property ArmorIronCuirass auto
Weapon property Axe01 auto

string[] property mockWornGearKeys auto hidden
int[] property mockWornGearValues auto hidden
Keyword property _Frost_WornGearData_mock auto

function beforeAll()
	clothing = FrostUtil.GetClothingSystem()
	ds = FrostUtil.GetClothingDatastoreHandler()
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
	it("should store the correct worn item data for Iron Cuirass", testAddWornGearEntryForArmorEquipped_IronCuirass())
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


function testAddWornGearEntryForArmorEquipped_IronCuirass()
	beforeEach_AddWornGearEntryForArmorEquippedSuite()

	ds.mock_GetArmorProtectionData_value = new int[16]
	ds.mock_GetArmorProtectionData_value[0] = ds.GEARTYPE_BODY
	ds.mock_GetArmorProtectionData_value[1] = 75
	ds.mock_GetArmorProtectionData_value[2] = 35
	ds.mock_GetArmorProtectionData_value[3] = 0
	ds.mock_GetArmorProtectionData_value[4] = 0
	ds.mock_GetArmorProtectionData_value[5] = 0
	ds.mock_GetArmorProtectionData_value[6] = 0
	ds.mock_GetArmorProtectionData_value[7] = 0
	ds.mock_GetArmorProtectionData_value[8] = 0
	ds.mock_GetArmorProtectionData_value[9] = 0
	ds.mock_GetArmorProtectionData_value[10] = 0
	ds.mock_GetArmorProtectionData_value[11] = 0
	ds.mock_GetArmorProtectionData_value[12] = 0
	ds.mock_GetArmorProtectionData_value[13] = 0
	ds.mock_GetArmorProtectionData_value[14] = 0
	ds.mock_GetArmorProtectionData_value[15] = 0

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