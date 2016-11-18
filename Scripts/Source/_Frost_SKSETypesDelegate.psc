scriptname _Frost_SKSETypesDelegate extends Quest
{The intention of this script is to provide a common way to access objects that require
accessing types that will make the game blow up if SKSE is not available through the
use of Mod Events.}

import FrostUtil

GlobalVariable property _Frost_Setting_MeterExposureColor auto
GlobalVariable property _Frost_Setting_MeterExposureColorWarm auto
GlobalVariable property _Frost_AttributeExposureMeter auto

_Frost_ExposureMeterInterfaceHandler property ExposureMeterHandler auto
_Frost_WetnessMeterInterfaceHandler property WetnessMeterHandler auto
_Frost_SkyUIConfigPanelScript property FrostConfig Auto

string CONFIG_PATH = "../FrostfallData/"

Event OnInit()
	if !self.IsRunning()
		self.Start()
	endif
	RegisterForAllEvents()
EndEvent

function RegisterForAllEvents()
	RegisterForModEvent("Frostfall_Upgrade_3_2", "Upgrade_3_2")
	RegisterForModEvent("Frostfall_Upgrade_3_2_1", "Upgrade_3_2_1")
	RegisterForModEvent("Frostfall_LoadProfileOnStartup", "LoadProfileOnStartup")
	RegisterForModEvent("Frostfall_SaveSettingToCurrentProfile", "SaveSettingToCurrentProfile")
	RegisterForModEvent("Frostfall_ApplyMeterPreset", "ApplyMeterPreset")
	RegisterForModEvent("Frostfall_RegisterForKeysOnLoad", "RegisterForKeysOnLoad")
	RegisterForModEvent("Frostfall_CheckInterfacePackage", "Compatibility_CheckInterfacePackage")
endFunction

Event Upgrade_3_2()
	SKI_WidgetManager manager = (Game.GetFormFromFile(0x00000824, "SkyUI.esp") as Quest) as SKI_WidgetManager
	int id = ((ExposureMeterHandler as Quest) as _Frost_Meter).WidgetID		
	manager.CreateWidget(id, "frostfall/meterIndicator.swf")
	ExposureMeterHandler.meter_inversion_value = -1.0
	ExposureMeterHandler.improvement_display_delta_threshold = 2.0
	ExposureMeterHandler.SetMeterColors(_Frost_Setting_MeterExposureColor.GetValueInt(), -1)

	WetnessMeterHandler.improvement_display_delta_threshold = 30.0
endEvent

Event Upgrade_3_2_1()
	; Upgraded from previous version, further meter tweaks.
	ExposureMeterHandler.AttributeValue = _Frost_AttributeExposureMeter
	ExposureMeterHandler.contextual_display_thresholds = new float[5]
	ExposureMeterHandler.contextual_display_thresholds[0] = 0.0
	ExposureMeterHandler.contextual_display_thresholds[1] = 20.0
	ExposureMeterHandler.contextual_display_thresholds[2] = 40.0
	ExposureMeterHandler.contextual_display_thresholds[3] = 60.0
	ExposureMeterHandler.contextual_display_thresholds[4] = 80.0
	_Frost_Setting_MeterExposureColorWarm.SetValueInt(0xCC0000)
endEvent

Event LoadProfileOnStartup()
	FrostConfig.LoadProfileOnStartup()
endEvent

Event SaveSettingToCurrentProfile(string asKey, int aiValue)
	FrostConfig.SaveSettingToCurrentProfile(asKey, aiValue)
endEvent

Event ApplyMeterPreset(int aiValue)
	FrostConfig.ApplyMeterPreset(aiValue)
endEvent

Event RegisterForKeysOnLoad()
	FrostConfig.RegisterForKeysOnLoad()
endEvent

Event Compatibility_CheckInterfacePackage()
	int ui_package_version_installed = JsonUtil.GetIntValue(CONFIG_PATH + "interface_package_version", "installed_package_version")
	if ui_package_version_installed == 6
		SKI_Main skyui = Game.GetFormFromFile(0x00000814, "SkyUI.esp") as SKI_Main
		int skyui_version = skyui.ReqSWFRelease
		if skyui_version >= 1026 	; SkyUI 5.1+
			GetCompatibilitySystem().isUIPackageInstalled = true
			debug.trace("[Frostfall] Detected optional SkyUI Interface Package version " + ui_package_version_installed + " and SkyUI version " + skyui_version + ", success!")
		else
			GetCompatibilitySystem().isUIPackageInstalled = false
			GetCompatibilitySystem().FatalErrorSkyUIPackage(5)
		endif
	elseif ui_package_version_installed == 5
		GetCompatibilitySystem().FatalErrorSkyUIPackageOld()
	else
		GetCompatibilitySystem().isUIPackageInstalled = false
	endif
endEvent