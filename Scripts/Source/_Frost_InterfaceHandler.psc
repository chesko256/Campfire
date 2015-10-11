scriptname _Frost_InterfaceHandler extends Quest

import FrostUtil

GlobalVariable property _Frost_DatastoreInitialized auto

Event OnInit()
	RegisterForModEvent("Frost_OnSkyUIInvListSelectChangeArmor", "OnSkyUIInvListSelectChangeArmor")
	RegisterForMenu("InventoryMenu")
EndEvent

Event OnMenuOpen(string menuName)
	if menuName == "InventoryMenu"
		UI.SetString("InventoryMenu", "_root.Menu_mc.bottomBar.frostInfoCard.ExposureProtectionValue.text", GetPlayerArmorExposureProtection())
		UI.SetString("InventoryMenu", "_root.Menu_mc.bottomBar.frostInfoCard.RainProtectionValue.text", GetPlayerArmorRainProtection())
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

	UI.SetString("InventoryMenu", "_root.Menu_mc.bottomBar.frostInfoCard.ExposureProtectionValue.text", GetPlayerArmorExposureProtection())
	UI.SetString("InventoryMenu", "_root.Menu_mc.bottomBar.frostInfoCard.RainProtectionValue.text", GetPlayerArmorRainProtection())
	UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.ExposureProtectionValue.text", "")
	UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.RainProtectionValue.text", "")
		
	WaitForSelectionSettle()
		
	if afIsArmor == 0
		locked = false
		return
	else
		SetItemCardValues()
	endif
	locked = false
	;int fid = UI.GetInt("InventoryMenu", "_root.Menu_mc.inventoryLists.itemList.selectedEntry.formId")
	;int exp = GetTotalExposureProtection(fid, 1, 1)
	;UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.ExposureProtectionValue.text", exp)
endEvent

function WaitForSelectionSettle()
	bool exit = false
	while !exit
		settled = true
		Utility.WaitMenuMode(0.25)
		if settled == true
			exit = true
		else
			; debug.trace("NOT SETTLED")
		endif
	endWhile
endFunction

function SetItemCardValues()
	if _Frost_DatastoreInitialized.GetValueInt() != 2
		UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.ExposureProtectionValue.text", "--")
		UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.RainProtectionValue.text", "--")
		return
	endif

	bool set = false
	_Frost_ArmorProtectionDatastoreHandler datastore = GetClothingDatastoreHandler()
	while !set
		int fid = UI.GetInt("InventoryMenu", "_root.Menu_mc.inventoryLists.itemList.selectedEntry.formId")
		Armor my_armor = Game.GetForm(fid) as Armor
		int[] protection_values = datastore.GetTotalProtectionValues(my_armor, datastore.GetGearType(my_armor as Form))
		; Previous lookup takes significant real time, are we still on this entry?
		if settled == true && protection_values[0] != -1
			UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.ExposureProtectionValue.text", protection_values[0])
			UI.SetString("InventoryMenu", "_root.Menu_mc.itemCard.RainProtectionValue.text", protection_values[1])
			set = true
		else
			WaitForSelectionSettle()
		endif
	endWhile
endFunction