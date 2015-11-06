scriptname _Frost_SkyUIConfigPanelScript extends SKI_ConfigBase

string CONFIG_PATH = "../FrostfallData/"

; External scripts
_Frost_Compatibility property Compatibility auto

GlobalVariable property _Frost_AttributeExposure auto
GlobalVariable property _Frost_AttributeWetness auto
GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_AttributeCoverage auto

GlobalVariable property StartFrostfall auto
GlobalVariable property  _Frost_Setting_Animation auto
GlobalVariable property  _Frost_Setting_Animation1PAllowed auto
GlobalVariable property  _Frost_Setting_ConditionMessages auto
GlobalVariable property  _Frost_Setting_DisplayAttributesInWeathersense auto
; GlobalVariable property  _Frost_Setting_ExposureMeterHeight auto
GlobalVariable property  _Frost_Setting_ExposurePauseCombat auto
GlobalVariable property  _Frost_Setting_ExposurePauseDialogue auto
GlobalVariable property  _Frost_Setting_ExposureRate auto
GlobalVariable property  _Frost_Setting_ForceFeedback auto
GlobalVariable property  _Frost_Setting_FrostShaderOn auto
GlobalVariable property  _Frost_Setting_FullScreenEffects auto
GlobalVariable property  _Frost_Setting_LogLevel auto
GlobalVariable property  _Frost_Setting_MaxExposureMode auto
GlobalVariable property  _Frost_Setting_MeterDisplayMode auto
GlobalVariable property  _Frost_Setting_MeterDisplayTime auto
GlobalVariable property  _Frost_Setting_MeterOpacity auto
GlobalVariable property  _Frost_Setting_MovementPenalty auto
GlobalVariable property  _Frost_Setting_NoFastTravel auto
GlobalVariable property  _Frost_Setting_SoundEffects auto
GlobalVariable property  _Frost_Setting_WeatherMessages auto
GlobalVariable property  _Frost_Setting_WeathersenseDisplayMode auto
GlobalVariable property  _Frost_Setting_WetShaderOn auto
GlobalVariable property  _Frost_Setting_CurrentProfile auto
GlobalVariable property  _Frost_Setting_AutoSaveLoad auto

string[] ProfileList

int Overview_RunStatusText_OID
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

int SaveLoad_SelectProfile_OID
int SaveLoad_RenameProfile_OID
int SaveLoad_DefaultProfile_OID
int SaveLoad_ProfileHelp_OID
int SaveLoad_Enable_OID

Event OnConfigInit()
	Pages = new string[4]
	Pages[0] = "$FrostfallOverviewPage"
	Pages[1] = "$FrostfallGameplayPage"
	Pages[2] = "$FrostfallEquipmentPage"
	Pages[3] = "$FrostfallInterfacePage"
	Pages[4] = "$CampfireSaveLoadPage"
	Pages[5] = "$FrostfallGuidePage"
	Pages[6] = "$CampfireSystemPage"
endEvent

int function GetVersion()
	return 1
endFunction

Event OnVersionUpdate(int a_version)
	; Pass
EndEvent

function PageReset_Overview()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$FrostfallOverviewHeaderStatus")
	if StartFrostfall.GetValueInt() == 2
		Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallEnabled")
	else
		Overview_RunStatusText_OID = AddTextOption("$FrostfallOverviewCtrlStatus", "$FrostfallDisabled")
	endif
	
	AddEmptyOption()
	AddHeaderOption("$FrostfallOverviewHeaderInfo")
	Overview_InfoLine1_OID = AddTextOption("", "")
	Overview_InfoLine2_OID = AddTextOption("", "")
	Overview_InfoLine3_OID = AddTextOption("", "")
	Overview_InfoLine4_OID = AddTextOption("", "")
	Overview_InfoLine5_OID = AddTextOption("", "")
	Overview_InfoLine6_OID = AddTextOption("", "")
	Overview_InfoLine7_OID = AddTextOption("", "")
	Overview_InfoLine8_OID = AddTextOption("", "")

	SetCursorPosition(1) ; Move cursor to top right position

	AddHeaderOption("$FrostfallOverviewHeaderPlayerAttributes")
	if GetExposureSystem().IsSystemRunning()
		Overview_ExposureStatusText_OID = AddTextOption("$FrostfallOverviewExposureValue", _Frost_AttributeExposure.GetValueInt(), OPTION_FLAG_DISABLED)
	else
		Overview_ExposureStatusText_OID = AddTextOption("$FrostfallOverviewExposureValue", "", OPTION_FLAG_DISABLED)
	endif
	if GetWetnessSystem().IsSystemRunning()
		Overview_WetnessStatusText_OID = AddTextOption("$FrostfallOverviewWetnessValue", _Frost_AttributeWetness.GetValueInt(), OPTION_FLAG_DISABLED)
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

endFunction

function PageReset_Interface()

endFunction

function PageReset_Guide()

endFunction

function PageReset_SaveLoad()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$FrostfallSaveLoadHeaderProfile")
	if _Camp_Setting_AutoSaveLoad.GetValueInt() == 2
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