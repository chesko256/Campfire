scriptname _Frost_InterfaceHandler extends Quest

import CampUtil
import FrostUtil
import _FrostInternal

Actor property PlayerRef auto

Event OnInit()
	SetMeterPositions()
EndEvent

function RegisterForEvents()
	RegisterForModEvent("Frost_OnSkyUIInvListSelectChangeArmor", "OnSkyUIInvListSelectChangeArmor")
	RegisterForModEvent("Frost_UpdateBottomBarWarmth", "UpdateBottomBarWarmth")
	RegisterForModEvent("Frost_UpdateBottomBarCoverage", "UpdateBottomBarCoverage")
	RegisterForModEvent("Frost_UpdateExposureMeter", "UpdateExposureMeter")
	RegisterForModEvent("Frost_UpdateWetnessMeter", "UpdateWetnessMeter")
	RegisterForModEvent("Frost_UpdateWeathersenseMeter", "UpdateWeathersenseMeter")
	RegisterForModEvent("Frost_ForceExposureMeterDisplay", "ForceExposureMeterDisplay")
	RegisterForModEvent("Frost_ForceWetnessMeterDisplay", "ForceWetnessMeterDisplay")
	RegisterForModEvent("Frost_ForceWeathersenseMeterDisplay", "ForceWeathersenseMeterDisplay")
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
		elseif UI.IsMenuOpen("ContainerMenu")
			fid = UI.GetInt("ContainerMenu", "_root.Menu_mc.inventoryLists.itemList.selectedEntry.formId")
		elseif UI.IsMenuOpen("BarterMenu")
			fid = UI.GetInt("BarterMenu", "_root.Menu_mc.inventoryLists.itemList.selectedEntry.formId")
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
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.SetString("ContainerMenu", "_root.Menu_mc.bottomBar.frostInfoCard.ExposureProtectionValue.text", aiWarmth)
	elseif UI.IsMenuOpen("BarterMenu")
		UI.SetString("BarterMenu", "_root.Menu_mc.bottomBar.frostInfoCard.ExposureProtectionValue.text", aiWarmth)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.SetString("Crafting Menu", "_root.Menu.BottomBarInfo.frostInfoCard.ExposureProtectionValue.text", aiWarmth)
	endif
endEvent

Event UpdateBottomBarCoverage(int aiCoverage)
	if UI.IsMenuOpen("InventoryMenu")
		UI.SetString("InventoryMenu", "_root.Menu_mc.bottomBar.frostInfoCard.RainProtectionValue.text", aiCoverage)
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.SetString("ContainerMenu", "_root.Menu_mc.bottomBar.frostInfoCard.RainProtectionValue.text", aiCoverage)
	elseif UI.IsMenuOpen("BarterMenu")
		UI.SetString("BarterMenu", "_root.Menu_mc.bottomBar.frostInfoCard.RainProtectionValue.text", aiCoverage)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.SetString("Crafting Menu", "_root.Menu.BottomBarInfo.frostInfoCard.RainProtectionValue.text", aiCoverage)
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
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.SetString("ContainerMenu", "_root.Menu_mc.itemCard.ExposureProtectionValue.text", warmth_val)
		UI.SetString("ContainerMenu", "_root.Menu_mc.itemCard.RainProtectionValue.text", cover_val)
	elseif UI.IsMenuOpen("BarterMenu")
		UI.SetString("BarterMenu", "_root.Menu_mc.itemCard.ExposureProtectionValue.text", warmth_val)
		UI.SetString("BarterMenu", "_root.Menu_mc.itemCard.RainProtectionValue.text", cover_val)
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
_Frost_WeathersenseMeter property WeathersenseMeter auto
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

float last_exposure = 20.0
float last_wetness = 0.0
int last_temp_level = 0
int exposure_display_iterations_remaining = 0
int wetness_display_iterations_remaining = 0
int weathersense_display_iterations_remaining = 0
bool exposure_meter_displayed = false
bool wetness_meter_displayed = false
bool weathersense_meter_displayed = false
bool should_update = false
bool was_wetness_increasing = false

Event OnUpdate()
	UpdateExposureMeter()
	UpdateWetnessMeter()
	UpdateWeathersenseMeter(last_temp_level)
	if should_update
		RegisterForSingleUpdate(2)
		should_update = false
	endif
EndEvent

function UpdateExposureMeter()
	DisplayExposureMeter()
endFunction

function UpdateWetnessMeter()
	if PlayerRef.IsSwimming()
		return
	endif
	DisplayWetnessMeter()
endFunction

function UpdateWeathersenseMeter(int temp_level)
	DisplayWeathersenseMeter(temp_level)
endFunction

function DisplayExposureMeter(bool bSkipDisplayHandling = false)
	HandleExposureMeterUpdate(bSkipDisplayHandling)

	if exposure_display_iterations_remaining > 0
		exposure_display_iterations_remaining -= 1
	endif

	if exposure_display_iterations_remaining != 0
		if !should_update
			should_update = true
		endif
	else
		if _Frost_Setting_MeterDisplayMode.GetValueInt() == 2 && exposure_meter_displayed
			ExposureMeter.FadeTo(0.0, 3.0)
			exposure_meter_displayed = false
		endif
	endif
endFunction

function DisplayWetnessMeter(bool bSkipDisplayHandling = false)
	HandleWetnessMeterUpdate(bSkipDisplayHandling)

	if wetness_display_iterations_remaining > 0
		wetness_display_iterations_remaining -= 1
	endif
	
	if wetness_display_iterations_remaining != 0
		if !should_update
			should_update = true
		endif
	else
		if _Frost_Setting_MeterDisplayMode.GetValueInt() == 2 && wetness_meter_displayed
			WetnessMeter.FadeTo(0.0, 3.0)
			wetness_meter_displayed = false
		endif
	endif
endFunction

function DisplayWeathersenseMeter(int temp_level, bool bSkipDisplayHandling = false)
	HandleWeathersenseMeterUpdate(temp_level, bSkipDisplayHandling)

	if weathersense_display_iterations_remaining > 0
		weathersense_display_iterations_remaining -= 1
	endif

	if weathersense_display_iterations_remaining != 0
		if !should_update
			should_update = true
		endif
	else
		if _Frost_Setting_MeterDisplayMode.GetValueInt() == 2 && weathersense_meter_displayed
			WeathersenseMeter.FadeTo(0.0, 3.0)
			weathersense_meter_displayed = false
		endif
	endif
endFunction

function HandleExposureMeterUpdate(bool bSkipDisplayHandling = false)
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

function HandleWetnessMeterUpdate(bool bSkipDisplayHandling = false)
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

function HandleWeathersenseMeterUpdate(int temp_level, bool bSkipDisplayHandling = false)
	if _Frost_Setting_MeterDisplayMode.GetValueInt() == 1 									; Always On
		WeathersenseMeter.Alpha = _Frost_Setting_MeterOpacity.GetValue()
	elseif _Frost_Setting_MeterDisplayMode.GetValueInt() == 2 || bSkipDisplayHandling 		; Contextual
		Weathersense_ContextualDisplay(temp_level, bSkipDisplayHandling)
	elseif _Frost_Setting_MeterDisplayMode.GetValueInt() == 0 && weathersense_display_iterations_remaining == 0
		WeathersenseMeter.Alpha = 0.0
		return
	endif

	last_temp_level = temp_level
endFunction

Event ForceExposureMeterDisplay(bool flash = false)
	ExposureMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt(), flash)
	DisplayExposureMeter(true)
endEvent

Event ForceWetnessMeterDisplay(bool flash = false)
	WetnessMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt(), flash)
	DisplayWetnessMeter(true)
endEvent

Event ForceWeathersenseMeterDisplay(int temp_level, bool flash = false)
	WeathersenseMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt(), flash)
	DisplayWeathersenseMeter(temp_level, true)
endEvent

function Exposure_ContextualDisplay(float exposure, bool bSkipDisplayHandling = false)

	if bSkipDisplayHandling
		exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		return
	endif

	bool increasing = last_exposure < exposure
	if increasing && last_exposure <= EXPOSURE_LEVEL_5 && exposure > EXPOSURE_LEVEL_5
		;freezing to death, show, flash
		ExposureMeter_FadeUp(-1, true)

	elseif increasing && last_exposure <= EXPOSURE_LEVEL_4 && exposure > EXPOSURE_LEVEL_4
		;freezing, show, flash
		ExposureMeter_FadeUp(-1, true)

	elseif increasing && last_exposure <= EXPOSURE_LEVEL_3 && exposure > EXPOSURE_LEVEL_3
		;very cold, show
		ExposureMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())

	elseif increasing && last_exposure <= EXPOSURE_LEVEL_2 && exposure > EXPOSURE_LEVEL_2
		;chilly, show
		ExposureMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())
		
	elseif increasing && last_exposure <= EXPOSURE_LEVEL_1 && exposure > EXPOSURE_LEVEL_1
		;comfortable, show
		ExposureMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())

	elseif increasing && last_exposure <= 11 && exposure > 11
		;warm, show
		ExposureMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())
		
	elseif !increasing && last_exposure != exposure && exposure > 0.0 && (GetPlayerHeatSourceLevel() > 0 || Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_SleepObjects, PlayerRef,  600.0) != None)
		;going down, show
		ExposureMeter_FadeUp(-1)

	elseif (last_exposure > 0.0 && exposure <= 0.0) || (GetPlayerHeatSourceDistance() == -1 && exposure < 61)
		; hit bottom, start fade out
		if exposure_display_iterations_remaining == -1
			exposure_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		endif
	endif
endFunction

function Wetness_ContextualDisplay(float wetness, bool bSkipDisplayHandling = false)

	if bSkipDisplayHandling
		wetness_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		return
	endif

	bool increasing = last_wetness < wetness
	if increasing && !was_wetness_increasing
		WetnessMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())
	elseif increasing && wetness >= 550.0
		WetnessMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())
	elseif increasing && last_wetness < 200.0 && wetness >= 200.0
		WetnessMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())
	elseif increasing && last_wetness < 400.0 && wetness >= 400.0
		WetnessMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())
	elseif !increasing && last_wetness != wetness && wetness > 0.0 && (GetPlayerHeatSourceLevel() > 0 || Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_SleepObjects, PlayerRef,  600.0) != None)
		WetnessMeter_FadeUp(-1)
	elseif (last_wetness > 0.0 && wetness <= 0.0) || (GetPlayerHeatSourceDistance() == -1)
		if wetness_display_iterations_remaining == -1
			wetness_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		endif
	endif
	was_wetness_increasing = increasing
endFunction

function Weathersense_ContextualDisplay(int temp_level, bool bSkipDisplayHandling = false)
	if bSkipDisplayHandling
		weathersense_display_iterations_remaining = _Frost_Setting_MeterDisplayTime.GetValueInt()
		return
	endif
	if temp_level != last_temp_level && !IsRefInInterior(PlayerRef)
		if temp_level == 10
			WeathersenseMeter.SetPercent(1.0)
			WeathersenseMeter.SetColors(0x0A7A1D, 0x15F43A)
		elseif temp_level == 9
			WeathersenseMeter.SetPercent(0.9)
			WeathersenseMeter.SetColors(0x2D7B3A, 0x5BF775)
		elseif temp_level == 8
			WeathersenseMeter.SetPercent(0.8)
			WeathersenseMeter.SetColors(0x567D5D, 0xADFBBA)
		elseif temp_level == 7
			WeathersenseMeter.SetPercent(0.7)
			WeathersenseMeter.SetColors(0x6F7E71, 0xDEFDE3)
		elseif temp_level == 6
			WeathersenseMeter.SetPercent(0.6)
			WeathersenseMeter.SetColors(0x33517C, 0x66A3F8)
		elseif temp_level == 5
			WeathersenseMeter.SetPercent(0.5)
			WeathersenseMeter.SetColors(0x004997, 0x005CBD)
		elseif temp_level == 4
			WeathersenseMeter.SetPercent(0.4)
			WeathersenseMeter.SetColors(0x00419C, 0x0052C3)
		elseif temp_level == 3
			WeathersenseMeter.SetPercent(0.3)
			WeathersenseMeter.SetColors(0x002457, 0x003D92)
		elseif temp_level == 2
			WeathersenseMeter.SetPercent(0.2)
			WeathersenseMeter.SetColors(0x001534, 0x002457)
		elseif temp_level == 1
			WeathersenseMeter.SetPercent(0.1)
			WeathersenseMeter.SetColors(0x00050C, 0x000A18)
		endif
		WeathersenseMeter_FadeUp(_Frost_Setting_MeterDisplayTime.GetValueInt())
	endif
endFunction

function ExposureMeter_FadeUp(int iterations_remaining, bool flash = false)
	exposure_meter_displayed = true
	ExposureMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
	if flash
		ExposureMeter.StartFlash()
	endIf
	exposure_display_iterations_remaining = iterations_remaining
endFunction

function WetnessMeter_FadeUp(int iterations_remaining, bool flash = false)
	wetness_meter_displayed = true
	WetnessMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
	if flash
		WetnessMeter.StartFlash()
	endIf
	wetness_display_iterations_remaining = iterations_remaining
endFunction


function WeathersenseMeter_FadeUp(int iterations_remaining, bool flash = false)
	weathersense_meter_displayed = true
	WeathersenseMeter.FadeTo(_Frost_Setting_MeterOpacity.GetValue(), 2.0)
	if flash
		WeathersenseMeter.StartFlash()
	endIf
	weathersense_display_iterations_remaining = iterations_remaining
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

	WeathersenseMeter.HAnchor = "center"
	WeathersenseMeter.VAnchor = "top"
	WeathersenseMeter.Width = 292.0
	WeathersenseMeter.Height = -22.0
	WeathersenseMeter.X = 916.75
	WeathersenseMeter.Y = 16.0

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