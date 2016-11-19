scriptname _Frost_SkyUIConfigPanelScript extends SKI_ConfigBase

import FrostUtil
import _FrostInternal
import CommonArrayHelper
import CommonHelperFunctions

string CONFIG_PATH = "../FrostfallData/"

Actor property PlayerRef auto

; External scripts
_Frost_Compatibility property Compatibility auto
_Frost_Main property FrostfallMain auto

GlobalVariable property _Frost_AttributeExposure auto
GlobalVariable property _Frost_AttributeWetness auto
GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_AttributeCoverage auto
GlobalVariable property _Frost_Calc_MaxWarmth auto
GlobalVariable property _Frost_Calc_MaxCoverage auto

GlobalVariable property StartFrostfall auto
GlobalVariable property FrostfallRunning auto
GlobalVariable property _Frost_Setting_Animation auto
GlobalVariable property _Frost_Setting_ConditionMessages auto
GlobalVariable property _Frost_Setting_DisplayAttributesInWeathersense auto
GlobalVariable property _Frost_Setting_DisplayAttributeValuesInWeathersense auto
GlobalVariable property _Frost_Setting_ExposurePauseCombat auto
GlobalVariable property _Frost_Setting_ExposurePauseDialogue auto
GlobalVariable property _Frost_Setting_ExposureRate auto
GlobalVariable property _Frost_Setting_ForceFeedback auto
GlobalVariable property _Frost_Setting_FrostShaderOn auto
GlobalVariable property _Frost_Setting_FullScreenEffects auto
GlobalVariable property _Frost_Setting_MaxExposureMode auto
GlobalVariable property _Frost_Setting_MeterDisplayMode auto
GlobalVariable property _Frost_Setting_MeterDisplayTime auto
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
GlobalVariable property _Frost_Setting_Notifications_EquipmentValues auto
GlobalVariable property _Frost_HotkeyWeathersense auto
GlobalVariable property _Frost_Setting_FollowerAnimation auto
GlobalVariable property _Frost_Setting_DisplayTutorials auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentSummary auto
GlobalVariable property _Frost_SettingsProfileVersion auto
GlobalVariable property _Frost_HelpDone_Exposure auto
GlobalVariable property _Frost_HelpDone_Wet auto
GlobalVariable property _Frost_HelpDone_Cold auto

GlobalVariable property _Frost_DS_Body_InitProgress auto
GlobalVariable property _Frost_DS_Hands_InitProgress auto
GlobalVariable property _Frost_DS_Head_InitProgress auto
GlobalVariable property _Frost_DS_Feet_InitProgress auto
GlobalVariable property _Frost_DS_Cloak_InitProgress auto
GlobalVariable property _Frost_DatastoreInitialized auto

GlobalVariable property EndurancePerkPointProgress auto
GlobalVariable property EndurancePerkPoints auto
GlobalVariable property EndurancePerkPointsEarned auto
GlobalVariable property EndurancePerkPointsTotal auto
GlobalVariable property _Frost_PerkRank_Adaptation auto
GlobalVariable property _Frost_PerkRank_Windbreaker auto
GlobalVariable property _Frost_PerkRank_FrostWarding auto
GlobalVariable property _Frost_PerkRank_GlacialSwimmer auto
GlobalVariable property _Frost_PerkRank_InnerFire auto
GlobalVariable property _Frost_PerkRank_WellInsulated auto

GlobalVariable property _Frost_Setting_MeterExposureOpacity auto
GlobalVariable property _Frost_Setting_MeterExposureColor auto
GlobalVariable property _Frost_Setting_MeterExposureColorWarm auto
GlobalVariable property _Frost_Setting_MeterExposureFillDirection auto
GlobalVariable property _Frost_Setting_MeterExposureHeight auto
GlobalVariable property _Frost_Setting_MeterExposureWidth auto
GlobalVariable property _Frost_Setting_MeterExposureHAnchor auto
GlobalVariable property _Frost_Setting_MeterExposureVAnchor auto
GlobalVariable property _Frost_Setting_MeterExposureXPos auto
GlobalVariable property _Frost_Setting_MeterExposureYPos auto
GlobalVariable property _Frost_Setting_MeterWetnessOpacity auto
GlobalVariable property _Frost_Setting_MeterWetnessColor auto
GlobalVariable property _Frost_Setting_MeterWetnessFillDirection auto
GlobalVariable property _Frost_Setting_MeterWetnessHeight auto
GlobalVariable property _Frost_Setting_MeterWetnessWidth auto
GlobalVariable property _Frost_Setting_MeterWetnessHAnchor auto
GlobalVariable property _Frost_Setting_MeterWetnessVAnchor auto
GlobalVariable property _Frost_Setting_MeterWetnessXPos auto
GlobalVariable property _Frost_Setting_MeterWetnessYPos auto
GlobalVariable property _Frost_Setting_MeterWeathersenseOpacity auto
GlobalVariable property _Frost_Setting_MeterWeathersenseColor auto
GlobalVariable property _Frost_Setting_MeterWeathersenseFillDirection auto
GlobalVariable property _Frost_Setting_MeterWeathersenseHeight auto
GlobalVariable property _Frost_Setting_MeterWeathersenseWidth auto
GlobalVariable property _Frost_Setting_MeterWeathersenseHAnchor auto
GlobalVariable property _Frost_Setting_MeterWeathersenseVAnchor auto
GlobalVariable property _Frost_Setting_MeterWeathersenseXPos auto
GlobalVariable property _Frost_Setting_MeterWeathersenseYPos auto

Keyword property _FrostData_ArmorPrecache auto

_Frost_Meter property ExposureMeter auto
_Frost_ExposureMeterInterfaceHandler property ExposureMeterHandler auto
_Frost_Meter property WetnessMeter auto
_Frost_WetnessMeterInterfaceHandler property WetnessMeterHandler auto
_Frost_Meter property WeathersenseMeter auto
_Frost_WeatherMeterInterfaceHandler property WeathersenseMeterHandler auto

Spell property _Frost_Weathersense_Spell auto

bool must_exit = false

string[] ProfileList
string[] MaxExposureModeList
string[] VampirismModeList
string[] WeathersenseDisplayList
string[] MeterDisplayModeList
string[] GearTypeList
string[] ProtectionList
string[] AnimationList

string[] MeterLayoutList
string[] FillDirectionList
string[] FillDirectionListLimited
string[] HorizontalAnchorList
string[] VerticalAnchorList

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

int Interface_FrostShaderOn_OID
int Interface_WetShaderOn_OID
int Interface_SoundEffects_OID
int Interface_FullScreenEffects_OID
int Interface_ForceFeedback_OID
int Interface_Animation_OID
int Interface_FollowerAnimation_OID
int Interface_WeathersenseDisplayMode_OID
int Interface_DisplayAttributesInWeathersense_OID
int Interface_DisplayAttributeValuesInWeathersense_OID
int Interface_ConditionMessages_OID
int Interface_WeatherMessages_OID
int Interface_Notifications_EquipmentValues_OID
int Interface_Notifications_EquipmentSummary_OID

int Meters_UIMeterDisplay_OID
int Meters_UIMeterLayout_OID
int Meters_UIMeterDisplayTime_OID
int Meters_UIMeterColor_OID
int Meters_UIMeterColorAlt_OID
int Meters_UIMeterOpacity_OID
int Meters_UIMeterFillDirection_OID
int Meters_UIMeterScale_OID
int Meters_UIMeterFlipped_OID
int Meters_UIMeterXPos_OID
int Meters_UIMeterYPos_OID
int Meters_UIMeterHAnchor_OID
int Meters_UIMeterVAnchor_OID
int Meters_UIExposureMeterShowAdvanced_OID
int Meters_UIWetnessMeterShowAdvanced_OID
int Meters_UIWeathersenseMeterShowAdvanced_OID

int SaveLoad_SelectProfile_OID
int SaveLoad_RenameProfile_OID
int SaveLoad_DefaultProfile_OID
int SaveLoad_ProfileHelp_OID
int SaveLoad_Enable_OID

int Advanced_EnduranceSkillRestore_OID
int Advanced_EnduranceSkillRestoreSlider_OID
int Advanced_EnduranceSkillRespec_OID
int Advanced_TutorialsToggle_OID
int Advanced_TutorialsResetText_OID

Armor[] ArmorMenuEntries
int[] ArmorTypeIDs
int[] Armor_WarmthSliderOIDs
int[] Armor_CoverageSliderOIDs
int[] Armor_GearTypeOIDs
int[] Armor_ModifyPartsOIDs
int[] Armor_SetProtectionOIDs
int[] Armor_DefaultArmorEntryOIDs
int Armor_ShowTutorialOID
int Armor_DefaultWornArmorOID
int Armor_DefaultAllArmorOID
int Armor_RepairDefaultsOID

int ArmorPage_cursor_position = 0
bool ArmorPage_updated_msg = false
bool ArmorPage_loading = true
bool config_is_open = false

int[] ProtectionListWarmthIndex
int[] ProtectionListCoverageIndex


Event OnConfigInit()
	Pages = new string[7]
	Pages[0] = "$FrostfallOverviewPage"
	Pages[1] = "$FrostfallGameplayPage"
	Pages[2] = "$FrostfallEquipmentPage"
	Pages[3] = "$FrostfallInterfacePage"
	Pages[4] = "$FrostfallMetersPage"
	Pages[5] = "$FrostfallSaveLoadPage"
	Pages[6] = "$FrostfallAdvancedPage"

	MaxExposureModeList = new string[3]
	MaxExposureModeList[0] = "$FrostfallMaxExposureNothing"
	MaxExposureModeList[1] = "$FrostfallMaxExposureRescue"
	MaxExposureModeList[2] = "$FrostfallMaxExposureDeath"

	VampirismModeList = new string[3]
	VampirismModeList[0] = "$FrostfallVampirismHuman"
	VampirismModeList[1] = "$FrostfallVampirismSuperhuman"
	VampirismModeList[2] = "$FrostfallVampirismImmortal"

	WeathersenseDisplayList = new String[3]
	WeathersenseDisplayList[0] = "$FrostfallWeathersenseDisplayMessageOnly"		;"Message"
	WeathersenseDisplayList[1] = "$FrostfallWeathersenseDisplayMetersOnly"		;"Meters"
	WeathersenseDisplayList[2] = "$FrostfallWeathersenseDisplayMessageMeters"	;"Message + Meters"

	AnimationList = new String[3]
	AnimationList[0] = "$FrostfallOff"
	AnimationList[1] = "$FrostfallAnimationAuto"
	AnimationList[2] = "$FrostfallAnimationPrompt"

	MeterLayoutList = new string[4]
	MeterLayoutList[0] = "$FrostfallMeterLayoutList1"	;"Bottom Left"
	MeterLayoutList[1] = "$FrostfallMeterLayoutList2"	;"Bottom Right"
	MeterLayoutList[2] = "$FrostfallMeterLayoutList3"	;"Top Left"
	MeterLayoutList[3] = "$FrostfallMeterLayoutList4"	;"Top Right"

	MeterDisplayModeList = new string[3]
	MeterDisplayModeList[0] = "$FrostfallOff"
	MeterDisplayModeList[1] = "$FrostfallAlwaysOn"
	MeterDisplayModeList[2] = "$FrostfallContextual"

	FillDirectionList = new string[3]
	FillDirectionList[0] = "$FrostfallLeft"
	FillDirectionList[1] = "$FrostfallRight"
	FillDirectionList[2] = "$FrostfallBoth"

	FillDirectionListLimited = new string[2]
	FillDirectionListLimited[0] = "$FrostfallLeft"
	FillDirectionListLimited[1] = "$FrostfallRight"

	HorizontalAnchorList = new string[3]
	HorizontalAnchorList[0] = "$FrostfallLeft"
	HorizontalAnchorList[1] = "$FrostfallRight"
	HorizontalAnchorList[2] = "$FrostfallCenter"

	VerticalAnchorList = new string[3]
	VerticalAnchorList[0] = "$FrostfallTop"
	VerticalAnchorList[1] = "$FrostfallBottom"
	VerticalAnchorList[2] = "$FrostfallCenter"

	GearTypeList = new string[8]
	GearTypeList[0] = "$FrostfallArmorGearTypeList0"
	GearTypeList[1] = "$FrostfallArmorGearTypeList1"
	GearTypeList[2] = "$FrostfallArmorGearTypeList2"
	GearTypeList[3] = "$FrostfallArmorGearTypeList3"
	GearTypeList[4] = "$FrostfallArmorGearTypeList4"
	GearTypeList[5] = "$FrostfallArmorGearTypeList5"
	GearTypeList[6] = "$FrostfallArmorGearTypeList6"
	GearTypeList[7] = "$FrostfallCancel"

	ProtectionList = new string[28]
	ProtectionList[0] = "$FrostfallArmorProtectionList0"
	ProtectionList[1] = "$FrostfallArmorProtectionList1"
	ProtectionList[2] = "$FrostfallArmorProtectionList2"
	ProtectionList[3] = "$FrostfallArmorProtectionList3"
	ProtectionList[4] = "$FrostfallArmorProtectionList4"
	ProtectionList[5] = "$FrostfallArmorProtectionList5"
	ProtectionList[6] = "$FrostfallArmorProtectionList6"
	ProtectionList[7] = "$FrostfallArmorProtectionList7"
	ProtectionList[8] = "$FrostfallArmorProtectionList8"
	ProtectionList[9] = "$FrostfallArmorProtectionList9"
	ProtectionList[10] = "$FrostfallArmorProtectionList10"
	ProtectionList[11] = "$FrostfallArmorProtectionList11"
	ProtectionList[12] = "$FrostfallArmorProtectionList12"
	ProtectionList[13] = "$FrostfallArmorProtectionList13"
	ProtectionList[14] = "$FrostfallArmorProtectionList14"
	ProtectionList[15] = "$FrostfallArmorProtectionList15"
	ProtectionList[16] = "$FrostfallArmorProtectionList16"
	ProtectionList[17] = "$FrostfallArmorProtectionList17"
	ProtectionList[18] = "$FrostfallArmorProtectionList18"
	ProtectionList[19] = "$FrostfallArmorProtectionList19"
	ProtectionList[20] = "$FrostfallArmorProtectionList20"
	ProtectionList[21] = "$FrostfallArmorProtectionList21"
	ProtectionList[22] = "$FrostfallArmorProtectionList22"
	ProtectionList[23] = "$FrostfallArmorProtectionList23"
	ProtectionList[24] = "$FrostfallArmorProtectionList24"
	ProtectionList[25] = "$FrostfallArmorProtectionList25"
	ProtectionList[26] = "$FrostfallArmorProtectionList26"
	ProtectionList[27] = "$FrostfallCancel"

	ProtectionListWarmthIndex = new int[24]
	ProtectionListWarmthIndex[0] = -1
	ProtectionListWarmthIndex[1] = 0
	ProtectionListWarmthIndex[2] = 1
	ProtectionListWarmthIndex[3] = 2
	ProtectionListWarmthIndex[4] = -1
	ProtectionListWarmthIndex[5] = 2
	ProtectionListWarmthIndex[6] = 3
	ProtectionListWarmthIndex[7] = 4
	ProtectionListWarmthIndex[8] = -1
	ProtectionListWarmthIndex[9] = 1
	ProtectionListWarmthIndex[10] = 1
	ProtectionListWarmthIndex[11] = 2
	ProtectionListWarmthIndex[12] = -1
	ProtectionListWarmthIndex[13] = 0
	ProtectionListWarmthIndex[14] = 1
	ProtectionListWarmthIndex[15] = 2
	ProtectionListWarmthIndex[16] = 3
	ProtectionListWarmthIndex[17] = 4
	ProtectionListWarmthIndex[18] = -1
	ProtectionListWarmthIndex[19] = 1
	ProtectionListWarmthIndex[20] = 0
	ProtectionListWarmthIndex[21] = 1
	ProtectionListWarmthIndex[22] = 1
	ProtectionListWarmthIndex[23] = 4

	ProtectionListCoverageIndex = new int[24]
	ProtectionListCoverageIndex[0] = -1
	ProtectionListCoverageIndex[1] = -2
	ProtectionListCoverageIndex[2] = 5
	ProtectionListCoverageIndex[3] = 5
	ProtectionListCoverageIndex[4] = -1
	ProtectionListCoverageIndex[5] = 6
	ProtectionListCoverageIndex[6] = 6
	ProtectionListCoverageIndex[7] = 7
	ProtectionListCoverageIndex[8] = -1
	ProtectionListCoverageIndex[9] = 7
	ProtectionListCoverageIndex[10] = 8
	ProtectionListCoverageIndex[11] = 9
	ProtectionListCoverageIndex[12] = -1
	ProtectionListCoverageIndex[13] = 5
	ProtectionListCoverageIndex[14] = 6
	ProtectionListCoverageIndex[15] = 7
	ProtectionListCoverageIndex[16] = 8
	ProtectionListCoverageIndex[17] = 9
	ProtectionListCoverageIndex[18] = -1
	ProtectionListCoverageIndex[19] = 5
	ProtectionListCoverageIndex[20] = 6
	ProtectionListCoverageIndex[21] = 6
	ProtectionListCoverageIndex[22] = 9
	ProtectionListCoverageIndex[23] = 6

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

int function GetVersion()
	return 3
endFunction

Event OnVersionUpdate(int a_version)
	OnConfigInit()
EndEvent

event OnPageReset(string page)
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
	elseif page == "$FrostfallMetersPage"
		PageReset_Meters()
	elseif page == "$FrostfallSaveLoadPage"
		PageReset_SaveLoad()
	elseif page == "$FrostfallAdvancedPage"
		PageReset_Advanced()
	endif
endEvent

Event OnConfigOpen()
	if FrostfallRunning.GetValueInt() == 2 && _Frost_DatastoreInitialized.GetValueInt() != 2
		must_exit = true
	else
		must_exit = false
	endif

	config_is_open = true
EndEvent

Event OnConfigClose()
	UnregisterForAllModEvents()
	meter_being_configured = METER_BEING_CONFIGURED_NONE
	config_is_open = false
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
			Overview_RunSubStatusText_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		endif
	else
		if Game.IsFightingControlsEnabled()
			if !must_exit
				Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallDisabled")
			else
				Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallDisabled", OPTION_FLAG_DISABLED)
			endif
			Overview_RunSubStatusText_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
		else
			Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallDisabled", OPTION_FLAG_DISABLED)
			Overview_RunSubStatusText_OID = AddTextOption("$FrostfallCantStart", "", OPTION_FLAG_DISABLED)
		endif
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
			Overview_InfoLine1_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine2_OID = AddTextOption("$FrostfallStartUpProgress", "$FrostfallGeneralExitMenuPrompt")
			Overview_InfoLine3_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine4_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine5_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine6_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine7_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine8_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
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
		string exp_val
		int exposure = (Math.Floor(GetPlayerExposure()) - 20)
		if exposure < 0
			exp_val = "+" + (Math.Abs(exposure) as Int)
		else
			exp_val = exposure
		endif
		Overview_ExposureStatusText_OID = AddTextOption("$FrostfallOverviewExposureValue", exp_val)
	else
		Overview_ExposureStatusText_OID = AddTextOption("$FrostfallOverviewExposureValue", "")
	endif
	if GetWetnessSystem().IsSystemRunning()
		Overview_WetnessStatusText_OID = AddTextOption("$FrostfallOverviewWetnessValue", (((_Frost_AttributeWetness.GetValueInt() / 750.0) * 100.0) as int) + "%")
	else
		Overview_WetnessStatusText_OID = AddTextOption("$FrostfallOverviewWetnessValue", "")
	endif

	AddEmptyOption()

	AddHeaderOption("$FrostfallOverviewHeaderPlayerStats")
	if GetWarmthSystem().IsSystemRunning()
		Overview_WarmthStatusText_OID = AddTextOption("$FrostfallOverviewWarmthValue", _Frost_AttributeWarmth.GetValueInt())
	else
		Overview_WarmthStatusText_OID = AddTextOption("$FrostfallOverviewWarmthValue", "")
	endif
	if GetCoverageSystem().IsSystemRunning()
		Overview_CoverageStatusText_OID = AddTextOption("$FrostfallOverviewCoverageValue", _Frost_AttributeCoverage.GetValueInt())
	else
		Overview_CoverageStatusText_OID = AddTextOption("$FrostfallOverviewCoverageValue", "")
	endif
	AddEmptyOption()
	AddEmptyOption()
endFunction

function PageReset_Gameplay()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

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
	if _Frost_Setting_NoWaiting.GetValueInt() == 2
		Gameplay_DisableFT_OID = AddToggleOption("$FrostfallGameplaySettingFTToggle", true, OPTION_FLAG_DISABLED)
	else
		if _Frost_Setting_NoFastTravel.GetValueInt() == 2
			Gameplay_DisableFT_OID = AddToggleOption("$FrostfallGameplaySettingFTToggle", true)
		else
			Gameplay_DisableFT_OID = AddToggleOption("$FrostfallGameplaySettingFTToggle", false)
		endif
	endif
	if _Frost_Setting_NoWaiting.GetValueInt() == 2
		Gameplay_DisableWaiting_OID = AddToggleOption("$FrostfallGameplaySettingFTWaiting", true)
	else
		Gameplay_DisableWaiting_OID = AddToggleOption("$FrostfallGameplaySettingFTWaiting", false)
	endif

	SetCursorPosition(1)

	AddHeaderOption("$FrostfallGameplayHeaderWorld")
	AddTextOption("$FrostfallComingSoon", "", OPTION_FLAG_DISABLED)
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
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

	if ArmorPage_loading == true
		AddTextOption("$FrostfallArmorLoadingPage", "", OPTION_FLAG_DISABLED)
		ArmorPage_loading = false
		ForcePageReset()
	else
		GenerateEquipmentPage()
		ArmorPage_loading = true
	endif

	if ArmorPage_updated_msg
		ShowMessage("$FrostfallArmorUpdatingPage")
		ArmorPage_updated_msg = false
	endif
endFunction

function PageReset_Interface()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

	AddHeaderOption("$FrostfallInterfaceHeaderEffects")
	if _Frost_Setting_FrostShaderOn.GetValueInt() == 2
		Interface_FrostShaderOn_OID = AddToggleOption("$FrostfallInterfaceSettingFrostShader", true)
	else
		Interface_FrostShaderOn_OID = AddToggleOption("$FrostfallInterfaceSettingFrostShader", false)
	endif
	if _Frost_Setting_WetShaderOn.GetValueInt() == 2
		Interface_WetShaderOn_OID = AddToggleOption("$FrostfallInterfaceSettingWetShader", true)
	else
		Interface_WetShaderOn_OID = AddToggleOption("$FrostfallInterfaceSettingWetShader", false)
	endif
	if _Frost_Setting_SoundEffects.GetValueInt() == 2
		Interface_SoundEffects_OID = AddToggleOption("$FrostfallInterfaceSettingSoundEffects", true)
	else
		Interface_SoundEffects_OID = AddToggleOption("$FrostfallInterfaceSettingSoundEffects", false)
	endif
	if _Frost_Setting_FullScreenEffects.GetValueInt() == 2
		Interface_FullScreenEffects_OID = AddToggleOption("$FrostfallInterfaceSettingImagespaceModifiers", true)
	else
		Interface_FullScreenEffects_OID = AddToggleOption("$FrostfallInterfaceSettingImagespaceModifiers", false)
	endif
	if _Frost_Setting_ForceFeedback.GetValueInt() == 2
		Interface_ForceFeedback_OID = AddToggleOption("$FrostfallInterfaceSettingForceFeedback", true)
	else
		Interface_ForceFeedback_OID = AddToggleOption("$FrostfallInterfaceSettingForceFeedback", false)
	endif
	Interface_Animation_OID = AddMenuOption("$FrostfallInterfaceSettingAnimation", AnimationList[_Frost_Setting_Animation.GetValueInt() - 1])
	if _Frost_Setting_FollowerAnimation.GetValueInt() == 2
		Interface_FollowerAnimation_OID = AddToggleOption("$FrostfallInterfaceSettingFollowerAnimation", true)
	else
		Interface_FollowerAnimation_OID = AddToggleOption("$FrostfallInterfaceSettingFollowerAnimation", false)
	endif

	SetCursorPosition(1)

	AddHeaderOption("$FrostfallInterfaceHeaderNotifications")
	if _Frost_Setting_ConditionMessages.GetValueInt() == 2
		Interface_ConditionMessages_OID = AddToggleOption("$FrostfallInterfaceSettingCondition", true)
	else
		Interface_ConditionMessages_OID = AddToggleOption("$FrostfallInterfaceSettingCondition", false)
	endif
	if _Frost_Setting_WeatherMessages.GetValueInt() == 2
		Interface_WeatherMessages_OID = AddToggleOption("$FrostfallInterfaceSettingWeather", true)
	else
		Interface_WeatherMessages_OID = AddToggleOption("$FrostfallInterfaceSettingWeather", false)
	endif
	Interface_WeathersenseDisplayMode_OID = AddMenuOption("$FrostfallInterfaceSettingWeathersenseDisplayMode", WeathersenseDisplayList[_Frost_Setting_WeathersenseDisplayMode.GetValueInt()])
	
	if _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt() == 2
		Interface_DisplayAttributesInWeathersense_OID = AddToggleOption("$FrostfallInterfaceSettingWeathersense", true)
		if _Frost_Setting_DisplayAttributeValuesInWeathersense.GetValueInt() == 2
			Interface_DisplayAttributeValuesInWeathersense_OID = AddToggleOption("$FrostfallInterfaceSettingWeathersenseDetail", true)
		else
			Interface_DisplayAttributeValuesInWeathersense_OID = AddToggleOption("$FrostfallInterfaceSettingWeathersenseDetail", false)
		endif
	else
		Interface_DisplayAttributesInWeathersense_OID = AddToggleOption("$FrostfallInterfaceSettingWeathersense", false)
		Interface_DisplayAttributeValuesInWeathersense_OID = AddToggleOption("$FrostfallInterfaceSettingWeathersenseDetail", false, OPTION_FLAG_DISABLED)
	endif

	if Compatibility.isUIPackageInstalled
		; pass
	else
		if _Frost_Setting_Notifications_EquipmentValues.GetValueInt() == 2
			Interface_Notifications_EquipmentValues_OID = AddToggleOption("$FrostfallInterfaceSettingEquipmentValues", true)
		else
			Interface_Notifications_EquipmentValues_OID = AddToggleOption("$FrostfallInterfaceSettingEquipmentValues", false)
		endif
		if _Frost_Setting_Notifications_EquipmentSummary.GetValueInt() == 2
			Interface_Notifications_EquipmentSummary_OID = AddToggleOption("$FrostfallInterfaceSettingEquipmentSummary", true)
		else
			Interface_Notifications_EquipmentSummary_OID = AddToggleOption("$FrostfallInterfaceSettingEquipmentSummary", false)
		endif
	endif
endFunction

function PageReset_Meters()
	if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$FrostfallInterfaceHeaderMetersGeneral")
	Meters_UIMeterDisplay_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterDisplay", MeterDisplayModeList[_Frost_Setting_MeterDisplayMode.GetValueInt()])
	Meters_UIMeterDisplayTime_OID = AddSliderOption("$FrostfallInterfaceSettingMeterDisplaytime", _Frost_Setting_MeterDisplayTime.GetValue() * 2, "{0}")
	Meters_UIMeterLayout_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterLayout", "$FrostfallSelect")
	AddEmptyOption()
	AddHeaderOption("$FrostfallInterfaceHeaderMetersExposureName")
	Meters_UIExposureMeterShowAdvanced_OID = AddToggleOption("$FrostfallInterfaceSettingUIMeterShowAdvanced", meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE)
	AddHeaderOption("$FrostfallInterfaceHeaderMetersWetnessName")
	Meters_UIWetnessMeterShowAdvanced_OID = AddToggleOption("$FrostfallInterfaceSettingUIMeterShowAdvanced", meter_being_configured == METER_BEING_CONFIGURED_WETNESS)
	AddHeaderOption("$FrostfallInterfaceHeaderMetersWeathersenseName")
	Meters_UIWeathersenseMeterShowAdvanced_OID = AddToggleOption("$FrostfallInterfaceSettingUIMeterShowAdvanced", meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE)

	SetCursorPosition(1)

	; Advanced settings
	if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
		AddHeaderOption("$FrostfallInterfaceHeaderMetersAdvanced")
		AddTextOption("$FrostfallInterfaceSettingUIMeterConfiguring", "$FrostfallInterfaceHeaderMetersExposureName", OPTION_FLAG_DISABLED)
		Meters_UIMeterColor_OID = AddColorOption("$FrostfallInterfaceSettingUIColorExposure", _Frost_Setting_MeterExposureColor.GetValueInt())
		Meters_UIMeterColorAlt_OID = AddColorOption("$FrostfallInterfaceSettingUIColorExposureAlt", _Frost_Setting_MeterExposureColorWarm.GetValueInt())
		Meters_UIMeterOpacity_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterOpacity", _Frost_Setting_MeterExposureOpacity.GetValue(), "{0}%")
		Meters_UIMeterFillDirection_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterFillDirection", FillDirectionListLimited[_Frost_Setting_MeterExposureFillDirection.GetValueInt()])
		Meters_UIMeterScale_OID = AddSliderOption("$FrostfallScale", GetMeterScale(_Frost_Setting_MeterExposureWidth.GetValue(), NORMAL_METER_WIDTH), "{2}")
		Meters_UIMeterXPos_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterXPos", _Frost_Setting_MeterExposureXPos.GetValue(), "{1}")
		Meters_UIMeterYPos_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterYPos", _Frost_Setting_MeterExposureYPos.GetValue(), "{1}")
		Meters_UIMeterHAnchor_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterHAnchor", HorizontalAnchorList[_Frost_Setting_MeterExposureHAnchor.GetValueInt()])
		Meters_UIMeterVAnchor_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterVAnchor", VerticalAnchorList[_Frost_Setting_MeterExposureVAnchor.GetValueInt()])
	elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
		AddHeaderOption("$FrostfallInterfaceHeaderMetersAdvanced")
		AddTextOption("$FrostfallInterfaceSettingUIMeterConfiguring", "$FrostfallInterfaceHeaderMetersWetnessName", OPTION_FLAG_DISABLED)
		Meters_UIMeterColor_OID = AddColorOption("$FrostfallInterfaceSettingUIColor", _Frost_Setting_MeterWetnessColor.GetValueInt())
		Meters_UIMeterOpacity_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterOpacity", _Frost_Setting_MeterWetnessOpacity.GetValue(), "{0}%")
		Meters_UIMeterFillDirection_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterFillDirection", FillDirectionListLimited[_Frost_Setting_MeterWetnessFillDirection.GetValueInt()])
		Meters_UIMeterScale_OID = AddSliderOption("$FrostfallScale", GetMeterScale(_Frost_Setting_MeterWetnessWidth.GetValue(), CHARGE_METER_WIDTH), "{2}")
		Meters_UIMeterFlipped_OID = AddToggleOption("$FrostfallFlipped", (_Frost_Setting_MeterWetnessHeight.GetValue() < 0))
		Meters_UIMeterXPos_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterXPos", _Frost_Setting_MeterWetnessXPos.GetValue(), "{1}")
		Meters_UIMeterYPos_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterYPos", _Frost_Setting_MeterWetnessYPos.GetValue(), "{1}")
		Meters_UIMeterHAnchor_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterHAnchor", HorizontalAnchorList[_Frost_Setting_MeterWetnessHAnchor.GetValueInt()])
		Meters_UIMeterVAnchor_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterVAnchor", VerticalAnchorList[_Frost_Setting_MeterWetnessVAnchor.GetValueInt()])
	elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
		AddHeaderOption("$FrostfallInterfaceHeaderMetersAdvanced")
		AddTextOption("$FrostfallInterfaceSettingUIMeterConfiguring", "$FrostfallInterfaceHeaderMetersWeathersenseName", OPTION_FLAG_DISABLED)
		Meters_UIMeterColor_OID = AddColorOption("$FrostfallInterfaceSettingUIColor", _Frost_Setting_MeterWeathersenseColor.GetValueInt())
		Meters_UIMeterOpacity_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterOpacity", _Frost_Setting_MeterWeathersenseOpacity.GetValue(), "{0}%")
		Meters_UIMeterFillDirection_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterFillDirection", FillDirectionList[_Frost_Setting_MeterWeathersenseFillDirection.GetValueInt()])
		Meters_UIMeterScale_OID = AddSliderOption("$FrostfallScale", GetMeterScale(_Frost_Setting_MeterWeathersenseWidth.GetValue(), CHARGE_METER_WIDTH), "{2}")
		Meters_UIMeterFlipped_OID = AddToggleOption("$FrostfallFlipped", (_Frost_Setting_MeterWeathersenseHeight.GetValue() < 0))
		Meters_UIMeterXPos_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterXPos", _Frost_Setting_MeterWeathersenseXPos.GetValue(), "{1}")
		Meters_UIMeterYPos_OID = AddSliderOption("$FrostfallInterfaceSettingUIMeterYPos", _Frost_Setting_MeterWeathersenseYPos.GetValue(), "{1}")
		Meters_UIMeterHAnchor_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterHAnchor", HorizontalAnchorList[_Frost_Setting_MeterWeathersenseHAnchor.GetValueInt()])
		Meters_UIMeterVAnchor_OID = AddMenuOption("$FrostfallInterfaceSettingUIMeterVAnchor", VerticalAnchorList[_Frost_Setting_MeterWeathersenseVAnchor.GetValueInt()])
	endif
endFunction

function PageReset_SaveLoad()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

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

function PageReset_Advanced()
	SetCursorFillMode(TOP_TO_BOTTOM)
	if FrostfallRunning.GetValueInt() != 2 || must_exit
		AddTextOption("$FrostfallNotRunningError", "", OPTION_FLAG_DISABLED)
		return
	endif

	AddHeaderOption("$FrostfallAdvancedHeaderEnduranceSkill")
	Advanced_EnduranceSkillRespec_OID = AddTextOption("$FrostfallAdvancedEnduranceSkillRespec", "")
	Advanced_EnduranceSkillRestore_OID = AddToggleOption("$FrostfallAdvancedEnduranceSkillRestore", false)
	Advanced_EnduranceSkillRestoreSlider_OID = AddSliderOption("$FrostfallAdvancedEnduranceSkillRestoreAmount", 0, "{0}", OPTION_FLAG_DISABLED)

	SetCursorPosition(1)

	AddHeaderOption("$FrostfallAdvancedHeaderTutorials")
	if _Frost_Setting_DisplayTutorials.GetValueInt() == 2
		Advanced_TutorialsToggle_OID = AddToggleOption("$FrostfallAdvancedSettingTutorialsShow", true)
	else
		Advanced_TutorialsToggle_OID = AddToggleOption("$FrostfallAdvancedSettingTutorialsShow", false)
	endif
	Advanced_TutorialsResetText_OID = AddTextOption("", "$FrostfallAdvancedSettingTutorialsReset")

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
		SaveSettingToCurrentProfile("frigid_water_is_lethal", _Frost_Setting_FrigidWaterIsLethal.GetValueInt())
	elseif option == Gameplay_ExposurePauseDialogue_OID
		if _Frost_Setting_ExposurePauseDialogue.GetValueInt() == 2
			_Frost_Setting_ExposurePauseDialogue.SetValueInt(1)
			SetToggleOptionValue(Gameplay_ExposurePauseDialogue_OID, false)
		else
			_Frost_Setting_ExposurePauseDialogue.SetValueInt(2)
			SetToggleOptionValue(Gameplay_ExposurePauseDialogue_OID, true)
		endif
		SaveSettingToCurrentProfile("exposure_pause_dialogue", _Frost_Setting_ExposurePauseDialogue.GetValueInt())
	elseif option == Gameplay_ExposurePauseCombat_OID
		if _Frost_Setting_ExposurePauseCombat.GetValueInt() == 2
			_Frost_Setting_ExposurePauseCombat.SetValueInt(1)
			SetToggleOptionValue(Gameplay_ExposurePauseCombat_OID, false)
		else
			_Frost_Setting_ExposurePauseCombat.SetValueInt(2)
			SetToggleOptionValue(Gameplay_ExposurePauseCombat_OID, true)
		endif
		SaveSettingToCurrentProfile("exposure_pause_combat", _Frost_Setting_ExposurePauseCombat.GetValueInt())
	elseif option == Gameplay_MovementPenalty_OID
		if _Frost_Setting_MovementPenalty.GetValueInt() == 2
			_Frost_Setting_MovementPenalty.SetValueInt(1)
			SetToggleOptionValue(Gameplay_MovementPenalty_OID, false)
		else
			_Frost_Setting_MovementPenalty.SetValueInt(2)
			SetToggleOptionValue(Gameplay_MovementPenalty_OID, true)
		endif
		SaveSettingToCurrentProfile("movement_penalty", _Frost_Setting_MovementPenalty.GetValueInt())
	elseif option == Gameplay_DisableFT_OID
		if _Frost_Setting_NoFastTravel.GetValueInt() == 2
			_Frost_Setting_NoFastTravel.SetValueInt(1)
			SetToggleOptionValue(Gameplay_DisableFT_OID, false)
		else
			_Frost_Setting_NoFastTravel.SetValueInt(2)
			SetToggleOptionValue(Gameplay_DisableFT_OID, true)
		endif
		SaveSettingToCurrentProfile("no_fast_travel", _Frost_Setting_NoFastTravel.GetValueInt())
	elseif option == Gameplay_DisableWaiting_OID
		if _Frost_Setting_NoWaiting.GetValueInt() == 2
			_Frost_Setting_NoWaiting.SetValueInt(1)
			SetToggleOptionValue(Gameplay_DisableWaiting_OID, false)
			ForcePageReset()
		else
			_Frost_Setting_NoWaiting.SetValueInt(2)
			SetToggleOptionValue(Gameplay_DisableWaiting_OID, true)
			ForcePageReset()
		endif
		SaveSettingToCurrentProfile("no_waiting", _Frost_Setting_NoWaiting.GetValueInt())
	elseif option == Interface_FrostShaderOn_OID
		if _Frost_Setting_FrostShaderOn.GetValueInt() == 2
			_Frost_Setting_FrostShaderOn.SetValueInt(1)
			SetToggleOptionValue(Interface_FrostShaderOn_OID, false)
		else
			_Frost_Setting_FrostShaderOn.SetValueInt(2)
			SetToggleOptionValue(Interface_FrostShaderOn_OID, true)
		endif
		SaveSettingToCurrentProfile("frost_shader_on", _Frost_Setting_FrostShaderOn.GetValueInt())
	elseif option == Interface_WetShaderOn_OID
		if _Frost_Setting_WetShaderOn.GetValueInt() == 2
			_Frost_Setting_WetShaderOn.SetValueInt(1)
			SetToggleOptionValue(Interface_WetShaderOn_OID, false)
		else
			_Frost_Setting_WetShaderOn.SetValueInt(2)
			SetToggleOptionValue(Interface_WetShaderOn_OID, true)
		endif
		SaveSettingToCurrentProfile("wet_shader_on", _Frost_Setting_WetShaderOn.GetValueInt())
	elseif option == Interface_SoundEffects_OID
		if _Frost_Setting_SoundEffects.GetValueInt() == 2
			_Frost_Setting_SoundEffects.SetValueInt(1)
			SetToggleOptionValue(Interface_SoundEffects_OID, false)
		else
			_Frost_Setting_SoundEffects.SetValueInt(2)
			SetToggleOptionValue(Interface_SoundEffects_OID, true)
		endif
		SaveSettingToCurrentProfile("sound_effects", _Frost_Setting_SoundEffects.GetValueInt())
	elseif option == Interface_FullScreenEffects_OID
		if _Frost_Setting_FullScreenEffects.GetValueInt() == 2
			_Frost_Setting_FullScreenEffects.SetValueInt(1)
			SetToggleOptionValue(Interface_FullScreenEffects_OID, false)
		else
			_Frost_Setting_FullScreenEffects.SetValueInt(2)
			SetToggleOptionValue(Interface_FullScreenEffects_OID, true)
		endif
		SaveSettingToCurrentProfile("full_screen_effects", _Frost_Setting_FullScreenEffects.GetValueInt())
	elseif option == Interface_ForceFeedback_OID
		if _Frost_Setting_ForceFeedback.GetValueInt() == 2
			_Frost_Setting_ForceFeedback.SetValueInt(1)
			SetToggleOptionValue(Interface_ForceFeedback_OID, false)
		else
			_Frost_Setting_ForceFeedback.SetValueInt(2)
			SetToggleOptionValue(Interface_ForceFeedback_OID, true)
		endif
		SaveSettingToCurrentProfile("force_feedback", _Frost_Setting_ForceFeedback.GetValueInt())
	elseif option == Interface_FollowerAnimation_OID
		if _Frost_Setting_FollowerAnimation.GetValueInt() == 2
			_Frost_Setting_FollowerAnimation.SetValueInt(1)
			SetToggleOptionValue(Interface_FollowerAnimation_OID, false)
		else
			_Frost_Setting_FollowerAnimation.SetValueInt(2)
			SetToggleOptionValue(Interface_FollowerAnimation_OID, true)
		endif
		SaveSettingToCurrentProfile("follower_animation", _Frost_Setting_FollowerAnimation.GetValueInt())
	elseif option == Interface_DisplayAttributesInWeathersense_OID
		if _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt() == 2
			_Frost_Setting_DisplayAttributesInWeathersense.SetValueInt(1)
			SetToggleOptionValue(Interface_DisplayAttributesInWeathersense_OID, false)
		else
			_Frost_Setting_DisplayAttributesInWeathersense.SetValueInt(2)
			SetToggleOptionValue(Interface_DisplayAttributesInWeathersense_OID, true)
		endif
		SaveSettingToCurrentProfile("display_attributes_in_weathersense", _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt())
		ForcePageReset()
	elseif option == Interface_DisplayAttributeValuesInWeathersense_OID
		if _Frost_Setting_DisplayAttributeValuesInWeathersense.GetValueInt() == 2
			_Frost_Setting_DisplayAttributeValuesInWeathersense.SetValueInt(1)
			SetToggleOptionValue(Interface_DisplayAttributeValuesInWeathersense_OID, false)
		else
			_Frost_Setting_DisplayAttributeValuesInWeathersense.SetValueInt(2)
			SetToggleOptionValue(Interface_DisplayAttributeValuesInWeathersense_OID, true)
		endif
		SaveSettingToCurrentProfile("display_attribute_values_in_weathersense", _Frost_Setting_DisplayAttributeValuesInWeathersense.GetValueInt())
	elseif option == Interface_ConditionMessages_OID
		if _Frost_Setting_ConditionMessages.GetValueInt() == 2
			_Frost_Setting_ConditionMessages.SetValueInt(1)
			SetToggleOptionValue(Interface_ConditionMessages_OID, false)
		else
			_Frost_Setting_ConditionMessages.SetValueInt(2)
			SetToggleOptionValue(Interface_ConditionMessages_OID, true)
		endif
		SaveSettingToCurrentProfile("condition_messages", _Frost_Setting_ConditionMessages.GetValueInt())
	elseif option == Interface_WeatherMessages_OID
		if _Frost_Setting_WeatherMessages.GetValueInt() == 2
			_Frost_Setting_WeatherMessages.SetValueInt(1)
			SetToggleOptionValue(Interface_WeatherMessages_OID, false)
		else
			_Frost_Setting_WeatherMessages.SetValueInt(2)
			SetToggleOptionValue(Interface_WeatherMessages_OID, true)
		endif
		SaveSettingToCurrentProfile("weather_messages", _Frost_Setting_WeatherMessages.GetValueInt())
	elseif option == Interface_Notifications_EquipmentValues_OID
		if _Frost_Setting_Notifications_EquipmentValues.GetValueInt() == 2
			_Frost_Setting_Notifications_EquipmentValues.SetValueInt(1)
			SetToggleOptionValue(Interface_Notifications_EquipmentValues_OID, false)
		else
			_Frost_Setting_Notifications_EquipmentValues.SetValueInt(2)
			SetToggleOptionValue(Interface_Notifications_EquipmentValues_OID, true)
		endif
		SaveSettingToCurrentProfile("notification_equipmentvalues", _Frost_Setting_Notifications_EquipmentValues.GetValueInt())
	elseif option == Interface_Notifications_EquipmentSummary_OID
		if _Frost_Setting_Notifications_EquipmentSummary.GetValueInt() == 2
			_Frost_Setting_Notifications_EquipmentSummary.SetValueInt(1)
			SetToggleOptionValue(Interface_Notifications_EquipmentSummary_OID, false)
		else
			_Frost_Setting_Notifications_EquipmentSummary.SetValueInt(2)
			SetToggleOptionValue(Interface_Notifications_EquipmentSummary_OID, true)
		endif
		SaveSettingToCurrentProfile("notification_equipmentsummary", _Frost_Setting_Notifications_EquipmentSummary.GetValueInt())
	elseif option == Meters_UIExposureMeterShowAdvanced_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			meter_being_configured = METER_BEING_CONFIGURED_NONE
		else
			meter_being_configured = METER_BEING_CONFIGURED_EXPOSURE
		endif
		ForcePageReset()
	elseif option == Meters_UIWetnessMeterShowAdvanced_OID
		if meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			meter_being_configured = METER_BEING_CONFIGURED_NONE
		else
			meter_being_configured = METER_BEING_CONFIGURED_WETNESS
		endif
		ForcePageReset()
	elseif option == Meters_UIWeathersenseMeterShowAdvanced_OID
		if meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			meter_being_configured = METER_BEING_CONFIGURED_NONE
		else
			meter_being_configured = METER_BEING_CONFIGURED_WEATHERSENSE
		endif
		ForcePageReset()
	elseif option == Meters_UIMeterFlipped_OID
		if meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			float scale = GetMeterScale(_Frost_Setting_MeterWetnessWidth.GetValue(), CHARGE_METER_WIDTH)
			if _Frost_Setting_MeterWetnessHeight.GetValue() > 0
				_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV * scale)
				SetToggleOptionValue(Meters_UIMeterFlipped_OID, true)
			else
				_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT * scale)
				SetToggleOptionValue(Meters_UIMeterFlipped_OID, false)
			endif
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_height", _Frost_Setting_MeterWetnessHeight.GetValue())
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			float scale = GetMeterScale(_Frost_Setting_MeterWeathersenseWidth.GetValue(), CHARGE_METER_WIDTH)
			if _Frost_Setting_MeterWeathersenseHeight.GetValue() > 0
				_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV * scale)
				SetToggleOptionValue(Meters_UIMeterFlipped_OID, true)
			else
				_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT * scale)
				SetToggleOptionValue(Meters_UIMeterFlipped_OID, false)
			endif
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_height", _Frost_Setting_MeterWeathersenseHeight.GetValue())
		endif
	elseif option == SaveLoad_DefaultProfile_OID
		bool b = ShowMessage("$FrostfallSaveLoadDefaultProfileConfirm")
		if b
			GenerateDefaultProfile(_Frost_Setting_CurrentProfile.GetValueInt())
			SwitchToProfile(_Frost_Setting_CurrentProfile.GetValueInt())
			ForcePageReset()
		endif
	elseif option == SaveLoad_Enable_OID
		if _Frost_Setting_AutoSaveLoad.GetValueInt() == 2
			_Frost_Setting_AutoSaveLoad.SetValueInt(1)
			SetToggleOptionValue(SaveLoad_Enable_OID, false)
			JsonUtil.SetIntValue(CONFIG_PATH + "common", "auto_load", 1)
			JsonUtil.Save(CONFIG_PATH + "common")
		elseif _Frost_Setting_AutoSaveLoad.GetValueInt() == 1
			_Frost_Setting_AutoSaveLoad.SetValueInt(2)
			SetToggleOptionValue(SaveLoad_Enable_OID, true)
			JsonUtil.SetIntValue(CONFIG_PATH + "common", "auto_load", 2)
			JsonUtil.Save(CONFIG_PATH + "common")
			SaveAllSettings(_Frost_Setting_CurrentProfile.GetValueInt())
		endIf
		ForcePageReset()
	elseif option == SaveLoad_ProfileHelp_OID
		ShowProfileHelp()
	elseif option == Advanced_EnduranceSkillRespec_OID
		bool b = ShowMessage("$FrostfallAdvancedEnduranceSkillRespecConfirm")
		if b
			RefundEnduranceSkillPoints()
			ShowMessage("$FrostfallAdvancedEnduranceSkillRestoreDone", false)
		endif
	elseif option == Advanced_EnduranceSkillRestore_OID
		bool b = ShowMessage("$FrostfallAdvancedEnduranceSkillRestoreConfirm")
		if b
			ShowMessage("$FrostfallAdvancedEnduranceSkillRestoreSelect")
			SetToggleOptionValue(Advanced_EnduranceSkillRestore_OID, true, true)
			SetOptionFlags(Advanced_EnduranceSkillRestoreSlider_OID, OPTION_FLAG_NONE)
		endif
	elseif option == Advanced_TutorialsToggle_OID
		if _Frost_Setting_DisplayTutorials.GetValueInt() == 2
			_Frost_Setting_DisplayTutorials.SetValueInt(1)
			SetToggleOptionValue(Advanced_TutorialsToggle_OID, false)
		else
			_Frost_Setting_DisplayTutorials.SetValueInt(2)
			SetToggleOptionValue(Advanced_TutorialsToggle_OID, true)
		endif
		SaveSettingToCurrentProfile("display_tutorials", _Frost_Setting_DisplayTutorials.GetValueInt())
	elseif option == Advanced_TutorialsResetText_OID
		bool b = ShowMessage("$FrostfallTutorialResetPrompt")
		if b
			_Frost_HelpDone_Exposure.SetValueInt(1)
			_Frost_HelpDone_Wet.SetValueInt(1)
			_Frost_HelpDone_Cold.SetValueInt(1)
		endif
	elseif option == Armor_ShowTutorialOID
		ShowTutorial_ArmorPage(true)
	elseif option == Armor_RepairDefaultsOID
		RepairArmorDefaults()
	elseif option == Armor_DefaultWornArmorOID
		DefaultWornArmor()
	elseif option == Armor_DefaultAllArmorOID
		DefaultAllArmor()
	endif
endEvent

event OnOptionDefault(int option)
	if option == Interface_Animation_OID
		_Frost_Setting_Animation.SetValueInt(2)
		SetMenuOptionValue(Interface_Animation_OID, AnimationList[1])
		SaveSettingToCurrentProfile("animation", _Frost_Setting_Animation.GetValueInt())
	elseif option == Interface_FollowerAnimation_OID
		_Frost_Setting_FollowerAnimation.SetValueInt(2)
		SetToggleOptionValue(Interface_FollowerAnimation_OID, true)
		SaveSettingToCurrentProfile("follower_animation", _Frost_Setting_FollowerAnimation.GetValueInt())
	elseif option == Interface_ConditionMessages_OID
		_Frost_Setting_ConditionMessages.SetValueInt(2)
		SetToggleOptionValue(Interface_ConditionMessages_OID, true)
		SaveSettingToCurrentProfile("condition_messages", _Frost_Setting_ConditionMessages.GetValueInt())
	elseif option == Interface_DisplayAttributesInWeathersense_OID
		_Frost_Setting_DisplayAttributesInWeathersense.SetValueInt(1)
		SetToggleOptionValue(Interface_DisplayAttributesInWeathersense_OID, false)
		SaveSettingToCurrentProfile("display_attributes_in_weathersense", _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt())
		ForcePageReset()
	elseif option == Interface_DisplayAttributeValuesInWeathersense_OID
		_Frost_Setting_DisplayAttributeValuesInWeathersense.SetValueInt(1)
		SetToggleOptionValue(Interface_DisplayAttributeValuesInWeathersense_OID, false)
		SaveSettingToCurrentProfile("display_attribute_values_in_weathersense", _Frost_Setting_DisplayAttributeValuesInWeathersense.GetValueInt())
	elseif option == Interface_Notifications_EquipmentValues_OID
		_Frost_Setting_Notifications_EquipmentValues.SetValueInt(2)
		SetToggleOptionValue(Interface_Notifications_EquipmentValues_OID, true)
		SaveSettingToCurrentProfile("notification_equipmentvalues", _Frost_Setting_Notifications_EquipmentValues.GetValueInt())
	elseif option == Interface_Notifications_EquipmentSummary_OID
		_Frost_Setting_Notifications_EquipmentSummary.SetValueInt(2)
		SetToggleOptionValue(Interface_Notifications_EquipmentSummary_OID, true)
		SaveSettingToCurrentProfile("notification_equipmentsummary", _Frost_Setting_Notifications_EquipmentSummary.GetValueInt())
	elseif option == Gameplay_ExposurePauseCombat_OID
		_Frost_Setting_ExposurePauseCombat.SetValueInt(2)
		SetToggleOptionValue(Gameplay_ExposurePauseCombat_OID, true)
		SaveSettingToCurrentProfile("exposure_pause_combat", _Frost_Setting_ExposurePauseCombat.GetValueInt())
	elseif option == Gameplay_ExposurePauseDialogue_OID
		_Frost_Setting_ExposurePauseDialogue.SetValueInt(2)
		SetToggleOptionValue(Gameplay_ExposurePauseDialogue_OID, true)
		SaveSettingToCurrentProfile("exposure_pause_dialogue", _Frost_Setting_ExposurePauseDialogue.GetValueInt())
	elseif option == Interface_ForceFeedback_OID
		_Frost_Setting_ForceFeedback.SetValueInt(2)
		SetToggleOptionValue(Interface_ForceFeedback_OID, true)
		SaveSettingToCurrentProfile("force_feedback", _Frost_Setting_ForceFeedback.GetValueInt())
	elseif option == Interface_FrostShaderOn_OID
		_Frost_Setting_FrostShaderOn.SetValueInt(2)
		SetToggleOptionValue(Interface_FrostShaderOn_OID, true)
		SaveSettingToCurrentProfile("frost_shader_on", _Frost_Setting_FrostShaderOn.GetValueInt())
	elseif option == Interface_FullScreenEffects_OID
		_Frost_Setting_FullScreenEffects.SetValueInt(2)
		SetToggleOptionValue(Interface_FullScreenEffects_OID, true)
		SaveSettingToCurrentProfile("full_screen_effects", _Frost_Setting_FullScreenEffects.GetValueInt())
	elseif option == Gameplay_MovementPenalty_OID
		_Frost_Setting_MovementPenalty.SetValueInt(2)
		SetToggleOptionValue(Gameplay_MovementPenalty_OID, true)
		SaveSettingToCurrentProfile("movement_penalty", _Frost_Setting_MovementPenalty.GetValueInt())
	elseif option == Gameplay_DisableFT_OID
		_Frost_Setting_NoFastTravel.SetValueInt(1)
		SetToggleOptionValue(Gameplay_DisableFT_OID, false)
		SaveSettingToCurrentProfile("no_fast_travel", _Frost_Setting_NoFastTravel.GetValueInt())
	elseif option == Gameplay_DisableWaiting_OID
		_Frost_Setting_NoWaiting.SetValueInt(1)
		SetToggleOptionValue(Gameplay_DisableWaiting_OID, false)
		SaveSettingToCurrentProfile("no_waiting", _Frost_Setting_NoWaiting.GetValueInt())
	elseif option == Interface_WeatherMessages_OID
		_Frost_Setting_WeatherMessages.SetValueInt(2)
		SetToggleOptionValue(Interface_WeatherMessages_OID, true)
		SaveSettingToCurrentProfile("weather_messages", _Frost_Setting_WeatherMessages.GetValueInt())
	elseif option == Interface_WeathersenseDisplayMode_OID
		_Frost_Setting_WeathersenseDisplayMode.SetValueInt(2)
		SetMenuOptionValue(Interface_WeathersenseDisplayMode_OID, WeathersenseDisplayList[2])
		SaveSettingToCurrentProfileFloat("weathersense_display_mode", 2)
	elseif option == Interface_WetShaderOn_OID
		_Frost_Setting_WetShaderOn.SetValueInt(2)
		SetToggleOptionValue(Interface_WetShaderOn_OID, true)
		SaveSettingToCurrentProfile("wet_shader_on", _Frost_Setting_WetShaderOn.GetValueInt())
	elseif option == Gameplay_FrigidWater_OID
		_Frost_Setting_FrigidWaterIsLethal.SetValueInt(2)
		SetToggleOptionValue(Gameplay_FrigidWater_OID, true)
		SaveSettingToCurrentProfile("frigid_water_is_lethal", _Frost_Setting_FrigidWaterIsLethal.GetValueInt())
	elseif option == Interface_SoundEffects_OID
		_Frost_Setting_SoundEffects.SetValueInt(2)
		SetToggleOptionValue(Interface_SoundEffects_OID, true)
		SaveSettingToCurrentProfile("sound_effects", _Frost_Setting_SoundEffects.GetValueInt())

	elseif option == Gameplay_ExposureRate_OID
		_Frost_Setting_ExposureRate.SetValue(1.0)
		SetSliderOptionValue(Gameplay_ExposureRate_OID, 1.0, "{1}x")
		SaveSettingToCurrentProfileFloat("exposure_rate", _Frost_Setting_ExposureRate.GetValue())

	elseif option == Gameplay_MaxExposureMode_OID
		_Frost_Setting_MaxExposureMode.SetValueInt(2)
		SetMenuOptionValue(Gameplay_MaxExposureMode_OID, MaxExposureModeList[1])
		SaveSettingToCurrentProfile("max_exposure_mode", _Frost_Setting_MaxExposureMode.GetValueInt())
	elseif option == Gameplay_VampirismMode_OID
		_Frost_Setting_VampireMode.SetValueInt(1)
		SetMenuOptionValue(Gameplay_VampirismMode_OID, VampirismModeList[1])
		SaveSettingToCurrentProfile("vampire_mode", _Frost_Setting_VampireMode.GetValueInt())

	elseif option == Gameplay_WeathersenseHotkey_OID
		UnregisterForKey(_Frost_HotkeyWeathersense.GetValueInt())
		_Frost_HotkeyWeathersense.SetValue(0)
		ForcePageReset()
		PlayerRef.AddSpell(_Frost_Weathersense_Spell, false)
		SaveSettingToCurrentProfile("hotkey_weathersense", 0)

	elseif option == Meters_UIMeterDisplay_OID
		SetMenuOptionValue(Meters_UIMeterDisplay_OID, MeterDisplayModeList[2])
		_Frost_Setting_MeterDisplayMode.SetValueInt(2)
		SaveSettingToCurrentProfile("meter_display_mode", 2)
		RemoveAllMeters()
	elseif option == Meters_UIMeterDisplayTime_OID
		_Frost_Setting_MeterDisplayTime.SetValueInt(4)
		SetSliderOptionValue(Meters_UIMeterDisplayTime_OID, _Frost_Setting_MeterDisplayTime.GetValueInt(), "{0}")
		SaveSettingToCurrentProfile("meter_display_time", 4)
	elseif option == Meters_UIMeterColor_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureColor.SetValueInt(0x93D0FF)
			SetColorOptionValue(option, _Frost_Setting_MeterExposureColor.GetValueInt())
			if !IsMeterInverted(ExposureMeterHandler as CommonMeterInterfaceHandler)
				ExposureMeterHandler.SetMeterColors(_Frost_Setting_MeterExposureColor.GetValueInt(), -1)
			endif
			SaveSettingToCurrentProfile("exposure_meter_color", _Frost_Setting_MeterExposureColor.GetValueInt())
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessColor.SetValueInt(0x2469F4)
			SetColorOptionValue(option, _Frost_Setting_MeterWetnessColor.GetValueInt())
			WetnessMeterHandler.SetMeterColors(_Frost_Setting_MeterWetnessColor.GetValueInt(), -1)
			SaveSettingToCurrentProfile("wetness_meter_color", _Frost_Setting_MeterWetnessColor.GetValueInt())
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseColor.SetValueInt(0xFDC327)
			SetColorOptionValue(option, _Frost_Setting_MeterWeathersenseColor.GetValueInt())
			WeathersenseMeterHandler.SetMeterColors(_Frost_Setting_MeterWeathersenseColor.GetValueInt(), -1)
			SaveSettingToCurrentProfile("weathersense_meter_color", _Frost_Setting_MeterWeathersenseColor.GetValueInt())
		endif
	elseif option == Meters_UIMeterColorAlt_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureColorWarm.SetValueInt(0xCC0000)
			SetColorOptionValue(option, _Frost_Setting_MeterExposureColorWarm.GetValueInt())
			if IsMeterInverted(ExposureMeterHandler as CommonMeterInterfaceHandler)
				ExposureMeterHandler.SetMeterColors(_Frost_Setting_MeterExposureColorWarm.GetValueInt(), -1)
			endif
			SaveSettingToCurrentProfile("exposure_meter_color_warm", _Frost_Setting_MeterExposureColorWarm.GetValueInt())
		endif
	elseif option == Meters_UIMeterOpacity_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureOpacity.SetValue(100.0)
			SetSliderOptionValue(Meters_UIMeterOpacity_OID, 100.0, "{0}%")
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfileFloat("exposure_meter_opacity", 100.0)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessOpacity.SetValue(100.0)
			SetSliderOptionValue(Meters_UIMeterOpacity_OID, 100.0, "{0}%")
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_opacity", 100.0)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseOpacity.SetValue(100.0)
			SetSliderOptionValue(Meters_UIMeterOpacity_OID, 100.0, "{0}%")
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_opacity", 100.0)
		endif
	elseif option == Meters_UIMeterScale_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
			_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
			SetSliderOptionValue(Meters_UIMeterScale_OID, 1.0, "{2}")
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfileFloat("exposure_meter_height", NORMAL_METER_HEIGHT)
			SaveSettingToCurrentProfileFloat("exposure_meter_width", NORMAL_METER_WIDTH)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			if _Frost_Setting_MeterWetnessHeight.GetValue() > 0
				_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT)
			else
				_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV)
			endif
			_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
			SetSliderOptionValue(Meters_UIMeterScale_OID, 1.0, "{2}")
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_height", CHARGE_METER_HEIGHT_INV)
			SaveSettingToCurrentProfileFloat("wetness_meter_width", CHARGE_METER_WIDTH)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			if _Frost_Setting_MeterWeathersenseHeight.GetValue() > 0
				_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT)
			else
				_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV)
			endif
			_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
			SetSliderOptionValue(Meters_UIMeterScale_OID, 1.0, "{2}")
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_height", CHARGE_METER_HEIGHT_INV)
			SaveSettingToCurrentProfileFloat("weathersense_meter_width", CHARGE_METER_WIDTH)
		endif
	elseif option == Meters_UIMeterXPos_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_TOPRIGHT_16_9_X)
			SetSliderOptionValue(Meters_UIMeterXPos_OID, EXPOSURE_METER_TOPRIGHT_16_9_X, "{1}")
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfileFloat("exposure_meter_xpos", EXPOSURE_METER_TOPRIGHT_16_9_X)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_TOPRIGHT_16_9_X)
			SetSliderOptionValue(Meters_UIMeterXPos_OID, WETNESS_METER_TOPRIGHT_16_9_X, "{1}")
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_xpos", WETNESS_METER_TOPRIGHT_16_9_X)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_TOPRIGHT_16_9_X)
			SetSliderOptionValue(Meters_UIMeterXPos_OID, WEATHERSENSE_METER_TOPRIGHT_16_9_X, "{1}")
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_xpos", WEATHERSENSE_METER_TOPRIGHT_16_9_X)
		endif
	elseif option == Meters_UIMeterYPos_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_TOPRIGHT_16_9_X)
			SetSliderOptionValue(Meters_UIMeterYPos_OID, EXPOSURE_METER_TOPRIGHT_16_9_Y, "{1}")
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfileFloat("exposure_meter_ypos", EXPOSURE_METER_TOPRIGHT_16_9_Y)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_TOPRIGHT_16_9_Y)
			SetSliderOptionValue(Meters_UIMeterYPos_OID, WETNESS_METER_TOPRIGHT_16_9_Y, "{1}")
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_ypos", WETNESS_METER_TOPRIGHT_16_9_Y)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_TOPRIGHT_16_9_Y)
			SetSliderOptionValue(Meters_UIMeterYPos_OID, WEATHERSENSE_METER_TOPRIGHT_16_9_Y, "{1}")
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_ypos", WEATHERSENSE_METER_TOPRIGHT_16_9_Y)
		endif
	endif
endEvent

Event OnOptionHighlight(int option)
	if option == Overview_RunStatusText_OID
		SetInfoText("$FrostfallOptionHighlightRunStatus")
	elseif option == Overview_ExposureStatusText_OID
		SetInfoText("$FrostfallOptionHighlightStatExposure")
	elseif option == Overview_WetnessStatusText_OID
		SetInfoText("$FrostfallOptionHighlightStatWetness")
	elseif option == Overview_WarmthStatusText_OID
		SetInfoText("$FrostfallOptionHighlightStatWarmth")
	elseif option == Overview_CoverageStatusText_OID
		SetInfoText("$FrostfallOptionHighlightStatCoverage")
	elseif option == Gameplay_ExposureRate_OID
		SetInfoText("$FrostfallOptionHighlightSettingExposureRateSlider")
	elseif option == Gameplay_MaxExposureMode_OID
		SetInfoText("$FrostfallOptionHighlightSettingMaxExposure")
	elseif option == Gameplay_FrigidWater_OID
		SetInfoText("$FrostfallOptionHighlightSettingExposureWaterText")
	elseif option == Gameplay_ExposurePauseDialogue_OID
		SetInfoText("$FrostfallOptionHighlightSettingExposureDialogueText")
	elseif option == Gameplay_ExposurePauseCombat_OID
		SetInfoText("$FrostfallOptionHighlightSettingExposureCombatText")
	elseif option == Gameplay_MovementPenalty_OID
		SetInfoText("$FrostfallOptionHighlightSettingMovementText")
	elseif option == Gameplay_VampirismMode_OID
		SetInfoText("$FrostfallOptionHighlightSettingVampirism")
	elseif option == Interface_WeathersenseDisplayMode_OID
		SetInfoText("$FrostfallInterfaceSettingWeathersenseDisplayModeHighlight")
	elseif option == Gameplay_DisableFT_OID
		SetInfoText("$FrostfallOptionHighlightSettingFTToggleText")
	elseif option == Gameplay_DisableWaiting_OID
		SetInfoText("$FrostfallOptionHighlightSettingWaitToggleText")
	elseif option == Gameplay_WeathersenseHotkey_OID
		SetInfoText("$FrostfallOptionHighlightHKWeathersense")
	elseif option == SaveLoad_SelectProfile_OID
		SetInfoText("$FrostfallOptionHighlightSettingSelectProfile")
	elseif option == SaveLoad_RenameProfile_OID
		SetInfoText("$FrostfallOptionHighlightSettingRenameProfile")
	elseif option == SaveLoad_DefaultProfile_OID
		SetInfoText("$FrostfallOptionHighlightSettingDefaultProfile")
	elseif option == SaveLoad_Enable_OID
		SetInfoText("$FrostfallOptionHighlightSettingEnableSaveLoad")
	elseif option == Interface_FrostShaderOn_OID
		SetInfoText("$FrostfallOptionHighlightSettingFrostShaderToggle")
	elseif option == Interface_WetShaderOn_OID
		SetInfoText("$FrostfallOptionHighlightSettingWetShaderToggle")
	elseif option == Interface_SoundEffects_OID
		SetInfoText("$FrostfallOptionHighlightSoundEffects")
	elseif option == Interface_FullScreenEffects_OID
		SetInfoText("$FrostfallOptionHighlightSettingFullScreenEffectsToggle")
	elseif option == Interface_ForceFeedback_OID
		SetInfoText("$FrostfallOptionHighlightForceFeedback")
	elseif option == Interface_Animation_OID
		SetInfoText("$FrostfallOptionHighlightAnimation")
	elseif option == Interface_FollowerAnimation_OID
		SetInfoText("$FrostfallOptionHighlightFollowerAnimation")
	elseif option == Interface_ConditionMessages_OID
		SetInfoText("$FrostfallOptionHighlightSettingConditionMsgToggle")
	elseif option == Interface_WeatherMessages_OID
		SetInfoText("$FrostfallOptionHighlightSettingWeatherMsgToggle")
	elseif option == Interface_DisplayAttributesInWeathersense_OID
		SetInfoText("$FrostfallOptionHighlightSettingExpValueMsgToggle")
	elseif option == Interface_DisplayAttributeValuesInWeathersense_OID
		SetInfoText("$FrostfallOptionHighlightSettingExpValueMsgDetailToggle")
	elseif option == Interface_Notifications_EquipmentValues_OID
		SetInfoText("$FrostfallOptionHighlightSettingEquipValuesMsgToggle")
	elseif option == Interface_Notifications_EquipmentSummary_OID
		SetInfoText("$FrostfallOptionHighlightSettingEquipSummaryMsgToggle")
	elseif option == Advanced_EnduranceSkillRespec_OID
		SetInfoText("$FrostfallOptionHighlightSettingRespec")
	elseif option == Advanced_EnduranceSkillRestore_OID
		SetInfoText("$FrostfallOptionHighlightSettingRestore")
	elseif option == Armor_RepairDefaultsOID
		SetInfoText("$FrostfallOptionHighlightArmorRepairDefaults")
	elseif option == Armor_DefaultWornArmorOID
		SetInfoText("$FrostfallOptionHighlightArmorDefaultWornArmor")
	elseif option == Armor_DefaultAllArmorOID
		SetInfoText("$FrostfallOptionHighlightArmorDefaultAllArmor")
	elseif option == Armor_ShowTutorialOID
		SetInfoText("$FrostfallOptionHighlightArmorShowTutorial")
	elseif option == Meters_UIMeterDisplay_OID
		SetInfoText("$FrostfallOptionHightlightUIMeterDisplay")
	elseif option == Meters_UIMeterLayout_OID
		SetInfoText("$FrostfallMeterLayoutHighlight")
	elseif option == Meters_UIMeterOpacity_OID
		SetInfoText("$FrostfallMeterOpacityHighlight")
	elseif option == Meters_UIMeterDisplayTime_OID
		SetInfoText("$FrostfallOptionHightlightUIMeterDisplayTime")
	elseif option == Meters_UIMeterFillDirection_OID
		SetInfoText("$FrostfallMeterFillDirectionHighlight")
	elseif option == Meters_UIMeterScale_OID
		SetInfoText("$FrostfallMeterScaleHighlight")
	elseif option == Meters_UIMeterFlipped_OID
		SetInfoText("$FrostfallMeterFlippedHighlight")
	elseif option == Meters_UIMeterColor_OID || option == Meters_UIMeterColorAlt_OID
		SetInfoText("$FrostfallMeterColorHighlight")
	elseif option == Meters_UIMeterXPos_OID
		SetInfoText("$FrostfallMeterXPosHighlight")
	elseif option == Meters_UIMeterYPos_OID
		SetInfoText("$FrostfallMeterYPosHighlight")
	elseif option == Meters_UIMeterHAnchor_OID
		SetInfoText("$FrostfallMeterHAnchorHighlight")
	elseif option == Meters_UIMeterVAnchor_OID
		SetInfoText("$FrostfallMeterVAnchorHighlight")
	else
		bool found_armor_entry_oid = false
		int idx = -1

		if !found_armor_entry_oid
			idx = Armor_WarmthSliderOIDs.Find(option)
			if idx != -1
				SetInfoText("$FrostfallOptionHighlightArmorWarmthSlider")
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_CoverageSliderOIDs.Find(option)
			if idx != -1
				SetInfoText("$FrostfallOptionHighlightArmorCoverageSlider")
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_GearTypeOIDs.Find(option)
			if idx != -1
				SetInfoText("$FrostfallOptionHighlightArmorTypeMenu")
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_SetProtectionOIDs.Find(option)
			if idx != -1
				SetInfoText("$FrostfallOptionHighlightArmorEditProtectionMenu")
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_ModifyPartsOIDs.Find(option)
			if idx != -1
				SetInfoText("$FrostfallOptionHighlightArmorExtraPartsMenu")
				found_armor_entry_oid = true
			endif
		endif
	endif
EndEvent

Event OnOptionSliderOpen(int option)
	if option == Gameplay_ExposureRate_OID
		SetSliderDialogStartValue(_Frost_Setting_ExposureRate.GetValue())
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 3.0)
		SetSliderDialogInterval(0.1)
	elseif option == Advanced_EnduranceSkillRestoreSlider_OID
		SetSliderDialogStartValue(0.0)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0, EndurancePerkPointsTotal.GetValue())
		SetSliderDialogInterval(1.0)
	elseif option == Meters_UIMeterDisplayTime_OID
		SetSliderDialogStartValue(_Frost_Setting_MeterDisplayTime.GetValueInt() * 2)
		SetSliderDialogDefaultValue(8.0)
		SetSliderDialogRange(4.0, 20.0)
		SetSliderDialogInterval(2.0)
	elseif option == Meters_UIMeterOpacity_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			SetSliderDialogStartValue(_Frost_Setting_MeterExposureOpacity.GetValue())
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			SetSliderDialogStartValue(_Frost_Setting_MeterWetnessOpacity.GetValue())
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			SetSliderDialogStartValue(_Frost_Setting_MeterWeathersenseOpacity.GetValue())
			SetSliderDialogDefaultValue(100.0)
			SetSliderDialogRange(0.0, 100.0)
			SetSliderDialogInterval(1.0)
		endif
	elseif option == Meters_UIMeterScale_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			SetSliderDialogStartValue(GetMeterScale(_Frost_Setting_MeterExposureWidth.GetValue(), NORMAL_METER_WIDTH))
			SetSliderDialogDefaultValue(1.0)
			SetSliderDialogRange(0.0, 1.0)
			SetSliderDialogInterval(0.05)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			SetSliderDialogStartValue(GetMeterScale(_Frost_Setting_MeterWetnessWidth.GetValue(), CHARGE_METER_WIDTH))
			SetSliderDialogDefaultValue(1.0)
			SetSliderDialogRange(0.0, 1.0)
			SetSliderDialogInterval(0.05)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			SetSliderDialogStartValue(GetMeterScale(_Frost_Setting_MeterWeathersenseWidth.GetValue(), CHARGE_METER_WIDTH))
			SetSliderDialogDefaultValue(1.0)
			SetSliderDialogRange(0.0, 1.0)
			SetSliderDialogInterval(0.05)
		endif
	elseif option == Meters_UIMeterXPos_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			SetSliderDialogStartValue(_Frost_Setting_MeterExposureXPos.GetValue())
			SetSliderDialogDefaultValue(EXPOSURE_METER_BOTTOMRIGHT_16_9_X)
			SetSliderDialogRange(0.0, 1280.0)
			SetSliderDialogInterval(0.1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			SetSliderDialogStartValue(_Frost_Setting_MeterWetnessXPos.GetValue())
			SetSliderDialogDefaultValue(WETNESS_METER_BOTTOMRIGHT_16_9_X)
			SetSliderDialogRange(0.0, 1800.0)
			SetSliderDialogInterval(0.1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			SetSliderDialogStartValue(_Frost_Setting_MeterWeathersenseXPos.GetValue())
			SetSliderDialogDefaultValue(WEATHERSENSE_METER_BOTTOMRIGHT_16_9_X)
			SetSliderDialogRange(0.0, 1800.0)
			SetSliderDialogInterval(0.1)
		endif
	elseif option == Meters_UIMeterYPos_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			SetSliderDialogStartValue(_Frost_Setting_MeterExposureYPos.GetValue())
			SetSliderDialogDefaultValue(EXPOSURE_METER_BOTTOMRIGHT_16_9_Y)
			SetSliderDialogRange(0.0, 720.0)
			SetSliderDialogInterval(0.1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			SetSliderDialogStartValue(_Frost_Setting_MeterWetnessYPos.GetValue())
			SetSliderDialogDefaultValue(WETNESS_METER_BOTTOMRIGHT_16_9_Y)
			SetSliderDialogRange(0.0, 726.5)
			SetSliderDialogInterval(0.1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			SetSliderDialogStartValue(_Frost_Setting_MeterWeathersenseYPos.GetValue())
			SetSliderDialogDefaultValue(WEATHERSENSE_METER_BOTTOMRIGHT_16_9_Y)
			SetSliderDialogRange(0.0, 726.5)
			SetSliderDialogInterval(0.1)
		endif
	else
		bool found_armor_entry_oid = false
		int idx = -1

		if !found_armor_entry_oid
			idx = Armor_WarmthSliderOIDs.Find(option)
			if idx != -1
				SetWarmthSlider(idx)
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_CoverageSliderOIDs.Find(option)
			if idx != -1
				SetCoverageSlider(idx)
				found_armor_entry_oid = true
			endif
		endif

	endif
EndEvent

Event OnOptionSliderAccept(int option, float value)
	if option == Gameplay_ExposureRate_OID
		_Frost_Setting_ExposureRate.SetValue(value)
		SetSliderOptionValue(Gameplay_ExposureRate_OID, value, "{1}x")
		SaveSettingToCurrentProfileFloat("exposure_rate", _Frost_Setting_ExposureRate.GetValue())
	elseif option == Advanced_EnduranceSkillRestoreSlider_OID
		EndurancePerkPointProgress.SetValue(0.0)
		EndurancePerkPoints.SetValue(value)
		EndurancePerkPointsEarned.SetValue(value)
		ClearEndurancePerks()
		ShowMessage("$FrostfallAdvancedEnduranceSkillRestoreDone", false)
		SetOptionFlags(Advanced_EnduranceSkillRestoreSlider_OID, OPTION_FLAG_DISABLED, true)
		SetToggleOptionValue(Advanced_EnduranceSkillRestore_OID, false)
	elseif option == Meters_UIMeterDisplayTime_OID
		_Frost_Setting_MeterDisplayTime.SetValue(value/2)
		SetSliderOptionValue(Meters_UIMeterDisplayTime_OID, value, "{0}")
		SaveSettingToCurrentProfile("meter_display_time", _Frost_Setting_MeterDisplayTime.GetValueInt())
	elseif option == Meters_UIMeterOpacity_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureOpacity.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterOpacity_OID, value, "{0}%")
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfileFloat("exposure_meter_opacity", value)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessOpacity.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterOpacity_OID, value, "{0}%")
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_opacity", value)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseOpacity.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterOpacity_OID, value, "{0}%")
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_opacity", value)
		endif
	elseif option == Meters_UIMeterScale_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT * value)
			_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH * value)
			SetSliderOptionValue(Meters_UIMeterScale_OID, value, "{2}")
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfileFloat("exposure_meter_height", _Frost_Setting_MeterExposureHeight.GetValue())
			SaveSettingToCurrentProfileFloat("exposure_meter_width", _Frost_Setting_MeterExposureWidth.GetValue())
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			if _Frost_Setting_MeterWetnessHeight.GetValue() > 0
				_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT * value)
			else
				_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV * value)
			endif
			_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH * value)
			SetSliderOptionValue(Meters_UIMeterScale_OID, value, "{2}")
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_height", _Frost_Setting_MeterWetnessHeight.GetValue())
			SaveSettingToCurrentProfileFloat("wetness_meter_width", _Frost_Setting_MeterWetnessWidth.GetValue())
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			if _Frost_Setting_MeterWeathersenseHeight.GetValue() > 0
				_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT * value)
			else
				_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV * value)
			endif
			_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH * value)
			SetSliderOptionValue(Meters_UIMeterScale_OID, value, "{2}")
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_height", _Frost_Setting_MeterWeathersenseHeight.GetValue())
			SaveSettingToCurrentProfileFloat("weathersense_meter_width", _Frost_Setting_MeterWeathersenseWidth.GetValue())
		endif
	elseif option == Meters_UIMeterXPos_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureXPos.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterXPos_OID, value, "{1}")
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfileFloat("exposure_meter_xpos", value)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessXPos.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterXPos_OID, value, "{1}")
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_xpos", value)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseXPos.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterXPos_OID, value, "{1}")
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_xpos", value)
		endif
	elseif option == Meters_UIMeterYPos_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureYPos.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterYPos_OID, value, "{1}")
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfileFloat("exposure_meter_ypos", value)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessYPos.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterYPos_OID, value, "{1}")
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfileFloat("wetness_meter_ypos", value)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseYPos.SetValue(value)
			SetSliderOptionValue(Meters_UIMeterYPos_OID, value, "{1}")
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfileFloat("weathersense_meter_ypos", value)
		endif
	else
		bool found_armor_entry_oid = false
		int idx = -1

		if !found_armor_entry_oid
			idx = Armor_WarmthSliderOIDs.Find(option)
			if idx != -1
				ModifyGearWarmth(idx, value as int)
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_CoverageSliderOIDs.Find(option)
			if idx != -1
				ModifyGearCoverage(idx, value as int)
				found_armor_entry_oid = true
			endif
		endif
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
	elseif option == Interface_WeathersenseDisplayMode_OID
		SetMenuDialogOptions(WeathersenseDisplayList)
		SetMenuDialogStartIndex(_Frost_Setting_WeathersenseDisplayMode.GetValueInt())
		SetMenuDialogDefaultIndex(2)
	elseif option == Interface_Animation_OID
		SetMenuDialogOptions(AnimationList)
		SetMenuDialogStartIndex(_Frost_Setting_Animation.GetValueInt() - 1)
		SetMenuDialogDefaultIndex(1)
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
	elseif option == Meters_UIMeterDisplay_OID
		SetMenuDialogOptions(MeterDisplayModeList)
		SetMenuDialogStartIndex(_Frost_Setting_MeterDisplayMode.GetValueInt())
		SetMenuDialogDefaultIndex(0)
	elseif option == Meters_UIMeterLayout_OID
		SetMenuDialogOptions(MeterLayoutList)
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
	elseif option == Meters_UIMeterFillDirection_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			SetMenuDialogOptions(FillDirectionListLimited)
			SetMenuDialogStartIndex(_Frost_Setting_MeterExposureFillDirection.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			SetMenuDialogOptions(FillDirectionListLimited)
			SetMenuDialogStartIndex(_Frost_Setting_MeterWetnessFillDirection.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			SetMenuDialogOptions(FillDirectionList)
			SetMenuDialogStartIndex(_Frost_Setting_MeterWeathersenseFillDirection.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		endif
	elseif option == Meters_UIMeterHAnchor_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			SetMenuDialogOptions(HorizontalAnchorList)
			SetMenuDialogStartIndex(_Frost_Setting_MeterExposureHAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			SetMenuDialogOptions(HorizontalAnchorList)
			SetMenuDialogStartIndex(_Frost_Setting_MeterWetnessHAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			SetMenuDialogOptions(HorizontalAnchorList)
			SetMenuDialogStartIndex(_Frost_Setting_MeterWeathersenseHAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		endif
	elseif option == Meters_UIMeterVAnchor_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			SetMenuDialogOptions(VerticalAnchorList)
			SetMenuDialogStartIndex(_Frost_Setting_MeterExposureVAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			SetMenuDialogOptions(VerticalAnchorList)
			SetMenuDialogStartIndex(_Frost_Setting_MeterWetnessVAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			SetMenuDialogOptions(VerticalAnchorList)
			SetMenuDialogStartIndex(_Frost_Setting_MeterWeathersenseVAnchor.GetValueInt())
			SetMenuDialogDefaultIndex(1)
		endif
	else
		bool found_armor_entry_oid = false
		int idx = -1

		if !found_armor_entry_oid
			idx = Armor_GearTypeOIDs.Find(option)
			if idx != -1
				SetMenuDialogOptions(GearTypeList)
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_SetProtectionOIDs.Find(option)
			if idx != -1
				SetMenuDialogOptions(ProtectionList)
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_ModifyPartsOIDs.Find(option)
			if idx != -1
				SetMenuDialogOptions(GetExtraPartChoiceList(idx))
				found_armor_entry_oid = true
			endif
		endif
	endif
EndEvent

Event OnOptionMenuAccept(int option, int index)
	if option == Gameplay_MaxExposureMode_OID
		SetMenuOptionValue(Gameplay_MaxExposureMode_OID, MaxExposureModeList[index])
		_Frost_Setting_MaxExposureMode.SetValueInt(index + 1)
		SaveSettingToCurrentProfile("max_exposure_mode", _Frost_Setting_MaxExposureMode.GetValueInt())
	elseif option == Interface_WeathersenseDisplayMode_OID
		SetMenuOptionValue(Interface_WeathersenseDisplayMode_OID, WeathersenseDisplayList[index])
		_Frost_Setting_WeathersenseDisplayMode.SetValueInt(index)
		SaveSettingToCurrentProfile("weathersense_display_mode", _Frost_Setting_WeathersenseDisplayMode.GetValueInt())
	elseif option == Interface_Animation_OID
		SetMenuOptionValue(Interface_Animation_OID, AnimationList[index])
		_Frost_Setting_Animation.SetValueInt(index + 1)
		SaveSettingToCurrentProfile("animation", _Frost_Setting_Animation.GetValueInt())
	elseif option == Gameplay_VampirismMode_OID
		SetMenuOptionValue(Gameplay_VampirismMode_OID, VampirismModeList[index])
		_Frost_Setting_VampireMode.SetValueInt(index)
		SaveSettingToCurrentProfile("vampire_mode", _Frost_Setting_VampireMode.GetValueInt())
	elseif option == SaveLoad_SelectProfile_OID
		bool b = ShowMessage("$FrostfallSaveLoadConfirm")
		if b
			SwitchToProfile(index + 1)
			ForcePageReset()
		endif
	elseif option == Meters_UIMeterDisplay_OID
		SetMenuOptionValue(Meters_UIMeterDisplay_OID, MeterDisplayModeList[index])
		_Frost_Setting_MeterDisplayMode.SetValueInt(index)
		if index == 1
			ForceAllMeters()
		else
			RemoveAllMeters()
		endif
		SaveSettingToCurrentProfile("meter_display_mode", _Frost_Setting_MeterDisplayMode.GetValueInt())
	elseif option == Meters_UIMeterLayout_OID
		bool result = ShowMessage("$FrostfallInterfaceSettingUIMeterLayoutConfirm")
		if result == true
			ApplyMeterPreset(index)
			ShowMessage("$FrostfallInterfaceSettingUIMeterLayoutConfirmDone", false)
			SaveAllSettings(_Frost_Setting_CurrentProfile.GetValueInt())
			ForcePageReset()
		endif
	elseif option == Meters_UIMeterFillDirection_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureFillDirection.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterFillDirection_OID, FillDirectionListLimited[index])
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfile("exposure_meter_fill_direction", index)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessFillDirection.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterFillDirection_OID, FillDirectionListLimited[index])
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfile("wetness_meter_fill_direction", index)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterFillDirection_OID, FillDirectionList[index])
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfile("weathersense_meter_fill_direction", index)
		endif
	elseif option == Meters_UIMeterHAnchor_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureHAnchor.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterHAnchor_OID, HorizontalAnchorList[index])
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfile("exposure_meter_hanchor", index)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessHAnchor.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterHAnchor_OID, HorizontalAnchorList[index])
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfile("wetness_meter_hanchor", index)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterHAnchor_OID, HorizontalAnchorList[index])
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfile("weathersense_meter_hanchor", index)
		endif
	elseif option == Meters_UIMeterVAnchor_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureVAnchor.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterVAnchor_OID, VerticalAnchorList[index])
			UpdateMeterConfiguration(0)
			SaveSettingToCurrentProfile("exposure_meter_vanchor", index)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessVAnchor.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterVAnchor_OID, VerticalAnchorList[index])
			UpdateMeterConfiguration(1)
			SaveSettingToCurrentProfile("wetness_meter_vanchor", index)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(index)
			SetMenuOptionValue(Meters_UIMeterVAnchor_OID, VerticalAnchorList[index])
			UpdateMeterConfiguration(2)
			SaveSettingToCurrentProfile("weathersense_meter_vanchor", index)
		endif
	else
		bool found_armor_entry_oid = false
		int idx = -1

		if !found_armor_entry_oid
			idx = Armor_GearTypeOIDs.Find(option)
			if idx != -1
				ModifyGearType(idx, index)
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_SetProtectionOIDs.Find(option)
			if idx != -1
				ModifyGearProtection(idx, index)
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_ModifyPartsOIDs.Find(option)
			if idx != -1
				ModifyGearExtraParts(idx, index)
				found_armor_entry_oid = true
			endif
		endif
	endif
EndEvent

event OnOptionColorAccept(int option, int color)
	if option == Meters_UIMeterColor_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureColor.SetValueInt(color)
			SetColorOptionValue(option, color)
			if !IsMeterInverted(ExposureMeterHandler as CommonMeterInterfaceHandler)
				ExposureMeterHandler.SetMeterColors(_Frost_Setting_MeterExposureColor.GetValueInt(), -1)
			endif
			SaveSettingToCurrentProfile("exposure_meter_color", color)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WETNESS
			_Frost_Setting_MeterWetnessColor.SetValueInt(color)
			SetColorOptionValue(option, color)
			WetnessMeterHandler.SetMeterColors(color, -1)
			SaveSettingToCurrentProfile("wetness_meter_color", color)
		elseif meter_being_configured == METER_BEING_CONFIGURED_WEATHERSENSE
			_Frost_Setting_MeterWeathersenseColor.SetValueInt(color)
			SetColorOptionValue(option, color)
			WeathersenseMeterHandler.SetMeterColors(color, -1)
			SaveSettingToCurrentProfile("weathersense_meter_color", color)
		endif
	elseif option == Meters_UIMeterColorAlt_OID
		if meter_being_configured == METER_BEING_CONFIGURED_EXPOSURE
			_Frost_Setting_MeterExposureColorWarm.SetValueInt(color)
			SetColorOptionValue(option, color)
			if IsMeterInverted(ExposureMeterHandler as CommonMeterInterfaceHandler)
				ExposureMeterHandler.SetMeterColors(color, -1)
			endif
			SaveSettingToCurrentProfile("exposure_meter_color", color)
		endif
	endif
endEvent

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

event OnOptionInputOpen(int option)
	if option == SaveLoad_RenameProfile_OID
		SetInputDialogStartText(GetProfileName(_Frost_Setting_CurrentProfile.GetValueInt()))
	endif
endEvent

event OnOptionInputAccept(int option, string str)
	if option == SaveLoad_RenameProfile_OID
		if str != ""
			string profile_path = CONFIG_PATH + "profile" + _Frost_Setting_CurrentProfile.GetValueInt()
			JsonUtil.SetStringValue(profile_path, "profile_name", str)
			JsonUtil.Save(profile_path)
			ForcePageReset()
		else
			ShowMessage("$FrostfallSaveLoadRenameErrorBlank", false)
		endif
	endif
endEvent

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

string function GetProfileName(int aiProfileIndex)
	return JsonUtil.GetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", missing = "Profile " + aiProfileIndex)
endFunction

function SwitchToProfile(int aiProfileIndex)
	_Frost_Setting_CurrentProfile.SetValueInt(aiProfileIndex)
	JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", aiProfileIndex)
	JsonUtil.Save(CONFIG_PATH + "common")

	string pname = JsonUtil.GetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", "")
	if pname == ""
		GenerateDefaultProfile(aiProfileIndex)
	endif
	CleanProfile(aiProfileIndex)

	int val = LoadSettingFromProfile(aiProfileIndex, "animation")
	if val != -1
		_Frost_Setting_Animation.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "follower_animation")
	if val != -1
		_Frost_Setting_FollowerAnimation.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "condition_messages")
	if val != -1
		_Frost_Setting_ConditionMessages.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "display_attributes_in_weathersense")
	if val != -1
		_Frost_Setting_DisplayAttributesInWeathersense.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "display_attribute_values_in_weathersense")
	if val != -1
		_Frost_Setting_DisplayAttributeValuesInWeathersense.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "notification_equipmentvalues")
	if val != -1
		_Frost_Setting_Notifications_EquipmentValues.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "notification_equipmentsummary")
	if val != -1
		_Frost_Setting_Notifications_EquipmentSummary.SetValueInt(val)
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

	val = LoadSettingFromProfile(aiProfileIndex, "exposure_meter_color")
	if val != -1
		_Frost_Setting_MeterExposureColor.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "exposure_meter_color_warm")
	if val != -1
		_Frost_Setting_MeterExposureColorWarm.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "exposure_meter_fill_direction")
	if val != -1
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "exposure_meter_hanchor")
	if val != -1
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "exposure_meter_vanchor")
	if val != -1
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "wetness_meter_color")
	if val != -1
		_Frost_Setting_MeterWetnessColor.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "wetness_meter_fill_direction")
	if val != -1
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "wetness_meter_hanchor")
	if val != -1
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "wetness_meter_vanchor")
	if val != -1
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "weathersense_meter_color")
	if val != -1
		_Frost_Setting_MeterWeathersenseColor.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "weathersense_meter_fill_direction")
	if val != -1
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "weathersense_meter_hanchor")
	if val != -1
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "weathersense_meter_vanchor")
	if val != -1
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(val)
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
	val = LoadSettingFromProfile(aiProfileIndex, "display_tutorials")
	if val != -1
		_Frost_Setting_DisplayTutorials.SetValueInt(val)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "exposure_meter_opacity")
	if fval != -1.0
		_Frost_Setting_MeterExposureOpacity.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "exposure_meter_height")
	if fval != -1.0
		_Frost_Setting_MeterExposureHeight.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "exposure_meter_width")
	if fval != -1.0
		_Frost_Setting_MeterExposureWidth.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "exposure_meter_xpos")
	if fval != -1.0
		_Frost_Setting_MeterExposureXPos.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "exposure_meter_ypos")
	if fval != -1.0
		_Frost_Setting_MeterExposureYPos.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "wetness_meter_opacity")
	if fval != -1.0
		_Frost_Setting_MeterWetnessOpacity.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "wetness_meter_height")
	if fval != -1.0
		_Frost_Setting_MeterWetnessHeight.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "wetness_meter_width")
	if fval != -1.0
		_Frost_Setting_MeterWetnessWidth.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "wetness_meter_xpos")
	if fval != -1.0
		_Frost_Setting_MeterWetnessXPos.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "wetness_meter_ypos")
	if fval != -1.0
		_Frost_Setting_MeterWetnessYPos.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "weathersense_meter_opacity")
	if fval != -1.0
		_Frost_Setting_MeterWeathersenseOpacity.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "weathersense_meter_height")
	if fval != -1.0
		_Frost_Setting_MeterWeathersenseHeight.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "weathersense_meter_width")
	if fval != -1.0
		_Frost_Setting_MeterWeathersenseWidth.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "weathersense_meter_xpos")
	if fval != -1.0
		_Frost_Setting_MeterWeathersenseXPos.SetValue(fval)
	endif
	fval = LoadSettingFromProfileFloat(aiProfileIndex, "weathersense_meter_ypos")
	if fval != -1.0
		_Frost_Setting_MeterWeathersenseYPos.SetValue(fval)
	endif

	; Wait for the meters to initialize before setting their values
	int i = 0
	while !ExposureMeter.Ready && i < 50
		Utility.Wait(0.2)
		i += 1
	endWhile
	if !IsMeterInverted(ExposureMeterHandler as CommonMeterInterfaceHandler)
		ExposureMeterHandler.SetMeterColors(_Frost_Setting_MeterExposureColor.GetValueInt(), -1)
	else
		ExposureMeterHandler.SetMeterColors(_Frost_Setting_MeterExposureColorWarm.GetValueInt(), -1)
	endif
	UpdateMeterConfiguration(0)

	i = 0
	while !WetnessMeter.Ready && i < 50
		Utility.Wait(0.2)
		i += 1
	endWhile
	WetnessMeterHandler.SetMeterColors(_Frost_Setting_MeterWetnessColor.GetValueInt(), -1)
	UpdateMeterConfiguration(1)

	i = 0
	while !WeathersenseMeter.Ready && i < 50
		Utility.Wait(0.2)
		i += 1
	endWhile
	WeathersenseMeterHandler.SetMeterColors(_Frost_Setting_MeterWeathersenseColor.GetValueInt(), -1)
	UpdateMeterConfiguration(2)

	ForceAllMeters()

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

	; Update the player's currently worn armor values.
	_Frost_ClothingSystem clothing = GetClothingSystem()
	clothing.RefreshWornGearData(clothing.WornGearMainForms, clothing.WornGearForms, clothing._Frost_WornGearData)
	clothing.SendEvent_UpdateWarmthAndCoverage(false)
endFunction

function GenerateDefaultProfile(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex
	JsonUtil.SetStringValue(profile_path, "profile_name", "Profile " + aiProfileIndex)
	JsonUtil.SetIntValue(profile_path, "profile_version", _Frost_SettingsProfileVersion.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "animation", 2)
	JsonUtil.SetIntValue(profile_path, "follower_animation", 2)
	JsonUtil.SetIntValue(profile_path, "condition_messages", 2)
	JsonUtil.SetIntValue(profile_path, "display_attributes_in_weathersense", 1)
	JsonUtil.SetIntValue(profile_path, "display_attribute_values_in_weathersense", 1)
	JsonUtil.SetIntValue(profile_path, "notification_equipmentvalues", 2)
	JsonUtil.SetIntValue(profile_path, "notification_equipmentsummary", 2)
	JsonUtil.SetIntValue(profile_path, "exposure_pause_combat", 2)
	JsonUtil.SetIntValue(profile_path, "exposure_pause_dialogue", 2)
	JsonUtil.SetFloatValue(profile_path, "exposure_rate", 1.0)
	JsonUtil.SetIntValue(profile_path, "force_feedback", 2)
	JsonUtil.SetIntValue(profile_path, "frost_shader_on", 2)
	JsonUtil.SetIntValue(profile_path, "full_screen_effects", 2)
	JsonUtil.SetIntValue(profile_path, "max_exposure_mode", 2)
	JsonUtil.SetIntValue(profile_path, "meter_display_mode", 2)
	JsonUtil.SetIntValue(profile_path, "meter_display_time", 4)
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_opacity", 100.0)
	JsonUtil.SetIntValue(profile_path, "exposure_meter_color", 0x93D0FF)
	JsonUtil.SetIntValue(profile_path, "exposure_meter_color_warm", 0xCC0000)
	JsonUtil.SetIntValue(profile_path, "exposure_meter_fill_direction", EXPOSURE_METER_TOPRIGHT_FILLDIR)
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_height", NORMAL_METER_HEIGHT)
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_width", NORMAL_METER_WIDTH)
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_xpos", EXPOSURE_METER_TOPRIGHT_16_9_X)
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_ypos", EXPOSURE_METER_TOPRIGHT_16_9_Y)
	JsonUtil.SetIntValue(profile_path, "exposure_meter_hanchor", EXPOSURE_METER_TOPRIGHT_HANCHOR)
	JsonUtil.SetIntValue(profile_path, "exposure_meter_vanchor", EXPOSURE_METER_TOPRIGHT_VANCHOR)
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_opacity", 100.0)
	JsonUtil.SetIntValue(profile_path, "wetness_meter_color", 0x2469F4)
	JsonUtil.SetIntValue(profile_path, "wetness_meter_fill_direction", WETNESS_METER_TOPRIGHT_FILLDIR)
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_height", CHARGE_METER_HEIGHT_INV)
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_width", CHARGE_METER_WIDTH)
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_xpos", WETNESS_METER_TOPRIGHT_16_9_X)
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_ypos", WETNESS_METER_TOPRIGHT_16_9_Y)
	JsonUtil.SetIntValue(profile_path, "wetness_meter_hanchor", WETNESS_METER_TOPRIGHT_HANCHOR)
	JsonUtil.SetIntValue(profile_path, "wetness_meter_vanchor", WETNESS_METER_TOPRIGHT_VANCHOR)
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_opacity", 100.0)
	JsonUtil.SetIntValue(profile_path, "weathersense_meter_color", 0xFDC327)
	JsonUtil.SetIntValue(profile_path, "weathersense_meter_fill_direction", WEATHERSENSE_METER_TOPRIGHT_FILLDIR)
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_height", CHARGE_METER_HEIGHT_INV)
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_width", CHARGE_METER_WIDTH)
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_xpos", WEATHERSENSE_METER_TOPRIGHT_16_9_X)
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_ypos", WEATHERSENSE_METER_TOPRIGHT_16_9_Y)
	JsonUtil.SetIntValue(profile_path, "weathersense_meter_hanchor", WEATHERSENSE_METER_TOPRIGHT_HANCHOR)
	JsonUtil.SetIntValue(profile_path, "weathersense_meter_vanchor", WEATHERSENSE_METER_TOPRIGHT_VANCHOR)
	JsonUtil.SetIntValue(profile_path, "movement_penalty", 2)
	JsonUtil.SetIntValue(profile_path, "no_fast_travel", 1)
	JsonUtil.SetIntValue(profile_path, "no_waiting", 1)
	JsonUtil.SetIntValue(profile_path, "sound_effects", 2)
	JsonUtil.SetIntValue(profile_path, "weather_messages", 2)
	JsonUtil.SetIntValue(profile_path, "weathersense_display_mode", 2)
	JsonUtil.SetIntValue(profile_path, "wet_shader_on", 2)
	JsonUtil.SetIntValue(profile_path, "frigid_water_is_lethal", 2)
	JsonUtil.SetIntValue(profile_path, "vampire_mode", 1)
	JsonUtil.SetIntValue(profile_path, "display_tutorials", 2)
	JsonUtil.SetIntValue(profile_path, "hotkey_weathersense", 0)

	JsonUtil.Save(profile_path)
endFunction

function SaveAllSettings(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex
	JsonUtil.SetIntValue(profile_path, "profile_version", _Frost_SettingsProfileVersion.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "animation", _Frost_Setting_Animation.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "follower_animation", _Frost_Setting_FollowerAnimation.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "condition_messages", _Frost_Setting_ConditionMessages.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "display_attributes_in_weathersense", _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "display_attribute_values_in_weathersense", _Frost_Setting_DisplayAttributeValuesInWeathersense.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "notification_equipmentvalues", _Frost_Setting_Notifications_EquipmentValues.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "notification_equipmentsummary", _Frost_Setting_Notifications_EquipmentSummary.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "exposure_pause_combat", _Frost_Setting_ExposurePauseCombat.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "exposure_pause_dialogue", _Frost_Setting_ExposurePauseDialogue.GetValueInt())
	JsonUtil.SetFloatValue(profile_path, "exposure_rate", _Frost_Setting_ExposureRate.GetValue())
	JsonUtil.SetIntValue(profile_path, "force_feedback", _Frost_Setting_ForceFeedback.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "frost_shader_on", _Frost_Setting_FrostShaderOn.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "full_screen_effects", _Frost_Setting_FullScreenEffects.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "max_exposure_mode", _Frost_Setting_MaxExposureMode.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "meter_display_mode", _Frost_Setting_MeterDisplayMode.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "meter_display_time", _Frost_Setting_MeterDisplayTime.GetValueInt())
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_opacity", _Frost_Setting_MeterExposureOpacity.GetValue())
	JsonUtil.SetIntValue(profile_path, "exposure_meter_color", _Frost_Setting_MeterExposureColor.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "exposure_meter_color_warm", _Frost_Setting_MeterExposureColorWarm.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "exposure_meter_fill_direction", _Frost_Setting_MeterExposureFillDirection.GetValueInt())
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_height", _Frost_Setting_MeterExposureHeight.GetValue())
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_width", _Frost_Setting_MeterExposureWidth.GetValue())
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_xpos", _Frost_Setting_MeterExposureXPos.GetValue())
	JsonUtil.SetFloatValue(profile_path, "exposure_meter_ypos", _Frost_Setting_MeterExposureYPos.GetValue())
	JsonUtil.SetIntValue(profile_path, "exposure_meter_hanchor", _Frost_Setting_MeterExposureHAnchor.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "exposure_meter_vanchor", _Frost_Setting_MeterExposureVAnchor.GetValueInt())
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_opacity", _Frost_Setting_MeterWetnessOpacity.GetValue())
	JsonUtil.SetIntValue(profile_path, "wetness_meter_color", _Frost_Setting_MeterWetnessColor.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "wetness_meter_fill_direction", _Frost_Setting_MeterWetnessFillDirection.GetValueInt())
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_height", _Frost_Setting_MeterWetnessHeight.GetValue())
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_width", _Frost_Setting_MeterWetnessWidth.GetValue())
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_xpos", _Frost_Setting_MeterWetnessXPos.GetValue())
	JsonUtil.SetFloatValue(profile_path, "wetness_meter_ypos", _Frost_Setting_MeterWetnessYPos.GetValue())
	JsonUtil.SetIntValue(profile_path, "wetness_meter_hanchor", _Frost_Setting_MeterWetnessHAnchor.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "wetness_meter_vanchor", _Frost_Setting_MeterWetnessVAnchor.GetValueInt())
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_opacity", _Frost_Setting_MeterWeathersenseOpacity.GetValue())
	JsonUtil.SetIntValue(profile_path, "weathersense_meter_color", _Frost_Setting_MeterWeathersenseColor.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "weathersense_meter_fill_direction", _Frost_Setting_MeterWeathersenseFillDirection.GetValueInt())
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_height", _Frost_Setting_MeterWeathersenseHeight.GetValue())
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_width", _Frost_Setting_MeterWeathersenseWidth.GetValue())
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_xpos", _Frost_Setting_MeterWeathersenseXPos.GetValue())
	JsonUtil.SetFloatValue(profile_path, "weathersense_meter_ypos", _Frost_Setting_MeterWeathersenseYPos.GetValue())
	JsonUtil.SetIntValue(profile_path, "weathersense_meter_hanchor", _Frost_Setting_MeterWeathersenseHAnchor.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "weathersense_meter_vanchor", _Frost_Setting_MeterWeathersenseVAnchor.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "movement_penalty", _Frost_Setting_MovementPenalty.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "no_fast_travel", _Frost_Setting_NoFastTravel.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "no_waiting", _Frost_Setting_NoWaiting.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "sound_effects", _Frost_Setting_SoundEffects.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "weather_messages", _Frost_Setting_WeatherMessages.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "weathersense_display_mode", _Frost_Setting_WeathersenseDisplayMode.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "wet_shader_on", _Frost_Setting_WetShaderOn.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "frigid_water_is_lethal", _Frost_Setting_FrigidWaterIsLethal.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "vampire_mode", _Frost_Setting_VampireMode.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "display_tutorials", _Frost_Setting_DisplayTutorials.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "hotkey_weathersense", _Frost_HotkeyWeathersense.GetValueInt())
	JsonUtil.Save(profile_path)
endFunction

function CleanProfile(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex

	bool result
	result = JsonUtil.UnsetIntValue(profile_path, "1P_animation_allowed")
	result = JsonUtil.UnsetIntValue(profile_path, "meter_opacity")
	result = JsonUtil.UnsetIntValue(profile_path, "meter_aspect_ratio")
	JsonUtil.Save(profile_path)
endFunction

function ShowProfileHelp()
	ShowMessage("$FrostfallSaveLoadTopic", false)
	ShowMessage("$FrostfallSaveLoadTopicCont", false)
	ShowMessage("$FrostfallSaveLoadTopicCont2", false)
endFunction

function SendEvent_StartFrostfall()
    int handle = ModEvent.Create("Frost_StartFrostfall")
    if handle
    	ModEvent.PushBool(handle, false)
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

function ClearEndurancePerks()
	_Frost_PerkRank_Adaptation.SetValueInt(0)
	_Frost_PerkRank_FrostWarding.SetValueInt(0)
	_Frost_PerkRank_GlacialSwimmer.SetValueInt(0)
	_Frost_PerkRank_InnerFire.SetValueInt(0)
	_Frost_PerkRank_WellInsulated.SetValueInt(0)
	_Frost_PerkRank_Windbreaker.SetValueInt(0)
endFunction

function RefundEnduranceSkillPoints()
	ClearEndurancePerks()
	EndurancePerkPoints.SetValueInt(EndurancePerkPointsEarned.GetValueInt())
	EndurancePerkPointProgress.SetValue(0.0)
endFunction

function GenerateEquipmentPage()
	SetCursorFillMode(TOP_TO_BOTTOM)

	SetCursorPosition(0)
	ArmorPage_cursor_position = 0

	_Frost_ClothingSystem clothing = GetClothingSystem()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	Armor[] worn_armor = GetAllWornArmor()

	ArmorMenuEntries = new Armor[128]
	ArmorTypeIDs = new int[128]
	Armor_WarmthSliderOIDs = new int[128]
	Armor_CoverageSliderOIDs = new int[128]
	Armor_GearTypeOIDs = new int[128]
	Armor_ModifyPartsOIDs = new int[128]
	Armor_SetProtectionOIDs = new int[128]
	Armor_DefaultArmorEntryOIDs = new int[128]

	int armor_count = ArrayCountArmor(worn_armor)

	int i = 0
	int j = 0

	if armor_count == 0
		AddTextOption("$FrostfallArmorNoGear", "", OPTION_FLAG_DISABLED)
		ArmorPage_cursor_position += 2
	endif

	while i < armor_count
		int[] armor_data = handler.GetArmorProtectionData(worn_armor[i] as Armor)

		int disable_if_ignored = 0
		if armor_data[0] == handler.GEARTYPE_IGNORE
			disable_if_ignored = OPTION_FLAG_DISABLED
		endif

		; Main entry
		GenerateEquipmentPageEntry(j, worn_armor[i], armor_data[0], armor_data[1], armor_data[2], true, disable_if_ignored, handler)
		j += 1

		; Extra Body
		if armor_data[3] > 0 || armor_data[4] > 0
			GenerateEquipmentPageEntry(j, worn_armor[i], handler.GEARTYPE_BODY, armor_data[3], armor_data[4], false, disable_if_ignored, handler)
			j += 1
		endIf

		; Extra Head
		if armor_data[5] > 0 || armor_data[6] > 0
			GenerateEquipmentPageEntry(j, worn_armor[i], handler.GEARTYPE_HEAD, armor_data[5], armor_data[6], false, disable_if_ignored, handler)
			j += 1
		endIf

		; Extra Hands
		if armor_data[7] > 0 || armor_data[8] > 0
			GenerateEquipmentPageEntry(j, worn_armor[i], handler.GEARTYPE_HANDS, armor_data[7], armor_data[8], false, disable_if_ignored, handler)
			j += 1
		endif

		; Extra Feet
		if armor_data[9] > 0 || armor_data[10] > 0
			GenerateEquipmentPageEntry(j, worn_armor[i], handler.GEARTYPE_FEET, armor_data[9], armor_data[10], false, disable_if_ignored, handler)
			j += 1
		endif

		; Extra Cloak
		if armor_data[11] > 0 || armor_data[12] > 0
			GenerateEquipmentPageEntry(j, worn_armor[i], handler.GEARTYPE_CLOAK, armor_data[11], armor_data[12], false, disable_if_ignored, handler)
			j += 1
		endif

		; Extra Misc
		if armor_data[13] > 0 || armor_data[14] > 0
			GenerateEquipmentPageEntry(j, worn_armor[i], handler.GEARTYPE_MISC, armor_data[13], armor_data[14], false, disable_if_ignored, handler)
			j += 1
		endif
		i += 1
	endWhile

	GenerateEquipmentPageFooter()
endFunction

function GenerateEquipmentPageEntry(int aiArrayIndex, Armor akArmor, int aiType, int akWarmth, int akCoverage, 	\
	                                bool abIsMainPart, int aiDisableIfIgnored, _Frost_ArmorProtectionDatastoreHandler akHandler)

	SetCursorPosition(ArmorPage_cursor_position)

	ArmorMenuEntries[aiArrayIndex] = akArmor

	if aiDisableIfIgnored as bool
		akWarmth = 0
		akCoverage = 0
	endif

	string display_name = akArmor.GetName()
	if display_name == ""
		display_name = GetUnnamedTypeString(akArmor, aiType, akHandler)
	endif

	if abIsMainPart
		AddHeaderOption(display_name)
		ArmorTypeIDs[aiArrayIndex] = 0
	else
		AddHeaderOption(display_name + GetExtraPartTypeString(aiType, akHandler))
		ArmorTypeIDs[aiArrayIndex] = aiType
	endif

	if abIsMainPart
		Armor_GearTypeOIDs[aiArrayIndex] = AddMenuOption("$FrostfallArmorType", GetTypeString(aiType, akHandler))
	else
		Armor_GearTypeOIDs[aiArrayIndex] = AddMenuOption("$FrostfallArmorType", GetTypeString(aiType, akHandler), OPTION_FLAG_DISABLED)
	endif

	Armor_WarmthSliderOIDs[aiArrayIndex] = AddSliderOption("$FrostfallOverviewWarmthValue", akWarmth, "{0}", OPTION_FLAG_DISABLED)
	Armor_CoverageSliderOIDs[aiArrayIndex] = AddSliderOption("$FrostfallOverviewCoverageValue", akCoverage, "{0}", OPTION_FLAG_DISABLED)
	Armor_SetProtectionOIDs[aiArrayIndex] = AddMenuOption("$FrostfallArmorSetProtection", "", aiDisableIfIgnored)

	if abIsMainPart
		Armor_ModifyPartsOIDs[aiArrayIndex] = AddMenuOption("$FrostfallArmorExtraParts", "", aiDisableIfIgnored)
	else
		AddEmptyOption()
	endif

	; Set the cursor position for the next entry
	if IsEven(ArmorPage_cursor_position)
		ArmorPage_cursor_position += 1
	else
		ArmorPage_cursor_position += 11
	endif
endFunction

function GenerateEquipmentPageFooter()
	if !IsEven(ArmorPage_cursor_position)
		ArmorPage_cursor_position += 11
	endif

	SetCursorPosition(ArmorPage_cursor_position)
	SetCursorFillMode(LEFT_TO_RIGHT)
	AddHeaderOption("$FrostfallArmorHeaderOptions")
	AddHeaderOption("$FrostfallArmorHeaderInfo")
	Armor_RepairDefaultsOID = AddTextOption("$FrostfallArmorRepairDefaultData", "")
	Armor_ShowTutorialOID = AddTextOption("$FrostfallArmorTutorial", "")
	Armor_DefaultWornArmorOID = AddTextOption("$FrostfallArmorDefaultWorn", "")
	AddEmptyOption()
	Armor_DefaultAllArmorOID = AddTextOption("$FrostfallArmorDefaultAll", "")

endFunction

function ModifyGearProtection(int aiOidIndex, int aiChoice)
	if aiChoice == 27 || aiChoice == -1
		return
	endif

	armor the_armor = ArmorMenuEntries[aiOIDIndex]
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	; Option select
	if aiChoice == 27
		; Cancel
		return
	elseif aiChoice == 26
		; Restore Defaults
		bool confirmed = ShowMessage("$FrostfallArmorDefaultConfirm")
		if confirmed
			handler.RestoreDefaultArmorData(the_armor)
			ArmorPageReset(true)
			RefreshSingleItemValues(the_armor)
			return
		endif
	elseif aiChoice == 25
		; Set values manually
		SetOptionFlags(Armor_WarmthSliderOIDs[aiOIDIndex], 0, false)
		SetOptionFlags(Armor_CoverageSliderOIDs[aiOIDIndex], 0)
		return
	else
		int new_warmth = 0
		int new_coverage = 0

		int[] armor_data = handler.GetArmorProtectionData(the_armor)
		int type = armor_data[0]

		if aiChoice == 23
			new_warmth = 40
			new_coverage = 12
		elseif aiChoice == 22
			new_warmth = 12
			new_coverage = 40
		elseif aiChoice == 21
			new_warmth = 12
			new_coverage = 12
		elseif aiChoice == 20
			new_warmth = 6
			new_coverage = 12
		elseif aiChoice == 19
			new_warmth = 12
			new_coverage = 6
		else
			int wdx = ProtectionListWarmthIndex[aiChoice]
			int cdx = ProtectionListCoverageIndex[aiChoice]

			if wdx == -1
				ShowMessage("$FrostfallArmorInvalidOption")
				return
			endif

			if type == handler.GEARTYPE_BODY
				new_warmth = handler.StandardBodyValues[wdx]
				if cdx == -2
					new_coverage = 0
				else
					new_coverage = handler.StandardBodyValues[cdx]
				endif
			elseif type == handler.GEARTYPE_HEAD
				new_warmth = handler.StandardHeadValues[wdx]
				if cdx == -2
					new_coverage = 0
				else
					new_coverage = handler.StandardHeadValues[cdx]
				endif
			elseif type == handler.GEARTYPE_HANDS
				new_warmth = handler.StandardHandsValues[wdx]
				if cdx == -2
					new_coverage = 0
				else
					new_coverage = handler.StandardHandsValues[cdx]
				endif
			elseif type == handler.GEARTYPE_FEET
				new_warmth = handler.StandardFeetValues[wdx]
				if cdx == -2
					new_coverage = 0
				else
					new_coverage = handler.StandardFeetValues[cdx]
				endif
			elseif type == handler.GEARTYPE_CLOAK
				new_warmth = handler.StandardCloakValues[wdx]
				if cdx == -2
					new_coverage = 0
				else
					new_coverage = handler.StandardCloakValues[cdx]
				endif
			elseif type == handler.GEARTYPE_MISC
				new_warmth = handler.StandardMiscValues[wdx]
				if cdx == -2
					new_coverage = 0
				else
					new_coverage = handler.StandardMiscValues[cdx]
				endif
			else
				; How did we get here?
				return
			endif
		endif

		; Set the new value
		if ArmorTypeIDs[aiOidIndex] == 0
			armor_data[1] = new_warmth
			armor_data[2] = new_coverage
		elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_BODY
			armor_data[3] = new_warmth
			armor_data[4] = new_coverage
		elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HEAD
			armor_data[5] = new_warmth
			armor_data[6] = new_coverage
		elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HANDS
			armor_data[7] = new_warmth
			armor_data[8] = new_coverage
		elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_FEET
			armor_data[9] = new_warmth
			armor_data[10] = new_coverage
		elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_CLOAK
			armor_data[11] = new_warmth
			armor_data[12] = new_coverage
		elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_MISC
			armor_data[13] = new_warmth
			armor_data[14] = new_coverage
		endif

		handler.UpdateArmorDataA(the_armor, armor_data)

		; Update the UI
		SetSliderOptionValue(Armor_WarmthSliderOIDs[aiOIDIndex], new_warmth, "{0}", true)
		SetSliderOptionValue(Armor_CoverageSliderOIDs[aiOIDIndex], new_coverage, "{0}")

		; Update the game
		RefreshSingleItemValues(the_armor)
	endif
endFunction

function SetWarmthSlider(int aiOidIndex)
	armor the_armor = ArmorMenuEntries[aiOIDIndex]
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	int[] armor_data = handler.GetArmorProtectionData(the_armor)

	float start_value = 0.0
	if ArmorTypeIDs[aiOidIndex] == 0
		start_value = armor_data[1]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_BODY
		start_value = armor_data[3]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HEAD
		start_value = armor_data[5]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HANDS
		start_value = armor_data[7]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_FEET
		start_value = armor_data[9]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_CLOAK
		start_value = armor_data[11]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_MISC
		start_value = armor_data[13]
	endif

	SetSliderDialogStartValue(start_value)
	SetSliderDialogDefaultValue(start_value)
	SetSliderDialogRange(1.0, _Frost_Calc_MaxWarmth.GetValue())
	SetSliderDialogInterval(1.0)
endFunction

function SetCoverageSlider(int aiOidIndex)
	armor the_armor = ArmorMenuEntries[aiOIDIndex]
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	int[] armor_data = handler.GetArmorProtectionData(the_armor)

	float start_value = 0.0
	if ArmorTypeIDs[aiOidIndex] == 0
		start_value = armor_data[2]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_BODY
		start_value = armor_data[4]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HEAD
		start_value = armor_data[6]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HANDS
		start_value = armor_data[8]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_FEET
		start_value = armor_data[10]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_CLOAK
		start_value = armor_data[12]
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_MISC
		start_value = armor_data[14]
	endif

	SetSliderDialogStartValue(start_value)
	SetSliderDialogDefaultValue(start_value)
	SetSliderDialogRange(1.0, _Frost_Calc_MaxCoverage.GetValue())
	SetSliderDialogInterval(1.0)
endFunction

function ModifyGearWarmth(int aiOidIndex, int aiValue)
	armor the_armor = ArmorMenuEntries[aiOIDIndex]
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	int[] armor_data = handler.GetArmorProtectionData(the_armor)

	; Set the new value
	if ArmorTypeIDs[aiOidIndex] == 0
		armor_data[1] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_BODY
		armor_data[3] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HEAD
		armor_data[5] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HANDS
		armor_data[7] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_FEET
		armor_data[9] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_CLOAK
		armor_data[11] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_MISC
		armor_data[13] = aiValue
	endif

	handler.UpdateArmorDataA(the_armor, armor_data)

	; Update the UI
	SetSliderOptionValue(Armor_WarmthSliderOIDs[aiOIDIndex], aiValue, "{0}")

	; Update the game
	RefreshSingleItemValues(the_armor)
endFunction

function ModifyGearCoverage(int aiOIDIndex, int aiValue)
	armor the_armor = ArmorMenuEntries[aiOIDIndex]
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	int[] armor_data = handler.GetArmorProtectionData(the_armor)

	; Set the new value
	if ArmorTypeIDs[aiOidIndex] == 0
		armor_data[2] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_BODY
		armor_data[4] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HEAD
		armor_data[6] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_HANDS
		armor_data[8] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_FEET
		armor_data[10] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_CLOAK
		armor_data[12] = aiValue
	elseif ArmorTypeIDs[aiOidIndex] == handler.GEARTYPE_MISC
		armor_data[14] = aiValue
	endif

	handler.UpdateArmorDataA(the_armor, armor_data)

	; Update the UI
	SetSliderOptionValue(Armor_CoverageSliderOIDs[aiOIDIndex], aiValue, "{0}")

	; Update the game
	RefreshSingleItemValues(the_armor)
endFunction

function ModifyGearType(int aiOIDIndex, int aiChoice)
	if aiChoice == 7 || aiChoice == -1
		return
	endif

	bool confirmed = ShowMessage("$FrostfallArmorTypeConfirm")
	if !confirmed
		return
	endif

	SetMenuOptionValue(Armor_GearTypeOIDs[aiOIDIndex], GearTypeList[aiChoice])
	armor the_armor = ArmorMenuEntries[aiOIDIndex]
	int chosen_type = aiChoice + 1
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	int[] armor_data = handler.GetArmorProtectionData(the_armor)

	armor_data[0] = chosen_type

	; Does this type change override any existing Extra Part Data?
	if chosen_type == handler.GEARTYPE_BODY
		armor_data[3] = 0
		armor_data[4] = 0
	elseif chosen_type == handler.GEARTYPE_HEAD
		armor_data[5] = 0
		armor_data[6] = 0
	elseif chosen_type == handler.GEARTYPE_HANDS
		armor_data[7] = 0
		armor_data[8] = 0
	elseif chosen_type == handler.GEARTYPE_FEET
		armor_data[9] = 0
		armor_data[10] = 0
	elseif chosen_type == handler.GEARTYPE_CLOAK
		armor_data[11] = 0
		armor_data[12] = 0
	elseif chosen_type == handler.GEARTYPE_MISC
		armor_data[13] = 0
		armor_data[14] = 0
	endif

	handler.UpdateArmorDataA(the_armor, armor_data)
	ArmorPageReset(true)
	RefreshSingleItemValues(the_armor)
endFunction

string[] function GetExtraPartChoiceList(int aiOIDIndex)
	armor the_armor = ArmorMenuEntries[aiOIDIndex]
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	int[] armor_data = handler.GetArmorProtectionData(the_armor)
	int type = armor_data[0]

	string[] choice_list = new string[7]

	if type == handler.GEARTYPE_BODY
		choice_list[0] = "..."
	else
		if armor_data[3] > 0 || armor_data[4] > 0
			choice_list[0] = "$FrostfallArmorExtraPartsRemoveBody"
		else
			choice_list[0] = "$FrostfallArmorExtraPartsAddBody"
		endif
	endif

	if type == handler.GEARTYPE_HEAD
		choice_list[1] = "..."
	else
		if armor_data[5] > 0 || armor_data[6] > 0
			choice_list[1] = "$FrostfallArmorExtraPartsRemoveHead"
		else
			choice_list[1] = "$FrostfallArmorExtraPartsAddHead"
		endif
	endif

	if type == handler.GEARTYPE_HANDS
		choice_list[2] = "..."
	else
		if armor_data[7] > 0 || armor_data[8] > 0
			choice_list[2] = "$FrostfallArmorExtraPartsRemoveHands"
		else
			choice_list[2] = "$FrostfallArmorExtraPartsAddHands"
		endif
	endif

	if type == handler.GEARTYPE_FEET
		choice_list[3] = "..."
	else
		if armor_data[9] > 0 || armor_data[10] > 0
			choice_list[3] = "$FrostfallArmorExtraPartsRemoveFeet"
		else
			choice_list[3] = "$FrostfallArmorExtraPartsAddFeet"
		endif
	endif

	if type == handler.GEARTYPE_CLOAK
		choice_list[4] = "..."
	else
		if armor_data[11] > 0 || armor_data[12] > 0
			choice_list[4] = "$FrostfallArmorExtraPartsRemoveCloak"
		else
			choice_list[4] = "$FrostfallArmorExtraPartsAddCloak"
		endif
	endif

	if type == handler.GEARTYPE_MISC
		choice_list[5] = "..."
	else
		if armor_data[13] > 0 || armor_data[14] > 0
			choice_list[5] = "$FrostfallArmorExtraPartsRemoveMisc"
		else
			choice_list[5] = "$FrostfallArmorExtraPartsAddMisc"
		endif
	endif

	choice_list[6] = "$FrostfallCancel"
	return choice_list
endFunction

function ModifyGearExtraParts(int aiOIDIndex, int aiChoice)
	if aiChoice == 6 || aiChoice == -1
		return
	endif

	bool confirmed = ShowMessage("$FrostfallArmorExtraPartsConfirm")
	if !confirmed
		return
	endif

	armor the_armor = ArmorMenuEntries[aiOIDIndex]
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	int[] armor_data = handler.GetArmorProtectionData(the_armor)
	int type = armor_data[0]

	if (aiChoice + 1) == type
		ShowMessage("$FrostfallArmorInvalidOption")
		return
	endif

	if aiChoice == 0
		if armor_data[3] > 0 || armor_data[4] > 0
			armor_data[3] = 0
			armor_data[4] = 0
		else
			armor_data[3] = 1
		endif
	elseif aiChoice == 1
		if armor_data[5] > 0 || armor_data[6] > 0
			armor_data[5] = 0
			armor_data[6] = 0
		else
			armor_data[5] = 1
		endif
	elseif aiChoice == 2
		if armor_data[7] > 0 || armor_data[8] > 0
			armor_data[7] = 0
			armor_data[8] = 0
		else
			armor_data[7] = 1
		endif
	elseif aiChoice == 3
		if armor_data[9] > 0 || armor_data[10] > 0
			armor_data[9] = 0
			armor_data[10] = 0
		else
			armor_data[9] = 1
		endif
	elseif aiChoice == 4
		if armor_data[11] > 0 || armor_data[12] > 0
			armor_data[11] = 0
			armor_data[12] = 0
		else
			armor_data[11] = 1
		endif
	elseif aiChoice == 5
		if armor_data[13] > 0 || armor_data[14] > 0
			armor_data[13] = 0
			armor_data[14] = 0
		else
			armor_data[13] = 1
		endif
	endif

	handler.UpdateArmorDataA(the_armor, armor_data)
	ArmorPageReset(true)
	RefreshSingleItemValues(the_armor)
endFunction

function RepairArmorDefaults()
	bool confirmed = ShowMessage("$FrostfallArmorRepairDefaultDataConfirm")
	if !confirmed
		return
	endIf

	Compatibility.PopulateDefaultArmorData()
	Compatibility.RunCompatibilityArmors()
	ArmorPageReset(true)
	_Frost_ClothingSystem clothing = GetClothingSystem()
	clothing.RefreshWornGearData(clothing.WornGearMainForms, clothing.WornGearForms, clothing._Frost_WornGearData)
	clothing.SendEvent_UpdateWarmthAndCoverage(false)
endFunction

function DefaultWornArmor()
	bool confirmed = ShowMessage("$FrostfallArmorDefaultWornConfirm")
	if !confirmed
		return
	endIf

	_Frost_ClothingSystem clothing = GetClothingSystem()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

	Armor[] worn_armor = GetAllWornArmor()
	int armor_count = ArrayCountArmor(worn_armor)

	int i = 0
	while i < armor_count
		handler.RestoreDefaultArmorData(worn_armor[i])
		i += 1
	endWhile

	ArmorPageReset(true)

	clothing.RefreshWornGearData(clothing.WornGearMainForms, clothing.WornGearForms, clothing._Frost_WornGearData)
	clothing.SendEvent_UpdateWarmthAndCoverage(false)
endFunction

function DefaultAllArmor()
	bool confirmed = ShowMessage("$FrostfallArmorDefaultAllConfirm")
	if !confirmed
		return
	endIf

	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	handler.RestoreAllDefaultArmorData()

	ArmorPageReset(true)
	_Frost_ClothingSystem clothing = GetClothingSystem()
	clothing.RefreshWornGearData(clothing.WornGearMainForms, clothing.WornGearForms, clothing._Frost_WornGearData)
	clothing.SendEvent_UpdateWarmthAndCoverage(false)
endFunction

function RefreshSingleItemValues(Armor akArmor)
	; Update currently worn armor data in-place and force recalculate
	TryToRemoveArmorFromPrecache(akArmor, _FrostData_ArmorPrecache)
	_Frost_ClothingSystem clothing = GetClothingSystem()
	bool b = clothing.RemoveWornGearEntryForArmorUnequipped(akArmor, clothing.WornGearMainForms, clothing.WornGearForms, clothing._Frost_WornGearData)
	b = clothing.AddWornGearEntryForArmorEquipped(akArmor, clothing.WornGearMainForms, clothing.WornGearForms, clothing._Frost_WornGearData)
	clothing.RecalculateProtectionData(clothing.WornGearMainForms, clothing.WornGearForms, clothing.WornGearValues, clothing._Frost_WornGearData)
	clothing.SendEvent_UpdateWarmthAndCoverage(false)
endFunction

function ArmorPageReset(bool abShowUpdatedMessage)
	if abShowUpdatedMessage
		ArmorPage_updated_msg = true
	endif
	ForcePageReset()
endFunction

Armor[] function GetAllWornArmor()
	; Modified from http://www.creationkit.com/Slot_Masks_-_Armor
	Armor[] wornArmor = new Armor[29]
    int index
    int slotsChecked
    slotsChecked += 0x00100000
    slotsChecked += 0x00200000 ;ignore reserved slots
    slotsChecked += 0x80000000

    int thisSlot = 0x01
    while (thisSlot < 0x80000000)
        if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) 			;only check slots we haven't found anything equipped on already
            Armor thisArmor = PlayerRef.GetWornForm(thisSlot) as Armor
            if thisArmor
                wornArmor[index] = thisArmor
                index += 1
                slotsChecked += thisArmor.GetSlotMask() 					;add all slots this item covers to our slotsChecked variable
            else 															;no armor was found on this slot
                slotsChecked += thisSlot
            endif
        endif
        thisSlot *= 2 														;double the number to move on to the next slot
    endWhile
    return wornArmor
endFunction

string function GetTypeString(int aiType, _Frost_ArmorProtectionDatastoreHandler akHandler)
	if aiType == akHandler.GEARTYPE_BODY
		return "$FrostfallBody"
	elseif aiType == akHandler.GEARTYPE_HEAD
		return "$FrostfallHead"
	elseif aiType == akHandler.GEARTYPE_HANDS
		return "$FrostfallHands"
	elseif aiType == akHandler.GEARTYPE_FEET
		return "$FrostfallFeet"
	elseif aiType == akHandler.GEARTYPE_CLOAK
		return "$FrostfallCloak"
	elseif aiType == akHandler.GEARTYPE_MISC
		return "$FrostfallAccessory"
	elseif aiType == akHandler.GEARTYPE_IGNORE
		return "$FrostfallNoProtection"
	else
		return "$FrostfallNA"
	endif
endFunction

string function GetExtraPartTypeString(int aiType, _Frost_ArmorProtectionDatastoreHandler akHandler)
	_Frost_Strings str = GetFrostfallStrings()
	if aiType == akHandler.GEARTYPE_BODY
		return str.FrostfallBodyExtraPartDesc
	elseif aiType == akHandler.GEARTYPE_HEAD
		return str.FrostfallHeadExtraPartDesc
	elseif aiType == akHandler.GEARTYPE_HANDS
		return str.FrostfallHandsExtraPartDesc
	elseif aiType == akHandler.GEARTYPE_FEET
		return str.FrostfallFeetExtraPartDesc
	elseif aiType == akHandler.GEARTYPE_CLOAK
		return str.FrostfallCloakExtraPartDesc
	elseif aiType == akHandler.GEARTYPE_MISC
		return str.FrostfallAccessoryExtraPartDesc
	endif
endFunction

string function GetUnnamedTypeString(Armor akArmor, int aiType, _Frost_ArmorProtectionDatastoreHandler akHandler)
	_Frost_Strings str = GetFrostfallStrings()
	if aiType == akHandler.GEARTYPE_BODY
		return str.FrostfallBodyUnnamed
	elseif aiType == akHandler.GEARTYPE_HEAD
		return str.FrostfallHeadUnnamed
	elseif aiType == akHandler.GEARTYPE_HANDS
		return str.FrostfallHandsUnnamed
	elseif aiType == akHandler.GEARTYPE_FEET
		return str.FrostfallFeetUnnamed
	elseif aiType == akHandler.GEARTYPE_CLOAK
		return str.FrostfallCloakUnnamed
	elseif aiType == akHandler.GEARTYPE_MISC
		if akArmor.IsShield()
			return str.FrostfallShieldUnnamed
		else
			return str.FrostfallAccessoryUnnamed
		endif
	elseif aiType == akHandler.GEARTYPE_IGNORE
		return str.FrostfallNoProtectionUnnamed
	endif
endFunction

function ShowTutorial_ArmorPage(bool abForceDisplay = false)
	ShowMessage("$FrostfallArmorTutorial1", false)
	ShowMessage("$FrostfallArmorTutorial2", false)
	ShowMessage("$FrostfallArmorTutorial3", false)
	ShowMessage("$FrostfallArmorTutorial4", false)
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

int EXPOSURE_METER_BOTTOMLEFT_HANCHOR = 0 		; HANCHOR_LEFT
int EXPOSURE_METER_BOTTOMLEFT_VANCHOR = 1 		; VANCHOR_BOTTOM
int EXPOSURE_METER_BOTTOMLEFT_FILLDIR = 1 		; FILLDIR_RIGHT
int EXPOSURE_METER_BOTTOMRIGHT_HANCHOR = 1		; HANCHOR_RIGHT
int EXPOSURE_METER_BOTTOMRIGHT_VANCHOR = 1 		; VANCHOR_BOTTOM
int EXPOSURE_METER_BOTTOMRIGHT_FILLDIR = 0		; FILLDIR_LEFT
int EXPOSURE_METER_TOPLEFT_HANCHOR = 0 			; HANCHOR_LEFT
int EXPOSURE_METER_TOPLEFT_VANCHOR = 0 			; VANCHOR_TOP
int EXPOSURE_METER_TOPLEFT_FILLDIR = 1 			; FILLDIR_RIGHT
int EXPOSURE_METER_TOPRIGHT_HANCHOR = 1			; HANCHOR_RIGHT
int EXPOSURE_METER_TOPRIGHT_VANCHOR = 0 		; VANCHOR_TOP
int EXPOSURE_METER_TOPRIGHT_FILLDIR = 0			; FILLDIR_LEFT

int WETNESS_METER_BOTTOMLEFT_HANCHOR = 0 		; HANCHOR_LEFT
int WETNESS_METER_BOTTOMLEFT_VANCHOR = 1 		; VANCHOR_BOTTOM
int WETNESS_METER_BOTTOMLEFT_FILLDIR = 1		; FILLDIR_RIGHT
int WETNESS_METER_BOTTOMRIGHT_HANCHOR = 1		; HANCHOR_RIGHT
int WETNESS_METER_BOTTOMRIGHT_VANCHOR = 1 		; VANCHOR_BOTTOM
int WETNESS_METER_BOTTOMRIGHT_FILLDIR = 0 		; FILLDIR_LEFT
int WETNESS_METER_TOPLEFT_HANCHOR = 0 			; HANCHOR_LEFT
int WETNESS_METER_TOPLEFT_VANCHOR = 0 			; VANCHOR_TOP
int WETNESS_METER_TOPLEFT_FILLDIR = 0			; FILLDIR_LEFT
int WETNESS_METER_TOPRIGHT_HANCHOR = 1			; HANCHOR_RIGHT
int WETNESS_METER_TOPRIGHT_VANCHOR = 0 			; VANCHOR_TOP
int WETNESS_METER_TOPRIGHT_FILLDIR = 1 			; FILLDIR_RIGHT

int WEATHERSENSE_METER_BOTTOMLEFT_HANCHOR = 2 	; HANCHOR_CENTER
int WEATHERSENSE_METER_BOTTOMLEFT_VANCHOR = 1 	; VANCHOR_BOTTOM
int WEATHERSENSE_METER_BOTTOMLEFT_FILLDIR = 2	; FILLDIR_BOTH
int WEATHERSENSE_METER_BOTTOMRIGHT_HANCHOR = 2 	; HANCHOR_CENTER
int WEATHERSENSE_METER_BOTTOMRIGHT_VANCHOR = 1 	; VANCHOR_BOTTOM
int WEATHERSENSE_METER_BOTTOMRIGHT_FILLDIR = 2	; FILLDIR_BOTH
int WEATHERSENSE_METER_TOPLEFT_HANCHOR = 2 		; HANCHOR_CENTER
int WEATHERSENSE_METER_TOPLEFT_VANCHOR = 0 		; VANCHOR_TOP
int WEATHERSENSE_METER_TOPLEFT_FILLDIR = 2		; FILLDIR_BOTH
int WEATHERSENSE_METER_TOPRIGHT_HANCHOR = 2 	; HANCHOR_CENTER
int WEATHERSENSE_METER_TOPRIGHT_VANCHOR = 0 	; VANCHOR_TOP
int WEATHERSENSE_METER_TOPRIGHT_FILLDIR = 2		; FILLDIR_BOTH

float EXPOSURE_METER_BOTTOMLEFT_16_9_X = 69.2
float EXPOSURE_METER_BOTTOMLEFT_16_9_Y = 618.0
float EXPOSURE_METER_BOTTOMRIGHT_16_9_X = 1211.0
float EXPOSURE_METER_BOTTOMRIGHT_16_9_Y = 618.0
float EXPOSURE_METER_TOPLEFT_16_9_X = 69.2
float EXPOSURE_METER_TOPLEFT_16_9_Y = 113.0
float EXPOSURE_METER_TOPRIGHT_16_9_X = 1211.0
float EXPOSURE_METER_TOPRIGHT_16_9_Y = 113.0

float WETNESS_METER_BOTTOMLEFT_16_9_X = 85.5
float WETNESS_METER_BOTTOMLEFT_16_9_Y = 601.2
float WETNESS_METER_BOTTOMRIGHT_16_9_X = 1227.0
float WETNESS_METER_BOTTOMRIGHT_16_9_Y = 601.2
float WETNESS_METER_TOPLEFT_16_9_X = 345.5
float WETNESS_METER_TOPLEFT_16_9_Y = 151.6
float WETNESS_METER_TOPRIGHT_16_9_X = 1486.4
float WETNESS_METER_TOPRIGHT_16_9_Y = 151.6

float WEATHERSENSE_METER_BOTTOMLEFT_16_9_X = 657.5
float WEATHERSENSE_METER_BOTTOMLEFT_16_9_Y = 726.5
float WEATHERSENSE_METER_BOTTOMRIGHT_16_9_X = 657.5
float WEATHERSENSE_METER_BOTTOMRIGHT_16_9_Y = 726.5
float WEATHERSENSE_METER_TOPLEFT_16_9_X = 916.75
float WEATHERSENSE_METER_TOPLEFT_16_9_Y = 16.0
float WEATHERSENSE_METER_TOPRIGHT_16_9_X = 916.75
float WEATHERSENSE_METER_TOPRIGHT_16_9_Y = 16.0

float EXPOSURE_METER_BOTTOMLEFT_16_10_X = 64.2
float EXPOSURE_METER_BOTTOMLEFT_16_10_Y = 628.0
float EXPOSURE_METER_BOTTOMRIGHT_16_10_X = 1216.0
float EXPOSURE_METER_BOTTOMRIGHT_16_10_Y = 628.0
float EXPOSURE_METER_TOPLEFT_16_10_X = 64.2
float EXPOSURE_METER_TOPLEFT_16_10_Y = 113.0
float EXPOSURE_METER_TOPRIGHT_16_10_X = 1216.0
float EXPOSURE_METER_TOPRIGHT_16_10_Y = 113.0

float WETNESS_METER_BOTTOMLEFT_16_10_X = 80.5
float WETNESS_METER_BOTTOMLEFT_16_10_Y = 613.3
float WETNESS_METER_BOTTOMRIGHT_16_10_X = 1232.0
float WETNESS_METER_BOTTOMRIGHT_16_10_Y = 613.3
float WETNESS_METER_TOPLEFT_16_10_X = 340.5
float WETNESS_METER_TOPLEFT_16_10_Y = 147.5
float WETNESS_METER_TOPRIGHT_16_10_X = 1491.0
float WETNESS_METER_TOPRIGHT_16_10_Y = 147.5

float WEATHERSENSE_METER_BOTTOMLEFT_16_10_X = 657.5
float WEATHERSENSE_METER_BOTTOMLEFT_16_10_Y = 726.5
float WEATHERSENSE_METER_BOTTOMRIGHT_16_10_X = 657.5
float WEATHERSENSE_METER_BOTTOMRIGHT_16_10_Y = 726.5
float WEATHERSENSE_METER_TOPLEFT_16_10_X = 916.75
float WEATHERSENSE_METER_TOPLEFT_16_10_Y = 14.0
float WEATHERSENSE_METER_TOPRIGHT_16_10_X = 916.75
float WEATHERSENSE_METER_TOPRIGHT_16_10_Y = 14.0

float EXPOSURE_METER_BOTTOMLEFT_4_3_X = 69.2
float EXPOSURE_METER_BOTTOMLEFT_4_3_Y = 645.0
float EXPOSURE_METER_BOTTOMRIGHT_4_3_X = 1218.0
float EXPOSURE_METER_BOTTOMRIGHT_4_3_Y = 645.0
float EXPOSURE_METER_TOPLEFT_4_3_X = 65.2
float EXPOSURE_METER_TOPLEFT_4_3_Y = 113.0
float EXPOSURE_METER_TOPRIGHT_4_3_X = 1218.0
float EXPOSURE_METER_TOPRIGHT_4_3_Y = 113.0

float WETNESS_METER_BOTTOMLEFT_4_3_X = 85.5
float WETNESS_METER_BOTTOMLEFT_4_3_Y = 632.4
float WETNESS_METER_BOTTOMRIGHT_4_3_X = 1234.0
float WETNESS_METER_BOTTOMRIGHT_4_3_Y = 632.4
float WETNESS_METER_TOPLEFT_4_3_X = 340.5
float WETNESS_METER_TOPLEFT_4_3_Y = 142.0
float WETNESS_METER_TOPRIGHT_4_3_X = 1493.0
float WETNESS_METER_TOPRIGHT_4_3_Y = 142.0

float WEATHERSENSE_METER_BOTTOMLEFT_4_3_X = 657.5
float WEATHERSENSE_METER_BOTTOMLEFT_4_3_Y = 724.5
float WEATHERSENSE_METER_BOTTOMRIGHT_4_3_X = 657.5
float WEATHERSENSE_METER_BOTTOMRIGHT_4_3_Y = 724.5
float WEATHERSENSE_METER_TOPLEFT_4_3_X = 916.75
float WEATHERSENSE_METER_TOPLEFT_4_3_Y = 12.0
float WEATHERSENSE_METER_TOPRIGHT_4_3_X = 916.75
float WEATHERSENSE_METER_TOPRIGHT_4_3_Y = 12.0

int meter_being_configured = 0
int METER_BEING_CONFIGURED_NONE = 0
int METER_BEING_CONFIGURED_EXPOSURE = 1
int METER_BEING_CONFIGURED_WETNESS = 2
int METER_BEING_CONFIGURED_WEATHERSENSE = 3

function ApplyMeterPreset(int aiPresetIdx)
	int w = Utility.GetINIInt("iSize W:Display")
	int h = Utility.GetINIInt("iSize H:Display")
	float ratio = (w as float)/(h as float)
	debug.trace("[Frostfall] Detected display resolution " + w + "x" + h + " (" + ratio + " aspect ratio).")
	if ratio > 1.7 && ratio < 1.8
		debug.trace("[Frostfall] Loading 16:9 aspect ratio meter preset.")
	elseif ratio == 1.6
		debug.trace("[Frostfall] Loading 16:10 aspect ratio meter preset.")
		aiPresetIdx += 4
	elseif ratio > 1.3 && ratio < 1.4
		debug.trace("[Frostfall] Loading 4:3 aspect ratio meter preset.")
		aiPresetIdx += 8
	else
		if config_is_open
			bool result = ShowMessage("$FrostfallMeterLayoutProblem")
			if result == false
				return
			endif
		else
			debug.trace("[Frostfall] The display aspect ratio wasn't supported. Defaulting to 16:9.")
		endif
	endif

	if aiPresetIdx == 0
		; 16:9 Bottom Left
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_BOTTOMLEFT_16_9_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_BOTTOMLEFT_16_9_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_BOTTOMLEFT_16_9_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_BOTTOMLEFT_16_9_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_BOTTOMLEFT_16_9_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_BOTTOMLEFT_16_9_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 1
		; 16:9 Bottom Right
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_BOTTOMRIGHT_16_9_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_BOTTOMRIGHT_16_9_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_BOTTOMRIGHT_16_9_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_BOTTOMRIGHT_16_9_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_BOTTOMRIGHT_16_9_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_BOTTOMRIGHT_16_9_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 2
		; 16:9 Top Left
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_TOPLEFT_16_9_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_TOPLEFT_16_9_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_TOPLEFT_16_9_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_TOPLEFT_16_9_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_TOPLEFT_16_9_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_TOPLEFT_16_9_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 3
		; 16:9 Top Right
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_TOPRIGHT_16_9_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_TOPRIGHT_16_9_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_TOPRIGHT_16_9_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_TOPRIGHT_16_9_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_TOPRIGHT_16_9_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_TOPRIGHT_16_9_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 4
		; 16:10 Bottom Left
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_BOTTOMLEFT_16_10_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_BOTTOMLEFT_16_10_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_BOTTOMLEFT_16_10_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_BOTTOMLEFT_16_10_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_BOTTOMLEFT_16_10_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_BOTTOMLEFT_16_10_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 5
		; 16:10 Bottom Right
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_BOTTOMRIGHT_16_10_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_BOTTOMRIGHT_16_10_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_BOTTOMRIGHT_16_10_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_BOTTOMRIGHT_16_10_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_BOTTOMRIGHT_16_10_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_BOTTOMRIGHT_16_10_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 6
		; 16:10 Top Left
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_TOPLEFT_16_10_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_TOPLEFT_16_10_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_TOPLEFT_16_10_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_TOPLEFT_16_10_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_TOPLEFT_16_10_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_TOPLEFT_16_10_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 7
		; 16:10 Top Right
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_TOPRIGHT_16_10_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_TOPRIGHT_16_10_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_TOPRIGHT_16_10_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_TOPRIGHT_16_10_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_TOPRIGHT_16_10_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_TOPRIGHT_16_10_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 8
		; 4:3 Bottom Left
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_BOTTOMLEFT_4_3_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_BOTTOMLEFT_4_3_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_BOTTOMLEFT_4_3_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_BOTTOMLEFT_4_3_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMLEFT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_BOTTOMLEFT_4_3_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_BOTTOMLEFT_4_3_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 9
		; 4:3 Bottom Right
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_BOTTOMRIGHT_4_3_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_BOTTOMRIGHT_4_3_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_BOTTOMRIGHT_4_3_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_BOTTOMRIGHT_4_3_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_BOTTOMRIGHT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_BOTTOMRIGHT_4_3_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_BOTTOMRIGHT_4_3_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 10
		; 4:3 Top Left
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_TOPLEFT_4_3_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_TOPLEFT_4_3_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_TOPLEFT_4_3_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_TOPLEFT_4_3_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_TOPLEFT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_TOPLEFT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_TOPLEFT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_TOPLEFT_4_3_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_TOPLEFT_4_3_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	elseif aiPresetIdx == 11
		; 4:3 Top Right
		_Frost_Setting_MeterExposureFillDirection.SetValueInt(EXPOSURE_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterExposureHAnchor.SetValueInt(EXPOSURE_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterExposureVAnchor.SetValueInt(EXPOSURE_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterExposureXPos.SetValue(EXPOSURE_METER_TOPRIGHT_4_3_X)
		_Frost_Setting_MeterExposureYPos.SetValue(EXPOSURE_METER_TOPRIGHT_4_3_Y)
		_Frost_Setting_MeterExposureHeight.SetValue(NORMAL_METER_HEIGHT)
		_Frost_Setting_MeterExposureWidth.SetValue(NORMAL_METER_WIDTH)
		_Frost_Setting_MeterWetnessFillDirection.SetValueInt(WETNESS_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterWetnessHAnchor.SetValueInt(WETNESS_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterWetnessVAnchor.SetValueInt(WETNESS_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterWetnessXPos.SetValue(WETNESS_METER_TOPRIGHT_4_3_X)
		_Frost_Setting_MeterWetnessYPos.SetValue(WETNESS_METER_TOPRIGHT_4_3_Y)
		_Frost_Setting_MeterWetnessHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWetnessWidth.SetValue(CHARGE_METER_WIDTH)
		_Frost_Setting_MeterWeathersenseFillDirection.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_FILLDIR)
		_Frost_Setting_MeterWeathersenseHAnchor.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_HANCHOR)
		_Frost_Setting_MeterWeathersenseVAnchor.SetValueInt(WEATHERSENSE_METER_TOPRIGHT_VANCHOR)
		_Frost_Setting_MeterWeathersenseXPos.SetValue(WEATHERSENSE_METER_TOPRIGHT_4_3_X)
		_Frost_Setting_MeterWeathersenseYPos.SetValue(WEATHERSENSE_METER_TOPRIGHT_4_3_Y)
		_Frost_Setting_MeterWeathersenseHeight.SetValue(CHARGE_METER_HEIGHT_INV)
		_Frost_Setting_MeterWeathersenseWidth.SetValue(CHARGE_METER_WIDTH)
	endif

	UpdateMeterConfiguration(0)
	UpdateMeterConfiguration(1)
	UpdateMeterConfiguration(2)
endFunction

function ConfigureMeter(int aiMeterIdx, int aiFillDirectionIdx, int aiHAnchorIdx, int aiVAnchorIdx, float afPositionX, float afPositionY, float afHeight, float afWidth)
	; Not configured: Color, Opacity
	Common_SKI_MeterWidget MyMeter = None
	CommonMeterInterfaceHandler MyMeterHandler = None
	if aiMeterIdx == 0
		MyMeter = ExposureMeter
		MyMeterHandler = ExposureMeterHandler
	elseif aiMeterIdx == 1
		MyMeter = WetnessMeter
		MyMeterHandler = WetnessMeterHandler
	elseif aiMeterIdx == 2
		MyMeter = WeathersenseMeter
		MyMeterHandler = WeathersenseMeterHandler
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
		; Exposure
		ConfigureMeter(0, _Frost_Setting_MeterExposureFillDirection.GetValueInt(), 	\
						  _Frost_Setting_MeterExposureHAnchor.GetValueInt(),			\
						  _Frost_Setting_MeterExposureVAnchor.GetValueInt(),			\
						  _Frost_Setting_MeterExposureXPos.GetValue(),				\
						  _Frost_Setting_MeterExposureYPos.GetValue(),				\
						  _Frost_Setting_MeterExposureHeight.GetValue(),				\
						  _Frost_Setting_MeterExposureWidth.GetValue())
	elseif aiMeterIdx == 1
		; Wetness
		ConfigureMeter(1, _Frost_Setting_MeterWetnessFillDirection.GetValueInt(), 	\
						  _Frost_Setting_MeterWetnessHAnchor.GetValueInt(),			\
						  _Frost_Setting_MeterWetnessVAnchor.GetValueInt(),			\
						  _Frost_Setting_MeterWetnessXPos.GetValue(),				\
						  _Frost_Setting_MeterWetnessYPos.GetValue(),				\
						  _Frost_Setting_MeterWetnessHeight.GetValue(),				\
						  _Frost_Setting_MeterWetnessWidth.GetValue())
	elseif aiMeterIdx == 2
		; Weathersense
		ConfigureMeter(2, _Frost_Setting_MeterWeathersenseFillDirection.GetValueInt(), 	\
						  _Frost_Setting_MeterWeathersenseHAnchor.GetValueInt(),			\
						  _Frost_Setting_MeterWeathersenseVAnchor.GetValueInt(),			\
						  _Frost_Setting_MeterWeathersenseXPos.GetValue(),				\
						  _Frost_Setting_MeterWeathersenseYPos.GetValue(),				\
						  _Frost_Setting_MeterWeathersenseHeight.GetValue(),				\
						  _Frost_Setting_MeterWeathersenseWidth.GetValue())
	endif
endFunction

function RemoveAllMeters()
	SendEvent_FrostfallRemoveExposureMeter()
	SendEvent_FrostfallRemoveWetnessMeter()
	SendEvent_FrostfallRemoveWeathersenseMeter()
endFunction

function ForceAllMeters()
	SendEvent_ForceExposureMeterDisplay()
	SendEvent_ForceWetnessMeterDisplay()
	SendEvent_ForceWeathersenseMeterDisplay()
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

function SendEvent_FrostfallRemoveExposureMeter()
	int handle = ModEvent.Create("Frostfall_RemoveExposureMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_FrostfallRemoveWetnessMeter()
	int handle = ModEvent.Create("Frostfall_RemoveWetnessMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_FrostfallRemoveWeathersenseMeter()
	int handle = ModEvent.Create("Frostfall_RemoveWeathersenseMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_ForceExposureMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("Frostfall_ForceExposureMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_ForceWetnessMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("Frostfall_ForceWetnessMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_ForceWeathersenseMeterDisplay(bool abFlash = false)
	int handle = ModEvent.Create("Frostfall_ForceWeathersenseMeterDisplay")
	if handle
		ModEvent.PushBool(handle, abFlash)
		ModEvent.Send(handle)
	endif
endFunction

; DEPRECATED
GlobalVariable property _Frost_Setting_MeterOpacity auto
{This setting is deprecated as of Frostfall 3.1.}
GlobalVariable property _Frost_Setting_MeterAspectRatio auto
{This setting is deprecated as of Frostfall 3.1.}
GlobalVariable property _Frost_Setting_1PAnimationAllowed auto
{This setting is deprecated as of Frostfall 3.0.1.}
