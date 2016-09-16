scriptname _Frost_Test_e2e_ClothingScript extends Lilac

import FrostUtil

_Frost_Main property Frostfall auto
_Frost_PlayerEquipMonitor property EquipMon auto
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
Armor property _Camp_Cloak_BasicBurlap auto
Armor property _Camp_Cloak_BasicHide auto

Armor property _Frost_UnitTestNormalBody auto
Armor property _Frost_UnitTestWarmHead auto
Armor property _Frost_UnitTestVeryWarmFeet auto
Armor property _Frost_UnitTestWaterproofHands auto
Armor property _Frost_UnitTestWarmCloak auto
Armor property _Frost_UnitTestWaterproofShield auto

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

; Test-specific variables
int starting_warmth = 0
int starting_coverage = 0

function SetUp()
	; EnableVerboseLogging()
endFunction

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
	it("should swap a full set of iron to a full set of leather with no delays", testStress_1())
	it("should swap a full set of unknown gear to a full set of unknown gear with no delays", testStress_2())
	it("should swap between iron and leather gear a limited number of times rapidly", testStress_3())
	it("should swap between iron and leather gear a large number of times rapidly", testStress_4())
	it("should swap between iron and keyword unit test gear a large number of times rapidly", testStress_5())
	it("should swap between two sets of unknown unit test gear a large number of times rapidly", testStress_6())
endFunction


function beforeAll()
	Frostfall.StartFrostfall(abBypassStartupMessage = true)
	debug.trace(createLilacDebugMessage(WARN, "End-to-End tests are potentially destructive. Do not continue to play after running."))
	debug.notification("End-to-End Clothing Tests: Starting.")
	PlayerRef.UnequipAll()
	WaitForEquipQueueDone()
	starting_warmth = GetPlayerWarmth()
	starting_coverage = GetPlayerCoverage()
endFunction

function afterAll()
	PlayerRef.UnequipAll()
	debug.notification("End-to-End Clothing Tests: Complete.")
endFunction

function beforeEach()
	Utility.Wait(1)
endFunction

function WaitForEquipQueueDone()
	; Wait for the queue to start processing.
	Utility.Wait(0.3)
	
	while EquipMon.processing_queue || EquipMon.queue_count > 0
		Utility.Wait(0.2)
	endWhile

	Utility.Wait(1)

	; Wait for the warmth and coverage events to be dispatched and processed.
	while GetWarmthSystem().updating_warmth
		Utility.Wait(0.5)
	endWhile
	while GetCoverageSystem().updating_coverage
		Utility.Wait(0.5)
	endWhile
endFunction

; Test Cases ==================================================================


function testEquipSingle_IronArmor()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 75)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 35)

	PlayerRef.UnequipItem(ArmorIronCuirass, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipSingle_IronHelmet()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 15)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 3)

	PlayerRef.UnequipItem(ArmorIronHelmet, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipSingle_IronGauntlets()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 7)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 6)

	PlayerRef.UnequipItem(ArmorIronGauntlets, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipSingle_IronBoots()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 7)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 6)

	PlayerRef.UnequipItem(ArmorIronBoots, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipSingle_IronShield()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 0)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 20)

	PlayerRef.UnequipItem(ArmorIronShield, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction


function testEquipMulti_Two()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 90)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 38)

	PlayerRef.UnequipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronHelmet, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipMulti_Four()
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
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 104)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 50)

	PlayerRef.UnequipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.UnequipItem(ArmorIronBoots, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testEquipMulti_Six()
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
	PlayerRef.EquipItem(_Camp_Cloak_BasicBurlap, abSilent = true)
	WaitForEquipQueueDone()

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
	PlayerRef.UnequipItem(_Camp_Cloak_BasicBurlap, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_1()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	PlayerRef.EquipItem(_Camp_Cloak_BasicBurlap, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 109)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 75)

	PlayerRef.EquipItem(ArmorLeatherCuirass, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherHelmet, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherGauntlets, abSilent = true)
	PlayerRef.EquipItem(ArmorLeatherBoots, abSilent = true)
	PlayerRef.EquipItem(ArmorHideShield, abSilent = true)
	PlayerRef.EquipItem(_Camp_Cloak_BasicHide, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 189)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 221)

	PlayerRef.UnequipItem(ArmorLeatherCuirass, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherHelmet, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherGauntlets, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherBoots, abSilent = true)
	PlayerRef.UnequipItem(ArmorHideShield, abSilent = true)
	PlayerRef.UnequipItem(_Camp_Cloak_BasicHide, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_2()
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
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 174)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 99)

	PlayerRef.EquipItem(_Frost_UnitTestUnknownBody2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHead2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHands2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownFeet2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownShield2, abSilent = true)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownCloak2, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 174)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 99)

	PlayerRef.UnequipItem(_Frost_UnitTestUnknownBody2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownHead2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownHands2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownFeet2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownShield2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownCloak2, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_3()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Camp_Cloak_BasicBurlap, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorHideShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Camp_Cloak_BasicHide, abSilent = true)

	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 189)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 221)

	PlayerRef.UnequipItem(ArmorLeatherCuirass, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherHelmet, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherGauntlets, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherBoots, abSilent = true)
	PlayerRef.UnequipItem(ArmorHideShield, abSilent = true)
	PlayerRef.UnequipItem(_Camp_Cloak_BasicHide, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_4()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Camp_Cloak_BasicBurlap, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorHideShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Camp_Cloak_BasicHide, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Camp_Cloak_BasicBurlap, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorHideShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorLeatherCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Camp_Cloak_BasicHide, abSilent = true)
	Utility.Wait(0.1)

	WaitForEquipQueueDone()

	; also check integrity of the keys array
	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 189)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 221)

	PlayerRef.UnequipItem(ArmorLeatherCuirass, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherHelmet, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherGauntlets, abSilent = true)
	PlayerRef.UnequipItem(ArmorLeatherBoots, abSilent = true)
	PlayerRef.UnequipItem(ArmorHideShield, abSilent = true)
	PlayerRef.UnequipItem(_Camp_Cloak_BasicHide, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_5()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Camp_Cloak_BasicBurlap, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestWarmHead, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestWaterproofHands, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestWaterproofShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestVeryWarmFeet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestNormalBody, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestWarmCloak, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronCuirass, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Camp_Cloak_BasicBurlap, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronHelmet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronGauntlets, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestWarmHead, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronBoots, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(ArmorIronShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestWaterproofHands, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestWaterproofShield, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestVeryWarmFeet, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestNormalBody, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestWarmCloak, abSilent = true)

	WaitForEquipQueueDone()

	; also check integrity of the keys array
	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 234)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 183)

	PlayerRef.UnequipItem(_Frost_UnitTestNormalBody, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestWarmHead, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestWaterproofHands, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestVeryWarmFeet, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestWaterproofShield, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestWarmCloak, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction

function testStress_6()
	; Default start as a Nord
	expectForm(PlayerRef.GetRace(), to, beEqualTo, NordRace)
	expectInt(GetPlayerWarmth(), to, beEqualTo, 25)
	expectInt(GetPlayerCoverage(), to, beEqualTo, 0)

	PlayerRef.EquipItem(_Frost_UnitTestUnknownBody1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownCloak1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHead1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHands1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHead2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownFeet1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownShield1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHands2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownShield2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownFeet2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownBody2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownCloak2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownBody1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownCloak1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHead1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHands1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHead2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownFeet1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownShield1, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownHands2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownShield2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownFeet2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownBody2, abSilent = true)
	Utility.Wait(0.1)
	PlayerRef.EquipItem(_Frost_UnitTestUnknownCloak2, abSilent = true)

	WaitForEquipQueueDone()

	; also check integrity of the keys array
	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 174)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 99)

	PlayerRef.UnequipItem(_Frost_UnitTestUnknownBody2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownHead2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownHands2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownFeet2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownShield2, abSilent = true)
	PlayerRef.UnequipItem(_Frost_UnitTestUnknownCloak2, abSilent = true)
	WaitForEquipQueueDone()

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction