scriptname _Seed_Main extends Quest

import CampUtil
import SeedUtil
import _SeedInternal

Actor property PlayerRef auto
Activator property _Seed_PerkNodeController_Provisioning auto
ReferenceAlias property PlayerAlias auto
GlobalVariable property LastSeedRunning auto
GlobalVariable property _Seed_QuickstartEnabled auto
Message property _Seed_StartSleepMsg auto
Message property _Seed_StartingUpMsg auto
Message property _Seed_StartingUpDoneMsg auto
Message property _Seed_FirstStartup_1 auto
Message property _Seed_FirstStartup_2 auto
Message property _Seed_FirstStartup_3 auto
Message property _Seed_FirstStartup_3SE auto
Quest property _Seed_TrackingQuest auto
Spell property _Seed_IntensityPlayerSpell auto
Spell property _Seed_CheckNeedsSpell auto

bool started_via_sleep = false
bool isSKYUILoaded = false

Event OnInit()
	isSKYUILoaded = Game.GetFormFromFile(0x01000814, "SkyUI.esp")
	RegisterForSleep()
	StartUp()
endEvent

function StartUp()
	; Kicks things off for the player
	if _Seed_TrackingQuest.GetStage() == 0
		if isSKYUILoaded
			_Seed_TrackingQuest.SetStage(10)
		else
			_Seed_TrackingQuest.SetStage(15)
		endif
	endif
	
	if _Seed_QuickstartEnabled.GetValueInt() == 2
		SeedDebug(2, "Performing debug start up...")
		Utility.Wait(5)
		OnSleepStop(false)
	endif
endFunction

Event OnSleepStop(bool abInterrupted)
	if abInterrupted
		return
	endif

	; Don't allow the player to start the mod at inopportune times
	; (cart ride at beginning, etc)
	if !Game.IsFightingControlsEnabled()
		return
	endif

	int i = _Seed_StartSleepMsg.Show()
	if i == 0
		started_via_sleep = true
		LastSeedRunning.SetValueInt(2)
		StartLastSeed()
	endif
EndEvent

Event StartLastSeed(bool abBypassStartupMessage = false)
	debug.trace("[LastSeed] Starting Last Seed...")
	;_Seed_StartingUpMsg.Show()

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

	; Apply initial vitality condition.
    GetVitalitySystem().ChangeAttributeOverTime()

	;_Seed_StartingUpDoneMsg.Show()
	debug.trace("[LastSeed] Last Seed is now running.")
	UnregisterForSleep()
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
	RemoveAllSpells()
	UnregisterCampfireSkill()
	debug.trace("[LastSeed] Last Seed shut down successfully.")
endEvent

function StartAllSystems()
	GetFoodDatastoreHandler().StartSystem()
	GetHungerSystem().StartSystem()
	GetVitalitySystem().StartSystem()
	GetSpoilageSystem().StartSystem()
	;GetThirstSystem().StartSystem()
	;GetFatigueSystem().StartSystem()
endFunction

function StopAllSystems()
	GetFoodDatastoreHandler().StopSystem()
	GetHungerSystem().StopSystem()
	GetVitalitySystem().StopSystem()
	GetSpoilageSystem().StopSystem()
	;GetThirstSystem().StopSystem()
	;GetFatigueSystem().StopSystem()
endFunction

function RemoveAllISMs()
	GetHungerSystem().RemoveAllISMs()
	;GetThirstSystem().RemoveAllISMs()
	;GetFatigueSystem().RemoveAllISMs()
	GetVitalitySystem().RemoveAllISMs()
endFunction

function StartModFirstTime(bool abBypassStartupMessage = true)
	if _Seed_TrackingQuest.GetStage() == 20
		return
	else
		;New game / first time user, show startup routine.
		if !abBypassStartupMessage
			_Seed_FirstStartup_1.Show()
		endif
		utility.wait(6)
		_Seed_FirstStartup_2.Show()
		utility.wait(3)
		;@REENABLE when config is working
		;/if isSKYUILoaded
			_Seed_FirstStartup_3.Show()
		else
			_Seed_FirstStartup_3SE.Show()
		endif
		/;
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

function RemoveAllSpells()
	PlayerRef.RemoveSpell(_Seed_IntensityPlayerSpell)
	PlayerRef.RemoveSpell(_Seed_CheckNeedsSpell)
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