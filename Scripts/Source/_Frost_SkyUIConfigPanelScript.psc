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
GlobalVariable property _Frost_Setting_Notifications_EquipmentValues auto
GlobalVariable property _Frost_HotkeyWeathersense auto
GlobalVariable property _Frost_Setting_FollowerAnimation auto
GlobalVariable property _Frost_Setting_MeterAspectRatio auto
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

Spell property _Frost_Weathersense_Spell auto

bool must_exit = false

string[] ProfileList
string[] MaxExposureModeList
string[] VampirismModeList
string[] AspectRatioList
string[] MeterDisplayModeList
string[] GearTypeList
string[] ProtectionList

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
int Interface_MeterAspectRatio_OID
int Interface_MeterDisplayTime_OID
int Interface_MeterOpacity_OID
int Interface_MeterDisplayMode_OID
int Interface_DisplayAttributesInWeathersense_OID
int Interface_ConditionMessages_OID
int Interface_WeatherMessages_OID
int Interface_Notifications_EquipmentValues_OID
int Interface_Notifications_EquipmentSummary_OID

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
int[] Armor_WarmthSliderOIDs
int[] Armor_CoverageSliderOIDs
int[] Armor_GearTypeOIDs
int[] Armor_ModifyPartsOIDs
int[] Armor_SetProtectionOIDs
int[] Armor_DefaultArmorEntryOIDs
int Armor_ShowTutorialOID

int ArmorPage_cursor_position = 0
bool ArmorPage_updated_msg = false


Event OnConfigInit()
	Pages = new string[6]
	Pages[0] = "$FrostfallOverviewPage"
	Pages[1] = "$FrostfallGameplayPage"
	Pages[2] = "$FrostfallEquipmentPage"
	Pages[3] = "$FrostfallInterfacePage"
	Pages[4] = "$FrostfallSaveLoadPage"
	Pages[5] = "$FrostfallAdvancedPage"

	MaxExposureModeList = new string[3]
	MaxExposureModeList[0] = "$FrostfallMaxExposureNothing"
	MaxExposureModeList[1] = "$FrostfallMaxExposureRescue"
	MaxExposureModeList[2] = "$FrostfallMaxExposureDeath"

	VampirismModeList = new string[2]
	VampirismModeList[0] = "$FrostfallVampirismHuman"
	VampirismModeList[1] = "$FrostfallVampirismSuperhuman"

	AspectRatioList = new string[3]
	AspectRatioList[0] = "4:3"
	AspectRatioList[1] = "16:9"
	AspectRatioList[2] = "16:10"

	MeterDisplayModeList = new string[3]
	MeterDisplayModeList[0] = "$FrostfallOff"
	MeterDisplayModeList[1] = "$FrostfallAlwaysOn"
	MeterDisplayModeList[2] = "$FrostfallContextual"

	GearTypeList = new string[8]
	GearTypeList[0] = "Body"
	GearTypeList[1] = "Head"
	GearTypeList[2] = "Hands"
	GearTypeList[3] = "Feet"
	GearTypeList[4] = "Cloak"
	GearTypeList[5] = "Accessory"
	GearTypeList[6] = "No Protection"
	GearTypeList[7] = "Cancel"

	ProtectionList = new string[28]
	ProtectionList[0] = "== CLOTHING =="
	ProtectionList[1] = "Thin Clothing (W: Poor, C: None)"
	ProtectionList[2] = "Typical Clothing (W: Fair, C: Low)"
	ProtectionList[3] = "Warm Clothing (W: Good, C: Low)"
	ProtectionList[4] = "== EQUIPMENT - WARM =="
	ProtectionList[5] = "Layered (W: Good, C: Fair)"
	ProtectionList[6] = "Insulated (W: Excellent, C: Fair)"
	ProtectionList[7] = "Frostforged (W: Max, C: Good)"
	ProtectionList[8] = "== EQUIPMENT - COVERING =="
	ProtectionList[9] = "Tight-Stitched (W: Fair, C: Good)"
	ProtectionList[10] = "Fitted (W: Fair, C: Excellent)"
	ProtectionList[11] = "Sealed (W: Good, C: Max)"
	ProtectionList[12] = "== EQUIPMENT - BALANCED =="
	ProtectionList[13] = "Low-Grade (W: Low, C: Low)"
	ProtectionList[14] = "Standard Issue (W: Fair, C: Fair)"
	ProtectionList[15] = "Rugged (W: Good, C: Good)"
	ProtectionList[16] = "Exceptional (W: Excellent, C: Excellent)"
	ProtectionList[17] = "Legendary (W: Max, C: Max)"
	ProtectionList[18] = "== ACCESSORIES =="
	ProtectionList[19] = "Warm Accessory (W: Good, C: Low)"
	ProtectionList[20] = "Weatherproof Accessory (W: Low, C: Good)"
	ProtectionList[21] = "Cloth Cloak (W: Fair, C: Fair)"
	ProtectionList[22] = "Leather Cloak (W: Fair, C: Good)"
	ProtectionList[23] = "Fur Cloak (W: Good, C: Fair)"
	ProtectionList[24] = "== OPTIONS =="
	ProtectionList[25] = "Set Values Manually"
	ProtectionList[26] = "Restore Item Defaults"
	ProtectionList[27] = "Cancel"
	
endEvent

int function GetVersion()
	return 2
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

	; Register for callbacks
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
			Overview_InfoLine1_OID = AddTextOption("", "", OPTION_FLAG_DISABLED)
			Overview_InfoLine2_OID = AddTextOption("$FrostfallStartUpProgress", "$FrostfallStartUpWorking")
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

	GenerateEquipmentPage()

	if ArmorPage_updated_msg
		ShowMessage("Changes applied. Page was updated to reflect changes.")
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
	if _Frost_Setting_Animation.GetValueInt() == 2
		Interface_Animation_OID = AddToggleOption("$FrostfallInterfaceSettingAnimation", true)
	else
		Interface_Animation_OID = AddToggleOption("$FrostfallInterfaceSettingAnimation", false)
	endif
	if _Frost_Setting_FollowerAnimation.GetValueInt() == 2
		Interface_FollowerAnimation_OID = AddToggleOption("$FrostfallInterfaceSettingFollowerAnimation", true)
	else
		Interface_FollowerAnimation_OID = AddToggleOption("$FrostfallInterfaceSettingFollowerAnimation", false)
	endif

	SetCursorPosition(1)
	AddHeaderOption("$FrostfallInterfaceHeaderUserInterface")
	Interface_MeterAspectRatio_OID = AddMenuOption("$FrostfallInterfaceSettingAspectRatio", AspectRatioList[_Frost_Setting_MeterAspectRatio.GetValueInt()])
	Interface_MeterDisplayMode_OID = AddMenuOption("$FrostfallInterfaceSettingMeterDisplayMode", MeterDisplayModeList[_Frost_Setting_MeterDisplayMode.GetValueInt()])
	Interface_MeterDisplayTime_OID = AddSliderOption("$FrostfallInterfaceSettingMeterDisplaytime", _Frost_Setting_MeterDisplayTime.GetValueInt(), "{0}")
	Interface_MeterOpacity_OID = AddSliderOption("$FrostfallInterfaceSettingMeterOpacity", _Frost_Setting_MeterOpacity.GetValue(), "{0}%")
	AddEmptyOption()
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
	if _Frost_Setting_DisplayAttributesInWeathersense.GetValueInt() == 2
		Interface_DisplayAttributesInWeathersense_OID = AddToggleOption("$FrostfallInterfaceSettingWeathersense", true)
	else
		Interface_DisplayAttributesInWeathersense_OID = AddToggleOption("$FrostfallInterfaceSettingWeathersense", false)
	endif
	if Compatibility.isUIPackageInstalled
		Interface_Notifications_EquipmentValues_OID = AddToggleOption("$FrostfallInterfaceSettingEquipmentValues", false, OPTION_FLAG_DISABLED)
		Interface_Notifications_EquipmentSummary_OID = AddToggleOption("$FrostfallInterfaceSettingEquipmentSummary", false, OPTION_FLAG_DISABLED)
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
	elseif option == Interface_Animation_OID
		if _Frost_Setting_Animation.GetValueInt() == 2
			_Frost_Setting_Animation.SetValueInt(1)
			SetToggleOptionValue(Interface_Animation_OID, false)
		else
			_Frost_Setting_Animation.SetValueInt(2)
			SetToggleOptionValue(Interface_Animation_OID, true)
		endif
		SaveSettingToCurrentProfile("animation", _Frost_Setting_Animation.GetValueInt())
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
	endif	
endEvent

event OnOptionDefault(int option)
	if option == Interface_Animation_OID
		_Frost_Setting_Animation.SetValueInt(2)
		SetToggleOptionValue(Interface_Animation_OID, true)
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
	elseif option == Interface_MeterDisplayTime_OID
		_Frost_Setting_MeterDisplayTime.SetValueInt(3)
		SetSliderOptionValue(Interface_MeterDisplayTime_OID, 3.0, "{0}")
		SaveSettingToCurrentProfile("meter_display_time", _Frost_Setting_MeterDisplayTime.GetValueInt())
	elseif option == Interface_MeterOpacity_OID
		_Frost_Setting_MeterOpacity.SetValue(100.0)
		SetSliderOptionValue(Interface_MeterOpacity_OID, 100.0, "{0}%")
		SaveSettingToCurrentProfileFloat("meter_opacity", _Frost_Setting_MeterOpacity.GetValue())

	elseif option == Gameplay_MaxExposureMode_OID
		_Frost_Setting_MaxExposureMode.SetValueInt(2)
		SetMenuOptionValue(Gameplay_MaxExposureMode_OID, MaxExposureModeList[1])
		SaveSettingToCurrentProfile("max_exposure_mode", _Frost_Setting_MaxExposureMode.GetValueInt())
	elseif option == Interface_MeterDisplayMode_OID
		_Frost_Setting_MeterDisplayMode.SetValueInt(2)
		SetMenuOptionValue(Interface_MeterDisplayMode_OID, MeterDisplayModeList[2])
		SaveSettingToCurrentProfile("meter_display_mode", _Frost_Setting_MeterDisplayMode.GetValueInt())
		GetInterfaceHandler().RemoveAllMeters()
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
	elseif option == Interface_MeterAspectRatio_OID
		SetInfoText("$FrostfallOptionHighlightUIAspectRatio")
	elseif option == Interface_MeterDisplayTime_OID
		SetInfoText("$FrostfallOptionHightlightUIMeterDisplayTime")
	elseif option == Interface_MeterOpacity_OID
		SetInfoText("$FrostfallOptionHightlightUIMeterOpacity")
	elseif option == Interface_MeterDisplayMode_OID
		SetInfoText("$FrostfallOptionHightlightUIMeterDisplay")
	elseif option == Interface_ConditionMessages_OID
		SetInfoText("$FrostfallOptionHighlightSettingConditionMsgToggle")
	elseif option == Interface_WeatherMessages_OID
		SetInfoText("$FrostfallOptionHighlightSettingWeatherMsgToggle")
	elseif option == Interface_DisplayAttributesInWeathersense_OID
		SetInfoText("$FrostfallOptionHighlightSettingExpValueMsgToggle")
	elseif option == Interface_Notifications_EquipmentValues_OID
		SetInfoText("$FrostfallOptionHighlightSettingEquipValuesMsgToggle")
	elseif option == Interface_Notifications_EquipmentSummary_OID
		SetInfoText("$FrostfallOptionHighlightSettingEquipSummaryMsgToggle")
	elseif option == Advanced_EnduranceSkillRespec_OID
		SetInfoText("$FrostfallOptionHighlightSettingRespec")
	elseif option == Advanced_EnduranceSkillRestore_OID
		SetInfoText("$FrostfallOptionHighlightSettingRestore")
	endif
EndEvent

Event OnOptionSliderOpen(int option)
	if option == Gameplay_ExposureRate_OID
		SetSliderDialogStartValue(_Frost_Setting_ExposureRate.GetValue())
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 3.0)
		SetSliderDialogInterval(0.1)
	elseif option == Interface_MeterDisplayTime_OID
		SetSliderDialogStartValue(_Frost_Setting_MeterDisplayTime.GetValue())
		SetSliderDialogDefaultValue(3.0)
		SetSliderDialogRange(1.0, 10.0)
		SetSliderDialogInterval(1.0)
	elseif option == Interface_MeterOpacity_OID
		SetSliderDialogStartValue(_Frost_Setting_MeterOpacity.GetValue())
		SetSliderDialogDefaultValue(100.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif option == Advanced_EnduranceSkillRestoreSlider_OID
		SetSliderDialogStartValue(0.0)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0, EndurancePerkPointsTotal.GetValue())
		SetSliderDialogInterval(1.0)
	endif
EndEvent

Event OnOptionSliderAccept(int option, float value)
	if option == Gameplay_ExposureRate_OID
		_Frost_Setting_ExposureRate.SetValue(value)
		SetSliderOptionValue(Gameplay_ExposureRate_OID, value, "{1}x")
		SaveSettingToCurrentProfileFloat("exposure_rate", _Frost_Setting_ExposureRate.GetValue())
	elseif option == Interface_MeterDisplayTime_OID
		_Frost_Setting_MeterDisplayTime.SetValue(value)
		SetSliderOptionValue(Interface_MeterDisplayTime_OID, value, "{0}")
		SaveSettingToCurrentProfileFloat("meter_display_time", _Frost_Setting_MeterDisplayTime.GetValue())
	elseif option == Interface_MeterOpacity_OID
		_Frost_Setting_MeterOpacity.SetValue(value)
		SetSliderOptionValue(Interface_MeterOpacity_OID, value, "{0}%")
		SaveSettingToCurrentProfileFloat("meter_opacity", _Frost_Setting_MeterOpacity.GetValue())
	elseif option == Advanced_EnduranceSkillRestoreSlider_OID
		EndurancePerkPointProgress.SetValue(0.0)
		EndurancePerkPoints.SetValue(value)
		EndurancePerkPointsEarned.SetValue(value)
		ClearEndurancePerks()
		ShowMessage("$FrostfallAdvancedEnduranceSkillRestoreDone", false)
		SetOptionFlags(Advanced_EnduranceSkillRestoreSlider_OID, OPTION_FLAG_DISABLED, true)
		SetToggleOptionValue(Advanced_EnduranceSkillRestore_OID, false)
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
	elseif option == Interface_MeterAspectRatio_OID
		SetMenuDialogOptions(AspectRatioList)
		SetMenuDialogStartIndex(_Frost_Setting_MeterAspectRatio.GetValueInt())
		SetMenuDialogDefaultIndex(0)
	elseif option == Interface_MeterDisplayMode_OID
		SetMenuDialogOptions(MeterDisplayModeList)
		SetMenuDialogStartIndex(_Frost_Setting_MeterDisplayMode.GetValueInt())
		SetMenuDialogDefaultIndex(2)
	else
		bool found_armor_entry_oid = false
		int idx = -1

		if !found_armor_entry_oid
			idx = Armor_GearTypeOIDs.Find(option)
			if idx != -1
				SetMenuDialogOptions(GearTypeList)
				SetMenuDialogStartIndex(0) ;@TODO: Can I know this?
				SetMenuDialogDefaultIndex(0)
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_SetProtectionOIDs.Find(option)
			if idx != -1
				SetMenuDialogOptions(ProtectionList)
				SetMenuDialogStartIndex(0)
				SetMenuDialogDefaultIndex(0)
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_ModifyPartsOIDs.Find(option)
			if idx != -1
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
	elseif option == Interface_MeterAspectRatio_OID
		SetMenuOptionValue(Interface_MeterAspectRatio_OID, AspectRatioList[index])
		_Frost_Setting_MeterAspectRatio.SetValueInt(index)
		GetInterfaceHandler().SetAspectRatio(index)
		SaveSettingToCurrentProfile("meter_aspect_ratio", _Frost_Setting_MeterAspectRatio.GetValueInt())
	elseif option == Interface_MeterDisplayMode_OID
		SetMenuOptionValue(Interface_MeterDisplayMode_OID, MeterDisplayModeList[index])
		_Frost_Setting_MeterDisplayMode.SetValueInt(index)
		if index == 1
			GetInterfaceHandler().ForceAllMeters()
		else
			GetInterfaceHandler().RemoveAllMeters()
		endif
		SaveSettingToCurrentProfile("meter_display_mode", _Frost_Setting_MeterDisplayMode.GetValueInt())

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
				found_armor_entry_oid = true
			endif
		endif

		if !found_armor_entry_oid
			idx = Armor_ModifyPartsOIDs.Find(option)
			if idx != -1
				found_armor_entry_oid = true
			endif
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
	;bool b = JsonUtil.Load(CONFIG_PATH + "profile" + aiProfileIndex)
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
		if val == 1
			GetInterfaceHandler().ForceAllMeters()
		else
			GetInterfaceHandler().RemoveAllMeters()
		endif
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
	val = LoadSettingFromProfile(aiProfileIndex, "display_tutorials")
	if val != -1
		_Frost_Setting_DisplayTutorials.SetValueInt(val)
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

	; Update the player's currently worn armor values.
	_Frost_ClothingSystem clothing = GetClothingSystem()
	clothing.RefreshWornGearData(clothing.WornGearForms, clothing._Frost_WornGearData)
	clothing.SendEvent_UpdateWarmthAndCoverage()
endFunction

function GenerateDefaultProfile(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex
	JsonUtil.SetStringValue(profile_path, "profile_name", "Profile " + aiProfileIndex)
	JsonUtil.SetIntValue(profile_path, "profile_version", _Frost_SettingsProfileVersion.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "animation", 2)
	JsonUtil.SetIntValue(profile_path, "follower_animation", 2)
	JsonUtil.SetIntValue(profile_path, "condition_messages", 2)
	JsonUtil.SetIntValue(profile_path, "display_attributes_in_weathersense", 1)
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
	JsonUtil.SetFloatValue(profile_path, "meter_opacity", _Frost_Setting_MeterOpacity.GetValue())
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
	JsonUtil.Save(profile_path)
endFunction

function ShowProfileHelp()
	ShowMessage("$FrostfallSaveLoadTopic", false)
	ShowMessage("$FrostfallSaveLoadTopicCont", false)
	ShowMessage("$FrostfallSaveLoadTopicCont2", false)
endFunction

Event StartupAlmostDone()
	if CurrentPage == "$FrostfallOverviewPage" && Overview_InfoLine7_OID
		Utility.WaitMenuMode(1.0)
		SetTextOptionValue(Overview_InfoLine2_OID, "$FrostfallGeneralExitMenuPrompt")
	endif
endEvent

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
	;AddTextOption("Fetching info...", "", OPTION_FLAG_DISABLED)

	SetCursorPosition(0)
	ArmorPage_cursor_position = 0

	_Frost_ClothingSystem clothing = GetClothingSystem()
	_Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()
	Armor[] worn_armor = GetAllWornArmor()

	ArmorMenuEntries = new Armor[128]
	Armor_WarmthSliderOIDs = new int[128]
	Armor_CoverageSliderOIDs = new int[128]
	Armor_GearTypeOIDs = new int[128]
	Armor_ModifyPartsOIDs = new int[128]
	Armor_SetProtectionOIDs = new int[128]
	Armor_DefaultArmorEntryOIDs = new int[128]

	int armor_count = clothing.ArrayCountArmor(worn_armor)
	
	int i = 0
	int j = 0
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

	if abIsMainPart
		AddHeaderOption(akArmor.GetName())
	else
		AddHeaderOption(akArmor.GetName() + GetDescriptiveTypeString(aiType, akHandler))
	endif

	if abIsMainPart
		Armor_GearTypeOIDs[aiArrayIndex] = AddMenuOption("Type:", GetTypeString(aiType, akHandler))
	else
		Armor_GearTypeOIDs[aiArrayIndex] = AddMenuOption("Type:", GetTypeString(aiType, akHandler), OPTION_FLAG_DISABLED)
	endif

	Armor_WarmthSliderOIDs[aiArrayIndex] = AddSliderOption("Warmth:", akWarmth, "{0}", OPTION_FLAG_DISABLED)
	Armor_CoverageSliderOIDs[aiArrayIndex] = AddSliderOption("Coverage:", akCoverage, "{0}", OPTION_FLAG_DISABLED)
	Armor_SetProtectionOIDs[aiArrayIndex] = AddMenuOption("Set Protection...", "", aiDisableIfIgnored)

	if abIsMainPart
		Armor_ModifyPartsOIDs[aiArrayIndex] = AddMenuOption("Extra Parts...", "", aiDisableIfIgnored)
	else
		AddEmptyOption()
	endif

	; Set the cursor position for the next entry
	if IsEven(ArmorPage_cursor_position)
		ArmorPage_cursor_position += 1
	else
		ArmorPage_cursor_position += 11
	endif

	;Armor_DefaultArmorEntryOIDs[aiArrayIndex] = AddTextOption("Restore Item Defaults", "", aiDisableIfIgnored)
endFunction

function GenerateEquipmentPageFooter()
	SetCursorPosition(ArmorPage_cursor_position)
	SetCursorFillMode(LEFT_TO_RIGHT)
	AddHeaderOption("Options")
	AddHeaderOption("Info")
	AddTextOption("Repair Default Item Data", "")
	Armor_ShowTutorialOID = AddTextOption("About This Page", "")
	AddTextOption("Restore Defaults for Worn Items", "")
	AddEmptyOption()
	AddTextOption("Restore Defaults for ALL Items", "")

endFunction

function ModifyGearProtection(int aiOidIndex, int aiChoice)

endFunction

function ModifyGearWarmth(int aiOIDIndex)

endFunction

function ModifyGearCoverage(int aiOIDIndex)

endFunction

function ModifyGearType(int aiOIDIndex, int aiChoice)
	if aiChoice == 7
		return
	endif

	bool confirmed = ShowMessage("Are you sure you want to change this kind of equipment's type?\n\n(Note: This choice is for Frostfall only and has no effect on armor rating, equipment slot, or any other aspect of how it is handled by the rest of the game.)")
	
	if confirmed
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

		ArmorPage_updated_msg = true
		ForcePageReset()

		; Update currently worn armor data in-place and force recalculate
		_Frost_ClothingSystem clothing = GetClothingSystem()
		bool b = clothing.RemoveWornGearEntryForArmorUnequipped(the_armor, clothing.WornGearForms, clothing._Frost_WornGearData)
		b = clothing.AddWornGearEntryForArmorEquipped(the_armor, clothing.WornGearForms, clothing._Frost_WornGearData)
		clothing.RecalculateProtectionData(clothing.WornGearForms, clothing.WornGearValues, clothing._Frost_WornGearData)
		clothing.SendEvent_UpdateWarmthAndCoverage()
	endif
endFunction

function ModifyGearAdditionalParts()

endFunction

function RestoreItemDefaultValues()

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
    debug.trace("wornArmor: " + wornArmor)
    return wornArmor
endFunction

string function GetTypeString(int aiType, _Frost_ArmorProtectionDatastoreHandler akHandler)
	if aiType == akHandler.GEARTYPE_BODY
		return "Body"
	elseif aiType == akHandler.GEARTYPE_HEAD
		return "Head"
	elseif aiType == akHandler.GEARTYPE_HANDS
		return "Hands"
	elseif aiType == akHandler.GEARTYPE_FEET
		return "Feet"
	elseif aiType == akHandler.GEARTYPE_CLOAK
		return "Cloak"
	elseif aiType == akHandler.GEARTYPE_MISC
		return "Accessory"
	elseif aiType == akHandler.GEARTYPE_IGNORE
		return "No Protection"
	else
		return "N/A"
	endif
endFunction

string function GetDescriptiveTypeString(int aiType, _Frost_ArmorProtectionDatastoreHandler akHandler)
	if aiType == akHandler.GEARTYPE_BODY
		return "'s Body Gear"
	elseif aiType == akHandler.GEARTYPE_HEAD
		return "'s Head Gear"
	elseif aiType == akHandler.GEARTYPE_HANDS
		return "'s Hand Gear"
	elseif aiType == akHandler.GEARTYPE_FEET
		return "'s Foot Gear"
	elseif aiType == akHandler.GEARTYPE_CLOAK
		return "'s Cloak"
	elseif aiType == akHandler.GEARTYPE_MISC
		return "'s Accessory"
	endif
endFunction

function ShowTutorial_ArmorPage(bool abForceDisplay = false)
	ShowMessage("Setting Protection\n\nClick 'Set Protection...', and select one of the options that appear. This will set up your equipment with appropriate values for option you selected and the gear's type.", false)
	ShowMessage("Types\n\nFrostfall will count the protection of one piece of worn Body, Head, Hands, Feet, and Cloak gear at a time. However, all worn Accessories will be counted. If necessary, you can edit the gear's type by clicking the Type option.", false)
	ShowMessage("Undoing Changes\n\nTo restore a piece of gear to its default values, select 'Set Protection...', scroll to the bottom, and select 'Restore Item Defaults'.\n\nTo restore the default values of ALL equipment in the entire game (effectively deleting all of your profile's custom gear settings), select 'Restore Defaults for ALL Items' at the bottom of the page.", false)
endFunction

bool function IsEven(int aiValue)
    return aiValue % 2 == 0
endFunction

; DEPRECATED
GlobalVariable property _Frost_Setting_1PAnimationAllowed auto
{This setting is deprecated as of Frostfall 3.0.1.}