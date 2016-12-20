Scriptname _Frost_Main extends Quest
{This script handles starting the mod for the first time, setting appropriate start-up aliases, and running compatibility on startup.}

import CampUtil
import FrostUtil
import _FrostInternal

Actor property PlayerRef auto
Activator property _Frost_PerkNodeController_Endurance auto
ReferenceAlias property PlayerAlias auto
ReferenceAlias property RiverwoodFriend auto
GlobalVariable property _Frost_DatastoreInitialized auto
GlobalVariable property _Frost_CheckInitialEquipment auto
GlobalVariable property GameHour auto
GlobalVariable property FrostfallRunning auto
Armor property _Frost_DummyCuirass auto
Armor property _Frost_DummyHelmet auto
Armor property _Frost_DummyGauntlets auto
Armor property _Frost_DummyBoots auto
Armor property _Frost_DummyShield auto
Spell property _Frost_NoWait_Spell auto
Spell property _Frost_LegacyConfig_Spell auto
Message property _Frost_FirstStartup_1 auto
Message property _Frost_FirstStartup_2 auto
Message property _Frost_FirstStartup_3 auto
Message property _Frost_FirstStartup_3SE auto
Message property _Frost_StartStarsMsg auto
Message property _Frost_StartingUpMsg auto
Message property _Frost_StartingUpDoneMsg auto
Book property _Frost_SurvivorsGuide auto
Quest property _Frost_TrackingQuest auto
MiscObject property _Camp_Tent_LeatherSmall1BR_MISC auto
Armor property _Camp_Cloak_BasicBurlap auto
Armor property _Camp_ArmorSonsBoots auto
ImageSpaceModifier property _Frost_ColdISM_Level3 auto
ImageSpaceModifier property _Frost_ColdISM_Level4 auto
ImageSpaceModifier property _Frost_ColdISM_Level5 auto

int stars_counter = 0
bool started_via_stars = false
bool gave_friend_items = false
bool isSKYUILoaded = false

Event OnInit()
	; Add config spell on start-up.
	isSKYUILoaded = Game.GetFormFromFile(0x01000814, "SkyUI.esp")
	if isSKYUILoaded
		PlayerRef.RemoveSpell(_Frost_LegacyConfig_Spell)
	else
		PlayerRef.AddSpell(_Frost_LegacyConfig_Spell, false)
	endif

	RegisterForSingleUpdate(5)
EndEvent

Event OnUpdate()
	; We stop updating when the mod has been started
	; and the friend items have been granted.

	; Don't allow the player to start the mod at inopportune times
	; (cart ride at beginning, etc)
	if !Game.IsFightingControlsEnabled() || PlayerRef.IsInInterior()
		RegisterForSingleUpdate(5)
		return
	endif

	if _Frost_TrackingQuest.GetStage() == 0			;Kicks things off for the player
		if isSKYUILoaded
			_Frost_TrackingQuest.SetStage(10)
		else
			_Frost_TrackingQuest.SetStage(15)
		endif
	endif
	
	if (_Frost_TrackingQuest.GetStage() == 10 || _Frost_TrackingQuest.GetStage() == 15) && !started_via_stars
		if !IsRefInInterior(PlayerRef) && 		\
			PlayerRef.GetAngleX() <= -55.0 && 	\
			(GameHour.GetValue() > 19.0 || GameHour.GetValue() < 7.0)
			stars_counter += 1
			if stars_counter >= 2
				StartPrompt()
			endif
		endif
		RegisterForSingleUpdate(5)
	endif

	if !gave_friend_items
		AddFriendItems()
		RegisterForSingleUpdate(5)
	endif
EndEvent

function StartPrompt()
	int i = _Frost_StartStarsMsg.Show()
	if i == 0
		started_via_stars = true
		FrostfallRunning.SetValueInt(2)
		StartFrostfall()
	else
		stars_counter = 0
	endif
endFunction

function RegisterForModEvents()
	FallbackEventEmitter startEvent = GetEventEmitter_StartFrostfall()
	FallbackEventEmitter stopEvent = GetEventEmitter_StopFrostfall()

	startEvent.RegisterFormForModEventWithFallback("Frost_StartFrostfall", "StartFrostfall", self)
	stopEvent.RegisterFormForModEventWithFallback("Frost_StopFrostfall", "StopFrostfall", self)
endFunction

Event StartFrostfall(bool abBypassStartupMessage = false)
	debug.trace("[Frostfall] Starting Frostfall...")
	_Frost_StartingUpMsg.Show()

	GetClothingDatastoreHandler().InitializeDatastore()
	; Menu-Mode blocked functions
	if !self.IsRunning()
		self.Start()
	endif
	PlayerAlias.ForceRefTo(PlayerRef)
	StartModFirstTime(abBypassStartupMessage)
	_Frost_TrackingQuest.SetStage(20)
	Utility.Wait(2.0)
	StartAllSystems()
	FrostUtil.GetCompatibilitySystem().RunCompatibility()
	FrostUtil.GetCompatibilitySystem().SendEvent_FrostfallLoaded()
	CheckInitialEquipment()
	_Frost_StartingUpDoneMsg.Show()
	debug.trace("[Frostfall] Frostfall is now running.")
endEvent

Event StopFrostfall()
	debug.trace("[Frostfall] Stopping Frostfall...")
	if self.IsRunning()
		self.Stop()
	endif
	PlayerAlias.Clear()
	StopAllSystems()
	if !Game.IsFastTravelControlsEnabled()
		Game.EnableFastTravel()
	endif
	PlayerRef.RemoveSpell(_Frost_NoWait_Spell)
	_Frost_ColdISM_Level3.Remove()
	_Frost_ColdISM_Level4.Remove()
	_Frost_ColdISM_Level5.Remove()
	RemoveAllMeters()
	UnregisterCampfireSkill()
	debug.trace("[Frostfall] Frostfall shut down successfully.")
endEvent

function StartAllSystems()
	GetClothingDatastoreHandler().StartSystem()
	GetClimateSystem().StartSystem()
	GetHeatSourceSystem().StartSystem()
	GetClothingSystem().StartSystem()
	GetRescueSystem().StartSystem()
	GetShelterSystem().StartSystem()
	GetWarmthSystem().StartSystem()
	GetCoverageSystem().StartSystem()
	GetExposureSystem().StartSystem()
	GetWetnessSystem().StartSystem()
	GetFrostResistSystem().StartSystem()
	GetPlayerStateSystem().StartSystem()
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
	GetFrostResistSystem().StopSystem()
	GetPlayerStateSystem().StopSystem()
	Utility.Wait(2)
endFunction

function CheckInitialEquipment()
	_Frost_CheckInitialEquipment.SetValue(2)
	PlayerRef.AddItem(_Frost_DummyCuirass, 1, true)
	PlayerRef.AddItem(_Frost_DummyHelmet, 1, true)
	PlayerRef.AddItem(_Frost_DummyGauntlets, 1, true)
	PlayerRef.AddItem(_Frost_DummyBoots, 1, true)
	PlayerRef.AddItem(_Frost_DummyShield, 1, true)
	PlayerRef.EquipItem(_Frost_DummyCuirass, abSilent = true)
	Utility.Wait(0.2)
	PlayerRef.EquipItem(_Frost_DummyHelmet, abSilent = true)
	Utility.Wait(0.2)
	PlayerRef.EquipItem(_Frost_DummyGauntlets, abSilent = true)
	Utility.Wait(0.2)
	PlayerRef.EquipItem(_Frost_DummyBoots, abSilent = true)
	Utility.Wait(0.2)
	PlayerRef.EquipItem(_Frost_DummyShield, abSilent = true)
	Utility.Wait(2.0)
	_Frost_CheckInitialEquipment.SetValue(1)
	PlayerRef.RemoveItem(_Frost_DummyCuirass, 1, true)
	PlayerRef.RemoveItem(_Frost_DummyHelmet, 1, true)
	PlayerRef.RemoveItem(_Frost_DummyGauntlets, 1, true)
	PlayerRef.RemoveItem(_Frost_DummyBoots, 1, true)
	PlayerRef.RemoveItem(_Frost_DummyShield, 1, true)
	Utility.Wait(1.0)
	_Frost_ClothingSystem Clothing = GetClothingSystem()
	if Clothing.initial_body
		PlayerRef.EquipItem(Clothing.initial_body, abSilent = true)
		Utility.Wait(0.2)
	endif
	if Clothing.initial_head
		PlayerRef.EquipItem(Clothing.initial_head, abSilent = true)
		Utility.Wait(0.2)
	endif
	if Clothing.initial_hands
		PlayerRef.EquipItem(Clothing.initial_hands, abSilent = true)
		Utility.Wait(0.2)
	endif
	if Clothing.initial_feet
		PlayerRef.EquipItem(Clothing.initial_feet, abSilent = true)
		Utility.Wait(0.2)
	endif
	if Clothing.initial_shield
		PlayerRef.EquipItem(Clothing.initial_shield, abSilent = true)
	endif
endFunction

function AddFriendItems()
	Actor friend = RiverwoodFriend.GetActorRef()
	if friend
		if friend.GetItemCount(_Camp_Tent_LeatherSmall1BR_MISC) == 0
			friend.AddItem(_Camp_Tent_LeatherSmall1BR_MISC)
		endif
		;/
		@TODO: Re-add when cloak is functioning.
		if friend.GetItemCount(_Camp_Cloak_BasicBurlap) == 0
			friend.AddItem(_Camp_Cloak_BasicBurlap)
		endif
		/;
		if friend.GetItemCount(_Camp_ArmorSonsBoots) == 0
			friend.AddItem(_Camp_ArmorSonsBoots)
		endif
		gave_friend_items = true
	endif
endFunction

function StartModFirstTime(bool abBypassStartupMessage = false)
	if _Frost_TrackingQuest.GetStage() == 20
		return
	else
		;New game / first time user, show startup routine.
		if !abBypassStartupMessage
			_Frost_FirstStartup_1.Show()
		endif
		utility.wait(1)
		PlayerRef.AddItem(_Frost_SurvivorsGuide)
		utility.wait(6)
		_Frost_FirstStartup_2.Show()
		utility.wait(1)
		if isSKYUILoaded
			_Frost_FirstStartup_3.Show()
		else
			_Frost_FirstStartup_3SE.Show()
		endif
	endif
endFunction

function UnregisterCampfireSkill()
	GlobalVariable CampfireAPIVersion = Game.GetFormFromFile(0x03F1BE, "Campfire.esm") as GlobalVariable
	if CampfireAPIVersion && CampfireAPIVersion.GetValueInt() >= 4
		bool b = CampUtil.UnregisterPerkTree(_Frost_PerkNodeController_Endurance, "Frostfall.esp")
	else
		debug.trace("[Campfire] ERROR: Unable to register Campfire Skill System for Frostfall.esp. Campfire was not found or the version loaded is not compatible. Expected CampUtil API 4 or higher, got " + CampfireAPIVersion.GetValueInt())
	endif
endFunction

function RemoveAllMeters()
	if GetSKSELoaded()
		SendEvent_FrostfallRemoveExposureMeter()
		SendEvent_FrostfallRemoveWetnessMeter()
		SendEvent_FrostfallRemoveWeathersenseMeter()
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