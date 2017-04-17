scriptname _Seed_Main extends Quest

import CampUtil
import SeedUtil
import _SeedInternal

Actor property PlayerRef auto
Activator property _Seed_PerkNodeController_Provisioning auto
ReferenceAlias property PlayerAlias auto
GlobalVariable property LastSeedRunning auto
Message property _Seed_StartSleepMsg auto
Message property _Seed_StartingUpMsg auto
Message property _Seed_StartingUpDoneMsg auto
Message property _Seed_FirstStartup_1 auto
Message property _Seed_FirstStartup_2 auto
Message property _Seed_FirstStartup_3 auto
Message property _Seed_FirstStartup_3SE auto
Quest property _Seed_TrackingQuest auto

bool started_via_sleep = false
bool isSKYUILoaded = false

Event OnInit()
	isSKYUILoaded = Game.GetFormFromFile(0x01000814, "SkyUI.esp")
	RegisterForSleep()
	RegisterForSingleUpdate(5)
endEvent

Event OnUpdate()
	; Kicks things off for the player
	if _Seed_TrackingQuest.GetStage() == 0
		if isSKYUILoaded
			_Seed_TrackingQuest.SetStage(10)
		else
			_Seed_TrackingQuest.SetStage(15)
		endif
	endif
	; @DEBUG
	SeedDebug(2, "Performing debug start up...")
	Utility.Wait(5)
	StartPrompt()
EndEvent

Event OnSleepStop(bool abInterrupted)
	if abInterrupted
		return
	endif

	; Don't allow the player to start the mod at inopportune times
	; (cart ride at beginning, etc)
	if !Game.IsFightingControlsEnabled() || PlayerRef.IsInInterior()
		RegisterForSingleUpdate(5)
		return
	endif

	StartPrompt()
EndEvent

function StartPrompt()
	int i = _Seed_StartSleepMsg.Show()
	if i == 0
		started_via_sleep = true
		LastSeedRunning.SetValueInt(2)
		StartLastSeed()
	endif
endFunction

Event StartLastSeed(bool abBypassStartupMessage = false)
	debug.trace("[LastSeed] Starting Last Seed...")
	_Seed_StartingUpMsg.Show()

	if !self.IsRunning()
		self.Start()
	endif
	PlayerAlias.ForceRefTo(PlayerRef)
	StartModFirstTime(abBypassStartupMessage)
	_Seed_TrackingQuest.SetStage(20)
	Utility.Wait(2.0)
	StartAllSystems()
	SeedUtil.GetCompatibilitySystem().RunCompatibility()
	SeedUtil.GetCompatibilitySystem().SendEvent_LastSeedLoaded()
	_Seed_StartingUpDoneMsg.Show()
	debug.trace("[LastSeed] Last Seed is now running.")
endEvent

Event StopLastSeed()
	debug.trace("[LastSeed] Stopping Last Seed...")
	if self.IsRunning()
		self.Stop()
	endif
	PlayerAlias.Clear()
	StopAllSystems()
	RemoveAllISMs()
	RemoveAllMeters()
	UnregisterCampfireSkill()
	debug.trace("[LastSeed] Last Seed shut down successfully.")
endEvent

function StartAllSystems()
	GetFoodDatastoreHandler().StartSystem()
	GetHungerSystem().StartSystem()
	;GetThirstSystem().StartSystem()
	;GetFatigueSystem().StartSystem()
	;GetVitalitySystem().StartSystem()
endFunction

function StopAllSystems()
	GetFoodDatastoreHandler().StopSystem()
	GetHungerSystem().StopSystem()
	;GetThirstSystem().StopSystem()
	;GetFatigueSystem().StopSystem()
	;GetVitalitySystem().StopSystem()
endFunction

function RemoveAllISMs()
	GetHungerSystem().RemoveAllISMs()
	;GetThirstSystem().RemoveAllISMs()
	;GetFatigueSystem().RemoveAllISMs()
	;GetVitalitySystem().RemoveAllISMs()
endFunction

function StartModFirstTime(bool abBypassStartupMessage = false)
	if _Seed_TrackingQuest.GetStage() == 20
		return
	else
		;New game / first time user, show startup routine.
		if !abBypassStartupMessage
			_Seed_FirstStartup_1.Show()
		endif
		utility.wait(6)
		_Seed_FirstStartup_2.Show()
		utility.wait(1)
		if isSKYUILoaded
			_Seed_FirstStartup_3.Show()
		else
			_Seed_FirstStartup_3SE.Show()
		endif
	endif
endFunction

function UnregisterCampfireSkill()
	GlobalVariable CampfireAPIVersion = Game.GetFormFromFile(0x03F1BE, "Campfire.esm") as GlobalVariable
	if CampfireAPIVersion && CampfireAPIVersion.GetValueInt() >= 4
		bool b = CampUtil.UnregisterPerkTree(_Seed_PerkNodeController_Provisioning, "LastSeed.esp")
	else
		debug.trace("[Campfire] ERROR: Unable to register Campfire Skill System for LastSeed.esp. Campfire was not found or the version loaded is not compatible. Expected CampUtil API 4 or higher, got " + CampfireAPIVersion.GetValueInt())
	endif
endFunction

function RemoveAllMeters()
	if GetSKSELoaded()
		SendEvent_LastSeedRemoveVitalityMeter()
		SendEvent_LastSeedRemoveHungerMeter()
		SendEvent_LastSeedRemoveThirstMeter()
		SendEvent_LastSeedRemoveFatigueMeter()
	endif
endFunction

;@NOFALLBACK
function SendEvent_LastSeedRemoveVitalityMeter()
	int handle = ModEvent.Create("LastSeed_RemoveVitalityMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

;@NOFALLBACK
function SendEvent_LastSeedRemoveHungerMeter()
	int handle = ModEvent.Create("LastSeed_RemoveHungerMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

;@NOFALLBACK
function SendEvent_LastSeedRemoveThirstMeter()
	int handle = ModEvent.Create("LastSeed_RemoveThirstMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

;@NOFALLBACK
function SendEvent_LastSeedRemoveFatigueMeter()
	int handle = ModEvent.Create("LastSeed_RemoveFatigueMeter")
    if handle
        ModEvent.Send(handle)
    endif
endFunction