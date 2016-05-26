scriptname _Frost_Test_e2e_ClothingScript extends Lilac

import FrostUtil

_Frost_Main property Frostfall auto
Actor property PlayerRef auto
Race property NordRace auto

Armor property ArmorIronCuirass auto
Armor property ArmorIronHelmet auto
Armor property ArmorIronGauntlets auto
Armor property ArmorIronBoots auto
Armor property ArmorIronShield auto
Armor property ArmorLeatherCuirass auto
Armor property ArmorLeatherHelmet auto
Armor property ArmorLeatherGauntlets auto
Armor property ArmorLeatherBoots auto
Armor property ArmorHideShield auto
Armor property BurlapCloak auto
Armor property LeatherCloak auto

Armor property _Frost_UnitTestUnknownBody1 auto
Armor property _Frost_UnitTestUnknownBody2 auto
Armor property _Frost_UnitTestUnknownHead1 auto
Armor property _Frost_UnitTestUnknownHead2 auto
Armor property _Frost_UnitTestUnknownHands1 auto
Armor property _Frost_UnitTestUnknownHands2 auto
Armor property _Frost_UnitTestUnknownFeet1 auto
Armor property _Frost_UnitTestUnknownFeet2 auto
Armor property _Frost_UnitTestUnknownCloak1 auto
Armor property _Frost_UnitTestUnknownCloak2 auto
Armor property _Frost_UnitTestUnknownShield1 auto
Armor property _Frost_UnitTestUnknownShield2 auto

function TestSuites()
	describe("Clothing System End-To-End Single Item", ClothingSystemE2ESingleSuite())
	describe("Clothing System End-To-End Multiple Items", ClothingSystemE2EMultipleSuite())
	describe("Clothing System End-To-End Stress Tests", ClothingSystemE2EStressTests())
endFunction

function ClothingSystemE2ESingleSuite()
	it("should set the correct warmth and coverage values when equipping / unequipping iron armor", testEquipSingle_IronArmor())
	it("should set the correct warmth and coverage values when equipping / unequipping iron helmet", testEquipSingle_IronHelmet())
	it("should set the correct warmth and coverage values when equipping / unequipping iron gauntlets", testEquipSingle_IronGauntlets())
	it("should set the correct warmth and coverage values when equipping / unequipping iron boots", testEquipSingle_IronBoots())
	it("should set the correct warmth and coverage values when equipping / unequipping iron shield", testEquipSingle_IronShield())
endFunction

function ClothingSystemE2EMultipleSuite()
	it("should set the correct warmth and coverage values when equipping / unequipping body and head gear", testEquipMulti_Two())
	it("should set the correct warmth and coverage values when equipping / unequipping body, head, hands, and feet gear", testEquipMulti_Four())
	it("should set the correct warmth and coverage values when equipping / unequipping body, head, hands, feet, shield, and cloak", testEquipMulti_Six())
endFunction

function ClothingSystemE2EStressTests()
	it("should swap a full set of iron to a full set of leather with no delays")
	it("should swap a full set of unknown gear to a full set of unknown gear with no delays")
	it("should swap between iron and leather gear 7 times rapidly")
	it("should swap between iron and leather gear 25 times rapidly")
	it("should swap between iron and keyword unit test gear 25 times rapidly")
	it("should swap between two sets of unknown unit test gear 25 times rapidly")
endFunction


function beforeAll()
	Frostfall.StartFrostfall(abBypassStartupMessage = true)
	debug.trace(createLilacDebugMessage(WARN, "End-to-End tests are potentially destructive. Do not continue to play after running."))
	debug.notification("End-to-End Clothing Tests: Starting.")
endFunction

function afterAll()
	PlayerRef.UnequipAll()
	debug.notification("End-to-End Clothing Tests: Complete.")
endFunction

function beforeEach()
	PlayerRef.UnequipAll()
	Utility.Wait(1)
endFunction


; Test Cases ==================================================================


function testEquipSingle_IronArmor()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 75)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 35)

	PlayerRef.UnequipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipSingle_IronHelmet()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 15)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 3)

	PlayerRef.UnequipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipSingle_IronGauntlets()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 7)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 6)

	PlayerRef.UnequipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipSingle_IronBoots()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 7)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 6)

	PlayerRef.UnequipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipSingle_IronShield()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 0)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 20)

	PlayerRef.UnequipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction


function testEquipMulti_Two()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 90)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 38)

	PlayerRef.UnequipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipMulti_Four()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 104)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 50)

	PlayerRef.UnequipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipMulti_Six()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(BurlapCloak, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 109)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 75)

	PlayerRef.UnequipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(BurlapCloak, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_1()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	PlayerRef.EquipItem(BurlapCloak, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 109)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 75)

	PlayerRef.EquipItem(ArmorLeatherCuirass, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherHelmet, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherGauntlets, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherBoots, abSilent = true)
	PlayerRef.EquipItem(ArmorHideShield, abSilent = true)
	PlayerRef.EquipItem(LeatherCloak, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 999)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 999)

	PlayerRef.UnequipItem(ArmorLeatherCuirass, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherHelmet, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherGauntlets, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherBoots, abSilent = true)
	PlayerRef.UnequipItem(ArmorHideShield, abSilent = true)
	PlayerRef.UnequipItem(LeatherCloak, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_2()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(_Frost_UnitTestUnknownBody1, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHead1, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHands1, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownFeet1, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownShield1, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownCloak1, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 999)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 999)

	PlayerRef.EquipItem(_Frost_UnitTestUnknownBody2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHead2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHands2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownFeet2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownShield2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownCloak2, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 999)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 999)

	PlayerRef.UnequipItem(_Frost_UnitTestUnknownBody2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownHead2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownHands2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownFeet2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownShield2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownCloak2, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_3()
	int starting_warmth = GetPlayerWarmth()
	int starting_coverage = GetPlayerCoverage()

	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	PlayerRef.EquipItem(BurlapCloak, abSilent = true)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherHelmet, abSilent = true)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherGauntlets, abSilent = true)
	PlayerRef.EquipItem(ArmorHideShield, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherBoots, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherCuirass, abSilent = true)
	PlayerRef.EquipItem(LeatherCloak, abSilent = true)

	Utility.Wait(0.8)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 999)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 999)

	PlayerRef.UnequipItem(ArmorLeatherCuirass, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherHelmet, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherGauntlets, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherBoots, abSilent = true)
	PlayerRef.UnequipItem(ArmorHideShield, abSilent = true)
	PlayerRef.UnequipItem(LeatherCloak, abSilent = true)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_4()

endFunction

function testStress_5()

endFunction

function testStress_6()

endFunction