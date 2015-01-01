Scriptname _DE_Compatibility extends ReferenceAlias

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_Compatibility
; Attached To (EditorID)..: 
; Description ............: Checks for presence of other mods for compatibility purposes, and sets flags as appropriate.
; Author .................: Chesko
; Last Approved (version) : 2.5
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

import debug

;#PROPERTIES=====================================================================================================================
actor property PlayerRef auto
;#Scripts======================================================================
_de_clothingmonitor_1_7 property FrostfallArmor auto		;Clothing Monitor Script
_DE_SkyUIConfigPanelScript property FFConfig Auto 			;SkyUI Configuration script

;#Official DLC=================================================================
bool property isDLC1Loaded auto	hidden						;Dawnguard
bool property isDLC2Loaded auto hidden						;Dragonborn
bool property isDLC2Loaded_2dot2 auto hidden				;Dragonborn (Frostfall 2.2 Update)
bool property isDLC2Loaded_2dot6 auto hidden				;Dragonborn (Frostfall 2.6 Update)
bool property isDLC3Loaded auto hidden						;????
bool property isDLC4Loaded auto hidden						;????
bool property isHFLoaded auto hidden						;Hearthfire

;#Landscape Mods===============================================================
bool property isMod1Loaded auto hidden
bool property isMod2Loaded auto hidden
bool property isMod3Loaded auto hidden
bool property isMod4Loaded auto hidden
bool property isMod5Loaded auto hidden
bool property isMod6Loaded auto hidden
bool property isMod7Loaded auto hidden
bool property isMod8Loaded auto hidden
bool property isMod9Loaded auto hidden
bool property isMod10Loaded auto hidden
bool property isMod11Loaded auto hidden
bool property isMod12Loaded auto hidden
bool property isMod13Loaded auto hidden
bool property isMod14Loaded auto hidden
bool property isMod15Loaded auto hidden
bool property isMod16Loaded auto hidden
bool property isMod17Loaded auto hidden
bool property isMod18Loaded auto hidden
bool property isMod19Loaded auto hidden
bool property isMod20Loaded auto hidden

;#Supported Mods===============================================================
bool property isSKSELoaded auto hidden						;SKSE
bool property isSKYUILoaded auto hidden						;SkyUI 3.4+
bool property isLSLoaded auto hidden						;Last Seed
bool property isBSRLoaded auto hidden						;(DEPRECATED) Belua Sangunaire Revisited
bool property isSCLoaded auto hidden						;ScenicCarriages
bool property isWICLoaded auto hidden						;Winter is Coming - Cloaks
bool property isCOSLoaded auto hidden						;Cloaks of Skyrim
bool property isCOSDGLoaded auto hidden						;Cloaks of Skyrim
bool property isNFHLoaded auto hidden						;Northborn Fur Hoods HD
bool property isIMALoaded auto hidden						;Immersive Armors
bool property isWACLoaded auto hidden						;Wet and Cold
bool property isSKYRELoaded auto hidden						;Skyrim Redone
bool property isCOTLoaded auto hidden						;Climates of Tamriel
bool property isKNAPLoaded auto hidden						;Knapsack Add-on
bool property isAEALoaded auto hidden						;Aesir Armor
bool property isIMCNLoaded auto hidden						;Imp's More Complex Needs
bool property isRNDLoaded auto hidden			 			;Realistic Needs and Diseases

;#Leveled Lists================================================================
LeveledItem property LItemSpellTomes00AllIllusion auto
LeveledItem property LItemSpellTomes00AllSpells auto
LeveledItem property LItemSpellTomes00Illusion auto
LeveledItem property LItemSpellTomes00Spells auto
LeveledItem property LItemSpellTomes25AllAlteration auto
LeveledItem property LItemSpellTomes25Alteration auto
LeveledItem property LItemSpellTomes25AllIllusion auto
LeveledItem property LItemSpellTomes25Illusion auto
LeveledItem property LItemSpellTomes25AllConjuration auto
LeveledItem property LItemSpellTomes25Conjuration auto
LeveledItem property LItemSpellTomes50AllAlteration auto
LeveledItem property LItemSpellTomes50Alteration auto
LeveledItem property LItemSpellTomes50Spells auto
LeveledItem property LitemSpellTomes50AllDestruction auto
LeveledItem property LitemSpellTomes50Destruction auto
LeveledItem property LItemSpellTomes50AllIllusion auto
LeveledItem property LItemSpellTomes50Illusion auto
LeveledItem property LItemSpellTOmes50AllRestoration auto
LeveledItem property LItemSpellTOmes50Restoration auto
LeveledItem property LItemSpellTomes50AllConjuration auto
LeveledItem property LItemSpellTomes50Conjuration auto
LeveledItem property LItemSpellTomes75Conjuration auto
LeveledItem property LItemSpellTomes75AllConjuration auto
LeveledItem property LItemSpellTomes75Alteration auto
LeveledItem property LItemSpellTomes75AllAlteration auto
LeveledItem property LItemSpellTomes75Spells auto
LeveledItem property LItemSpellTomes100Conjuration auto
LeveledItem property MGRitualConjurationBooks auto
LeveledItem property LItemScroll00Skill auto
LeveledItem property LItemScroll25Skill auto
LeveledItem property LItemScroll50Skill auto
LeveledItem property LItemScroll75Skill auto
LeveledItem property LItemScroll100Skill auto

;#Spellbooks===================================================================
book property _DE_SpellTomeSoothe1 auto
book property _DE_SpellTomeFoxskin auto
book property _DE_SpellTomeSoothe2 auto
book property _DE_SpellTomeBoundCloakLesser auto
book property _DE_SpellTomeWolfskin auto
book property _DE_SpellTomeVaporBlast auto
book property _DE_SpellTomeSoothe3 auto
book property _DE_SpellTomeKindle auto
book property _DE_SpellTomeBoundCloakGreater auto
book property _DE_SpellTomeConjureShelterLesser auto
book property _DE_SpellTomeTransmuteWood auto
book property _DE_SpellTomeBearskin auto
book property _DE_SpellTomeConjureShelterGreater auto

;#Scrolls======================================================================
scroll property _DE_ScrollSoothe auto
scroll property _DE_ScrollBask auto
scroll property _DE_ScrollFoxskin auto
scroll property _DE_ScrollBoundCloakLesser auto
scroll property _DE_ScrollRevel auto
scroll property _DE_ScrollWolfskin auto
scroll property _DE_ScrollVaporBlast auto
scroll property _DE_ScrollKindle auto
scroll property _DE_ScrollBoundCloakGreater auto
scroll property _DE_ScrollBearskin auto
scroll property _DE_ScrollConjureShelterLesser auto
scroll property _DE_ScrollConjureShelterGreater auto

;#Merchant Containers==========================================================
ObjectReference property MerchantRiverwoodTraderContainer auto

;#FormLists====================================================================
formlist property _DE_Foods5 auto							;Foods (soups, stews)
formlist property _DE_Foods10 auto							;Foods (soups, stews)
formlist property _DE_Foods15 auto							;Foods (soups, stews)
formlist property _DE_Drinks10 auto							;Drinks (alcohol)
formlist property _DE_Drinks15 auto							;Drinks (alcohol)
formlist property _DE_Drinks20 auto							;Drinks (alcohol)
formlist property _DE_Trees auto							;List of valid trees for Wood Harvesting
formlist property _DE_EquipExceptions auto					;List of equipment exempt from the FrostfallArmor system
formlist property _DE_WorldspacesInteriors auto				;Interior exception worldspace
formlist property _DE_WorldspacesExteriorPineForest auto	;Exception worldspace: Pine Forest biome
formlist property _DE_WorldspacesExteriorVolcanicTundra auto ;Exception worldspace: Volcanic Tundra biome
formlist property _DE_WorldspacesExteriorFallForest auto	;Exception worldspace: Fall Forest biome
formlist property _DE_WorldspacesExteriorWhiterun auto		;Exception worldspace: Tundra biome
formlist property _DE_WorldspacesExteriorTundraMarsh auto	;Exception worldspace: Tundra Marsh biome
formlist property _DE_WorldspacesExteriorCoast auto			;Exception worldspace: Coast biome
formlist property _DE_WorldspacesExteriorSnowy auto			;Exception worldspace: Snowy biome
formlist property _DE_WorldspacesExteriorOblivion auto		;Exception worldspace: Oblivion biome
formlist property _DE_ExposureExceptions auto				;Things to suspend exposure when around (Scenic Carriages etc)
formlist property _DE_FastTravelExceptions auto				;Things to detect Fast Travel against (Carriages etc)
formlist property _DE_SevereWeatherList auto				;List of all "severe" weather types
formlist property _DE_OvercastWeatherList auto				;List of all "overcast" weather types
formlist property _DE_ModWaterSkins auto 					;List of waterskins from other mods
formlist property _DE_LightableCampfires auto 				;List of small unlit campfires
formlist property _DE_LightableCampfiresAll auto 			;List of all unlit campfires
formlist property _DE_DeadwoodList auto

;#FormLists - Future Expansion=================================================

formlist property _DE_zExpansionList01 auto					;Unused
formlist property _DE_zExpansionList02 auto					;Unused
formlist property _DE_zExpansionList03 auto					;Unused
formlist property _DE_zExpansionList04 auto					;Unused
formlist property _DE_zExpansionList05 auto					;Unused
formlist property _DE_zExpansionList06 auto					;Unused
formlist property _DE_zExpansionList07 auto					;Unused
formlist property _DE_zExpansionList08 auto					;Unused
formlist property _DE_zExpansionList09 auto					;Unused
formlist property _DE_zExpansionList10 auto					;Unused
formlist property _DE_zExpansionList11 auto					;Unused
formlist property _DE_zExpansionList12 auto					;Unused
formlist property _DE_zExpansionList13 auto					;Unused
formlist property _DE_zExpansionList14 auto					;Unused
formlist property _DE_zExpansionList15 auto					;Unused
formlist property _DE_zExpansionList16 auto					;Unused
formlist property _DE_zExpansionList17 auto					;Unused
formlist property _DE_zExpansionList18 auto					;Unused
formlist property _DE_zExpansionList19 auto					;Unused
formlist property _DE_zExpansionList20 Auto					;Unused
formlist property _DE_zExpansionList21 auto 				;Unused
formlist property _DE_zExpansionList22 auto 				;Unused
formlist property _DE_zExpansionList23 auto					;Unused
formlist property _DE_zExpansionList24 auto					;Unused
formlist property _DE_zExpansionList25 auto					;Unused
formlist property _DE_zExpansionList26 auto					;Unused
formlist property _DE_zExpansionList27 auto					;Unused
formlist property _DE_zExpansionList28 auto					;Unused
formlist property _DE_zExpansionList29 auto					;Unused
formlist property _DE_zExpansionList30 auto					;Unused

;#DLC / Mod Worldspaces============================================================
Worldspace property DLC1WS auto hidden						;Falmer Valley
Worldspace property DLC2WS auto hidden						;Solstheim
Worldspace property DLC3WS auto hidden
Worldspace property DLC4WS auto hidden
Worldspace property Mod1WS auto hidden						;WyrmstoothWorld
Worldspace property Mod2WS auto hidden
Worldspace property Mod3WS auto hidden
Worldspace property Mod4WS auto hidden
Worldspace property Mod5WS auto hidden
Worldspace property Mod6WS auto hidden
Worldspace property Mod7WS auto hidden
Worldspace property Mod8WS auto hidden
Worldspace property Mod9WS auto hidden
Worldspace property Mod10WS auto hidden
Worldspace property Mod11WS auto hidden
Worldspace property Mod12WS auto hidden
Worldspace property Mod13WS auto hidden
Worldspace property Mod14WS auto hidden
Worldspace property Mod15WS auto hidden
Worldspace property Mod16WS auto hidden
Worldspace property Mod17WS auto hidden
Worldspace property Mod18WS auto hidden
Worldspace property Mod19WS auto hidden
Worldspace property Mod20WS auto hidden

;#DLC / Mod Area Arrays============================================================
float[] DLC1_FVCanyon_PolyX
float[] DLC1_FVCanyon_PolyY
float[] DLC1_FVIce_PolyX
float[] DLC1_FVIce_PolyY
float[] DLC1_FVPlayground_PolyX
float[] DLC1_FVPlayground_PolyY
float[] DLC1_FVGrove_PolyX
float[] DLC1_FVGrove_PolyY
float[] DLC1_FVBoss_PolyX
float[] DLC1_FVBoss_PolyY

float[] DLC2_Solstheim_PolyX
float[] DLC2_Solstheim_PolyY

float[] MOD1_Center_PolyX
float[] MOD1_Center_PolyY
float[] MOD1_West_PolyX
float[] MOD1_West_PolyY

;#SkyRe Perks======================================================================

Perk property Traveller_Rank1 auto hidden
Perk property Traveller_Rank2 auto hidden
Perk property Traveller_Rank3 auto hidden
Perk property Traveller_Rank4 auto hidden
Perk property Traveller_Rank5 auto hidden
Perk property Forestry_Rank1 auto hidden
Perk property Forestry_Rank2 auto hidden
Perk property Forestry_Rank3 auto hidden
Perk property GlacialSwimmer auto hidden
Perk property Windbreaker auto hidden
Perk property WellInsulated auto hidden
Perk property Rationing_Rank1 auto hidden
Perk property Rationing_Rank2 auto hidden
Perk property Rationing_Rank3 auto hidden

;#Knapsack Enhanced Travel Axe=====================================================

weapon property _DE_TravelAxe01_0 auto hidden
weapon property _DE_TravelAxe01_1 auto hidden
weapon property _DE_TravelAxe01_2 auto hidden
weapon property _DE_TravelAxe01_3 auto hidden
weapon property _DE_TravelAxe01_4 auto hidden
weapon property _DE_TravelAxe01_5 auto hidden
weapon property _DE_TravelAxe01_6 auto hidden
weapon property _DE_TravelAxe01_7 auto hidden
weapon property _DE_TravelAxe01_8 auto hidden
weapon property _DE_TravelAxe01_9 auto hidden
weapon property _DE_TravelAxe01_10 auto hidden
weapon property _DE_TravelAxe01_11 auto hidden
weapon property _DE_TravelAxe01_12 auto hidden
weapon property _DE_TravelAxe01_13 auto hidden
weapon property _DE_TravelAxe01_14 auto hidden
weapon property _DE_TravelAxe auto hidden
MiscObject property _DE_TravelAxeBroken auto hidden

;#Misc=============================================================================
message property _DE_CompatibilityFinished auto
Perk property _DE_DummyPerk auto
GlobalVariable property _DE_SKSEVersion auto
GlobalVariable property _DE_DLC1Loaded auto
GlobalVariable property _DE_HFLoaded auto
GlobalVariable property _DE_SKYRELoaded auto
GlobalVariable property _DE_Setting_DialogueStop auto
GlobalVariable property _DE_Setting_SystemMsg auto
Armor property _DE_Cloak_BasicBurlap auto
Armor property _DE_Cloak_BasicHide auto
Armor property _DE_Cloak_BasicFur auto
Armor property _DE_Cloak_BasicLinen auto
Armor property ArmorNightingaleCuirassPlayer01 auto
Armor property ArmorNightingaleCuirassPlayer02 auto
Armor property ArmorNightingaleCuirassPlayer03 auto
ConstructibleObject property _DE_RecipeSuppliesRockHF auto
ConstructibleObject property _DE_RecipeLeatherValeDeerHideDLC1 auto
ConstructibleObject property _DE_RecipeLeatherValeSabreCatHideDLC1 auto
ConstructibleObject property _DE_RecipeTanningLeatherValeDeerHideDLC1 auto
ConstructibleObject property _DE_RecipeTanningLeatherValeSabreCatHideDLC1 auto
Keyword property BANKW1 auto hidden
Keyword property BANKW2 auto hidden
Keyword property BANKW3 auto hidden
Keyword property BANKW4 auto hidden
Keyword property ClothingPouch auto hidden
Keyword property ClothingPouchDG auto hidden
spell property _DE_Weathersense_Spell auto
spell property _DE_SurvivalSkillsCombo_Spell auto
spell property _DE_WellInsulatedConditionSpell auto
spell property _DE_Configuration_Spell auto
spell property _DE_SurvivalSkills_Spell auto
spell property _DE_WEARExamineArmor_Spell auto
spell property _DE_ConditioningState_Spell auto
spell property _DE_ConditioningState_Spell_SkyRe auto
formlist property woodChoppingAxes auto
formlist property _DE_Axes auto
formlist property _DE_HeatSources auto
formlist property _DE_SmallFires auto
Weather property DLC2AshStorm auto hidden
bool bAddedSpellBooks = false

Event OnPlayerLoadGame()
	RunStartupCheck()
	RegisterForKeysOnLoad()
endEvent

function RunStartupCheck()
	
	FrostfallArmor.InitializeArrays()
	
	;Make sure my cloaks are in the array
	VanillaGameLoadUp()
	
	;if !MyRespawnBook1																		;Hunter near Riverwood
	;	MyRespawnBook1 = PlacementReference.PlaceAtMe(_DE_BookActivatorRespawn)
	;	MyRespawnBook1.SetPosition(-624.76, -61079.68, 627.3)
	;endif
	;if !MyRespawnBook2																		;Crabber's Shanty
	;	MyRespawnBook2 = PlacementReference.PlaceAtMe(_DE_BookActivatorRespawn)
	;	MyRespawnBook2.SetPosition(-71416.06, 44402.04, -12153.73)
	;endif
	
	;debug.notification("[Frostfall]Compatibility startup check...")
	trace("============================================[Frostfall: Warning Start]============================================")
	trace("                                                                                                                  ")
	trace("               Frostfall is now performing compatibility checks. Papyrus warnings about missing or                ")
	trace("                        unloaded files may follow. This is NORMAL and can be ignored.   		                     ")
	trace("                                                                                                                  ")
	trace("============================================[Frostfall: Warning Start]============================================")
	
	if isSKSELoaded
		isSKSELoaded = SKSE.GetVersion()
		if !isSKSELoaded
			;SKSE was removed since the last save.
			_DE_Setting_DialogueStop.SetValue(1)							;Turn off SKSE-only features
			_DE_SKSEVersion.SetValue(0.0)
		else
			_DE_SKSEVersion.SetValue(SKSE.GetVersion() + SKSE.GetVersionMinor() * 0.01 + SKSE.GetVersionBeta() * 0.0001)
		endif
	else
		isSKSELoaded = SKSE.GetVersion()
		if isSKSELoaded
			;SKSE was just added.
			_DE_SKSEVersion.SetValue(SKSE.GetVersion() + SKSE.GetVersionMinor() * 0.01 + SKSE.GetVersionBeta() * 0.0001)
		else
			_DE_Setting_DialogueStop.SetValue(1)							;Turn off SKSE-only features
			_DE_SKSEVersion.SetValue(0.0)
		endif
	endif
	
	if isSKYUILoaded
		isSKYUILoaded = Game.GetFormFromFile(0x01000814, "SkyUI.esp")
		if !isSKYUILoaded
			;SkyUI was removed since the last save.
		endif
	else
		isSKYUILoaded = Game.GetFormFromFile(0x01000814, "SkyUI.esp")
		if isSKYUILoaded
			;SkyUI was just loaded.
		endif
	endif

	if isDLC1Loaded
		isDLC1Loaded = Game.GetFormFromFile(0x02009403, "Dawnguard.esm")
		if !isDLC1Loaded
			;DLC1 was removed since the last save.
			_DE_DLC1Loaded.SetValue(1.0)
		else
			_DE_DLC1Loaded.SetValue(2.0)
		endif
	else
		isDLC1Loaded = Game.GetFormFromFile(0x02009403, "Dawnguard.esm")
		if isDLC1Loaded
			;DLC1 was just added.
			_DE_DLC1Loaded.SetValue(2.0)
		else
			_DE_DLC1Loaded.SetValue(1.0)
		endif
	endif
	
	if isDLC2Loaded
		isDLC2Loaded = Game.GetFormFromFile(0x0201FB99, "Dragonborn.esm")
		if !isDLC2Loaded
			;DLC2 was removed since the last save.
			bool bRemove1 = FrostfallArmor.ArrayRemoveBlankFormsXT("body full")
			bool bRemove2 = FrostfallArmor.ArrayRemoveBlankFormsXT("feet full")
			bool bRemove3 = FrostfallArmor.ArrayRemoveBlankFormsXT("hands full")
			bool bRemove4 = FrostfallArmor.ArrayRemoveBlankFormsXT("head full")
			if bRemove1 && bRemove2 && bRemove3 && bRemove4
				trace("[Frostfall] Dragonborn has been unloaded. Cleared added forms from all associated arrays.")
			endif
		endif
	else
		isDLC2Loaded = Game.GetFormFromFile(0x0201FB99, "Dragonborn.esm")
		if isDLC2Loaded
			;DLC2 was just added.
			DLC2LoadUp()
		endif
	endif
	
	if !isDLC2Loaded_2dot2
		;====RUN ONCE====
		isDLC2Loaded_2dot2 = Game.GetFormFromFile(0x0201FB99, "Dragonborn.esm")
		if isDLC2Loaded_2dot2
			;DLC2 and/or Frostfall 2.2 was just loaded.
			DLC2LoadUp()
		else
			isDLC2Loaded_2dot2 = true
		endif
	endif

	if !isDLC2Loaded_2dot6
		;====RUN ONCE====
		isDLC2Loaded_2dot6 = Game.GetFormFromFile(0x0201FB99, "Dragonborn.esm")
		if isDLC2Loaded_2dot6
			;DLC2 and/or Frostfall 2.6 was just loaded.
			DLC2LoadUp()
		else
			isDLC2Loaded_2dot6 = true
		endif
	endif
	
	if isMod1Loaded
		isMod1Loaded = Game.GetFormFromFile(0x01000D62, "Wyrmstooth.esp")
		if !isMod1Loaded
			;Mod1 was removed since the last save.
		endif
	else
		isMod1Loaded = Game.GetFormFromFile(0x01000D62, "Wyrmstooth.esp")
		if isMod1Loaded
			;Mod1 was just added.
		endif
	endif
	
	if isHFLoaded
		isHFLoaded = Game.GetFormFromFile(0x0200306C, "HearthFires.esm")
		if !isHFLoaded
			;Hearthfire was removed since the last save.
			_DE_HFLoaded.SetValue(1.0)
		else
			_DE_HFLoaded.SetValue(2.0)
		endif
	else
		isHFLoaded = Game.GetFormFromFile(0x0200306C, "HearthFires.esm")
		if isHFLoaded
			;Hearthfire was just added.
			_DE_HFLoaded.SetValue(2.0)
		else
			_DE_HFLoaded.SetValue(1.0)
		endif
	endif
	
	if isSKYRELoaded
		isSKYRELoaded = Game.GetFormFromFile(0x02002F9A, "SkyRe_Survivalism.esp")
		if !isSKYRELoaded
			;SkyRe was removed since the last save.
			_DE_SKYRELoaded.SetValue(1.0)
		else
			_DE_SKYRELoaded.SetValue(2.0)
		endif
	else
		isSKYRELoaded = Game.GetFormFromFile(0x02002F9A, "SkyRe_Survivalism.esp")
		if isSKYRELoaded
			;SkyRe was just added.
			_DE_SKYRELoaded.SetValue(2.0)
		else
			_DE_SKYRELoaded.SetValue(1.0)
		endif
	endif
	
	if isCOTLoaded
		isCOTLoaded = Game.GetFormFromFile(0x01068A1A, "ClimatesOfTamriel.esm")
		if !isCOTLoaded
			;Climates of Tamriel was removed since the last save.
		endif
	else
		isCOTLoaded = Game.GetFormFromFile(0x01068A1A, "ClimatesOfTamriel.esm")
		if isCOTLoaded
			;Climates of Tamriel was just added.
			if !(_DE_SevereWeatherList.HasForm(Game.GetFormFromFile(0x01068A1A, "ClimatesOfTamriel.esm")))
				_DE_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01068A1A, "ClimatesOfTamriel.esm"))			;CoTSnowBlizzard_Swirl
				_DE_SevereWeatherList.AddForm(Game.GetFormFromFile(0x0106C559, "ClimatesOfTamriel.esm"))			;CoTSnowBlizzard_Down_NoFog
				_DE_SevereWeatherList.AddForm(Game.GetFormFromFile(0x0104483A, "ClimatesOfTamriel.esm"))			;CoTOvercast_6_HR
				_DE_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01044838, "ClimatesOfTamriel.esm"))			;CoTOvercast_5_HR
				_DE_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01044836, "ClimatesOfTamriel.esm"))			;CoTOvercast_4_HR_T
				_DE_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01044832, "ClimatesOfTamriel.esm"))			;CoTOvercast_2_HR
				_DE_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01044831, "ClimatesOfTamriel.esm"))			;CoTOvercast_1_HR_T
			endif	
			if !(_DE_OvercastWeatherList.HasForm(Game.GetFormFromFile(0x0104482F, "ClimatesOfTamriel.esm")))
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482F, "ClimatesOfTamriel.esm"))			;CoTOvercast_6_T
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482E, "ClimatesOfTamriel.esm"))			;CoTOvercast_5_T
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482D, "ClimatesOfTamriel.esm"))			;CoTOvercast_3_T
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482C, "ClimatesOfTamriel.esm"))			;CoTOvercast_4_T
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482B, "ClimatesOfTamriel.esm"))			;CoTOvercast_2_T
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482A, "ClimatesOfTamriel.esm"))			;CoTOvercast_1_T
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044829, "ClimatesOfTamriel.esm"))			;CoTOvercast_6_AM
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044827, "ClimatesOfTamriel.esm"))			;CoTOvercast_5_AP
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044826, "ClimatesOfTamriel.esm"))			;CoTOvercast_4
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044825, "ClimatesOfTamriel.esm"))			;CoTOvercast_3
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044824, "ClimatesOfTamriel.esm"))			;CoTOvercast_2
				_DE_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x010437F9, "ClimatesOfTamriel.esm"))			;CoTOvercast_1
			endif
		endif
	endif
	
	if isIMCNLoaded
		isIMCNLoaded = Game.GetFormFromFile(0x0005CF47, "Imp's More Complex Needs.esp")
		if !isIMCNLoaded
			;Imp's More Complex Needs was removed since the last save.
		endif
	else
		isIMCNLoaded = Game.GetFormFromFile(0x0005CF47, "Imp's More Complex Needs.esp")
		if isIMCNLoaded
			;Imp's More Complex Needs was just added.
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x0005CF47, "Imp's More Complex Needs.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x0005CF4B, "Imp's More Complex Needs.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x0005CF4D, "Imp's More Complex Needs.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x0005CF49, "Imp's More Complex Needs.esp"))
		endif
	endif

	if isRNDLoaded
		isRNDLoaded = Game.GetFormFromFile(0x00047F94, "RealisticNeedsandDiseases.esp")
		if !isRNDLoaded
			;Realistic Needs and Diseases was removed since the last save.
		endif
	else
		isRNDLoaded = Game.GetFormFromFile(0x00047F94, "RealisticNeedsandDiseases.esp")
		if isRNDLoaded
			;Realistic Needs and Diseases was just added.
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047F94, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047F96, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047F9A, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047F98, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x000449AB, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047F88, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047F89, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047F8B, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00069FBE, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047FA2, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047FA4, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047FA5, "RealisticNeedsandDiseases.esp"))
			_DE_ModWaterSkins.AddForm(Game.GetFormFromFile(0x00047FA7, "RealisticNeedsandDiseases.esp"))

		endif
	endif

	;/if isLSLoaded
		isLSLoaded = Game.GetFormFromFile(0x02000D63, "Chesko_LastSeed.esp")
		if !isLSLoaded
			;Last Seed was removed since the last save.
		endif
	else
		isLSLoaded = Game.GetFormFromFile(0x02000D63, "Chesko_LastSeed.esp")
		if isLSLoaded
			;Last Seed was just added.
		endif
	endif/;
	
	if isWACLoaded
		isWACLoaded = Game.GetFormFromFile(0x02002314, "WetandCold.esp")
		if !isWACLoaded
			;Wet and Cold was removed since the last save.
			bool bRemove1 = FrostfallArmor.ArrayRemoveBlankFormsXT("head full")
			bool bRemove2 = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak fur")
			if bRemove1 && bRemove2
				trace("[Frostfall] Wet and Cold has been unloaded. Cleared added forms from all associated arrays.")
			endif
		else
			WACLoadUpCloaks()
		endif
	else
		isWACLoaded = Game.GetFormFromFile(0x02002314, "WetandCold.esp")
		if isWACLoaded
			;Wet and Cold was just added.
			WACLoadUp()
			WACLoadUpCloaks()
		endif
	endif
	
	if isSCLoaded
		isSCLoaded = Game.GetFormFromFile(0x010215C5, "ScenicCarriages.esp")
		if !isSCLoaded
			;Scenic Carriages was removed since the last save.
		endif
	else
		isSCLoaded = Game.GetFormFromFile(0x010215C5, "ScenicCarriages.esp")
		if isSCLoaded
			Form myCarriage = Game.GetFormFromFile(0x010215C5, "ScenicCarriages.esp")
			if !(_DE_ExposureExceptions.HasForm(myCarriage))
				_DE_ExposureExceptions.AddForm(myCarriage)
			endif
			if !(_DE_FastTravelExceptions.HasForm(myCarriage))
				_DE_FastTravelExceptions.AddForm(myCarriage)
			endif
		endif
	endif
	
	if isNFHLoaded	
		isNFHLoaded = Game.GetFormFromFile(0x010048DF, "Northborn Fur Hoods.esp")
		if !isNFHLoaded
			;Northborn Fur Hoods was removed since the last save.
			bool bRemove = FrostfallArmor.ArrayRemoveBlankFormsXT("head full")
			if bRemove
				trace("[Frostfall] Northborn Fur Hoods has been unloaded. Cleared added forms from all associated arrays.")
			endif
		endif
	else
		isNFHLoaded = Game.GetFormFromFile(0x010048DF, "Northborn Fur Hoods.esp")
		if isNFHLoaded
			;Northborn Fur Hoods was just added.
			NFHLoadUp()
		endif
	endif
	
	if isWICLoaded
		isWICLoaded = GetWICPluginLoaded()
		if !isWICLoaded
			;Winter is Coming - Cloaks was removed since the last save.
			;notification("Dumping WIC forms")
			bool bRemove1 = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak fur")
			bool bRemove2 = FrostfallArmor.ArrayRemoveBlankFormsXT("head full")
			if bRemove1 && bRemove2
				trace("[Frostfall] Winter is Coming has been unloaded. Cleared added forms from all associated arrays.")
			endif
		else
			WICLoadUpCloaks()
		endif
	else
		isWICLoaded = GetWICPluginLoaded()
		if isWICLoaded
			;Winter is Coming - Cloaks was just added.
			WICLoadUp()
			WICLoadUpCloaks()
		endif
	endif
	
	if isCOSLoaded
		isCOSLoaded = GetCOSPluginLoaded()
		if !isCOSLoaded
			;Cloaks of Skyrim was removed since the last save.
			;notification("Dumping COS forms")
			bool bRemove1 = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak burlap")
			bool bRemove2 = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak linen")
			bool bRemove3 = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak hide")
			if bRemove1 && bRemove2 && bRemove3
				trace("[Frostfall] Cloaks of Skyrim has been unloaded. Cleared added forms from all associated arrays.")
			endif
		else
			COSLoadUp()
		endif
	else
		isCOSLoaded = GetCOSPluginLoaded()
		if isCOSLoaded
			;Cloaks of Skyrim was just added.
			COSLoadUp()
		endif
	endif
	
	if isCOSDGLoaded
		isCOSDGLoaded = GetCOSDGPluginLoaded()
		if !isCOSDGLoaded
			;Cloaks of Skyrim - Dawnguard was removed since the last save.
			;notification("Dumping COS forms")
			bool bRemove = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak linen")
			if bRemove
				trace("[Frostfall] Cloaks of Skyrim - Dawnguard has been unloaded. Cleared added forms from all associated arrays.")
			endif
		else
			COSDGLoadUp()
		endif
	else
		isCOSDGLoaded = GetCOSDGPluginLoaded()
		if isCOSDGLoaded
			;Cloaks of Skyrim - Dawnguard was just added.
			COSDGLoadUp()
		endif
	endif

	if isAEALoaded
		isAEALoaded = Game.GetFormFromFile(0x02017424, "AesirArmor.esp")
		if !isAEALoaded
			;Aesir Armor was removed since the last save.
			;notification("Dumping AEA forms")
			bool bRemove1 = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak fur")
			bool bRemove2 = FrostfallArmor.ArrayRemoveBlankFormsXT("body full")
			bool bRemove3 = FrostfallArmor.ArrayRemoveBlankFormsXT("feet full")
			bool bRemove4 = FrostfallArmor.ArrayRemoveBlankFormsXT("hands full")
			bool bRemove5 = FrostfallArmor.ArrayRemoveBlankFormsXT("head full")
			
			if bRemove1 && bRemove2 && bRemove3 && bRemove4 && bRemove5
				trace("[Frostfall] Aesir Armor has been unloaded. Cleared added forms from all associated arrays.")
			endif
		endif
	else
		isAEALoaded = Game.GetFormFromFile(0x02017424, "AesirArmor.esp")
		if isAEALoaded
			;Aesir Armor was just added.
			AEALoadUp()
		endif
	endif

	if isIMALoaded
		isIMALoaded = Game.GetFormFromFile(0x0200803E, "hothtrooper44_ArmorCompilation.esp")
		if !isIMALoaded
			;Immersive Armors was removed since the last save.
			;notification("Dumping IMA forms")
			bool bRemove1 = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak linen")
			bool bRemove2 = FrostfallArmor.ArrayRemoveBlankFormsXT("cloak fur")
			bool bRemove3 = FrostfallArmor.ArrayRemoveBlankFormsXT("body full")
			bool bRemove4 = FrostfallArmor.ArrayRemoveBlankFormsXT("body limited")
			bool bRemove5 = FrostfallArmor.ArrayRemoveBlankFormsXT("feet full")
			bool bRemove6 = FrostfallArmor.ArrayRemoveBlankFormsXT("feet limited")
			bool bRemove7 = FrostfallArmor.ArrayRemoveBlankFormsXT("hands full")
			bool bRemove8 = FrostfallArmor.ArrayRemoveBlankFormsXT("hands limited")
			bool bRemove9 = FrostfallArmor.ArrayRemoveBlankFormsXT("head full")
			bool bRemove10 = FrostfallArmor.ArrayRemoveBlankFormsXT("head limited")
			if bRemove1 && bRemove2 && bRemove3 && bRemove4 && bRemove5 && bRemove6 && bRemove7 && bRemove8 && bRemove9 && bRemove10
				trace("[Frostfall] Immersive Armors has been unloaded. Cleared added forms from all associated arrays.")
			endif
		endif
	else
		isIMALoaded = Game.GetFormFromFile(0x0200803E, "hothtrooper44_ArmorCompilation.esp")
		if isIMALoaded
			;Immersive Armors was just added.
			IMALoadUp()
		endif
	endif
	
	if isKNAPLoaded
		isKNAPLoaded = Game.GetFormFromFile(0x03000D78, "KnapsackEnhanced.esp")
		if !isKNAPLoaded
			;Knapsack Enhanced was removed since the last save.
			KNAPUnload()
		else
			KNAPLoadUp()
		endif
	else
		isKNAPLoaded = Game.GetFormFromFile(0x03000D78, "KnapsackEnhanced.esp")
		if isKNAPLoaded
			;Knapsack Enhanced was just added.
			KNAPLoadUp()
		else
			KNAPUnload()
		endif
	endif
	
	if isDLC1Loaded
		DLC1LoadUp()
		
		DLC1WS = Game.GetFormFromFile(0x02000BB5, "Dawnguard.esm") as Worldspace	;DLC01FalmerValley
		
		;Add trees to valid tree formlist for wood harvesting
		form DLC01TreeForm01 = Game.GetFormFromFile(0x02009670, "Dawnguard.esm")	;DLC1TreePineForestSnowHeavy01
		form DLC01TreeForm02 = Game.GetFormFromFile(0x0200B55F, "Dawnguard.esm")	;DLC1TreePineForestSnowHeavy02
		form DLC01TreeForm03 = Game.GetFormFromFile(0x02003AC5, "Dawnguard.esm")	;TreeWinterAspen01
		form DLC01TreeForm04 = Game.GetFormFromFile(0x02003AC9, "Dawnguard.esm")	;TreeWinterAspen02
		form DLC01TreeForm05 = Game.GetFormFromFile(0x02003ACA, "Dawnguard.esm")	;TreeWinterAspen03
		form DLC01TreeForm06 = Game.GetFormFromFile(0x02003ACB, "Dawnguard.esm")	;TreeWinterAspen04
		form DLC01TreeForm07 = Game.GetFormFromFile(0x02003ACC, "Dawnguard.esm")	;TreeWinterAspen05
		form DLC01TreeForm08 = Game.GetFormFromFile(0x02003ACF, "Dawnguard.esm")	;TreeWinterAspen06
		form DLC01TreeForm09 = Game.GetFormFromFile(0x02004332, "Dawnguard.esm")	;TreeSoulCairnTree01
		form DLC01TreeForm10 = Game.GetFormFromFile(0x02004333, "Dawnguard.esm")	;TreeSoulCairnTree02
		form DLC01TreeForm11 = Game.GetFormFromFile(0x02004334, "Dawnguard.esm")	;TreeSoulCairnTree03
		form DLC01TreeForm12 = Game.GetFormFromFile(0x0200DDB5, "Dawnguard.esm")	;TreeSoulCairnTreeGroup
		
		;Add worldspaces to appropriate formlists for region detection
		form DLC01WS01 = Game.GetFormFromFile(0x02001DB8, "Dawnguard.esm")			;DLC1HunterHQWorld					;FallForest
		form DLC01WS02 = Game.GetFormFromFile(0x02007202, "Dawnguard.esm")			;DLC1VampireCastleCourtyard			;Snowy
		form DLC01WS03 = Game.GetFormFromFile(0x02001408, "Dawnguard.esm")			;DLC01SoulCairn						;Oblivion
		form DLC01WS04 = Game.GetFormFromFile(0x0200528D, "Dawnguard.esm")			;DLC01Boneyard						;Oblivion
		form DLC01WS05 = Game.GetFormFromFile(0x020048C7, "Dawnguard.esm")			;DLC1AncestorsGladeWorld			;Interior
		form DLC01WS06 = Game.GetFormFromFile(0x02004BEA, "Dawnguard.esm")			;DLC1DarkfallPassageWorld			;Interior
		form DLC01WS07 = Game.GetFormFromFile(0x02002F64, "Dawnguard.esm")			;DLC1ForebearsHoldout				;Interior
			
		if !(_DE_Trees.HasForm(DLC01TreeForm01))		
			_DE_Trees.AddForm(DLC01TreeForm01)
			_DE_Trees.AddForm(DLC01TreeForm02)
			_DE_Trees.AddForm(DLC01TreeForm03)
			_DE_Trees.AddForm(DLC01TreeForm04)
			_DE_Trees.AddForm(DLC01TreeForm05)
			_DE_Trees.AddForm(DLC01TreeForm06)
			_DE_Trees.AddForm(DLC01TreeForm07)
			_DE_Trees.AddForm(DLC01TreeForm08)
			_DE_Trees.AddForm(DLC01TreeForm09)
			_DE_Trees.AddForm(DLC01TreeForm10)
			_DE_Trees.AddForm(DLC01TreeForm11)
			_DE_Trees.AddForm(DLC01TreeForm12)
		endif
		
		if !(_DE_WorldspacesExteriorFallForest.HasForm(DLC01WS01))
			_DE_WorldspacesExteriorFallForest.AddForm(DLC01WS01)
		endif
		
		if !(_DE_WorldspacesExteriorSnowy.HasForm(DLC01WS02))
			_DE_WorldspacesExteriorSnowy.AddForm(DLC01WS02)
		endif
		
		if !(_DE_WorldspacesExteriorOblivion.HasForm(DLC01WS03))
			_DE_WorldspacesExteriorOblivion.AddForm(DLC01WS03)
			_DE_WorldspacesExteriorOblivion.AddForm(DLC01WS04)
		endif
		
		if !(_DE_WorldspacesInteriors.HasForm(DLC01WS05))
			_DE_WorldspacesInteriors.AddForm(DLC01WS05)
			_DE_WorldspacesInteriors.AddForm(DLC01WS06)
			_DE_WorldspacesInteriors.AddForm(DLC01WS07)
		endif
			
	endif

	if isDLC2Loaded
		
		;Area support
		if !DLC2_Solstheim_PolyX
			DLC2_Solstheim_PolyX = new float[5]
		endif
		if !DLC2_Solstheim_PolyY
			DLC2_Solstheim_PolyY = new float[5]
		endif
		if !DLC2_Solstheim_PolyX[0]
			DLC2_Solstheim_PolyX[0] = 126592
			DLC2_Solstheim_PolyX[1] = 46721
			DLC2_Solstheim_PolyX[2] = -45155
			DLC2_Solstheim_PolyX[3] = -45155
			DLC2_Solstheim_PolyX[4] = 126592
		endif
		if !DLC2_Solstheim_PolyY[0]
			DLC2_Solstheim_PolyY[0] = 54030
			DLC2_Solstheim_PolyY[1] = 58728
			DLC2_Solstheim_PolyY[2] = 57684
			DLC2_Solstheim_PolyY[3] = 200000
			DLC2_Solstheim_PolyY[4] = 200000
		endif
		
		
		;Food
		form DLC02FoodForm01 = Game.GetFormFromFile(0x0203CD5B, "Dragonborn.esm")		;Horker and Ash Yam Stew
		if !(_DE_Foods15.HasForm(DLC02FoodForm01))
			_DE_Foods15.AddForm(DLC02FoodForm01)
		endif
		
		;Drinks
		form DLC02DrinkForm01 = Game.GetFormFromFile(0x0203572F, "Dragonborn.esm")		;Ashfire Mead
		form DLC02DrinkForm02 = Game.GetFormFromFile(0x020320DF, "Dragonborn.esm")		;Emberbrand Wine
		form DLC02DrinkForm03 = Game.GetFormFromFile(0x020207E5, "Dragonborn.esm")		;Flin
		form DLC02DrinkForm04 = Game.GetFormFromFile(0x020248CE, "Dragonborn.esm")		;Matze
		form DLC02DrinkForm05 = Game.GetFormFromFile(0x02024E0B, "Dragonborn.esm")		;Sadri's Sujamma
		form DLC02DrinkForm06 = Game.GetFormFromFile(0x020248CC, "Dragonborn.esm")		;Shein
		form DLC02DrinkForm07 = Game.GetFormFromFile(0x020207E6, "Dragonborn.esm")		;Sujamma
		if !(_DE_Drinks20.HasForm(DLC02DrinkForm01))
			_DE_Drinks20.AddForm(DLC02DrinkForm01)
			_DE_Drinks20.AddForm(DLC02DrinkForm02)
			_DE_Drinks15.AddForm(DLC02DrinkForm03)
			_DE_Drinks15.AddForm(DLC02DrinkForm04)
			_DE_Drinks20.AddForm(DLC02DrinkForm05)
			_DE_Drinks15.AddForm(DLC02DrinkForm06)
			_DE_Drinks15.AddForm(DLC02DrinkForm07)
		endif
		
		;Heat sources
		form DLC02HeatForm01 = Game.GetFormFromFile(0x02018616, "Dragonborn.esm")		;Campfire01LandBurning_SnowRocks
		form DLC02HeatForm02 = Game.GetFormFromFile(0x02018619, "Dragonborn.esm")		;Campfire01LandBurning_LDirtSnowPath
		form DLC02HeatForm03 = Game.GetFormFromFile(0x0201A56A, "Dragonborn.esm")		;DLC2FXFlamingRockDebris
		form DLC02HeatForm04 = Game.GetFormFromFile(0x0201A56B, "Dragonborn.esm")		;DLC2FXFlamingRockDebrisSmall
		form DLC02HeatForm05 = Game.GetFormFromFile(0x020289E8, "Dragonborn.esm")		;Campfire01LandBurning_Ash
		form DLC02HeatForm06 = Game.GetFormFromFile(0x0202C0B0, "Dragonborn.esm")		;Campfire01LandBurningDirtPath01
		form DLC02HeatForm07 = Game.GetFormFromFile(0x0203CF6E, "Dragonborn.esm")		;DLC2CraftingBlacksmithForge
		form DLC02HeatForm08 = Game.GetFormFromFile(0x0202B074, "Dragonborn.esm")		;DLC2CraftingBlacksmithSkaalForge
		if !(_DE_HeatSources.HasForm(DLC02HeatForm01))
			_DE_HeatSources.AddForm(DLC02HeatForm01)
			_DE_HeatSources.AddForm(DLC02HeatForm02)
			_DE_HeatSources.AddForm(DLC02HeatForm03)
			_DE_HeatSources.AddForm(DLC02HeatForm04)
			_DE_HeatSources.AddForm(DLC02HeatForm05)
			_DE_HeatSources.AddForm(DLC02HeatForm06)
			_DE_HeatSources.AddForm(DLC02HeatForm07)
			_DE_HeatSources.AddForm(DLC02HeatForm08)
		endif
		if !(_DE_SmallFires.HasForm(DLC02HeatForm01))
			_DE_SmallFires.AddForm(DLC02HeatForm01)
			_DE_SmallFires.AddForm(DLC02HeatForm02)
			_DE_SmallFires.AddForm(DLC02HeatForm03)
			_DE_SmallFires.AddForm(DLC02HeatForm04)
			_DE_SmallFires.AddForm(DLC02HeatForm05)
			_DE_SmallFires.AddForm(DLC02HeatForm06)
		endif
		
		;Add new unlit campfires
		form _DE_CampfireForm01 = Game.GetFormFromFile(0x0202C0B1, "Dragonborn.esm")	;Campfire01LandOffDirtPath01
		form _DE_CampfireForm02 = Game.GetFormFromFile(0x02028A8D, "Dragonborn.esm")	;Campfire01LandOffAsh
		form _DE_CampfireForm03 = Game.GetFormFromFile(0x02018D91, "Dragonborn.esm")	;Campfire01LandOffDirtSnowPath
		form _DE_CampfireForm04 = Game.GetFormFromFile(0x02018D90, "Dragonborn.esm")	;Campfire01LandOffLtSnow
		if !(_DE_LightableCampfires.HasForm(_DE_CampfireForm01))
			_DE_LightableCampfires.AddForm(_DE_CampfireForm01)
			_DE_LightableCampfires.AddForm(_DE_CampfireForm02)
			_DE_LightableCampfires.AddForm(_DE_CampfireForm03)
			_DE_LightableCampfires.AddForm(_DE_CampfireForm04)
		endif
		if !(_DE_LightableCampfiresAll.HasForm(_DE_CampfireForm01))
			_DE_LightableCampfiresAll.AddForm(_DE_CampfireForm01)
			_DE_LightableCampfiresAll.AddForm(_DE_CampfireForm02)
			_DE_LightableCampfiresAll.AddForm(_DE_CampfireForm03)
			_DE_LightableCampfiresAll.AddForm(_DE_CampfireForm04)
		endif
		;Trees
		form DLC02TreeForm01 = Game.GetFormFromFile(0x02017F76, "Dragonborn.esm")		;<DLC2TreePineForestAsh05>
		form DLC02TreeForm02 = Game.GetFormFromFile(0x02017F75, "Dragonborn.esm")		;<DLC2TreePineForestAsh04>
		form DLC02TreeForm03 = Game.GetFormFromFile(0x02017F74, "Dragonborn.esm")		;<DLC2TreePineForestAsh03>
		form DLC02TreeForm04 = Game.GetFormFromFile(0x02017F73, "Dragonborn.esm")		;<DLC2TreePineForestAsh02>
		form DLC02TreeForm05 = Game.GetFormFromFile(0x02017F72, "Dragonborn.esm")		;<DLC2TreePineForestAsh01>
		form DLC02TreeForm06 = Game.GetFormFromFile(0x02017F71, "Dragonborn.esm")		;<DLC2TreePineForestAshL05>
		form DLC02TreeForm07 = Game.GetFormFromFile(0x02017F70, "Dragonborn.esm")		;<DLC2TreePineForestAshL04>
		form DLC02TreeForm08 = Game.GetFormFromFile(0x02017F6F, "Dragonborn.esm")		;<DLC2TreePineForestAshL03>
		form DLC02TreeForm09 = Game.GetFormFromFile(0x02017F6E, "Dragonborn.esm")		;<DLC2TreePineForestAshL01>
		form DLC02TreeForm10 = Game.GetFormFromFile(0x02017F6D, "Dragonborn.esm")		;<DLC2TreePineForestAshL02>
		form DLC02TreeForm11 = Game.GetFormFromFile(0x02017F62, "Dragonborn.esm")		;<DLC2TreePineForestDeadAshL05>
		form DLC02TreeForm12 = Game.GetFormFromFile(0x02017F60, "Dragonborn.esm")		;<DLC2TreePineForestDeadAshL04>
		form DLC02TreeForm13 = Game.GetFormFromFile(0x02017F5C, "Dragonborn.esm")		;<DLC2TreePineForestDeadAshL03>
		form DLC02TreeForm14 = Game.GetFormFromFile(0x02017F5B, "Dragonborn.esm")		;<DLC2TreePineForestDeadAshL02>
		form DLC02TreeForm15 = Game.GetFormFromFile(0x02017F5A, "Dragonborn.esm")		;<DLC2TreePineForestDeadAshL01>
		form DLC02TreeForm16 = Game.GetFormFromFile(0x020195E8, "Dragonborn.esm")		;<DLC2TreePineForestBroken01>
		form DLC02TreeForm17 = Game.GetFormFromFile(0x020195F0, "Dragonborn.esm")		;<DLC2TreePineForestBroken01Ash>
		form DLC02TreeForm18 = Game.GetFormFromFile(0x020195EB, "Dragonborn.esm")		;<DLC2TreePineForestBroken02>
		form DLC02TreeForm19 = Game.GetFormFromFile(0x02017F77, "Dragonborn.esm")		;<DLC2TreePineForestBroken04>
		form DLC02TreeForm20 = Game.GetFormFromFile(0x020185E5, "Dragonborn.esm")		;<DLC2TreePineForestBroken05>
		form DLC02TreeForm21 = Game.GetFormFromFile(0x0201D500, "Dragonborn.esm")		;<DLC2TreePineForestBroken06>
		form DLC02TreeForm22 = Game.GetFormFromFile(0x0201D4F7, "Dragonborn.esm")		;<DLC2TreePineForestBrokenCluster01>
		form DLC02TreeForm23 = Game.GetFormFromFile(0x0201D73A, "Dragonborn.esm")		;<DLC2TreePineForestBrokenSmoking01>
		form DLC02TreeForm24 = Game.GetFormFromFile(0x020185EE, "Dragonborn.esm")		;<DLC2TreePineForestHollow01Ash>
		form DLC02TreeForm25 = Game.GetFormFromFile(0x02017F6A, "Dragonborn.esm")		;<DLC2TreePineForestHollow01AshL>
		form DLC02TreeForm26 = Game.GetFormFromFile(0x020185EF, "Dragonborn.esm")		;<DLC2TreePineForestLog01Ash>
		form DLC02TreeForm27 = Game.GetFormFromFile(0x02017F68, "Dragonborn.esm")		;<DLC2TreePineForestLog01AshL>
		form DLC02TreeForm28 = Game.GetFormFromFile(0x020185F0, "Dragonborn.esm")		;<DLC2TreePineForestLog02Ash>
		form DLC02TreeForm29 = Game.GetFormFromFile(0x02017F67, "Dragonborn.esm")		;<DLC2TreePineForestLog02AshL>
		form DLC02TreeForm30 = Game.GetFormFromFile(0x020185ED, "Dragonborn.esm")		;<DLC2TreePineForestStump01Ash>
		form DLC02TreeForm31 = Game.GetFormFromFile(0x02017F64, "Dragonborn.esm")		;<DLC2TreePineForestStump01AshL>
		
		if !(_DE_Trees.HasForm(DLC02TreeForm01))
			_DE_Trees.AddForm(DLC02TreeForm01)
			_DE_Trees.AddForm(DLC02TreeForm02)
			_DE_Trees.AddForm(DLC02TreeForm03)
			_DE_Trees.AddForm(DLC02TreeForm04)
			_DE_Trees.AddForm(DLC02TreeForm05)
			_DE_Trees.AddForm(DLC02TreeForm06)
			_DE_Trees.AddForm(DLC02TreeForm07)
			_DE_Trees.AddForm(DLC02TreeForm08)
			_DE_Trees.AddForm(DLC02TreeForm09)
			_DE_Trees.AddForm(DLC02TreeForm10)
			_DE_Trees.AddForm(DLC02TreeForm11)
			_DE_Trees.AddForm(DLC02TreeForm12)
			_DE_Trees.AddForm(DLC02TreeForm13)
			_DE_Trees.AddForm(DLC02TreeForm14)
			_DE_Trees.AddForm(DLC02TreeForm15)
			_DE_Trees.AddForm(DLC02TreeForm16)
			_DE_Trees.AddForm(DLC02TreeForm17)
			_DE_Trees.AddForm(DLC02TreeForm18)
			_DE_Trees.AddForm(DLC02TreeForm19)
			_DE_Trees.AddForm(DLC02TreeForm20)
			_DE_Trees.AddForm(DLC02TreeForm21)
			_DE_Trees.AddForm(DLC02TreeForm22)
			_DE_Trees.AddForm(DLC02TreeForm23)
		endif

		if !(_DE_DeadwoodList.HasForm(DLC02TreeForm24))
			_DE_DeadwoodList.AddForm(DLC02TreeForm24)
			_DE_DeadwoodList.AddForm(DLC02TreeForm25)
			_DE_DeadwoodList.AddForm(DLC02TreeForm26)
			_DE_DeadwoodList.AddForm(DLC02TreeForm27)
			_DE_DeadwoodList.AddForm(DLC02TreeForm28)
			_DE_DeadwoodList.AddForm(DLC02TreeForm29)
			_DE_DeadwoodList.AddForm(DLC02TreeForm30)
			_DE_DeadwoodList.AddForm(DLC02TreeForm31)
		endif
		
		;Weather
		DLC2AshStorm = Game.GetFormFromFile(0x02032336, "Dragonborn.esm") as Weather
		
		;Worldspaces
		
		form DLC02WS01 = Game.GetFormFromFile(0x0201C0B2, "Dragonborn.esm")			;Apocrypha
		form DLC02WS02 = Game.GetFormFromFile(0x02000800, "Dragonborn.esm")			;Solstheim
		if !(_DE_WorldspacesExteriorOblivion.HasForm(DLC02WS01))
			_DE_WorldspacesExteriorOblivion.AddForm(DLC02WS01)
		endif
		if !DLC2WS
			DLC2WS = DLC02WS02 as Worldspace
		endif
		
	endif
	
	if isDLC3Loaded
		;???? support
	endif
	
	if isDLC4Loaded
		;???? support
	endif
	
	if isHFLoaded
	
		form HFFoodForm01 = Game.GetFormFromFile(0x0200353E, "HearthFires.esm")				;Clam Chowder
		form HFFoodForm02 = Game.GetFormFromFile(0x0200353D, "HearthFires.esm")				;Potato Soup
	
		form HFDrinkForm01 = Game.GetFormFromFile(0x02003535, "HearthFires.esm")			;Argonian Bloodwine
		form HFDrinkForm02 = Game.GetFormFromFile(0x02003536, "HearthFires.esm")			;Surilie Brothers Wine
		
		if !(_DE_Foods5.HasForm(HFFoodForm01))
			_DE_Foods5.AddForm(HFFoodForm01)
			_DE_Foods15.AddForm(HFFoodForm02)
		endif
		
		if !(_DE_Drinks10.HasForm(HFDrinkForm01))
			_DE_Drinks10.AddForm(HFDrinkForm01)
			_DE_Drinks10.AddForm(HFDrinkForm02)
		endif
	
	endif
	
	;#Region SKSE + Mod Support Section
	if isHFLoaded && isSKSELoaded
		
		form QuarriedStone = Game.GetFormFromFile(0x0200306C, "HearthFires.esm")		;Quarried Stone
		_DE_RecipeSuppliesRockHF.SetNthIngredient(QuarriedStone, 0)
		
	endif
	
	if isDLC1Loaded && isSKSELoaded
	
		form ValeDeerHide = Game.GetFormFromFile(0x02011999, "Dawnguard.esm")			;Vale Deer Hide
		form ValeSabreCatHide = Game.GetFormFromFile(0x0201199A, "Dawnguard.esm")		;Vale Sabre Cat Hide
		
		_DE_RecipeLeatherValeDeerHideDLC1.SetNthIngredient(ValeDeerHide, 0)
		_DE_RecipeLeatherValeSabreCatHideDLC1.SetNthIngredient(ValeSabreCatHide, 0)
		_DE_RecipeTanningLeatherValeDeerHideDLC1.SetNthIngredient(ValeDeerHide, 0)
		_DE_RecipeTanningLeatherValeSabreCatHideDLC1.SetNthIngredient(ValeSabreCatHide, 0)
		
	endif
	
	if isDLC2Loaded && isSKSELoaded
		;clothing forms
	endif
	
	;#EndRegion
	
	if isSKYRELoaded
		SKYRELoadUp()
	else
		SKYREUnload()
	endif
	
	;#Region Future Mod Support Section
	if isMod1Loaded
		Mod1LoadUp()
	endif
	
	if isMod2Loaded
		;Future support
	endif
	
	if isMod3Loaded
		;Future support
	endif
	
	if isMod4Loaded
		;Future support
	endif
	
	if isMod5Loaded
		;Future support
	endif
	
	if isMod6Loaded
		;Future support
	endif
	
	if isMod7Loaded
		;Future support
	endif
	
	if isMod8Loaded
		;Future support
	endif
	
	if isMod9Loaded
		;Future support
	endif
	
	if isMod10Loaded
		;Future support
	endif
	
	if isMod11Loaded
		;Future support
	endif
	
	if isMod12Loaded
		;Future support
	endif
	
	if isMod13Loaded
		;Future support
	endif
	
	if isMod14Loaded
		;Future support
	endif
	
	if isMod15Loaded
		;Future support
	endif
	
	if isMod16Loaded
		;Future support
	endif
	
	if isMod17Loaded
		;Future support
	endif
	
	if isMod18Loaded
		;Future support
	endif
	
	if isMod19Loaded
		;Future support
	endif
	
	if isMod20Loaded
		;Future support
	endif
	;#EndRegion
	
	trace("============================================[ Frostfall: Warning End ]============================================")
	trace("                                                                                                                  ")
	trace("                                       Frostfall compatibility check complete.                                    ")
	trace("                                                                                                                  ")
	trace("============================================[ Frostfall: Warning End ]============================================")
	
	;if _DE_Setting_SystemMsg.GetValueInt() == 2
	;	_DE_CompatibilityFinished.Show()
	;endif
	
	AddStartupSpells()
	
endFunction

function AddStartupSpells()							;Approved 2.0
	PlayerRef.AddSpell(_DE_Weathersense_Spell, false) 			;Survival Skills - Weathersense
	PlayerRef.AddSpell(_DE_SurvivalSkillsCombo_Spell, false)		;Survival Skills (multi-select)
	PlayerRef.AddSpell(_DE_WellInsulatedConditionSpell, false)
	PlayerRef.AddSpell(_DE_ConditioningState_Spell, false)
	PlayerRef.AddSpell(_DE_ConditioningState_Spell_SkyRe, false)
	
	if isSKYUILoaded
		PlayerRef.RemoveSpell(_DE_Configuration_Spell)
	else
		PlayerRef.AddSpell(_DE_Configuration_Spell, false)
	endif
	
	PlayerRef.RemoveSpell(_DE_SurvivalSkills_Spell)				;Survival Skills - Create Item	 (1.6b legacy)
	PlayerRef.RemoveSpell(_DE_WEARExamineArmor_Spell)				;Survival Skills - Inspect Armor (1.6b legacy)
endFunction

function VanillaGameLoadUp()
	FrostfallArmor.ArrayAddFormXT("cloak fur", _DE_Cloak_BasicFur)
	FrostfallArmor.ArrayAddFormXT("cloak hide", _DE_Cloak_BasicHide)
	FrostfallArmor.ArrayAddFormXT("cloak linen", _DE_Cloak_BasicLinen)
	FrostfallArmor.ArrayAddFormXT("cloak burlap", _DE_Cloak_BasicBurlap)
	FrostfallArmor.ArrayAddFormXT("cloak hide", ArmorNightingaleCuirassPlayer01)
	FrostfallArmor.ArrayAddFormXT("cloak hide", ArmorNightingaleCuirassPlayer02)
	FrostfallArmor.ArrayAddFormXT("cloak hide", ArmorNightingaleCuirassPlayer03)

	if bAddedSpellBooks == false
		AddSpellBooks()
	endif
endFunction

function DLC1LoadUp()

	if !DLC1_FVCanyon_PolyX
		DLC1_FVCanyon_PolyX = new float[5]
	endif
	if !DLC1_FVCanyon_PolyY
		DLC1_FVCanyon_PolyY = new float[5]
	endif
	if !DLC1_FVIce_PolyX
		DLC1_FVIce_PolyX = new float[8]
	endif
	if !DLC1_FVIce_PolyY
		DLC1_FVIce_PolyY = new float[8]
	endif
	if !DLC1_FVPlayground_PolyX
		DLC1_FVPlayground_PolyX = new float[6]
	endif
	if !DLC1_FVPlayground_PolyY
		DLC1_FVPlayground_PolyY = new float[6]
	endif
	if !DLC1_FVGrove_PolyX
		DLC1_FVGrove_PolyX = new float[5]
	endif
	if !DLC1_FVGrove_PolyY
		DLC1_FVGrove_PolyY = new float[5]
	endif
	if !DLC1_FVBoss_PolyX
		DLC1_FVBoss_PolyX = new float[5]
	endif
	if !DLC1_FVBoss_PolyY
		DLC1_FVBoss_PolyY = new float[5]
	endif

	;Set up polygon arrays that describe Falmer Valley weather regions (if necessary)
	if !DLC1_FVCanyon_PolyX[0]
		DLC1_FVCanyon_PolyX[0] = -47273
		DLC1_FVCanyon_PolyX[1] = -4083
		DLC1_FVCanyon_PolyX[2] = 16369
		DLC1_FVCanyon_PolyX[3] = -31458
		DLC1_FVCanyon_PolyX[4] = -55597
	endif
	if !DLC1_FVIce_PolyX[0]
		DLC1_FVIce_PolyX[0] = -22417
		DLC1_FVIce_PolyX[1] = 5287
		DLC1_FVIce_PolyX[2] = 17525
		DLC1_FVIce_PolyX[3] = 38431
		DLC1_FVIce_PolyX[4] = 47312
		DLC1_FVIce_PolyX[5] = 16369
		DLC1_FVIce_PolyX[6] = -4083
		DLC1_FVIce_PolyX[7] = -24967
	endif
	if !DLC1_FVPlayground_PolyX[0]
		DLC1_FVPlayground_PolyX[0] = -47273
		DLC1_FVPlayground_PolyX[1] = -42686
		DLC1_FVPlayground_PolyX[2] = 24409
		DLC1_FVPlayground_PolyX[3] = 5287
		DLC1_FVPlayground_PolyX[4] = -22417
		DLC1_FVPlayground_PolyX[5] = -24967
	endif
	if !DLC1_FVGrove_PolyX[0]
		DLC1_FVGrove_PolyX[0] = 24409
		DLC1_FVGrove_PolyX[1] = 46535
		DLC1_FVGrove_PolyX[2] = 58431
		DLC1_FVGrove_PolyX[3] = 17525
		DLC1_FVGrove_PolyX[4] = 5287
	endif
	if !DLC1_FVBoss_PolyX[0]
		DLC1_FVBoss_PolyX[0] = -7340
		DLC1_FVBoss_PolyX[1] = -7065
		DLC1_FVBoss_PolyX[2] = -12013
		DLC1_FVBoss_PolyX[3] = -14487
		DLC1_FVBoss_PolyX[4] = -11023
	endif
	if !DLC1_FVCanyon_PolyY[0]
		DLC1_FVCanyon_PolyY[0] = 15175
		DLC1_FVCanyon_PolyY[1] = -16276
		DLC1_FVCanyon_PolyY[2] = -43088
		DLC1_FVCanyon_PolyY[3] = -43787
		DLC1_FVCanyon_PolyY[4] = -18209
	endif
	if !DLC1_FVIce_PolyY[0]
		DLC1_FVIce_PolyY[0] = 15633
		DLC1_FVIce_PolyY[1] = 16908
		DLC1_FVIce_PolyY[2] = -2680
		DLC1_FVIce_PolyY[3] = 10491
		DLC1_FVIce_PolyY[4] = -10372
		DLC1_FVIce_PolyY[5] = -43088
		DLC1_FVIce_PolyY[6] = -16276
		DLC1_FVIce_PolyY[7] = -6122
	endif
	if !DLC1_FVPlayground_PolyY[0]
		DLC1_FVPlayground_PolyY[0] = 15175
		DLC1_FVPlayground_PolyY[1] = 40024
		DLC1_FVPlayground_PolyY[2] = 50095
		DLC1_FVPlayground_PolyY[3] = 16908
		DLC1_FVPlayground_PolyY[4] = 15633
		DLC1_FVPlayground_PolyY[5] = -6122
	endif
	if !DLC1_FVGrove_PolyY[0]
		DLC1_FVGrove_PolyY[0] = 50095
		DLC1_FVGrove_PolyY[1] = 17714
		DLC1_FVGrove_PolyY[2] = 10491
		DLC1_FVGrove_PolyY[3] = -2680
		DLC1_FVGrove_PolyY[4] = 16908
	endif
	if !DLC1_FVBoss_PolyY[0]
		DLC1_FVBoss_PolyY[0] = -7244
		DLC1_FVBoss_PolyY[1] = -9662
		DLC1_FVBoss_PolyY[2] = -14170
		DLC1_FVBoss_PolyY[3] = -10432
		DLC1_FVBoss_PolyY[4] = -7244
	endif
	
	if !(_DE_EquipExceptions.HasForm(Game.GetFormFromFile(0x020023F5, "Dawnguard.esm")))
		_DE_EquipExceptions.AddForm(Game.GetFormFromFile(0x020023F5, "Dawnguard.esm"))		;DLC1SkinNakedVampireLord
		_DE_EquipExceptions.AddForm(Game.GetFormFromFile(0x02011A84, "Dawnguard.esm"))		;DLC1ClothesVampireLordArmor
	endif

	;Add the cloaks
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x0200b5db, "Dawnguard.esm"))	;Vampire Royal Armor (Red)
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020194c5, "Dawnguard.esm"))	;Vampire Royal Armor (Valerica)
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02011a85, "Dawnguard.esm"))	;Vampire Royal Armor (Vampire Lord) (Not normally obtainable)
	
endFunction

function DLC2LoadUp()

	;Make a Fast Travel exception for the Black Books
	
	form Book1 = Game.GetFormFromFile(0x000270ED, "Dragonborn.esm")
	form Book2 = Game.GetFormFromFile(0x000270EE, "Dragonborn.esm")
	form Book3 = Game.GetFormFromFile(0x000270EF, "Dragonborn.esm")
	form Book4 = Game.GetFormFromFile(0x000270F0, "Dragonborn.esm")
	form Book5 = Game.GetFormFromFile(0x000270F1, "Dragonborn.esm")
	form Book6 = Game.GetFormFromFile(0x000270F2, "Dragonborn.esm")
	form Book7 = Game.GetFormFromFile(0x000270F3, "Dragonborn.esm")

	if !(_DE_FastTravelExceptions.HasForm(Book1))
		_DE_FastTravelExceptions.AddForm(Book1)
	endif
	if !(_DE_FastTravelExceptions.HasForm(Book2))
		_DE_FastTravelExceptions.AddForm(Book2)
	endif
	if !(_DE_FastTravelExceptions.HasForm(Book3))
		_DE_FastTravelExceptions.AddForm(Book3)
	endif
	if !(_DE_FastTravelExceptions.HasForm(Book4))
		_DE_FastTravelExceptions.AddForm(Book4)
	endif
	if !(_DE_FastTravelExceptions.HasForm(Book5))
		_DE_FastTravelExceptions.AddForm(Book5)
	endif
	if !(_DE_FastTravelExceptions.HasForm(Book6))
		_DE_FastTravelExceptions.AddForm(Book6)
	endif
	if !(_DE_FastTravelExceptions.HasForm(Book7))
		_DE_FastTravelExceptions.AddForm(Book7)
	endif

	;Stalhrim Light Armor
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0201CDA3, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0201CDA2, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0201CDA5, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0201CD7E, "Dragonborn.esm"))
	
	;Stalhrim Armor
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0201CDA1, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0201CD9F, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0201CDA0, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0201CD9E, "Dragonborn.esm"))
	
	;Deathbrand Armor
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202401D, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202401B, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0202401C, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202401A, "Dragonborn.esm"))
	
	;Skaal Armor
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02039114, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0203910E, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02039110, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02039112, "Dragonborn.esm"))

	;Nordic Carved Armor
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0201CD99, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0201CD97, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0201CD98, "Dragonborn.esm"))
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0201CD96, "Dragonborn.esm"))
	
	;Enchanted Equipment
	;==========HEAD FULL===========
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029251, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetWaterbreathing> "Stalhrim Helmet of Waterbreathing"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029250, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetRestoration06> "Stalhrim Helmet of Peerless Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202924F, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetRestoration05> "Stalhrim Helmet of Extreme Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202924E, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetRestoration04> "Stalhrim Helmet of Eminent Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202924D, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMarksman06> "Stalhrim Helmet of Peerless Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202924C, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMarksman05> "Stalhrim Helmet of Extreme Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202924B, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMarksman04> "Stalhrim Helmet of Eminent Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202924A, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMagickaRate06> "Stalhrim Helmet of Recovery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029249, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMagickaRate05> "Stalhrim Helmet of Resurgence"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029248, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMagickaRate04> "Stalhrim Helmet of Replenishing"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029247, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMagicka06> "Stalhrim Helmet of Extreme Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029246, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMagicka05> "Stalhrim Helmet of Extreme Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029245, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetMagicka04> "Stalhrim Helmet of Eminent Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029244, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetIllusion06> "Stalhrim Helmet of Peerless Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029243, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetIllusion05> "Stalhrim Helmet of Extreme Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029242, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetIllusion04> "Stalhrim Helmet of Eminent Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029241, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetDestruction06> "Stalhrim Helmet of Peerless Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029240, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetDestruction05> "Stalhrim Helmet of Extreme Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202923F, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetDestruction04> "Stalhrim Helmet of Eminent Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202923E, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetConjuration06> "Stalhrim Helmet of Peerless Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202923D, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetConjuration05> "Stalhrim Helmet of Extreme Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202923C, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetConjuration04> "Stalhrim Helmet of Eminent Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202923B, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetAlteration06> "Stalhrim Helmet of Peerless Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0202923A, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetAlteration05> "Stalhrim Helmet of Extreme Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029239, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetAlteration04> "Stalhrim Helmet of Eminent Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029238, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetAlchemy06> "Stalhrim Helmet of Peerless Alchemy"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029237, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetAlchemy05> "Stalhrim Helmet of Extreme Alchemy"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02029236, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyHelmetAlchemy04> "Stalhrim Helmet of Eminent Alchemy"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291EC, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetWaterbreathing> "Nordic Helmet of Waterbreathing"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291EB, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetRestoration05> "Nordic Helmet of Extreme Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291EA, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetRestoration04> "Nordic Helmet of Eminent Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E9, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetRestoration03> "Nordic Helmet of Major Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E8, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetMarksman05> "Nordic Helmet of Extreme Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E7, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetMarksman04> "Nordic Helmet of Eminent Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E6, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetMarksman03> "Nordic Helmet of Major Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E5, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetMagicka05> "Nordic Helmet of Extreme Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E4, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetMagicka04> "Nordic Helmet of Eminent Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E3, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetMagicka03> "Nordic Helmet of Major Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E2, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetIllusion05> "Nordic Helmet of Extreme Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E1, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetIllusion04> "Nordic Helmet of Eminent Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291E0, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetIllusion03> "Nordic Helmet of Major Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291DF, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetDestruction05> "Nordic Helmet of Extreme Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291DE, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetDestruction04> "Nordic Helmet of Eminent Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291DD, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetDestruction03> "Nordic Helmet of Major Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291DC, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetConjuration05> "Nordic Helmet of Extreme Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291DB, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetConjuration04> "Nordic Helmet of Eminent Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291DA, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetConjuration03> "Nordic Helmet of Major Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291D9, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetAlteration05> "Nordic Helmet of Extreme Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291D8, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetAlteration04> "Nordic Helmet of Eminent Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291D7, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetAlteration03> "Nordic Helmet of Major Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291D6, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetAlchemy05> "Nordic Helmet of Extreme Alchemy"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291D5, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetAlchemy04> "Nordic Helmet of Eminent Alchemy"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020291D4, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyHelmetAlchemy03> "Nordic Helmet of Major Alchemy"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290EF, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetRestoration05> "Stalhrim Helmet of Extreme Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290EE, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetRestoration04> "Stalhrim Helmet of Eminent Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290ED, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetRestoration03> "Stalhrim Helmet of Major Restoration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290EC, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMarksman05> "Stalhrim Helmet of Extreme Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290EB, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMarksman04> "Stalhrim Helmet of Eminent Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290EA, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMarksman03> "Stalhrim Helmet of Major Archery"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E9, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMagickaRate05> "Stalhrim Helmet of Resurgence"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E8, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMagickaRate04> "Stalhrim Helmet of Replenishing"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E7, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMagickaRate03> "Stalhrim Helmet of Recharging"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E6, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMagicka05> "Stalhrim Helmet of Extreme Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E5, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMagicka04> "Stalhrim Helmet of Eminent Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E4, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetMagicka03> "Stalhrim Helmet of Major Magicka"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E3, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetIllusion05> "Stalhrim Helmet of Extreme Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E2, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetIllusion04> "Stalhrim Helmet of Eminent Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E1, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetIllusion03> "Stalhrim Helmet of Major Illusion"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290E0, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetDestruction05> "Stalhrim Helmet of Extreme Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290DF, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetDestruction04> "Stalhrim Helmet of Eminent Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290DE, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetDestruction03> "Stalhrim Helmet of Major Destruction"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290DD, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetConjuration05> "Stalhrim Helmet of Extreme Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290DC, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetConjuration04> "Stalhrim Helmet of Eminent Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290DB, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetConjuration03> "Stalhrim Helmet of Major Conjuring"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290DA, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetAlteration05> "Stalhrim Helmet of Extreme Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290D9, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetAlteration04> "Stalhrim Helmet of Eminent Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290D8, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetAlteration03> "Stalhrim Helmet of Major Alteration"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290D7, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetAlchemy05> "Stalhrim Helmet of Extreme Alchemy"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290D6, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetAlchemy04> "Stalhrim Helmet of Eminent Alchemy"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020290D5, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightHelmetAlchemy03> "Stalhrim Helmet of Major Alchemy"
	
	;==========BODY FULL===========
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029226, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassStaminaRate06> "Stalhrim Armor of Renewal"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029225, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassStaminaRate05> "Stalhrim Armor of Invigoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029224, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassStaminaRate04> "Stalhrim Armor of Rejuvenation"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029223, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassRestoration06> "Stalhrim Armor of Peerless Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029222, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassRestoration05> "Stalhrim Armor of Extreme Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029221, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassRestoration04> "Stalhrim Armor of Eminent Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029220, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassIllusion06> "Stalhrim Armor of Peerless Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202921F, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassIllusion05> "Stalhrim Armor of Extreme Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202921E, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassIllusion04> "Stalhrim Armor of Eminent Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202921D, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor06> "Stalhrim Armor of the Peerless Knight"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202921C, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor05> "Stalhrim Armor of the Noble Knight"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202921B, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor04> "Stalhrim Armor of the Eminent Knight"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202921A, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHealthRate05> "Stalhrim Armor of Regeneration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029219, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHealthRate04> "Stalhrim Armor of Mending"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029218, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHealth06> "Stalhrim Armor of Peerless Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029217, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHealthRate06> "Stalhrim Armor of Revival"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029216, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHealth05> "Stalhrim Armor of Extreme Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029215, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassHealth04> "Stalhrim Armor of Eminent Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029214, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassDestruction06> "Stalhrim Armor of Peerless Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029213, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassDestruction05> "Stalhrim Armor of Extreme Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029212, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassDestruction04> "Stalhrim Armor of Eminent Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029211, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassConjuration06> "Stalhrim Armor of Peerless Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02029210, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassConjuration05> "Stalhrim Armor of Extreme Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202920F, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassConjuration04> "Stalhrim Armor of Eminent Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202920E, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassAlteration06> "Stalhrim Armor of Peerless Alteration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202920D, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassAlteration05> "Stalhrim Armor of Extreme Alteration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0202920C, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyCuirassAlteration04> "Stalhrim Armor of Eminent Alteration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291C4, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassRestoration05> "Nordic Armor of Extreme Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291C3, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassRestoration04> "Nordic Armor of Eminent Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291C2, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassRestoration03> "Nordic Armor of Major Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291C1, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassIllusion05> "Nordic Armor of Extreme Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291C0, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassIllusion04> "Nordic Armor of Eminent Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291BF, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassIllusion03> "Nordic Armor of Major Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291BE, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassHeavyArmor05> "Nordic Armor of the Noble Knight"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291BD, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassHeavyArmor04> "Nordic Armor of the Eminent Knight"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291BC, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassHeavyArmor03> "Nordic Armor of the Major Knight"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291BB, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassHealth05> "Nordic Armor of Extreme Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291BA, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassHealth04> "Nordic Armor of Eminent Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B9, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassHealth03> "Nordic Armor of Major Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B8, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassDestruction05> "Nordic Armor of Extreme Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B7, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassDestruction04> "Nordic Armor of Eminent Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B6, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassDestruction03> "Nordic Armor of Major Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B5, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassConjuration05> "Nordic Armor of Extreme Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B4, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassConjuration04> "Nordic Armor of Eminent Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B3, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassConjuration03> "Nordic Armor of Major Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B2, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassAlteration05> "Nordic Armor of Extreme Alteration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B1, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassAlteration04> "Nordic Armor of Eminent Alteration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020291B0, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyCuirassAlteration03> "Nordic Armor of Major Alteration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290BF, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassStaminaRate05> "Stalhrim Armor of Invigoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290BE, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassStaminaRate04> "Stalhrim Armor of Rejuvenation"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290BD, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassStaminaRate03> "Stalhrim Armor of Recuperation"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290BC, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassRestoration05> "Stalhrim Armor of Extreme Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290BB, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassRestoration04> "Stalhrim Armor of Eminent Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290BA, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassRestoration03> "Stalhrim Armor of Major Restoration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B9, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassLightArmor05> "Stalhrim Armor of the Noble Knight"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B8, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassLightArmor04> "Stalhrim Armor of the Eminent Knight"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B7, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassLightArmor03> "Stalhrim Armor of the Major Squire"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B6, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassIllusion05> "Stalhrim Armor of Extreme Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B5, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassIllusion04> "Stalhrim Armor of Eminent Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B4, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassIllusion03> "Stalhrim Armor of Major Illusion"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B3, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassHealth05> "Stalhrim Armor of Extreme Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B2, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassHealth04> "Stalhrim Armor of Eminent Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B1, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassHealth03> "Stalhrim Armor of Major Health"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290B0, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassHealRate05> "Stalhrim Armor of Regeneration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290AF, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassHealRate04> "Stalhrim Armor of Mending"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290AE, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassHealRate03> "Stalhrim Armor of Remedy"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290AD, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassDestruction05> "Stalhrim Armor of Extreme Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290AC, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassDestruction04> "Stalhrim Armor of Eminent Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290AB, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassDestruction03> "Stalhrim Armor of Major Destruction"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290AA, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassConjuration05> "Stalhrim Armor of Extreme Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290A9, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassConjuration04> "Stalhrim Armor of Eminent Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290A8, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassConjuration03> "Stalhrim Armor of Major Conjuring"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290A7, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassAlteration05> "Stalhrim Armor of Extreme Alteration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290A6, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassAlteration04> "Stalhrim Armor of Eminent Alteration"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x020290A5, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightCuirassAlteration03> "Stalhrim Armor of Major Alteration"

	;==========HANDS FULL===========
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029235, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded06> "Stalhrim Gauntlets of Peerless Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029234, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded05> "Stalhrim Gauntlets of Extreme Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029233, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded04> "Stalhrim Gauntlets of Eminent Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029232, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsSmithing06> "Stalhrim Gauntlets of Peerless Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029231, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsSmithing05> "Stalhrim Gauntlets of Extreme Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029230, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsSmithing04> "Stalhrim Gauntlets of Eminent Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0202922F, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsOneHanded06> "Stalhrim Gauntlets of Peerless Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0202922E, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsOneHanded05> "Stalhrim Gauntlets of Extreme Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0202922D, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsOneHanded04> "Stalhrim Gauntlets of Eminent Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0202922C, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsMarksman06> "Stalhrim Gauntlets of Peerless Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0202922B, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsMarksman05> "Stalhrim Gauntlets of Extreme Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0202922A, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsMarksman04> "Stalhrim Gauntlets of Eminent Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029229, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsAlchemy06> "Stalhrim Gauntlets of Peerless Alchemy"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029228, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsAlchemy05> "Stalhrim Gauntlets of Extreme Alchemy"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02029227, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyGauntletsAlchemy04> "Stalhrim Gauntlets of Eminent Alchemy"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291D3, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsTwoHanded05> "Nordic Gauntlets of Extreme Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291D2, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsTwoHanded04> "Nordic Gauntlets of Eminent Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291D1, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsTwoHanded03> "Nordic Gauntlets of Major Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291D0, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsSmithing05> "Nordic Gauntlets of Extreme Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291CF, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsSmithing04> "Nordic Gauntlets of Eminent Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291CE, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsSmithing03> "Nordic Gauntlets of Major Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291CD, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsOneHanded05> "Nordic Gauntlets of Extreme Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291CC, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsOneHanded04> "Nordic Gauntlets of Eminent Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291CB, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsOneHanded03> "Nordic Gauntlets of Major Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291CA, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsMarksman05> "Nordic Gauntlets of Extreme Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291C9, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsMarksman04> "Nordic Gauntlets of Eminent Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291C8, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsMarksman03> "Nordic Gauntlets of Major Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291C7, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsAlchemy05> "Nordic Gauntlets of Extreme Alchemy"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291C6, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsAlchemy04> "Nordic Gauntlets of Eminent Alchemy"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020291C5, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyGauntletsAlchemy03> "Nordic Gauntlets of Major Alchemy"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290D4, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsTwoHanded05> "Stalhrim Gauntlets of Extreme Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290D3, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsTwoHanded04> "Stalhrim Gauntlets of Eminent Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290D2, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsTwoHanded03> "Stalhrim Gauntlets of Major Sure Grip"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290D1, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsSmithing05> "Stalhrim Gauntlets of Extreme Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290D0, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsSmithing04> "Stalhrim Gauntlets of Eminent Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290CF, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsSmithing03> "Stalhrim Gauntlets of Major Smithing"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290CE, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsPickpocket05> "Stalhrim Gauntlets of Extreme Deft Hands"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290CD, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsPickpocket04> "Stalhrim Gauntlets of Eminent Deft Hands"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290CC, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsPickpocket03> "Stalhrim Gauntlets of Major Deft Hands"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290CB, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsOneHanded05> "Stalhrim Gauntlets of Extreme Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290CA, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsOneHanded04> "Stalhrim Gauntlets of Eminent Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C9, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsOneHanded03> "Stalhrim Gauntlets of Major Wielding"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C8, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsMarksman05> "Stalhrim Gauntlets of Extreme Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C7, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsMarksman04> "Stalhrim Gauntlets of Eminent Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C6, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsMarksman03> "Stalhrim Gauntlets of Major Archery"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C5, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsLockpicking05> "Stalhrim Gauntlets of Extreme Lockpicking"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C4, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsLockpicking04> "Stalhrim Gauntlets of Eminent Lockpicking"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C3, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsLockpicking03> "Stalhrim Gauntlets of Major Lockpicking"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C2, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsAlchemy05> "Stalhrim Gauntlets of Extreme Alchemy"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C1, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsAlchemy04> "Stalhrim Gauntlets of Eminent Alchemy"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020290C0, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightGauntletsAlchemy03> "Stalhrim Gauntlets of Major Alchemy"

	;==========FEET FULL===========
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202920B, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsStamina06> "Stalhrim Boots of Peerless Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202920A, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsStamina05> "Stalhrim Boots of Extreme Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029209, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsStamina04> "Stalhrim Boots of Eminent Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029208, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistShock06> "Stalhrim Boots of Grounding"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029207, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistShock05> "Stalhrim Boots of Shock Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029206, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistShock04> "Stalhrim Boots of Shock Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029205, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistFrost06> "Stalhrim Boots of Warmth"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029204, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistFrost05> "Stalhrim Boots of Frost Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029203, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistFrost04> "Stalhrim Boots of Frost Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029202, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistFire06> "Stalhrim Boots of the Firewalker"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029201, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistFire05> "Stalhrim Boots of Fire Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029200, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsResistFire04> "Stalhrim Boots of Fire Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291FF, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsMuffle> "Stalhrim Boots of Muffling"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291FE, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsCarry06> "Stalhrim Boots of the Mammoth"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291FD, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsCarry05> "Stalhrim Boots of the Ox"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291FC, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimHeavyBootsCarry04> "Stalhrim Boots of Brawn"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291AF, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsStamina05> "Nordic Boots of Extreme Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291AE, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsStamina04> "Nordic Boots of Eminent Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291AD, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsStamina03> "Nordic Boots of Major Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291AC, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistShock05> "Nordic Boots of Shock Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291AB, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistShock04> "Nordic Boots of Shock Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291AA, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistShock03> "Nordic Boots of Dwindling Shock"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A9, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistFrost05> "Nordic Boots of Frost Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A8, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistFrost04> "Nordic Boots of Frost Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A7, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistFrost03> "Nordic Boots of Dwindling Frost"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A6, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistFire05> "Nordic Boots of Fire Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A5, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistFire04> "Nordic Boots of Fire Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A4, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsResistFire03> "Nordic Boots of Dwindling Flames"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A3, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsMuffle> "Nordic Boots of Muffling"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A2, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsCarry05> "Nordic Boots of the Ox"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A1, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsCarry04> "Nordic Boots of Brawn"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020291A0, "Dragonborn.esm"))		;<DLC2EnchArmorNordicHeavyBootsCarry03> "Nordic Boots of Strength"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020290A4, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsStamina05> "Stalhrim Boots of Extreme Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020290A3, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsStamina04> "Stalhrim Boots of Eminent Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020290A2, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsStamina03> "Stalhrim Boots of Major Stamina"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020290A1, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsSneak05> "Stalhrim Boots of Extreme Sneaking"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020290A0, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsSneak04> "Stalhrim Boots of Eminent Sneaking"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202909F, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistShock05> "Stalhrim Boots of Shock Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202909E, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistShock04> "Stalhrim Boots of Shock Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202909D, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistShock03> "Stalhrim Boots of Dwindling Shock"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202909C, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsSneak03> "Stalhrim Boots of Major Sneaking"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202909B, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistFrost05> "Stalhrim Boots of Frost Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0202909A, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistFrost04> "Stalhrim Boots of Frost Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029099, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistFrost03> "Stalhrim Boots of Dwindling Frost"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029098, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistFire05> "Stalhrim Boots of Fire Abatement"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029097, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistFire04> "Stalhrim Boots of Fire Suppression"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029096, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsResistFire03> "Stalhrim Boots of Dwindling Flames"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029095, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsCarry05> "Stalhrim Boots of the Ox"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029094, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsCarry04> "Stalhrim Boots of Brawn"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02029093, "Dragonborn.esm"))		;<DLC2EnchArmorStalhrimLightBootsCarry03> "Stalhrim Boots of Strength"

endFunction

function Mod1LoadUp()

	if !Mod1WS
		Mod1WS = Game.GetFormFromFile(0x01000D62, "Wyrmstooth.esp") as Worldspace
	endif
	
	if !(_DE_WorldspacesInteriors.HasForm(Game.GetFormFromFile(0x010825E1, "Wyrmstooth.esp")))	;Dimfrost
		_DE_WorldspacesInteriors.AddForm(Game.GetFormFromFile(0x010825E1, "Wyrmstooth.esp"))
	endif
	
	if !MOD1_Center_PolyX
		MOD1_Center_PolyX = new float[5]
	endif
	if !MOD1_Center_PolyY
		MOD1_Center_PolyY = new float[5]
	endif
	if !MOD1_West_PolyX
		MOD1_West_PolyX = new float[8]
	endif
	if !MOD1_West_PolyY
		MOD1_West_PolyY = new float[8]
	endif
	if !MOD1_Center_PolyX[0]
		MOD1_Center_PolyX[0] = 19045.16
		MOD1_Center_PolyX[1] = 13357.78
		MOD1_Center_PolyX[2] = 19684.59
		MOD1_Center_PolyX[3] = 41285.82
		MOD1_Center_PolyX[4] = 25999.50
	endif
	if !MOD1_Center_PolyY[0]
		MOD1_Center_PolyY[0] = 727.36
		MOD1_Center_PolyY[1] = -10888.55
		MOD1_Center_PolyY[2] = -18279.13
		MOD1_Center_PolyY[3] = 3264.52
		MOD1_Center_PolyY[4] = 8109.01
	endif
	if !MOD1_West_PolyX[0]
		MOD1_West_PolyX[0] = -184.0
		MOD1_West_PolyX[1] = -6402.0
		MOD1_West_PolyX[2] = -16690.0
		MOD1_West_PolyX[3] = -14528.0
		MOD1_West_PolyX[4] = -10068.0
		MOD1_West_PolyX[5] = -11671.0
		MOD1_West_PolyX[6] = -70148.0
		MOD1_West_PolyX[7] = -63280.0
	endif
	if !MOD1_West_PolyY[0]
		MOD1_West_PolyY[0] = 17652.0
		MOD1_West_PolyY[1] = -3939.0
		MOD1_West_PolyY[2] = -8281.0
		MOD1_West_PolyY[3] = -17718.0
		MOD1_West_PolyY[4] = -29543.0
		MOD1_West_PolyY[5] = -18706.0
		MOD1_West_PolyY[6] = -29523.0
		MOD1_West_PolyY[7] = 52329.0
	endif

endFunction

function SKYRELoadUp()

	Traveller_Rank1 = Game.GetFormFromFile(0x0208DCAA, "SkyRe_Main.esp") as Perk				;Traveller - Rank 1
	Traveller_Rank2 = Game.GetFormFromFile(0x0208E232, "SkyRe_Main.esp") as Perk				;Traveller - Rank 2
	Traveller_Rank3 = Game.GetFormFromFile(0x0208E234, "SkyRe_Main.esp") as Perk				;Traveller - Rank 3
	Traveller_Rank4 = Game.GetFormFromFile(0x0208E235, "SkyRe_Main.esp") as Perk				;Traveller - Rank 4
	Traveller_Rank5 = Game.GetFormFromFile(0x0208E236, "SkyRe_Main.esp") as Perk				;Traveller - Rank 5
	Forestry_Rank1 = Game.GetFormFromFile(0x02002F9F, "SkyRe_Survivalism.esp") as Perk				;Forestry - Rank 1
	Forestry_Rank2 = Game.GetFormFromFile(0x02002FA0, "SkyRe_Survivalism.esp") as Perk				;Forestry - Rank 2
	Forestry_Rank3 = Game.GetFormFromFile(0x02002FA1, "SkyRe_Survivalism.esp") as Perk				;Forestry - Rank 3
	GlacialSwimmer = Game.GetFormFromFile(0x02002FA3, "SkyRe_Survivalism.esp") as Perk				;Glacial Swimmer
	Windbreaker = Game.GetFormFromFile(0x02002FA4, "SkyRe_Survivalism.esp") as Perk					;Windbreaker
	WellInsulated = Game.GetFormFromFile(0x02002FA5, "SkyRe_Survivalism.esp") as Perk				;Well Insulated

	trace("SkyRe Traveller_Rank1 " + Traveller_Rank1)
	trace("SkyRe Traveller_Rank2 " + Traveller_Rank2)
	trace("SkyRe Traveller_Rank3 " + Traveller_Rank3)
	trace("SkyRe Traveller_Rank4 " + Traveller_Rank4)
	trace("SkyRe Traveller_Rank5 " + Traveller_Rank5)
	trace("SkyRe Forestry_Rank1 " + Forestry_Rank1)
	trace("SkyRe Forestry_Rank2 " + Forestry_Rank2)
	trace("SkyRe Forestry_Rank3 " + Forestry_Rank3)
	trace("SkyRe GlacialSwimmer " + GlacialSwimmer)
	trace("SkyRe Windbreaker " + Windbreaker)
	trace("SkyRe WellInsulated " + WellInsulated)
	
endFunction

function SKYREUnload()
	Traveller_Rank1 = _DE_DummyPerk
	Traveller_Rank2 = _DE_DummyPerk
	Traveller_Rank3 = _DE_DummyPerk
	Traveller_Rank4 = _DE_DummyPerk
	Traveller_Rank5 = _DE_DummyPerk
	Forestry_Rank1 = _DE_DummyPerk
	Forestry_Rank2 = _DE_DummyPerk
	Forestry_Rank3 = _DE_DummyPerk
	GlacialSwimmer = _DE_DummyPerk
	Windbreaker = _DE_DummyPerk
	WellInsulated = _DE_DummyPerk

endFunction

function WICLoadUp()
	
	;Determine if Winter is Coming is loaded, and if so, from which plug-in
	
	string sWICPluginName
	bool bIsLoaded
	bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaks.esp")
	if !bIsLoaded
		bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaksNoGuards.esp")
		if !bIsLoaded
			bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaksCRAFT.esp")
			if !bIsLoaded
				return
			else
				sWICPluginName = "1nivWICCloaksCRAFT.esp"
			endif
		else
			sWICPluginName = "1nivWICCloaksNoGuards.esp"
		endif
	else
		sWICPluginName = "1nivWICCloaks.esp"
	endif
	
	;==========HEAD FULL===========
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010028CD, sWICPluginName))			;1nivHoodBearComBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010038F5, sWICPluginName))			;1nivHoodBearComCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010038F6, sWICPluginName))			;1nivHoodBearComSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED0, sWICPluginName))			;1nivHoodBearComSteelBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED1, sWICPluginName))			;1nivHoodBearComSteelCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED2, sWICPluginName))			;1nivHoodBearComSteelSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01012C98, sWICPluginName))			;1nivHoodBearComStuddedBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01012C99, sWICPluginName))			;1nivHoodBearComStuddedCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01012C9A, sWICPluginName))			;1nivHoodBearComStuddedSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010038FA, sWICPluginName))			;1nivHoodBearOrnateBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010038FB, sWICPluginName))			;1nivHoodBearOrnateCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010038FC, sWICPluginName))			;1nivHoodBearOrnateSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED3, sWICPluginName))			;1nivHoodBearOrnateSteelBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED4, sWICPluginName))			;1nivHoodBearOrnateSteelCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED5, sWICPluginName))			;1nivHoodBearOrnateSteelSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013200, sWICPluginName))			;1nivHoodBearOrnateStuddedBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013201, sWICPluginName))			;1nivHoodBearOrnateStuddedCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013202, sWICPluginName))			;1nivHoodBearOrnateStuddedSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010038F7, sWICPluginName))			;1nivHoodBearTrimBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010038F8, sWICPluginName))			;1nivHoodBearTrimCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010038F9, sWICPluginName))			;1nivHoodBearTrimSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED6, sWICPluginName))			;1nivHoodBearTrimSteelBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED7, sWICPluginName))			;1nivHoodBearTrimSteelCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101AED8, sWICPluginName))			;1nivHoodBearTrimSteelSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013203, sWICPluginName))			;1nivHoodBearTrimStuddedBrown
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013204, sWICPluginName))			;1nivHoodBearTrimStuddedCave
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013205, sWICPluginName))			;1nivHoodBearTrimStuddedSnow
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C56C, sWICPluginName))			;1nivHoodWolfSkinComBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B48D, sWICPluginName))			;1nivHoodWolfSkinComSteelBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B48C, sWICPluginName))			;1nivHoodWolfSkinComSteelTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B48E, sWICPluginName))			;1nivHoodWolfSkinComSteelWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CF4, sWICPluginName))			;1nivHoodWolfSkinComStuddedBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CF5, sWICPluginName))			;1nivHoodWolfSkinComStuddedTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CF6, sWICPluginName))			;1nivHoodWolfSkinComStuddedWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C56B, sWICPluginName))			;1nivHoodWolfSkinComTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C56D, sWICPluginName))			;1nivHoodWolfSkinComWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01015835, sWICPluginName))			;1nivHoodWolfSkinRareBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B48A, sWICPluginName))			;1nivHoodWolfSkinRareSteelBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B489, sWICPluginName))			;1nivHoodWolfSkinRareSteelTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B48B, sWICPluginName))			;1nivHoodWolfSkinRareSteelWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01015838, sWICPluginName))			;1nivHoodWolfSkinRareStuddedBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01015837, sWICPluginName))			;1nivHoodWolfSkinRareStuddedTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01015839, sWICPluginName))			;1nivHoodWolfSkinRareStuddedWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01015D9C, sWICPluginName))			;1nivHoodWolfSkinRareTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01015836, sWICPluginName))			;1nivHoodWolfSkinRareWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C56F, sWICPluginName))			;1nivHoodWolfSkinTrimBBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B490, sWICPluginName))			;1nivHoodWolfSkinTrimBSteelBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B48F, sWICPluginName))			;1nivHoodWolfSkinTrimBSteelTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B491, sWICPluginName))			;1nivHoodWolfSkinTrimBSteelWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CF7, sWICPluginName))			;1nivHoodWolfSkinTrimBStuddedBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CF8, sWICPluginName))			;1nivHoodWolfSkinTrimBStuddedTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CF9, sWICPluginName))			;1nivHoodWolfSkinTrimBStuddedWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C56E, sWICPluginName))			;1nivHoodWolfSkinTrimBTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C570, sWICPluginName))			;1nivHoodWolfSkinTrimBWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01016300, sWICPluginName))			;1nivHoodWolfSkinTrimRareBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101BA04, sWICPluginName))			;1nivHoodWolfSkinTrimRareSteelBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101BA03, sWICPluginName))			;1nivHoodWolfSkinTrimRareSteelTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101BA05, sWICPluginName))			;1nivHoodWolfSkinTrimRareSteelWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01016302, sWICPluginName))			;1nivHoodWolfSkinTrimRareStuddedBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01016303, sWICPluginName))			;1nivHoodWolfSkinTrimRareStuddedTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01016304, sWICPluginName))			;1nivHoodWolfSkinTrimRareStuddedWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01015D9D, sWICPluginName))			;1nivHoodWolfSkinTrimRareTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01016301, sWICPluginName))			;1nivHoodWolfSkinTrimRareWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C572, sWICPluginName))			;1nivHoodWolfSkinTrimWBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B493, sWICPluginName))			;1nivHoodWolfSkinTrimWSteelBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B492, sWICPluginName))			;1nivHoodWolfSkinTrimWSteelTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0101B494, sWICPluginName))			;1nivHoodWolfSkinTrimWSteelWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CFA, sWICPluginName))			;1nivHoodWolfSkinTrimWStuddedBlack
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CFB, sWICPluginName))			;1nivHoodWolfSkinTrimWStuddedTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01013CFC, sWICPluginName))			;1nivHoodWolfSkinTrimWStuddedWhite
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C571, sWICPluginName))			;1nivHoodWolfSkinTrimWTimber
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0100C573, sWICPluginName))			;1nivHoodWolfSkinTrimWWhite
endFunction

function WICLoadUpCloaks()

	;Determine if Winter is Coming is loaded, and if so, from which plug-in
	
	string sWICPluginName
	bool bIsLoaded
	bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaks.esp")
	if !bIsLoaded
		bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaksNoGuards.esp")
		if !bIsLoaded
			bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaksCRAFT.esp")
			if !bIsLoaded
				return
			else
				sWICPluginName = "1nivWICCloaksCRAFT.esp"
			endif
		else
			sWICPluginName = "1nivWICCloaksNoGuards.esp"
		endif
	else
		sWICPluginName = "1nivWICCloaks.esp"
	endif
	
	;==========FUR CLOAKS===========
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01001DD7, sWICPluginName))			;1nivCloakBearClawComBrown
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB5C, sWICPluginName))			;1nivCloakBearClawComBrownEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB6F, sWICPluginName))			;1nivCloakBearClawComBrownEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100233C, sWICPluginName))			;1nivCloakBearClawComCave
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB5E, sWICPluginName))			;1nivCloakBearClawComCaveEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB70, sWICPluginName))			;1nivCloakBearClawComCaveEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100233D, sWICPluginName))			;1nivCloakBearClawComSnow
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB5F, sWICPluginName))			;1nivCloakBearClawComSnowEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB71, sWICPluginName))			;1nivCloakBearClawComSnowEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002341, sWICPluginName))			;1nivCloakBearClawOrnateBrown
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB60, sWICPluginName))			;1nivCloakBearClawOrnateBrownEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB72, sWICPluginName))			;1nivCloakBearClawOrnateBrownEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002342, sWICPluginName))			;1nivCloakBearClawOrnateCave
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB61, sWICPluginName))			;1nivCloakBearClawOrnateCaveEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB73, sWICPluginName))			;1nivCloakBearClawOrnateCaveEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002343, sWICPluginName))			;1nivCloakBearClawOrnateSnow
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB62, sWICPluginName))			;1nivCloakBearClawOrnateSnowEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB74, sWICPluginName))			;1nivCloakBearClawOrnateSnowEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100233E, sWICPluginName))			;1nivCloakBearClawTrimBrown
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB63, sWICPluginName))			;1nivCloakBearClawTrimBrownEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB75, sWICPluginName))			;1nivCloakBearClawTrimBrownEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100233F, sWICPluginName))			;1nivCloakBearClawTrimCave
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB64, sWICPluginName))			;1nivCloakBearClawTrimCaveEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB76, sWICPluginName))			;1nivCloakBearClawTrimCaveEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002340, sWICPluginName))			;1nivCloakBearClawTrimSnow
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB65, sWICPluginName))			;1nivCloakBearClawTrimSnowEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB77, sWICPluginName))			;1nivCloakBearClawTrimSnowEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002345, sWICPluginName))			;1nivCloakWolfSkinComBlack
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB66, sWICPluginName))			;1nivCloakWolfSkinComBlackEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB78, sWICPluginName))			;1nivCloakWolfSkinComBlackEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002344, sWICPluginName))			;1nivCloakWolfSkinComTimber
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB67, sWICPluginName))			;1nivCloakWolfSkinComTimberEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB79, sWICPluginName))			;1nivCloakWolfSkinComTimberEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002346, sWICPluginName))			;1nivCloakWolfSkinComWhite
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB68, sWICPluginName))			;1nivCloakWolfSkinComWhiteEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB7A, sWICPluginName))			;1nivCloakWolfSkinComWhiteEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0101117E, sWICPluginName))			;1nivCloakWolfSkinRareBlack
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01011180, sWICPluginName))			;1nivCloakWolfSkinRareBlackEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01011183, sWICPluginName))			;1nivCloakWolfSkinRareBlackEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0101117D, sWICPluginName))			;1nivCloakWolfSkinRareTimber
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01011181, sWICPluginName))			;1nivCloakWolfSkinRareTimberEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01011184, sWICPluginName))			;1nivCloakWolfSkinRareTimberEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0101117F, sWICPluginName))			;1nivCloakWolfSkinRareWhite
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01011182, sWICPluginName))			;1nivCloakWolfSkinRareWhiteEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01011185, sWICPluginName))			;1nivCloakWolfSkinRareWhiteEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100234A, sWICPluginName))			;1nivCloakWolfSkinTrimBBlack
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB69, sWICPluginName))			;1nivCloakWolfSkinTrimBBlackEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB7B, sWICPluginName))			;1nivCloakWolfSkinTrimBBlackEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100234B, sWICPluginName))			;1nivCloakWolfSkinTrimBTimber
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB6A, sWICPluginName))			;1nivCloakWolfSkinTrimBTimberEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB7C, sWICPluginName))			;1nivCloakWolfSkinTrimBTimberEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100234C, sWICPluginName))			;1nivCloakWolfSkinTrimBWhite
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB6B, sWICPluginName))			;1nivCloakWolfSkinTrimBWhiteEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB7D, sWICPluginName))			;1nivCloakWolfSkinTrimBWhiteEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002348, sWICPluginName))			;1nivCloakWolfSkinTrimWBlack
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB6C, sWICPluginName))			;1nivCloakWolfSkinTrimWBlackEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB7E, sWICPluginName))			;1nivCloakWolfSkinTrimWBlackEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002347, sWICPluginName))			;1nivCloakWolfSkinTrimWTimber
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB6D, sWICPluginName))			;1nivCloakWolfSkinTrimWTimberEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB7F, sWICPluginName))			;1nivCloakWolfSkinTrimWTimberEnchM
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x01002349, sWICPluginName))			;1nivCloakWolfSkinTrimWWhite
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB6E, sWICPluginName))			;1nivCloakWolfSkinTrimWWhiteEnchF
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0100DB80, sWICPluginName))			;1nivCloakWolfSkinTrimWWhiteEnchM
endFunction

function WACLoadUpCloaks()
	;=========CLOAK FUR============
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02065A7C, "WetandCold.esp"))			;Travel Cloak, Gray Fur
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02065518, "WetandCold.esp"))			;Travel Cloak, Fur
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02065A80, "WetandCold.esp"))			;Travel Cloak, Brown Fur
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0207D8D9, "WetandCold.esp"))			;New cloak
endFunction

function WACLoadUp()
	;==========HEAD FULL===========
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02023DE4, "WetandCold.esp"))			;<_WetHoodFur1> "Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02023DE6, "WetandCold.esp"))			;<_WetHoodFur1_White> "Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02023DE5, "WetandCold.esp"))			;<_WetHoodFur1_Black> "Fur Hood"
endFunction

function COSDGLoadUp()

	string sCOSDGPluginName
	bool bIsLoaded
	bIsLoaded = Game.GetFormFromFile(0x00000D64, "Cloaks - Dawnguard.esp")
	if !bIsLoaded
		bIsLoaded = Game.GetFormFromFile(0x00000D64, "Cloaks - Player Only - Dawnguard.esp")
		if !bIsLoaded
			bIsLoaded = Game.GetFormFromFile(0x00000D64, "Cloaks - No Imperial - Dawnguard.esp")
			if !bIsLoaded
				return
			else
				sCOSDGPluginName = "Cloaks - No Imperial - Dawnguard.esp"
			endif
		else
			sCOSDGPluginName = "Cloaks - Player Only - Dawnguard.esp"
		endif
	else
		sCOSDGPluginName = "Cloaks - Dawnguard.esp"
	endif

	;==========LINEN CLOAKS===========
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x00000D64, sCOSDGPluginName))		; <CloakDawnguard>
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x00000D65, sCOSDGPluginName))		; <CloakShortDawnguard>

endFunction

function COSLoadUp()
	
	string sCOSPluginName
	bool bIsLoaded
	bIsLoaded = Game.GetFormFromFile(0x0200F615, "Cloaks.esp")
	if !bIsLoaded
		bIsLoaded = Game.GetFormFromFile(0x0200F615, "Cloaks - Player Only.esp")
		if !bIsLoaded
			bIsLoaded = Game.GetFormFromFile(0x0200F615, "Cloaks - No Imperial.esp")
			if !bIsLoaded
				return
			else
				sCOSPluginName = "Cloaks - No Imperial.esp"
			endif
		else
			sCOSPluginName = "Cloaks - Player Only.esp"
		endif
	else
		sCOSPluginName = "Cloaks.esp"
	endif
	
	;==========BURLAP CLOAKS===========
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200E57B, sCOSPluginName))		; <CloakForswornAlt> "Cloak - Forsworn"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200CFDD, sCOSPluginName))		; <CloakBurned> "Cloak of the Burned"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200BFB2, sCOSPluginName))		; <CloakAshlander1> "Ashlander's Tribal Wrap - Urshilaku"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02008440, sCOSPluginName))		; <CloakHjarvoBlanket> "Hjarvo's Blanket"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F616, sCOSPluginName))		; <CloakDwemerCeremonial> "Cloak - Dwemer Ceremonial"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F601, sCOSPluginName))		; <CloakAshlander2> "Ashlander's Tribal Wrap - Zanaib"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F094, sCOSPluginName))		; <CloakNecroAlt> "Cloak - Necromancer"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02006EA7, sCOSPluginName))		; <CloakDwemer> "Cloak - Tattered Dwemer"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02006EA9, sCOSPluginName))		; <CloakDwemerAlt> "Cloak - Dwemer"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200CFE5, sCOSPluginName))		; <CloakWarmSands> "On Warm Sands"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02010644, sCOSPluginName))		; <CloakDragonPriest> "Cloak - Dragon Priest"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200E57F, sCOSPluginName))		; <CloakWildHunt> "The Wild Hunt"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F093, sCOSPluginName))		; <CloakNecro> "Cloak - Necromancer"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x020126C0, sCOSPluginName))		; <CloakShortLover> "Cape of the Lover"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x020126BF, sCOSPluginName))		; <CloakShortRedEagle> "Cape of the Red Eagle"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012C38, sCOSPluginName))		; <CloakShortBlackTalos> "Cape - Talos"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012C36, sCOSPluginName))		; <CloakShortSilverhand> "Cape - Silver Hand"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012C34, sCOSPluginName))		; <CloakShortStormcloak> "Cape - Stormcloak"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012C32, sCOSPluginName))		; <CloakShortMossy> "Mossy Wrap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0201213D, sCOSPluginName))		; <CloakDPOtar> "Cloak of Otar the Mad"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0201213E, sCOSPluginName))		; <CloakDPVokun> "Cloak of Vokun"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0201213F, sCOSPluginName))		; <CloakDPVolsung> "Cloak of Volsung"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012140, sCOSPluginName))		; <CloakDPRahgot> "Cloak of Rahgot"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0201213B, sCOSPluginName))		; <CloakDPKrosis> "Cloak of Krosis"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0201213C, sCOSPluginName))		; <CloakDPMorokei> "Cloak of Morokei"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02010BA8, sCOSPluginName))		; <CloakDPHevnoraak> "Cloak of Hevnoraak"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02010BAA, sCOSPluginName))		; <CloakDPNahkriin> "Cloak of Nahkriin"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F603, sCOSPluginName))		; <CloakBlackBurlap> "Cloak - Black Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F604, sCOSPluginName))		; <CloakBlueBurlap> "Cloak - Blue Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F605, sCOSPluginName))		; <CloakBrownBurlap> "Cloak - Brown Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F606, sCOSPluginName))		; <CloakCrimsonBurlap> "Cloak - Crimson Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F607, sCOSPluginName))		; <CloakGreenBurlap> "Cloak - Green Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F608, sCOSPluginName))		; <CloakGreyBurlap> "Cloak - Grey Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0200F609, sCOSPluginName))		; <CloakWhiteBurlap> "Cloak - White Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0201214E, sCOSPluginName))		; <CloakShortBlueBurlap> "Cape - Blue Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0201214F, sCOSPluginName))		; <CloakShortBlackBurlap> "Cape - Black Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012152, sCOSPluginName))		; <CloakShortBrownBurlap> "Cape - Brown Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012154, sCOSPluginName))		; <CloakShortCrimsonBurlap> "Cape - Crimson Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012156, sCOSPluginName))		; <CloakShortGreenBurlap> "Cape - Green Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x02012158, sCOSPluginName))		; <CloakShortGreyBurlap> "Cape - Grey Burlap"
	FrostfallArmor.ArrayAddFormXT("cloak burlap", Game.GetFormFromFile(0x0201215A, sCOSPluginName))		; <CloakShortWhiteBurlap> "Cape - White Burlap"
	
	;==========LINEN CLOAKS===========
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200E57C, sCOSPluginName))		; <CloakImperialGold> "Cloak - Imperial Gold"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02009F51, sCOSPluginName))		; <CloakKvatch> "Kvatch Guard Cloak"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200B4EC, sCOSPluginName))		; <CloakVaermina> "Vaermina's Devotion"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02007EDC, sCOSPluginName))		; <CloakFallWinterhold> "The Fall of Winterhold"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x020063CF, sCOSPluginName))		; <CloakThalmorAlt> "Cloak - Thalmor"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005E69, sCOSPluginName))		; <CloakThalmor> "Cloak - Thalmor"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x020063D0, sCOSPluginName))		; <CloakThalmorAltEnch> "Cloak - Thalmor"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200E57D, sCOSPluginName))		; <CloakImperialSilver> "Cloak - Imperial Silver"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200F613, sCOSPluginName))		; <CloakDwemerPurple> "Cloak - Dwemer Purple"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200CFE7, sCOSPluginName))		; <CloakSolitudeLinen> "Cloak - Solitude Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200A4BC, sCOSPluginName))		; <CloakMarkarthLinen> "Cloak - Markarth Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200A4BA, sCOSPluginName))		; <CloakFalkreathLinen> "Cloak - Falkreath Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02009486, sCOSPluginName))		; <CloakRiftenLinen> "Cloak - Riften Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005902, sCOSPluginName))		; <CloakLinenBrownHealth02> "Cloak of Eminent Health - Brown Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005384, sCOSPluginName))		; <CloakWhiterunLinen> "Cloak - Whiterun Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200538E, sCOSPluginName))		; <CloakBrownLinen> "Cloak - Brown Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0200538F, sCOSPluginName))		; <CloakCrimsonLinen> "Cloak - Crimson Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005390, sCOSPluginName))		; <CloakDawnstarLinen> "Cloak - Dawnstar Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005391, sCOSPluginName))		; <CloakGreenLinen> "Cloak - Green Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005392, sCOSPluginName))		; <CloakGreyLinen> "Cloak - Grey Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005393, sCOSPluginName))		; <CloakHjaalmarchLinen> "Cloak - Hjaalmarch Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005394, sCOSPluginName))		; <CloakStormcloakLinen> "Cloak - Stormcloak Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005395, sCOSPluginName))		; <CloakWhiteLinen> "Cloak - White Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005383, sCOSPluginName))		; <CloakBlackLinen> "Cloak - Black Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005901, sCOSPluginName))		; <CloakLinenBrownHealth01> "Cloak of Health - Brown Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02005900, sCOSPluginName))		; <CloakLinenBlackResist02> "Cloak of Magic Suppression - Black Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x020058FF, sCOSPluginName))		; <CloakLinenBlackResist01> "Cloak of Magic Resist - Black Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x020063D5, sCOSPluginName))		; <CloakBlueLinen> "Cloak - Blue Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x020063DB, sCOSPluginName))		; <CloakWinterholdLinen> "Cloak - Winterhold Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02011BD2, sCOSPluginName))		; <CloakShortBlack> "Cape - Black Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02012150, sCOSPluginName))		; <CloakShortBlue> "Cape - Blue Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02012151, sCOSPluginName))		; <CloakShortBrown> "Cape - Brown Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02012153, sCOSPluginName))		; <CloakShortCrimson> "Cape - Crimson Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02012155, sCOSPluginName))		; <CloakShortGreen> "Cape - Green Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02012157, sCOSPluginName))		; <CloakShortGrey> "Cape - Grey Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x02012159, sCOSPluginName))		; <CloakShortWhite> "Cape - White Linen"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x020147BF, sCOSPluginName))		; <CloakShortCollege> CoS 1.1
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x021047C0, sCOSPluginName))		; <CloakShortDawnstar> CoS 1.1
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x021047C1, sCOSPluginName))		; <CloakShortFalkreath> CoS 1.1
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x021047C2, sCOSPluginName))		; <CloakShortHjaalmarch> CoS 1.1
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x021047C3, sCOSPluginName))		; <CloakShortMarkarth> CoS 1.1
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x021047C4, sCOSPluginName))		; <CloakShortRiften> CoS 1.1
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x021047C5, sCOSPluginName))		; <CloakShortSolitude> CoS 1.1
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x021047C6, sCOSPluginName))		; <CloakShortWhiterun> CoS 1.1
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x021047C7, sCOSPluginName))		; <CloakShortWinterhold> CoS 1.1
		
	;==========HIDE CLOAKS===========
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x0200C516, sCOSPluginName))		; <CloakForsworn> "Cloak - Forsworn"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x0200CFE3, sCOSPluginName))		; <CloakNorthPaladin> "Cloak of the Northern Paladin"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02009480, sCOSPluginName))		; <CloakHuntersFolly> "Hunter's Folly"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02007412, sCOSPluginName))		; <CloakCrow> "Cloak of the Crow"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02007976, sCOSPluginName))		; <CloakNya> "Nyartuk's Mantle"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02007978, sCOSPluginName))		; <CloakGreyFox> "Shroud of the Grey Fox"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02005E6A, sCOSPluginName))		; <CloakGreybeard> "Greybeard Mantle"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020012D4, sCOSPluginName))		; <CloakBrownHealth01> "Cloak of Health - Brown"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020012D6, sCOSPluginName))		; <CloakBlackResist01> "Cloak of Magic Resist - Black"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020012D7, sCOSPluginName))		; <CloakBlackResist02> "Cloak of Magic Suppression - Black"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020012D5, sCOSPluginName))		; <CloakBrownHealth02> "Cloak of Eminent Health - Brown"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x0200F615, sCOSPluginName))		; <CloakDwemerPurpleAlt> "Cloak - Dwemer Purple"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x0200A4BB, sCOSPluginName))		; <CloakMarkarth> "Cloak - Markarth Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x0200A4B9, sCOSPluginName))		; <CloakFalkreath> "Cloak - Falkreath Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02009485, sCOSPluginName))		; <CloakRiften> "Cloak - Riften Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020063D2, sCOSPluginName))		; <CloakBlue> "Cloak - Blue Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020048B9, sCOSPluginName))		; <CloakHjaalmarch> "Cloak - Hjaalmarch Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020048BA, sCOSPluginName))		; <CloakDawnstar> "Cloak - Dawnstar Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02000D6B, sCOSPluginName))		; <CloakCrimson> "Cloak - Crimson Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02000D68, sCOSPluginName))		; <CloakGreen> "Cloak - Green Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02002864, sCOSPluginName))		; <CloakStormcloak> "Cloak - Stormcloak Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02000D67, sCOSPluginName))		; <CloakBlack> "Cloak - Black Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02000D66, sCOSPluginName))		; <CloakBrown> "Cloak - Brown Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02000D69, sCOSPluginName))		; <CloakGrey> "Cloak - Grey Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02004353, sCOSPluginName))		; <CloakWhite> "Cloak - White Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x02005903, sCOSPluginName))		; <CloakWhiterun> "Cloak - Whiterun Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020063DA, sCOSPluginName))		; <CloakWinterhold> "Cloak - Winterhold Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x020063DC, sCOSPluginName))		; <CloakSolitude> "Cloak - Solitude Hide"
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x0200E012, sCOSPluginName))		; <CloakHimirHide> "Himir's Hide"
	
	;Cloaks of Skyrim 1.2
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x000172F1, sCOSPluginName))		; <CloakDaedric>
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x00018881, sCOSPluginName))		; <CloakComp>
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x00015D65, sCOSPluginName))		; <CloakShortImperial>
	FrostfallArmor.ArrayAddFormXT("cloak hide", Game.GetFormFromFile(0x000172F1, sCOSPluginName))		; <CloakScale>

endFunction
	
function NFHLoadUp()
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048DF, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNsLtWhite> "Padded Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048DE, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNsLtBlack> "Padded Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048DD, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNsLt> "Padded Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048DC, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNsHvWhite> "Armored Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048DB, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNsHvBlack> "Armored Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048DA, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNsHv> "Armored Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048D9, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNsBlack> "Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048D8, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNs> "Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01001D8F, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodLtWhite> "Padded Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010022F5, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodHvBlack> "Armored Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010BA99B, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodLt> "Padded Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01001D8E, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodWhite> "Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010BA99A, "Northborn Fur Hoods.esp"))		; <ArmorFurHood> "Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010022FD, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodLtBlack> "Padded Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010022FC, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodBlack> "Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010BA99C, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodHv> "Armored Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x01001829, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodHvWhite> "Armored Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x010048E0, "Northborn Fur Hoods.esp"))		; <ArmorFurHoodNsWhite> "Fur Hood (White)"
endFunction

function IMALoadUp()
	;==========CLOAK LINEN===========
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x03002DD5, "hothtrooper44_ArmorCompilation.esp"))	; <SeadogCape> "Seadog Cape"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x0300AB62, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorPaladinCuirass> "Paladin Armor"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x03000D6E, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorRedguardKnightScalemail> "Redguard Knight Heavy Mail"
	FrostfallArmor.ArrayAddFormXT("cloak linen", Game.GetFormFromFile(0x03000D6F, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorRedguardKnightScalemail2> "Redguard Knight Light Mail"
	;==========CLOAK FUR===========
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0300AB66, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorStormHeroCuirass> "Heroic Stormcloak Armor"
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x03000D77, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondArmor> "Vagabond Armor"
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x03000D78, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondArmor2> "Vagabond Leather Armor"
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x03000D79, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondArmorGrey> "Vagabond Grey Armor"
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x030232F5, "hothtrooper44_ArmorCompilation.esp")) ; Snow Bear Armor
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0306A9F0, "hothtrooper44_ArmorCompilation.esp")) ; Stormlord Armor
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x03023084, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Heavy
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0302308A, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Light
	;==========BODY FULL===========
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03000D77, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondArmor> "Vagabond Armor"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03000D78, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondArmor2> "Vagabond Leather Armor"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03000D79, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondArmorGrey> "Vagabond Grey Armor"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03000D84, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVanguardCuirass> "Vanguard Armor"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03000D8A, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefBulwark> "Warchief Bulwark"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03000D8B, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefBulwarkLight> "Warchief Bulwark Light"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03000D8C, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefBulwarkLightNoSkullFemale> "Warchief Bulwark Light (No Skull Female)"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03000D8D, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefBulwarkNoSkullFemale> "Warchief Bulwark (No Skull Female)"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03003E38, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerTorsoVAR08> "Light Sons of Skyrim Cuirass (NB)"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03003E37, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerTorsoVAR07> "Light Einherjar Cuirass (NB)"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03003E36, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerTorsoVAR06> "Light Sons of Skyrim Cuirass"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03003E35, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerTorsoVAR05> "Light Einherjar Cuirass"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03002888, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerTorsoVar04> "Sons of Skyrim Cuirass (NB)"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x030012D8, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerTorsoVar03> "Einherjar Armor (NB)"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x030012D4, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerTorsoVar02> "Sons of Skyrim Cuirass"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0300803E, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerTorsoVar01> "Einherjar Armor"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03003885, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorhunterCuirass> "Hunter Armor"
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x030232F5, "hothtrooper44_ArmorCompilation.esp")) ; Snow Bear Armor
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0306A9F0, "hothtrooper44_ArmorCompilation.esp")) ; Stormlord Armor
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x03023084, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Heavy
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0302308A, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Light
	;==========HEAD FULL===========
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D80, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondHelmet> "Vagabond Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D81, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondHelmet2> "Vagabond Leather Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D82, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondHelmetGrey> "Vagabond Grey Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D86, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVanguardHelmet> "Vanguard Helmet"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D87, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVanguardHelmetCLOSED> "Vanguard Helmet Closed"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D88, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefBattlecrown2> "Warchief Battlecrown"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D89, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefBattlecrownlight2> "Warchief Battlecrown Light"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D90, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefHeaddress2> "Warchief Headdress"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03000D91, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefHeaddresslight2> "Warchief Headdress Light"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03003E34, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerHoodVar08> "Light Sons of Skyrim Hood (NB)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03003E33, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerHoodVar07> "Light Einherjar Hood (NB)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03003E32, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerHoodVar06> "Light Sons of Skyrim Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03003E31, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerHoodVar05> "Light Einherjar Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03002887, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerHoodVar04> "Sons of Skyrim Hood (NB)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030012D7, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerHoodVar03> "Einherjar Hood (NB)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030012D3, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerHoodVar02> "Sons of Skyrim Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0300803F, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerHoodVar01> "Einherjar Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03001D8E, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodWhite> "Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048E0, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNsWhite> "Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048DF, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNsLtWhite> "Padded Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048DE, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNsLtBlack> "Padded Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048DD, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNsLt> "Padded Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048DC, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNsHvWhite> "Armored Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048DB, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNsHvBlack> "Armored Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048DA, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNsHv> "Armored Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048D9, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNsBlack> "Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030048D8, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodNs> "Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03001D8F, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodLtWhite> "Padded Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030022FD, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodLtBlack> "Padded Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030BA99B, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodLt> "Padded Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03001829, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodHvWhite> "Armored Fur Hood (White)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030022F5, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodHvBlack> "Armored Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030BA99C, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodHv> "Armored Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030022FC, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHoodBlack> "Fur Hood (Black)"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030BA99A, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorFurHood> "Fur Hood"
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x030232F9, "hothtrooper44_ArmorCompilation.esp")) ; Snow Bear Armor
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0306A9F3, "hothtrooper44_ArmorCompilation.esp")) ; Stormlord Armor
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03023086, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Heavy Headdress
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03023088, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Heavy Helmet
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x03023087, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Heavy Mask
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0302308C, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Light Headdress
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0302308D, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Light Helmet
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0302308E, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Light Mask
	;==========HANDS FULL===========
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03000D7D, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondGauntlets> "Vagabond Gloves"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03000D7E, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondGauntlets2> "Vagabond Leather Gloves"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03000D7F, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondGauntletsGrey> "Vagabond Grey Gloves"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03000D85, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVanguardGauntlets> "Vanguard Gauntlets"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03000D8E, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefGrips> "Warchief Grips"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03000D8F, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefGripsLight> "Warchief Grips Light"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03003E30, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerGauntletsVAR08> "Light Sons of Skyrim Gauntlets (NB)"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03003E2F, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerGauntletsVAR07> "Light Einherjar Gauntlets (NB)"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03003E2E, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerGauntletsVAR06> "Light Sons of Skyrim Gauntlets"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03003E2D, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerGauntletsVAR05> "Light Einherjar Gauntlets"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03002886, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerGauntletsVAR04> "Sons of Skyrim Gauntlets (NB)"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x030012D6, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerGauntletsVAR03> "Einherjar Gauntlets (NB)"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x030012D2, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerGauntletsVAR02> "Sons of Skyrim Gauntlets"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03008040, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerGauntletsVAR01> "Einherjar Gauntlets"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03003884, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorhunterGauntlets> "Hunter Gauntlets"
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x030232F8, "hothtrooper44_ArmorCompilation.esp")) ; Snow Bear Armor
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0306A9F1, "hothtrooper44_ArmorCompilation.esp")) ; Stormlord Armor
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x03023085, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Heavy
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0302308B, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Light
	;==========FEET FULL===========
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03000D7A, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondBoots> "Vagabond Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03000D7B, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondBoots2> "Vagabond Leather Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03000D7C, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVagabondBootsGrey> "Vagabond Grey Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03000D83, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorVanguardBoots> "Vanguard Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03000D92, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefStompers> "Warchief Stompers"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03000D93, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorWarchiefStompersLight> "Warchief Stompers Light"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03003E2C, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerBootsVAR08> "Light Sons of Skyrim Boots (NB)"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03003E2B, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerBootsVAR07> "Light Einherjar Boots (NB)"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03003E2A, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerBootsVAR06> "Light Sons of Skryrim Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03003E29, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerBootsVAR05> "Light Einherjar Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03002885, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerBootsVAR04> "Sons of Skyrim Boots (NB)"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x030012D5, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerBootsVAR03> "Einherjar Boots (NB)"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x030012D1, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerBootsVAR02> "Sons of Skyrim Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03000D68, "hothtrooper44_ArmorCompilation.esp"))	; <OS_EinherjerBootsVAR01> "Einherjar Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03003882, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorhunterBoots> "Hunter Boots"
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x030232F7, "hothtrooper44_ArmorCompilation.esp")) ; Snow Bear Armor
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0306A9F2, "hothtrooper44_ArmorCompilation.esp")) ; Stormlord Armor
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03023083, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Heavy
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x03023089, "hothtrooper44_ArmorCompilation.esp")) ; Trollsbane Light
	;==========BODY LIMITED===========
	FrostfallArmor.ArrayAddFormXT("body limited", Game.GetFormFromFile(0x03005A6F, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorRangerCuirass> "Ranger Armor"
	FrostfallArmor.ArrayAddFormXT("body limited", Game.GetFormFromFile(0x03005A5C, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorBarbarianCuirass> "Barbarian Armor"
	FrostfallArmor.ArrayAddFormXT("body limited", Game.GetFormFromFile(0x03005A42, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorANBLightCuirass> "Ancient Nord Barbarian Cuirass"
	FrostfallArmor.ArrayAddFormXT("body limited", Game.GetFormFromFile(0x03005A3E, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorANBHeavyCuirass> "Ancient Nord Barbarian Plate"
	FrostfallArmor.ArrayAddFormXT("body limited", Game.GetFormFromFile(0x030230EA, "hothtrooper44_ArmorCompilation.esp"))	; Barbarian Hero
	;==========HEAD LIMITED===========
	FrostfallArmor.ArrayAddFormXT("head limited", Game.GetFormFromFile(0x03005A71, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorRangerHelmet> "Ranger Helmet"
	FrostfallArmor.ArrayAddFormXT("head limited", Game.GetFormFromFile(0x03005A5E, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorBarbarianHelmet> "Barbarian Helmet"
	FrostfallArmor.ArrayAddFormXT("head limited", Game.GetFormFromFile(0x03005A44, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorANBLightHelmet> "Ancient Nord Barbarian Hood"
	FrostfallArmor.ArrayAddFormXT("head limited", Game.GetFormFromFile(0x03005A40, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorANBHeavyHelmet> "Ancient Nord Barbarian Helmet"
	FrostfallArmor.ArrayAddFormXT("head limited", Game.GetFormFromFile(0x030230E9, "hothtrooper44_ArmorCompilation.esp"))	; Barbarian Hero
	;==========HANDS LIMITED===========
	FrostfallArmor.ArrayAddFormXT("hands limited", Game.GetFormFromFile(0x03005A70, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorRangerGauntlets> "Ranger Bracers"
	FrostfallArmor.ArrayAddFormXT("hands limited", Game.GetFormFromFile(0x03005A5D, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorBarbarianGauntlets> "Barbarian Gauntlets"
	FrostfallArmor.ArrayAddFormXT("hands limited", Game.GetFormFromFile(0x03005A43, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorANBLightGauntlets> "Ancient Nord Barbarian Gloves"
	FrostfallArmor.ArrayAddFormXT("hands limited", Game.GetFormFromFile(0x03005A3F, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorANBHeavyGauntlets> "Ancient Nord Barbarian Gauntlets"
	FrostfallArmor.ArrayAddFormXT("hands limited", Game.GetFormFromFile(0x030230E8, "hothtrooper44_ArmorCompilation.esp"))	; Barbarian Hero
	;==========FEET LIMITED===========
	FrostfallArmor.ArrayAddFormXT("feet limited", Game.GetFormFromFile(0x03005A6E, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorRangerBoots> "Ranger Boots"
	FrostfallArmor.ArrayAddFormXT("feet limited", Game.GetFormFromFile(0x03005A5B, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorBarbarianBoots> "Barbarian Boots"
	FrostfallArmor.ArrayAddFormXT("feet limited", Game.GetFormFromFile(0x03005A41, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorANBLightBoots> "Ancient Nord Barbarian Shoes"
	FrostfallArmor.ArrayAddFormXT("feet limited", Game.GetFormFromFile(0x03005A3D, "hothtrooper44_ArmorCompilation.esp"))	; <ArmorANBHeavyBoots> "Ancient Nord Barbarian Boots"
	FrostfallArmor.ArrayAddFormXT("feet limited", Game.GetFormFromFile(0x030230E7, "hothtrooper44_ArmorCompilation.esp"))	; Barbarian Hero
endFunction

function AEALoadUp()
	;==========CLOAK FUR===========
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02004E58, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0201fc25, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02017F10, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0201fc26, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02017f11, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x0201fc27, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02038fab, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02038fb0, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02038fac, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02038fb1, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02038fad, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("cloak fur", Game.GetFormFromFile(0x02038fb2, "AesirArmor.esp"))
	;==========BODY FULL===========
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x02017424, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0201ebee, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("body full", Game.GetFormFromFile(0x0200c029, "AesirArmor.esp"))
	;==========HEAD FULL===========
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0203c5fe, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0203c5ff, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0203c600, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0203c601, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0200288b, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x0201fc82, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020048f2, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020201e5, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020048f3, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020201e7, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020048f4, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020201e6, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b1, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b2, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b3, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b4, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b5, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b6, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b7, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b8, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338b9, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02033e2a, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338ba, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02033e2b, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338bb, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02033e2c, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338c0, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02033e2d, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338bf, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02033e2e, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338bc, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02033e2f, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338bd, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02033e30, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x020338be, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("head full", Game.GetFormFromFile(0x02033e31, "AesirArmor.esp"))
	;==========HANDS FULL==========
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x0200c02b, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x02007b32, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("hands full", Game.GetFormFromFile(0x020201e9, "AesirArmor.esp"))
	;==========FEET FULL===========
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x02007b35, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x020201e8, "AesirArmor.esp"))
	FrostfallArmor.ArrayAddFormXT("feet full", Game.GetFormFromFile(0x0200c02a, "AesirArmor.esp"))
endFunction

function KNAPLoadUp()

	_DE_TravelAxe01_0 = Game.GetFormFromFile(0x03000D62, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_0
	_DE_TravelAxe01_1 = Game.GetFormFromFile(0x03000D64, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_1
	_DE_TravelAxe01_2 = Game.GetFormFromFile(0x03000D69, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_2
	_DE_TravelAxe01_3 = Game.GetFormFromFile(0x03000D6A, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_3
	_DE_TravelAxe01_4 = Game.GetFormFromFile(0x03000D6B, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_4
	_DE_TravelAxe01_5 = Game.GetFormFromFile(0x03000D6C, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_5
	_DE_TravelAxe01_6 = Game.GetFormFromFile(0x03000D6D, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_6
	_DE_TravelAxe01_7 = Game.GetFormFromFile(0x03000D6E, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_7
	_DE_TravelAxe01_8 = Game.GetFormFromFile(0x03000D6F, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_8
	_DE_TravelAxe01_9 = Game.GetFormFromFile(0x03000D70, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_9
	_DE_TravelAxe01_10 = Game.GetFormFromFile(0x03000D71, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_10
	_DE_TravelAxe01_11 = Game.GetFormFromFile(0x03000D72, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_11
	_DE_TravelAxe01_12 = Game.GetFormFromFile(0x03000D73, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_12
	_DE_TravelAxe01_13 = Game.GetFormFromFile(0x03000D74, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_13
	_DE_TravelAxe01_14 = Game.GetFormFromFile(0x03000D75, "KnapsackEnhanced.esp") as Weapon			;_DE_TravelAxe01_14
	_DE_TravelAxe = Game.GetFormFromFile(0x03000D78, "KnapsackEnhanced.esp") as Weapon				;_DE_TravelAxe
	_DE_TravelAxeBroken = Game.GetFormFromFile(0x03000D7E, "KnapsackEnhanced.esp") as MiscObject	;_DE_TravelAxeBroken
	
	if !woodChoppingAxes.HasForm(_DE_TravelAxe)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_0)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_1)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_2)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_3)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_4)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_5)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_6)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_7)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_8)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_9)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_10)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_11)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_12)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_13)
		woodChoppingAxes.AddForm(_DE_TravelAxe01_14)
		woodChoppingAxes.AddForm(_DE_TravelAxe)
	endif
	
	if !_DE_Axes.HasForm(_DE_TravelAxe)
		_DE_Axes.AddForm(_DE_TravelAxe01_0)
		_DE_Axes.AddForm(_DE_TravelAxe01_1)
		_DE_Axes.AddForm(_DE_TravelAxe01_2)
		_DE_Axes.AddForm(_DE_TravelAxe01_3)
		_DE_Axes.AddForm(_DE_TravelAxe01_4)
		_DE_Axes.AddForm(_DE_TravelAxe01_5)
		_DE_Axes.AddForm(_DE_TravelAxe01_6)
		_DE_Axes.AddForm(_DE_TravelAxe01_7)
		_DE_Axes.AddForm(_DE_TravelAxe01_8)
		_DE_Axes.AddForm(_DE_TravelAxe01_9)
		_DE_Axes.AddForm(_DE_TravelAxe01_10)
		_DE_Axes.AddForm(_DE_TravelAxe01_11)
		_DE_Axes.AddForm(_DE_TravelAxe01_12)
		_DE_Axes.AddForm(_DE_TravelAxe01_13)
		_DE_Axes.AddForm(_DE_TravelAxe01_14)
		_DE_Axes.AddForm(_DE_TravelAxe)
	endif
	
endFunction

function KNAPUnload()
	_DE_TravelAxe01_0 = none
	_DE_TravelAxe01_1 = none
	_DE_TravelAxe01_2 = none
	_DE_TravelAxe01_3 = none
	_DE_TravelAxe01_4 = none
	_DE_TravelAxe01_5 = none
	_DE_TravelAxe01_6 = none
	_DE_TravelAxe01_7 = none
	_DE_TravelAxe01_8 = none
	_DE_TravelAxe01_9 = none
	_DE_TravelAxe01_10 = none
	_DE_TravelAxe01_11 = none
	_DE_TravelAxe01_12 = none
	_DE_TravelAxe01_13 = none
	_DE_TravelAxe01_14 = none
	_DE_TravelAxe = none
	_DE_TravelAxeBroken = none
endFunction

bool function GetWICPluginLoaded()
	;Determine if Winter is Coming is loaded.
	bool bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaks.esp")
	if !bIsLoaded
		bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaksNoGuards.esp")
		if !bIsLoaded
			bIsLoaded = Game.GetFormFromFile(0x01001DD7, "1nivWICCloaksCRAFT.esp")
			if !bIsLoaded
				return false
			else
				return true
			endif
		else
			return true
		endif
	else
		return true
	endif
endFunction

bool function GetCOSPluginLoaded()
	;Determine if Cloaks of Skyrim is loaded.
	bool bIsLoaded = Game.GetFormFromFile(0x0200F615, "Cloaks.esp")
	if !bIsLoaded
		bIsLoaded = Game.GetFormFromFile(0x0200F615, "Cloaks - Player Only.esp")
		if !bIsLoaded
			bIsLoaded = Game.GetFormFromFile(0x0200F615, "Cloaks - No Imperial.esp")
			if !bIsLoaded
				return false
			else
				return true
			endif
		else
			return true
		endif
	else
		return true
	endif
endFunction

bool function GetCOSDGPluginLoaded()
	;Determine if Cloaks of Skyrim - Dawnguard is loaded.
	bool bIsLoaded
	bIsLoaded = Game.GetFormFromFile(0x00000D64, "Cloaks - Dawnguard.esp")
	if !bIsLoaded
		bIsLoaded = Game.GetFormFromFile(0x00000D64, "Cloaks - Player Only - Dawnguard.esp")
		if !bIsLoaded
			bIsLoaded = Game.GetFormFromFile(0x00000D64, "Cloaks - No Imperial - Dawnguard.esp")
			if !bIsLoaded
				return false
			else
				return true
			endif
		else
			return true
		endif
	else
		return true
	endif
endFunction


;#Region Future Mod Support Section
int function GetPlayerRegionTempDLC1(float flvLastPosX, float flvLastPosY)				;Forgotten Vale

	;Solve for the player's region in Falmer Valley
	if IsPointInPolygon(DLC1_FVBoss_PolyX, DLC1_FVBoss_PolyY, flvLastPosX, flvLastPosY) && PlayerRef.GetPositionZ() >= 8385.0	;Boss area
		;notification("[Frostfall] Current Region: Boss")
		return 20
	elseif IsPointInPolygon(DLC1_FVIce_PolyX, DLC1_FVIce_PolyY, flvLastPosX, flvLastPosY)				;Ice
		;notification("[Frostfall] Current Region: Ice")
		return -10
	elseif IsPointInPolygon(DLC1_FVCanyon_PolyX, DLC1_FVCanyon_PolyY, flvLastPosX, flvLastPosY)			;Canyon
		;notification("[Frostfall] Current Region: Canyon")
		return 12
	elseif IsPointInPolygon(DLC1_FVPlayground_PolyX, DLC1_FVPlayground_PolyY, flvLastPosX, flvLastPosY)	;Playground
		;notification("[Frostfall] Current Region: Playground")
		return -5
	elseif IsPointInPolygon(DLC1_FVGrove_PolyX, DLC1_FVGrove_PolyY, flvLastPosX, flvLastPosY)			;Grove
		;notification("[Frostfall] Current Region: Grove")
		return 1
	else
		;notification("[Frostfall] Current Region: Unknown!")
		return 10																						;Lookup failed
	endif

endFunction

int function GetPlayerRegionTempDLC2(float flvLastPosX, float flvLastPosY)				;Solstheim

	;Solve for the player's region in Solstheim
	if IsPointInPolygon(DLC2_Solstheim_PolyX, DLC2_Solstheim_PolyY, flvLastPosX, flvLastPosY)				;Ice
		;notification("[Frostfall] Current Region: Ice")
		return -10
	else
		return 16
	endif
endFunction

int function GetPlayerRegionTempDLC3(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempDLC4(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod1(float flvLastPosX, float flvLastPosY)				;Wyrmstooth
	if IsPointInPolygon(MOD1_Center_PolyX, MOD1_Center_PolyY, flvLastPosX, flvLastPosY)
		return 12
	elseif IsPointInPolygon(MOD1_West_PolyX, MOD1_Center_PolyY, flvLastPosX, flvLastPosY)
		return 9
	else
		return -10
	endif
endFunction
int function GetPlayerRegionTempMod2(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod3(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod4(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod5(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod6(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod7(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod8(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod9(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod10(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod11(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod12(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod13(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod14(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod15(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod16(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod17(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod18(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod19(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
int function GetPlayerRegionTempMod20(float flvLastPosX, float flvLastPosY)				;Future support
endFunction
;#EndRegion

function AddSpellBooks()
	if bAddedSpellBooks == false
		
		;0
		LItemSpellTomes00AllIllusion.AddForm(_DE_SpellTomeSoothe1, 1, 1)
		LItemSpellTomes00AllSpells.AddForm(_DE_SpellTomeSoothe1, 1, 1)
		LItemSpellTomes00Illusion.AddForm(_DE_SpellTomeSoothe1, 1, 1)
		LItemSpellTomes00Spells.AddForm(_DE_SpellTomeSoothe1, 1, 1)
		LItemScroll00Skill.AddForm(_DE_ScrollSoothe, 1, 1)

		;25
		LItemSpellTomes25AllAlteration.AddForm(_DE_SpellTomeFoxskin, 1, 1)
		LItemSpellTomes25Alteration.AddForm(_DE_SpellTomeFoxskin, 1, 1)
		LItemSpellTomes25AllIllusion.AddForm(_DE_SpellTomeSoothe2, 1, 1)
		LItemSpellTomes25Illusion.AddForm(_DE_SpellTomeSoothe2, 1, 1)
		LItemSpellTomes25AllConjuration.AddForm(_DE_SpellTomeBoundCloakLesser, 1, 1)
		LItemSpellTomes25Conjuration.AddForm(_DE_SpellTomeBoundCloakLesser, 1, 1)
		LItemScroll25Skill.AddForm(_DE_ScrollBask, 1, 1)
		LItemScroll25Skill.AddForm(_DE_ScrollFoxskin, 1, 1)
		LItemScroll25Skill.AddForm(_DE_ScrollBoundCloakLesser, 1, 1)

		;50
		LItemSpellTomes50AllAlteration.AddForm(_DE_SpellTomeWolfskin, 1, 1)
		LItemSpellTomes50Alteration.AddForm(_DE_SpellTomeWolfskin, 1, 1)
		LItemSpellTomes50Spells.AddForm(_DE_SpellTomeWolfskin, 1, 1)
		LitemSpellTomes50AllDestruction.AddForm(_DE_SpellTomeVaporBlast, 1, 1)
		LitemSpellTomes50Destruction.AddForm(_DE_SpellTomeVaporBlast, 1, 1)
		LItemSpellTomes50Spells.AddForm(_DE_SpellTomeVaporBlast, 1, 1)
		LItemSpellTomes50AllIllusion.AddForm(_DE_SpellTomeSoothe3, 1, 1)
		LItemSpellTomes50Illusion.AddForm(_DE_SpellTomeSoothe3, 1, 1)
		LItemSpellTomes50Spells.AddForm(_DE_SpellTomeSoothe3, 1, 1)
		LItemSpellTOmes50AllRestoration.AddForm(_DE_SpellTomeKindle, 1, 1)
		LItemSpellTOmes50Restoration.AddForm(_DE_SpellTomeKindle, 1, 1)
		LItemSpellTomes50Spells.AddForm(_DE_SpellTomeKindle, 1, 1)
		LItemSpellTomes50AllConjuration.AddForm(_DE_SpellTomeBoundCloakGreater, 1, 1)
		LItemSpellTomes50Conjuration.AddForm(_DE_SpellTomeBoundCloakGreater, 1, 1)
		LItemSpellTomes50Spells.AddForm(_DE_SpellTomeBoundCloakGreater, 1, 1)
		LItemScroll50Skill.AddForm(_DE_ScrollRevel, 1, 1)
		LItemScroll50Skill.AddForm(_DE_ScrollWolfskin, 1, 1)
		LItemScroll50Skill.AddForm(_DE_ScrollVaporBlast, 1, 1)
		LItemScroll50Skill.AddForm(_DE_ScrollKindle, 1, 1)
		LItemScroll50Skill.AddForm(_DE_ScrollBoundCloakGreater, 1, 1)

		;75
		LItemSpellTomes75AllConjuration.AddForm(_DE_SpellTomeConjureShelterLesser, 1, 1)
		LItemSpellTomes75Conjuration.AddForm(_DE_SpellTomeConjureShelterLesser, 1, 1)
		LItemSpellTomes75Spells.AddForm(_DE_SpellTomeConjureShelterLesser, 1, 1)
		LItemSpellTomes75AllAlteration.AddForm(_DE_SpellTomeTransmuteWood, 1, 1)
		LItemSpellTomes75Alteration.AddForm(_DE_SpellTomeTransmuteWood, 1, 1)
		LItemSpellTomes75Spells.AddForm(_DE_SpellTomeTransmuteWood, 1, 1)
		LItemSpellTomes75AllAlteration.AddForm(_DE_SpellTomeBearskin, 1, 1)
		LItemSpellTomes75Alteration.AddForm(_DE_SpellTomeBearskin, 1, 1)
		LItemSpellTomes75Spells.AddForm(_DE_SpellTomeBearskin, 1, 1)
		LItemScroll75Skill.AddForm(_DE_ScrollBearskin, 1, 1)
		LItemScroll75Skill.AddForm(_DE_ScrollConjureShelterLesser, 1, 1)

		;100
		LItemSpellTomes100Conjuration.AddForm(_DE_SpellTomeConjureShelterGreater, 1, 1)
		MGRitualConjurationBooks.AddForm(_DE_SpellTomeConjureShelterGreater, 1, 1)
		LItemScroll100Skill.AddForm(_DE_ScrollConjureShelterGreater, 1, 1)

		bAddedSpellBooks = true
	endif

endFunction

bool function IsPointInPolygon(float[] polyX, float[] polyY, float x, float y)

    ;-----------\
    ;Description \
    ;----------------------------------------------------------------
    ;Attempts to determine if a given point (x, y) lies inside the bounds of a polygon described as a series
    ;of ordered pairs described in the polyX[] and polyY[] arrays.
    ;If (x, y) lies exactly on one of the line segments, this functiom may return True or False.
    ;From http://alienryderflex.com/polygon/, converted to Papyrus by Chesko
    
    ;-------------\
    ;Return Values \
    ;----------------------------------------------------------------
    ;               True                            =                Point is inside polygon
    ;               False                           =              Point lies outside polygon OR polygon arrays are of different lengths

    ;float[] polyX = array that describes the polygon's x coordinates
    ;float[] polyY = array that describes the polygon's y coordinates
    ;float x           = the x coordinate under test
    ;float y           = the y coordinate under test
    
    ;Polygon arrays must be the same length
    if polyX.Length != polyY.Length
        return false
    endif
        
    int polySides = polyX.Length
    int i = 0
    int j = polySides - 1
    bool oddNodes = false

    while i < polySides
        if (((polyY[i] < y && polyY[j] >= y) || (polyY[j] < y && polyY[i] >= y)) && (polyX[i] <= x || polyX[j] <= x))
            if (polyX[i] + (y- polyY[i]) / (polyY[j] - polyY[i]) * (polyX[j] - polyX[i])) < x
                oddNodes = !oddNodes
            endif
        endif
        j = i
        i += 1
    endWhile
        
    return oddNodes

endFunction

function RegisterForKeysOnLoad()
	FFConfig.RegisterForKeysOnLoad()
endFunction