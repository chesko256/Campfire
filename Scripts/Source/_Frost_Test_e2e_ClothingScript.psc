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


function TestSuites()
	describe("Clothing System End-To-End Single Item", ClothingSystemE2ESingleSuite())
	describe("Clothing System End-To-End Multiple Items", ClothingSystemE2EMultipleSuite())
	describe("Clothing System End-To-End Full Gear Swaps", ClothingSystemE2EGearSwaps())
endFunction

function ClothingSystemE2ESingleSuite()
	it("should set the correct warmth and coverage values when equipping and unequipping iron armor", testEquipSingle_IronArmor())
	it("should set the correct warmth and coverage values when equipping and unequipping iron helmet", testEquipSingle_IronHelmet())
	it("should set the correct warmth and coverage values when equipping and unequipping iron gauntlets", testEquipSingle_IronGauntlets())
	it("should set the correct warmth and coverage values when equipping and unequipping iron boots", testEquipSingle_IronBoots())
	it("should set the correct warmth and coverage values when equipping and unequipping iron shield", testEquipSingle_IronShield())
endFunction

function ClothingSystemE2EMultipleSuite()

endFunction

function ClothingSystemE2EGearSwaps()

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

	PlayerRef.EquipItem(ArmorIronCuirass)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 75)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 35)

	PlayerRef.UnequipItem(ArmorIronCuirass)
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

	PlayerRef.EquipItem(ArmorIronHelmet)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 15)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 3)

	PlayerRef.UnequipItem(ArmorIronHelmet)
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

	PlayerRef.EquipItem(ArmorIronGauntlets)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 7)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 6)

	PlayerRef.UnequipItem(ArmorIronGauntlets)
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

	PlayerRef.EquipItem(ArmorIronBoots)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 7)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 6)

	PlayerRef.UnequipItem(ArmorIronBoots)
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

	PlayerRef.EquipItem(ArmorIronShield)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth + 0)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage + 20)

	PlayerRef.UnequipItem(ArmorIronShield)
	Utility.Wait(0.4)

	expectInt(GetPlayerWarmth(), to, beEqualTo, starting_warmth)
	expectInt(GetPlayerCoverage(), to, beEqualTo, starting_coverage)
endFunction
