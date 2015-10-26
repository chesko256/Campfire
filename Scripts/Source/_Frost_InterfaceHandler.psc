scriptname _Frost_InterfaceHandler extends Quest

import FrostUtil
import _FrostInternal

Event OnInit()
	RegisterForModEvent("Frost_OnSkyUIInvListSelectChangeArmor", "OnSkyUIInvListSelectChangeArmor")
	RegisterForModEvent("Frost_UpdateBottomBarWarmth", "UpdateBottomBarWarmth")
	RegisterForModEvent("Frost_UpdateBottomBarCoverage", "UpdateBottomBarCoverage")
	RegisterForMenu("InventoryMenu")
EndEvent

function RegisterForEvents()
	RegisterForModEvent("Frost_OnSkyUIInvListSelectChangeArmor", "OnSkyUIInvListSelectChangeArmor")
	RegisterForModEvent("Frost_UpdateBottomBarWarmth", "UpdateBottomBarWarmth")
	RegisterForModEvent("Frost_UpdateBottomBarCoverage", "UpdateBottomBarCoverage")
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
	string exp_val
	string rain_val
	if aiWarmth == -1
		exp_val = ""
		rain_val = ""
	else
		exp_val = aiWarmth
		rain_val = aiCoverage
	endif

	if UI.IsMenuOpen("InventoryMenu")
		UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.ExposureProtectionValue.text", exp_val)
		UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.RainProtectionValue.text", rain_val)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.SetString("Crafting Menu", "_root.Menu.ItemInfoHolder.ItemInfo.ExposureProtectionValue.text", exp_val)
		UI.SetString("Crafting Menu", "_root.Menu.ItemInfoHolder.ItemInfo.RainProtectionValue.text", rain_val)
	endif
endFunction

function SendEvent_UpdateWarmthAndCoverage()
    FrostDebug(0, "Sending event Frost_UpdateWarmth")
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
    FrostDebug(0, "Sending event Frost_UpdateCoverage")
    handle = ModEvent.Create("Frost_UpdateCoverage")
    if handle
        ModEvent.Send(handle)
    endif
endFunction