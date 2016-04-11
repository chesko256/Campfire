scriptname _Frost_Compatibility extends ReferenceAlias

import debug
import FrostUtil

int property SKSE_MIN_VERSION = 10703 autoReadOnly
float property CAMPFIRE_MIN_VERSION = 1.7 autoReadOnly
GlobalVariable property _Frost_PreviousVersion auto
GlobalVariable property _Frost_FrostfallVersion auto

string CONFIG_PATH = "../FrostfallData/"
bool datastore_update_required = false

;#PROPERTIES=====================================================================================================================
actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto
Spell property _Frost_Weathersense_Spell auto
GlobalVariable property _Frost_HotkeyWeathersense auto

;#Scripts======================================================================
_Frost_SkyUIConfigPanelScript property FrostConfig Auto 			;SkyUI Configuration script
_Frost_ConditionValues property Conditions auto

;#Official DLC=================================================================
bool property isDLC1Loaded auto	hidden						;Dawnguard
bool property isDLC2Loaded auto hidden						;Dragonborn
bool property isHFLoaded auto hidden						;Hearthfire

;#Supported Mods===============================================================
bool property isUIPackageInstalled auto hidden				;SkyUI optional UI package
bool property isSKYUILoaded auto hidden						;SkyUI 4.1+
bool property isLastSeedLoaded auto hidden					;Last Seed
bool property isCOTLoaded auto hidden						;Climates of Tamriel
bool property isIMALoaded auto hidden						;Immersive Armors 7.1
bool property isWTHLoaded auto hidden						;Wyrmstooth
bool property isSKYRELoaded auto hidden						;Skyim Redone
bool property isSCLoaded auto hidden						;Scenic Carriages
bool property isNFHLoaded auto hidden						;Northborn Fur Hoods
bool property isWICLoaded auto hidden						;Winter is Coming
bool property isCOSLoaded auto hidden						;Cloaks of Skyrim
bool property isCOSDGLoaded auto hidden						;Cloaks of Skyrim - Dawnguard
bool property isHDTCloaksLoaded auto hidden					;Illustrious HDT Cloaks
bool property isAEALoaded auto hidden						;Aesir Armor
bool property isWACLoaded auto hidden						;Wet and Cold
bool property isSSILoaded auto hidden						;Summerset Isle
bool property isDRKLoaded auto hidden						;DarkenD

;#Factions=====================================================================
Faction property _WetIsUnderShelterFaction auto hidden

;#Merchant Containers==========================================================
;ObjectReference property MerchantRiverwoodTraderContainer auto

;#FormLists====================================================================
Formlist property _Camp_WorldspacesInteriors auto
Formlist property _Frost_WorldspacesFTException auto
Formlist property _Frost_SevereWeatherList auto
Formlist property _Frost_OvercastWeatherList auto
Formlist property _Frost_FastTravelExceptions auto
Formlist property _Frost_ExposureExceptions auto
Formlist property _Camp_HeatSources_All auto
Formlist property _Camp_HeatSources_Other auto

;#Trees============================================================================
;TreeObject property TreeReachTreeStump01 auto hidden

;#DLC / Mod Worldspaces============================================================
Worldspace property WS_FalmerValley auto hidden
Worldspace property WS_Solstheim auto hidden
Worldspace property WS_Wyrmstooth auto hidden
Worldspace property WS_Darkend auto hidden

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

float[] Wyrmstooth_Center_PolyX
float[] Wyrmstooth_Center_PolyY
float[] Wyrmstooth_West_PolyX
float[] Wyrmstooth_West_PolyY

float[] DNKD_Phalos_Frozen_PolyX
float[] DNKD_Phalos_Frozen_PolyY

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
book property _Frost_SpellTomeSoothe1 auto
book property _Frost_SpellTomeFoxskin auto
book property _Frost_SpellTomeSoothe2 auto
book property _Frost_SpellTomeBoundCloakLesser auto
book property _Frost_SpellTomeWolfskin auto
book property _Frost_SpellTomeVaporBlast auto
book property _Frost_SpellTomeSoothe3 auto
book property _Frost_SpellTomeKindle auto
book property _Frost_SpellTomeBoundCloakGreater auto
book property _Frost_SpellTomeConjureShelterLesser auto
book property _Frost_SpellTomeTransmuteWood auto
book property _Frost_SpellTomeBearskin auto
book property _Frost_SpellTomeConjureShelterGreater auto

;#Scrolls======================================================================
scroll property _Frost_ScrollSoothe auto
scroll property _Frost_ScrollBask auto
scroll property _Frost_ScrollFoxskin auto
scroll property _Frost_ScrollBoundCloakLesser auto
scroll property _Frost_ScrollRevel auto
scroll property _Frost_ScrollWolfskin auto
scroll property _Frost_ScrollVaporBlast auto
scroll property _Frost_ScrollKindle auto
scroll property _Frost_ScrollBoundCloakGreater auto
scroll property _Frost_ScrollBearskin auto
scroll property _Frost_ScrollConjureShelterLesser auto
scroll property _Frost_ScrollConjureShelterGreater auto

;#Campfire Skill System============================================================
Activator property _Frost_PerkNodeController_Endurance auto

;#Misc=============================================================================
Message property _Frost_CriticalError_SKSE auto
Message property _Frost_CriticalError_Campfire auto
Message property _Frost_CriticalError_SkyUIInterfacePackage auto
Weather property DLC2AshStorm auto hidden
bool added_spell_books = false

;#Upgrade Flags====================================================================
GlobalVariable property _Frost_Setting_1PAnimationAllowed auto
GlobalVariable property _Frost_Upgraded_3_0_1 auto
GlobalVariable property _Frost_Upgraded_3_0_2 auto

Event OnPlayerLoadGame()
	RunCompatibility()
	RegisterForKeysOnLoad()
	RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()

	; Notify that we are finished loading up.
	SendEvent_FrostfallLoaded()
endEvent

function FatalErrorSKSE(int version)
	trace("[Frostfall][ERROR] Detected SKSE version " + ((version as float) / 10000) + ", out of date! Expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer.")
	while true
		_Frost_CriticalError_SKSE.Show(((version as float) / 10000), ((SKSE_MIN_VERSION as float) / 10000))
		utility.wait(3.0)
	endWhile
endFunction

function FatalErrorCampfire(float version)
	trace("[Frostfall][ERROR] Detected Campfire version " + version + ", out of date! Expected " + CAMPFIRE_MIN_VERSION + " or newer.")
	while true
		_Frost_CriticalError_Campfire.Show(version, CAMPFIRE_MIN_VERSION)
		utility.wait(3.0)
	endWhile
endFunction

function FatalErrorSkyUIPackage(int skyui_version)
	trace("[Frostfall][ERROR] Detected optional Frostfall SkyUI Interface Package, but the wrong version of SkyUI is installed!")
	while true
		_Frost_CriticalError_SkyUIInterfacePackage.Show(skyui_version)
		utility.wait(3.0)
	endWhile
endFunction


function RunCompatibility()
	VanillaGameLoadUp()

	trace("[Frostfall]======================================================================================================")
	trace("[Frostfall]     Frostfall is now performing compatibility checks. Papyrus warnings about missing or              ")
	trace("[Frostfall]             unloaded files may follow. This is NORMAL and can be ignored.   		                    ")
	trace("[Frostfall]======================================================================================================")
	
	if _Frost_Upgraded_3_0_1.GetValueInt() != 2
		Upgrade_3_0_1()
	endif

	if _Frost_Upgraded_3_0_2.GetValueInt() != 2
		Upgrade_3_0_2()
	endif

	; Update the previous version value with the current version
	_Frost_PreviousVersion.SetValue(_Frost_FrostfallVersion.GetValue())

	bool skse_loaded = SKSE.GetVersion()
	if skse_loaded
		int skse_version = (SKSE.GetVersion() * 10000) + (SKSE.GetVersionMinor() * 100) + SKSE.GetVersionBeta()
		if skse_version < SKSE_MIN_VERSION
			FatalErrorSKSE(skse_version)
		else
			trace("[Frostfall] Detected SKSE version " + ((skse_version as float) / 10000) + " (expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer, success!)")
		endif
	else
		FatalErrorSKSE(0)
	endif

	float campfire_version = CampUtil.GetCampfireVersion()
	if campfire_version < CAMPFIRE_MIN_VERSION
		FatalErrorCampfire(campfire_version)
	else
		trace("[Frostfall] Detected Campfire version " + campfire_version + " (expected " + CAMPFIRE_MIN_VERSION + " or newer, success!)")
	endif
	
	int ui_package_version_installed = JsonUtil.GetIntValue(CONFIG_PATH + "interface_package_version", "installed_package_version")
	if ui_package_version_installed == 5
		SKI_Main skyui = Game.GetFormFromFile(0x00000814, "SkyUI.esp") as SKI_Main
		int skyui_version = skyui.ReqSWFRelease
		if skyui_version >= 1026 	; SkyUI 5.1+
			isUIPackageInstalled = true
			trace("[Frostfall] Detected optional SkyUI Interface Package version " + ui_package_version_installed + " and SkyUI version " + skyui_version + ", success!")
		else
			isUIPackageInstalled = false
			FatalErrorSkyUIPackage(5)
		endif
	else
		isUIPackageInstalled = false
	endif

	;@TODO: Rework to check version. SkyUI is now required.
	if isSKYUILoaded
		isSKYUILoaded = IsPluginLoaded(0x01000814, "SkyUI.esp")
		if !isSKYUILoaded
			;SkyUI was removed since the last save.
		endif
	else
		isSKYUILoaded = IsPluginLoaded(0x01000814, "SkyUI.esp")
		if isSKYUILoaded
			;SkyUI was just loaded.
		endif
	endif

	if isDLC1Loaded
		isDLC1Loaded = IsPluginLoaded(0x02009403, "Dawnguard.esm")
		if !isDLC1Loaded
			;DLC1 was removed since the last save.
			Conditions.IsDawnguardLoaded = false
		endif
	else
		isDLC1Loaded = IsPluginLoaded(0x02009403, "Dawnguard.esm")
		if isDLC1Loaded
			;DLC1 was just added.
			DLC1LoadUp()
			Conditions.IsDawnguardLoaded = true
		endif
	endif

	if isDLC2Loaded
		isDLC2Loaded = IsPluginLoaded(0x0201FB99, "Dragonborn.esm")
		if !isDLC2Loaded
			;DLC2 was removed since the last save.
			Conditions.IsDragonbornLoaded = false
		endif
	else
		isDLC2Loaded = IsPluginLoaded(0x0201FB99, "Dragonborn.esm")
		if isDLC2Loaded
			;DLC2 was just added.
			DLC2LoadUp()
			Conditions.IsDragonbornLoaded = true
		endif
	endif
	
	if isHFLoaded
		isHFLoaded = IsPluginLoaded(0x0200306C, "HearthFires.esm")
		if !isHFLoaded
			;Hearthfire was removed since the last save.
			Conditions.IsHearthfireLoaded = false
		endif
	else
		isHFLoaded = IsPluginLoaded(0x0200306C, "HearthFires.esm")
		if isHFLoaded
			;Hearthfire was just added.
			Conditions.IsHearthfireLoaded = true
		endif
	endif

	if isLastSeedLoaded
		isLastSeedLoaded = IsPluginLoaded(0x02000D63, "LastSeed.esp")
		if !isLastSeedLoaded
			;Last Seed was removed since the last save.
			Conditions.IsLastSeedLoaded = false
		endif
	else
		isLastSeedLoaded = IsPluginLoaded(0x02000D63, "LastSeed.esp")
		if isLastSeedLoaded
			;Last Seed was just added.
			Conditions.IsLastSeedLoaded = true
		endif
	endif

	

	if isWTHLoaded
		isWTHLoaded = IsPluginLoaded(0x01000D62, "Wyrmstooth.esp")
		if !isWTHLoaded
			;Wyrmstooth was removed since the last save.
		endif
	else
		isWTHLoaded = IsPluginLoaded(0x01000D62, "Wyrmstooth.esp")
		if isWTHLoaded
			;Wyrmstooth was just added.
			WTHLoadUp()
		endif
	endif

	if isSKYRELoaded
		isSKYRELoaded = IsPluginLoaded(0x0008D73F, "SkyRe_Main.esp")
		if !isSKYRELoaded
			;SkyRe was removed since the last save.
			Conditions.IsSkyReLoaded = false
		else
			Conditions.IsSkyReLoaded = true
		endif
	else
		isSKYRELoaded = IsPluginLoaded(0x0008D73F, "SkyRe_Main.esp")
		if isSKYRELoaded
			;SkyRe was just added.
			Conditions.IsSkyReLoaded = true
		else
			Conditions.IsSkyReLoaded = false
		endif
	endif

	; DarkenD

	if isCOTLoaded
		isCOTLoaded = IsPluginLoaded(0x01068A1A, "ClimatesOfTamriel.esm")
		if !isCOTLoaded
			;Climates of Tamriel was removed since the last save.
		endif
	else
		isCOTLoaded = IsPluginLoaded(0x01068A1A, "ClimatesOfTamriel.esm")
		if isCOTLoaded
			;Climates of Tamriel was just added.
			if !(_Frost_SevereWeatherList.HasForm(Game.GetFormFromFile(0x01068A1A, "ClimatesOfTamriel.esm")))
				_Frost_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01068A1A, "ClimatesOfTamriel.esm"))				;CoTSnowBlizzard_Swirl
				_Frost_SevereWeatherList.AddForm(Game.GetFormFromFile(0x0106C559, "ClimatesOfTamriel.esm"))				;CoTSnowBlizzard_Down_NoFog
				_Frost_SevereWeatherList.AddForm(Game.GetFormFromFile(0x0104483A, "ClimatesOfTamriel.esm"))				;CoTOvercast_6_HR
				_Frost_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01044838, "ClimatesOfTamriel.esm"))				;CoTOvercast_5_HR
				_Frost_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01044836, "ClimatesOfTamriel.esm"))				;CoTOvercast_4_HR_T
				_Frost_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01044832, "ClimatesOfTamriel.esm"))				;CoTOvercast_2_HR
				_Frost_SevereWeatherList.AddForm(Game.GetFormFromFile(0x01044831, "ClimatesOfTamriel.esm"))				;CoTOvercast_1_HR_T
			endif	
			if !(_Frost_OvercastWeatherList.HasForm(Game.GetFormFromFile(0x0104482F, "ClimatesOfTamriel.esm")))
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482F, "ClimatesOfTamriel.esm"))			;CoTOvercast_6_T
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482E, "ClimatesOfTamriel.esm"))			;CoTOvercast_5_T
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482D, "ClimatesOfTamriel.esm"))			;CoTOvercast_3_T
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482C, "ClimatesOfTamriel.esm"))			;CoTOvercast_4_T
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482B, "ClimatesOfTamriel.esm"))			;CoTOvercast_2_T
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x0104482A, "ClimatesOfTamriel.esm"))			;CoTOvercast_1_T
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044829, "ClimatesOfTamriel.esm"))			;CoTOvercast_6_AM
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044827, "ClimatesOfTamriel.esm"))			;CoTOvercast_5_AP
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044826, "ClimatesOfTamriel.esm"))			;CoTOvercast_4
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044825, "ClimatesOfTamriel.esm"))			;CoTOvercast_3
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x01044824, "ClimatesOfTamriel.esm"))			;CoTOvercast_2
				_Frost_OvercastWeatherList.AddForm(Game.GetFormFromFile(0x010437F9, "ClimatesOfTamriel.esm"))			;CoTOvercast_1
			endif
		endif
	endif

	if isSCLoaded
		isSCLoaded = IsPluginLoaded(0x010215C5, "ScenicCarriages.esp")
		if !isSCLoaded
			;Scenic Carriages was removed since the last save.
		endif
	else
		isSCLoaded = IsPluginLoaded(0x010215C5, "ScenicCarriages.esp")
		if isSCLoaded
			Form myCarriage = Game.GetFormFromFile(0x010215C5, "ScenicCarriages.esp")
			if !(_Frost_ExposureExceptions.HasForm(myCarriage))
				_Frost_ExposureExceptions.AddForm(myCarriage)
			endif
			if !(_Frost_FastTravelExceptions.HasForm(myCarriage))
				_Frost_FastTravelExceptions.AddForm(myCarriage)
			endif
		endif
	endif

	if isSSILoaded
		isSSILoaded = IsPluginLoaded(0x00AE416D, "summersetisles.esp")
		if !isSSILoaded
			;Summerset Isle is not loaded.
		endif
	else
		isSSILoaded = IsPluginLoaded(0x00AE416D, "summersetisles.esp")
		if isSSILoaded
			Form ssi_1 = Game.GetFormFromFile(0x00AE416D, "summersetisles.esp")
			Form ssi_2 = Game.GetFormFromFile(0x002822DC, "summersetisles.esp")
			Form ssi_3 = Game.GetFormFromFile(0x0026C9F0, "summersetisles.esp")
			Form ssi_4 = Game.GetFormFromFile(0x000C7888, "summersetisles.esp")
			Form ssi_5 = Game.GetFormFromFile(0x000AA978, "summersetisles.esp")
			Form ssi_6 = Game.GetFormFromFile(0x000A351C, "summersetisles.esp")

			if !(_Frost_WorldspacesFTException.HasForm(ssi_1))
				_Frost_WorldspacesFTException.AddForm(ssi_1)
				_Frost_WorldspacesFTException.AddForm(ssi_2)
				_Frost_WorldspacesFTException.AddForm(ssi_3)
				_Frost_WorldspacesFTException.AddForm(ssi_4)
				_Frost_WorldspacesFTException.AddForm(ssi_5)
				_Frost_WorldspacesFTException.AddForm(ssi_6)
			endif
		endif
	endif

	if isDRKLoaded
		isDRKLoaded = IsPluginLoaded(0x00000D62, "Darkend.esp")
		if !isDRKLoaded
			;DarkenD was removed.
		endif
	else
		isDRKLoaded = IsPluginLoaded(0x00000D62, "Darkend.esp")
		if isDRKLoaded
			DRKLoadUp()
		endif
	endif

	RunCompatibilityArmors()
	
	trace("[Frostfall]======================================================================================================")
	trace("[Frostfall]                            Frostfall compatibility check complete.   		                        ")
	trace("[Frostfall]======================================================================================================")

	FrostConfig.LoadProfileOnStartup()
	
	RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()
	RegisterForMenusOnLoad()
	AddStartupSpells()
	RegisterCampfireSkill()
endFunction

function Upgrade_3_0_1()
	; Deprecate the 1st Person Hand Warming Animation setting
	_Frost_Setting_1PAnimationAllowed.SetValueInt(0)
	
	trace("[Frostfall] Upgraded to 3.0.1.")
	_Frost_Upgraded_3_0_1.SetValueInt(2)
endFunction

function Upgrade_3_0_2()
	; Include the Conjured Shelter spells in leveled lists.
	
	;75
	LItemSpellTomes75AllConjuration.AddForm(_Frost_SpellTomeConjureShelterLesser, 1, 1)
	LItemSpellTomes75Conjuration.AddForm(_Frost_SpellTomeConjureShelterLesser, 1, 1)
	LItemSpellTomes75Spells.AddForm(_Frost_SpellTomeConjureShelterLesser, 1, 1)
	LItemScroll75Skill.AddForm(_Frost_ScrollConjureShelterLesser, 1, 1)

	;100
	LItemSpellTomes100Conjuration.AddForm(_Frost_SpellTomeConjureShelterGreater, 1, 1)
	MGRitualConjurationBooks.AddForm(_Frost_SpellTomeConjureShelterGreater, 1, 1)
	LItemScroll100Skill.AddForm(_Frost_ScrollConjureShelterGreater, 1, 1)

	; Set the Weathersense meter color.
	_Frost_InterfaceHandler inf = FrostUtil.GetInterfaceHandler()
	inf.WeathersenseMeter.SetColors(inf._Frost_ExposureMeterColorWarm_Light.GetValueInt(), inf._Frost_ExposureMeterColorWarm_Light.GetValueInt())

	trace("[Frostfall] Upgraded to 3.0.2.")
	_Frost_Upgraded_3_0_2.SetValueInt(2)
endFunction

function RunCompatibilityArmors()
	if isIMALoaded
		isIMALoaded = IsPluginLoaded(0x00014836, "Hothtrooper44_ArmorCompilation.esp")
		if !isIMALoaded
			;Immersive Armors was removed since the last save.
		endif
	else
		isIMALoaded = IsPluginLoaded(0x00014836, "Hothtrooper44_ArmorCompilation.esp")
		if isIMALoaded
			;Immersive Armors was just added.
			IMALoadUp()
		endif
	endif
	
	if isNFHLoaded	
		isNFHLoaded = IsPluginLoaded(0x010048DF, "Northborn Fur Hoods.esp")
		if !isNFHLoaded
			;Northborn Fur Hoods was removed since the last save.
		endif
	else
		isNFHLoaded = IsPluginLoaded(0x010048DF, "Northborn Fur Hoods.esp")
		if isNFHLoaded
			;Northborn Fur Hoods was just added.
			NFHLoadUp()
		endif
	endif
	
	if isWICLoaded
		isWICLoaded = GetWICPluginLoaded()
		if !isWICLoaded
			;Winter is Coming - Cloaks was removed since the last save.
		else
			WICLoadUp()
		endif
	else
		isWICLoaded = GetWICPluginLoaded()
		if isWICLoaded
			;Winter is Coming - Cloaks was just added.
			WICLoadUp()
		endif
	endif

	if isCOSLoaded
		isCOSLoaded = GetCOSPluginLoaded()
		if !isCOSLoaded
			;Cloaks of Skyrim was unloaded.
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
		isAEALoaded = IsPluginLoaded(0x02017424, "AesirArmor.esp")
		if !isAEALoaded
			;Aesir Armor was removed.
		endif
	else
		isAEALoaded = IsPluginLoaded(0x02017424, "AesirArmor.esp")
		if isAEALoaded
			;Aesir Armor was just added.
			AEALoadUp()
		endif
	endif

	if isWACLoaded
		isWACLoaded = IsPluginLoaded(0x02002314, "WetandCold.esp")
		if !isWACLoaded
			;Wet and Cold was removed since the last save.
		else
			WACLoadUp()
		endif
	else
		isWACLoaded = IsPluginLoaded(0x02002314, "WetandCold.esp")
		if isWACLoaded
			;Wet and Cold was just added.
			WACLoadUp()
		endif
	endif

	;/if isHDTCloaksLoaded
		isHDTCloaksLoaded = IsPluginLoaded()
		if !isHDTCloaksLoaded
			; Illustrious HDT Cloaks was removed since the last save.
		else
			HDTCloaksLoadUp()
		endif
	else
		isHDTCloaksLoaded = IsPluginLoaded()
		if isHDTCloaksLoaded
			; Illustrious HDT Cloaks was just added.
			HDTCloaksLoadUp()
		endif
	endif
	/;
endFunction


bool function IsPluginLoaded(int iFormID, string sPluginName)
	int i = Game.GetModByName(sPluginName)
	if i != 255
		debug.trace("[Frostfall] Loaded: " + sPluginName)
		return true
	else
		return false
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
	
endFunction

function DRKLoadUp()
	form orb = Game.GetFormFromFile(0x000B8474, "Darkend.esp")
	if !_Camp_HeatSources_All.HasForm(orb)
		_Camp_HeatSources_All.AddForm(orb)
	endif
	if !_Camp_HeatSources_Other.HasForm(orb)
		_Camp_HeatSources_Other.AddForm(orb)
	endif
	if !WS_Darkend
		WS_Darkend = Game.GetFormFromFile(0x00000D62, "Darkend.esp") as Worldspace
	endif
	if !DNKD_Phalos_Frozen_PolyX
		DNKD_Phalos_Frozen_PolyX = new float[4]
	endif
	if !DNKD_Phalos_Frozen_PolyY
		DNKD_Phalos_Frozen_PolyY = new float[4]
	endif
	if !DNKD_Phalos_Frozen_PolyX[0]
		DNKD_Phalos_Frozen_PolyX[0] = 931.0
		DNKD_Phalos_Frozen_PolyX[1] = 19951.0
		DNKD_Phalos_Frozen_PolyX[2] = 28261.0
		DNKD_Phalos_Frozen_PolyX[3] = -4750.0
	endif
	if !DNKD_Phalos_Frozen_PolyY[0]
		DNKD_Phalos_Frozen_PolyY[0] = 14542.0
		DNKD_Phalos_Frozen_PolyY[1] = 6015.0
		DNKD_Phalos_Frozen_PolyY[2] = 49880.0
		DNKD_Phalos_Frozen_PolyY[3] = 49880.0
	endif
endFunction

function DLC2LoadUp()
	; Make a Fast Travel exception for the Black Books
	form Book1 = Game.GetFormFromFile(0x000270ED, "Dragonborn.esm")
	form Book2 = Game.GetFormFromFile(0x000270EE, "Dragonborn.esm")
	form Book3 = Game.GetFormFromFile(0x000270EF, "Dragonborn.esm")
	form Book4 = Game.GetFormFromFile(0x000270F0, "Dragonborn.esm")
	form Book5 = Game.GetFormFromFile(0x000270F1, "Dragonborn.esm")
	form Book6 = Game.GetFormFromFile(0x000270F2, "Dragonborn.esm")
	form Book7 = Game.GetFormFromFile(0x000270F3, "Dragonborn.esm")

	if !(_Frost_FastTravelExceptions.HasForm(Book1))
		_Frost_FastTravelExceptions.AddForm(Book1)
	endif
	if !(_Frost_FastTravelExceptions.HasForm(Book2))
		_Frost_FastTravelExceptions.AddForm(Book2)
	endif
	if !(_Frost_FastTravelExceptions.HasForm(Book3))
		_Frost_FastTravelExceptions.AddForm(Book3)
	endif
	if !(_Frost_FastTravelExceptions.HasForm(Book4))
		_Frost_FastTravelExceptions.AddForm(Book4)
	endif
	if !(_Frost_FastTravelExceptions.HasForm(Book5))
		_Frost_FastTravelExceptions.AddForm(Book5)
	endif
	if !(_Frost_FastTravelExceptions.HasForm(Book6))
		_Frost_FastTravelExceptions.AddForm(Book6)
	endif
	if !(_Frost_FastTravelExceptions.HasForm(Book7))
		_Frost_FastTravelExceptions.AddForm(Book7)
	endif

	; Make an exposure exception for the ship that takes you to Solstheim

endFunction

function WTHLoadUp()

	if !WS_Wyrmstooth
		WS_Wyrmstooth = Game.GetFormFromFile(0x01000D62, "Wyrmstooth.esp") as Worldspace
	endif
	
	if !(_Camp_WorldspacesInteriors.HasForm(Game.GetFormFromFile(0x010825E1, "Wyrmstooth.esp")))	;Dimfrost
		_Camp_WorldspacesInteriors.AddForm(Game.GetFormFromFile(0x010825E1, "Wyrmstooth.esp"))
	endif
	
	if !Wyrmstooth_Center_PolyX
		Wyrmstooth_Center_PolyX = new float[5]
	endif
	if !Wyrmstooth_Center_PolyY
		Wyrmstooth_Center_PolyY = new float[5]
	endif
	if !Wyrmstooth_West_PolyX
		Wyrmstooth_West_PolyX = new float[8]
	endif
	if !Wyrmstooth_West_PolyY
		Wyrmstooth_West_PolyY = new float[8]
	endif
	if !Wyrmstooth_Center_PolyX[0]
		Wyrmstooth_Center_PolyX[0] = 19045.16
		Wyrmstooth_Center_PolyX[1] = 13357.78
		Wyrmstooth_Center_PolyX[2] = 19684.59
		Wyrmstooth_Center_PolyX[3] = 41285.82
		Wyrmstooth_Center_PolyX[4] = 25999.50
	endif
	if !Wyrmstooth_Center_PolyY[0]
		Wyrmstooth_Center_PolyY[0] = 727.36
		Wyrmstooth_Center_PolyY[1] = -10888.55
		Wyrmstooth_Center_PolyY[2] = -18279.13
		Wyrmstooth_Center_PolyY[3] = 3264.52
		Wyrmstooth_Center_PolyY[4] = 8109.01
	endif
	if !Wyrmstooth_West_PolyX[0]
		Wyrmstooth_West_PolyX[0] = -184.0
		Wyrmstooth_West_PolyX[1] = -6402.0
		Wyrmstooth_West_PolyX[2] = -16690.0
		Wyrmstooth_West_PolyX[3] = -14528.0
		Wyrmstooth_West_PolyX[4] = -10068.0
		Wyrmstooth_West_PolyX[5] = -11671.0
		Wyrmstooth_West_PolyX[6] = -70148.0
		Wyrmstooth_West_PolyX[7] = -63280.0
	endif
	if !Wyrmstooth_West_PolyY[0]
		Wyrmstooth_West_PolyY[0] = 17652.0
		Wyrmstooth_West_PolyY[1] = -3939.0
		Wyrmstooth_West_PolyY[2] = -8281.0
		Wyrmstooth_West_PolyY[3] = -17718.0
		Wyrmstooth_West_PolyY[4] = -29543.0
		Wyrmstooth_West_PolyY[5] = -18706.0
		Wyrmstooth_West_PolyY[6] = -29523.0
		Wyrmstooth_West_PolyY[7] = 52329.0
	endif
endFunction

function VanillaGameLoadUp()
	if added_spell_books == false
		AddSpellBooks()
	endif
	
	; TreeReachTreeStump01 = Game.GetFormFromFile(0x000B8A75, "Skyrim.esm") as TreeObject
endFunction

bool function GetCOSPluginLoaded()
	;Determine if Cloaks of Skyrim is loaded.
	bool loaded
	loaded = IsPluginLoaded(0x0200F615, "Complete Crafting Overhaul_Remade.esp")
	if !loaded
		loaded = IsPluginLoaded(0x0200F615, "Cloaks.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x0200F615, "Cloaks - Player Only.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x0200F615, "Cloaks - No Imperial.esp")
	endif
	if loaded
		return true
	else
		return false
	endif
endFunction

bool function GetCOSDGPluginLoaded()
	;Determine if Cloaks of Skyrim - Dawnguard is loaded.
	bool loaded
	loaded = IsPluginLoaded(0x00005905, "Complete Crafting Overhaul_Remade.esp")
	if !loaded
		loaded = IsPluginLoaded(0x00000D64, "Cloaks - Dawnguard.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x00000D64, "Cloaks - Player Only - Dawnguard.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x00000D64, "Cloaks - No Imperial - Dawnguard.esp")
	endif
	if loaded
		return true
	else
		return false
	endif
endFunction

function AddStartupSpells()
	if _Frost_HotkeyWeathersense.GetValueInt() != 0
		PlayerRef.RemoveSpell(_Frost_Weathersense_Spell)
	else
		PlayerRef.AddSpell(_Frost_Weathersense_Spell, false)
	endif

	((self as ReferenceAlias) as _Frost_PlayerSpellMonitor).UpdateFrostResistBonus()
endFunction

function AddSpellBooks()
	if added_spell_books == false
		;0
		LItemSpellTomes00AllIllusion.AddForm(_Frost_SpellTomeSoothe1, 1, 1)
		LItemSpellTomes00AllSpells.AddForm(_Frost_SpellTomeSoothe1, 1, 1)
		LItemSpellTomes00Illusion.AddForm(_Frost_SpellTomeSoothe1, 1, 1)
		LItemSpellTomes00Spells.AddForm(_Frost_SpellTomeSoothe1, 1, 1)
		LItemScroll00Skill.AddForm(_Frost_ScrollSoothe, 1, 1)

		;25
		LItemSpellTomes25AllAlteration.AddForm(_Frost_SpellTomeFoxskin, 1, 1)
		LItemSpellTomes25Alteration.AddForm(_Frost_SpellTomeFoxskin, 1, 1)
		LItemSpellTomes25AllIllusion.AddForm(_Frost_SpellTomeSoothe2, 1, 1)
		LItemSpellTomes25Illusion.AddForm(_Frost_SpellTomeSoothe2, 1, 1)
		LItemSpellTomes25AllConjuration.AddForm(_Frost_SpellTomeBoundCloakLesser, 1, 1)
		LItemSpellTomes25Conjuration.AddForm(_Frost_SpellTomeBoundCloakLesser, 1, 1)
		LItemScroll25Skill.AddForm(_Frost_ScrollBask, 1, 1)
		LItemScroll25Skill.AddForm(_Frost_ScrollFoxskin, 1, 1)
		LItemScroll25Skill.AddForm(_Frost_ScrollBoundCloakLesser, 1, 1)

		;50
		LItemSpellTomes50AllAlteration.AddForm(_Frost_SpellTomeWolfskin, 1, 1)
		LItemSpellTomes50Alteration.AddForm(_Frost_SpellTomeWolfskin, 1, 1)
		LItemSpellTomes50Spells.AddForm(_Frost_SpellTomeWolfskin, 1, 1)
		LitemSpellTomes50AllDestruction.AddForm(_Frost_SpellTomeVaporBlast, 1, 1)
		LitemSpellTomes50Destruction.AddForm(_Frost_SpellTomeVaporBlast, 1, 1)
		LItemSpellTomes50Spells.AddForm(_Frost_SpellTomeVaporBlast, 1, 1)
		LItemSpellTomes50AllIllusion.AddForm(_Frost_SpellTomeSoothe3, 1, 1)
		LItemSpellTomes50Illusion.AddForm(_Frost_SpellTomeSoothe3, 1, 1)
		LItemSpellTomes50Spells.AddForm(_Frost_SpellTomeSoothe3, 1, 1)
		LItemSpellTOmes50AllRestoration.AddForm(_Frost_SpellTomeKindle, 1, 1)
		LItemSpellTOmes50Restoration.AddForm(_Frost_SpellTomeKindle, 1, 1)
		LItemSpellTomes50Spells.AddForm(_Frost_SpellTomeKindle, 1, 1)
		LItemSpellTomes50AllConjuration.AddForm(_Frost_SpellTomeBoundCloakGreater, 1, 1)
		LItemSpellTomes50Conjuration.AddForm(_Frost_SpellTomeBoundCloakGreater, 1, 1)
		LItemSpellTomes50Spells.AddForm(_Frost_SpellTomeBoundCloakGreater, 1, 1)
		LItemScroll50Skill.AddForm(_Frost_ScrollRevel, 1, 1)
		LItemScroll50Skill.AddForm(_Frost_ScrollWolfskin, 1, 1)
		LItemScroll50Skill.AddForm(_Frost_ScrollVaporBlast, 1, 1)
		LItemScroll50Skill.AddForm(_Frost_ScrollKindle, 1, 1)
		LItemScroll50Skill.AddForm(_Frost_ScrollBoundCloakGreater, 1, 1)

		;75
		; LItemSpellTomes75AllConjuration.AddForm(_Frost_SpellTomeConjureShelterLesser, 1, 1)
		; LItemSpellTomes75Conjuration.AddForm(_Frost_SpellTomeConjureShelterLesser, 1, 1)
		; LItemSpellTomes75Spells.AddForm(_Frost_SpellTomeConjureShelterLesser, 1, 1)
		LItemSpellTomes75AllAlteration.AddForm(_Frost_SpellTomeTransmuteWood, 1, 1)
		LItemSpellTomes75Alteration.AddForm(_Frost_SpellTomeTransmuteWood, 1, 1)
		LItemSpellTomes75Spells.AddForm(_Frost_SpellTomeTransmuteWood, 1, 1)
		LItemSpellTomes75AllAlteration.AddForm(_Frost_SpellTomeBearskin, 1, 1)
		LItemSpellTomes75Alteration.AddForm(_Frost_SpellTomeBearskin, 1, 1)
		LItemSpellTomes75Spells.AddForm(_Frost_SpellTomeBearskin, 1, 1)
		LItemScroll75Skill.AddForm(_Frost_ScrollBearskin, 1, 1)
		; LItemScroll75Skill.AddForm(_Frost_ScrollConjureShelterLesser, 1, 1)

		;100
		; LItemSpellTomes100Conjuration.AddForm(_Frost_SpellTomeConjureShelterGreater, 1, 1)
		; MGRitualConjurationBooks.AddForm(_Frost_SpellTomeConjureShelterGreater, 1, 1)
		; LItemScroll100Skill.AddForm(_Frost_ScrollConjureShelterGreater, 1, 1)

		added_spell_books = true
	endif
endFunction

function RegisterForKeysOnLoad()
	FrostConfig.RegisterForKeysOnLoad()
endFunction

function RegisterForControlsOnLoad()
	; pass
endFunction

function RegisterForEventsOnLoad()
	GetExposureSystem().RegisterForEvents()
	GetClothingSystem().RegisterForEvents()
	GetWetnessSystem().RegisterForEvents()
	GetClimateSystem().RegisterForEvents()
	GetWarmthSystem().RegisterForEvents()
	GetCoverageSystem().RegisterForEvents()
	GetRescueSystem().RegisterForEvents()
	GetInterfaceHandler().RegisterForEvents()
endFunction

function RegisterForMenusOnLoad()
	(PlayerAlias as _Frost_PlayerDialogueMonitor).RegisterForMenus()
	GetInterfaceHandler().RegisterForMenus()
endFunction

int function GetPlayerRegionTemp_FalmerValley(float afPosX, float afPosY)
	if IsPointInPolygon(DLC1_FVBoss_PolyX, DLC1_FVBoss_PolyY, afPosX, afPosY) && PlayerRef.GetPositionZ() >= 8385.0
		;notification("[Frostfall] Current Region: Boss")
		return 20
	elseif IsPointInPolygon(DLC1_FVIce_PolyX, DLC1_FVIce_PolyY, afPosX, afPosY)
		;notification("[Frostfall] Current Region: Ice")
		return -10
	elseif IsPointInPolygon(DLC1_FVCanyon_PolyX, DLC1_FVCanyon_PolyY, afPosX, afPosY)
		;notification("[Frostfall] Current Region: Canyon")
		return 12
	elseif IsPointInPolygon(DLC1_FVPlayground_PolyX, DLC1_FVPlayground_PolyY, afPosX, afPosY)
		;notification("[Frostfall] Current Region: Playground")
		return -5
	elseif IsPointInPolygon(DLC1_FVGrove_PolyX, DLC1_FVGrove_PolyY, afPosX, afPosY)
		;notification("[Frostfall] Current Region: Grove")
		return 1
	else
		;notification("[Frostfall] Current Region: Unknown!")
		return 10
	endif

endFunction

int function GetPlayerRegionTemp_Solstheim(float afPosX, float afPosY)
	if IsPointInPolygon(DLC2_Solstheim_PolyX, DLC2_Solstheim_PolyY, afPosX, afPosY)
		;notification("[Frostfall] Current Region: Ice")
		return -10
	else
		return 16
	endif
endFunction

int function GetPlayerRegionTemp_Wyrmstooth(float afPosX, float afPosY)
	if IsPointInPolygon(Wyrmstooth_Center_PolyX, Wyrmstooth_Center_PolyY, afPosX, afPosY)
		return 12
	elseif IsPointInPolygon(Wyrmstooth_West_PolyX, Wyrmstooth_West_PolyY, afPosX, afPosY)
		return 9
	else
		return -10
	endif
endFunction

int function GetPlayerRegionTemp_Darkend(float afPosX, float afPosY)
	if IsPointInPolygon(DNKD_Phalos_Frozen_PolyX, DNKD_Phalos_Frozen_PolyY, afPosX, afPosY)
		return -10
	else
		return 5
	endif
endFunction

bool function IsPointInPolygon(float[] polyX, float[] polyY, float x, float y)
    ; Attempts to determine if a given point (x, y) lies inside the bounds of a polygon described as a series
    ; of ordered pairs described in the polyX[] and polyY[] arrays.
    ; If (x, y) lies exactly on one of the line segments, this functiom may return True or False.
    ; From http://alienryderflex.com/polygon/, converted to Papyrus by Chesko
    
    ; Return Values
    ;     True  = Point is inside polygon
    ;     False = Point lies outside polygon OR polygon arrays are of different lengths

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








; Equipment Compatibility

function NFHLoadUp()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	; Check if already loaded
	if handler.DatastoreHasEntry("18655___Northborn Fur Hoods.esp", 3)
		return
	endif

	

	handler.SetArmorDataByKey("18655___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsLtWhite
	handler.SetArmorDataByKey("18654___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsLtBlack
	handler.SetArmorDataByKey("18653___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsLt
	handler.SetArmorDataByKey("18652___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsHvWhite
	handler.SetArmorDataByKey("18651___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsHvBlack
	handler.SetArmorDataByKey("18650___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsHv
	handler.SetArmorDataByKey("18649___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsBlack
	handler.SetArmorDataByKey("18648___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNs
	handler.SetArmorDataByKey("7567___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodLtWhite
	handler.SetArmorDataByKey("8949___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodHvBlack
	handler.SetArmorDataByKey("764315___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodLt
	handler.SetArmorDataByKey("7566___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodWhite
	handler.SetArmorDataByKey("764314___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHood
	handler.SetArmorDataByKey("8957___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodLtBlack
	handler.SetArmorDataByKey("8956___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodBlack
	handler.SetArmorDataByKey("764316___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodHv
	handler.SetArmorDataByKey("6185___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodHvWhite
	handler.SetArmorDataByKey("18656___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsWhite
endFunction

function COSLoadUp()
	bool loaded

	loaded = IsPluginLoaded(0x0200F615, "Complete Crafting Overhaul_Remade.esp")
	if loaded
		AddCOSDatastoreEntries("Complete Crafting Overhaul_Remade.esp")
	endif

	loaded = IsPluginLoaded(0x0200F615, "Cloaks.esp")
	if loaded
		AddCOSDatastoreEntries("Cloaks.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x0200F615, "Cloaks - Player Only.esp")
		if loaded
			AddCOSDatastoreEntries("Cloaks - Player Only.esp")
		endif
	endif
	if !loaded
		loaded = IsPluginLoaded(0x0200F615, "Cloaks - No Imperial.esp")
		if loaded
			AddCOSDatastoreEntries("Cloaks - No Imperial.esp")
		endif
	endif
endFunction

function AddCOSDatastoreEntries(string asPluginName)
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	; Check if already loaded
	if handler.DatastoreHasEntry("58747___" + asPluginName, 7)
		return
	endif

	;==========BURLAP CLOAKS===========
	handler.SetArmorDataByKey("58747___" + asPluginName, 7, 5, 5) ; CloakForswornAlt
	handler.SetArmorDataByKey("53213___" + asPluginName, 7, 5, 5) ; CloakBurned
	handler.SetArmorDataByKey("49074___" + asPluginName, 7, 5, 5) ; CloakAshlander1
	handler.SetArmorDataByKey("33856___" + asPluginName, 7, 5, 5) ; CloakHjarvoBlanket
	handler.SetArmorDataByKey("62998___" + asPluginName, 7, 5, 5) ; CloakDwemerCeremonial
	handler.SetArmorDataByKey("62977___" + asPluginName, 7, 5, 5) ; CloakAshlander2
	handler.SetArmorDataByKey("61588___" + asPluginName, 7, 5, 5) ; CloakNecroAlt
	handler.SetArmorDataByKey("28327___" + asPluginName, 7, 5, 5) ; CloakDwemer
	handler.SetArmorDataByKey("28329___" + asPluginName, 7, 5, 5) ; CloakDwemerAlt
	handler.SetArmorDataByKey("53221___" + asPluginName, 7, 5, 5) ; CloakWarmSands
	handler.SetArmorDataByKey("67140___" + asPluginName, 7, 5, 5) ; CloakDragonPriest
	handler.SetArmorDataByKey("58751___" + asPluginName, 7, 5, 5) ; CloakWildHunt
	handler.SetArmorDataByKey("61587___" + asPluginName, 7, 5, 5) ; CloakNecro
	handler.SetArmorDataByKey("75456___" + asPluginName, 7, 5, 5) ; CloakShortLover
	handler.SetArmorDataByKey("75455___" + asPluginName, 7, 5, 5) ; CloakShortRedEagle
	handler.SetArmorDataByKey("76856___" + asPluginName, 7, 5, 5) ; CloakShortBlackTalos
	handler.SetArmorDataByKey("76854___" + asPluginName, 7, 5, 5) ; CloakShortSilverhand
	handler.SetArmorDataByKey("76852___" + asPluginName, 7, 5, 5) ; CloakShortStormcloak
	handler.SetArmorDataByKey("76850___" + asPluginName, 7, 5, 5) ; CloakShortMossy
	handler.SetArmorDataByKey("74045___" + asPluginName, 7, 5, 5) ; CloakDPOtar
	handler.SetArmorDataByKey("74046___" + asPluginName, 7, 5, 5) ; CloakDPVokun
	handler.SetArmorDataByKey("74047___" + asPluginName, 7, 5, 5) ; CloakDPVolsung
	handler.SetArmorDataByKey("74048___" + asPluginName, 7, 5, 5) ; CloakDPRahgot
	handler.SetArmorDataByKey("74043___" + asPluginName, 7, 5, 5) ; CloakDPKrosis
	handler.SetArmorDataByKey("74044___" + asPluginName, 7, 5, 5) ; CloakDPMorokei
	handler.SetArmorDataByKey("68520___" + asPluginName, 7, 5, 5) ; CloakDPHevnoraak
	handler.SetArmorDataByKey("68522___" + asPluginName, 7, 5, 5) ; CloakDPNahkriin
	handler.SetArmorDataByKey("62979___" + asPluginName, 7, 5, 5) ; CloakBlackBurlap
	handler.SetArmorDataByKey("62980___" + asPluginName, 7, 5, 5) ; CloakBlueBurlap
	handler.SetArmorDataByKey("62981___" + asPluginName, 7, 5, 5) ; CloakBrownBurlap
	handler.SetArmorDataByKey("62982___" + asPluginName, 7, 5, 5) ; CloakCrimsonBurlap
	handler.SetArmorDataByKey("62983___" + asPluginName, 7, 5, 5) ; CloakGreenBurlap
	handler.SetArmorDataByKey("62984___" + asPluginName, 7, 5, 5) ; CloakGreyBurlap
	handler.SetArmorDataByKey("62985___" + asPluginName, 7, 5, 5) ; CloakWhiteBurlap
	handler.SetArmorDataByKey("74062___" + asPluginName, 7, 5, 5) ; CloakShortBlueBurlap
	handler.SetArmorDataByKey("74063___" + asPluginName, 7, 5, 5) ; CloakShortBlackBurlap
	handler.SetArmorDataByKey("74066___" + asPluginName, 7, 5, 5) ; CloakShortBrownBurlap
	handler.SetArmorDataByKey("74068___" + asPluginName, 7, 5, 5) ; CloakShortCrimsonBurlap
	handler.SetArmorDataByKey("74070___" + asPluginName, 7, 5, 5) ; CloakShortGreenBurlap
	handler.SetArmorDataByKey("74072___" + asPluginName, 7, 5, 5) ; CloakShortGreyBurlap
	handler.SetArmorDataByKey("74074___" + asPluginName, 7, 5, 5) ; CloakShortWhiteBurlap
	
	;==========LINEN CLOAKS===========
	handler.SetArmorDataByKey("58748___" + asPluginName, 7, 10, 10) ; CloakImperialGold
	handler.SetArmorDataByKey("40785___" + asPluginName, 7, 10, 10) ; CloakKvatch
	handler.SetArmorDataByKey("46316___" + asPluginName, 7, 10, 10) ; CloakVaermina
	handler.SetArmorDataByKey("32476___" + asPluginName, 7, 10, 10) ; CloakFallWinterhold
	handler.SetArmorDataByKey("25551___" + asPluginName, 7, 10, 10) ; CloakThalmorAlt
	handler.SetArmorDataByKey("24169___" + asPluginName, 7, 10, 10) ; CloakThalmor
	handler.SetArmorDataByKey("25552___" + asPluginName, 7, 10, 10) ; CloakThalmorAltEnch
	handler.SetArmorDataByKey("58749___" + asPluginName, 7, 10, 10) ; CloakImperialSilver
	handler.SetArmorDataByKey("62995___" + asPluginName, 7, 10, 10) ; CloakDwemerPurple
	handler.SetArmorDataByKey("53223___" + asPluginName, 7, 10, 10) ; CloakSolitudeLinen
	handler.SetArmorDataByKey("42172___" + asPluginName, 7, 10, 10) ; CloakMarkarthLinen
	handler.SetArmorDataByKey("42170___" + asPluginName, 7, 10, 10) ; CloakFalkreathLinen
	handler.SetArmorDataByKey("38022___" + asPluginName, 7, 10, 10) ; CloakRiftenLinen
	handler.SetArmorDataByKey("22786___" + asPluginName, 7, 10, 10) ; CloakLinenBrownHealth02
	handler.SetArmorDataByKey("21380___" + asPluginName, 7, 10, 10) ; CloakWhiterunLinen
	handler.SetArmorDataByKey("21390___" + asPluginName, 7, 10, 10) ; CloakBrownLinen
	handler.SetArmorDataByKey("21391___" + asPluginName, 7, 10, 10) ; CloakCrimsonLinen
	handler.SetArmorDataByKey("21392___" + asPluginName, 7, 10, 10) ; CloakDawnstarLinen
	handler.SetArmorDataByKey("21393___" + asPluginName, 7, 10, 10) ; CloakGreenLinen
	handler.SetArmorDataByKey("21394___" + asPluginName, 7, 10, 10) ; CloakGreyLinen
	handler.SetArmorDataByKey("21395___" + asPluginName, 7, 10, 10) ; CloakHjaalmarchLinen
	handler.SetArmorDataByKey("21396___" + asPluginName, 7, 10, 10) ; CloakStormcloakLinen
	handler.SetArmorDataByKey("21397___" + asPluginName, 7, 10, 10) ; CloakWhiteLinen
	handler.SetArmorDataByKey("21379___" + asPluginName, 7, 10, 10) ; CloakBlackLinen
	handler.SetArmorDataByKey("22785___" + asPluginName, 7, 10, 10) ; CloakLinenBrownHealth01
	handler.SetArmorDataByKey("22784___" + asPluginName, 7, 10, 10) ; CloakLinenBlackResist02
	handler.SetArmorDataByKey("22783___" + asPluginName, 7, 10, 10) ; CloakLinenBlackResist01
	handler.SetArmorDataByKey("25557___" + asPluginName, 7, 10, 10) ; CloakBlueLinen
	handler.SetArmorDataByKey("25563___" + asPluginName, 7, 10, 10) ; CloakWinterholdLinen
	handler.SetArmorDataByKey("72658___" + asPluginName, 7, 10, 10) ; CloakShortBlack
	handler.SetArmorDataByKey("74064___" + asPluginName, 7, 10, 10) ; CloakShortBlue
	handler.SetArmorDataByKey("74065___" + asPluginName, 7, 10, 10) ; CloakShortBrown
	handler.SetArmorDataByKey("74067___" + asPluginName, 7, 10, 10) ; CloakShortCrimson
	handler.SetArmorDataByKey("74069___" + asPluginName, 7, 10, 10) ; CloakShortGreen
	handler.SetArmorDataByKey("74071___" + asPluginName, 7, 10, 10) ; CloakShortGrey
	handler.SetArmorDataByKey("74073___" + asPluginName, 7, 10, 10) ; CloakShortWhite
	handler.SetArmorDataByKey("83903___" + asPluginName, 7, 10, 10) ; CloakShortCollege
	handler.SetArmorDataByKey("1066944___" + asPluginName, 7, 10, 10) ; CloakShortDawnstar
	handler.SetArmorDataByKey("1066945___" + asPluginName, 7, 10, 10) ; CloakShortFalkreath
	handler.SetArmorDataByKey("1066946___" + asPluginName, 7, 10, 10) ; CloakShortHjaalmarch
	handler.SetArmorDataByKey("1066947___" + asPluginName, 7, 10, 10) ; CloakShortMarkarth
	handler.SetArmorDataByKey("1066948___" + asPluginName, 7, 10, 10) ; CloakShortRiften
	handler.SetArmorDataByKey("1066949___" + asPluginName, 7, 10, 10) ; CloakShortSolitude
	handler.SetArmorDataByKey("1066950___" + asPluginName, 7, 10, 10) ; CloakShortWhiterun
	handler.SetArmorDataByKey("1066951___" + asPluginName, 7, 10, 10) ; CloakShortWinterhold
		
	;==========HIDE CLOAKS===========
	handler.SetArmorDataByKey("50454___" + asPluginName, 7, 12, 40) ; CloakForsworn
	handler.SetArmorDataByKey("53219___" + asPluginName, 7, 12, 40) ; CloakNorthPaladin
	handler.SetArmorDataByKey("38016___" + asPluginName, 7, 12, 40) ; CloakHuntersFolly
	handler.SetArmorDataByKey("29714___" + asPluginName, 7, 12, 40) ; CloakCrow
	handler.SetArmorDataByKey("31094___" + asPluginName, 7, 12, 40) ; CloakNya
	handler.SetArmorDataByKey("31096___" + asPluginName, 7, 12, 40) ; CloakGreyFox
	handler.SetArmorDataByKey("24170___" + asPluginName, 7, 12, 40) ; CloakGreybeard
	handler.SetArmorDataByKey("4820___" + asPluginName, 7, 12, 40) ; CloakBrownHealth01
	handler.SetArmorDataByKey("4822___" + asPluginName, 7, 12, 40) ; CloakBlackResist01
	handler.SetArmorDataByKey("4823___" + asPluginName, 7, 12, 40) ; CloakBlackResist02
	handler.SetArmorDataByKey("4821___" + asPluginName, 7, 12, 40) ; CloakBrownHealth02
	handler.SetArmorDataByKey("62997___" + asPluginName, 7, 12, 40) ; CloakDwemerPurpleAlt
	handler.SetArmorDataByKey("42171___" + asPluginName, 7, 12, 40) ; CloakMarkarth
	handler.SetArmorDataByKey("42169___" + asPluginName, 7, 12, 40) ; CloakFalkreath
	handler.SetArmorDataByKey("38021___" + asPluginName, 7, 12, 40) ; CloakRiften
	handler.SetArmorDataByKey("25554___" + asPluginName, 7, 12, 40) ; CloakBlue
	handler.SetArmorDataByKey("18617___" + asPluginName, 7, 12, 40) ; CloakHjaalmarch
	handler.SetArmorDataByKey("18618___" + asPluginName, 7, 12, 40) ; CloakDawnstar
	handler.SetArmorDataByKey("3435___" + asPluginName, 7, 12, 40) ; CloakCrimson
	handler.SetArmorDataByKey("3432___" + asPluginName, 7, 12, 40) ; CloakGreen
	handler.SetArmorDataByKey("10340___" + asPluginName, 7, 12, 40) ; CloakStormcloak
	handler.SetArmorDataByKey("3431___" + asPluginName, 7, 12, 40) ; CloakBlack
	handler.SetArmorDataByKey("3430___" + asPluginName, 7, 12, 40) ; CloakBrown
	handler.SetArmorDataByKey("3433___" + asPluginName, 7, 12, 40) ; CloakGrey
	handler.SetArmorDataByKey("17235___" + asPluginName, 7, 12, 40) ; CloakWhite
	handler.SetArmorDataByKey("22787___" + asPluginName, 7, 12, 40) ; CloakWhiterun
	handler.SetArmorDataByKey("25562___" + asPluginName, 7, 12, 40) ; CloakWinterhold
	handler.SetArmorDataByKey("25564___" + asPluginName, 7, 12, 40) ; CloakSolitude
	handler.SetArmorDataByKey("57362___" + asPluginName, 7, 12, 40) ; CloakHimirHide
	
	;Cloaks of Skyrim 1.2
	handler.SetArmorDataByKey("94961___" + asPluginName, 7, 10, 10) ; CloakDaedric
	handler.SetArmorDataByKey("100481___" + asPluginName, 7, 10, 10) ; CloakComp
	handler.SetArmorDataByKey("89445___" + asPluginName, 7, 10, 10) ; CloakShortImperial
	handler.SetArmorDataByKey("94961___" + asPluginName, 7, 12, 40) ; CloakScale
endFunction

function COSDGLoadUp()
	bool loaded

	loaded = IsPluginLoaded(0x00005905, "Complete Crafting Overhaul_Remade.esp")
	if loaded
		AddCOSDGDatastoreEntries("Complete Crafting Overhaul_Remade.esp")
	endif

	loaded = IsPluginLoaded(0x00000D64, "Cloaks - Dawnguard.esp")
	if loaded
		AddCOSDGDatastoreEntries("Cloaks - Dawnguard.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x00000D64, "Cloaks - Player Only - Dawnguard.esp")
		if loaded
			AddCOSDGDatastoreEntries("Cloaks - Player Only - Dawnguard.esp")
		endif
	endif
	if !loaded
		loaded = IsPluginLoaded(0x00000D64, "Cloaks - No Imperial - Dawnguard.esp")
		if loaded
			AddCOSDGDatastoreEntries("Cloaks - No Imperial - Dawnguard.esp")
		endif
	endif
endFunction

function AddCOSDGDatastoreEntries(string asPluginName)
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	if asPluginName == "Complete Crafting Overhaul_Remade.esp"
		; Check if already loaded
		if handler.DatastoreHasEntry("22789___" + asPluginName, 7)
			return
		endif

		handler.SetArmorDataByKey("22789___" + asPluginName, 7, 10, 10) ; CloakDawnguard
		handler.SetArmorDataByKey("22790___" + asPluginName, 7, 10, 10) ; CloakShortDawnguard
	else
		; Check if already loaded
		if handler.DatastoreHasEntry("3428___" + asPluginName, 7)
			return
		endif
		handler.SetArmorDataByKey("3428___" + asPluginName, 7, 10, 10) ; CloakDawnguard
		handler.SetArmorDataByKey("3429___" + asPluginName, 7, 10, 10) ; CloakShortDawnguard
	endif
endFunction

function HDTCloaksLoadUp()

endFunction

bool function GetWICPluginLoaded()
	;Determine if Winter is Coming is loaded.
	bool loaded

	loaded = IsPluginLoaded(0x01001DD7, "Complete Crafting Overhaul_Remade.esp")
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaks.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaksNoGuards.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaksCRAFT.esp")
	endif
	if !loaded
		return false
	else
		return true
	endif
endFunction

function WICLoadUp()
	bool loaded

	loaded = IsPluginLoaded(0x01001DD7, "Complete Crafting Overhaul_Remade.esp")
	if loaded
		AddWICDatastoreEntries("Complete Crafting Overhaul_Remade.esp")
	endif

	loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaks.esp")
	if loaded
		AddWICDatastoreEntries("1nivWICCloaks.esp")
	endif
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaksNoGuards.esp")
		if loaded
			AddWICDatastoreEntries("1nivWICCloaksNoGuards.esp")
		endif
	endif
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaksCRAFT.esp")
		if loaded
			AddWICDatastoreEntries("1nivWICCloaksCRAFT.esp")
		endif
	endif
endFunction

function AddWICDatastoreEntries(string asPluginName)
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	; Check if already loaded
	if handler.DatastoreHasEntry("7639___" + asPluginName, 7) ; 1nivCloakBearClawComBrown
		return
	endif

	handler.SetArmorDataByKey("10445___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComBrown
	handler.SetArmorDataByKey("14581___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComCave
	handler.SetArmorDataByKey("14582___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComSnow
	handler.SetArmorDataByKey("110288___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComSteelBrown
	handler.SetArmorDataByKey("110289___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComSteelCave
	handler.SetArmorDataByKey("110290___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComSteelSnow
	handler.SetArmorDataByKey("76952___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComStuddedBrown
	handler.SetArmorDataByKey("76953___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComStuddedCave
	handler.SetArmorDataByKey("76954___" + asPluginName, 3, 45, 14) ; 1nivHoodBearComStuddedSnow
	handler.SetArmorDataByKey("14586___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateBrown
	handler.SetArmorDataByKey("14587___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateCave
	handler.SetArmorDataByKey("14588___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateSnow
	handler.SetArmorDataByKey("110291___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateSteelBrown
	handler.SetArmorDataByKey("110292___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateSteelCave
	handler.SetArmorDataByKey("110293___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateSteelSnow
	handler.SetArmorDataByKey("78336___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateStuddedBrown
	handler.SetArmorDataByKey("78337___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateStuddedCave
	handler.SetArmorDataByKey("78338___" + asPluginName, 3, 45, 14) ; 1nivHoodBearOrnateStuddedSnow
	handler.SetArmorDataByKey("14583___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimBrown
	handler.SetArmorDataByKey("14584___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimCave
	handler.SetArmorDataByKey("14585___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimSnow
	handler.SetArmorDataByKey("110294___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimSteelBrown
	handler.SetArmorDataByKey("110295___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimSteelCave
	handler.SetArmorDataByKey("110296___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimSteelSnow
	handler.SetArmorDataByKey("78339___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimStuddedBrown
	handler.SetArmorDataByKey("78340___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimStuddedCave
	handler.SetArmorDataByKey("78341___" + asPluginName, 3, 45, 14) ; 1nivHoodBearTrimStuddedSnow
	handler.SetArmorDataByKey("50540___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComBlack
	handler.SetArmorDataByKey("111757___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComSteelBlack
	handler.SetArmorDataByKey("111756___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComSteelTimber
	handler.SetArmorDataByKey("111758___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComSteelWhite
	handler.SetArmorDataByKey("81140___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComStuddedBlack
	handler.SetArmorDataByKey("81141___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComStuddedTimber
	handler.SetArmorDataByKey("81142___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComStuddedWhite
	handler.SetArmorDataByKey("50539___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComTimber
	handler.SetArmorDataByKey("50541___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComWhite
	handler.SetArmorDataByKey("88117___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareBlack
	handler.SetArmorDataByKey("111754___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareSteelBlack
	handler.SetArmorDataByKey("111753___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareSteelTimber
	handler.SetArmorDataByKey("111755___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareSteelWhite
	handler.SetArmorDataByKey("88120___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareStuddedBlack
	handler.SetArmorDataByKey("88119___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareStuddedTimber
	handler.SetArmorDataByKey("88121___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareStuddedWhite
	handler.SetArmorDataByKey("89500___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareTimber
	handler.SetArmorDataByKey("88118___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareWhite
	handler.SetArmorDataByKey("50543___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBBlack
	handler.SetArmorDataByKey("111760___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBSteelBlack
	handler.SetArmorDataByKey("111759___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBSteelTimber
	handler.SetArmorDataByKey("111761___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBSteelWhite
	handler.SetArmorDataByKey("81143___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBStuddedBlack
	handler.SetArmorDataByKey("81144___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBStuddedTimber
	handler.SetArmorDataByKey("81145___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBStuddedWhite
	handler.SetArmorDataByKey("50542___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBTimber
	handler.SetArmorDataByKey("50544___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBWhite
	handler.SetArmorDataByKey("90880___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareBlack
	handler.SetArmorDataByKey("113156___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareSteelBlack
	handler.SetArmorDataByKey("113155___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareSteelTimber
	handler.SetArmorDataByKey("113157___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareSteelWhite
	handler.SetArmorDataByKey("90882___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareStuddedBlack
	handler.SetArmorDataByKey("90883___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareStuddedTimber
	handler.SetArmorDataByKey("90884___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareStuddedWhite
	handler.SetArmorDataByKey("89501___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareTimber
	handler.SetArmorDataByKey("90881___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareWhite
	handler.SetArmorDataByKey("50546___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWBlack
	handler.SetArmorDataByKey("111763___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWSteelBlack
	handler.SetArmorDataByKey("111762___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWSteelTimber
	handler.SetArmorDataByKey("111764___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWSteelWhite
	handler.SetArmorDataByKey("81146___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWStuddedBlack
	handler.SetArmorDataByKey("81147___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWStuddedTimber
	handler.SetArmorDataByKey("81148___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWStuddedWhite
	handler.SetArmorDataByKey("50545___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWTimber
	handler.SetArmorDataByKey("50547___" + asPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWWhite

	handler.SetArmorDataByKey("7639___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComBrown
	handler.SetArmorDataByKey("56156___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComBrownEnchF
	handler.SetArmorDataByKey("56175___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComBrownEnchM
	handler.SetArmorDataByKey("9020___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComCave
	handler.SetArmorDataByKey("56158___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComCaveEnchF
	handler.SetArmorDataByKey("56176___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComCaveEnchM
	handler.SetArmorDataByKey("9021___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComSnow
	handler.SetArmorDataByKey("56159___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComSnowEnchF
	handler.SetArmorDataByKey("56177___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawComSnowEnchM
	handler.SetArmorDataByKey("9025___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateBrown
	handler.SetArmorDataByKey("56160___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateBrownEnchF
	handler.SetArmorDataByKey("56178___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateBrownEnchM
	handler.SetArmorDataByKey("9026___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateCave
	handler.SetArmorDataByKey("56161___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateCaveEnchF
	handler.SetArmorDataByKey("56179___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateCaveEnchM
	handler.SetArmorDataByKey("9027___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateSnow
	handler.SetArmorDataByKey("56162___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateSnowEnchF
	handler.SetArmorDataByKey("56180___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateSnowEnchM
	handler.SetArmorDataByKey("9022___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimBrown
	handler.SetArmorDataByKey("56163___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimBrownEnchF
	handler.SetArmorDataByKey("56181___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimBrownEnchM
	handler.SetArmorDataByKey("9023___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimCave
	handler.SetArmorDataByKey("56164___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimCaveEnchF
	handler.SetArmorDataByKey("56182___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimCaveEnchM
	handler.SetArmorDataByKey("9024___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimSnow
	handler.SetArmorDataByKey("56165___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimSnowEnchF
	handler.SetArmorDataByKey("56183___" + asPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimSnowEnchM
	handler.SetArmorDataByKey("9029___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComBlack
	handler.SetArmorDataByKey("56166___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComBlackEnchF
	handler.SetArmorDataByKey("56184___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComBlackEnchM
	handler.SetArmorDataByKey("9028___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComTimber
	handler.SetArmorDataByKey("56167___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComTimberEnchF
	handler.SetArmorDataByKey("56185___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComTimberEnchM
	handler.SetArmorDataByKey("9030___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComWhite
	handler.SetArmorDataByKey("56168___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComWhiteEnchF
	handler.SetArmorDataByKey("56186___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComWhiteEnchM
	handler.SetArmorDataByKey("70014___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareBlack
	handler.SetArmorDataByKey("70016___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareBlackEnchF
	handler.SetArmorDataByKey("70019___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareBlackEnchM
	handler.SetArmorDataByKey("70013___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareTimber
	handler.SetArmorDataByKey("70017___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareTimberEnchF
	handler.SetArmorDataByKey("70020___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareTimberEnchM
	handler.SetArmorDataByKey("70015___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareWhite
	handler.SetArmorDataByKey("70018___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareWhiteEnchF
	handler.SetArmorDataByKey("70021___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareWhiteEnchM
	handler.SetArmorDataByKey("9034___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBBlack
	handler.SetArmorDataByKey("56169___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBBlackEnchF
	handler.SetArmorDataByKey("56187___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBBlackEnchM
	handler.SetArmorDataByKey("9035___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBTimber
	handler.SetArmorDataByKey("56170___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBTimberEnchF
	handler.SetArmorDataByKey("56188___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBTimberEnchM
	handler.SetArmorDataByKey("9036___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBWhite
	handler.SetArmorDataByKey("56171___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBWhiteEnchF
	handler.SetArmorDataByKey("56189___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBWhiteEnchM
	handler.SetArmorDataByKey("9032___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWBlack
	handler.SetArmorDataByKey("56172___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWBlackEnchF
	handler.SetArmorDataByKey("56190___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWBlackEnchM
	handler.SetArmorDataByKey("9031___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWTimber
	handler.SetArmorDataByKey("56173___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWTimberEnchF
	handler.SetArmorDataByKey("56191___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWTimberEnchM
	handler.SetArmorDataByKey("9033___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWWhite
	handler.SetArmorDataByKey("56174___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWWhiteEnchF
	handler.SetArmorDataByKey("56192___" + asPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWWhiteEnchM
endFunction

function AEALoadUp()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	; Check if already loaded
	if handler.DatastoreHasEntry("20056___AesirArmor.esp", 7)
		return
	endif

	handler.SetArmorDataByKey("20056___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("130085___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("98064___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("130086___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("98065___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("130087___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("233387___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("233392___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("233388___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("233393___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("233389___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("233394___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.SetArmorDataByKey("95268___AesirArmor.esp", 1, 175, 54) ; body full
	handler.SetArmorDataByKey("125934___AesirArmor.esp", 1, 175, 54) ; body full
	handler.SetArmorDataByKey("49193___AesirArmor.esp", 1, 175, 54) ; body full
	handler.SetArmorDataByKey("247294___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("247295___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("247296___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("247297___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("10379___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("130178___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("18674___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("131557___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("18675___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("131559___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("18676___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("131558___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211121___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211122___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211123___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211124___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211125___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211126___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211127___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211128___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211129___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("212522___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211130___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("212523___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211131___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("212524___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211136___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("212525___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211135___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("212526___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211132___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("212527___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211133___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("212528___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("211134___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("212529___AesirArmor.esp", 3, 50, 14) ; head full
	handler.SetArmorDataByKey("49195___AesirArmor.esp", 2, 21, 14) ; hands full
	handler.SetArmorDataByKey("31538___AesirArmor.esp", 2, 21, 14) ; hands full
	handler.SetArmorDataByKey("131561___AesirArmor.esp", 2, 21, 14) ; hands full
	handler.SetArmorDataByKey("31541___AesirArmor.esp", 4, 21, 14) ; feet full
	handler.SetArmorDataByKey("131560___AesirArmor.esp", 4, 21, 14) ; feet full
	handler.SetArmorDataByKey("49194___AesirArmor.esp", 4, 21, 14) ; feet full
endFunction

function WACLoadUp()
	_WetIsUnderShelterFaction = Game.GetFormFromFile(0x07119C, "WetandCold.esp") as Faction

	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	; Check if already loaded
	if handler.DatastoreHasEntry("860640___WetandCold.esp", 7)
		return
	endif

	handler.SetArmorDataByKey("860640___WetandCold.esp", 7, 10, 10) ; _WetCloak1 linen
	handler.SetArmorDataByKey("860649___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Black linen
	handler.SetArmorDataByKey("864795___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Blue linen
	handler.SetArmorDataByKey("864791___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Gray linen
	handler.SetArmorDataByKey("864794___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Green linen
	handler.SetArmorDataByKey("864796___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Purple linen
	handler.SetArmorDataByKey("864792___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Red linen
	handler.SetArmorDataByKey("864793___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Yellow linen
	handler.SetArmorDataByKey("415000___WetandCold.esp", 7, 40, 12) ; _WetCloakFur1 fur
	handler.SetArmorDataByKey("514265___WetandCold.esp", 7, 40, 12) ; _WetCloakFur1_Black fur
	handler.SetArmorDataByKey("416384___WetandCold.esp", 7, 40, 12) ; _WetCloakFur1_Brown fur
	handler.SetArmorDataByKey("416380___WetandCold.esp", 7, 40, 12) ; _WetCloakFur1_Gray fur
	handler.SetArmorDataByKey("831666___WetandCold.esp", 7, 40, 12) ; _WetCloakFur2 fur
	handler.SetArmorDataByKey("831673___WetandCold.esp", 7, 40, 12) ; _WetCloakFur2_Black fur
	handler.SetArmorDataByKey("831674___WetandCold.esp", 7, 40, 12) ; _WetCloakFur2_Brown fur
	handler.SetArmorDataByKey("831675___WetandCold.esp", 7, 40, 12) ; _WetCloakFur2_Gray fur
	handler.SetArmorDataByKey("152448___WetandCold.esp", 2, 5, 14) ; _WetGloves1
	handler.SetArmorDataByKey("698278___WetandCold.esp", 2, 5, 14) ; _WetGloves1_Blue
	handler.SetArmorDataByKey("152450___WetandCold.esp", 2, 5, 14) ; _WetGloves1_Gray
	handler.SetArmorDataByKey("698279___WetandCold.esp", 2, 5, 14) ; _WetGloves1_Green
	handler.SetArmorDataByKey("152451___WetandCold.esp", 2, 5, 14) ; _WetGloves1_Yellow
	handler.SetArmorDataByKey("95879___WetandCold.esp", 3, 35, 43) ; _WetHood1
	handler.SetArmorDataByKey("334976___WetandCold.esp", 3, 35, 43) ; _WetHood1_Teal
	handler.SetArmorDataByKey("95880___WetandCold.esp", 3, 35, 43) ; _WetHood2
	handler.SetArmorDataByKey("104164___WetandCold.esp", 3, 35, 43) ; _WetHood2_Gray
	handler.SetArmorDataByKey("97267___WetandCold.esp", 3, 35, 43) ; _WetHood3
	handler.SetArmorDataByKey("104163___WetandCold.esp", 3, 35, 43) ; _WetHood3_Yellow
	handler.SetArmorDataByKey("450851___WetandCold.esp", 3, 35, 43) ; _WetHood4
	handler.SetArmorDataByKey("804073___WetandCold.esp", 3, 35, 28) ; _WetHood5
	handler.SetArmorDataByKey("804074___WetandCold.esp", 3, 35, 28) ; _WetHood5_Brown
	handler.SetArmorDataByKey("804075___WetandCold.esp", 3, 35, 28) ; _WetHood5_Gray
	handler.SetArmorDataByKey("804076___WetandCold.esp", 3, 35, 28) ; _WetHood5_Green
	handler.SetArmorDataByKey("804077___WetandCold.esp", 3, 35, 28) ; _WetHood5_Red
	handler.SetArmorDataByKey("146916___WetandCold.esp", 3, 45, 14) ; _WetHoodFur1
	handler.SetArmorDataByKey("146917___WetandCold.esp", 3, 45, 14) ; _WetHoodFur1_Black
	handler.SetArmorDataByKey("699670___WetandCold.esp", 3, 45, 14) ; _WetHoodFur1_Brown
	handler.SetArmorDataByKey("146918___WetandCold.esp", 3, 45, 14) ; _WetHoodFur1_Gray
	handler.SetArmorDataByKey("873070___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2
	handler.SetArmorDataByKey("874470___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2_Black
	handler.SetArmorDataByKey("874471___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2_Brown
	handler.SetArmorDataByKey("874472___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2_LightBrown
	handler.SetArmorDataByKey("874473___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2_White
	handler.SetArmorDataByKey("874476___WetandCold.esp", 3, 45, 14) ; _WetHoodFur3
	handler.SetArmorDataByKey("874481___WetandCold.esp", 3, 45, 14) ; _WetHoodFur3_Black
	handler.SetArmorDataByKey("874482___WetandCold.esp", 3, 45, 14) ; _WetHoodFur3_White
	handler.SetArmorDataByKey("841332___WetandCold.esp", 3, 45, 14) ; _WetHoodFurLined1
	handler.SetArmorDataByKey("842717___WetandCold.esp", 3, 45, 14) ; _WetHoodFurLined1_Brown
	handler.SetArmorDataByKey("842718___WetandCold.esp", 3, 45, 14) ; _WetHoodFurLined1_Dark
endFunction

function IMALoadUp()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	; Check if already loaded
	if handler.DatastoreHasEntry("20258___Hothtrooper44_ArmorCompilation.esp", 1)
		return
	endif

	handler.SetArmorDataByKey("20258___Hothtrooper44_ArmorCompilation.esp", 1, 125, 54) ; IAAkaviriSamuraiCuirass
	handler.SetArmorDataByKey("144010___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IAAlduinCuirass
	handler.SetArmorDataByKey("46671___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IAApotheusCuirass
	handler.SetArmorDataByKey("23132___Hothtrooper44_ArmorCompilation.esp", 1, 30, 0) ; IABarbarianCuirass
	handler.SetArmorDataByKey("144116___Hothtrooper44_ArmorCompilation.esp", 1, 125, 54) ; IABoiledChitinHCuirass
	handler.SetArmorDataByKey("544585___Hothtrooper44_ArmorCompilation.esp", 1, 125, 54) ; IABoiledChitinLCuirass
	handler.SetArmorDataByKey("145634___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerCuirass
	handler.SetArmorDataByKey("145637___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerEngravedCuirass
	handler.SetArmorDataByKey("145646___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerHeavyCuirass
	handler.SetArmorDataByKey("145653___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerHuntHeavyCuirass
	handler.SetArmorDataByKey("145656___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerHuntLightCuirass
	handler.SetArmorDataByKey("143594___Hothtrooper44_ArmorCompilation.esp", 1, 0, 0) ; IAConanCuirass
	handler.SetArmorDataByKey("143608___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IACrimsonArcherCuirass
	handler.SetArmorDataByKey("145723___Hothtrooper44_ArmorCompilation.esp", 1, 160, 91) ; IADaedricLordCuirass
	handler.SetArmorDataByKey("139237___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonEbonBulkyCuirass
	handler.SetArmorDataByKey("139238___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonEbonSleekCuirass
	handler.SetArmorDataByKey("143558___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonKnightCuirassFox
	handler.SetArmorDataByKey("143557___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonKnightCuirassFull
	handler.SetArmorDataByKey("15925___Hothtrooper44_ArmorCompilation.esp", 1, 190, 72) ; IAEinherjarBrigandineDarkCuirass
	handler.SetArmorDataByKey("15926___Hothtrooper44_ArmorCompilation.esp", 1, 190, 72) ; IAEinherjarBrigandineLightCuirass
	handler.SetArmorDataByKey("32830___Hothtrooper44_ArmorCompilation.esp", 1, 190, 72) ; IAEinherjarPlateDarkCuirass
	handler.SetArmorDataByKey("4820___Hothtrooper44_ArmorCompilation.esp", 1, 190, 72) ; IAEinherjarPlateLightCuirass
	handler.SetArmorDataByKey("3428___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAFalkreathCuirass
	handler.SetArmorDataByKey("144118___Hothtrooper44_ArmorCompilation.esp", 1, 190, 91) ; IAGlacialCrystalHCuirass
	handler.SetArmorDataByKey("544590___Hothtrooper44_ArmorCompilation.esp", 1, 190, 91) ; IAGlacialCrystalLCuirass
	handler.SetArmorDataByKey("3478___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAHedgeKnightCuirass
	handler.SetArmorDataByKey("23065___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAHeroicImperialCuirass
	handler.SetArmorDataByKey("43878___Hothtrooper44_ArmorCompilation.esp", 1, 140, 35) ; IAHeroicStormcloakCuirass
	handler.SetArmorDataByKey("14469___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IAHunterCuirass
	handler.SetArmorDataByKey("436741___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAImperialKnightCuirass
	handler.SetArmorDataByKey("23050___Hothtrooper44_ArmorCompilation.esp", 1, 110, 35) ; IAMercenaryCuirass
	handler.SetArmorDataByKey("43874___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAPaladinCuirass
	; handler.SetArmorDataByKey("23102___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordHeavyCuirass
	; handler.SetArmorDataByKey("23106___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordLightCuirass
	handler.SetArmorDataByKey("23151___Hothtrooper44_ArmorCompilation.esp", 1, 110, 35) ; IARangerCuirass
	handler.SetArmorDataByKey("3440___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IARedguardKnightHeavyCuirass
	handler.SetArmorDataByKey("3441___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IARedguardKnightLightCuirass
	handler.SetArmorDataByKey("144113___Hothtrooper44_ArmorCompilation.esp", 1, 110, 35) ; IARingmailCuirass
	handler.SetArmorDataByKey("139149___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IARitualBoethiahCuirass
	handler.SetArmorDataByKey("43870___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IASeadogCuirass
	handler.SetArmorDataByKey("144117___Hothtrooper44_ArmorCompilation.esp", 1, 140, 35) ; IASnowBearCuirass
	handler.SetArmorDataByKey("53616___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IASpellbinderCrimsonCuirass
	handler.SetArmorDataByKey("53617___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IASpellbinderRunicCuirass
	handler.SetArmorDataByKey("436720___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAStormlordCuirass
	handler.SetArmorDataByKey("143492___Hothtrooper44_ArmorCompilation.esp", 1, 140, 35) ; IATrollbaneHeavyCuirass
	handler.SetArmorDataByKey("143498___Hothtrooper44_ArmorCompilation.esp", 1, 140, 35) ; IATrollbaneLightCuirass
	handler.SetArmorDataByKey("3447___Hothtrooper44_ArmorCompilation.esp", 1, 128, 106) ; IAVagabondCrimsonCuirass
	handler.SetArmorDataByKey("3449___Hothtrooper44_ArmorCompilation.esp", 1, 128, 106) ; IAVagabondDuskCuirass
	handler.SetArmorDataByKey("3448___Hothtrooper44_ArmorCompilation.esp", 1, 128, 106) ; IAVagabondLeatherCuirass
	handler.SetArmorDataByKey("3460___Hothtrooper44_ArmorCompilation.esp", 1, 128, 106) ; IAVanguardPlateCuirass
	handler.SetArmorDataByKey("144124___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAVvardenfellGlassCuirass
	handler.SetArmorDataByKey("50833___Hothtrooper44_ArmorCompilation.esp", 1, 125, 54) ; IAWitchplateCuirass
	handler.SetArmorDataByKey("143995___Hothtrooper44_ArmorCompilation.esp", 1, 110, 52) ; IABrigandDwemerScrap
	handler.SetArmorDataByKey("143996___Hothtrooper44_ArmorCompilation.esp", 1, 90, 35) ; IABrigandHighwayChain
	handler.SetArmorDataByKey("143997___Hothtrooper44_ArmorCompilation.esp", 1, 90, 35) ; IABrigandIronHide
	handler.SetArmorDataByKey("20284___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonhideHeavyRobe
	handler.SetArmorDataByKey("144024___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonhideLRobe
	handler.SetArmorDataByKey("226058___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonhideURobe
	handler.SetArmorDataByKey("23079___Hothtrooper44_ArmorCompilation.esp", 1, 140, 72) ; IADwarvenMageHRobe
	handler.SetArmorDataByKey("144028___Hothtrooper44_ArmorCompilation.esp", 1, 140, 72) ; IADwarvenMageLRobe
	handler.SetArmorDataByKey("226053___Hothtrooper44_ArmorCompilation.esp", 1, 140, 72) ; IADwarvenMageURobe
	handler.SetArmorDataByKey("145736___Hothtrooper44_ArmorCompilation.esp", 1, 140, 54) ; IAEbonyMageHeavyRobe
	handler.SetArmorDataByKey("145740___Hothtrooper44_ArmorCompilation.esp", 1, 140, 54) ; IAEbonyMageLightRobe
	handler.SetArmorDataByKey("226045___Hothtrooper44_ArmorCompilation.esp", 1, 140, 54) ; IAEbonyMageUnarmoredRobe
	handler.SetArmorDataByKey("143533___Hothtrooper44_ArmorCompilation.esp", 1, 40, 0) ; IAShamanLRobe
	handler.SetArmorDataByKey("536248___Hothtrooper44_ArmorCompilation.esp", 1, 40, 0) ; IAShamanURobe
	handler.SetArmorDataByKey("143706___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeBlackCloak
	handler.SetArmorDataByKey("143701___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeBlackNoCloak
	handler.SetArmorDataByKey("143707___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeBlueCloak
	handler.SetArmorDataByKey("143702___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeBlueNoCloak
	handler.SetArmorDataByKey("143708___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeGreenCloak
	handler.SetArmorDataByKey("143703___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeGreenNoCloak
	handler.SetArmorDataByKey("143709___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeRedCloak
	handler.SetArmorDataByKey("143704___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeRedNoCloak
	handler.SetArmorDataByKey("143710___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeWhiteCloak
	handler.SetArmorDataByKey("143705___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeWhiteNoCloak
	handler.SetArmorDataByKey("143731___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeBlackCloak
	handler.SetArmorDataByKey("143726___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeBlackNoCloak
	handler.SetArmorDataByKey("143732___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeBlueCloak
	handler.SetArmorDataByKey("143727___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeBlueNoCloak
	handler.SetArmorDataByKey("143733___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeGreenCloak
	handler.SetArmorDataByKey("143728___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeGreenNoCloak
	handler.SetArmorDataByKey("143734___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeRedCloak
	handler.SetArmorDataByKey("143729___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeRedNoCloak
	handler.SetArmorDataByKey("143735___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeWhiteCloak
	handler.SetArmorDataByKey("143730___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeWhiteNoCloak
	handler.SetArmorDataByKey("143755___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeBlack
	handler.SetArmorDataByKey("143756___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeBlue
	handler.SetArmorDataByKey("143757___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeGreen
	handler.SetArmorDataByKey("143758___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeRed
	handler.SetArmorDataByKey("143759___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeWhite
	handler.SetArmorDataByKey("16070___Hothtrooper44_ArmorCompilation.esp", 1, 75, 35) ; IANordMailHeavyHauberk
	handler.SetArmorDataByKey("16068___Hothtrooper44_ArmorCompilation.esp", 1, 75, 35) ; IANordMailLightShirt
	handler.SetArmorDataByKey("3466___Hothtrooper44_ArmorCompilation.esp", 1, 175, 54) ; IAWarchiefHeavyBulwark
	handler.SetArmorDataByKey("3467___Hothtrooper44_ArmorCompilation.esp", 1, 175, 54) ; IAWarchiefLightBulwark


	handler.SetArmorDataByKey("20259___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IAAkaviriSamuraiGauntlets
	handler.SetArmorDataByKey("144011___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IAAlduinGauntlets
	handler.SetArmorDataByKey("23133___Hothtrooper44_ArmorCompilation.esp", 2, 7, 6) ; IABarbarianGauntlets
	handler.SetArmorDataByKey("144096___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IABoiledChitinHGauntlets
	handler.SetArmorDataByKey("544586___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IABoiledChitinLGauntlets
	handler.SetArmorDataByKey("145647___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerHeavyGauntlets
	handler.SetArmorDataByKey("145654___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerHuntHeavyGauntlets
	handler.SetArmorDataByKey("145657___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerHuntLightGauntlets
	handler.SetArmorDataByKey("145724___Hothtrooper44_ArmorCompilation.esp", 2, 18, 21) ; IADaedricLordGauntlets
	handler.SetArmorDataByKey("139239___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonEbonBulkyGauntlets
	handler.SetArmorDataByKey("143560___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonKnightGauntlets0
	handler.SetArmorDataByKey("143561___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonKnightGauntlets1
	handler.SetArmorDataByKey("143562___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonKnightGauntlets2
	handler.SetArmorDataByKey("23080___Hothtrooper44_ArmorCompilation.esp", 2, 15, 21) ; IADwarvenMageHGauntlets
	handler.SetArmorDataByKey("144026___Hothtrooper44_ArmorCompilation.esp", 2, 15, 21) ; IADwarvenMageLGauntlets
	handler.SetArmorDataByKey("226051___Hothtrooper44_ArmorCompilation.esp", 2, 15, 21) ; IADwarvenMageUGauntlets
	handler.SetArmorDataByKey("15917___Hothtrooper44_ArmorCompilation.esp", 2, 24, 21) ; IAEinherjarBrigandineDarkGauntlets
	handler.SetArmorDataByKey("32832___Hothtrooper44_ArmorCompilation.esp", 2, 24, 21) ; IAEinherjarPlateDarkGauntlets
	handler.SetArmorDataByKey("4818___Hothtrooper44_ArmorCompilation.esp", 2, 24, 21) ; IAEinherjarPlateLightGauntlets
	handler.SetArmorDataByKey("3429___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAFalkreathGauntlets
	handler.SetArmorDataByKey("144100___Hothtrooper44_ArmorCompilation.esp", 2, 24, 14) ; IAGlacialCrystalHGauntlets
	handler.SetArmorDataByKey("544591___Hothtrooper44_ArmorCompilation.esp", 2, 24, 14) ; IAGlacialCrystalLGauntlets
	handler.SetArmorDataByKey("3479___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAHedgeKnightGauntlets
	handler.SetArmorDataByKey("43877___Hothtrooper44_ArmorCompilation.esp", 2, 18, 14) ; IAHeroicStormcloakGauntlets
	handler.SetArmorDataByKey("23051___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IAMercenaryGauntlets
	handler.SetArmorDataByKey("43873___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAPaladinGauntlets
	;handler.SetArmorDataByKey("23103___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordHeavyGauntlets
	;handler.SetArmorDataByKey("23107___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordLightGauntlets
	handler.SetArmorDataByKey("3436___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IARedguardKnightHeavyGauntlets
	handler.SetArmorDataByKey("3437___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IARedguardKnightLightGauntlets
	handler.SetArmorDataByKey("6189___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IASeadogGauntlets
	handler.SetArmorDataByKey("144120___Hothtrooper44_ArmorCompilation.esp", 2, 18, 14) ; IASnowBearGauntlets
	handler.SetArmorDataByKey("53615___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IASpellbinderCrimsonGauntlets
	handler.SetArmorDataByKey("53618___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IASpellbinderRunicGauntlets
	handler.SetArmorDataByKey("436721___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAStormlordGauntlets
	handler.SetArmorDataByKey("143493___Hothtrooper44_ArmorCompilation.esp", 2, 18, 14) ; IATrollbaneHeavyGauntlets
	handler.SetArmorDataByKey("3453___Hothtrooper44_ArmorCompilation.esp", 2, 12, 35) ; IAVagabondCrimsonGauntlets
	handler.SetArmorDataByKey("3455___Hothtrooper44_ArmorCompilation.esp", 2, 12, 35) ; IAVagabondDuskGauntlets
	handler.SetArmorDataByKey("3461___Hothtrooper44_ArmorCompilation.esp", 2, 15, 21) ; IAVanguardPlateGauntlets
	handler.SetArmorDataByKey("144125___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IAVvardenfellGlassGauntlets
	handler.SetArmorDataByKey("50835___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IAWitchplateGauntlets
	handler.SetArmorDataByKey("46670___Hothtrooper44_ArmorCompilation.esp", 2, 10, 6) ; IAApotheusGloves
	handler.SetArmorDataByKey("143609___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IACrimsonArcherGloves
	handler.SetArmorDataByKey("139240___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonEbonSleekGloves
	handler.SetArmorDataByKey("20281___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonhideHeavyGloves
	handler.SetArmorDataByKey("144022___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonhideLGloves
	handler.SetArmorDataByKey("226061___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonhideUGloves
	handler.SetArmorDataByKey("145737___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAEbonyMageHeavyGloves
	handler.SetArmorDataByKey("145741___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAEbonyMageLightGloves
	handler.SetArmorDataByKey("226043___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAEbonyMageUnarmoredGloves
	handler.SetArmorDataByKey("139150___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IARitualBoethiahGloves
	handler.SetArmorDataByKey("143536___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IAShamanLGloves
	handler.SetArmorDataByKey("536246___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IAShamanUGloves
	handler.SetArmorDataByKey("143691___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesBlack
	handler.SetArmorDataByKey("143692___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesBlue
	handler.SetArmorDataByKey("143693___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesGreen
	handler.SetArmorDataByKey("143694___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesRed
	handler.SetArmorDataByKey("143695___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesWhite
	handler.SetArmorDataByKey("143716___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesBlack
	handler.SetArmorDataByKey("143717___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesBlue
	handler.SetArmorDataByKey("143718___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesGreen
	handler.SetArmorDataByKey("143719___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesRed
	handler.SetArmorDataByKey("143720___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesWhite
	handler.SetArmorDataByKey("143745___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesBlack
	handler.SetArmorDataByKey("143746___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesBlue
	handler.SetArmorDataByKey("143747___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesGreen
	handler.SetArmorDataByKey("143748___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesRed
	handler.SetArmorDataByKey("143749___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesWhite
	handler.SetArmorDataByKey("145643___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerBracers
	handler.SetArmorDataByKey("145638___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerEngravedBracers
	handler.SetArmorDataByKey("143592___Hothtrooper44_ArmorCompilation.esp", 2, 3, 0) ; IAConanBracers
	handler.SetArmorDataByKey("15918___Hothtrooper44_ArmorCompilation.esp", 2, 24, 21) ; IAEinherjarBrigandineLightBracers
	handler.SetArmorDataByKey("23066___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IAHeroicImperialBracers
	handler.SetArmorDataByKey("14468___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IAHunterBracers
	handler.SetArmorDataByKey("16065___Hothtrooper44_ArmorCompilation.esp", 2, 7, 6) ; IANordMailHeavyBracers
	handler.SetArmorDataByKey("16069___Hothtrooper44_ArmorCompilation.esp", 2, 7, 6) ; IANordMailLightBracers
	handler.SetArmorDataByKey("23152___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IARangerBracers
	handler.SetArmorDataByKey("144114___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IARingmailBracers
	handler.SetArmorDataByKey("143499___Hothtrooper44_ArmorCompilation.esp", 2, 18, 14) ; IATrollbaneLightBracers
	handler.SetArmorDataByKey("3454___Hothtrooper44_ArmorCompilation.esp", 2, 12, 35) ; IAVagabondLeatherBracers
	handler.SetArmorDataByKey("436744___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAImperialKnightVambraces
	handler.SetArmorDataByKey("3470___Hothtrooper44_ArmorCompilation.esp", 2, 21, 14) ; IAWarchiefHeavyGrips
	handler.SetArmorDataByKey("3471___Hothtrooper44_ArmorCompilation.esp", 2, 21, 14) ; IAWarchiefLightGrips


	handler.SetArmorDataByKey("20260___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAAkaviriSamuraiHelmet
	handler.SetArmorDataByKey("144012___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IAAlduinHelmet
	handler.SetArmorDataByKey("46669___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IAApotheusHelm
	handler.SetArmorDataByKey("23134___Hothtrooper44_ArmorCompilation.esp", 3, 15, 3) ; IABarbarianHelmet
	handler.SetArmorDataByKey("144097___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IABoiledChitinHHelmet
	handler.SetArmorDataByKey("544587___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IABoiledChitinLHelmet
	handler.SetArmorDataByKey("145639___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IABosmerEngravedHelmet
	handler.SetArmorDataByKey("145648___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IABosmerHeavyHelmet
	handler.SetArmorDataByKey("145649___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IABosmerHelmet
	handler.SetArmorDataByKey("145652___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerHuntHeavyHelmet
	handler.SetArmorDataByKey("139247___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmClassic
	handler.SetArmorDataByKey("139248___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmClassicVeil
	handler.SetArmorDataByKey("139249___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmClaw
	handler.SetArmorDataByKey("139250___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmClawVeil
	handler.SetArmorDataByKey("139243___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmGrand
	handler.SetArmorDataByKey("139244___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmGrandVeil
	handler.SetArmorDataByKey("139245___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmHorn
	handler.SetArmorDataByKey("139246___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmHornVeil
	handler.SetArmorDataByKey("139241___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmStout
	handler.SetArmorDataByKey("139242___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmStoutVeil
	handler.SetArmorDataByKey("543154___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmClassic
	handler.SetArmorDataByKey("543155___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmClassicVeil
	handler.SetArmorDataByKey("543156___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmClaw
	handler.SetArmorDataByKey("543157___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmClawVeil
	handler.SetArmorDataByKey("543158___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmGrand
	handler.SetArmorDataByKey("543159___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmGrandVeil
	handler.SetArmorDataByKey("543160___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmHorn
	handler.SetArmorDataByKey("543161___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmHornVeil
	handler.SetArmorDataByKey("543162___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmStout
	handler.SetArmorDataByKey("543163___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmStoutVeil
	handler.SetArmorDataByKey("143563___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonKnightHHelm
	handler.SetArmorDataByKey("548818___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonKnightLHelm
	handler.SetArmorDataByKey("3430___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAFalkreathHelmet
	handler.SetArmorDataByKey("144101___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAGlacialCrystalHHelmet
	handler.SetArmorDataByKey("544592___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAGlacialCrystalLHelmet
	handler.SetArmorDataByKey("3480___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAHedgeKnightHelmet
	handler.SetArmorDataByKey("23067___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IAHeroicImperialHelmet
	handler.SetArmorDataByKey("43876___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAHeroicStormcloakHelmet
	handler.SetArmorDataByKey("436743___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAImperialKnightHelmet
	handler.SetArmorDataByKey("16071___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IANordMailHeavyHelmet
	handler.SetArmorDataByKey("16072___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IANordMailHeavySpectacleHelmet
	handler.SetArmorDataByKey("16074___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IANordMailLightSpectacleHelmet
	handler.SetArmorDataByKey("16073___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IANordMailLightHelmet
	handler.SetArmorDataByKey("139134___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAOrcishMaskHelm
	handler.SetArmorDataByKey("15853___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAPaladinGreatHelm
	handler.SetArmorDataByKey("43872___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAPaladinHelmet
	;handler.SetArmorDataByKey("23104___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordHeavyHelmet
	;handler.SetArmorDataByKey("23108___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordLightHelmet
	handler.SetArmorDataByKey("139151___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IARitualBoethiahHelm
	handler.SetArmorDataByKey("143534___Hothtrooper44_ArmorCompilation.esp", 3, 45, 3) ; IAShamanLHelm
	handler.SetArmorDataByKey("536247___Hothtrooper44_ArmorCompilation.esp", 3, 45, 3) ; IAShamanUHelm
	handler.SetArmorDataByKey("144121___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IASnowBearHelmet
	handler.SetArmorDataByKey("53613___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IASpellbinderCrimsonHelmet
	handler.SetArmorDataByKey("53620___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IASpellbinderRunicHelmet
	handler.SetArmorDataByKey("436723___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAStormlordHelmet
	handler.SetArmorDataByKey("143496___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IATrollbaneHeavyHelmet
	handler.SetArmorDataByKey("143501___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IATrollbaneLightHelmet
	handler.SetArmorDataByKey("143494___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IATrollbaneHeavyHeaddress
	handler.SetArmorDataByKey("143500___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IATrollbaneLightHeaddress
	handler.SetArmorDataByKey("3472___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAWarchiefHeavyHeaddress
	handler.SetArmorDataByKey("3473___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAWarchiefLightHeaddress
	handler.SetArmorDataByKey("3456___Hothtrooper44_ArmorCompilation.esp", 3, 40, 72) ; IAVagabondHelmet
	handler.SetArmorDataByKey("3462___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAVanguardPlateHelmet
	handler.SetArmorDataByKey("3463___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAVanguardPlateHelmetCLOSED
	handler.SetArmorDataByKey("144126___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IAVvardenfellGlassHelmet
	handler.SetArmorDataByKey("17238___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IAApotheusHood
	handler.SetArmorDataByKey("18651___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodBlack
	handler.SetArmorDataByKey("8949___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodBlackScarf
	handler.SetArmorDataByKey("18650___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodPlain
	handler.SetArmorDataByKey("764316___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodPlainScarf
	handler.SetArmorDataByKey("18652___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodWhite
	handler.SetArmorDataByKey("6185___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodWhiteScarf
	handler.SetArmorDataByKey("18654___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodBlack
	handler.SetArmorDataByKey("8957___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodBlackScarf
	handler.SetArmorDataByKey("18653___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodPlain
	handler.SetArmorDataByKey("764315___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodPlainScarf
	handler.SetArmorDataByKey("18655___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodWhite
	handler.SetArmorDataByKey("7567___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodWhiteScarf
	handler.SetArmorDataByKey("145640___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerEngravedHood
	handler.SetArmorDataByKey("145650___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerHood
	handler.SetArmorDataByKey("145658___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerHuntLightHood
	handler.SetArmorDataByKey("139251___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHood
	handler.SetArmorDataByKey("543164___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHood
	handler.SetArmorDataByKey("20283___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonhideHeavyHood
	handler.SetArmorDataByKey("144023___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonhideLHood
	handler.SetArmorDataByKey("226060___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonhideUHood
	handler.SetArmorDataByKey("23081___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IADwarvenMageHHood
	handler.SetArmorDataByKey("144027___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IADwarvenMageLHood
	handler.SetArmorDataByKey("226052___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IADwarvenMageUHood
	handler.SetArmorDataByKey("145738___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAEbonyMageHeavyHood
	handler.SetArmorDataByKey("145742___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAEbonyMageLightHood
	handler.SetArmorDataByKey("226044___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAEbonyMageUnarmoredHood
	handler.SetArmorDataByKey("15921___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAEinherjarBrigandineDarkHood
	handler.SetArmorDataByKey("15922___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAEinherjarBrigandineLightHood
	handler.SetArmorDataByKey("32831___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAEinherjarPlateDarkHood
	handler.SetArmorDataByKey("4819___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAEinherjarPlateLightHood
	handler.SetArmorDataByKey("18649___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodBlack
	handler.SetArmorDataByKey("8956___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodBlackScarf
	handler.SetArmorDataByKey("18648___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodPlain
	handler.SetArmorDataByKey("764314___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodPlainScarf
	handler.SetArmorDataByKey("18656___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodWhite
	handler.SetArmorDataByKey("7566___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodWhiteScarf
	handler.SetArmorDataByKey("23153___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IARangerHood
	handler.SetArmorDataByKey("144115___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IARingmailHood
	handler.SetArmorDataByKey("143696___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodBlack
	handler.SetArmorDataByKey("143697___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodBlue
	handler.SetArmorDataByKey("143698___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodGreen
	handler.SetArmorDataByKey("143699___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodRed
	handler.SetArmorDataByKey("143700___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodWhite
	handler.SetArmorDataByKey("143721___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodBlack
	handler.SetArmorDataByKey("143722___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodBlue
	handler.SetArmorDataByKey("143723___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodGreen
	handler.SetArmorDataByKey("143724___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodRed
	handler.SetArmorDataByKey("143725___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodWhite
	handler.SetArmorDataByKey("143750___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodBlack
	handler.SetArmorDataByKey("143751___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodBlue
	handler.SetArmorDataByKey("143752___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodGreen
	handler.SetArmorDataByKey("143753___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodRed
	handler.SetArmorDataByKey("143754___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodWhite
	handler.SetArmorDataByKey("50836___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IAWitchplateHood
	handler.SetArmorDataByKey("3427___Hothtrooper44_ArmorCompilation.esp", 3, 0, 0) ; IAFalkreathCrown
	handler.SetArmorDataByKey("3464___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAWarchiefHeavyBattlecrown
	handler.SetArmorDataByKey("3465___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAWarchiefLightBattlecrown
	handler.SetArmorDataByKey("143593___Hothtrooper44_ArmorCompilation.esp", 3, 0, 0) ; IAConanCirclet 	@CHECK
	handler.SetArmorDataByKey("143464___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAMantleSilverHandHeavy
	handler.SetArmorDataByKey("143465___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAMantleSilverHandLight
	handler.SetArmorDataByKey("4807___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IASeadogTricorne
	handler.SetArmorDataByKey("7571___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IASeadogTricorneFeathered
	handler.SetArmorDataByKey("145633___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; Bosmer Coif
	handler.SetArmorDataByKey("145645___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; Bosmer Reinforced Coif


	handler.SetArmorDataByKey("20257___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IAAkaviriSamuraiBoots
	handler.SetArmorDataByKey("144009___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IAAlduinBoots
	handler.SetArmorDataByKey("46672___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IAApotheusBoots
	handler.SetArmorDataByKey("23131___Hothtrooper44_ArmorCompilation.esp", 4, 7, 6) ; IABarbarianBoots
	handler.SetArmorDataByKey("144095___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IABoiledChitinHBoots
	handler.SetArmorDataByKey("544584___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IABoiledChitinLBoots
	handler.SetArmorDataByKey("145632___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerBoots
	handler.SetArmorDataByKey("145635___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerEngravedBoots
	handler.SetArmorDataByKey("145644___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerHeavyBoots
	handler.SetArmorDataByKey("145651___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerHuntHeavyBoots
	handler.SetArmorDataByKey("145655___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerHuntLightBoots
	handler.SetArmorDataByKey("143591___Hothtrooper44_ArmorCompilation.esp", 4, 15, 6) ; IAConanBoots
	handler.SetArmorDataByKey("143607___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IACrimsonArcherBoots
	handler.SetArmorDataByKey("145722___Hothtrooper44_ArmorCompilation.esp", 4, 18, 21) ; IADaedricLordBoots
	handler.SetArmorDataByKey("139235___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonEbonBulkyBoots
	handler.SetArmorDataByKey("139236___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonEbonSleekBoots
	handler.SetArmorDataByKey("20280___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonhideHeavyBoots
	handler.SetArmorDataByKey("144021___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonhideLBoots
	handler.SetArmorDataByKey("226062___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonhideUBoots
	handler.SetArmorDataByKey("143556___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonKnightHBoots
	handler.SetArmorDataByKey("548819___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonKnightLBoots
	handler.SetArmorDataByKey("23078___Hothtrooper44_ArmorCompilation.esp", 4, 15, 21) ; IADwarvenMageHBoots
	handler.SetArmorDataByKey("144025___Hothtrooper44_ArmorCompilation.esp", 4, 15, 21) ; IADwarvenMageLBoots
	handler.SetArmorDataByKey("226050___Hothtrooper44_ArmorCompilation.esp", 4, 15, 21) ; IADwarvenMageUBoots
	handler.SetArmorDataByKey("145735___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAEbonyMageHeavyBoots
	handler.SetArmorDataByKey("145739___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAEbonyMageLightBoots
	handler.SetArmorDataByKey("226042___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAEbonyMageUnarmoredBoots
	handler.SetArmorDataByKey("15913___Hothtrooper44_ArmorCompilation.esp", 4, 24, 21) ; IAEinherjarBrigandineDarkBoots
	handler.SetArmorDataByKey("15914___Hothtrooper44_ArmorCompilation.esp", 4, 24, 21) ; IAEinherjarBrigandineLightBoots
	handler.SetArmorDataByKey("3432___Hothtrooper44_ArmorCompilation.esp", 4, 24, 21) ; IAEinherjarPlateDarkBoots
	handler.SetArmorDataByKey("4817___Hothtrooper44_ArmorCompilation.esp", 4, 24, 21) ; IAEinherjarPlateLightBoots
	handler.SetArmorDataByKey("3426___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAFalkreathBoots
	handler.SetArmorDataByKey("144099___Hothtrooper44_ArmorCompilation.esp", 4, 24, 14) ; IAGlacialCrystalHBoots
	handler.SetArmorDataByKey("544589___Hothtrooper44_ArmorCompilation.esp", 4, 24, 14) ; IAGlacialCrystalLBoots
	handler.SetArmorDataByKey("3477___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAHedgeKnightBoots
	handler.SetArmorDataByKey("23064___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IAHeroicImperialBoots
	handler.SetArmorDataByKey("43879___Hothtrooper44_ArmorCompilation.esp", 4, 18, 14) ; IAHeroicStormcloakBoots
	handler.SetArmorDataByKey("14466___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IAHunterBoots
	handler.SetArmorDataByKey("23049___Hothtrooper44_ArmorCompilation.esp", 4, 12, 6) ; IAMercenaryBoots
	handler.SetArmorDataByKey("16064___Hothtrooper44_ArmorCompilation.esp", 4, 7, 6) ; IANordMailHeavyBoots
	handler.SetArmorDataByKey("16067___Hothtrooper44_ArmorCompilation.esp", 4, 7, 6) ; IANordMailLightBoots
	handler.SetArmorDataByKey("43875___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAPaladinBoots
	;handler.SetArmorDataByKey("23101___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordHeavyBoots
	;handler.SetArmorDataByKey("23105___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordLightBoots
	handler.SetArmorDataByKey("23150___Hothtrooper44_ArmorCompilation.esp", 4, 12, 6) ; IARangerBoots
	handler.SetArmorDataByKey("3434___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IARedguardKnightHeavyBoots
	handler.SetArmorDataByKey("3435___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IARedguardKnightLightBoots
	handler.SetArmorDataByKey("144112___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IARingmailBoots
	handler.SetArmorDataByKey("139148___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IARitualBoethiahBoots
	handler.SetArmorDataByKey("6188___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IASeadogBoots
	handler.SetArmorDataByKey("143535___Hothtrooper44_ArmorCompilation.esp", 4, 15, 6) ; IAShamanLBoots
	handler.SetArmorDataByKey("536245___Hothtrooper44_ArmorCompilation.esp", 4, 15, 6) ; IAShamanUBoots
	handler.SetArmorDataByKey("144119___Hothtrooper44_ArmorCompilation.esp", 4, 18, 14) ; IASnowBearBoots
	handler.SetArmorDataByKey("53614___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IASpellbinderCrimsonBoots
	handler.SetArmorDataByKey("53619___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IASpellbinderRunicBoots
	handler.SetArmorDataByKey("436722___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAStormlordBoots
	handler.SetArmorDataByKey("143686___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsBlack
	handler.SetArmorDataByKey("143687___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsBlue
	handler.SetArmorDataByKey("143688___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsGreen
	handler.SetArmorDataByKey("143689___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsRed
	handler.SetArmorDataByKey("143690___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsWhite
	handler.SetArmorDataByKey("143711___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsBlack
	handler.SetArmorDataByKey("143712___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsBlue
	handler.SetArmorDataByKey("143713___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsGreen
	handler.SetArmorDataByKey("143714___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsRed
	handler.SetArmorDataByKey("143715___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsWhite
	handler.SetArmorDataByKey("143740___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsBlack
	handler.SetArmorDataByKey("143741___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsBlue
	handler.SetArmorDataByKey("143742___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsGreen
	handler.SetArmorDataByKey("143743___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsRed
	handler.SetArmorDataByKey("143744___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsWhite
	handler.SetArmorDataByKey("143491___Hothtrooper44_ArmorCompilation.esp", 4, 18, 14) ; IATrollbaneHeavyBoots
	handler.SetArmorDataByKey("143497___Hothtrooper44_ArmorCompilation.esp", 4, 18, 14) ; IATrollbaneLightBoots
	handler.SetArmorDataByKey("3450___Hothtrooper44_ArmorCompilation.esp", 4, 12, 35) ; IAVagabondCrimsonBoots
	handler.SetArmorDataByKey("3452___Hothtrooper44_ArmorCompilation.esp", 4, 12, 35) ; IAVagabondDuskBoots
	handler.SetArmorDataByKey("3451___Hothtrooper44_ArmorCompilation.esp", 4, 12, 35) ; IAVagabondLeatherBoots
	handler.SetArmorDataByKey("3459___Hothtrooper44_ArmorCompilation.esp", 4, 15, 21) ; IAVanguardPlateBoots
	handler.SetArmorDataByKey("144123___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IAVvardenfellGlassBoots
	handler.SetArmorDataByKey("50834___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IAWitchplateBoots
	handler.SetArmorDataByKey("436742___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAImperialKnightGreaves
	handler.SetArmorDataByKey("3474___Hothtrooper44_ArmorCompilation.esp", 4, 21, 14) ; IAWarchiefHeavyStompers
	handler.SetArmorDataByKey("3475___Hothtrooper44_ArmorCompilation.esp", 4, 21, 14) ; IAWarchiefLightStompers


	handler.SetArmorDataByKey("145642___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IABosmerFullCape
	handler.SetArmorDataByKey("145660___Hothtrooper44_ArmorCompilation.esp", 7, 8, 8) ; IABosmerShoulderCape
	handler.SetArmorDataByKey("145641___Hothtrooper44_ArmorCompilation.esp", 7, 8, 8) ; IABosmerEngravedShoulderCape
	handler.SetArmorDataByKey("436740___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IAImperialKnightCape
	handler.SetArmorDataByKey("63308___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IARedguardKnightCape
	handler.SetArmorDataByKey("11733___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IASeadogCape
	handler.SetArmorDataByKey("143464___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IAMantleSilverHandHeavy
	handler.SetArmorDataByKey("143465___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IAMantleSilverHandLight
	handler.SetArmorDataByKey("43874___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IAPaladinCuirass
	handler.SetArmorDataByKey("23153___Hothtrooper44_ArmorCompilation.esp", 7, 8, 20) ; IARangerHood
	handler.SetArmorDataByKey("144117___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IASnowBearCuirass
	handler.SetArmorDataByKey("436720___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IAStormlordCuirass
	handler.SetArmorDataByKey("143492___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IATrollbaneHeavyCuirass
	handler.SetArmorDataByKey("143498___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IATrollbaneLightCuirass
	handler.SetArmorDataByKey("3447___Hothtrooper44_ArmorCompilation.esp", 7, 20, 20) ; IAVagabondCrimsonCuirass
	handler.SetArmorDataByKey("3449___Hothtrooper44_ArmorCompilation.esp", 7, 20, 20) ; IAVagabondDuskCuirass
	handler.SetArmorDataByKey("3448___Hothtrooper44_ArmorCompilation.esp", 7, 20, 20) ; IAVagabondLeatherCuirass
	handler.SetArmorDataByKey("13097___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IAApotheusScarf
	handler.SetArmorDataByKey("143706___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeBlackCloak
	handler.SetArmorDataByKey("143701___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeBlackNoCloak
	handler.SetArmorDataByKey("143707___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeBlueCloak
	handler.SetArmorDataByKey("143702___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeBlueNoCloak
	handler.SetArmorDataByKey("143708___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeGreenCloak
	handler.SetArmorDataByKey("143703___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeGreenNoCloak
	handler.SetArmorDataByKey("143709___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeRedCloak
	handler.SetArmorDataByKey("143704___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeRedNoCloak
	handler.SetArmorDataByKey("143710___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeWhiteCloak
	handler.SetArmorDataByKey("143705___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeWhiteNoCloak
	handler.SetArmorDataByKey("143731___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeBlackCloak
	handler.SetArmorDataByKey("143726___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeBlackNoCloak
	handler.SetArmorDataByKey("143732___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeBlueCloak
	handler.SetArmorDataByKey("143727___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeBlueNoCloak
	handler.SetArmorDataByKey("143733___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeGreenCloak
	handler.SetArmorDataByKey("143728___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeGreenNoCloak
	handler.SetArmorDataByKey("143734___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeRedCloak
	handler.SetArmorDataByKey("143729___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeRedNoCloak
	handler.SetArmorDataByKey("143735___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeWhiteCloak
	handler.SetArmorDataByKey("143730___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeWhiteNoCloak
	handler.SetArmorDataByKey("143755___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeBlack
	handler.SetArmorDataByKey("143756___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeBlue
	handler.SetArmorDataByKey("143757___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeGreen
	handler.SetArmorDataByKey("143758___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeRed
	handler.SetArmorDataByKey("143759___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeWhite
	handler.SetArmorDataByKey("8949___Hothtrooper44_ArmorCompilation.esp", 7, 20, 6) ; IAArmorHeavyFurHoodBlackScarf
	handler.SetArmorDataByKey("764316___Hothtrooper44_ArmorCompilation.esp", 7, 20, 6) ; IAArmorHeavyFurHoodPlainScarf
	handler.SetArmorDataByKey("6185___Hothtrooper44_ArmorCompilation.esp", 7, 20, 6) ; IAArmorHeavyFurHoodWhiteScarf
	handler.SetArmorDataByKey("8957___Hothtrooper44_ArmorCompilation.esp", 7, 20, 6) ; IAArmorLightFurHoodBlackScarf
	handler.SetArmorDataByKey("764315___Hothtrooper44_ArmorCompilation.esp", 7, 20, 6) ; IAArmorLightFurHoodPlainScarf
	handler.SetArmorDataByKey("7567___Hothtrooper44_ArmorCompilation.esp", 7, 20, 6) ; IAArmorLightFurHoodWhiteScarf


	handler.SetArmorDataByKey("143495___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATrollbaneHeavyMask		@IGNORE
	handler.SetArmorDataByKey("143502___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATrollbaneLightMask 		@IGNORE
	handler.SetArmorDataByKey("143736___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATribunalMaskBronze		@IGNORE
	handler.SetArmorDataByKey("143737___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATribunalMaskEbony		@IGNORE
	handler.SetArmorDataByKey("143738___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATribunalMaskGold		@IGNORE
	handler.SetArmorDataByKey("143739___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATribunalMaskSilver		@IGNORE
	handler.SetArmorDataByKey("139152___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IARitualBoethiahMask		@IGNORE
	handler.SetArmorDataByKey("10329___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IASeadogEarings 			@IGNORE
	handler.SetArmorDataByKey("10335___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IASeadogEyepatch			@IGNORE
	handler.SetArmorDataByKey("145659___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IABosmerMask 				@IGNORE
	handler.SetArmorDataByKey("139153___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IARitualBoethiahShroud	@IGNORE
endFunction

function SendEvent_FrostfallLoaded()
	int handle = ModEvent.Create("Frostfall_Loaded")
	if handle
		ModEvent.Send(handle)
	endif
endFunction

function RegisterCampfireSkill()
	GlobalVariable CampfireAPIVersion = Game.GetFormFromFile(0x03F1BE, "Campfire.esm") as GlobalVariable
	if CampfireAPIVersion && CampfireAPIVersion.GetValueInt() >= 4
		bool b = CampUtil.RegisterPerkTree(_Frost_PerkNodeController_Endurance, "Frostfall.esp")
	else
		debug.trace("[Campfire] ERROR: Unable to register Campfire Skill System for Frostfall.esp. Campfire was not found or the version loaded is not compatible. Expected CampUtil API 4 or higher, got " + CampfireAPIVersion.GetValueInt())
	endif
endFunction
