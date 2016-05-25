scriptname _Frost_APDatastoreHandler_test extends Lilac

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
	it("should get correct data when keyword set for body gear", testGetArmorProtectionDataByKeyword_NormalBody())
	it("should get correct data when keyword set for head gear", testGetArmorProtectionDataByKeyword_NormalHead())
	it("should get correct data when keyword set for hands gear", testGetArmorProtectionDataByKeyword_NormalHands())
	it("should get correct data when keyword set for feet gear", testGetArmorProtectionDataByKeyword_NormalFeet())
	it("should get correct data when keyword set for cloak gear", testGetArmorProtectionDataByKeyword_NormalCloak())
	it("should get correct data when keyword set for body gear with extra cloak keyword", testGetArmorProtectionDataByKeyword_BodyExtraCloak())
	it("should get correct data when keyword set for body gear with extra cloak and head keyword", testGetArmorProtectionDataByKeyword_BodyExtraHeadCloak())
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


; Test Cases ==================================================================


function testGetArmorProtectionData_FoundData()

endFunction

function testGetArmorProtectionData_IgnoreFlag()

endFunction

function testGetArmorProtectionData_Keyword()

endFunction

function testGetArmorProtectionData_KeywordIgnore()

endFunction

function testGetArmorProtectionData_Analysis()

endFunction

function testGetArmorProtectionDataByKeyword_IgnoreKeyword()

endFunction

function testGetArmorProtectionDataByKeyword_NormalBody()

endFunction

function testGetArmorProtectionDataByKeyword_NormalHead()

endFunction

function testGetArmorProtectionDataByKeyword_NormalHands()

endFunction

function testGetArmorProtectionDataByKeyword_NormalFeet()

endFunction

function testGetArmorProtectionDataByKeyword_NormalCloak()

endFunction

function testGetArmorProtectionDataByKeyword_BodyExtraCloak()

endFunction

function testGetArmorProtectionDataByKeyword_BodyExtraHeadCloak()

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
