Scriptname _Frost_Main extends Quest
{This script handles starting the mod for the first time, setting appropriate start-up aliases, and running compatibility on startup.}

import FrostUtil
import _FrostInternal

Actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto
GlobalVariable property _Frost_DatastoreInitialized auto

Event OnInit()
	; pass	
EndEvent

function RegisterForModEvents()
	RegisterForModEvent("Frost_StartFrostfall", "StartFrostfall")
	RegisterForModEvent("Frost_StopFrostfall", "StopFrostfall")
endFunction

Event StartFrostfall()
	FrostDebug(1, "Starting Frostfall...")
	GetClothingDatastoreHandler().InitializeDatastore()

	; Prompt player to exit menu now.
	SendEvent_StartupAlmostDone()

	; Menu-Mode blocked functions
	if !self.IsRunning()
		self.Start()
	endif
	PlayerAlias.ForceRefTo(PlayerRef)
	StartAllSystems()
	GetCompatibilitySystem().RunCompatibility()
endEvent

Event StopFrostfall()
	if self.IsRunning()
		self.Stop()
	endif
	PlayerAlias.Clear()
	StopAllSystems()
endEvent

function StartAllSystems()
	GetClimateSystem().StartSystem()
	GetHeatSourceSystem().StartSystem()
	GetClothingSystem().StartSystem()
	GetRescueSystem().StartSystem()
	GetShelterSystem().StartSystem()
	GetWarmthSystem().StartSystem()
	GetCoverageSystem().StartSystem()
	GetExposureSystem().StartSystem()
	GetWetnessSystem().StartSystem()
endFunction

function StopAllSystems()
	GetClothingDatastoreHandler().StopSystem()
	GetClimateSystem().StopSystem()
	GetHeatSourceSystem().StopSystem()
	GetClothingSystem().StopSystem()
	GetRescueSystem().StopSystem()
	GetShelterSystem().StopSystem()
	GetWarmthSystem().StopSystem()
	GetCoverageSystem().StopSystem()
	GetExposureSystem().StopSystem()
	GetWetnessSystem().StopSystem()
endFunction

function StartModFirstTime()
	; Display the message
	; Give the book
endFunction

function SendEvent_StartupAlmostDone()
    int handle = ModEvent.Create("Frost_StartupAlmostDone")
    if handle
        ModEvent.Send(handle)
    endif
endFunction