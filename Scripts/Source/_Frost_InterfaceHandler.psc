scriptname _Frost_InterfaceHandler extends Quest

import FrostUtil
import _FrostInternal

Actor property PlayerRef auto

Event OnInit()
	RegisterForEvents()
	RegisterForMenus()
	SetMeterPositions()
EndEvent

function RegisterForEvents()
	RegisterForModEvent("Frost_OnSkyUIInvListSelectChangeArmor", "OnSkyUIInvListSelectChangeArmor")
	RegisterForModEvent("Frost_UpdateBottomBarWarmth", "UpdateBottomBarWarmth")
	RegisterForModEvent("Frost_UpdateBottomBarCoverage", "UpdateBottomBarCoverage")
	RegisterForModEvent("Frost_UpdateExposureMeter", "UpdateExposureMeter")
	RegisterForModEvent("Frost_UpdateWetnessMeter", "UpdateWetnessMeter")
endFunction

function RegisterForMenus()
	RegisterForMenu("InventoryMenu")
endFunction

Event OnMenuOpen(string menuName)
	if menuName == "InventoryMenu"
		SendEvent_UpdateWarmthAndCoverage()
	endif
EndEvent

bool locked = false
bool settled = false
Event OnSkyUIInvListSelectChangeArmor(string asEventName, string asArg, float afIsArmor, Form akBaseObject)
	if locked
		settled = false
		return
	endif
	locked = true

	SendEvent_UpdateWarmthAndCoverage()
	UpdateItemCardInfo(-1, -1)
		
	WaitForSelectionSettle()
		
	if afIsArmor == 0
		locked = false
		return
	else
		SetItemCardValues()
	endif
	locked = false
endEvent

function WaitForSelectionSettle()
	bool exit = false
	while !exit
		settled = true
		Utility.WaitMenuMode(0.25)
		if settled == true
			exit = true
		endif
	endWhile
endFunction

function SetItemCardValues()
	bool set = false
	_Frost_ArmorProtectionDatastoreHandler datastore = GetClothingDatastoreHandler()
	while !set
		int menu_id = 0
		int fid = 0
		
		if UI.IsMenuOpen("InventoryMenu")
			fid = UI.GetInt("InventoryMenu", "_root.Menu_mc.inventoryLists.itemList.selectedEntry.formId")
		elseif UI.IsMenuOpen("Crafting Menu")
			fid = UI.GetInt("Crafting Menu", "_root.Menu.InventoryLists.panelContainer.itemList.selectedEntry.formId")
		endif

		if fid == 0
			return
		endif

		Armor my_armor = Game.GetForm(fid) as Armor
		int[] protection_values = datastore.GetTotalProtectionValues(my_armor, datastore.GetGearType(my_armor as Form))
		; Previous lookup takes significant real time, are we still on this entry?
		if settled == true && protection_values[0] != -1
			UpdateItemCardInfo(protection_values[0], protection_values[1])
			set = true
		else
			WaitForSelectionSettle()
		endif
	endWhile
endFunction

Event UpdateBottomBarWarmth(int aiWarmth)
	if UI.IsMenuOpen("InventoryMenu")
		UI.SetString("InventoryMenu", "_root.Menu_mc.bottomBar.frostInfoCard.ExposureProtectionValue.text", aiWarmth)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.SetString("Crafting Menu", "_root.Menu.BottomBarInfo.frostInfoCard.ExposureProtectionValue.text", aiWarmth)
	endif
endEvent

Event UpdateBottomBarCoverage(int aiCoverage)
	if UI.IsMenuOpen("InventoryMenu")
		UI.SetString("InventoryMenu", "_root.Menu_mc.bottomBar.frostInfoCard.RainProtectionValue.text", aiCoverage)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.SetString("Crafting Menu", "_root.Menu.bottomBarInfo.frostInfoCard.RainProtectionValue.text", aiCoverage)
	endif
endEvent

function UpdateItemCardInfo(int aiWarmth, int aiCoverage)
	string warmth_val
	string cover_val
	if aiWarmth == -1
		warmth_val = ""
		cover_val = ""
	else
		warmth_val = aiWarmth
		cover_val = aiCoverage
	endif

	if UI.IsMenuOpen("InventoryMenu")
		UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.ExposureProtectionValue.text", warmth_val)
		UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.RainProtectionValue.text", cover_val)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.SetString("Crafting Menu", "_root.Menu.ItemInfoHolder.ItemInfo.ExposureProtectionValue.text", warmth_val)
		UI.SetString("Crafting Menu", "_root.Menu.ItemInfoHolder.ItemInfo.RainProtectionValue.text", cover_val)
	endif
endFunction

function SendEvent_UpdateWarmthAndCoverage()
    FrostDebug(0, "Sending event Frost_UpdateWarmth")
    int handle_1 = ModEvent.Create("Frost_UpdateWarmth")
    if handle_1
        ModEvent.Send(handle_1)
    endif
    FrostDebug(0, "Sending event Frost_UpdateCoverage")
    int handle_2 = ModEvent.Create("Frost_UpdateCoverage")
    if handle_2
        ModEvent.Send(handle_2)
    endif
endFunction

; **************
; *   Meters   *
; **************
_Frost_ExposureMeter property ExposureMeter auto
_Frost_WetnessMeter property WetnessMeter auto
GlobalVariable property _Frost_AttributeExposure auto
GlobalVariable property _Frost_AttributeWetness auto
GlobalVariable property _Frost_ExposureMeterColorWarm_Light auto
GlobalVariable property _Frost_ExposureMeterColorWarm_Dark auto
GlobalVariable property _Frost_ExposureMeterColorCold_Light auto
GlobalVariable property _Frost_ExposureMeterColorCold_Dark auto
GlobalVariable property _Frost_WetnessMeterColor_Light auto
GlobalVariable property _Frost_WetnessMeterColor_Dark auto
GlobalVariable property _Frost_Setting_MeterDisplayTime auto
GlobalVariable property _Frost_Setting_MeterDisplayMode auto		; 0 = Off, 1 = Always On, 2 = Contextual
GlobalVariable property _Frost_Setting_MeterOpacity auto
FormList property _Frost_SleepObjects auto

float property EXPOSURE_LEVEL_5 = 100.0 autoReadOnly
float property EXPOSURE_LEVEL_4 = 80.0 autoReadOnly
float property EXPOSURE_LEVEL_3 = 60.0 autoReadOnly
float property EXPOSURE_LEVEL_2 = 40.0 autoReadOnly
float property EXPOSURE_LEVEL_1 = 20.0 autoReadOnly
float property EXPOSURE_LEVEL_0 = 0.0 autoReadOnly

float last_exposure = 20.0
float last_wetness = 0.0
int exposure_display_iterations_remaining = 0
int wetness_display_iterations_remaining = 0

Event OnUpdate()
	if exposure_display_iterations_remaining > 0 || exposure_display_iterations_remaining == -1
		UpdateExposureMeter()
		RegisterForSingleUpdate(2)
	endif
	if wetness_display_iterations_remaining > 0 || wetness_display_iterations_remaining == -1
		UpdateWetnessMeter()
		RegisterForSingleUpdate(2)
	endif
EndEvent

Event UpdateMeters()
	UpdateExposureMeter()
endEvent

function UpdateExposureMeter()
	UpdateExposureMeter_Do(false)

	if exposure_display_iterations_remaining > 0
		exposure_display_iterations_remaining -= 1
		RegisterForSingleUpdate(2)
	elseif exposure_display_iterations_remaining == -1
		RegisterForSingleUpdate(2)
	elseif exposure_display_iterations_remaining == 0
		if _Frost_Setting_MeterDisplayMode.GetValueInt() == 2
			ExposureMeter.FadeTo(0.0, 3.0)
		endif
	endif
endFunction

function UpdateWetnessMeter()
	UpdateWetnessMeter_Do(false)

	if wetness_display_iterations_remaining > 0
		wetness_display_iterations_remaining -= 1
		RegisterForSingleUpdate(2)
	elseif wetness_display_iterations_remaining == -1
		RegisterForSingleUpdate(2)
	elseif wetness_display_iterations_remaining == 0
		if _Frost_Setting_MeterDisplayMode.GetValueInt() == 2
			WetnessMeter.FadeTo(0.0, 3.0)
		endif
	endif
endFunction

function UpdateExposureMeter_Do(bool bSkipDisplayHandling = false)
	bool warm = false
	float exposure = _Frost_AttributeExposure.GetValue()
	if exposure < 20.0
		warm = true
	endif

	if _Frost_Setting_MeterDisplayMode.GetValueInt() == 1 									; Always On
		ExposureMeter.Alpha = _Frost_Setting_MeterOpacity.GetValue()
	elseif _Frost_Setting_MeterDisplayMode.GetValueInt() == 2 || bSkipDisplayHandling 		; Contextual
		if warm
			Exposure_ContextualDisplay(exposure)
		else
			Exposure_ContextualDisplay(exposure, bSkipDisplayHandling)
		endif
	elseif _Frost_Setting_MeterDisplayMode.GetValueInt() == 0 && exposure_display_iterations_remaining == 0
		ExposureMeter.Alpha = 0.0
		return
	endif

	if (warm && last_exposure <= 20.0 && exposure > 20.0) || (!warm && last_exposure > 20.0 && exposure <= 20.0)
		ExposureMeter.ForcePercent(0.0)
	endif

	if warm
		ExposureMeter.SetPercent(1.0 - (exposure / 20.0))
		ExposureMeter.SetColors(_Frost_ExposureMeterColorWarm_Light.GetValueInt(), _Frost_ExposureMeterColorWarm_Dark.GetValueInt())
	else
		ExposureMeter.SetPercent((exposure - 20.0) / 100.0)
		ExposureMeter.SetColors(_Frost_ExposureMeterColorCold_Light.GetValueInt(), _Frost_ExposureMeterColorCold_Dark.GetValueInt())
	endif

	last_exposure = exposure
endFunction

function UpdateWetnessMeter_Do(bool bSkipDisplayHandling = false)
	float wetness = _Frost_AttributeWetness.GetValue()

	if _Frost_Setting_MeterDisplayMode.GetValueInt() == 1
		WetnessMeter.Alpha = _Frost_Setting_MeterOpacity.GetValue()
	elseif _Frost_Setting_MeterDisplayMode.GetValueInt() == 2 || bSkipDisplayHandling
		Wetness_ContextualDisplay(wetness)
	elseif _Frost_Setting_MeterDisplayMode.GetValueInt() == 0 && wetness_display_iterations_remaining == 0
		WetnessMeter.Alpha = 0.0
		return
	endif

	WetnessMeter.SetPercent(wetness / 750.0)
	WetnessMeter.SetColors(_Frost_WetnessMeterColor_Light.GetValueInt(), _Frost_WetnessMeterColor_Dark.GetValueInt())
	last_wetness = wetness
endFunction

;/function ForceDisplayAndUpdate(bool bSkipDisplayHandling = true)
	;Called by spells that change exposure.
	exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
	ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 1.0)
	UpdateExposureMeter(bSkipDisplayHandling)
endFunction

function ForceDisplayAndUpdateFlash(bool bSkipDisplayHandling = true)
	;Called by spells that change exposure.
	exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
	ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 1.0)
	ExposureMeter.ForceFlash()
	UpdateExposureMeter(bSkipDisplayHandling)
endFunction
/;

function Exposure_ContextualDisplay(float exposure, bool bSkipDisplayHandling = false)
	debug.trace("[Frostfall] Exposure: " + exposure + ",  Last Exposure:" + last_exposure + ", Meter Duration Remaining:" + exposure_display_iterations_remaining)

	if bSkipDisplayHandling
		exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		return
	endif

	bool increasing = last_exposure < exposure
	if increasing && last_exposure <= EXPOSURE_LEVEL_5 && exposure > EXPOSURE_LEVEL_5
		;freezing to death, show, flash
		ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		ExposureMeter.StartFlash()
		exposure_display_iterations_remaining = -1

	elseif increasing && last_exposure <= EXPOSURE_LEVEL_4 && exposure > EXPOSURE_LEVEL_4
		;freezing, show, flash
		ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		ExposureMeter.StartFlash()
		exposure_display_iterations_remaining = -1

	elseif increasing && last_exposure <= EXPOSURE_LEVEL_3 && exposure > EXPOSURE_LEVEL_3
		;very cold, show
		ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()

	elseif increasing && last_exposure <= EXPOSURE_LEVEL_2 && exposure > EXPOSURE_LEVEL_2
		;chilly, show
		ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		
	elseif increasing && last_exposure <= EXPOSURE_LEVEL_1 && exposure > EXPOSURE_LEVEL_1
		;comfortable, show
		ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()

	elseif increasing && last_exposure <= 11 && exposure > 11
		;warm, show
		ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		
	elseif !increasing && last_exposure != exposure && exposure > 0.0 && (GetPlayerHeatSourceLevel() > 0 || Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_SleepObjects, PlayerRef,  600.0) != None)
		;going down, show
		ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		exposure_display_iterations_remaining = -1

	elseif (last_exposure > 0.0 && exposure <= 0.0) || (GetPlayerHeatSourceDistance() == -1 && exposure < 61)
		; hit bottom, fade out
		if exposure_display_iterations_remaining == -1
			exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		endif
	endif
endFunction

function Wetness_ContextualDisplay(float wetness, bool bSkipDisplayHandling = false)
	debug.trace("[Frostfall] Wetness: " + wetness + ",  Last Wetness:" + last_wetness + ", Meter Duration Remaining:" + wetness_display_iterations_remaining)

	if bSkipDisplayHandling
		wetness_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		return
	endif

	bool increasing = last_wetness < wetness
	if increasing && wetness >= 550.0
		WetnessMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		wetness_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
	elseif increasing && last_wetness < 200.0 && wetness >= 200.0
		WetnessMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		wetness_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
	elseif increasing && last_wetness < 400.0 && wetness >= 400.0
		WetnessMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		wetness_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
	elseif !increasing && last_wetness != wetness && wetness > 0.0 && (GetPlayerHeatSourceDistance() == -1 || Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_SleepObjects, PlayerRef,  600.0) != None)
		WetnessMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
		wetness_display_iterations_remaining = -1
	elseif (last_wetness > 0.0 && wetness <= 0.0) || (GetPlayerHeatSourceDistance() == -1 && wetness < 550.0)
		if wetness_display_iterations_remaining == -1
			wetness_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		endif
	endif
endFunction


function SetMeterPositions()
	ExposureMeter.HAnchor = "right"
	ExposureMeter.VAnchor = "top"
	ExposureMeter.Width = 292.8
	ExposureMeter.Height = 25.2
	ExposureMeter.X = 1219.0
	ExposureMeter.Y = 75.2

	WetnessMeter.HAnchor = "right"
	WetnessMeter.VAnchor = "top"
	WetnessMeter.Width = 292.0
	WetnessMeter.Height = -22.0
	WetnessMeter.X = 1494.25
	WetnessMeter.Y = 114.0

	if ExposureMeter.HAnchor == "right"
		ExposureMeter.FillDirection = "left"
	else
		ExposureMeter.FillDirection = "right"
	endIf

	if WetnessMeter.HAnchor == "right"
		WetnessMeter.FillDirection = "right"
	else
		WetnessMeter.FillDirection = "left"
	endIf
	
	; ExposureMeterDisplay.ForceDisplayAndUpdate()
	; WetMeterDisplay.ForceDisplayAndUpdate()

	;debug.trace("[Frostfall] EMX:" + ExposureMeter.X + ", EMY:" + ExposureMeter.Y + ", WMX:" + WetnessMeter.X + ", WMY:" + WetnessMeter.Y)
endFunction