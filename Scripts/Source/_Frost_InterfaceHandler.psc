scriptname _Frost_InterfaceHandler extends Quest

import CampUtil
import FrostUtil
import _FrostInternal
import Math

Actor property PlayerRef auto

Event OnInit()
	;SetMeterPositions()
EndEvent

function RegisterForEvents()
	RegisterForModEvent("Frost_OnSkyUIInvListGetEntryProtectionData", "OnSkyUIInvListGetEntryProtectionData")
	RegisterForModEvent("Frost_OnSkyUIInvListGetEntryProtectionDataOnProcess", "OnSkyUIInvListGetEntryProtectionDataOnProcess")
	RegisterForModEvent("Frost_UpdateBottomBarWarmth", "UpdateBottomBarWarmth")
	RegisterForModEvent("Frost_UpdateBottomBarCoverage", "UpdateBottomBarCoverage")
endFunction

function RegisterForMenus()
	RegisterForMenu("InventoryMenu")
	RegisterForMenu("ContainerMenu")
	RegisterForMenu("BarterMenu")
	RegisterForMenu("Crafting Menu")
endFunction

Event OnMenuOpen(string menuName)
	if menuName == "InventoryMenu" || menuName == "ContainerMenu" || menuName == "BarterMenu" || menuName == "Crafting Menu"
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

Event OnSkyUIInvListGetEntryProtectionData(string asEventName, string asArmorName, float afIndex, Form akBaseObject)
	debug.trace("OnSkyUIInvListGetEntryProtectionData called with index " + afIndex + " with name " + asArmorName + " with form " + akBaseObject)
	int[] vals = new int[3]
	vals[0] = afIndex as Int
	if asArmorName != ""
		int[] totals = GetClothingDatastoreHandler().GetTotalArmorProtectionValues(akBaseObject as Armor, asArmorName)
		vals[1] = totals[0]
		vals[2] = totals[1]
		
		if UI.IsMenuOpen("InventoryMenu")
			UI.InvokeIntA("InventoryMenu", "_root.Menu_mc.setEntryProtectionData", vals)
		elseif UI.IsMenuOpen("ContainerMenu")
			UI.InvokeIntA("ContainerMenu", "_root.Menu_mc.setEntryProtectionData", vals)
		elseif UI.IsMenuOpen("BarterMenu")
			UI.InvokeIntA("BarterMenu", "_root.Menu_mc.setEntryProtectionData", vals)
		elseif UI.IsMenuOpen("Crafting Menu")
			UI.InvokeIntA("Crafting Menu", "_root.Menu.setEntryProtectionData", vals)
		endif
	endif
endEvent

Event OnSkyUIInvListGetEntryProtectionDataOnProcess(string asEventName, string asString, float afFloat, Form akBaseObject)
	debug.trace("Got OnSkyUIInvListGetEntryProtectionDataOnProcess")
	UI.Invoke("InventoryMenu", "_root.Menu_mc.setEntryProtectionDataOnProcess")
	if UI.IsMenuOpen("InventoryMenu")
		UI.Invoke("InventoryMenu", "_root.Menu_mc.setEntryProtectionDataOnProcess")
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.Invoke("ContainerMenu", "_root.Menu_mc.setEntryProtectionDataOnProcess")
	elseif UI.IsMenuOpen("BarterMenu")
		UI.Invoke("BarterMenu", "_root.Menu_mc.setEntryProtectionDataOnProcess")
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.Invoke("Crafting Menu", "_root.Menu.setEntryProtectionDataOnProcess")
	endif
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
	; DEBUG
	; DEBUG
	; DEBUG
	; DEBUG
	return
	; DEBUG
	; DEBUG
	; DEBUG
	; DEBUG
	bool set = false
	_Frost_ArmorProtectionDatastoreHandler armor_handler = GetClothingDatastoreHandler()
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

		;Armor my_armor = Game.GetForm(fid) as Armor
		debug.trace("fid " + fid)
		int mod_index = GetModIndex(fid)
		debug.trace("index " + mod_index)
		int base_form_id = GetBaseFormID(fid)
		debug.trace("base " + base_form_id)
		Armor my_armor = Game.GetFormFromFile(base_form_id, Game.GetModName(mod_index)) as Armor
		debug.trace("my_armor " + my_armor)
		if !my_armor
			return
		endif
		
		int[] protection_values = armor_handler.GetTotalArmorProtectionValues(my_armor)
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
	; DEBUG
	; DEBUG
	; DEBUG
	; DEBUG
	return
	; DEBUG
	; DEBUG
	; DEBUG
	; DEBUG
	string warmth_val
	string cover_val
	if aiWarmth == -1
		warmth_val = ""
		cover_val = ""
	elseif aiWarmth == -99
		warmth_val = "--"
		cover_val = "--"
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
    int handle_1 = ModEvent.Create("Frost_UpdateWarmth")
    if handle_1
        ModEvent.Send(handle_1)
    endif
    int handle_2 = ModEvent.Create("Frost_UpdateCoverage")
    if handle_2
        ModEvent.Send(handle_2)
    endif
endFunction

int function GetModIndex(int aiFormID)
	; Values of aiFormID larger than 0x80000000 will be negative and require conversion
	; to obtain the mod index.
	int mod_index = aiFormID/16777216
	if mod_index < 0
		mod_index = LogicalAnd(mod_index, 0xFF) - 1
	endif
	return mod_index
endFunction

int function GetBaseFormID(int aiFormID)
	return LogicalAnd(aiFormID, 0x00FFFFFF)
endFunction