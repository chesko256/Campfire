scriptname _Frost_Compatibility extends ReferenceAlias

import debug
import FrostUtil

int property SKSE_MIN_VERSION = 10703 autoReadOnly
float property CAMPFIRE_MIN_VERSION = 1.4 autoReadOnly
string CONFIG_PATH = "../FrostfallData/"

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
bool property isDRKLoaded auto hidden						;DarkenD
bool property isSKYRELoaded auto hidden						;Skyim Redone
bool property isSCLoaded auto hidden						;Scenic Carriages
bool property isNFHLoaded auto hidden						;Northborn Fur Hoods
bool property isWICLoaded auto hidden						;Winter is Coming
bool property isCOSLoaded auto hidden						;Cloaks of Skyrim
bool property isCOSDGLoaded auto hidden						;Cloaks of Skyrim - Dawnguard
bool property isAEALoaded auto hidden						;Aesir Armor
bool property isWACLoaded auto hidden						;Wet and Cold

;#Merchant Containers==========================================================
;ObjectReference property MerchantRiverwoodTraderContainer auto

;#FormLists====================================================================
Formlist property _Camp_WorldspacesInteriors auto
Formlist property _Frost_SevereWeatherList auto
Formlist property _Frost_OvercastWeatherList auto
Formlist property _Frost_FastTravelExceptions auto
Formlist property _Frost_ExposureExceptions auto

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

;#Campfire Perk System=============================================================


;#Misc=============================================================================
Message property _Frost_CriticalError_SKSE auto
Message property _Frost_CriticalError_Campfire auto
Message property _Frost_CriticalError_SkyUIInterfacePackage auto
Weather property DLC2AshStorm auto hidden
bool added_spell_books = false

;#Upgrade Flags====================================================================


Event OnPlayerLoadGame()
	RunCompatibility()
	RegisterForKeysOnLoad()
	RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()
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
	
	; Upgrade code goes here

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
	
	trace("[Frostfall]======================================================================================================")
	trace("[Frostfall]                            Frostfall compatibility check complete.   		                        ")
	trace("[Frostfall]======================================================================================================")

	FrostConfig.LoadProfileOnStartup()
	
	RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()
	RegisterForMenusOnLoad()
	AddStartupSpells()
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
	;@TODO
	return 10
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
	handler.AddDatastoreEntryByKey("18655___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsLtWhite
	handler.AddDatastoreEntryByKey("18654___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsLtBlack
	handler.AddDatastoreEntryByKey("18653___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsLt
	handler.AddDatastoreEntryByKey("18652___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsHvWhite
	handler.AddDatastoreEntryByKey("18651___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsHvBlack
	handler.AddDatastoreEntryByKey("18650___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsHv
	handler.AddDatastoreEntryByKey("18649___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsBlack
	handler.AddDatastoreEntryByKey("18648___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNs
	handler.AddDatastoreEntryByKey("7567___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodLtWhite
	handler.AddDatastoreEntryByKey("8949___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodHvBlack
	handler.AddDatastoreEntryByKey("764315___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodLt
	handler.AddDatastoreEntryByKey("7566___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodWhite
	handler.AddDatastoreEntryByKey("764314___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHood
	handler.AddDatastoreEntryByKey("8957___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodLtBlack
	handler.AddDatastoreEntryByKey("8956___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodBlack
	handler.AddDatastoreEntryByKey("764316___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodHv
	handler.AddDatastoreEntryByKey("6185___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodHvWhite
	handler.AddDatastoreEntryByKey("18656___Northborn Fur Hoods.esp", 3, 45, 14) ; ArmorFurHoodNsWhite
endFunction

function COSLoadUp()
	bool loaded
	string sCOSPluginName
	
	loaded = IsPluginLoaded(0x0200F615, "Complete Crafting Overhaul_Remade.esp")
	sCOSPluginName = "Complete Crafting Overhaul_Remade.esp"

	if !loaded
		loaded = IsPluginLoaded(0x0200F615, "Cloaks.esp")
		sCOSPluginName = "Cloaks.esp"
	endif
	
	if !loaded
		loaded = IsPluginLoaded(0x0200F615, "Cloaks - Player Only.esp")
		sCOSPluginName = "Cloaks - Player Only.esp"
	endif
	
	if !loaded
		loaded = IsPluginLoaded(0x0200F615, "Cloaks - No Imperial.esp")
		sCOSPluginName = "Cloaks - No Imperial.esp"
	endif
	
	if !loaded
		return
	endif
	
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	;==========BURLAP CLOAKS===========
	handler.AddDatastoreEntryByKey("58747___" + sCOSPluginName, 7, 5, 5) ; CloakForswornAlt
	handler.AddDatastoreEntryByKey("53213___" + sCOSPluginName, 7, 5, 5) ; CloakBurned
	handler.AddDatastoreEntryByKey("49074___" + sCOSPluginName, 7, 5, 5) ; CloakAshlander1
	handler.AddDatastoreEntryByKey("33856___" + sCOSPluginName, 7, 5, 5) ; CloakHjarvoBlanket
	handler.AddDatastoreEntryByKey("62998___" + sCOSPluginName, 7, 5, 5) ; CloakDwemerCeremonial
	handler.AddDatastoreEntryByKey("62977___" + sCOSPluginName, 7, 5, 5) ; CloakAshlander2
	handler.AddDatastoreEntryByKey("61588___" + sCOSPluginName, 7, 5, 5) ; CloakNecroAlt
	handler.AddDatastoreEntryByKey("28327___" + sCOSPluginName, 7, 5, 5) ; CloakDwemer
	handler.AddDatastoreEntryByKey("28329___" + sCOSPluginName, 7, 5, 5) ; CloakDwemerAlt
	handler.AddDatastoreEntryByKey("53221___" + sCOSPluginName, 7, 5, 5) ; CloakWarmSands
	handler.AddDatastoreEntryByKey("67140___" + sCOSPluginName, 7, 5, 5) ; CloakDragonPriest
	handler.AddDatastoreEntryByKey("58751___" + sCOSPluginName, 7, 5, 5) ; CloakWildHunt
	handler.AddDatastoreEntryByKey("61587___" + sCOSPluginName, 7, 5, 5) ; CloakNecro
	handler.AddDatastoreEntryByKey("75456___" + sCOSPluginName, 7, 5, 5) ; CloakShortLover
	handler.AddDatastoreEntryByKey("75455___" + sCOSPluginName, 7, 5, 5) ; CloakShortRedEagle
	handler.AddDatastoreEntryByKey("76856___" + sCOSPluginName, 7, 5, 5) ; CloakShortBlackTalos
	handler.AddDatastoreEntryByKey("76854___" + sCOSPluginName, 7, 5, 5) ; CloakShortSilverhand
	handler.AddDatastoreEntryByKey("76852___" + sCOSPluginName, 7, 5, 5) ; CloakShortStormcloak
	handler.AddDatastoreEntryByKey("76850___" + sCOSPluginName, 7, 5, 5) ; CloakShortMossy
	handler.AddDatastoreEntryByKey("74045___" + sCOSPluginName, 7, 5, 5) ; CloakDPOtar
	handler.AddDatastoreEntryByKey("74046___" + sCOSPluginName, 7, 5, 5) ; CloakDPVokun
	handler.AddDatastoreEntryByKey("74047___" + sCOSPluginName, 7, 5, 5) ; CloakDPVolsung
	handler.AddDatastoreEntryByKey("74048___" + sCOSPluginName, 7, 5, 5) ; CloakDPRahgot
	handler.AddDatastoreEntryByKey("74043___" + sCOSPluginName, 7, 5, 5) ; CloakDPKrosis
	handler.AddDatastoreEntryByKey("74044___" + sCOSPluginName, 7, 5, 5) ; CloakDPMorokei
	handler.AddDatastoreEntryByKey("68520___" + sCOSPluginName, 7, 5, 5) ; CloakDPHevnoraak
	handler.AddDatastoreEntryByKey("68522___" + sCOSPluginName, 7, 5, 5) ; CloakDPNahkriin
	handler.AddDatastoreEntryByKey("62979___" + sCOSPluginName, 7, 5, 5) ; CloakBlackBurlap
	handler.AddDatastoreEntryByKey("62980___" + sCOSPluginName, 7, 5, 5) ; CloakBlueBurlap
	handler.AddDatastoreEntryByKey("62981___" + sCOSPluginName, 7, 5, 5) ; CloakBrownBurlap
	handler.AddDatastoreEntryByKey("62982___" + sCOSPluginName, 7, 5, 5) ; CloakCrimsonBurlap
	handler.AddDatastoreEntryByKey("62983___" + sCOSPluginName, 7, 5, 5) ; CloakGreenBurlap
	handler.AddDatastoreEntryByKey("62984___" + sCOSPluginName, 7, 5, 5) ; CloakGreyBurlap
	handler.AddDatastoreEntryByKey("62985___" + sCOSPluginName, 7, 5, 5) ; CloakWhiteBurlap
	handler.AddDatastoreEntryByKey("74062___" + sCOSPluginName, 7, 5, 5) ; CloakShortBlueBurlap
	handler.AddDatastoreEntryByKey("74063___" + sCOSPluginName, 7, 5, 5) ; CloakShortBlackBurlap
	handler.AddDatastoreEntryByKey("74066___" + sCOSPluginName, 7, 5, 5) ; CloakShortBrownBurlap
	handler.AddDatastoreEntryByKey("74068___" + sCOSPluginName, 7, 5, 5) ; CloakShortCrimsonBurlap
	handler.AddDatastoreEntryByKey("74070___" + sCOSPluginName, 7, 5, 5) ; CloakShortGreenBurlap
	handler.AddDatastoreEntryByKey("74072___" + sCOSPluginName, 7, 5, 5) ; CloakShortGreyBurlap
	handler.AddDatastoreEntryByKey("74074___" + sCOSPluginName, 7, 5, 5) ; CloakShortWhiteBurlap
	
	;==========LINEN CLOAKS===========
	handler.AddDatastoreEntryByKey("58748___" + sCOSPluginName, 7, 10, 10) ; CloakImperialGold
	handler.AddDatastoreEntryByKey("40785___" + sCOSPluginName, 7, 10, 10) ; CloakKvatch
	handler.AddDatastoreEntryByKey("46316___" + sCOSPluginName, 7, 10, 10) ; CloakVaermina
	handler.AddDatastoreEntryByKey("32476___" + sCOSPluginName, 7, 10, 10) ; CloakFallWinterhold
	handler.AddDatastoreEntryByKey("25551___" + sCOSPluginName, 7, 10, 10) ; CloakThalmorAlt
	handler.AddDatastoreEntryByKey("24169___" + sCOSPluginName, 7, 10, 10) ; CloakThalmor
	handler.AddDatastoreEntryByKey("25552___" + sCOSPluginName, 7, 10, 10) ; CloakThalmorAltEnch
	handler.AddDatastoreEntryByKey("58749___" + sCOSPluginName, 7, 10, 10) ; CloakImperialSilver
	handler.AddDatastoreEntryByKey("62995___" + sCOSPluginName, 7, 10, 10) ; CloakDwemerPurple
	handler.AddDatastoreEntryByKey("53223___" + sCOSPluginName, 7, 10, 10) ; CloakSolitudeLinen
	handler.AddDatastoreEntryByKey("42172___" + sCOSPluginName, 7, 10, 10) ; CloakMarkarthLinen
	handler.AddDatastoreEntryByKey("42170___" + sCOSPluginName, 7, 10, 10) ; CloakFalkreathLinen
	handler.AddDatastoreEntryByKey("38022___" + sCOSPluginName, 7, 10, 10) ; CloakRiftenLinen
	handler.AddDatastoreEntryByKey("22786___" + sCOSPluginName, 7, 10, 10) ; CloakLinenBrownHealth02
	handler.AddDatastoreEntryByKey("21380___" + sCOSPluginName, 7, 10, 10) ; CloakWhiterunLinen
	handler.AddDatastoreEntryByKey("21390___" + sCOSPluginName, 7, 10, 10) ; CloakBrownLinen
	handler.AddDatastoreEntryByKey("21391___" + sCOSPluginName, 7, 10, 10) ; CloakCrimsonLinen
	handler.AddDatastoreEntryByKey("21392___" + sCOSPluginName, 7, 10, 10) ; CloakDawnstarLinen
	handler.AddDatastoreEntryByKey("21393___" + sCOSPluginName, 7, 10, 10) ; CloakGreenLinen
	handler.AddDatastoreEntryByKey("21394___" + sCOSPluginName, 7, 10, 10) ; CloakGreyLinen
	handler.AddDatastoreEntryByKey("21395___" + sCOSPluginName, 7, 10, 10) ; CloakHjaalmarchLinen
	handler.AddDatastoreEntryByKey("21396___" + sCOSPluginName, 7, 10, 10) ; CloakStormcloakLinen
	handler.AddDatastoreEntryByKey("21397___" + sCOSPluginName, 7, 10, 10) ; CloakWhiteLinen
	handler.AddDatastoreEntryByKey("21379___" + sCOSPluginName, 7, 10, 10) ; CloakBlackLinen
	handler.AddDatastoreEntryByKey("22785___" + sCOSPluginName, 7, 10, 10) ; CloakLinenBrownHealth01
	handler.AddDatastoreEntryByKey("22784___" + sCOSPluginName, 7, 10, 10) ; CloakLinenBlackResist02
	handler.AddDatastoreEntryByKey("22783___" + sCOSPluginName, 7, 10, 10) ; CloakLinenBlackResist01
	handler.AddDatastoreEntryByKey("25557___" + sCOSPluginName, 7, 10, 10) ; CloakBlueLinen
	handler.AddDatastoreEntryByKey("25563___" + sCOSPluginName, 7, 10, 10) ; CloakWinterholdLinen
	handler.AddDatastoreEntryByKey("72658___" + sCOSPluginName, 7, 10, 10) ; CloakShortBlack
	handler.AddDatastoreEntryByKey("74064___" + sCOSPluginName, 7, 10, 10) ; CloakShortBlue
	handler.AddDatastoreEntryByKey("74065___" + sCOSPluginName, 7, 10, 10) ; CloakShortBrown
	handler.AddDatastoreEntryByKey("74067___" + sCOSPluginName, 7, 10, 10) ; CloakShortCrimson
	handler.AddDatastoreEntryByKey("74069___" + sCOSPluginName, 7, 10, 10) ; CloakShortGreen
	handler.AddDatastoreEntryByKey("74071___" + sCOSPluginName, 7, 10, 10) ; CloakShortGrey
	handler.AddDatastoreEntryByKey("74073___" + sCOSPluginName, 7, 10, 10) ; CloakShortWhite
	handler.AddDatastoreEntryByKey("83903___" + sCOSPluginName, 7, 10, 10) ; CloakShortCollege
	handler.AddDatastoreEntryByKey("1066944___" + sCOSPluginName, 7, 10, 10) ; CloakShortDawnstar
	handler.AddDatastoreEntryByKey("1066945___" + sCOSPluginName, 7, 10, 10) ; CloakShortFalkreath
	handler.AddDatastoreEntryByKey("1066946___" + sCOSPluginName, 7, 10, 10) ; CloakShortHjaalmarch
	handler.AddDatastoreEntryByKey("1066947___" + sCOSPluginName, 7, 10, 10) ; CloakShortMarkarth
	handler.AddDatastoreEntryByKey("1066948___" + sCOSPluginName, 7, 10, 10) ; CloakShortRiften
	handler.AddDatastoreEntryByKey("1066949___" + sCOSPluginName, 7, 10, 10) ; CloakShortSolitude
	handler.AddDatastoreEntryByKey("1066950___" + sCOSPluginName, 7, 10, 10) ; CloakShortWhiterun
	handler.AddDatastoreEntryByKey("1066951___" + sCOSPluginName, 7, 10, 10) ; CloakShortWinterhold
		
	;==========HIDE CLOAKS===========
	handler.AddDatastoreEntryByKey("50454___" + sCOSPluginName, 7, 12, 40) ; CloakForsworn
	handler.AddDatastoreEntryByKey("53219___" + sCOSPluginName, 7, 12, 40) ; CloakNorthPaladin
	handler.AddDatastoreEntryByKey("38016___" + sCOSPluginName, 7, 12, 40) ; CloakHuntersFolly
	handler.AddDatastoreEntryByKey("29714___" + sCOSPluginName, 7, 12, 40) ; CloakCrow
	handler.AddDatastoreEntryByKey("31094___" + sCOSPluginName, 7, 12, 40) ; CloakNya
	handler.AddDatastoreEntryByKey("31096___" + sCOSPluginName, 7, 12, 40) ; CloakGreyFox
	handler.AddDatastoreEntryByKey("24170___" + sCOSPluginName, 7, 12, 40) ; CloakGreybeard
	handler.AddDatastoreEntryByKey("4820___" + sCOSPluginName, 7, 12, 40) ; CloakBrownHealth01
	handler.AddDatastoreEntryByKey("4822___" + sCOSPluginName, 7, 12, 40) ; CloakBlackResist01
	handler.AddDatastoreEntryByKey("4823___" + sCOSPluginName, 7, 12, 40) ; CloakBlackResist02
	handler.AddDatastoreEntryByKey("4821___" + sCOSPluginName, 7, 12, 40) ; CloakBrownHealth02
	handler.AddDatastoreEntryByKey("62997___" + sCOSPluginName, 7, 12, 40) ; CloakDwemerPurpleAlt
	handler.AddDatastoreEntryByKey("42171___" + sCOSPluginName, 7, 12, 40) ; CloakMarkarth
	handler.AddDatastoreEntryByKey("42169___" + sCOSPluginName, 7, 12, 40) ; CloakFalkreath
	handler.AddDatastoreEntryByKey("38021___" + sCOSPluginName, 7, 12, 40) ; CloakRiften
	handler.AddDatastoreEntryByKey("25554___" + sCOSPluginName, 7, 12, 40) ; CloakBlue
	handler.AddDatastoreEntryByKey("18617___" + sCOSPluginName, 7, 12, 40) ; CloakHjaalmarch
	handler.AddDatastoreEntryByKey("18618___" + sCOSPluginName, 7, 12, 40) ; CloakDawnstar
	handler.AddDatastoreEntryByKey("3435___" + sCOSPluginName, 7, 12, 40) ; CloakCrimson
	handler.AddDatastoreEntryByKey("3432___" + sCOSPluginName, 7, 12, 40) ; CloakGreen
	handler.AddDatastoreEntryByKey("10340___" + sCOSPluginName, 7, 12, 40) ; CloakStormcloak
	handler.AddDatastoreEntryByKey("3431___" + sCOSPluginName, 7, 12, 40) ; CloakBlack
	handler.AddDatastoreEntryByKey("3430___" + sCOSPluginName, 7, 12, 40) ; CloakBrown
	handler.AddDatastoreEntryByKey("3433___" + sCOSPluginName, 7, 12, 40) ; CloakGrey
	handler.AddDatastoreEntryByKey("17235___" + sCOSPluginName, 7, 12, 40) ; CloakWhite
	handler.AddDatastoreEntryByKey("22787___" + sCOSPluginName, 7, 12, 40) ; CloakWhiterun
	handler.AddDatastoreEntryByKey("25562___" + sCOSPluginName, 7, 12, 40) ; CloakWinterhold
	handler.AddDatastoreEntryByKey("25564___" + sCOSPluginName, 7, 12, 40) ; CloakSolitude
	handler.AddDatastoreEntryByKey("57362___" + sCOSPluginName, 7, 12, 40) ; CloakHimirHide
	
	;Cloaks of Skyrim 1.2
	handler.AddDatastoreEntryByKey("94961___" + sCOSPluginName, 7, 10, 10) ; CloakDaedric
	handler.AddDatastoreEntryByKey("100481___" + sCOSPluginName, 7, 10, 10) ; CloakComp
	handler.AddDatastoreEntryByKey("89445___" + sCOSPluginName, 7, 10, 10) ; CloakShortImperial
	handler.AddDatastoreEntryByKey("94961___" + sCOSPluginName, 7, 12, 40) ; CloakScale
endFunction

function COSDGLoadUp()
	bool loaded
	string sCOSDGPluginName

	loaded = IsPluginLoaded(0x00005905, "Complete Crafting Overhaul_Remade.esp")
	sCOSDGPluginName = "Complete Crafting Overhaul_Remade.esp"
	if !loaded
		loaded = IsPluginLoaded(0x00000D64, "Cloaks - Dawnguard.esp")
		sCOSDGPluginName = "Cloaks - Dawnguard.esp"
	endif
	if !loaded
		loaded = IsPluginLoaded(0x00000D64, "Cloaks - Player Only - Dawnguard.esp")
		sCOSDGPluginName = "Cloaks - Player Only - Dawnguard.esp"
	endif
	if !loaded
		loaded = IsPluginLoaded(0x00000D64, "Cloaks - No Imperial - Dawnguard.esp")
		sCOSDGPluginName = "Cloaks - No Imperial - Dawnguard.esp"
	endif
	if !loaded
		return
	endif

	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	if sCOSDGPluginName == "Complete Crafting Overhaul_Remade.esp"
		handler.AddDatastoreEntryByKey("22789___" + sCOSDGPluginName, 7, 10, 10) ; CloakDawnguard
		handler.AddDatastoreEntryByKey("22790___" + sCOSDGPluginName, 7, 10, 10) ; CloakShortDawnguard
	else
		handler.AddDatastoreEntryByKey("3428___" + sCOSDGPluginName, 7, 10, 10) ; CloakDawnguard
		handler.AddDatastoreEntryByKey("3429___" + sCOSDGPluginName, 7, 10, 10) ; CloakShortDawnguard
	endif
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
	;Determine if Winter is Coming is loaded.
	bool loaded
	string sWICPluginName

	loaded = IsPluginLoaded(0x01001DD7, "Complete Crafting Overhaul_Remade.esp")
	sWICPluginName = "Complete Crafting Overhaul_Remade.esp"
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaks.esp")
		sWICPluginName = "1nivWICCloaks.esp"
	endif
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaksNoGuards.esp")
		sWICPluginName = "1nivWICCloaksNoGuards.esp"
	endif
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaksCRAFT.esp")
		sWICPluginName = "1nivWICCloaksCRAFT.esp"
	endif
	if !loaded
		return
	endif

	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	handler.AddDatastoreEntryByKey("10445___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComBrown
	handler.AddDatastoreEntryByKey("14581___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComCave
	handler.AddDatastoreEntryByKey("14582___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComSnow
	handler.AddDatastoreEntryByKey("110288___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComSteelBrown
	handler.AddDatastoreEntryByKey("110289___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComSteelCave
	handler.AddDatastoreEntryByKey("110290___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComSteelSnow
	handler.AddDatastoreEntryByKey("76952___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComStuddedBrown
	handler.AddDatastoreEntryByKey("76953___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComStuddedCave
	handler.AddDatastoreEntryByKey("76954___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearComStuddedSnow
	handler.AddDatastoreEntryByKey("14586___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateBrown
	handler.AddDatastoreEntryByKey("14587___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateCave
	handler.AddDatastoreEntryByKey("14588___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateSnow
	handler.AddDatastoreEntryByKey("110291___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateSteelBrown
	handler.AddDatastoreEntryByKey("110292___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateSteelCave
	handler.AddDatastoreEntryByKey("110293___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateSteelSnow
	handler.AddDatastoreEntryByKey("78336___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateStuddedBrown
	handler.AddDatastoreEntryByKey("78337___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateStuddedCave
	handler.AddDatastoreEntryByKey("78338___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearOrnateStuddedSnow
	handler.AddDatastoreEntryByKey("14583___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimBrown
	handler.AddDatastoreEntryByKey("14584___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimCave
	handler.AddDatastoreEntryByKey("14585___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimSnow
	handler.AddDatastoreEntryByKey("110294___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimSteelBrown
	handler.AddDatastoreEntryByKey("110295___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimSteelCave
	handler.AddDatastoreEntryByKey("110296___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimSteelSnow
	handler.AddDatastoreEntryByKey("78339___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimStuddedBrown
	handler.AddDatastoreEntryByKey("78340___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimStuddedCave
	handler.AddDatastoreEntryByKey("78341___" + sWICPluginName, 3, 45, 14) ; 1nivHoodBearTrimStuddedSnow
	handler.AddDatastoreEntryByKey("50540___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComBlack
	handler.AddDatastoreEntryByKey("111757___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComSteelBlack
	handler.AddDatastoreEntryByKey("111756___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComSteelTimber
	handler.AddDatastoreEntryByKey("111758___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComSteelWhite
	handler.AddDatastoreEntryByKey("81140___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComStuddedBlack
	handler.AddDatastoreEntryByKey("81141___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComStuddedTimber
	handler.AddDatastoreEntryByKey("81142___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComStuddedWhite
	handler.AddDatastoreEntryByKey("50539___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComTimber
	handler.AddDatastoreEntryByKey("50541___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinComWhite
	handler.AddDatastoreEntryByKey("88117___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareBlack
	handler.AddDatastoreEntryByKey("111754___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareSteelBlack
	handler.AddDatastoreEntryByKey("111753___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareSteelTimber
	handler.AddDatastoreEntryByKey("111755___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareSteelWhite
	handler.AddDatastoreEntryByKey("88120___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareStuddedBlack
	handler.AddDatastoreEntryByKey("88119___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareStuddedTimber
	handler.AddDatastoreEntryByKey("88121___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareStuddedWhite
	handler.AddDatastoreEntryByKey("89500___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareTimber
	handler.AddDatastoreEntryByKey("88118___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinRareWhite
	handler.AddDatastoreEntryByKey("50543___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBBlack
	handler.AddDatastoreEntryByKey("111760___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBSteelBlack
	handler.AddDatastoreEntryByKey("111759___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBSteelTimber
	handler.AddDatastoreEntryByKey("111761___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBSteelWhite
	handler.AddDatastoreEntryByKey("81143___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBStuddedBlack
	handler.AddDatastoreEntryByKey("81144___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBStuddedTimber
	handler.AddDatastoreEntryByKey("81145___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBStuddedWhite
	handler.AddDatastoreEntryByKey("50542___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBTimber
	handler.AddDatastoreEntryByKey("50544___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimBWhite
	handler.AddDatastoreEntryByKey("90880___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareBlack
	handler.AddDatastoreEntryByKey("113156___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareSteelBlack
	handler.AddDatastoreEntryByKey("113155___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareSteelTimber
	handler.AddDatastoreEntryByKey("113157___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareSteelWhite
	handler.AddDatastoreEntryByKey("90882___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareStuddedBlack
	handler.AddDatastoreEntryByKey("90883___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareStuddedTimber
	handler.AddDatastoreEntryByKey("90884___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareStuddedWhite
	handler.AddDatastoreEntryByKey("89501___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareTimber
	handler.AddDatastoreEntryByKey("90881___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimRareWhite
	handler.AddDatastoreEntryByKey("50546___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWBlack
	handler.AddDatastoreEntryByKey("111763___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWSteelBlack
	handler.AddDatastoreEntryByKey("111762___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWSteelTimber
	handler.AddDatastoreEntryByKey("111764___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWSteelWhite
	handler.AddDatastoreEntryByKey("81146___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWStuddedBlack
	handler.AddDatastoreEntryByKey("81147___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWStuddedTimber
	handler.AddDatastoreEntryByKey("81148___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWStuddedWhite
	handler.AddDatastoreEntryByKey("50545___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWTimber
	handler.AddDatastoreEntryByKey("50547___" + sWICPluginName, 3, 45, 14) ; 1nivHoodWolfSkinTrimWWhite
endFunction

function WICLoadUpCloaks()
	;Determine if Winter is Coming is loaded.
	bool loaded
	string sWICPluginName

	loaded = IsPluginLoaded(0x01001DD7, "Complete Crafting Overhaul_Remade.esp")
	sWICPluginName = "Complete Crafting Overhaul_Remade.esp"
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaks.esp")
		sWICPluginName = "1nivWICCloaks.esp"
	endif
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaksNoGuards.esp")
		sWICPluginName = "1nivWICCloaksNoGuards.esp"
	endif
	if !loaded
		loaded = IsPluginLoaded(0x01001DD7, "1nivWICCloaksCRAFT.esp")
		sWICPluginName = "1nivWICCloaksCRAFT.esp"
	endif
	if !loaded
		return
	endif

	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	handler.AddDatastoreEntryByKey("7639___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComBrown
	handler.AddDatastoreEntryByKey("56156___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComBrownEnchF
	handler.AddDatastoreEntryByKey("56175___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComBrownEnchM
	handler.AddDatastoreEntryByKey("9020___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComCave
	handler.AddDatastoreEntryByKey("56158___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComCaveEnchF
	handler.AddDatastoreEntryByKey("56176___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComCaveEnchM
	handler.AddDatastoreEntryByKey("9021___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComSnow
	handler.AddDatastoreEntryByKey("56159___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComSnowEnchF
	handler.AddDatastoreEntryByKey("56177___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawComSnowEnchM
	handler.AddDatastoreEntryByKey("9025___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateBrown
	handler.AddDatastoreEntryByKey("56160___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateBrownEnchF
	handler.AddDatastoreEntryByKey("56178___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateBrownEnchM
	handler.AddDatastoreEntryByKey("9026___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateCave
	handler.AddDatastoreEntryByKey("56161___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateCaveEnchF
	handler.AddDatastoreEntryByKey("56179___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateCaveEnchM
	handler.AddDatastoreEntryByKey("9027___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateSnow
	handler.AddDatastoreEntryByKey("56162___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateSnowEnchF
	handler.AddDatastoreEntryByKey("56180___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawOrnateSnowEnchM
	handler.AddDatastoreEntryByKey("9022___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimBrown
	handler.AddDatastoreEntryByKey("56163___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimBrownEnchF
	handler.AddDatastoreEntryByKey("56181___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimBrownEnchM
	handler.AddDatastoreEntryByKey("9023___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimCave
	handler.AddDatastoreEntryByKey("56164___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimCaveEnchF
	handler.AddDatastoreEntryByKey("56182___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimCaveEnchM
	handler.AddDatastoreEntryByKey("9024___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimSnow
	handler.AddDatastoreEntryByKey("56165___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimSnowEnchF
	handler.AddDatastoreEntryByKey("56183___" + sWICPluginName, 7, 40, 12) ; 1nivCloakBearClawTrimSnowEnchM
	handler.AddDatastoreEntryByKey("9029___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComBlack
	handler.AddDatastoreEntryByKey("56166___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComBlackEnchF
	handler.AddDatastoreEntryByKey("56184___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComBlackEnchM
	handler.AddDatastoreEntryByKey("9028___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComTimber
	handler.AddDatastoreEntryByKey("56167___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComTimberEnchF
	handler.AddDatastoreEntryByKey("56185___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComTimberEnchM
	handler.AddDatastoreEntryByKey("9030___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComWhite
	handler.AddDatastoreEntryByKey("56168___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComWhiteEnchF
	handler.AddDatastoreEntryByKey("56186___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinComWhiteEnchM
	handler.AddDatastoreEntryByKey("70014___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareBlack
	handler.AddDatastoreEntryByKey("70016___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareBlackEnchF
	handler.AddDatastoreEntryByKey("70019___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareBlackEnchM
	handler.AddDatastoreEntryByKey("70013___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareTimber
	handler.AddDatastoreEntryByKey("70017___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareTimberEnchF
	handler.AddDatastoreEntryByKey("70020___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareTimberEnchM
	handler.AddDatastoreEntryByKey("70015___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareWhite
	handler.AddDatastoreEntryByKey("70018___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareWhiteEnchF
	handler.AddDatastoreEntryByKey("70021___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinRareWhiteEnchM
	handler.AddDatastoreEntryByKey("9034___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBBlack
	handler.AddDatastoreEntryByKey("56169___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBBlackEnchF
	handler.AddDatastoreEntryByKey("56187___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBBlackEnchM
	handler.AddDatastoreEntryByKey("9035___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBTimber
	handler.AddDatastoreEntryByKey("56170___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBTimberEnchF
	handler.AddDatastoreEntryByKey("56188___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBTimberEnchM
	handler.AddDatastoreEntryByKey("9036___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBWhite
	handler.AddDatastoreEntryByKey("56171___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBWhiteEnchF
	handler.AddDatastoreEntryByKey("56189___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimBWhiteEnchM
	handler.AddDatastoreEntryByKey("9032___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWBlack
	handler.AddDatastoreEntryByKey("56172___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWBlackEnchF
	handler.AddDatastoreEntryByKey("56190___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWBlackEnchM
	handler.AddDatastoreEntryByKey("9031___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWTimber
	handler.AddDatastoreEntryByKey("56173___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWTimberEnchF
	handler.AddDatastoreEntryByKey("56191___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWTimberEnchM
	handler.AddDatastoreEntryByKey("9033___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWWhite
	handler.AddDatastoreEntryByKey("56174___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWWhiteEnchF
	handler.AddDatastoreEntryByKey("56192___" + sWICPluginName, 7, 40, 12) ; 1nivCloakWolfSkinTrimWWhiteEnchM
endFunction

function AEALoadUp()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	handler.AddDatastoreEntryByKey("20056___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("130085___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("98064___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("130086___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("98065___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("130087___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("233387___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("233392___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("233388___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("233393___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("233389___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("233394___AesirArmor.esp", 7, 40, 12) ; cloak fur
	handler.AddDatastoreEntryByKey("95268___AesirArmor.esp", 1, 175, 54) ; body full
	handler.AddDatastoreEntryByKey("125934___AesirArmor.esp", 1, 175, 54) ; body full
	handler.AddDatastoreEntryByKey("49193___AesirArmor.esp", 1, 175, 54) ; body full
	handler.AddDatastoreEntryByKey("247294___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("247295___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("247296___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("247297___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("10379___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("130178___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("18674___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("131557___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("18675___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("131559___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("18676___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("131558___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211121___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211122___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211123___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211124___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211125___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211126___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211127___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211128___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211129___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("212522___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211130___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("212523___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211131___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("212524___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211136___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("212525___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211135___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("212526___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211132___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("212527___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211133___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("212528___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("211134___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("212529___AesirArmor.esp", 3, 50, 14) ; head full
	handler.AddDatastoreEntryByKey("49195___AesirArmor.esp", 2, 21, 14) ; hands full
	handler.AddDatastoreEntryByKey("31538___AesirArmor.esp", 2, 21, 14) ; hands full
	handler.AddDatastoreEntryByKey("131561___AesirArmor.esp", 2, 21, 14) ; hands full
	handler.AddDatastoreEntryByKey("31541___AesirArmor.esp", 4, 21, 14) ; feet full
	handler.AddDatastoreEntryByKey("131560___AesirArmor.esp", 4, 21, 14) ; feet full
	handler.AddDatastoreEntryByKey("49194___AesirArmor.esp", 4, 21, 14) ; feet full
endFunction

function WACLoadUp()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	handler.AddDatastoreEntryByKey("860640___WetandCold.esp", 7, 10, 10) ; _WetCloak1 linen
	handler.AddDatastoreEntryByKey("860649___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Black linen
	handler.AddDatastoreEntryByKey("864795___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Blue linen
	handler.AddDatastoreEntryByKey("864791___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Gray linen
	handler.AddDatastoreEntryByKey("864794___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Green linen
	handler.AddDatastoreEntryByKey("864796___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Purple linen
	handler.AddDatastoreEntryByKey("864792___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Red linen
	handler.AddDatastoreEntryByKey("864793___WetandCold.esp", 7, 10, 10) ; _WetCloak1_Yellow linen
	handler.AddDatastoreEntryByKey("415000___WetandCold.esp", 7, 40, 12) ; _WetCloakFur1 fur
	handler.AddDatastoreEntryByKey("514265___WetandCold.esp", 7, 40, 12) ; _WetCloakFur1_Black fur
	handler.AddDatastoreEntryByKey("416384___WetandCold.esp", 7, 40, 12) ; _WetCloakFur1_Brown fur
	handler.AddDatastoreEntryByKey("416380___WetandCold.esp", 7, 40, 12) ; _WetCloakFur1_Gray fur
	handler.AddDatastoreEntryByKey("831666___WetandCold.esp", 7, 40, 12) ; _WetCloakFur2 fur
	handler.AddDatastoreEntryByKey("831673___WetandCold.esp", 7, 40, 12) ; _WetCloakFur2_Black fur
	handler.AddDatastoreEntryByKey("831674___WetandCold.esp", 7, 40, 12) ; _WetCloakFur2_Brown fur
	handler.AddDatastoreEntryByKey("831675___WetandCold.esp", 7, 40, 12) ; _WetCloakFur2_Gray fur
	handler.AddDatastoreEntryByKey("152448___WetandCold.esp", 2, 5, 14) ; _WetGloves1
	handler.AddDatastoreEntryByKey("698278___WetandCold.esp", 2, 5, 14) ; _WetGloves1_Blue
	handler.AddDatastoreEntryByKey("152450___WetandCold.esp", 2, 5, 14) ; _WetGloves1_Gray
	handler.AddDatastoreEntryByKey("698279___WetandCold.esp", 2, 5, 14) ; _WetGloves1_Green
	handler.AddDatastoreEntryByKey("152451___WetandCold.esp", 2, 5, 14) ; _WetGloves1_Yellow
	handler.AddDatastoreEntryByKey("95879___WetandCold.esp", 3, 35, 43) ; _WetHood1
	handler.AddDatastoreEntryByKey("334976___WetandCold.esp", 3, 35, 43) ; _WetHood1_Teal
	handler.AddDatastoreEntryByKey("95880___WetandCold.esp", 3, 35, 43) ; _WetHood2
	handler.AddDatastoreEntryByKey("104164___WetandCold.esp", 3, 35, 43) ; _WetHood2_Gray
	handler.AddDatastoreEntryByKey("97267___WetandCold.esp", 3, 35, 43) ; _WetHood3
	handler.AddDatastoreEntryByKey("104163___WetandCold.esp", 3, 35, 43) ; _WetHood3_Yellow
	handler.AddDatastoreEntryByKey("450851___WetandCold.esp", 3, 35, 43) ; _WetHood4
	handler.AddDatastoreEntryByKey("804073___WetandCold.esp", 3, 35, 28) ; _WetHood5
	handler.AddDatastoreEntryByKey("804074___WetandCold.esp", 3, 35, 28) ; _WetHood5_Brown
	handler.AddDatastoreEntryByKey("804075___WetandCold.esp", 3, 35, 28) ; _WetHood5_Gray
	handler.AddDatastoreEntryByKey("804076___WetandCold.esp", 3, 35, 28) ; _WetHood5_Green
	handler.AddDatastoreEntryByKey("804077___WetandCold.esp", 3, 35, 28) ; _WetHood5_Red
	handler.AddDatastoreEntryByKey("146916___WetandCold.esp", 3, 45, 14) ; _WetHoodFur1
	handler.AddDatastoreEntryByKey("146917___WetandCold.esp", 3, 45, 14) ; _WetHoodFur1_Black
	handler.AddDatastoreEntryByKey("699670___WetandCold.esp", 3, 45, 14) ; _WetHoodFur1_Brown
	handler.AddDatastoreEntryByKey("146918___WetandCold.esp", 3, 45, 14) ; _WetHoodFur1_Gray
	handler.AddDatastoreEntryByKey("873070___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2
	handler.AddDatastoreEntryByKey("874470___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2_Black
	handler.AddDatastoreEntryByKey("874471___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2_Brown
	handler.AddDatastoreEntryByKey("874472___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2_LightBrown
	handler.AddDatastoreEntryByKey("874473___WetandCold.esp", 3, 45, 14) ; _WetHoodFur2_White
	handler.AddDatastoreEntryByKey("874476___WetandCold.esp", 3, 45, 14) ; _WetHoodFur3
	handler.AddDatastoreEntryByKey("874481___WetandCold.esp", 3, 45, 14) ; _WetHoodFur3_Black
	handler.AddDatastoreEntryByKey("874482___WetandCold.esp", 3, 45, 14) ; _WetHoodFur3_White
	handler.AddDatastoreEntryByKey("841332___WetandCold.esp", 3, 45, 14) ; _WetHoodFurLined1
	handler.AddDatastoreEntryByKey("842717___WetandCold.esp", 3, 45, 14) ; _WetHoodFurLined1_Brown
	handler.AddDatastoreEntryByKey("842718___WetandCold.esp", 3, 45, 14) ; _WetHoodFurLined1_Dark
endFunction

function IMALoadUp()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	handler.AddDatastoreEntryByKey("20258___Hothtrooper44_ArmorCompilation.esp", 1, 125, 54) ; IAAkaviriSamuraiCuirass
	handler.AddDatastoreEntryByKey("144010___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IAAlduinCuirass
	handler.AddDatastoreEntryByKey("46671___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IAApotheusCuirass
	handler.AddDatastoreEntryByKey("23132___Hothtrooper44_ArmorCompilation.esp", 1, 30, 0) ; IABarbarianCuirass
	handler.AddDatastoreEntryByKey("144116___Hothtrooper44_ArmorCompilation.esp", 1, 125, 54) ; IABoiledChitinHCuirass
	handler.AddDatastoreEntryByKey("544585___Hothtrooper44_ArmorCompilation.esp", 1, 125, 54) ; IABoiledChitinLCuirass
	handler.AddDatastoreEntryByKey("145634___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerCuirass
	handler.AddDatastoreEntryByKey("145637___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerEngravedCuirass
	handler.AddDatastoreEntryByKey("145646___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerHeavyCuirass
	handler.AddDatastoreEntryByKey("145653___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerHuntHeavyCuirass
	handler.AddDatastoreEntryByKey("145656___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IABosmerHuntLightCuirass
	handler.AddDatastoreEntryByKey("143594___Hothtrooper44_ArmorCompilation.esp", 1, 0, 0) ; IAConanCuirass
	handler.AddDatastoreEntryByKey("143608___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IACrimsonArcherCuirass
	handler.AddDatastoreEntryByKey("145723___Hothtrooper44_ArmorCompilation.esp", 1, 160, 91) ; IADaedricLordCuirass
	handler.AddDatastoreEntryByKey("139237___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonEbonBulkyCuirass
	handler.AddDatastoreEntryByKey("139238___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonEbonSleekCuirass
	handler.AddDatastoreEntryByKey("143558___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonKnightCuirassFox
	handler.AddDatastoreEntryByKey("143557___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonKnightCuirassFull
	handler.AddDatastoreEntryByKey("15925___Hothtrooper44_ArmorCompilation.esp", 1, 190, 72) ; IAEinherjarBrigandineDarkCuirass
	handler.AddDatastoreEntryByKey("15926___Hothtrooper44_ArmorCompilation.esp", 1, 190, 72) ; IAEinherjarBrigandineLightCuirass
	handler.AddDatastoreEntryByKey("32830___Hothtrooper44_ArmorCompilation.esp", 1, 190, 72) ; IAEinherjarPlateDarkCuirass
	handler.AddDatastoreEntryByKey("4820___Hothtrooper44_ArmorCompilation.esp", 1, 190, 72) ; IAEinherjarPlateLightCuirass
	handler.AddDatastoreEntryByKey("3428___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAFalkreathCuirass
	handler.AddDatastoreEntryByKey("144118___Hothtrooper44_ArmorCompilation.esp", 1, 190, 91) ; IAGlacialCrystalHCuirass
	handler.AddDatastoreEntryByKey("544590___Hothtrooper44_ArmorCompilation.esp", 1, 190, 91) ; IAGlacialCrystalLCuirass
	handler.AddDatastoreEntryByKey("3478___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAHedgeKnightCuirass
	handler.AddDatastoreEntryByKey("23065___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAHeroicImperialCuirass
	handler.AddDatastoreEntryByKey("43878___Hothtrooper44_ArmorCompilation.esp", 1, 140, 35) ; IAHeroicStormcloakCuirass
	handler.AddDatastoreEntryByKey("14469___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IAHunterCuirass
	handler.AddDatastoreEntryByKey("436741___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAImperialKnightCuirass
	handler.AddDatastoreEntryByKey("23050___Hothtrooper44_ArmorCompilation.esp", 1, 110, 35) ; IAMercenaryCuirass
	handler.AddDatastoreEntryByKey("43874___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAPaladinCuirass
	; handler.AddDatastoreEntryByKey("23102___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordHeavyCuirass
	; handler.AddDatastoreEntryByKey("23106___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordLightCuirass
	handler.AddDatastoreEntryByKey("23151___Hothtrooper44_ArmorCompilation.esp", 1, 110, 35) ; IARangerCuirass
	handler.AddDatastoreEntryByKey("3440___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IARedguardKnightHeavyCuirass
	handler.AddDatastoreEntryByKey("3441___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IARedguardKnightLightCuirass
	handler.AddDatastoreEntryByKey("144113___Hothtrooper44_ArmorCompilation.esp", 1, 110, 35) ; IARingmailCuirass
	handler.AddDatastoreEntryByKey("139149___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IARitualBoethiahCuirass
	handler.AddDatastoreEntryByKey("43870___Hothtrooper44_ArmorCompilation.esp", 1, 125, 91) ; IASeadogCuirass
	handler.AddDatastoreEntryByKey("144117___Hothtrooper44_ArmorCompilation.esp", 1, 140, 35) ; IASnowBearCuirass
	handler.AddDatastoreEntryByKey("53616___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IASpellbinderCrimsonCuirass
	handler.AddDatastoreEntryByKey("53617___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IASpellbinderRunicCuirass
	handler.AddDatastoreEntryByKey("436720___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAStormlordCuirass
	handler.AddDatastoreEntryByKey("143492___Hothtrooper44_ArmorCompilation.esp", 1, 140, 35) ; IATrollbaneHeavyCuirass
	handler.AddDatastoreEntryByKey("143498___Hothtrooper44_ArmorCompilation.esp", 1, 140, 35) ; IATrollbaneLightCuirass
	handler.AddDatastoreEntryByKey("3447___Hothtrooper44_ArmorCompilation.esp", 1, 128, 106) ; IAVagabondCrimsonCuirass
	handler.AddDatastoreEntryByKey("3449___Hothtrooper44_ArmorCompilation.esp", 1, 128, 106) ; IAVagabondDuskCuirass
	handler.AddDatastoreEntryByKey("3448___Hothtrooper44_ArmorCompilation.esp", 1, 128, 106) ; IAVagabondLeatherCuirass
	handler.AddDatastoreEntryByKey("3460___Hothtrooper44_ArmorCompilation.esp", 1, 128, 106) ; IAVanguardPlateCuirass
	handler.AddDatastoreEntryByKey("144124___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IAVvardenfellGlassCuirass
	handler.AddDatastoreEntryByKey("50833___Hothtrooper44_ArmorCompilation.esp", 1, 125, 54) ; IAWitchplateCuirass
	handler.AddDatastoreEntryByKey("143995___Hothtrooper44_ArmorCompilation.esp", 1, 110, 52) ; IABrigandDwemerScrap
	handler.AddDatastoreEntryByKey("143996___Hothtrooper44_ArmorCompilation.esp", 1, 90, 35) ; IABrigandHighwayChain
	handler.AddDatastoreEntryByKey("143997___Hothtrooper44_ArmorCompilation.esp", 1, 90, 35) ; IABrigandIronHide
	handler.AddDatastoreEntryByKey("20284___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonhideHeavyRobe
	handler.AddDatastoreEntryByKey("144024___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonhideLRobe
	handler.AddDatastoreEntryByKey("226058___Hothtrooper44_ArmorCompilation.esp", 1, 140, 109) ; IADragonhideURobe
	handler.AddDatastoreEntryByKey("23079___Hothtrooper44_ArmorCompilation.esp", 1, 140, 72) ; IADwarvenMageHRobe
	handler.AddDatastoreEntryByKey("144028___Hothtrooper44_ArmorCompilation.esp", 1, 140, 72) ; IADwarvenMageLRobe
	handler.AddDatastoreEntryByKey("226053___Hothtrooper44_ArmorCompilation.esp", 1, 140, 72) ; IADwarvenMageURobe
	handler.AddDatastoreEntryByKey("145736___Hothtrooper44_ArmorCompilation.esp", 1, 140, 54) ; IAEbonyMageHeavyRobe
	handler.AddDatastoreEntryByKey("145740___Hothtrooper44_ArmorCompilation.esp", 1, 140, 54) ; IAEbonyMageLightRobe
	handler.AddDatastoreEntryByKey("226045___Hothtrooper44_ArmorCompilation.esp", 1, 140, 54) ; IAEbonyMageUnarmoredRobe
	handler.AddDatastoreEntryByKey("143533___Hothtrooper44_ArmorCompilation.esp", 1, 40, 0) ; IAShamanLRobe
	handler.AddDatastoreEntryByKey("536248___Hothtrooper44_ArmorCompilation.esp", 1, 40, 0) ; IAShamanURobe
	handler.AddDatastoreEntryByKey("143706___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeBlackCloak
	handler.AddDatastoreEntryByKey("143701___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeBlackNoCloak
	handler.AddDatastoreEntryByKey("143707___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeBlueCloak
	handler.AddDatastoreEntryByKey("143702___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeBlueNoCloak
	handler.AddDatastoreEntryByKey("143708___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeGreenCloak
	handler.AddDatastoreEntryByKey("143703___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeGreenNoCloak
	handler.AddDatastoreEntryByKey("143709___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeRedCloak
	handler.AddDatastoreEntryByKey("143704___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeRedNoCloak
	handler.AddDatastoreEntryByKey("143710___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeWhiteCloak
	handler.AddDatastoreEntryByKey("143705___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalHeavyRobeWhiteNoCloak
	handler.AddDatastoreEntryByKey("143731___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeBlackCloak
	handler.AddDatastoreEntryByKey("143726___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeBlackNoCloak
	handler.AddDatastoreEntryByKey("143732___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeBlueCloak
	handler.AddDatastoreEntryByKey("143727___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeBlueNoCloak
	handler.AddDatastoreEntryByKey("143733___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeGreenCloak
	handler.AddDatastoreEntryByKey("143728___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeGreenNoCloak
	handler.AddDatastoreEntryByKey("143734___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeRedCloak
	handler.AddDatastoreEntryByKey("143729___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeRedNoCloak
	handler.AddDatastoreEntryByKey("143735___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeWhiteCloak
	handler.AddDatastoreEntryByKey("143730___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalLightRobeWhiteNoCloak
	handler.AddDatastoreEntryByKey("143755___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeBlack
	handler.AddDatastoreEntryByKey("143756___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeBlue
	handler.AddDatastoreEntryByKey("143757___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeGreen
	handler.AddDatastoreEntryByKey("143758___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeRed
	handler.AddDatastoreEntryByKey("143759___Hothtrooper44_ArmorCompilation.esp", 1, 125, 72) ; IATribunalUnarmoredRobeWhite
	handler.AddDatastoreEntryByKey("16070___Hothtrooper44_ArmorCompilation.esp", 1, 75, 35) ; IANordMailHeavyHauberk
	handler.AddDatastoreEntryByKey("16068___Hothtrooper44_ArmorCompilation.esp", 1, 75, 35) ; IANordMailLightShirt
	handler.AddDatastoreEntryByKey("3466___Hothtrooper44_ArmorCompilation.esp", 1, 175, 54) ; IAWarchiefHeavyBulwark
	handler.AddDatastoreEntryByKey("3467___Hothtrooper44_ArmorCompilation.esp", 1, 175, 54) ; IAWarchiefLightBulwark


	handler.AddDatastoreEntryByKey("20259___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IAAkaviriSamuraiGauntlets
	handler.AddDatastoreEntryByKey("144011___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IAAlduinGauntlets
	handler.AddDatastoreEntryByKey("23133___Hothtrooper44_ArmorCompilation.esp", 2, 7, 6) ; IABarbarianGauntlets
	handler.AddDatastoreEntryByKey("144096___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IABoiledChitinHGauntlets
	handler.AddDatastoreEntryByKey("544586___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IABoiledChitinLGauntlets
	handler.AddDatastoreEntryByKey("145647___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerHeavyGauntlets
	handler.AddDatastoreEntryByKey("145654___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerHuntHeavyGauntlets
	handler.AddDatastoreEntryByKey("145657___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerHuntLightGauntlets
	handler.AddDatastoreEntryByKey("145724___Hothtrooper44_ArmorCompilation.esp", 2, 18, 21) ; IADaedricLordGauntlets
	handler.AddDatastoreEntryByKey("139239___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonEbonBulkyGauntlets
	handler.AddDatastoreEntryByKey("143560___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonKnightGauntlets0
	handler.AddDatastoreEntryByKey("143561___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonKnightGauntlets1
	handler.AddDatastoreEntryByKey("143562___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonKnightGauntlets2
	handler.AddDatastoreEntryByKey("23080___Hothtrooper44_ArmorCompilation.esp", 2, 15, 21) ; IADwarvenMageHGauntlets
	handler.AddDatastoreEntryByKey("144026___Hothtrooper44_ArmorCompilation.esp", 2, 15, 21) ; IADwarvenMageLGauntlets
	handler.AddDatastoreEntryByKey("226051___Hothtrooper44_ArmorCompilation.esp", 2, 15, 21) ; IADwarvenMageUGauntlets
	handler.AddDatastoreEntryByKey("15917___Hothtrooper44_ArmorCompilation.esp", 2, 24, 21) ; IAEinherjarBrigandineDarkGauntlets
	handler.AddDatastoreEntryByKey("32832___Hothtrooper44_ArmorCompilation.esp", 2, 24, 21) ; IAEinherjarPlateDarkGauntlets
	handler.AddDatastoreEntryByKey("4818___Hothtrooper44_ArmorCompilation.esp", 2, 24, 21) ; IAEinherjarPlateLightGauntlets
	handler.AddDatastoreEntryByKey("3429___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAFalkreathGauntlets
	handler.AddDatastoreEntryByKey("144100___Hothtrooper44_ArmorCompilation.esp", 2, 24, 14) ; IAGlacialCrystalHGauntlets
	handler.AddDatastoreEntryByKey("544591___Hothtrooper44_ArmorCompilation.esp", 2, 24, 14) ; IAGlacialCrystalLGauntlets
	handler.AddDatastoreEntryByKey("3479___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAHedgeKnightGauntlets
	handler.AddDatastoreEntryByKey("43877___Hothtrooper44_ArmorCompilation.esp", 2, 18, 14) ; IAHeroicStormcloakGauntlets
	handler.AddDatastoreEntryByKey("23051___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IAMercenaryGauntlets
	handler.AddDatastoreEntryByKey("43873___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAPaladinGauntlets
	;handler.AddDatastoreEntryByKey("23103___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordHeavyGauntlets
	;handler.AddDatastoreEntryByKey("23107___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordLightGauntlets
	handler.AddDatastoreEntryByKey("3436___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IARedguardKnightHeavyGauntlets
	handler.AddDatastoreEntryByKey("3437___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IARedguardKnightLightGauntlets
	handler.AddDatastoreEntryByKey("6189___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IASeadogGauntlets
	handler.AddDatastoreEntryByKey("144120___Hothtrooper44_ArmorCompilation.esp", 2, 18, 14) ; IASnowBearGauntlets
	handler.AddDatastoreEntryByKey("53615___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IASpellbinderCrimsonGauntlets
	handler.AddDatastoreEntryByKey("53618___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IASpellbinderRunicGauntlets
	handler.AddDatastoreEntryByKey("436721___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAStormlordGauntlets
	handler.AddDatastoreEntryByKey("143493___Hothtrooper44_ArmorCompilation.esp", 2, 18, 14) ; IATrollbaneHeavyGauntlets
	handler.AddDatastoreEntryByKey("3453___Hothtrooper44_ArmorCompilation.esp", 2, 12, 35) ; IAVagabondCrimsonGauntlets
	handler.AddDatastoreEntryByKey("3455___Hothtrooper44_ArmorCompilation.esp", 2, 12, 35) ; IAVagabondDuskGauntlets
	handler.AddDatastoreEntryByKey("3461___Hothtrooper44_ArmorCompilation.esp", 2, 15, 21) ; IAVanguardPlateGauntlets
	handler.AddDatastoreEntryByKey("144125___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IAVvardenfellGlassGauntlets
	handler.AddDatastoreEntryByKey("50835___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IAWitchplateGauntlets
	handler.AddDatastoreEntryByKey("46670___Hothtrooper44_ArmorCompilation.esp", 2, 10, 6) ; IAApotheusGloves
	handler.AddDatastoreEntryByKey("143609___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IACrimsonArcherGloves
	handler.AddDatastoreEntryByKey("139240___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonEbonSleekGloves
	handler.AddDatastoreEntryByKey("20281___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonhideHeavyGloves
	handler.AddDatastoreEntryByKey("144022___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonhideLGloves
	handler.AddDatastoreEntryByKey("226061___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IADragonhideUGloves
	handler.AddDatastoreEntryByKey("145737___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAEbonyMageHeavyGloves
	handler.AddDatastoreEntryByKey("145741___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAEbonyMageLightGloves
	handler.AddDatastoreEntryByKey("226043___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAEbonyMageUnarmoredGloves
	handler.AddDatastoreEntryByKey("139150___Hothtrooper44_ArmorCompilation.esp", 2, 15, 29) ; IARitualBoethiahGloves
	handler.AddDatastoreEntryByKey("143536___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IAShamanLGloves
	handler.AddDatastoreEntryByKey("536246___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IAShamanUGloves
	handler.AddDatastoreEntryByKey("143691___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesBlack
	handler.AddDatastoreEntryByKey("143692___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesBlue
	handler.AddDatastoreEntryByKey("143693___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesGreen
	handler.AddDatastoreEntryByKey("143694___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesRed
	handler.AddDatastoreEntryByKey("143695___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalHeavyGlovesWhite
	handler.AddDatastoreEntryByKey("143716___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesBlack
	handler.AddDatastoreEntryByKey("143717___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesBlue
	handler.AddDatastoreEntryByKey("143718___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesGreen
	handler.AddDatastoreEntryByKey("143719___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesRed
	handler.AddDatastoreEntryByKey("143720___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalLightGlovesWhite
	handler.AddDatastoreEntryByKey("143745___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesBlack
	handler.AddDatastoreEntryByKey("143746___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesBlue
	handler.AddDatastoreEntryByKey("143747___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesGreen
	handler.AddDatastoreEntryByKey("143748___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesRed
	handler.AddDatastoreEntryByKey("143749___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IATribunalUnarmoredGlovesWhite
	handler.AddDatastoreEntryByKey("145643___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerBracers
	handler.AddDatastoreEntryByKey("145638___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IABosmerEngravedBracers
	handler.AddDatastoreEntryByKey("143592___Hothtrooper44_ArmorCompilation.esp", 2, 3, 0) ; IAConanBracers
	handler.AddDatastoreEntryByKey("15918___Hothtrooper44_ArmorCompilation.esp", 2, 24, 21) ; IAEinherjarBrigandineLightBracers
	handler.AddDatastoreEntryByKey("23066___Hothtrooper44_ArmorCompilation.esp", 2, 12, 14) ; IAHeroicImperialBracers
	handler.AddDatastoreEntryByKey("14468___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IAHunterBracers
	handler.AddDatastoreEntryByKey("16065___Hothtrooper44_ArmorCompilation.esp", 2, 7, 6) ; IANordMailHeavyBracers
	handler.AddDatastoreEntryByKey("16069___Hothtrooper44_ArmorCompilation.esp", 2, 7, 6) ; IANordMailLightBracers
	handler.AddDatastoreEntryByKey("23152___Hothtrooper44_ArmorCompilation.esp", 2, 12, 6) ; IARangerBracers
	handler.AddDatastoreEntryByKey("144114___Hothtrooper44_ArmorCompilation.esp", 2, 5, 6) ; IARingmailBracers
	handler.AddDatastoreEntryByKey("143499___Hothtrooper44_ArmorCompilation.esp", 2, 18, 14) ; IATrollbaneLightBracers
	handler.AddDatastoreEntryByKey("3454___Hothtrooper44_ArmorCompilation.esp", 2, 12, 35) ; IAVagabondLeatherBracers
	handler.AddDatastoreEntryByKey("436744___Hothtrooper44_ArmorCompilation.esp", 2, 15, 14) ; IAImperialKnightVambraces
	handler.AddDatastoreEntryByKey("3470___Hothtrooper44_ArmorCompilation.esp", 2, 21, 14) ; IAWarchiefHeavyGrips
	handler.AddDatastoreEntryByKey("3471___Hothtrooper44_ArmorCompilation.esp", 2, 21, 14) ; IAWarchiefLightGrips


	handler.AddDatastoreEntryByKey("20260___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAAkaviriSamuraiHelmet
	handler.AddDatastoreEntryByKey("144012___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IAAlduinHelmet
	handler.AddDatastoreEntryByKey("46669___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IAApotheusHelm
	handler.AddDatastoreEntryByKey("23134___Hothtrooper44_ArmorCompilation.esp", 3, 15, 3) ; IABarbarianHelmet
	handler.AddDatastoreEntryByKey("144097___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IABoiledChitinHHelmet
	handler.AddDatastoreEntryByKey("544587___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IABoiledChitinLHelmet
	handler.AddDatastoreEntryByKey("145639___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerEngravedHelmet
	handler.AddDatastoreEntryByKey("145648___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerHeavyHelmet
	handler.AddDatastoreEntryByKey("145649___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerHelmet
	handler.AddDatastoreEntryByKey("145652___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerHuntHeavyHelmet
	handler.AddDatastoreEntryByKey("139247___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmClassic
	handler.AddDatastoreEntryByKey("139248___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmClassicVeil
	handler.AddDatastoreEntryByKey("139249___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmClaw
	handler.AddDatastoreEntryByKey("139250___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmClawVeil
	handler.AddDatastoreEntryByKey("139243___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmGrand
	handler.AddDatastoreEntryByKey("139244___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmGrandVeil
	handler.AddDatastoreEntryByKey("139245___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmHorn
	handler.AddDatastoreEntryByKey("139246___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmHornVeil
	handler.AddDatastoreEntryByKey("139241___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmStout
	handler.AddDatastoreEntryByKey("139242___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHelmStoutVeil
	handler.AddDatastoreEntryByKey("543154___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmClassic
	handler.AddDatastoreEntryByKey("543155___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmClassicVeil
	handler.AddDatastoreEntryByKey("543156___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmClaw
	handler.AddDatastoreEntryByKey("543157___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmClawVeil
	handler.AddDatastoreEntryByKey("543158___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmGrand
	handler.AddDatastoreEntryByKey("543159___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmGrandVeil
	handler.AddDatastoreEntryByKey("543160___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmHorn
	handler.AddDatastoreEntryByKey("543161___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmHornVeil
	handler.AddDatastoreEntryByKey("543162___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmStout
	handler.AddDatastoreEntryByKey("543163___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHelmStoutVeil
	handler.AddDatastoreEntryByKey("143563___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonKnightHHelm
	handler.AddDatastoreEntryByKey("548818___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonKnightLHelm
	handler.AddDatastoreEntryByKey("3430___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAFalkreathHelmet
	handler.AddDatastoreEntryByKey("144101___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAGlacialCrystalHHelmet
	handler.AddDatastoreEntryByKey("544592___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAGlacialCrystalLHelmet
	handler.AddDatastoreEntryByKey("3480___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAHedgeKnightHelmet
	handler.AddDatastoreEntryByKey("23067___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IAHeroicImperialHelmet
	handler.AddDatastoreEntryByKey("43876___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAHeroicStormcloakHelmet
	handler.AddDatastoreEntryByKey("436743___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAImperialKnightHelmet
	handler.AddDatastoreEntryByKey("16071___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IANordMailHeavyHelmet
	handler.AddDatastoreEntryByKey("16072___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IANordMailHeavySpectacleHelmet
	handler.AddDatastoreEntryByKey("16074___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IANordMailLightSpectacleHelmet
	handler.AddDatastoreEntryByKey("16073___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IANordMailLightHelmet
	handler.AddDatastoreEntryByKey("139134___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAOrcishMaskHelm
	handler.AddDatastoreEntryByKey("15853___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAPaladinGreatHelm
	handler.AddDatastoreEntryByKey("43872___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAPaladinHelmet
	;handler.AddDatastoreEntryByKey("23104___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordHeavyHelmet
	;handler.AddDatastoreEntryByKey("23108___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordLightHelmet
	handler.AddDatastoreEntryByKey("139151___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IARitualBoethiahHelm
	handler.AddDatastoreEntryByKey("143534___Hothtrooper44_ArmorCompilation.esp", 3, 45, 3) ; IAShamanLHelm
	handler.AddDatastoreEntryByKey("536247___Hothtrooper44_ArmorCompilation.esp", 3, 45, 3) ; IAShamanUHelm
	handler.AddDatastoreEntryByKey("144121___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IASnowBearHelmet
	handler.AddDatastoreEntryByKey("53613___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IASpellbinderCrimsonHelmet
	handler.AddDatastoreEntryByKey("53620___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IASpellbinderRunicHelmet
	handler.AddDatastoreEntryByKey("436723___Hothtrooper44_ArmorCompilation.esp", 3, 35, 14) ; IAStormlordHelmet
	handler.AddDatastoreEntryByKey("143496___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IATrollbaneHeavyHelmet
	handler.AddDatastoreEntryByKey("143501___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IATrollbaneLightHelmet
	handler.AddDatastoreEntryByKey("143494___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IATrollbaneHeavyHeaddress
	handler.AddDatastoreEntryByKey("143500___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IATrollbaneLightHeaddress
	handler.AddDatastoreEntryByKey("3472___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAWarchiefHeavyHeaddress
	handler.AddDatastoreEntryByKey("3473___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAWarchiefLightHeaddress
	handler.AddDatastoreEntryByKey("3456___Hothtrooper44_ArmorCompilation.esp", 3, 40, 72) ; IAVagabondHelmet
	handler.AddDatastoreEntryByKey("3462___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAVanguardPlateHelmet
	handler.AddDatastoreEntryByKey("3463___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAVanguardPlateHelmetCLOSED
	handler.AddDatastoreEntryByKey("144126___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IAVvardenfellGlassHelmet
	handler.AddDatastoreEntryByKey("17238___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IAApotheusHood
	handler.AddDatastoreEntryByKey("18651___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodBlack
	handler.AddDatastoreEntryByKey("8949___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodBlackScarf
	handler.AddDatastoreEntryByKey("18650___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodPlain
	handler.AddDatastoreEntryByKey("764316___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodPlainScarf
	handler.AddDatastoreEntryByKey("18652___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodWhite
	handler.AddDatastoreEntryByKey("6185___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorHeavyFurHoodWhiteScarf
	handler.AddDatastoreEntryByKey("18654___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodBlack
	handler.AddDatastoreEntryByKey("8957___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodBlackScarf
	handler.AddDatastoreEntryByKey("18653___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodPlain
	handler.AddDatastoreEntryByKey("764315___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodPlainScarf
	handler.AddDatastoreEntryByKey("18655___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodWhite
	handler.AddDatastoreEntryByKey("7567___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAArmorLightFurHoodWhiteScarf
	handler.AddDatastoreEntryByKey("145640___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerEngravedHood
	handler.AddDatastoreEntryByKey("145650___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerHood
	handler.AddDatastoreEntryByKey("145658___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IABosmerHuntLightHood
	handler.AddDatastoreEntryByKey("139251___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonHHood
	handler.AddDatastoreEntryByKey("543164___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonEbonLHood
	handler.AddDatastoreEntryByKey("20283___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonhideHeavyHood
	handler.AddDatastoreEntryByKey("144023___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonhideLHood
	handler.AddDatastoreEntryByKey("226060___Hothtrooper44_ArmorCompilation.esp", 3, 40, 58) ; IADragonhideUHood
	handler.AddDatastoreEntryByKey("23081___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IADwarvenMageHHood
	handler.AddDatastoreEntryByKey("144027___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IADwarvenMageLHood
	handler.AddDatastoreEntryByKey("226052___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IADwarvenMageUHood
	handler.AddDatastoreEntryByKey("145738___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAEbonyMageHeavyHood
	handler.AddDatastoreEntryByKey("145742___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAEbonyMageLightHood
	handler.AddDatastoreEntryByKey("226044___Hothtrooper44_ArmorCompilation.esp", 3, 40, 29) ; IAEbonyMageUnarmoredHood
	handler.AddDatastoreEntryByKey("15921___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAEinherjarBrigandineDarkHood
	handler.AddDatastoreEntryByKey("15922___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAEinherjarBrigandineLightHood
	handler.AddDatastoreEntryByKey("32831___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAEinherjarPlateDarkHood
	handler.AddDatastoreEntryByKey("4819___Hothtrooper44_ArmorCompilation.esp", 3, 55, 29) ; IAEinherjarPlateLightHood
	handler.AddDatastoreEntryByKey("18649___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodBlack
	handler.AddDatastoreEntryByKey("8956___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodBlackScarf
	handler.AddDatastoreEntryByKey("18648___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodPlain
	handler.AddDatastoreEntryByKey("764314___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodPlainScarf
	handler.AddDatastoreEntryByKey("18656___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodWhite
	handler.AddDatastoreEntryByKey("7566___Hothtrooper44_ArmorCompilation.esp", 3, 45, 14) ; IAFurHoodWhiteScarf
	handler.AddDatastoreEntryByKey("23153___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IARangerHood
	handler.AddDatastoreEntryByKey("144115___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IARingmailHood
	handler.AddDatastoreEntryByKey("143696___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodBlack
	handler.AddDatastoreEntryByKey("143697___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodBlue
	handler.AddDatastoreEntryByKey("143698___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodGreen
	handler.AddDatastoreEntryByKey("143699___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodRed
	handler.AddDatastoreEntryByKey("143700___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalHeavyHoodWhite
	handler.AddDatastoreEntryByKey("143721___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodBlack
	handler.AddDatastoreEntryByKey("143722___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodBlue
	handler.AddDatastoreEntryByKey("143723___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodGreen
	handler.AddDatastoreEntryByKey("143724___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodRed
	handler.AddDatastoreEntryByKey("143725___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalLightHoodWhite
	handler.AddDatastoreEntryByKey("143750___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodBlack
	handler.AddDatastoreEntryByKey("143751___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodBlue
	handler.AddDatastoreEntryByKey("143752___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodGreen
	handler.AddDatastoreEntryByKey("143753___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodRed
	handler.AddDatastoreEntryByKey("143754___Hothtrooper44_ArmorCompilation.esp", 3, 30, 29) ; IATribunalUnarmoredHoodWhite
	handler.AddDatastoreEntryByKey("50836___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IAWitchplateHood
	handler.AddDatastoreEntryByKey("3427___Hothtrooper44_ArmorCompilation.esp", 3, 0, 0) ; IAFalkreathCrown
	handler.AddDatastoreEntryByKey("3464___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAWarchiefHeavyBattlecrown
	handler.AddDatastoreEntryByKey("3465___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAWarchiefLightBattlecrown
	handler.AddDatastoreEntryByKey("143593___Hothtrooper44_ArmorCompilation.esp", 3, 0, 0) ; IAConanCirclet 	@CHECK
	handler.AddDatastoreEntryByKey("143464___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAMantleSilverHandHeavy
	handler.AddDatastoreEntryByKey("143465___Hothtrooper44_ArmorCompilation.esp", 3, 50, 14) ; IAMantleSilverHandLight
	handler.AddDatastoreEntryByKey("4807___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IASeadogTricorne
	handler.AddDatastoreEntryByKey("7571___Hothtrooper44_ArmorCompilation.esp", 3, 35, 43) ; IASeadogTricorneFeathered


	handler.AddDatastoreEntryByKey("20257___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IAAkaviriSamuraiBoots
	handler.AddDatastoreEntryByKey("144009___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IAAlduinBoots
	handler.AddDatastoreEntryByKey("46672___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IAApotheusBoots
	handler.AddDatastoreEntryByKey("23131___Hothtrooper44_ArmorCompilation.esp", 4, 7, 6) ; IABarbarianBoots
	handler.AddDatastoreEntryByKey("144095___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IABoiledChitinHBoots
	handler.AddDatastoreEntryByKey("544584___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IABoiledChitinLBoots
	handler.AddDatastoreEntryByKey("145632___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerBoots
	handler.AddDatastoreEntryByKey("145635___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerEngravedBoots
	handler.AddDatastoreEntryByKey("145644___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerHeavyBoots
	handler.AddDatastoreEntryByKey("145651___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerHuntHeavyBoots
	handler.AddDatastoreEntryByKey("145655___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IABosmerHuntLightBoots
	handler.AddDatastoreEntryByKey("143591___Hothtrooper44_ArmorCompilation.esp", 4, 15, 6) ; IAConanBoots
	handler.AddDatastoreEntryByKey("143607___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IACrimsonArcherBoots
	handler.AddDatastoreEntryByKey("145722___Hothtrooper44_ArmorCompilation.esp", 4, 18, 21) ; IADaedricLordBoots
	handler.AddDatastoreEntryByKey("139235___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonEbonBulkyBoots
	handler.AddDatastoreEntryByKey("139236___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonEbonSleekBoots
	handler.AddDatastoreEntryByKey("20280___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonhideHeavyBoots
	handler.AddDatastoreEntryByKey("144021___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonhideLBoots
	handler.AddDatastoreEntryByKey("226062___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonhideUBoots
	handler.AddDatastoreEntryByKey("143556___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonKnightHBoots
	handler.AddDatastoreEntryByKey("548819___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IADragonKnightLBoots
	handler.AddDatastoreEntryByKey("23078___Hothtrooper44_ArmorCompilation.esp", 4, 15, 21) ; IADwarvenMageHBoots
	handler.AddDatastoreEntryByKey("144025___Hothtrooper44_ArmorCompilation.esp", 4, 15, 21) ; IADwarvenMageLBoots
	handler.AddDatastoreEntryByKey("226050___Hothtrooper44_ArmorCompilation.esp", 4, 15, 21) ; IADwarvenMageUBoots
	handler.AddDatastoreEntryByKey("145735___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAEbonyMageHeavyBoots
	handler.AddDatastoreEntryByKey("145739___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAEbonyMageLightBoots
	handler.AddDatastoreEntryByKey("226042___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAEbonyMageUnarmoredBoots
	handler.AddDatastoreEntryByKey("15913___Hothtrooper44_ArmorCompilation.esp", 4, 24, 21) ; IAEinherjarBrigandineDarkBoots
	handler.AddDatastoreEntryByKey("15914___Hothtrooper44_ArmorCompilation.esp", 4, 24, 21) ; IAEinherjarBrigandineLightBoots
	handler.AddDatastoreEntryByKey("3432___Hothtrooper44_ArmorCompilation.esp", 4, 24, 21) ; IAEinherjarPlateDarkBoots
	handler.AddDatastoreEntryByKey("4817___Hothtrooper44_ArmorCompilation.esp", 4, 24, 21) ; IAEinherjarPlateLightBoots
	handler.AddDatastoreEntryByKey("3426___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAFalkreathBoots
	handler.AddDatastoreEntryByKey("144099___Hothtrooper44_ArmorCompilation.esp", 4, 24, 14) ; IAGlacialCrystalHBoots
	handler.AddDatastoreEntryByKey("544589___Hothtrooper44_ArmorCompilation.esp", 4, 24, 14) ; IAGlacialCrystalLBoots
	handler.AddDatastoreEntryByKey("3477___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAHedgeKnightBoots
	handler.AddDatastoreEntryByKey("23064___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IAHeroicImperialBoots
	handler.AddDatastoreEntryByKey("43879___Hothtrooper44_ArmorCompilation.esp", 4, 18, 14) ; IAHeroicStormcloakBoots
	handler.AddDatastoreEntryByKey("14466___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IAHunterBoots
	handler.AddDatastoreEntryByKey("23049___Hothtrooper44_ArmorCompilation.esp", 4, 12, 6) ; IAMercenaryBoots
	handler.AddDatastoreEntryByKey("16064___Hothtrooper44_ArmorCompilation.esp", 4, 7, 6) ; IANordMailHeavyBoots
	handler.AddDatastoreEntryByKey("16067___Hothtrooper44_ArmorCompilation.esp", 4, 7, 6) ; IANordMailLightBoots
	handler.AddDatastoreEntryByKey("43875___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAPaladinBoots
	;handler.AddDatastoreEntryByKey("23101___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordHeavyBoots
	;handler.AddDatastoreEntryByKey("23105___Hothtrooper44_ArmorCompilation.esp", X, Y, Z) ; IAPrimitiveNordLightBoots
	handler.AddDatastoreEntryByKey("23150___Hothtrooper44_ArmorCompilation.esp", 4, 12, 6) ; IARangerBoots
	handler.AddDatastoreEntryByKey("3434___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IARedguardKnightHeavyBoots
	handler.AddDatastoreEntryByKey("3435___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IARedguardKnightLightBoots
	handler.AddDatastoreEntryByKey("144112___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IARingmailBoots
	handler.AddDatastoreEntryByKey("139148___Hothtrooper44_ArmorCompilation.esp", 4, 15, 29) ; IARitualBoethiahBoots
	handler.AddDatastoreEntryByKey("6188___Hothtrooper44_ArmorCompilation.esp", 4, 12, 21) ; IASeadogBoots
	handler.AddDatastoreEntryByKey("143535___Hothtrooper44_ArmorCompilation.esp", 4, 15, 6) ; IAShamanLBoots
	handler.AddDatastoreEntryByKey("536245___Hothtrooper44_ArmorCompilation.esp", 4, 15, 6) ; IAShamanUBoots
	handler.AddDatastoreEntryByKey("144119___Hothtrooper44_ArmorCompilation.esp", 4, 18, 14) ; IASnowBearBoots
	handler.AddDatastoreEntryByKey("53614___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IASpellbinderCrimsonBoots
	handler.AddDatastoreEntryByKey("53619___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IASpellbinderRunicBoots
	handler.AddDatastoreEntryByKey("436722___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAStormlordBoots
	handler.AddDatastoreEntryByKey("143686___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsBlack
	handler.AddDatastoreEntryByKey("143687___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsBlue
	handler.AddDatastoreEntryByKey("143688___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsGreen
	handler.AddDatastoreEntryByKey("143689___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsRed
	handler.AddDatastoreEntryByKey("143690___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalHeavyBootsWhite
	handler.AddDatastoreEntryByKey("143711___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsBlack
	handler.AddDatastoreEntryByKey("143712___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsBlue
	handler.AddDatastoreEntryByKey("143713___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsGreen
	handler.AddDatastoreEntryByKey("143714___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsRed
	handler.AddDatastoreEntryByKey("143715___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalLightBootsWhite
	handler.AddDatastoreEntryByKey("143740___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsBlack
	handler.AddDatastoreEntryByKey("143741___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsBlue
	handler.AddDatastoreEntryByKey("143742___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsGreen
	handler.AddDatastoreEntryByKey("143743___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsRed
	handler.AddDatastoreEntryByKey("143744___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IATribunalUnarmoredBootsWhite
	handler.AddDatastoreEntryByKey("143491___Hothtrooper44_ArmorCompilation.esp", 4, 18, 14) ; IATrollbaneHeavyBoots
	handler.AddDatastoreEntryByKey("143497___Hothtrooper44_ArmorCompilation.esp", 4, 18, 14) ; IATrollbaneLightBoots
	handler.AddDatastoreEntryByKey("3450___Hothtrooper44_ArmorCompilation.esp", 4, 12, 35) ; IAVagabondCrimsonBoots
	handler.AddDatastoreEntryByKey("3452___Hothtrooper44_ArmorCompilation.esp", 4, 12, 35) ; IAVagabondDuskBoots
	handler.AddDatastoreEntryByKey("3451___Hothtrooper44_ArmorCompilation.esp", 4, 12, 35) ; IAVagabondLeatherBoots
	handler.AddDatastoreEntryByKey("3459___Hothtrooper44_ArmorCompilation.esp", 4, 15, 21) ; IAVanguardPlateBoots
	handler.AddDatastoreEntryByKey("144123___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IAVvardenfellGlassBoots
	handler.AddDatastoreEntryByKey("50834___Hothtrooper44_ArmorCompilation.esp", 4, 12, 14) ; IAWitchplateBoots
	handler.AddDatastoreEntryByKey("436742___Hothtrooper44_ArmorCompilation.esp", 4, 15, 14) ; IAImperialKnightGreaves
	handler.AddDatastoreEntryByKey("3474___Hothtrooper44_ArmorCompilation.esp", 4, 21, 14) ; IAWarchiefHeavyStompers
	handler.AddDatastoreEntryByKey("3475___Hothtrooper44_ArmorCompilation.esp", 4, 21, 14) ; IAWarchiefLightStompers


	handler.AddDatastoreEntryByKey("145642___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IABosmerFullCape
	handler.AddDatastoreEntryByKey("145660___Hothtrooper44_ArmorCompilation.esp", 7, 8, 8) ; IABosmerShoulderCape
	handler.AddDatastoreEntryByKey("145641___Hothtrooper44_ArmorCompilation.esp", 7, 8, 8) ; IABosmerEngravedShoulderCape
	handler.AddDatastoreEntryByKey("436740___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IAImperialKnightCape
	handler.AddDatastoreEntryByKey("63308___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IARedguardKnightCape
	handler.AddDatastoreEntryByKey("11733___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IASeadogCape
	handler.AddDatastoreEntryByKey("143464___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IAMantleSilverHandHeavy
	handler.AddDatastoreEntryByKey("143465___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IAMantleSilverHandLight
	handler.AddDatastoreEntryByKey("43874___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IAPaladinCuirass
	handler.AddDatastoreEntryByKey("23153___Hothtrooper44_ArmorCompilation.esp", 7, 8, 20) ; IARangerHood
	handler.AddDatastoreEntryByKey("144117___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IASnowBearCuirass
	handler.AddDatastoreEntryByKey("436720___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IAStormlordCuirass
	handler.AddDatastoreEntryByKey("143492___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IATrollbaneHeavyCuirass
	handler.AddDatastoreEntryByKey("143498___Hothtrooper44_ArmorCompilation.esp", 7, 40, 12) ; IATrollbaneLightCuirass
	handler.AddDatastoreEntryByKey("3447___Hothtrooper44_ArmorCompilation.esp", 7, 20, 20) ; IAVagabondCrimsonCuirass
	handler.AddDatastoreEntryByKey("3449___Hothtrooper44_ArmorCompilation.esp", 7, 20, 20) ; IAVagabondDuskCuirass
	handler.AddDatastoreEntryByKey("3448___Hothtrooper44_ArmorCompilation.esp", 7, 20, 20) ; IAVagabondLeatherCuirass
	handler.AddDatastoreEntryByKey("13097___Hothtrooper44_ArmorCompilation.esp", 7, 10, 10) ; IAApotheusScarf
	handler.AddDatastoreEntryByKey("143706___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeBlackCloak
	handler.AddDatastoreEntryByKey("143701___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeBlackNoCloak
	handler.AddDatastoreEntryByKey("143707___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeBlueCloak
	handler.AddDatastoreEntryByKey("143702___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeBlueNoCloak
	handler.AddDatastoreEntryByKey("143708___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeGreenCloak
	handler.AddDatastoreEntryByKey("143703___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeGreenNoCloak
	handler.AddDatastoreEntryByKey("143709___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeRedCloak
	handler.AddDatastoreEntryByKey("143704___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeRedNoCloak
	handler.AddDatastoreEntryByKey("143710___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeWhiteCloak
	handler.AddDatastoreEntryByKey("143705___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalHeavyRobeWhiteNoCloak
	handler.AddDatastoreEntryByKey("143731___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeBlackCloak
	handler.AddDatastoreEntryByKey("143726___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeBlackNoCloak
	handler.AddDatastoreEntryByKey("143732___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeBlueCloak
	handler.AddDatastoreEntryByKey("143727___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeBlueNoCloak
	handler.AddDatastoreEntryByKey("143733___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeGreenCloak
	handler.AddDatastoreEntryByKey("143728___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeGreenNoCloak
	handler.AddDatastoreEntryByKey("143734___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeRedCloak
	handler.AddDatastoreEntryByKey("143729___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeRedNoCloak
	handler.AddDatastoreEntryByKey("143735___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeWhiteCloak
	handler.AddDatastoreEntryByKey("143730___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalLightRobeWhiteNoCloak
	handler.AddDatastoreEntryByKey("143755___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeBlack
	handler.AddDatastoreEntryByKey("143756___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeBlue
	handler.AddDatastoreEntryByKey("143757___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeGreen
	handler.AddDatastoreEntryByKey("143758___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeRed
	handler.AddDatastoreEntryByKey("143759___Hothtrooper44_ArmorCompilation.esp", 7, 5, 5) ; IATribunalUnarmoredRobeWhite


	handler.AddDatastoreEntryByKey("143495___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATrollbaneHeavyMask		@IGNORE
	handler.AddDatastoreEntryByKey("143502___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATrollbaneLightMask 		@IGNORE
	handler.AddDatastoreEntryByKey("143736___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATribunalMaskBronze		@IGNORE
	handler.AddDatastoreEntryByKey("143737___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATribunalMaskEbony		@IGNORE
	handler.AddDatastoreEntryByKey("143738___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATribunalMaskGold		@IGNORE
	handler.AddDatastoreEntryByKey("143739___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IATribunalMaskSilver		@IGNORE
	handler.AddDatastoreEntryByKey("139152___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IARitualBoethiahMask		@IGNORE
	handler.AddDatastoreEntryByKey("10329___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IASeadogEarings 			@IGNORE
	handler.AddDatastoreEntryByKey("10335___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IASeadogEyepatch			@IGNORE
	handler.AddDatastoreEntryByKey("145659___Hothtrooper44_ArmorCompilation.esp", 99, 0, 0) ; IABosmerMask 				@IGNORE
endFunction