scriptname _Frost_Test_e2e_ClothingScript extends Lilac

import FrostUtil

ReferenceAlias property PlayerAlias auto
_Frost_System_Warmth property warmth auto
_Frost_PlayerEquipMonitor EquipMon

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

function beforeAll()
	EquipMon = PlayerAlias as _Frost_PlayerEquipMonitor
	warmth = GetWarmthSystem()
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


; Test Cases ==================================================================


function testEquipSingle_IronArmor()
	EquipMon.OnObjectEquipped(ArmorIronCuirass, None)

endFunction

function testEquipSingle_IronHelmet()

endFunction

function testEquipSingle_IronGauntlets()

endFunction

function testEquipSingle_IronBoots()

endFunction

function testEquipSingle_IronShield()

endFunction
