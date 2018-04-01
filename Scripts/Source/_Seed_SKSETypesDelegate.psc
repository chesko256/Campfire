scriptname _Seed_SKSETypesDelegate extends Quest
{The intention of this script is to provide a common way to access objects that require
accessing types that will make the game blow up if SKSE is not available through the
use of Mod Events.}

import SeedUtil

_Seed_SkyUIConfigPanelScript property SeedConfig Auto

string CONFIG_PATH = "../LastSeedData/"

Event OnInit()
	if !self.IsRunning()
		self.Start()
	endif
	RegisterForAllEvents()
EndEvent

function RegisterForAllEvents()
	RegisterForModEvent("LastSeed_LoadProfileOnStartup", "LoadProfileOnStartup")
	RegisterForModEvent("LastSeed_SaveSettingToCurrentProfile", "SaveSettingToCurrentProfile")
	RegisterForModEvent("LastSeed_ApplyMeterPreset", "ApplyMeterPreset")
	RegisterForModEvent("LastSeed_RegisterForKeysOnLoad", "RegisterForKeysOnLoad")
endFunction

Event LoadProfileOnStartup()
	SeedConfig.LoadProfileOnStartup()
endEvent

Event SaveSettingToCurrentProfile(string asKey, int aiValue)
	SeedConfig.SaveSettingToCurrentProfile(asKey, aiValue)
endEvent

Event ApplyMeterPreset(int aiValue)
	SeedConfig.ApplyMeterPreset(aiValue)
endEvent

Event RegisterForKeysOnLoad()
	SeedConfig.RegisterForKeysOnLoad()
endEvent
