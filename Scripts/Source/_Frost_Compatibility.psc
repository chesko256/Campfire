scriptname _Frost_Compatibility extends ReferenceAlias

import debug
import FrostUtil
;import _CampInternal

int property SKSE_MIN_VERSION = 10703 autoReadOnly

;#PROPERTIES=====================================================================================================================
actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto

;#Scripts======================================================================
;_Camp_SkyUIConfigPanelScript property FrostConfig Auto 				;SkyUI Configuration script
;_Camp_Main property Campfire auto 									;Main script
_Frost_ConditionValues property Conditions auto

;#Quests=======================================================================
;Quest property _Camp_MainQuest auto 						;Main quest
;Quest property _Camp_FollowerQuest auto 					;Follower tracking quest

;#Official DLC=================================================================
bool property isDLC1Loaded auto	hidden						;Dawnguard
bool property isDLC2Loaded auto hidden						;Dragonborn
bool property isHFLoaded auto hidden						;Hearthfire

;#Supported Mods===============================================================
bool property isSKYUILoaded auto hidden						;SkyUI 3.4+
bool property isLastSeedLoaded auto hidden					;Last Seed

;#Merchant Containers==========================================================
;ObjectReference property MerchantRiverwoodTraderContainer auto

;#FormLists====================================================================

;#Trees============================================================================
;@TODO: Move to Frostfall
;TreeObject property TreeReachTreeStump01 auto hidden

;#DLC / Mod Worldspaces============================================================
Worldspace property DLC2WS auto hidden						;Solstheim

;#Campfire Perk System=============================================================


;#Misc=============================================================================
Message property _Frost_CriticalError_SKSE auto
Weather property DLC2AshStorm auto hidden

;#Upgrade Flags====================================================================
bool Upgraded_1_1 = false


Event OnPlayerLoadGame()
	RunCompatibility()
	if isSKYUILoaded
		;CampConfig.LoadProfileOnStartup()
	else
		;RegisterForKeysOnLoad()
	endif
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

	float campfire_loaded = CampUtil.GetCampfireVersion()
	debug.trace("FROSTFALL FOUND CAMPFIRE " + campfire_loaded)
	
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
		else
			Conditions.IsDawnguardLoaded = true
		endif
	else
		isDLC1Loaded = IsPluginLoaded(0x02009403, "Dawnguard.esm")
		if isDLC1Loaded
			;DLC1 was just added.
			Conditions.IsDawnguardLoaded = true
		else
			Conditions.IsDawnguardLoaded = false
		endif
	endif

	if isDLC2Loaded
		isDLC2Loaded = IsPluginLoaded(0x0201FB99, "Dragonborn.esm")
		if !isDLC2Loaded
			;DLC2 was removed since the last save.
			Conditions.IsDragonbornLoaded = false
		else
			Conditions.IsDragonbornLoaded = true
		endif
	else
		isDLC2Loaded = IsPluginLoaded(0x0201FB99, "Dragonborn.esm")
		if isDLC2Loaded
			;DLC2 was just added.
			Conditions.IsDragonbornLoaded = true
		else
			Conditions.IsDragonbornLoaded = false
		endif
	endif
	
	if isHFLoaded
		isHFLoaded = IsPluginLoaded(0x0200306C, "HearthFires.esm")
		if !isHFLoaded
			;Hearthfire was removed since the last save.
			Conditions.IsHearthfireLoaded = false
		else
			Conditions.IsHearthfireLoaded = true
		endif
	else
		isHFLoaded = IsPluginLoaded(0x0200306C, "HearthFires.esm")
		if isHFLoaded
			;Hearthfire was just added.
			Conditions.IsHearthfireLoaded = true
		else
			Conditions.IsHearthfireLoaded = false
		endif
	endif

	if isLastSeedLoaded
		isLastSeedLoaded = IsPluginLoaded(0x02000D63, "LastSeed.esp")
		if !isLastSeedLoaded
			;Last Seed was removed since the last save.
			Conditions.IsLastSeedLoaded = false
		else
			Conditions.IsLastSeedLoaded = true
		endif
	else
		isLastSeedLoaded = IsPluginLoaded(0x02000D63, "LastSeed.esp")
		if isLastSeedLoaded
			;Last Seed was just added.
			Conditions.IsLastSeedLoaded = true
		else
			Conditions.IsLastSeedLoaded = false
			
		endif
	endif
	
	trace("[Frostfall]======================================================================================================")
	trace("[Frostfall]                            Frostfall compatibility check complete.   		                        ")
	trace("[Frostfall]======================================================================================================")

	if isSKYUILoaded
		;CampConfig.LoadProfileOnStartup()
	endif

	RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()
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

function VanillaGameLoadUp()
	; Verify quests are running and aliases are filled
	;/if !_Camp_MainQuest.IsRunning()
		_Camp_MainQuest.Start()
	endif
	if !_Camp_FollowerQuest.IsRunning()
		_Camp_FollowerQuest.Start()
	endif

	if !PlayerAlias.GetActorRef()
		PlayerAlias.ForceRefTo(PlayerRef)
	endif
	/;
	
	;@TODO: Move to Frostfall
	; TreeReachTreeStump01 = Game.GetFormFromFile(0x000B8A75, "Skyrim.esm") as TreeObject
endFunction


function AddStartupSpells()
	;/if isSKYUILoaded
		PlayerRef.RemoveSpell(_Camp_LegacyConfig_Spell)
	else
		PlayerRef.AddSpell(_Camp_LegacyConfig_Spell, false)
	endif
	/;

	;PlayerRef.AddSpell(_Frost_WetVFXSpell, false)
endFunction

function RegisterForKeysOnLoad()
	;CampConfig.RegisterForKeysOnLoad()
endFunction

function RegisterForControlsOnLoad()
	;CampDebug(0, "Compatibility is trying to call Campfire.RegisterForControlsOnLoad()")
	;Campfire.RegisterForControlsOnLoad()
endFunction

function RegisterForEventsOnLoad()
	GetWetnessSystem().RegisterForEvents()
endFunction
