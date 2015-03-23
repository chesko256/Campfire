Scriptname _Camp_Compatibility extends ReferenceAlias

;#SUMMARY# =====================================================================================================================
; Name ...................: _Camp_Compatibility
; Attached To (EditorID)..: 
; Description ............: Checks for presence of other mods for compatibility purposes, and sets flags as appropriate.
; Author .................: Chesko
; Last Approved (version) : 1.0
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

import debug

;#PROPERTIES=====================================================================================================================
actor property PlayerRef auto
;#Scripts======================================================================
_Camp_SkyUIConfigPanelScript property CampConfig Auto 				;SkyUI Configuration script
_Camp_LegalAreaCheck property Legal Auto 							;Camping Legality script
_Camp_Main property Campfire auto 									;Main script
_Camp_ObjectPlacementThreadManager property PlacementSystem auto 	;Placement System Script

;#Official DLC=================================================================
bool property isDLC1Loaded auto	hidden						;Dawnguard
bool property isDLC2Loaded auto hidden						;Dragonborn
bool property isHFLoaded auto hidden						;Hearthfire

;#Supported Mods===============================================================
bool property isSKSELoaded auto hidden						;SKSE
bool property isSKYUILoaded auto hidden						;SkyUI 3.4+
bool property isLSLoaded auto hidden						;Last Seed
bool property isSKYRELoaded auto hidden						;Skyrim Redone
bool property isIMCNLoaded auto hidden						;Imp's More Complex Needs
bool property isRNDLoaded auto hidden			 			;Realistic Needs and Diseases

;#Leveled Lists================================================================
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
LeveledItem property LItemScroll25Skill auto
LeveledItem property LItemScroll50Skill auto
LeveledItem property LItemScroll75Skill auto
LeveledItem property LItemScroll100Skill auto

;#Spellbooks===================================================================
book property _DE_SpellTomeBoundCloakLesser auto
book property _DE_SpellTomeBoundCloakGreater auto
book property _DE_SpellTomeConjureShelterLesser auto
book property _DE_SpellTomeTransmuteWood auto
book property _DE_SpellTomeConjureShelterGreater auto

;#Scrolls======================================================================
scroll property _DE_ScrollBoundCloakLesser auto
scroll property _DE_ScrollBoundCloakGreater auto
scroll property _DE_ScrollConjureShelterLesser auto
scroll property _DE_ScrollConjureShelterGreater auto

;#Merchant Containers==========================================================
ObjectReference property MerchantRiverwoodTraderContainer auto

;#FormLists====================================================================
formlist property _DE_Trees auto							;List of valid trees for Wood Harvesting
formlist property _DE_WorldspacesInteriors auto				;Interior exception worldspace
formlist property _DE_ModWaterSkins auto 					;List of waterskins from other mods
formlist property _DE_LightableCampfires auto 				;List of small unlit campfires
formlist property _DE_LightableCampfiresAll auto 			;List of all unlit campfires
formlist property _DE_DeadwoodList auto
formlist property _Camp_HeatSources_All auto
formlist property _Camp_HeatSources_Fire auto
formlist property _Camp_HeatSources_Fire_Small auto
formlist property _Camp_HeatSources_Fire_Medium auto
formlist property _Camp_HeatSources_Fire_Large auto
formlist property _Camp_HeatSources_Other auto

;#Trees============================================================================
Tree property TreeReachTreeStump01 auto hidden

;#DLC / Mod Worldspaces============================================================
Worldspace property DLC2WS auto hidden						;Solstheim

;#SkyRe Perks======================================================================

Perk property Traveller_Rank1 auto hidden
Perk property Traveller_Rank2 auto hidden
Perk property Traveller_Rank3 auto hidden
Perk property Traveller_Rank4 auto hidden
Perk property Traveller_Rank5 auto hidden
Perk property Forestry_Rank1 auto hidden
Perk property Forestry_Rank2 auto hidden
Perk property Forestry_Rank3 auto hidden

;#Misc=============================================================================
message property _DE_CompatibilityFinished auto
Perk property _DE_DummyPerk auto
GlobalVariable property _DE_SKSEVersion auto
GlobalVariable property _DE_DLC1Loaded auto
GlobalVariable property _DE_HFLoaded auto
GlobalVariable property _DE_SKYRELoaded auto
GlobalVariable property _Camp_HotkeyCreateItem auto
GlobalVariable property _Camp_HotkeyBuildCampfire auto
GlobalVariable property _Camp_HotkeyHarvestWood auto

ConstructibleObject property _DE_RecipeSuppliesRockHF auto
ConstructibleObject property _DE_RecipeLeatherValeDeerHideDLC1 auto
ConstructibleObject property _DE_RecipeLeatherValeSabreCatHideDLC1 auto
ConstructibleObject property _DE_RecipeTanningLeatherValeDeerHideDLC1 auto
ConstructibleObject property _DE_RecipeTanningLeatherValeSabreCatHideDLC1 auto

Spell property _Camp_CreateItemSpell auto
Spell property _Camp_CampfireSpell auto
Spell property _Camp_HarvestWoodSpell auto

Spell property _Camp_LegacyConfig_Spell auto
formlist property woodChoppingAxes auto
Weather property DLC2AshStorm auto hidden
bool bAddedSpellBooks = false

Event OnPlayerLoadGame()
	RunCompatibility()
	RegisterForKeysOnLoad()
	RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()
endEvent

function RunCompatibility()
	VanillaGameLoadUp()
	RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()
	Campfire.CheckFollowerPolling()
	;****
	
	;debug.notification("[Frostfall]Compatibility startup check...")
	trace("============================================[Campfire: Warning Start]=============================================")
	trace("                                                                                                                  ")
	trace("               Campfire is now performing compatibility checks. Papyrus warnings about missing or                 ")
	trace("                        unloaded files may follow. This is NORMAL and can be ignored.   		                     ")
	trace("                                                                                                                  ")
	trace("============================================[Campfire: Warning Start]=====================-=======================")
	
	if isSKSELoaded
		isSKSELoaded = SKSE.GetVersion()
		if !isSKSELoaded
			;SKSE was removed since the last save.
			;Turn off SKSE-only features
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
			;Turn off SKSE-only features
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
		endif
	else
		isDLC2Loaded = Game.GetFormFromFile(0x0201FB99, "Dragonborn.esm")
		if isDLC2Loaded
			;DLC2 was just added.
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

	if isLSLoaded
		isLSLoaded = Game.GetFormFromFile(0x02000D63, "LastSeed.esp")
		if !isLSLoaded
			;Last Seed was removed since the last save.
		endif
	else
		isLSLoaded = Game.GetFormFromFile(0x02000D63, "LastSeed.esp")
		if isLSLoaded
			;Last Seed was just added.
		endif
	endif
	
	if isDLC1Loaded
		
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
		
		if !(_DE_WorldspacesInteriors.HasForm(DLC01WS05))
			_DE_WorldspacesInteriors.AddForm(DLC01WS05)
			_DE_WorldspacesInteriors.AddForm(DLC01WS06)
			_DE_WorldspacesInteriors.AddForm(DLC01WS07)
		endif
			
	endif

	if isDLC2Loaded
		
		;Heat sources
		form DLC02HeatForm01 = Game.GetFormFromFile(0x02018616, "Dragonborn.esm")		;Campfire01LandBurning_SnowRocks
		form DLC02HeatForm02 = Game.GetFormFromFile(0x02018619, "Dragonborn.esm")		;Campfire01LandBurning_LDirtSnowPath
		form DLC02HeatForm03 = Game.GetFormFromFile(0x0201A56A, "Dragonborn.esm")		;DLC2FXFlamingRockDebris
		form DLC02HeatForm04 = Game.GetFormFromFile(0x0201A56B, "Dragonborn.esm")		;DLC2FXFlamingRockDebrisSmall
		form DLC02HeatForm05 = Game.GetFormFromFile(0x020289E8, "Dragonborn.esm")		;Campfire01LandBurning_Ash
		form DLC02HeatForm06 = Game.GetFormFromFile(0x0202C0B0, "Dragonborn.esm")		;Campfire01LandBurningDirtPath01
		form DLC02HeatForm07 = Game.GetFormFromFile(0x0203CF6E, "Dragonborn.esm")		;DLC2CraftingBlacksmithForge
		form DLC02HeatForm08 = Game.GetFormFromFile(0x0202B074, "Dragonborn.esm")		;DLC2CraftingBlacksmithSkaalForge
		;@TODO: Does anyone use the Small formlist? Purpose?

		if !(_Camp_HeatSources_All.HasForm(DLC02HeatForm01))
			_Camp_HeatSources_All.AddForm(DLC02HeatForm01)
			_Camp_HeatSources_All.AddForm(DLC02HeatForm02)
			_Camp_HeatSources_All.AddForm(DLC02HeatForm03)
			_Camp_HeatSources_All.AddForm(DLC02HeatForm04)
			_Camp_HeatSources_All.AddForm(DLC02HeatForm05)
			_Camp_HeatSources_All.AddForm(DLC02HeatForm06)
			_Camp_HeatSources_All.AddForm(DLC02HeatForm07)
			_Camp_HeatSources_All.AddForm(DLC02HeatForm08)
		endif
		if !(_Camp_HeatSources_Fire.HasForm(DLC02HeatForm01))
			_Camp_HeatSources_Fire.AddForm(DLC02HeatForm01)
			_Camp_HeatSources_Fire.AddForm(DLC02HeatForm02)
			_Camp_HeatSources_Fire.AddForm(DLC02HeatForm03)
			_Camp_HeatSources_Fire.AddForm(DLC02HeatForm04)
			_Camp_HeatSources_Fire.AddForm(DLC02HeatForm05)
			_Camp_HeatSources_Fire.AddForm(DLC02HeatForm06)
			_Camp_HeatSources_Fire.AddForm(DLC02HeatForm07)
			_Camp_HeatSources_Fire.AddForm(DLC02HeatForm08)
		endif
		if !(_Camp_HeatSources_Fire_Medium.HasForm(DLC02HeatForm01))
			_Camp_HeatSources_Fire_Medium.AddForm(DLC02HeatForm01)
			_Camp_HeatSources_Fire_Medium.AddForm(DLC02HeatForm02)
			_Camp_HeatSources_Fire_Medium.AddForm(DLC02HeatForm03)
			_Camp_HeatSources_Fire_Medium.AddForm(DLC02HeatForm04)
			_Camp_HeatSources_Fire_Medium.AddForm(DLC02HeatForm05)
			_Camp_HeatSources_Fire_Medium.AddForm(DLC02HeatForm06)
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
		
		if Legal.DLC2RavenRockCenterMarker == none
			Legal.DLC2RavenRockCenterMarker = Game.GetFormFromFile(0x020295EA, "Dragonborn.esm") as ObjectReference
		endif

		;Worldspaces
		form DLC02WS02 = Game.GetFormFromFile(0x02000800, "Dragonborn.esm")			;Solstheim
		if !DLC2WS
			DLC2WS = DLC02WS02 as Worldspace
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
	
	;#EndRegion
	
	if isSKYRELoaded
		SKYRELoadUp()
	else
		SKYREUnload()
	endif
	
	;#EndRegion
	
	trace("============================================[ Campfire: Warning End ]=============================================")
	trace("                                                                                                                  ")
	trace("                                       Campfire compatibility check complete.                                     ")
	trace("                                                                                                                  ")
	trace("============================================[ Campfire: Warning End ]=============================================")
	
	;if _DE_Setting_SystemMsg.GetValueInt() == 2
	;	_DE_CompatibilityFinished.Show()
	;endif	

	AddStartupSpells()
endFunction

function VanillaGameLoadUp()
	if bAddedSpellBooks == false
		AddSpellBooks()
	endif

	PlacementSystem.SmallFire = Game.GetFormFromFile(0x00013B40, "Skyrim.esm")
	;PlacementSystem.LargeFire = Game.GetFormFromFile(0x000D61B6, "Skyrim.esm")

	TreeReachTreeStump01 = Game.GetFormFromFile(0x000B8A75, "Skyrim.esm") as Tree
endFunction


function AddStartupSpells()							;Approved 2.0
	if isSKYUILoaded
		PlayerRef.RemoveSpell(_Camp_LegacyConfig_Spell)
	else
		PlayerRef.AddSpell(_Camp_LegacyConfig_Spell, false)
	endif

	if isSKYUILoaded
		debug.trace("[Campfire] SkyUI loaded...")
		if _Camp_HotkeyCreateItem.GetValueInt() != 0
			debug.trace("[Campfire] Hotkey has value, removing......")
			PlayerRef.RemoveSpell(_Camp_CreateItemSpell)
		else
			debug.trace("[Campfire] Hotkey has NO value, adding......")
			PlayerRef.AddSpell(_Camp_CreateItemSpell, false)
		endif
		if _Camp_HotkeyBuildCampfire.GetValueInt() != 0
			PlayerRef.RemoveSpell(_Camp_CampfireSpell)
		else
			PlayerRef.AddSpell(_Camp_CampfireSpell, false)
		endif
		if _Camp_HotkeyHarvestWood.GetValueInt() != 0
			PlayerRef.RemoveSpell(_Camp_HarvestWoodSpell)
		else
			PlayerRef.AddSpell(_Camp_HarvestWoodSpell, false)
		endif
	else
		PlayerRef.AddSpell(_Camp_CreateItemSpell, false)
		PlayerRef.AddSpell(_Camp_CampfireSpell, false)
		PlayerRef.AddSpell(_Camp_HarvestWoodSpell, false)
		_Camp_HotkeyCreateItem.SetValueInt(0)
		_Camp_HotkeyBuildCampfire.SetValueInt(0)
		_Camp_HotkeyHarvestWood.SetValueInt(0)
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

	trace("SkyRe Traveller_Rank1 " + Traveller_Rank1)
	trace("SkyRe Traveller_Rank2 " + Traveller_Rank2)
	trace("SkyRe Traveller_Rank3 " + Traveller_Rank3)
	trace("SkyRe Traveller_Rank4 " + Traveller_Rank4)
	trace("SkyRe Traveller_Rank5 " + Traveller_Rank5)
	trace("SkyRe Forestry_Rank1 " + Forestry_Rank1)
	trace("SkyRe Forestry_Rank2 " + Forestry_Rank2)
	trace("SkyRe Forestry_Rank3 " + Forestry_Rank3)
	
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
endFunction

function AddSpellBooks()
	if bAddedSpellBooks == false
		
		;0

		;25
		LItemSpellTomes25AllConjuration.AddForm(_DE_SpellTomeBoundCloakLesser, 1, 1)
		LItemSpellTomes25Conjuration.AddForm(_DE_SpellTomeBoundCloakLesser, 1, 1)
		LItemScroll25Skill.AddForm(_DE_ScrollBoundCloakLesser, 1, 1)

		;50
		LItemSpellTomes50AllConjuration.AddForm(_DE_SpellTomeBoundCloakGreater, 1, 1)
		LItemSpellTomes50Conjuration.AddForm(_DE_SpellTomeBoundCloakGreater, 1, 1)
		LItemSpellTomes50Spells.AddForm(_DE_SpellTomeBoundCloakGreater, 1, 1)
		LItemScroll50Skill.AddForm(_DE_ScrollBoundCloakGreater, 1, 1)

		;75
		LItemSpellTomes75AllConjuration.AddForm(_DE_SpellTomeConjureShelterLesser, 1, 1)
		LItemSpellTomes75Conjuration.AddForm(_DE_SpellTomeConjureShelterLesser, 1, 1)
		LItemSpellTomes75Spells.AddForm(_DE_SpellTomeConjureShelterLesser, 1, 1)
		LItemSpellTomes75AllAlteration.AddForm(_DE_SpellTomeTransmuteWood, 1, 1)
		LItemSpellTomes75Alteration.AddForm(_DE_SpellTomeTransmuteWood, 1, 1)
		LItemSpellTomes75Spells.AddForm(_DE_SpellTomeTransmuteWood, 1, 1)
		LItemScroll75Skill.AddForm(_DE_ScrollConjureShelterLesser, 1, 1)

		;100
		LItemSpellTomes100Conjuration.AddForm(_DE_SpellTomeConjureShelterGreater, 1, 1)
		MGRitualConjurationBooks.AddForm(_DE_SpellTomeConjureShelterGreater, 1, 1)
		LItemScroll100Skill.AddForm(_DE_ScrollConjureShelterGreater, 1, 1)

		bAddedSpellBooks = true
	endif

endFunction

function RegisterForKeysOnLoad()
	CampConfig.RegisterForKeysOnLoad()
endFunction

function RegisterForControlsOnLoad()
	trace("[Campfire] Compatibility is trying to call Campfire.RegisterForControlsOnLoad()")
	Campfire.RegisterForControlsOnLoad()
endFunction

function RegisterForEventsOnLoad()
	RegisterForModEvent("Campfire_OnCellChange", "OnCellChange")
	Campfire.RegisterForEventsOnLoad()
endFunction