scriptname _Frost_SkyUIConfigPanelScript extends SKI_ConfigBase

import FrostUtil

string CONFIG_PATH = "../FrostfallData/"

Actor property PlayerRef auto

; External scripts
_Frost_Compatibility property Compatibility auto
_Frost_Main property FrostfallMain auto

GlobalVariable property _Frost_AttributeExposure auto
GlobalVariable property _Frost_AttributeWetness auto
GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_AttributeCoverage auto

GlobalVariable property StartFrostfall auto
GlobalVariable property FrostfallRunning auto
GlobalVariable property _Frost_Setting_Animation auto
GlobalVariable property _Frost_Setting_1PAnimationAllowed auto
GlobalVariable property _Frost_Setting_ConditionMessages auto
GlobalVariable property _Frost_Setting_DisplayAttributesInWeathersense auto
; GlobalVariable property _Frost_Setting_ExposureMeterHeight auto
GlobalVariable property _Frost_Setting_ExposurePauseCombat auto
GlobalVariable property _Frost_Setting_ExposurePauseDialogue auto
GlobalVariable property _Frost_Setting_ExposureRate auto
GlobalVariable property _Frost_Setting_ForceFeedback auto
GlobalVariable property _Frost_Setting_FrostShaderOn auto
GlobalVariable property _Frost_Setting_FullScreenEffects auto
GlobalVariable property _Frost_Setting_MaxExposureMode auto
GlobalVariable property _Frost_Setting_MeterDisplayMode auto
GlobalVariable property _Frost_Setting_MeterDisplayTime auto
GlobalVariable property _Frost_Setting_MeterOpacity auto
GlobalVariable property _Frost_Setting_MovementPenalty auto
GlobalVariable property _Frost_Setting_NoFastTravel auto
GlobalVariable property _Frost_Setting_SoundEffects auto
GlobalVariable property _Frost_Setting_WeatherMessages auto
GlobalVariable property _Frost_Setting_WeathersenseDisplayMode auto
GlobalVariable property _Frost_Setting_WetShaderOn auto
GlobalVariable property _Frost_Setting_CurrentProfile auto
GlobalVariable property _Frost_Setting_AutoSaveLoad auto
GlobalVariable property _Frost_Setting_FrigidWaterIsLethal auto
GlobalVariable property _Frost_Setting_VampireMode auto
GlobalVariable property _Frost_Setting_NoWaiting auto
GlobalVariable property _Frost_HotkeyWeathersense auto

GlobalVariable property _Frost_DS_Body_InitProgress auto
GlobalVariable property _Frost_DS_Hands_InitProgress auto
GlobalVariable property _Frost_DS_Head_InitProgress auto
GlobalVariable property _Frost_DS_Feet_InitProgress auto
GlobalVariable property _Frost_DS_Cloak_InitProgress auto
GlobalVariable property _Frost_DatastoreInitialized auto

Spell property _Frost_Weathersense_Spell auto

bool must_exit = false

string[] ProfileList
string[] MaxExposureModeList
string[] VampirismModeList

int Overview_RunStatusText_OID
int Overview_RunSubStatusText_OID
int Overview_InfoLine1_OID
int Overview_InfoLine2_OID
int Overview_InfoLine3_OID
int Overview_InfoLine4_OID
int Overview_InfoLine5_OID
int Overview_InfoLine6_OID
int Overview_InfoLine7_OID
int Overview_InfoLine8_OID
int Overview_ExposureStatusText_OID
int Overview_WetnessStatusText_OID
int Overview_WarmthStatusText_OID
int Overview_CoverageStatusText_OID

int Gameplay_ExposureRate_OID
int Gameplay_MaxExposureMode_OID
int Gameplay_FrigidWater_OID
int Gameplay_ExposurePauseDialogue_OID
int Gameplay_ExposurePauseCombat_OID
int Gameplay_MovementPenalty_OID
int Gameplay_VampirismMode_OID
int Gameplay_DisableFT_OID
int Gameplay_DisableWaiting_OID
int Gameplay_WeathersenseHotkey_OID

int SaveLoad_SelectProfile_OID
int SaveLoad_RenameProfile_OID
int SaveLoad_DefaultProfile_OID
int SaveLoad_ProfileHelp_OID
int SaveLoad_Enable_OID

Event OnConfigInit()
	Pages = new string[7]
	Pages[0] = "$FrostfallOverviewPage"
	Pages[1] = "$FrostfallGameplayPage"
	Pages[2] = "$FrostfallEquipmentPage"
	Pages[3] = "$FrostfallInterfacePage"
	Pages[4] = "$FrostfallSaveLoadPage"
	Pages[5] = "$FrostfallGuidePage"
	Pages[6] = "$FrostfallSystemPage"

	MaxExposureModeList = new string[3]
	MaxExposureModeList[0] = "$FrostfallMaxExposureNothing"
	MaxExposureModeList[1] = "$FrostfallMaxExposureRescue"
	MaxExposureModeList[2] = "$FrostfallMaxExposureDeath"

	VampirismModeList = new string[2]
	VampirismModeList[0] = "$FrostfallVampirismHuman"
	VampirismModeList[1] = "$FrostfallVampirismSuperhuman"
endEvent

int function GetVersion()
	return 1
endFunction

Event OnVersionUpdate(int a_version)
	; pass
EndEvent

event OnPageReset(string page)																			;TRANSLATED
	if page == ""
		LoadCustomContent("frostfall/frostfall_splash.swf")
	else
		UnloadCustomContent()
	endif

	if page == "$FrostfallOverviewPage"
		PageReset_Overview()
	elseif page == "$FrostfallGameplayPage"
		PageReset_Gameplay()
	elseif page == "$FrostfallEquipmentPage"
		PageReset_Equipment()
	elseif page == "$FrostfallInterfacePage"
		PageReset_Interface()
	elseif page == "$FrostfallSaveLoadPage"
		PageReset_SaveLoad()
	elseif page == "$FrostfallGuidePage"
		PageReset_Guide()
	elseif page == "$FrostfallSystemPage"
		PageReset_System()
	endif
endEvent

Event OnConfigOpen()
	if FrostfallRunning.GetValueInt() == 2 && _Frost_DatastoreInitialized.GetValueInt() != 2
		must_exit = true
	else
		must_exit = false
	endif

	; Register for callbacks
	RegisterForModEvent("Frost_BodyDatastoreUpdate", "BodyDatastoreUpdate")
	RegisterForModEvent("Frost_HeadDatastoreUpdate", "HeadDatastoreUpdate")
	RegisterForModEvent("Frost_HandsDatastoreUpdate", "HandsDatastoreUpdate")
	RegisterForModEvent("Frost_FeetDatastoreUpdate", "FeetDatastoreUpdate")
	RegisterForModEvent("Frost_CloakDatastoreUpdate", "CloakDatastoreUpdate")
	RegisterForModEvent("Frost_StartupAlmostDone", "StartupAlmostDone")
EndEvent

Event OnConfigClose()
	UnregisterForAllModEvents()
EndEvent

function PageReset_Overview()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$FrostfallOverviewHeaderStatus")
	if FrostfallRunning.GetValueInt() == 2
		if _Frost_DatastoreInitialized.GetValueInt() == 2
			if !must_exit
				Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallEnabled")
			else
				Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallEnabled", OPTION_FLAG_DISABLED)
			endif
			Overview_RunSubStatusText_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		else
			Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallStartingUp", OPTION_FLAG_DISABLED)
			Overview_RunSubStatusText_OID = AddTextOption("$FrostfallStartingUpDetail", "", OPTION_FLAG_DISABLED)
		endif
	else
		if !must_exit
			Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallDisabled")
		else
			Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallDisabled", OPTION_FLAG_DISABLED)
		endif
		Overview_RunSubStatusText_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
	endif

	AddHeaderOption("$FrostfallOverviewHeaderInfo")
	if FrostfallRunning.GetValueInt() == 2
		if _Frost_DatastoreInitialized.GetValueInt() == 2
			Overview_InfoLine1_OID = AddTextOption("$FrostfallOverviewRunning", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine2_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine3_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine4_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine5_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine6_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine7_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine8_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		else
			Overview_InfoLine1_OID = AddTextOption("$FrostfallStartUpDSCreateBody", ((_Frost_DS_Body_InitProgress.GetValue() * 100.0) as int) + "%")
			Overview_InfoLine2_OID = AddTextOption("$FrostfallStartUpDSCreateHead", ((_Frost_DS_Head_InitProgress.GetValue() * 100.0) as int) + "%")
			Overview_InfoLine3_OID = AddTextOption("$FrostfallStartUpDSCreateHands", ((_Frost_DS_Hands_InitProgress.GetValue() * 100.0) as int) + "%")
			Overview_InfoLine4_OID = AddTextOption("$FrostfallStartUpDSCreateFeet", ((_Frost_DS_Feet_InitProgress.GetValue() * 100.0) as int) + "%")
			Overview_InfoLine5_OID = AddTextOption("$FrostfallStartUpDSCreateCloak", ((_Frost_DS_Cloak_InitProgress.GetValue() * 100.0) as int) + "%")
			Overview_InfoLine6_OID = AddTextOption("$FrostfallStartUpProgress", "$FrostfallStartUpWorking")
			Overview_InfoLine7_OID = AddTextOption("", "")
			Overview_InfoLine8_OID = AddTextOption("", "")
		endif
	else
		Overview_InfoLine1_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		Overview_InfoLine2_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		Overview_InfoLine3_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		Overview_InfoLine4_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		Overview_InfoLine5_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		Overview_InfoLine6_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		Overview_InfoLine7_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		Overview_InfoLine8_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
	endif

	SetCursorPosition(1) ; Move cursor to top right position

	AddHeaderOption("$FrostfallOverviewHeaderPlayerAttributes")
	if GetExposureSystem().IsSystemRunning()
		Overview_ExposureStatusText_OID = AddTextOption("$FrostfallOverviewExposureValue", (_Frost_AttributeExposure.GetValueInt() - 20), OPTION_FLAG_DISABLED)
	else
		Overview_ExposureStatusText_OID = AddTextOption("$FrostfallOverviewExposureValue", "", OPTION_FLAG_DISABLED)
	endif
	if GetWetnessSystem().IsSystemRunning()
		Overview_WetnessStatusText_OID = AddTextOption("$FrostfallOverviewWetnessValue", (((_Frost_AttributeWetness.GetValueInt() / 750.0) * 100.0) as int) + "%", OPTION_FLAG_DISABLED)
	else
		Overview_WetnessStatusText_OID = AddTextOption("$FrostfallOverviewWetnessValue", "", OPTION_FLAG_DISABLED)
	endif

	AddEmptyOption()

	AddHeaderOption("$FrostfallOverviewHeaderPlayerStats")
	if GetWarmthSystem().IsSystemRunning()
		Overview_WarmthStatusText_OID = AddTextOption("$FrostfallOverviewWarmthValue", _Frost_AttributeWarmth.GetValueInt(), OPTION_FLAG_DISABLED)
	else
		Overview_WarmthStatusText_OID = AddTextOption("$FrostfallOverviewWarmthValue", "", OPTION_FLAG_DISABLED)
	endif
	if GetCoverageSystem().IsSystemRunning()
		Overview_CoverageStatusText_OID = AddTextOption("$FrostfallOverviewCoverageValue", _Frost_AttributeCoverage.GetValueInt(), OPTION_FLAG_DISABLED)
	else
		Overview_CoverageStatusText_OID = AddTextOption("$FrostfallOverviewCoverageValue", "", OPTION_FLAG_DISABLED)
	endif
endFunction

function PageReset_Gameplay()
	SetCursorFillMode(TOP_TO_BOTTOM)
	;debug
	;/if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif
	/;

	AddHeaderOption("$FrostfallGameplayHeaderPlayer")
	Gameplay_ExposureRate_OID = AddSliderOption("$FrostfallGameplaySettingExposureRate", _Frost_Setting_ExposureRate.GetValue(), "{1}x")
	Gameplay_MaxExposureMode_OID = AddMenuOption("$FrostfallGameplaySettingPlayerExposureMode", MaxExposureModeList[_Frost_Setting_MaxExposureMode.GetValueInt() - 1])
	if _Frost_Setting_FrigidWaterIsLethal.GetValueInt() == 2
		Gameplay_FrigidWater_OID = AddToggleOption("$FrostfallGameplaySettingExposureWaterLethality", true)
	else
		Gameplay_FrigidWater_OID = AddToggleOption("$FrostfallGameplaySettingExposureWaterLethality", false)
	endif
	if _Frost_Setting_ExposurePauseDialogue.GetValueInt() == 2
		Gameplay_ExposurePauseDialogue_OID = AddToggleOption("$FrostfallGameplaySettingExposureDialoguePause", true)
	else
		Gameplay_ExposurePauseDialogue_OID = AddToggleOption("$FrostfallGameplaySettingExposureDialoguePause", false)
	endif
	if _Frost_Setting_ExposurePauseCombat.GetValueInt() == 2
		Gameplay_ExposurePauseCombat_OID = AddToggleOption("$FrostfallGameplaySettingExposureCombatPause", true)
	else
		Gameplay_ExposurePauseCombat_OID = AddToggleOption("$FrostfallGameplaySettingExposureCombatPause", false)
	endif
	if _Frost_Setting_MovementPenalty.GetValueInt() == 2
		Gameplay_MovementPenalty_OID = AddToggleOption("$FrostfallGameplaySettingPlayerMovement", true)
	else
		Gameplay_MovementPenalty_OID = AddToggleOption("$FrostfallGameplaySettingPlayerMovement", false)
	endif
	Gameplay_VampirismMode_OID = AddMenuOption("$FrostfallGameplaySettingPlayerVampirism", VampirismModeList[_Frost_Setting_VampireMode.GetValueInt()])

	AddHeaderOption("$FrostfallGameplayHeaderFastTravel")
	if _Frost_Setting_NoFastTravel.GetValueInt() == 2
		Gameplay_DisableFT_OID = AddToggleOption("$FrostfallGameplaySettingFTToggle", true)
	else
		Gameplay_DisableFT_OID = AddToggleOption("$FrostfallGameplaySettingFTToggle", false)
	endif
	if _Frost_Setting_NoWaiting.GetValueInt() == 2
		Gameplay_DisableWaiting_OID = AddToggleOption("$FrostfallGameplaySettingFTWaiting", true)
	else
		Gameplay_DisableWaiting_OID = AddToggleOption("$FrostfallGameplaySettingFTWaiting", false)
	endif

	SetCursorPosition(1)

	AddHeaderOption("$FrostfallGameplayHeaderWorld")
	AddTextOption("$FrostfallGameplaySettingsFollowers", "$FrostfallComingSoon", OPTION_FLAG_DISABLED)
	AddTextOption("$FrostfallGameplaySettingsNPCs", "$FrostfallComingSoon", OPTION_FLAG_DISABLED)
	AddTextOption("$FrostfallGameplaySettingsLightableFires", "$FrostfallComingSoon", OPTION_FLAG_DISABLED)
	AddTextOption("$FrostfallGameplaySettingsHarvestFromEnvironment", "$FrostfallComingSoon", OPTION_FLAG_DISABLED)
	AddTextOption("$FrostfallGameplaySettingsHarvestFromWoodPiles", "$FrostfallComingSoon", OPTION_FLAG_DISABLED)

	AddEmptyOption()
	AddEmptyOption()

	AddHeaderOption("$FrostfallGameplayHeaderHotkeys")
	Gameplay_WeathersenseHotkey_OID = AddKeyMapOption("$FrostfallHotkeyWeathersense", _Frost_HotkeyWeathersense.GetValueInt())

endFunction

function PageReset_Equipment()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

endFunction

function PageReset_Interface()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

endFunction

function PageReset_Guide()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

endFunction

function PageReset_SaveLoad()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$FrostfallSaveLoadHeaderProfile")
	if _Frost_Setting_AutoSaveLoad.GetValueInt() == 2
		SaveLoad_SelectProfile_OID = AddMenuOption("$FrostfallSaveLoadCurrentProfile", GetProfileName(_Frost_Setting_CurrentProfile.GetValueInt()))
	else
		SaveLoad_SelectProfile_OID = AddMenuOption("$FrostfallSaveLoadCurrentProfile", GetProfileName(_Frost_Setting_CurrentProfile.GetValueInt()), OPTION_FLAG_DISABLED)
	endif
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	SaveLoad_ProfileHelp_OID = AddTextOption("$FrostfallSaveLoadAboutProfiles", "")
	if _Frost_Setting_AutoSaveLoad.GetValueInt() == 2
		SaveLoad_Enable_OID = AddToggleOption("$FrostfallSaveLoadEnable", true)
	else
		SaveLoad_Enable_OID = AddToggleOption("$FrostfallSaveLoadEnable", false)
	endif

	SetCursorPosition(1) ; Move cursor to top right position

	AddEmptyOption()
	if _Frost_Setting_AutoSaveLoad.GetValueInt() == 2
		SKI_Main skyui = Game.GetFormFromFile(0x00000814, "SkyUI.esp") as SKI_Main
		int version = skyui.ReqSWFRelease
		if version >= 1026 	; SkyUI 5.1+
			SaveLoad_RenameProfile_OID = AddInputOption("", "$FrostfallSaveLoadRenameProfile")
		else
			SaveLoad_RenameProfile_OID = AddTextOption("$FrostfallSkyUI51Required", "$FrostfallSaveLoadRenameProfile", OPTION_FLAG_DISABLED)
		endif
		SaveLoad_DefaultProfile_OID = AddTextOption("", "$FrostfallSaveLoadDefaultProfile")
	endif
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	if _Frost_Setting_AutoSaveLoad.GetValueInt() == 2
		AddTextOption("$FrostfallSaveLoadSettingsSaved", "", OPTION_FLAG_DISABLED)
	endif
endFunction

string function GetProfileName(int aiProfileIndex)
	;bool b = JsonUtil.Load(CONFIG_PATH + "profile" + aiProfileIndex)
	return JsonUtil.GetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", missing = "Profile " + aiProfileIndex)
endFunction

function PageReset_System()

endFunction

event OnOptionSelect(int option)
	if option == Overview_RunStatusText_OID
		if FrostfallRunning.GetValueInt() == 2
			bool b = ShowMessage("$FrostfallOverviewShutDownPrompt")
			if b
				must_exit = true
				FrostfallRunning.SetValue(1)
				ForcePageReset()
				FrostfallMain.RegisterForModEvents()
				SendEvent_StopFrostfall()
			endif
		else
			bool b = ShowMessage("$FrostfallOverviewStartUpPrompt")
			if b
				must_exit = true
				FrostfallRunning.SetValue(2)
				ForcePageReset()
				FrostfallMain.RegisterForModEvents()
				SendEvent_StartFrostfall()
			endif
		endif
	elseif option == Gameplay_FrigidWater_OID
		if _Frost_Setting_FrigidWaterIsLethal.GetValueInt() == 2
			_Frost_Setting_FrigidWaterIsLethal.SetValueInt(1)
			SetToggleOptionValue(Gameplay_FrigidWater_OID, false)
		else
			_Frost_Setting_FrigidWaterIsLethal.SetValueInt(2)
			SetToggleOptionValue(Gameplay_FrigidWater_OID, true)
		endif
	elseif option == Gameplay_ExposurePauseDialogue_OID
		if _Frost_Setting_ExposurePauseDialogue.GetValueInt() == 2
			_Frost_Setting_ExposurePauseDialogue.SetValueInt(1)
			SetToggleOptionValue(Gameplay_ExposurePauseDialogue_OID, false)
		else
			_Frost_Setting_ExposurePauseDialogue.SetValueInt(2)
			SetToggleOptionValue(Gameplay_ExposurePauseDialogue_OID, true)
		endif
	elseif option == Gameplay_ExposurePauseCombat_OID
		if _Frost_Setting_ExposurePauseCombat.GetValueInt() == 2
			_Frost_Setting_ExposurePauseCombat.SetValueInt(1)
			SetToggleOptionValue(Gameplay_ExposurePauseCombat_OID, false)
		else
			_Frost_Setting_ExposurePauseCombat.SetValueInt(2)
			SetToggleOptionValue(Gameplay_ExposurePauseCombat_OID, true)
		endif
	elseif option == Gameplay_MovementPenalty_OID
		if _Frost_Setting_MovementPenalty.GetValueInt() == 2
			_Frost_Setting_MovementPenalty.SetValueInt(1)
			SetToggleOptionValue(Gameplay_MovementPenalty_OID, false)
		else
			_Frost_Setting_MovementPenalty.SetValueInt(2)
			SetToggleOptionValue(Gameplay_MovementPenalty_OID, true)
		endif
	elseif option == Gameplay_DisableFT_OID
		if _Frost_Setting_NoFastTravel.GetValueInt() == 2
			_Frost_Setting_NoFastTravel.SetValueInt(1)
			SetToggleOptionValue(Gameplay_DisableFT_OID, false)
		else
			_Frost_Setting_NoFastTravel.SetValueInt(2)
			SetToggleOptionValue(Gameplay_DisableFT_OID, true)
		endif
	elseif option == Gameplay_DisableWaiting_OID
		if _Frost_Setting_NoWaiting.GetValueInt() == 2
			_Frost_Setting_NoWaiting.SetValueInt(1)
			SetToggleOptionValue(Gameplay_DisableWaiting_OID, false)
		else
			_Frost_Setting_NoWaiting.SetValueInt(2)
			SetToggleOptionValue(Gameplay_DisableWaiting_OID, true)
		endif
	endif	
endEvent

event OnOptionDefault(int option)
	if option == Gameplay_WeathersenseHotkey_OID
		UnregisterForKey(_Frost_HotkeyWeathersense.GetValueInt())
		_Frost_HotkeyWeathersense.SetValue(0)
		ForcePageReset()
		PlayerRef.AddSpell(_Frost_Weathersense_Spell, false)
		SaveSettingToCurrentProfile("hotkey_weathersense", 0)
	endif
endEvent

Event OnOptionSliderOpen(int option)
	if option == Gameplay_ExposureRate_OID
		SetSliderDialogStartValue(_Frost_Setting_ExposureRate.GetValue())
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 3.0)
		SetSliderDialogInterval(0.1)
	endif
EndEvent

Event OnOptionSliderAccept(int option, float value)
	if option == Gameplay_ExposureRate_OID
		_Frost_Setting_ExposureRate.SetValue(value)
		SetSliderOptionValue(Gameplay_ExposureRate_OID, value, "{1}x")
	endif
EndEvent

Event OnOptionMenuOpen(int option)
	if option == Gameplay_MaxExposureMode_OID
		SetMenuDialogOptions(MaxExposureModeList)
		SetMenuDialogStartIndex(_Frost_Setting_MaxExposureMode.GetValueInt() - 1)
		SetMenuDialogDefaultIndex(0)
	elseif option == Gameplay_VampirismMode_OID
		SetMenuDialogOptions(VampirismModeList)
		SetMenuDialogStartIndex(_Frost_Setting_VampireMode.GetValueInt())
		SetMenuDialogDefaultIndex(0)
	elseif option == SaveLoad_SelectProfile_OID
		string[] profile_list = new string[10]
		int i = 0
		while i < 10
			string pname = GetProfileName(i + 1)
			profile_list[i] = pname
			i += 1
		endWhile
		SetMenuDialogOptions(profile_list)
		SetMenuDialogStartIndex(_Frost_Setting_CurrentProfile.GetValueInt() - 1)
		SetMenuDialogDefaultIndex(0)
	endif	
EndEvent

Event OnOptionMenuAccept(int option, int index)
	if option == Gameplay_MaxExposureMode_OID
		SetMenuOptionValue(Gameplay_MaxExposureMode_OID, MaxExposureModeList[index])
		_Frost_Setting_MaxExposureMode.SetValueInt(index + 1)
	elseif option == Gameplay_VampirismMode_OID
		SetMenuOptionValue(Gameplay_VampirismMode_OID, VampirismModeList[index])
		_Frost_Setting_VampireMode.SetValueInt(index)
	elseif option == SaveLoad_SelectProfile_OID
		bool b = ShowMessage("$FrostfallSaveLoadConfirm")
		if b
			SwitchToProfile(index + 1)
		endif
	endif
EndEvent

Event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)
	bool success
	if option == Gameplay_WeathersenseHotkey_OID
		success = RemapHotkey(option, keyCode, conflictControl, conflictName, _Frost_HotkeyWeathersense, _Frost_Weathersense_Spell)
		if success
			SaveSettingToCurrentProfile("hotkey_weathersense", keyCode)
		endif
	endif
EndEvent

bool function RemapHotkey(int option, int keyCode, string conflictControl, string conflictName, GlobalVariable akHotkeyGlobal, Spell akHotkeySpell)
	_Camp_Strings cs = _CampInternal.GetCampfireStrings()
	if conflictControl != ""
		if conflictName != ""
			; "This key is already bound to " + conflictControl + " in " + conflictName + ". Undesirable behavior may occur; use with caution, or assign to a different control."
			bool b = ShowMessage(cs.HotkeyConflict1 + conflictControl + cs.HotkeyConflict2 + conflictName + cs.HotkeyConflict3_mod)
			if b
				akHotkeyGlobal.SetValueInt(keyCode)
				RegisterForKey(akHotkeyGlobal.GetValueInt())
				ForcePageReset()
				Game.GetPlayer().RemoveSpell(akHotkeySpell)
				return true
			endif
		else
			; "This key is already bound to " + conflictControl + " in Skyrim. Please select a different key."
			ShowMessage(cs.HotkeyConflict1 + conflictControl + cs.HotkeyConflict3_game, a_withCancel = false)
			return false
		endif
	else
		akHotkeyGlobal.SetValueInt(keyCode)
		RegisterForKey(akHotkeyGlobal.GetValueInt())
		ForcePageReset()
		Game.GetPlayer().RemoveSpell(akHotkeySpell)
		return true
	endif
endFunction

function SaveSettingToCurrentProfile(string asKeyName, int aiValue)
	if _Frost_Setting_AutoSaveLoad.GetValueInt() == 2
		int current_profile_index = _Frost_Setting_CurrentProfile.GetValueInt()
		JsonUtil.SetIntValue(CONFIG_PATH + "profile" + current_profile_index, asKeyName, aiValue)
		JsonUtil.Save(CONFIG_PATH + "profile" + current_profile_index)
	endif
endFunction

function SaveSettingToCurrentProfileFloat(string asKeyName, float afValue)
	if _Frost_Setting_AutoSaveLoad.GetValueInt() == 2
		int current_profile_index = _Frost_Setting_CurrentProfile.GetValueInt()
		JsonUtil.SetFloatValue(CONFIG_PATH + "profile" + current_profile_index, asKeyName, afValue)
		JsonUtil.Save(CONFIG_PATH + "profile" + current_profile_index)
	endif
endFunction

int function LoadSettingFromProfile(int aiProfileIndex, string asKeyName)
	return JsonUtil.GetIntValue(CONFIG_PATH + "profile" + aiProfileIndex, asKeyName, -1)
endFunction

float function LoadSettingFromProfileFloat(int aiProfileIndex, string asKeyName)
	return JsonUtil.GetFloatValue(CONFIG_PATH + "profile" + aiProfileIndex, asKeyName, -1)
endFunction

function LoadProfileOnStartup()
	int auto_load = JsonUtil.GetIntValue(CONFIG_PATH + "common", "auto_load", 0)
	if auto_load == 2
		_Frost_Setting_AutoSaveLoad.SetValueInt(2)
		int last_profile = JsonUtil.GetIntValue(CONFIG_PATH + "common", "last_profile", 0)
		if last_profile != 0
			_Frost_Setting_CurrentProfile.SetValueInt(last_profile)
			SwitchToProfile(last_profile)
		else
			; default to Profile 1 and write the file
			_Frost_Setting_CurrentProfile.SetValueInt(1)
			JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", 1)
			JsonUtil.Save(CONFIG_PATH + "common")
			SwitchToProfile(1)
		endif
	elseif auto_load == 1
		_Frost_Setting_AutoSaveLoad.SetValueInt(1)
	elseif auto_load == 0
		; The file or setting does not exist, create it and default to auto-loading.
		; default to Profile 1 and write the file
		_Frost_Setting_AutoSaveLoad.SetValueInt(2)
		_Frost_Setting_CurrentProfile.SetValueInt(1)
		JsonUtil.SetIntValue(CONFIG_PATH + "common", "auto_load", 2)
		JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", 1)
		JsonUtil.Save(CONFIG_PATH + "common")
		SwitchToProfile(1)
	endif
endFunction

Event OnKeyDown(int keyCode)
	if UI.IsMenuOpen("Console") || UI.IsMenuOpen("Book Menu") || UI.IsMenuOpen("BarterMenu") || UI.IsMenuOpen("ContainerMenu") || UI.IsMenuOpen("Crafting Menu") || UI.IsMenuOpen("Dialogue Menu") || UI.IsMenuOpen("FavoritesMenu") || UI.IsMenuOpen("InventoryMenu") || UI.IsMenuOpen("Journal Menu") || UI.IsMenuOpen("Lockpicking Menu") || UI.IsMenuOpen("MagicMenu") || UI.IsMenuOpen("MapMenu") || UI.IsMenuOpen("MessageBoxMenu") || UI.IsMenuOpen("Sleep/Wait Menu") || UI.IsMenuOpen("StatsMenu")
		return
	endif
	if keyCode == _Frost_HotkeyWeathersense.GetValueInt()
		_Frost_Weathersense_Spell.Cast(PlayerRef)
	endif
EndEvent

string function GetCustomControl(int keyCode)
	if (keyCode == _Frost_HotkeyWeathersense.GetValueInt())
		return "Survival Skill: Weathersense"
	else
		return ""
	endIf
endFunction

function SwitchToProfile(int aiProfileIndex)
	_Frost_Setting_CurrentProfile.SetValueInt(aiProfileIndex)
	JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", aiProfileIndex)
	JsonUtil.Save(CONFIG_PATH + "common")

	string pname = JsonUtil.GetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", "")
	if pname == ""
		GenerateDefaultProfile(aiProfileIndex)
	endif
	int val = LoadSettingFromProfile(aiProfileIndex, "animation")
	if val != -1
		_Frost_Setting_Animation.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "1P_animation_allowed")
	if val != -1
		_Frost_Setting_1PAnimationAllowed.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "condition_messages")
	if val != -1
		_Frost_Setting_ConditionMessages.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "display_attributes_in_weathersense")
	if val != -1
		_Frost_Setting_DisplayAttributesInWeathersense.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "exposure_pause_combat")
	if val != -1
		_Frost_Setting_ExposurePauseCombat.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "exposure_pause_dialogue")
	if val != -1
		_Frost_Setting_ExposurePauseDialogue.SetValueInt(val)
	endif
	float fval = LoadSettingFromProfileFloat(aiProfileIndex, "exposure_rate")
	if fval != -1
		_Frost_Setting_ExposureRate.SetValue(fval)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "force_feedback")
	if val != -1
		_Frost_Setting_ForceFeedback.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "frost_shader_on")
	if val != -1
		_Frost_Setting_FrostShaderOn.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "full_screen_effects")
	if val != -1
		_Frost_Setting_FullScreenEffects.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "max_exposure_mode")
	if val != -1
		_Frost_Setting_MaxExposureMode.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "meter_display_mode")
	if val != -1
		_Frost_Setting_MeterDisplayMode.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "meter_display_time")
	if val != -1
		_Frost_Setting_MeterDisplayTime.SetValueInt(val)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "meter_opacity")
	if fval != -1
		_Frost_Setting_MeterOpacity.SetValue(fval)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "movement_penalty")
	if val != -1
		_Frost_Setting_MovementPenalty.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "no_fast_travel")
	if val != -1
		_Frost_Setting_NoFastTravel.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "no_waiting")
	if val != -1
		_Frost_Setting_NoWaiting.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "sound_effects")
	if val != -1
		_Frost_Setting_SoundEffects.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "weather_messages")
	if val != -1
		_Frost_Setting_WeatherMessages.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "weathersense_display_mode")
	if val != -1
		_Frost_Setting_WeathersenseDisplayMode.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "wet_shader_on")
	if val != -1
		_Frost_Setting_WetShaderOn.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "frigid_water_is_lethal")
	if val != -1
		_Frost_Setting_FrigidWaterIsLethal.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "vampire_mode")
	if val != -1
		_Frost_Setting_VampireMode.SetValueInt(val)
	endif

	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_weathersense")
	if val != -1 && val != 0
		RegisterForKey(val)
		_Frost_HotkeyWeathersense.SetValueInt(val)
		PlayerRef.RemoveSpell(_Frost_Weathersense_Spell)
	else
		UnregisterForKey(_Frost_HotkeyWeathersense.GetValueInt())
		_Frost_HotkeyWeathersense.SetValue(0)
		PlayerRef.AddSpell(_Frost_Weathersense_Spell, false)
	endif
endFunction

function GenerateDefaultProfile(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex
	JsonUtil.SetStringValue(profile_path, "profile_name", "Profile " + aiProfileIndex)

	JsonUtil.SetIntValue(profile_path, "animation", 2)
	JsonUtil.SetIntValue(profile_path, "1P_animation_allowed", 1)
	JsonUtil.SetIntValue(profile_path, "condition_messages", 2)
	JsonUtil.SetIntValue(profile_path, "display_attributes_in_weathersense", 1)
	JsonUtil.SetIntValue(profile_path, "exposure_pause_combat", 2)
	JsonUtil.SetIntValue(profile_path, "exposure_pause_dialogue", 2)
	JsonUtil.SetFloatValue(profile_path, "exposure_rate", 1.0)
	JsonUtil.SetIntValue(profile_path, "force_feedback", 2)
	JsonUtil.SetIntValue(profile_path, "frost_shader_on", 2)
	JsonUtil.SetIntValue(profile_path, "full_screen_effects", 2)
	JsonUtil.SetIntValue(profile_path, "max_exposure_mode", 2)
	JsonUtil.SetIntValue(profile_path, "meter_display_mode", 2)
	JsonUtil.SetIntValue(profile_path, "meter_display_time", 3)
	JsonUtil.SetFloatValue(profile_path, "meter_opacity", 100.0)
	JsonUtil.SetIntValue(profile_path, "movement_penalty", 2)
	JsonUtil.SetIntValue(profile_path, "no_fast_travel", 1)
	JsonUtil.SetIntValue(profile_path, "no_waiting", 1)
	JsonUtil.SetIntValue(profile_path, "sound_effects", 2)
	JsonUtil.SetIntValue(profile_path, "weather_messages", 2)
	JsonUtil.SetIntValue(profile_path, "weathersense_display_mode", 2)
	JsonUtil.SetIntValue(profile_path, "wet_shader_on", 2)
	JsonUtil.SetIntValue(profile_path, "frigid_water_is_lethal", 2)
	JsonUtil.SetIntValue(profile_path, "vampire_mode", 1)
	JsonUtil.SetIntValue(profile_path, "hotkey_weathersense", 0)

	JsonUtil.Save(profile_path)
endFunction

Event StartupAlmostDone()
	if CurrentPage == "$FrostfallOverviewPage" && Overview_InfoLine6_OID
		SetTextOptionValue(Overview_InfoLine6_OID, "$FrostfallGeneralExitMenuPrompt")
	endif
endEvent
Event BodyDatastoreUpdate(float progress)
	if CurrentPage == "$FrostfallOverviewPage" && Overview_InfoLine1_OID
		SetTextOptionValue(Overview_InfoLine1_OID, ((progress * 100.0) as int) + "%")
	endif
endEvent
Event HeadDatastoreUpdate(float progress)
	if CurrentPage == "$FrostfallOverviewPage" && Overview_InfoLine2_OID
		SetTextOptionValue(Overview_InfoLine2_OID, ((progress * 100.0) as int) + "%")
	endif
endEvent
Event HandsDatastoreUpdate(float progress)
	if CurrentPage == "$FrostfallOverviewPage" && Overview_InfoLine3_OID
		SetTextOptionValue(Overview_InfoLine3_OID, ((progress * 100.0) as int) + "%")
	endif
endEvent
Event FeetDatastoreUpdate(float progress)
	if CurrentPage == "$FrostfallOverviewPage" && Overview_InfoLine4_OID
		SetTextOptionValue(Overview_InfoLine4_OID, ((progress * 100.0) as int) + "%")
	endif
endEvent
Event CloakDatastoreUpdate(float progress)
	if CurrentPage == "$FrostfallOverviewPage" && Overview_InfoLine5_OID
		SetTextOptionValue(Overview_InfoLine5_OID, ((progress * 100.0) as int) + "%")
	endif
endEvent

function SendEvent_StartFrostfall()
    int handle = ModEvent.Create("Frost_StartFrostfall")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_StopFrostfall()
    int handle = ModEvent.Create("Frost_StopFrostfall")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function RegisterForKeysOnLoad()
	if _Frost_HotkeyWeathersense.GetValueInt() != 0
		RegisterForKey(_Frost_HotkeyWeathersense.GetValueInt())
	endIf
endFunction