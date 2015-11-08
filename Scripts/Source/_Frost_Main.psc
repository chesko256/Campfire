Scriptname _Frost_Main extends Quest
{This script handles starting the mod for the first time, setting appropriate start-up aliases, and running compatibility on startup.}

import FrostUtil

Actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto
GlobalVariable property _Frost_DatastoreInitialized auto

Event OnInit()
	; pass	
EndEvent

Event OnUpdate()
	;if the mod hasn't ever been activated && we're staring up at the night sky
	;	StartModFirstTime()
	;	FrostUtil.GetExposureSystem().StartSystem()
	;else
	;	RegisterForSingleUpdate(5)
	;endif
EndEvent

function StartFrostfall()
	if !self.IsRunning()
		self.Start()
	endif
	PlayerAlias.ForceRefTo(PlayerRef)
	if _Frost_DatastoreInitialized.GetValueInt() != 2
		GetClothingDatastoreHandler().StartDatastore()
	endif
	StartAllSystems()
	GetCompatibilitySystem().RunCompatibility()
endFunction

function StopFrostfall()
	if self.IsRunning()
		self.Stop()
	endif
	PlayerAlias.Clear()
	StopAllSystems()
endFunction

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