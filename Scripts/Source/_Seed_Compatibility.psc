scriptname _Seed_Compatibility extends ReferenceAlias

import debug
import CampUtil
import SeedUtil
import _SeedInternal

int property SKSE_MIN_VERSION = 10703 autoReadOnly
int property CAMPFIRE_MIN_VERSION = 11100 autoReadOnly

GlobalVariable property _Seed_PreviousVersion auto
GlobalVariable property _Seed_LastSeedVersion auto
GlobalVariable property _Camp_IsSpecialEdition auto

Spell property _Seed_IntensityPlayerSpell auto
Spell property _Seed_CheckNeedsSpell auto

string CONFIG_PATH = "../LastSeedData/"
bool datastore_update_required = false

;#PROPERTIES=====================================================================================================================
actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto

bool property isSKYUILoaded auto hidden						; SkyUI 4.1+
bool property isSKSELoaded auto hidden						; SKSE 1.7.3+
bool property isFrostfallLoaded auto hidden					; Frostfall
bool property isCACOLoaded auto hidden						; Complete Alchemy and Cooking Overhaul

;#Spellbooks===================================================================

;#Scrolls======================================================================

;#Campfire Skill System============================================================
Activator property _Seed_PerkNodeController_Provisioning auto

;#Misc=============================================================================
Message property _Seed_CriticalError_SKSE auto
Message property _Seed_CriticalError_Campfire auto

;#Upgrade Flags====================================================================

;#Release Notes====================================================================


Event OnPlayerLoadGame()
	RunCompatibility()
	; RegisterForKeysOnLoad()
	; RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()

	; Notify that we are finished loading up.
	SendEvent_LastSeedLoaded()
endEvent

function ErrorSKSE(int version)
	trace("[LastSeed][Warning] Detected SKSE version " + ((version as float) / 10000) + ". Expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer. Using Fallback Mode.")
	_Seed_CriticalError_SKSE.Show(((version as float) / 10000), ((SKSE_MIN_VERSION as float) / 10000))
endFunction

function FatalErrorCampfire(float version)
	float version_formatted = ((version as float) / 10000)
	float min_version_formatted = ((CAMPFIRE_MIN_VERSION as float) / 10000)
	trace("[LastSeed][ERROR] Detected Campfire version " + version_formatted + ", out of date! Expected " + min_version_formatted + " or newer.")
	while true
		_Seed_CriticalError_Campfire.Show(version_formatted, min_version_formatted)
		utility.wait(3.0)
	endWhile
endFunction

function RunCompatibility()
	trace("[LastSeed]======================================================================================================")
	trace("[LastSeed]                    Last Seed is now performing start-up and compatibility checks.                    ")
	trace("[LastSeed]     Papyrus warnings related to missing files may follow. These are NORMAL and should be ignored.    ")
	trace("[LastSeed]======================================================================================================")

	if _Camp_IsSpecialEdition.GetValueInt() != 2
		bool skse_loaded = SKSE.GetVersion()
		if skse_loaded
			int skse_version = (SKSE.GetVersion() * 10000) + (SKSE.GetVersionMinor() * 100) + SKSE.GetVersionBeta()
			if skse_version < SKSE_MIN_VERSION
				isSKSELoaded = false
				ErrorSKSE(skse_version)
			else
				isSKSELoaded = true
				trace("[LastSeed] Detected SKSE version " + ((skse_version as float) / 10000) + " (expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer, success!)")
			endif
		else
			isSKSELoaded = false
			ErrorSKSE(0)
		endif
	endif

	VanillaGameLoadUp()

	; Verify that the food datastore has been populated.
	CheckDatastore()

	; Update the previous version value with the current version
	_Seed_PreviousVersion.SetValue(_Seed_LastSeedVersion.GetValue())

	float campfire_version = CampUtil.GetCampfireVersion()
	if campfire_version < CAMPFIRE_MIN_VERSION
		FatalErrorCampfire(campfire_version)
	else
		trace("[LastSeed] Detected Campfire version " + campfire_version + " (expected " + CAMPFIRE_MIN_VERSION + " or newer, success!)")
	endif

	isSKYUILoaded = IsPluginLoaded(0x01000814, "SkyUI.esp")
	isFrostfallLoaded = IsPluginLoaded(0x00064AF8, "Frostfall.esp")

	trace("[LastSeed]======================================================================================================")
	trace("[LastSeed]                      Last Seed start-up and compatibility checks complete.   		                ")
	trace("[LastSeed]======================================================================================================")

	if isSKYUILoaded
		; SendEvent_SKSE_LoadProfileOnStartup()
	endif
	
	; RegisterForControlsOnLoad()
	RegisterForEventsOnLoad()
	; RegisterForMenusOnLoad()
	AddStartupSpells()
	; RegisterCampfireSkill()

	; Load a meter preset for the user's display aspect ratio
	SendEvent_SKSE_ApplyMeterPreset(2)
endFunction

function VanillaGameLoadUp()
	; TBD
endFunction

function RegisterForControlsOnLoad()
	; TBD
endFunction

function RegisterForEventsOnLoad()
	GetHungerSystem().RegisterForEvents()
	GetThirstSystem().RegisterForEvents()
	GetFatigueSystem().RegisterForEvents()
	GetVitalityMeterHandler().RegisterForEvents()
	GetHungerMeterHandler().RegisterForEvents()
endFunction

function AddStartupSpells()
	PlayerRef.AddSpell(_Seed_IntensityPlayerSpell)
	PlayerRef.AddSpell(_Seed_CheckNeedsSpell)
endFunction

function SendEvent_LastSeedLoaded()
	FallbackEventEmitter emitter = GetEventEmitter_LastSeedLoaded()
	int handle = emitter.Create("LastSeed_Loaded")
	if handle
		emitter.Send(handle)
	endif
endFunction

function RegisterCampfireSkill()
	GlobalVariable CampfireAPIVersion = Game.GetFormFromFile(0x03F1BE, "Campfire.esm") as GlobalVariable
	if CampfireAPIVersion && CampfireAPIVersion.GetValueInt() >= 4
		bool b = CampUtil.RegisterPerkTree(_Seed_PerkNodeController_Provisioning, "LastSeed.esp")
	else
		debug.trace("[Campfire] ERROR: Unable to register Campfire Skill System for LastSeed.esp. Campfire was not found or the version loaded is not compatible. Expected CampUtil API 4 or higher, got " + CampfireAPIVersion.GetValueInt())
	endif
endFunction

function CheckDatastore()
	SeedDebug(3, "Implement datastore sanity checking not yet implemented.")
	; @TODO
endFunction

bool function IsPluginLoaded(int iFormID, string sPluginName)
	if isSKSELoaded
		int i = Game.GetModByName(sPluginName)
		if i != 255
			debug.trace("[LastSeed] Loaded: " + sPluginName)
			return true
		else
			return false
		endif
	else
		bool b = Game.GetFormFromFile(iFormID, sPluginName)
		if b
			debug.trace("[LastSeed] Loaded: " + sPluginName)
			return true
		else
			return false
		endif
	endif
endFunction

;@NOFALLBACK
function SendEvent_SKSE_ApplyMeterPreset(int aiValue)
	if isSKSELoaded
		int handle = ModEvent.Create("LastSeed_ApplyMeterPreset")
		if handle
			ModEvent.PushInt(handle, aiValue)
			ModEvent.Send(handle)
		endif
	endif
endFunction