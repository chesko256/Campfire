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

GlobalVariable property _Seed_Setting_MeterVitalityFillDirection auto
GlobalVariable property _Seed_Setting_MeterVitalityHAnchor auto
GlobalVariable property _Seed_Setting_MeterVitalityVAnchor auto
GlobalVariable property _Seed_Setting_MeterVitalityXPos auto
GlobalVariable property _Seed_Setting_MeterVitalityYPos auto
GlobalVariable property _Seed_Setting_MeterVitalityHeight auto
GlobalVariable property _Seed_Setting_MeterVitalityWidth auto

GlobalVariable property _Seed_Setting_MeterHungerFillDirection auto
GlobalVariable property _Seed_Setting_MeterHungerHAnchor auto
GlobalVariable property _Seed_Setting_MeterHungerVAnchor auto
GlobalVariable property _Seed_Setting_MeterHungerXPos auto
GlobalVariable property _Seed_Setting_MeterHungerYPos auto
GlobalVariable property _Seed_Setting_MeterHungerHeight auto
GlobalVariable property _Seed_Setting_MeterHungerWidth auto

GlobalVariable property _Seed_IsPlayerFocused auto

GlobalVariable property _Seed_Setting_CurrentProfile auto
GlobalVariable property _Seed_Setting_AutoSaveLoad auto

GlobalVariable property _Seed_HelpDone_Focus auto
GlobalVariable property _Seed_HelpDone_Variety auto

_Seed_Meter property VitalityMeter auto
_Seed_Meter property HungerMeter auto
_Seed_VitalityMeterInterfaceHandler property VitalityMeterHandler auto
_Seed_HungerMeterInterfaceHandler property HungerMeterHandler auto

bool must_exit = false
bool config_is_open = false

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

	FILL_DIRECTIONS = new string[3]
	FILL_DIRECTIONS[0] = "Left"
	FILL_DIRECTIONS[1] = "Right"
	FILL_DIRECTIONS[2] = "Both"

	HORIZONTAL_ANCHORS = new string[3]
	HORIZONTAL_ANCHORS[0] = "Left"
	HORIZONTAL_ANCHORS[1] = "Right"
	HORIZONTAL_ANCHORS[2] = "Center"

	VERTICAL_ANCHORS = new string[3]
	VERTICAL_ANCHORS[0] = "Top"
	VERTICAL_ANCHORS[1] = "Bottom"
	VERTICAL_ANCHORS[2] = "Center"
endEvent

Event OnConfigOpen()
	config_is_open = true
EndEvent

Event OnConfigClose()
	UnregisterForAllModEvents()
	meter_being_configured = METER_BEING_CONFIGURED_NONE
	config_is_open = false
EndEvent

int function GetVersion()
	return 1
endFunction

Event OnVersionUpdate(int a_version)
	; pass
EndEvent

function PageReset_Overview()
	AddTextOption("Coming soon.", "", OPTION_FLAG_DISABLED)
endFunction

function PageReset_Gameplay()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if LastSeedRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$LastSeedNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

	AddHeaderOption("$LastSeedGameplayHeaderGeneral")
	if _Seed_Setting_Focus.GetValueInt() == 2
		Gameplay_FocusEnabled_OID = AddToggleOption("$LastSeedGameplaySettingFocusEnable", true, OPTION_FLAG_DISABLED)
	else
		Gameplay_FocusEnabled_OID = AddToggleOption("$LastSeedGameplaySettingFocusEnable", false, OPTION_FLAG_DISABLED)
	endif
	AddToggleOption("$LastSeedGameplaySettingNeedsDialoguePause", false, OPTION_FLAG_DISABLED)
	AddMenuOption("$LastSeedGameplaySettingPlayerVampirism", "Mortal", OPTION_FLAG_DISABLED)
	AddToggleOption("$LastSeedGameplaySettingsFollowers", false, OPTION_FLAG_DISABLED)
	AddToggleOption("$LastSeedGameplaySettingSpoilageEnable", true, OPTION_FLAG_DISABLED)
	AddToggleOption("$LastSeedGameplaySettingPortioningEnable", false, OPTION_FLAG_DISABLED)
	AddEmptyOption()
	AddHeaderOption("$LastSeedGameplayHeaderVitality")
	AddToggleOption("$LastSeedGameplaySettingVitalityEnable", true, OPTION_FLAG_DISABLED)
	AddSliderOption("$LastSeedGameplaySettingVitalityRate", 1.0, "", OPTION_FLAG_DISABLED)
	AddMenuOption("$LastSeedGameplaySettingPlayerVitalityMode", "Death", OPTION_FLAG_DISABLED)
	
	SetCursorPosition(1)

	AddHeaderOption("$LastSeedGameplayHeaderHunger")
    if _Seed_Setting_SystemEnabled_Hunger.GetValueInt() == 2
	    Gameplay_HungerEnabled_OID = AddToggleOption("$LastSeedGameplaySettingHungerEnable", true, OPTION_FLAG_DISABLED)
	else
		Gameplay_HungerEnabled_OID = AddToggleOption("$LastSeedGameplaySettingHungerEnable", false, OPTION_FLAG_DISABLED)
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
	AddToggleOption("$LastSeedGameplaySettingPlayerMovement", false, OPTION_FLAG_DISABLED)
endFunction

function PageReset_Interface()
	AddTextOption("Coming soon.", "", OPTION_FLAG_DISABLED)
endFunction

function PageReset_Meters()
	AddTextOption("Coming soon.", "", OPTION_FLAG_DISABLED)
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
		;@REENABLE
		SaveLoad_SelectProfile_OID = AddMenuOption("$LastSeedSaveLoadCurrentProfile", GetProfileName(_Seed_Setting_CurrentProfile.GetValueInt()), OPTION_FLAG_DISABLED)
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
	;@REENABLE
	SaveLoad_ProfileHelp_OID = AddTextOption("$LastSeedSaveLoadAboutProfiles", "", OPTION_FLAG_DISABLED)
	if _Seed_Setting_AutoSaveLoad.GetValueInt() == 2
		;@REENABLE
		SaveLoad_Enable_OID = AddToggleOption("$LastSeedSaveLoadEnable", true, OPTION_FLAG_DISABLED)
	else
		;@REENABLE
		SaveLoad_Enable_OID = AddToggleOption("$LastSeedSaveLoadEnable", false, OPTION_FLAG_DISABLED)
	endif

	SetCursorPosition(1) ; Move cursor to top right position

	AddEmptyOption()
	if _Seed_Setting_AutoSaveLoad.GetValueInt() == 2
		SKI_Main skyui = Game.GetFormFromFile(0x00000814, "SkyUI.esp") as SKI_Main
		int version = skyui.ReqSWFRelease
		if version >= 1026 	; SkyUI 5.1+
			;@REENABLE
			SaveLoad_RenameProfile_OID = AddInputOption("", "$LastSeedSaveLoadRenameProfile", OPTION_FLAG_DISABLED)
		else
			SaveLoad_RenameProfile_OID = AddTextOption("$LastSeedSkyUI51Required", "$LastSeedSaveLoadRenameProfile", OPTION_FLAG_DISABLED)
		endif
		;@REENABLE
		SaveLoad_DefaultProfile_OID = AddTextOption("", "$LastSeedSaveLoadDefaultProfile", OPTION_FLAG_DISABLED)
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
	AddTextOption("Coming soon.", "", OPTION_FLAG_DISABLED)
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


; Meters ======================================================================

string[] FILL_DIRECTIONS
string[] HORIZONTAL_ANCHORS
string[] VERTICAL_ANCHORS

float NORMAL_METER_WIDTH = 292.8
float NORMAL_METER_HEIGHT = 25.2

float CHARGE_METER_WIDTH = 292.0
float CHARGE_METER_HEIGHT = 22.0
float CHARGE_METER_HEIGHT_INV = -22.0

int VITALITY_METER_BOTTOMLEFT_HANCHOR = 0 		; HANCHOR_LEFT
int VITALITY_METER_BOTTOMLEFT_VANCHOR = 1 		; VANCHOR_BOTTOM
int VITALITY_METER_BOTTOMLEFT_FILLDIR = 1 		; FILLDIR_RIGHT
int VITALITY_METER_BOTTOMRIGHT_HANCHOR = 1		; HANCHOR_RIGHT
int VITALITY_METER_BOTTOMRIGHT_VANCHOR = 1 		; VANCHOR_BOTTOM
int VITALITY_METER_BOTTOMRIGHT_FILLDIR = 0		; FILLDIR_LEFT
int VITALITY_METER_TOPLEFT_HANCHOR = 0 			; HANCHOR_LEFT
int VITALITY_METER_TOPLEFT_VANCHOR = 0 			; VANCHOR_TOP
int VITALITY_METER_TOPLEFT_FILLDIR = 1 			; FILLDIR_RIGHT
int VITALITY_METER_TOPRIGHT_HANCHOR = 1			; HANCHOR_RIGHT
int VITALITY_METER_TOPRIGHT_VANCHOR = 0 		; VANCHOR_TOP
int VITALITY_METER_TOPRIGHT_FILLDIR = 0			; FILLDIR_LEFT

int HUNGER_METER_BOTTOMLEFT_HANCHOR = 2 		; HANCHOR_CENTER
int HUNGER_METER_BOTTOMLEFT_VANCHOR = 1 		; VANCHOR_BOTTOM
int HUNGER_METER_BOTTOMLEFT_FILLDIR = 2 		; FILLDIR_BOTH
int HUNGER_METER_BOTTOMRIGHT_HANCHOR = 2		; HANCHOR_CENTER
int HUNGER_METER_BOTTOMRIGHT_VANCHOR = 1 		; VANCHOR_BOTTOM
int HUNGER_METER_BOTTOMRIGHT_FILLDIR = 2		; FILLDIRBOTH
int HUNGER_METER_TOPLEFT_HANCHOR = 2 			; HANCHOR_CENTER
int HUNGER_METER_TOPLEFT_VANCHOR = 1 			; VANCHOR_BOTTOM
int HUNGER_METER_TOPLEFT_FILLDIR = 2 			; FILLDIR_BOTH
int HUNGER_METER_TOPRIGHT_HANCHOR = 2			; HANCHOR_CENTER
int HUNGER_METER_TOPRIGHT_VANCHOR = 1 			; VANCHOR_BOTTOM
int HUNGER_METER_TOPRIGHT_FILLDIR = 2			; FILLDIRBOTH

float VITALITY_METER_BOTTOMLEFT_16_9_X = 69.2
float VITALITY_METER_BOTTOMLEFT_16_9_Y = 618.0
float VITALITY_METER_BOTTOMRIGHT_16_9_X = 1211.0
float VITALITY_METER_BOTTOMRIGHT_16_9_Y = 618.0
float VITALITY_METER_TOPLEFT_16_9_X = 69.2
float VITALITY_METER_TOPLEFT_16_9_Y = 113.0
float VITALITY_METER_TOPRIGHT_16_9_X = 1211.0
float VITALITY_METER_TOPRIGHT_16_9_Y = 113.0

float HUNGER_METER_BOTTOMLEFT_16_9_X = 916.75
float HUNGER_METER_BOTTOMLEFT_16_9_Y = 717.5
float HUNGER_METER_BOTTOMRIGHT_16_9_X = 916.75
float HUNGER_METER_BOTTOMRIGHT_16_9_Y = 717.5
float HUNGER_METER_TOPLEFT_16_9_X = 916.75
float HUNGER_METER_TOPLEFT_16_9_Y = 717.5
float HUNGER_METER_TOPRIGHT_16_9_X = 916.75
float HUNGER_METER_TOPRIGHT_16_9_Y = 717.5

float VITALITY_METER_BOTTOMLEFT_16_10_X = 64.2
float VITALITY_METER_BOTTOMLEFT_16_10_Y = 628.0
float VITALITY_METER_BOTTOMRIGHT_16_10_X = 1216.0
float VITALITY_METER_BOTTOMRIGHT_16_10_Y = 628.0
float VITALITY_METER_TOPLEFT_16_10_X = 64.2
float VITALITY_METER_TOPLEFT_16_10_Y = 113.0
float VITALITY_METER_TOPRIGHT_16_10_X = 1216.0
float VITALITY_METER_TOPRIGHT_16_10_Y = 113.0

float HUNGER_METER_BOTTOMLEFT_16_10_X = 916.75
float HUNGER_METER_BOTTOMLEFT_16_10_Y = 717.5
float HUNGER_METER_BOTTOMRIGHT_16_10_X = 916.75
float HUNGER_METER_BOTTOMRIGHT_16_10_Y = 717.5
float HUNGER_METER_TOPLEFT_16_10_X = 916.75
float HUNGER_METER_TOPLEFT_16_10_Y = 717.5
float HUNGER_METER_TOPRIGHT_16_10_X = 916.75
float HUNGER_METER_TOPRIGHT_16_10_Y = 717.5

float VITALITY_METER_BOTTOMLEFT_4_3_X = 69.2
float VITALITY_METER_BOTTOMLEFT_4_3_Y = 645.0
float VITALITY_METER_BOTTOMRIGHT_4_3_X = 1218.0
float VITALITY_METER_BOTTOMRIGHT_4_3_Y = 645.0
float VITALITY_METER_TOPLEFT_4_3_X = 65.2
float VITALITY_METER_TOPLEFT_4_3_Y = 113.0
float VITALITY_METER_TOPRIGHT_4_3_X = 1218.0
float VITALITY_METER_TOPRIGHT_4_3_Y = 113.0

float HUNGER_METER_BOTTOMLEFT_4_3_X = 916.75
float HUNGER_METER_BOTTOMLEFT_4_3_Y = 717.5
float HUNGER_METER_BOTTOMRIGHT_4_3_X = 916.75
float HUNGER_METER_BOTTOMRIGHT_4_3_Y = 717.5
float HUNGER_METER_TOPLEFT_4_3_X = 916.75
float HUNGER_METER_TOPLEFT_4_3_Y = 717.5
float HUNGER_METER_TOPRIGHT_4_3_X = 916.75
float HUNGER_METER_TOPRIGHT_4_3_Y = 717.5

int meter_being_configured = 0
int METER_BEING_CONFIGURED_NONE = 0
int METER_BEING_CONFIGURED_VITALITY = 1
int METER_BEING_CONFIGURED_HUNGER = 2
int METER_BEING_CONFIGURED_THIRST = 3
int METER_BEING_CONFIGURED_FATIGUE = 4

function ApplyMeterPreset(int aiPresetIdx)
	int w = Utility.GetINIInt("iSize W:Display")
	int h = Utility.GetINIInt("iSize H:Display")
	float ratio = (w as float)/(h as float)
	debug.trace("[LastSeed] Detected display resolution " + w + "x" + h + " (" + ratio + " aspect ratio).")
	if ratio > 1.7 && ratio < 1.8
		debug.trace("[LastSeed] Loading 16:9 aspect ratio meter preset.")
	elseif ratio == 1.6
		debug.trace("[LastSeed] Loading 16:10 aspect ratio meter preset.")
		aiPresetIdx += 4
	elseif ratio > 1.3 && ratio < 1.4
		debug.trace("[LastSeed] Loading 4:3 aspect ratio meter preset.")
		aiPresetIdx += 8
	else
		if config_is_open
			bool result = ShowMessage("$FrostfallMeterLayoutProblem")
			if result == false
				return
			endif
		else
			debug.trace("[LastSeed] The display aspect ratio wasn't supported. Defaulting to 16:9.")
		endif
	endif

	if aiPresetIdx == 0
		; 16:9 Bottom Left
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_BOTTOMLEFT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_BOTTOMLEFT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_BOTTOMLEFT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_BOTTOMLEFT_16_9_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_BOTTOMLEFT_16_9_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_BOTTOMLEFT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_BOTTOMLEFT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_BOTTOMLEFT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_BOTTOMLEFT_16_9_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_BOTTOMLEFT_16_9_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 1
		; 16:9 Bottom Right
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_BOTTOMRIGHT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_BOTTOMRIGHT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_BOTTOMRIGHT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_BOTTOMRIGHT_16_9_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_BOTTOMRIGHT_16_9_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_BOTTOMRIGHT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_BOTTOMRIGHT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_BOTTOMRIGHT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_BOTTOMRIGHT_16_9_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_BOTTOMRIGHT_16_9_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 2
		; 16:9 Top Left
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_TOPLEFT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_TOPLEFT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_TOPLEFT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_TOPLEFT_16_9_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_TOPLEFT_16_9_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_TOPLEFT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_TOPLEFT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_TOPLEFT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_TOPLEFT_16_9_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_TOPLEFT_16_9_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 3
		; 16:9 Top Right
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_TOPRIGHT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_TOPRIGHT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_TOPRIGHT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_TOPRIGHT_16_9_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_TOPRIGHT_16_9_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_TOPRIGHT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_TOPRIGHT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_TOPRIGHT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_TOPRIGHT_16_9_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_TOPRIGHT_16_9_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 4
		; 16:10 Bottom Left
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_BOTTOMLEFT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_BOTTOMLEFT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_BOTTOMLEFT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_BOTTOMLEFT_16_10_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_BOTTOMLEFT_16_10_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_BOTTOMLEFT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_BOTTOMLEFT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_BOTTOMLEFT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_BOTTOMLEFT_16_10_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_BOTTOMLEFT_16_10_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 5
		; 16:10 Bottom Right
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_BOTTOMRIGHT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_BOTTOMRIGHT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_BOTTOMRIGHT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_BOTTOMRIGHT_16_10_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_BOTTOMRIGHT_16_10_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_BOTTOMRIGHT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_BOTTOMRIGHT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_BOTTOMRIGHT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_BOTTOMRIGHT_16_10_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_BOTTOMRIGHT_16_10_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 6
		; 16:10 Top Left
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_TOPLEFT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_TOPLEFT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_TOPLEFT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_TOPLEFT_16_10_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_TOPLEFT_16_10_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_TOPLEFT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_TOPLEFT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_TOPLEFT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_TOPLEFT_16_10_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_TOPLEFT_16_10_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 7
		; 16:10 Top Right
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_TOPRIGHT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_TOPRIGHT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_TOPRIGHT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_TOPRIGHT_16_10_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_TOPRIGHT_16_10_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_TOPRIGHT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_TOPRIGHT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_TOPRIGHT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_TOPRIGHT_16_10_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_TOPRIGHT_16_10_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 8
		; 4:3 Bottom Left
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_BOTTOMLEFT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_BOTTOMLEFT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_BOTTOMLEFT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_BOTTOMLEFT_4_3_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_BOTTOMLEFT_4_3_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_BOTTOMLEFT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_BOTTOMLEFT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_BOTTOMLEFT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_BOTTOMLEFT_4_3_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_BOTTOMLEFT_4_3_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 9
		; 4:3 Bottom Right
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_BOTTOMRIGHT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_BOTTOMRIGHT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_BOTTOMRIGHT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_BOTTOMRIGHT_4_3_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_BOTTOMRIGHT_4_3_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_BOTTOMRIGHT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_BOTTOMRIGHT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_BOTTOMRIGHT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_BOTTOMRIGHT_4_3_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_BOTTOMRIGHT_4_3_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 10
		; 4:3 Top Left
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_TOPLEFT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_TOPLEFT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_TOPLEFT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_TOPLEFT_4_3_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_TOPLEFT_4_3_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_TOPLEFT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_TOPLEFT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_TOPLEFT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_TOPLEFT_4_3_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_TOPLEFT_4_3_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 11
		; 4:3 Top Right
		_Seed_Setting_MeterVitalityFillDirection.SetValueInt(VITALITY_METER_TOPRIGHT_FILLDIR)
		_Seed_Setting_MeterVitalityHAnchor.SetValueInt(VITALITY_METER_TOPRIGHT_HANCHOR)
		_Seed_Setting_MeterVitalityVAnchor.SetValueInt(VITALITY_METER_TOPRIGHT_VANCHOR)
		_Seed_Setting_MeterVitalityXPos.SetValue(VITALITY_METER_TOPRIGHT_4_3_X)
		_Seed_Setting_MeterVitalityYPos.SetValue(VITALITY_METER_TOPRIGHT_4_3_Y)
		_Seed_Setting_MeterVitalityHeight.SetValue(NORMAL_METER_HEIGHT)
		_Seed_Setting_MeterVitalityWidth.SetValue(NORMAL_METER_WIDTH)

		_Seed_Setting_MeterHungerFillDirection.SetValueInt(HUNGER_METER_TOPRIGHT_FILLDIR)
		_Seed_Setting_MeterHungerHAnchor.SetValueInt(HUNGER_METER_TOPRIGHT_HANCHOR)
		_Seed_Setting_MeterHungerVAnchor.SetValueInt(HUNGER_METER_TOPRIGHT_VANCHOR)
		_Seed_Setting_MeterHungerXPos.SetValue(HUNGER_METER_TOPRIGHT_4_3_X)
		_Seed_Setting_MeterHungerYPos.SetValue(HUNGER_METER_TOPRIGHT_4_3_Y)
		_Seed_Setting_MeterHungerHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Seed_Setting_MeterHungerWidth.SetValue(CHARGE_METER_WIDTH)
	endif

	UpdateMeterConfiguration(0)
	UpdateMeterConfiguration(1)
endFunction

function ConfigureMeter(int aiMeterIdx, int aiFillDirectionIdx, int aiHAnchorIdx, int aiVAnchorIdx, float afPositionX, float afPositionY, float afHeight, float afWidth)
	; Not configured: Color, Opacity
	Common_SKI_MeterWidget MyMeter = None
	CommonMeterInterfaceHandler MyMeterHandler = None
	if aiMeterIdx == 0
		MyMeter = VitalityMeter
		MyMeterHandler = VitalityMeterHandler
	elseif aiMeterIdx == 1
		MyMeter = HungerMeter
		MyMeterHandler = HungerMeterHandler
	endif

	if !MyMeter
		return
	endIf

	MyMeter.FillDirection = FILL_DIRECTIONS[aiFillDirectionIdx]
	MyMeter.HAnchor = HORIZONTAL_ANCHORS[aiHAnchorIdx]
	MyMeter.VAnchor = VERTICAL_ANCHORS[aiVAnchorIdx]
	MyMeter.X = afPositionX
	MyMeter.Y = afPositionY
	MyMeter.Height = afHeight
	MyMeter.Width = afWidth
	MyMeterHandler.ForceMeterDisplay()
endFunction

function UpdateMeterConfiguration(int aiMeterIdx)
	if aiMeterIdx == 0
		; Vitality
		ConfigureMeter(0, _Seed_Setting_MeterVitalityFillDirection.GetValueInt(), 	\
						  _Seed_Setting_MeterVitalityHAnchor.GetValueInt(),			\
						  _Seed_Setting_MeterVitalityVAnchor.GetValueInt(),			\
						  _Seed_Setting_MeterVitalityXPos.GetValue(),				\
						  _Seed_Setting_MeterVitalityYPos.GetValue(),				\
						  _Seed_Setting_MeterVitalityHeight.GetValue(),				\
						  _Seed_Setting_MeterVitalityWidth.GetValue())

	elseif aiMeterIdx == 1
		; Hunger
		ConfigureMeter(1, _Seed_Setting_MeterHungerFillDirection.GetValueInt(), 	\
						  _Seed_Setting_MeterHungerHAnchor.GetValueInt(),			\
						  _Seed_Setting_MeterHungerVAnchor.GetValueInt(),			\
						  _Seed_Setting_MeterHungerXPos.GetValue(),					\
						  _Seed_Setting_MeterHungerYPos.GetValue(),					\
						  _Seed_Setting_MeterHungerHeight.GetValue(),				\
						  _Seed_Setting_MeterHungerWidth.GetValue())
	endif
endFunction

function RemoveAllMeters()
	SendEvent_LastSeedRemoveVitalityMeter()
	SendEvent_LastSeedRemoveHungerMeter()
endFunction

function ForceAllMeters()
	SendEvent_ForceVitalityMeterDisplay()
	SendEvent_ForceHungerMeterDisplay()
endFunction

float function GetMeterScale(float afCurrentWidth, float afBaseWidth)
	return afCurrentWidth / afBaseWidth
endFunction

bool function IsMeterInverted(CommonMeterInterfaceHandler handler)
	if handler.meter_inversion_value != -1.0
		if handler.lower_is_better && handler.AttributeValue.GetValue() < handler.meter_inversion_value
			return true
		elseif !handler.lower_is_better && handler.AttributeValue.GetValue() > handler.meter_inversion_value
			return true
		else
			return false
		endif
	else
		return false
	endif
endFunction

function SendEvent_LastSeedRemoveVitalityMeter()
	int handle = ModEvent.Create("LastSeed_RemoveVitalityMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_LastSeedRemoveHungerMeter()
	int handle = ModEvent.Create("LastSeed_RemoveHungerMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_ForceVitalityMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("LastSeed_ForceVitalityMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_ForceHungerMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("LastSeed_ForceHungerMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction
