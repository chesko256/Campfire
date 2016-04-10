Scriptname _Camp_Compatibility extends ReferenceAlias

import debug
import Game
import CampUtil
import _CampInternal
import _Camp_ArrayHelper

;@SKYRIMOLD
; int property SKSE_MIN_VERSION = 10703 autoReadOnly
GlobalVariable property _Camp_PreviousVersion auto
GlobalVariable property _Camp_CampfireVersion auto
GlobalVariable property _Camp_IsBeta auto

;#PROPERTIES=====================================================================================================================
actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto

;@SKYRIMOLD
; Activator[] property PerkNodeControllers auto hidden
; bool property multiple_perk_trees = false auto hidden 				;Flag for perk tree navigation

;#Scripts======================================================================
_Camp_Main property Campfire auto 									;Main script
_Camp_ObjectPlacementThreadManager property PlacementSystem auto 	;Placement System Script
_Camp_TentSystem property TentSys auto
_Camp_ConditionValues property Conditions auto

;@SKYRIMOLD
; _Camp_SkyUIConfigPanelScript property CampConfig Auto 				;SkyUI Configuration script

;#Quests=======================================================================
Quest property _Camp_MainQuest auto 						;Main quest

;#Official DLC=================================================================
bool property isDLC1Loaded auto	hidden						;Automatron
bool property isDLC2Loaded auto hidden						;Wasteland Workshop
bool property isDLC3Loaded auto hidden						;Far Harbor
bool property isSurvivalLoaded auto hidden					;Survival Mode

;#Supported Mods===============================================================

bool property isF4SELoaded auto hidden						;F4SE

;#Merchant Containers==========================================================
;@TBD

;#FormLists====================================================================
formlist property _Camp_Trees auto							;List of valid trees for Wood Harvesting
formlist property _Camp_WorldspacesInteriors auto			;Interior exception worldspace
formlist property _Camp_HeatSources_All auto
formlist property _Camp_HeatSources_Fire auto
formlist property _Camp_HeatSources_Fire_Small auto
formlist property _Camp_HeatSources_Fire_Medium auto
formlist property _Camp_HeatSources_Fire_Large auto
formlist property _Camp_HeatSources_Other auto

;@SKYRIMOLD
;/formlist property _Camp_ModWaterSkins auto 					;List of waterskins from other mods
/;

;#Keywords=========================================================================
;@TBD

;#DLC / Mod Worldspaces============================================================
Worldspace property DLC3WS auto hidden						;Far Harbor

;#Campfire Perk System=============================================================

;@SKYRIMOLD
;/Activator property _Camp_PerkNavControllerAct auto
Activator property _Camp_PerkNodeController_Camping auto
GlobalVariable property _Camp_PerkNodeControllerCount auto
/;

;#Misc=============================================================================
GlobalVariable property _Camp_HarvestWoodEnabled auto
Spell property _Camp_CreateItemSpell auto
Spell property _Camp_CampfireSpell auto
Spell property _Camp_HarvestWoodSpell auto
Spell property _Camp_LegacyConfig_Spell auto
Message property _Camp_BetaMessage auto

; Tinder ConstructibleObject recipes, etc

;@SKYRIMOLD
;/GlobalVariable property _Camp_HotkeyCreateItem auto
GlobalVariable property _Camp_HotkeyBuildCampfire auto
GlobalVariable property _Camp_HotkeyHarvestWood auto
GlobalVariable property _Camp_HotkeyInstincts auto
GlobalVariable property _Camp_PerkRank_Resourceful auto
GlobalVariable property _Camp_PerkRank_Firecraft auto
GlobalVariable property _Camp_LastSelectedSkill auto
Spell property _Camp_SurvivalVisionPower auto
Message property _Camp_CriticalError_SKSE auto
/;

;#Upgrade Flags====================================================================
;@TBD

Event OnPlayerLoadGame()
	;@SKYRIMOLD
	; CampfirePerkSystemSortOnStartup()
	RunCompatibility()
	
	;/if isSKYUILoaded && isSKSELoaded
		CampConfig.LoadProfileOnStartup()
	else
		RegisterForKeysOnLoad()
	endif

	if isSKSELoaded
		RegisterForControlsOnLoad()
		RegisterForEventsOnLoad()
	endif
	/;

	AddStartupSpells()
	CheckHarvestWoodDisabled()
	RegisterForRemoteEvent(PlayerRef, "OnDifficultyChanged")

	; Notify that we are finished loading up.
	;/if isSKSELoaded
		SendEvent_CampfireLoaded()
	endif
	/;
endEvent


function RunCompatibility()
	if _Camp_IsBeta.GetValueInt() == 2
		_Camp_BetaMessage.Show(_Camp_CampfireVersion.GetValue())
	endif

	VanillaGameLoadUp()

	trace("[Campfire]======================================================================================================")
	trace("[Campfire]     Campfire is now performing compatibility checks. Papyrus warnings about missing or               ")
	trace("[Campfire]             unloaded files may follow. This is NORMAL and can be ignored.   		                   ")
	trace("[Campfire]======================================================================================================")
	
	;/
	if !Upgraded_x_x
		Upgrade_x_x()
	endif
	/;

	; Update the previous version value with the current version
	_Camp_PreviousVersion.SetValue(_Camp_CampfireVersion.GetValue())

	;@SKYRIMOLD
	;/
	bool skse_loaded = SKSE.GetVersion()
	if skse_loaded
		int skse_version = (SKSE.GetVersion() * 10000) + (SKSE.GetVersionMinor() * 100) + SKSE.GetVersionBeta()
		if skse_version < SKSE_MIN_VERSION
			_Camp_CriticalError_SKSE.Show(((skse_version as float) / 10000), ((SKSE_MIN_VERSION as float) / 10000))
			isSKSELoaded = false
			Conditions.IsSKSELoaded = false
			trace("[Campfire][Warning] Detected SKSE version " + ((skse_version as float) / 10000) + ", out of date! Expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer.")
		else
			isSKSELoaded = true
			Conditions.IsSKSELoaded = true
			trace("[Campfire] Detected SKSE version " + ((skse_version as float) / 10000) + " (expected " + ((SKSE_MIN_VERSION as float) / 10000) + " or newer, success!)")
		endif
	endif
	
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
	/;

	if isDLC1Loaded
		isDLC1Loaded = IsPluginInstalled("DLCRobot.esm")
		if !isDLC1Loaded
			;DLC1 was removed since the last save.
			Conditions.IsAutomatronLoaded = false
		else
			Conditions.IsAutomatronLoaded = true
		endif
	else
		isDLC1Loaded = IsPluginInstalled("DLCRobot.esm")
		if isDLC1Loaded
			;DLC1 was just added.
			Conditions.IsAutomatronLoaded = true
		else
			Conditions.IsAutomatronLoaded = false
		endif
	endif

	;/
	if isDLC2Loaded
		isDLC2Loaded = IsPluginInstalled("Wasteland Workshop")
		if !isDLC2Loaded
			;DLC2 was removed since the last save.
			Conditions.IsWastelandWorkshopLoaded = false
		else
			Conditions.IsWastelandWorkshopLoaded = true
		endif
	else
		isDLC2Loaded = IsPluginInstalled("Wasteland Workshop")
		if isDLC2Loaded
			;DLC2 was just added.
			Conditions.IsWastelandWorkshopLoaded = true
		else
			Conditions.IsWastelandWorkshopLoaded = false
		endif
	endif

	if isDLC3Loaded
		isDLC3Loaded = IsPluginInstalled("Far Harbor")
		if !isDLC3Loaded
			;DLC3 was removed since the last save.
			Conditions.IsFarHarborLoaded = false
		else
			Conditions.IsFarHarborLoaded = true
		endif
	else
		isDLC3Loaded = IsPluginInstalled("Far Harbor")
		if isDLC3Loaded
			;DLC3 was just added.
			Conditions.IsFarHarborLoaded = true
		else
			Conditions.IsFarHarborLoaded = false
		endif
	endif
	/;

	if (Game.GetDifficulty() == 6)
		isSurvivalLoaded = true
		Conditions.IsSurvivalModeLoaded = true
	else
		isSurvivalLoaded = false
		Conditions.IsSurvivalModeLoaded = false
	endif
	
	if isDLC1Loaded
		;@TBD
	endif

	if isDLC2Loaded
		;@TBD
	endif

	if isDLC3Loaded
		;@TBD
	endif
	
	trace("[Campfire]======================================================================================================")
	trace("[Campfire]                            Campfire compatibility check complete.   		                           ")
	trace("[Campfire]======================================================================================================")
endFunction

Event Actor.OnDifficultyChanged(actor aSender, int aOldDifficulty, int aNewDifficulty)
	if (aOldDifficulty != 6) && (aNewDifficulty == 6)
		isSurvivalLoaded = true
		Conditions.IsSurvivalModeLoaded = true
	elseif (aOldDifficulty == 6) && (aNewDifficulty != 6)
		isSurvivalLoaded = false
		Conditions.IsSurvivalModeLoaded = false
	endif

EndEvent

function VanillaGameLoadUp()
	; Verify quests are running and aliases are filled
	if !_Camp_MainQuest.IsRunning()
		_Camp_MainQuest.Start()
	endif

	if !PlayerAlias.GetActorRef()
		PlayerAlias.ForceRefTo(PlayerRef)
	endif

	; Grab forms we can't fill as properties
	; PlacementSystem.SmallFire = Game.GetFormFromFile(0x00056204, "Campfire.esm")
endFunction


function AddStartupSpells()
	PlayerRef.AddSpell(_Camp_LegacyConfig_Spell, false)
	PlayerRef.AddSpell(_Camp_CreateItemSpell, false)
	PlayerRef.AddSpell(_Camp_CampfireSpell, false)
	PlayerRef.AddSpell(_Camp_HarvestWoodSpell, false)
	;@SKYRIMOLD
	;if isSKSELoaded
	;	PlayerRef.AddSpell(_Camp_SurvivalVisionPower, false)
	;endif
endFunction

function RegisterForEventsOnLoad()
	; pass
endFunction

function SetHarvestWoodAbility(bool abEnabled)
	if abEnabled
		_Camp_HarvestWoodEnabled.SetValueInt(2)
		PlayerRef.AddSpell(_Camp_HarvestWoodSpell, false)
	else
		_Camp_HarvestWoodEnabled.SetValueInt(1)
		PlayerRef.RemoveSpell(_Camp_HarvestWoodSpell)
	endif
endFunction

function CheckHarvestWoodDisabled()
	if _Camp_HarvestWoodEnabled.GetValueInt() != 2
		PlayerRef.RemoveSpell(_Camp_HarvestWoodSpell)
	endif
endFunction

;@SKYRIMOLD
;/function SendEvent_CampfireLoaded()
	int handle = ModEvent.Create("Campfire_Loaded")
	if handle
		ModEvent.Send(handle)
	endif
endFunction
/;


;Skyrim Campfire Perk System ========================================================================
;/
bool reg_locked = false
bool function CampfirePerkSystemRegister(Activator akNodeController, string asPluginName = "Unknown")
	int i = 0
	while reg_locked && i < 100
		i += 1
		Utility.Wait(0.2)
	endWhile
	reg_locked = true

	int index = ArrayCount(PerkNodeControllers)
	if index >= PerkNodeControllers.Length
		; We're full!
		return false
	endif

	int j = 0
	while j < PerkNodeControllers.Length
		if PerkNodeControllers[j] == akNodeController
			; We've already registered this node controller.
			return true
		else
			j += 1
		endif
	endWhile
	
	PerkNodeControllers[index] = akNodeController
	_Camp_PerkNodeControllerCount.SetValueInt(index + 1)
	debug.trace("[Campfire] Registered Campfire Skill System mod: " + asPluginName)
	CampDebug(0, "Current PerkNodeControllers: " + PerkNodeControllers)
	reg_locked = false
	return true
endFunction

bool function CampfirePerkSystemUnregister(Activator akNodeController, string asPluginName = "Unknown")
	bool found_controller = false

	int num_controllers = ArrayCount(PerkNodeControllers)
	int i = 0
	while i < num_controllers
		if PerkNodeControllers[i] == akNodeController
			; Remove this controller.
			PerkNodeControllers[i] = None
			debug.trace("[Campfire] Unregistered Campfire Skill System mod: " + asPluginName)
			found_controller = true
		else
			i += 1
		endif
	endWhile

	if found_controller
		bool b = ArraySort(PerkNodeControllers)
		_Camp_PerkNodeControllerCount.SetValueInt(ArrayCount(PerkNodeControllers))
		_Camp_LastSelectedSkill.SetValueInt(0)
		return true
	else
		return false
	endif
endFunction

function CampfirePerkSystemSortOnStartup()
	bool b = ArraySort(PerkNodeControllers)
	_Camp_PerkNodeControllerCount.SetValueInt(ArrayCount(PerkNodeControllers))
	_Camp_LastSelectedSkill.SetValueInt(0)
endFunction
/;
