Scriptname _Seed_SkyUIConfigPanelScript extends SKI_ConfigBase

import _CampInternal

string CONFIG_PATH = "../LastSeedData/"

; External scripts
_Seed_Compatibility property Compatibility auto

GlobalVariable property LastSeedRunning auto
GlobalVariable property _Seed_Setting_DiminishingFoodReturns auto
GlobalVariable property _Seed_Setting_DisplayTutorials auto
GlobalVariable property _Seed_Setting_NeedsAffectsRegeneration auto
GlobalVariable property _Seed_Setting_NeedsForceFeedback auto
GlobalVariable property _Seed_Setting_NeedsSFX auto
GlobalVariable property _Seed_Setting_NeedsVFX auto
GlobalVariable property _Seed_Setting_Notifications auto
GlobalVariable property _Seed_Setting_SystemEnabled_Fatigue auto
GlobalVariable property _Seed_Setting_SystemEnabled_Hunger auto
GlobalVariable property _Seed_Setting_SystemEnabled_Thirst auto
GlobalVariable property _Seed_Setting_SystemEnabled_Vitality auto
GlobalVariable property _Seed_Setting_VampireBehavior auto
GlobalVariable property _Seed_Setting_Focus auto

GlobalVariable property _Seed_IsPlayerFocused auto

GlobalVariable property _Seed_Setting_CurrentProfile auto
GlobalVariable property _Seed_Setting_AutoSaveLoad auto

GlobalVariable property _Seed_HelpDone_Focus auto
GlobalVariable property _Seed_HelpDone_Variety auto

bool must_exit = false

string[] ProfileList

int Help_SettingEnableTutorials_OID
int Help_ResetTutorials_OID

int Advanced_ProvisioningSkillRespec_OID
int Advanced_ProvisioningSkillRestore_OID
int Advanced_ProvisioningSkillRestoreSlider_OID

int SaveLoad_SelectProfile_OID
int SaveLoad_RenameProfile_OID
int SaveLoad_DefaultProfile_OID
int SaveLoad_ProfileHelp_OID
int SaveLoad_Enable_OID

int Overview_RunStatusText_OID
int Overview_HungerStatusText_OID
int Overview_ThirstStatusText_OID
int Overview_FatigueStatusText_OID
int Overview_VitalityStatusText_OID
int Gameplay_VitalityEnabled_OID
int Gameplay_VitalityRate_OID
int Gameplay_HungerEnabled_OID
int Gameplay_HungerRate_OID
int Gameplay_ThirstEnabled_OID
int Gameplay_ThirstRate_OID
int Gameplay_FatigueEnabled_OID
int Gameplay_FatigueRate_OID
int Gameplay_NoVitalityMode_OID
int Gameplay_FocusEnabled_OID
int Gameplay_NeedsPauseDialogue_OID
int Gameplay_MovementPenalty_OID
int Gameplay_VampirismMode_OID
int Interface_SoundEffects_OID
int Interface_FullScreenEffects_OID
int Interface_ForceFeedback_OID
int Interface_Animation_OID
int Interface_FollowerAnimation_OID
int Interface_ConditionMessages_OID
int Meters_UIMeterDisplay_OID
int Meters_UIMeterLayout_OID
int Meters_UIMeterOpacity_OID
int Meters_UIMeterDisplayTime_OID
int Meters_UIMeterFillDirection_OID
int Meters_UIMeterScale_OID
int Meters_UIMeterFlipped_OID
int Meters_UIMeterColor_OID
int Meters_UIMeterXPos_OID
int Meters_UIMeterYPos_OID
int Meters_UIMeterHAnchor_OID
int Meters_UIMeterVAnchor_OID

Event OnConfigInit()
	Pages = new string[7]
	Pages[0] = "$LastSeedOverviewPage"
	Pages[1] = "$LastSeedGameplayPage"
	Pages[2] = "$LastSeedInterfacePage"
	Pages[3] = "$LastSeedMetersPage"
	Pages[4] = "$LastSeedAdvancedPage"
	Pages[5] = "$LastSeedHelpPage"
	Pages[6] = "$LastSeedSaveLoadPage"
endEvent

int function GetVersion()
	return 1
endFunction

Event OnVersionUpdate(int a_version)
	; pass
EndEvent

function PageReset_Overview()

endFunction

function PageReset_Gameplay()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if LastSeedRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$LastSeedNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

	AddHeaderOption("$LastSeedGameplayHeaderGeneral")
	if _Seed_Setting_Focus.GetValueInt() == 2
		Gameplay_FocusEnabled_OID = AddToggleOption("$LastSeedGameplaySettingFocusEnable", true)
	else
		Gameplay_FocusEnabled_OID = AddToggleOption("$LastSeedGameplaySettingFocusEnable", false)
	endif
	AddToggleOption("$LastSeedGameplaySettingNeedsDialoguePause", false, OPTION_FLAG_DISABLED)
	AddMenuOption("$LastSeedGameplaySettingPlayerVampirism", "Superhuman", OPTION_FLAG_DISABLED)
	AddToggleOption("$LastSeedGameplaySettingsFollowers", false, OPTION_FLAG_DISABLED)
	AddToggleOption("$LastSeedGameplaySettingSpoilageEnable", false, OPTION_FLAG_DISABLED)
	AddToggleOption("$LastSeedGameplaySettingPortioningEnable", false, OPTION_FLAG_DISABLED)
	AddEmptyOption()
	AddHeaderOption("$LastSeedGameplayHeaderVitality")
	AddToggleOption("$LastSeedGameplaySettingVitalityEnable", false, OPTION_FLAG_DISABLED)
	AddSliderOption("$LastSeedGameplaySettingVitalityRate", 1.0, "", OPTION_FLAG_DISABLED)
	AddMenuOption("$LastSeedGameplaySettingPlayerVitalityMode", "Nothing", OPTION_FLAG_DISABLED)
	
	SetCursorPosition(1)

	AddHeaderOption("$LastSeedGameplayHeaderHunger")
    if _Seed_Setting_SystemEnabled_Hunger.GetValueInt() == 2
	    Gameplay_HungerEnabled_OID = AddToggleOption("$LastSeedGameplaySettingHungerEnable", true)
	else
		Gameplay_HungerEnabled_OID = AddToggleOption("$LastSeedGameplaySettingHungerEnable", false)
	endif
	AddSliderOption("$LastSeedGameplaySettingHungerRate", 1.0, "", OPTION_FLAG_DISABLED)
	AddEmptyOption()
	AddHeaderOption("$LastSeedGameplayHeaderThirst")
	AddToggleOption("$LastSeedGameplaySettingThirstEnable", false, OPTION_FLAG_DISABLED)
	AddSliderOption("$LastSeedGameplaySettingThirstRate", 1.0, "", OPTION_FLAG_DISABLED)
	AddEmptyOption()
	AddHeaderOption("$LastSeedGameplayHeaderFatigue")
	AddToggleOption("$LastSeedGameplaySettingFatigueEnable", false, OPTION_FLAG_DISABLED)
	AddSliderOption("$LastSeedGameplaySettingFatigueRate", 1.0, "", OPTION_FLAG_DISABLED)
	AddToggleOption("$LastSeedGameplaySettingPlayerMovement", true, OPTION_FLAG_DISABLED)
endFunction

function PageReset_Interface()

endFunction

function PageReset_Meters()

endFunction

function PageReset_Advanced()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$LastSeedAdvancedHeaderProvisioningSkill")
	Advanced_ProvisioningSkillRespec_OID = AddTextOption("$LastSeedAdvancedProvisioningSkillRespec", "", OPTION_FLAG_DISABLED)
	Advanced_ProvisioningSkillRestore_OID = AddToggleOption("$LastSeedAdvancedProvisioningSkillRestore", false, OPTION_FLAG_DISABLED)
	Advanced_ProvisioningSkillRestoreSlider_OID = AddSliderOption("$LastSeedAdvancedProvisioningSkillRestoreAmount", 0, "{0}", OPTION_FLAG_DISABLED)
endFunction

function PageReset_SaveLoad()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if LastSeedRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$LastSeedNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

	AddHeaderOption("$LastSeedSaveLoadHeaderProfile")
	if _Seed_Setting_AutoSaveLoad.GetValueInt() == 2
		SaveLoad_SelectProfile_OID = AddMenuOption("$LastSeedSaveLoadCurrentProfile", GetProfileName(_Seed_Setting_CurrentProfile.GetValueInt()))
	else
		SaveLoad_SelectProfile_OID = AddMenuOption("$LastSeedSaveLoadCurrentProfile", GetProfileName(_Seed_Setting_CurrentProfile.GetValueInt()), OPTION_FLAG_DISABLED)
	endif
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	SaveLoad_ProfileHelp_OID = AddTextOption("$LastSeedSaveLoadAboutProfiles", "")
	if _Seed_Setting_AutoSaveLoad.GetValueInt() == 2
		SaveLoad_Enable_OID = AddToggleOption("$LastSeedSaveLoadEnable", true)
	else
		SaveLoad_Enable_OID = AddToggleOption("$LastSeedSaveLoadEnable", false)
	endif

	SetCursorPosition(1) ; Move cursor to top right position

	AddEmptyOption()
	if _Seed_Setting_AutoSaveLoad.GetValueInt() == 2
		SKI_Main skyui = Game.GetFormFromFile(0x00000814, "SkyUI.esp") as SKI_Main
		int version = skyui.ReqSWFRelease
		if version >= 1026 	; SkyUI 5.1+
			SaveLoad_RenameProfile_OID = AddInputOption("", "$LastSeedSaveLoadRenameProfile")
		else
			SaveLoad_RenameProfile_OID = AddTextOption("$LastSeedSkyUI51Required", "$LastSeedSaveLoadRenameProfile", OPTION_FLAG_DISABLED)
		endif
		SaveLoad_DefaultProfile_OID = AddTextOption("", "$LastSeedSaveLoadDefaultProfile")
	endif
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	if _Seed_Setting_AutoSaveLoad.GetValueInt() == 2
		AddTextOption("$LastSeedSaveLoadSettingsSaved", "", OPTION_FLAG_DISABLED)
	endif
endFunction

function PageReset_Help()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$LastSeedHelpHeaderTutorials")
	if _Seed_Setting_DisplayTutorials.GetValueInt() == 2
		Help_SettingEnableTutorials_OID = AddToggleOption("$LastSeedHelpEnableTutorials", true)
	else
		Help_SettingEnableTutorials_OID = AddToggleOption("$LastSeedHelpEnableTutorials", false)
	endif
	Help_ResetTutorials_OID = AddTextOption("", "$LastSeedHelpResetTutorials")
endFunction

event OnPageReset(string page)
	if page == ""
		LoadCustomContent("lastseed/logo.dds")
	else
		UnloadCustomContent()
	endif

	if page == "$LastSeedOverviewPage"
		PageReset_Overview()
	elseif page == "$LastSeedGameplayPage"
		PageReset_Gameplay()
	elseif page == "$LastSeedInterfacePage"
		PageReset_Interface()
	elseif page == "$LastSeedMetersPage"
		PageReset_Meters()
	elseif page == "$LastSeedAdvancedPage"
		PageReset_Advanced()
	elseif page == "$LastSeedHelpPage"
		PageReset_Help()
	elseif page == "$LastSeedSaveLoadPage"
		PageReset_SaveLoad()
	
	endif
endEvent

event OnOptionHighlight(int option)
	if option == Overview_RunStatusText_OID
		SetInfoText("$LastSeedOptionHighlightRunStatus")
	elseif option == Overview_HungerStatusText_OID
		SetInfoText("$LastSeedOptionHighlightAttributeHunger")
	elseif option == Overview_ThirstStatusText_OID
		SetInfoText("$LastSeedOptionHighlightAttributeThirst")
	elseif option == Overview_FatigueStatusText_OID
		SetInfoText("$LastSeedOptionHighlightAttributeFatigue")
	elseif option == Overview_VitalityStatusText_OID
		SetInfoText("$LastSeedOptionHighlightAttributeVitality")
	elseif option == Gameplay_HungerRate_OID
		SetInfoText("$LastSeedOptionHighlightSettingHungerRateSlider")
	elseif option == Gameplay_NoVitalityMode_OID
		SetInfoText("$LastSeedOptionHighlightSettingNoVitality")
	elseif option == Gameplay_NeedsPauseDialogue_OID
		SetInfoText("$LastSeedOptionHighlightSettingNeedsDialogueText")
	elseif option == Gameplay_MovementPenalty_OID
		SetInfoText("$LastSeedOptionHighlightSettingMovementText")
	elseif option == Gameplay_VampirismMode_OID
		SetInfoText("$LastSeedOptionHighlightSettingVampirism")
	elseif option == SaveLoad_SelectProfile_OID
		SetInfoText("$LastSeedOptionHighlightSettingSelectProfile")
	elseif option == SaveLoad_RenameProfile_OID
		SetInfoText("$LastSeedOptionHighlightSettingRenameProfile")
	elseif option == SaveLoad_DefaultProfile_OID
		SetInfoText("$LastSeedOptionHighlightSettingDefaultProfile")
	elseif option == SaveLoad_Enable_OID
		SetInfoText("$LastSeedOptionHighlightSettingEnableSaveLoad")
	elseif option == Interface_SoundEffects_OID
		SetInfoText("$LastSeedOptionHighlightSoundEffects")
	elseif option == Interface_FullScreenEffects_OID
		SetInfoText("$LastSeedOptionHighlightSettingFullScreenEffectsToggle")
	elseif option == Interface_ForceFeedback_OID
		SetInfoText("$LastSeedOptionHighlightForceFeedback")
	elseif option == Interface_Animation_OID
		SetInfoText("$LastSeedOptionHighlightAnimation")
	elseif option == Interface_FollowerAnimation_OID
		SetInfoText("$LastSeedOptionHighlightFollowerAnimation")
	elseif option == Interface_ConditionMessages_OID
		SetInfoText("$LastSeedOptionHighlightSettingConditionMsgToggle")
	elseif option == Advanced_ProvisioningSkillRespec_OID
		SetInfoText("$LastSeedOptionHighlightSettingRespec")
	elseif option == Advanced_ProvisioningSkillRestore_OID
		SetInfoText("$LastSeedOptionHighlightSettingRestore")
	elseif option == Meters_UIMeterDisplay_OID
		SetInfoText("$LastSeedOptionHightlightUIMeterDisplay")
	elseif option == Meters_UIMeterLayout_OID
		SetInfoText("$LastSeedMeterLayoutHighlight")
	elseif option == Meters_UIMeterOpacity_OID
		SetInfoText("$LastSeedMeterOpacityHighlight")
	elseif option == Meters_UIMeterDisplayTime_OID
		SetInfoText("$LastSeedOptionHightlightUIMeterDisplayTime")
	elseif option == Meters_UIMeterFillDirection_OID
		SetInfoText("$LastSeedMeterFillDirectionHighlight")
	elseif option == Meters_UIMeterScale_OID
		SetInfoText("$LastSeedMeterScaleHighlight")
	elseif option == Meters_UIMeterFlipped_OID
		SetInfoText("$LastSeedMeterFlippedHighlight")
	elseif option == Meters_UIMeterColor_OID
		SetInfoText("$LastSeedMeterColorHighlight")
	elseif option == Meters_UIMeterXPos_OID
		SetInfoText("$LastSeedMeterXPosHighlight")
	elseif option == Meters_UIMeterYPos_OID
		SetInfoText("$LastSeedMeterYPosHighlight")
	elseif option == Meters_UIMeterHAnchor_OID
		SetInfoText("$LastSeedMeterHAnchorHighlight")
	elseif option == Meters_UIMeterVAnchor_OID
		SetInfoText("$LastSeedMeterVAnchorHighlight")
	endif
endEvent

event OnOptionSelect(int option)
	if Gameplay_FocusEnabled_OID
		if _Seed_Setting_Focus.GetValueInt() == 2
			_Seed_Setting_Focus.SetValueInt(1)
			_Seed_IsPlayerFocused.SetValueInt(1)
			SetToggleOptionValue(Gameplay_FocusEnabled_OID, false)
		else
			_Seed_Setting_Focus.SetValueInt(2)
			SetToggleOptionValue(Gameplay_FocusEnabled_OID, true)
		endif
		SaveSettingToCurrentProfile("focus_enabled", _Seed_Setting_Focus.GetValueInt())
	elseif Gameplay_HungerEnabled_OID
		; also toggle system on / off
		OnOptionSelectAction(_Seed_Setting_SystemEnabled_Hunger, Gameplay_HungerEnabled_OID, "hunger_enabled")
	endif
endEvent

function OnOptionSelectAction(GlobalVariable akSettingsGlobal, int aiOID, string asProfileSetting)
	if akSettingsGlobal.GetValueInt() == 2
		akSettingsGlobal.SetValueInt(1)
		SetToggleOptionValue(aiOID, false)
	else
		akSettingsGlobal.SetValueInt(2)
		SetToggleOptionValue(aiOID, true)
	endif
	SaveSettingToCurrentProfile(asProfileSetting, akSettingsGlobal.GetValueInt())
endFunction

event OnOptionDefault(int option)
	
endEvent

event OnOptionMenuOpen(int option)
	if option == SaveLoad_SelectProfile_OID
		string[] profile_list = new string[10]
		int i = 0
		while i < 10
			string pname = GetProfileName(i + 1)
			profile_list[i] = pname
			i += 1
		endWhile
		SetMenuDialogOptions(profile_list)
		SetMenuDialogStartIndex(_Seed_Setting_CurrentProfile.GetValueInt() - 1)
		SetMenuDialogDefaultIndex(0)
	endif
endEvent

event OnOptionMenuAccept(int option, int index)
	if option == SaveLoad_SelectProfile_OID
		bool b = ShowMessage("$LastSeedSaveLoadConfirm")
		if b
			SwitchToProfile(index + 1)
		endif
	endif
endEvent

event OnOptionSliderOpen(int option)

endEvent

event OnOptionSliderAccept(int option, float value)

endEvent

event OnOptionInputOpen(int option)
	if option == SaveLoad_RenameProfile_OID
		SetInputDialogStartText(GetProfileName(_Seed_Setting_CurrentProfile.GetValueInt()))
	endif
endEvent

event OnOptionInputAccept(int option, string str)
	if option == SaveLoad_RenameProfile_OID
		if str != ""
			string profile_path = CONFIG_PATH + "profile" + _Seed_Setting_CurrentProfile.GetValueInt()
			JsonUtil.SetStringValue(profile_path, "profile_name", str)
			JsonUtil.Save(profile_path)
			ForcePageReset()
		else
			ShowMessage("$LastSeedSaveLoadRenameErrorBlank", false)
		endif
	endif
endEvent

event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)

endEvent

bool function RemapHotkey(int option, int keyCode, string conflictControl, string conflictName, GlobalVariable akHotkeyGlobal, Spell akHotkeySpell)

endFunction

Event OnKeyDown(int KeyCode)

endEvent
	
string function GetCustomControl(int keyCode)

endFunction

; @TODO: Don't duplicate registration with LoadProfileOnStartup()
function RegisterForKeysOnLoad()

endFunction

string function GetProfileName(int aiProfileIndex)
	return JsonUtil.GetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", missing = "Profile " + aiProfileIndex)
endFunction

function SetProfileName(int aiProfileIndex, string asProfileName)
	JsonUtil.SetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", asProfileName)
endFunction

function SaveSettingToCurrentProfile(string asKeyName, int aiValue)
	if _Seed_Setting_AutoSaveLoad.GetValueInt() == 2
		int current_profile_index = _Seed_Setting_CurrentProfile.GetValueInt()
		JsonUtil.SetIntValue(CONFIG_PATH + "profile" + current_profile_index, asKeyName, aiValue)
		JsonUtil.Save(CONFIG_PATH + "profile" + current_profile_index)
	endif
endFunction

int function LoadSettingFromProfile(int aiProfileIndex, string asKeyName)
	return JsonUtil.GetIntValue(CONFIG_PATH + "profile" + aiProfileIndex, asKeyName, -1)
endFunction

function LoadProfileOnStartup()
	int auto_load = JsonUtil.GetIntValue(CONFIG_PATH + "common", "auto_load", 0)
	if auto_load == 2
		_Seed_Setting_AutoSaveLoad.SetValueInt(2)
		int last_profile = JsonUtil.GetIntValue(CONFIG_PATH + "common", "last_profile", 0)
		if last_profile != 0
			_Seed_Setting_CurrentProfile.SetValueInt(last_profile)
			SwitchToProfile(last_profile)
		else
			; default to Profile 1 and write the file
			_Seed_Setting_CurrentProfile.SetValueInt(1)
			JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", 1)
			JsonUtil.Save(CONFIG_PATH + "common")
			SwitchToProfile(1)
		endif
	elseif auto_load == 1
		_Seed_Setting_AutoSaveLoad.SetValueInt(1)
	elseif auto_load == 0
		; The file or setting does not exist, create it and default to auto-loading.
		; default to Profile 1 and write the file
		_Seed_Setting_AutoSaveLoad.SetValueInt(2)
		_Seed_Setting_CurrentProfile.SetValueInt(1)
		JsonUtil.SetIntValue(CONFIG_PATH + "common", "auto_load", 2)
		JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", 1)
		JsonUtil.Save(CONFIG_PATH + "common")
		SwitchToProfile(1)
	endif
endFunction

function SwitchToProfile(int aiProfileIndex)
	_Seed_Setting_CurrentProfile.SetValueInt(aiProfileIndex)
	JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", aiProfileIndex)
	JsonUtil.Save(CONFIG_PATH + "common")

	string pname = JsonUtil.GetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", "")
	if pname == ""
		GenerateDefaultProfile(aiProfileIndex)
	endif
	CleanProfile(aiProfileIndex)

	; @TODO: Initialize settings
endFunction

function GenerateDefaultProfile(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex
	JsonUtil.SetStringValue(profile_path, "profile_name", "Profile " + aiProfileIndex)
	; @TODO: Initialize settings
	JsonUtil.Save(profile_path)
endFunction

function SaveAllSettings(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex
	; @TODO: Save settings
	JsonUtil.Save(profile_path)
endFunction

function CleanProfile(int aiProfileIndex)

endFunction

function ResetTutorials()
	_Seed_HelpDone_Focus.SetValueInt(1)
	_Seed_HelpDone_Variety.SetValueInt(1)
endFunction
