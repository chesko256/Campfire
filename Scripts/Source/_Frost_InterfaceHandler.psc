scriptname _Frost_InterfaceHandler extends Quest

import CampUtil
import FrostUtil
import _FrostInternal
import Math

Actor property PlayerRef auto

_Frost_ClothingSystem clothing
_Frost_ArmorProtectionDatastoreHandler handler

function RegisterForEvents()
	if !GetSKSELoaded()
		return
	endif

	RegisterForModEvent("Frost_OnSkyUIInvListGetEntryProtectionData", "OnSkyUIInvListGetEntryProtectionData")
	RegisterForModEvent("Frost_OnSkyUIInvListGetEntryChangeData", "OnSkyUIInvListGetEntryChangeData")
	RegisterForModEvent("Frost_OnSkyUIInvListGetEntryProtectionDataOnProcess", "OnSkyUIInvListGetEntryProtectionDataOnProcess")
	RegisterForModEvent("Frost_InvalidateFetchedRangesOnProcess", "InvalidateFetchedRangesOnProcess")
	RegisterForModEvent("Frost_UpdateBottomBarWarmth", "UpdateBottomBarWarmth")
	RegisterForModEvent("Frost_UpdateBottomBarCoverage", "UpdateBottomBarCoverage")

	; Pre-resolve these.
	clothing = GetClothingSystem()
	handler = GetClothingDatastoreHandler()
endFunction

function RegisterForMenus()
	if !GetSKSELoaded()
		return
	endif
	
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

Event OnSkyUIInvListGetEntryProtectionData(string asEventName, string asArmorName, float afIndex, Form akBaseObject)
	; debug.trace("OnSkyUIInvListGetEntryProtectionData called with index " + afIndex + " with name " + asArmorName + " with form " + akBaseObject)
	int[] vals = new int[3]
	vals[0] = afIndex as Int
	if asArmorName != ""
		int[] totals = handler.GetTotalArmorProtectionValuesWithType(akBaseObject as Armor, asArmorName)
		vals[1] = totals[0] ; Warmth
		vals[2] = totals[1] ; Coverage
		
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

Event OnSkyUIInvListGetEntryChangeData(string asEventName, string asArmorName, float afIndex, Form akBaseObject)
	; debug.trace("OnSkyUIInvListGetEntryChangeData called with index " + afIndex + " with name " + asArmorName + " with form " + akBaseObject)
	int[] vals = new int[3]
	vals[0] = afIndex as Int
	if asArmorName != ""
		Armor the_armor = akBaseObject as Armor
		int type = handler.GetGearType(the_armor, the_armor.GetSlotMask())

		if type != 0
			int index_to_check = (type * 2) - 2
			; Warmth Change
			vals[1] = clothing.WornGearValues[index_to_check]
			; debug.trace("Current type warmth " + vals[1])
			; Coverage Change
			vals[2] = clothing.WornGearValues[index_to_check + 1]
			; debug.trace("Current type coverage " + vals[2])
		endif
		
		if UI.IsMenuOpen("InventoryMenu")
			UI.InvokeIntA("InventoryMenu", "_root.Menu_mc.setEntryChangeData", vals)
		elseif UI.IsMenuOpen("ContainerMenu")
			UI.InvokeIntA("ContainerMenu", "_root.Menu_mc.setEntryChangeData", vals)
		elseif UI.IsMenuOpen("BarterMenu")
			UI.InvokeIntA("BarterMenu", "_root.Menu_mc.setEntryChangeData", vals)
		endif
	endif
endEvent

Event OnSkyUIInvListGetEntryProtectionDataOnProcess(string asEventName, string asString, float afIndex, Form akBaseObject)
	if UI.IsMenuOpen("InventoryMenu")
		UI.InvokeInt("InventoryMenu", "_root.Menu_mc.setEntryProtectionDataOnProcess", afIndex as Int)
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.InvokeInt("ContainerMenu", "_root.Menu_mc.setEntryProtectionDataOnProcess", afIndex as Int)
	elseif UI.IsMenuOpen("BarterMenu")
		UI.InvokeInt("BarterMenu", "_root.Menu_mc.setEntryProtectionDataOnProcess", afIndex as Int)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.InvokeInt("Crafting Menu", "_root.Menu.setEntryProtectionDataOnProcess", afIndex as Int)
	endif
endEvent

Event InvalidateFetchedRangesOnProcess(string asEventName, string asArg, float afFloat, Form akBaseObject)
	if UI.IsMenuOpen("InventoryMenu")
		UI.Invoke("InventoryMenu", "_root.Menu_mc.onFrostfallInvalidateFetchedRangesOnProcess")
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.Invoke("ContainerMenu", "_root.Menu_mc.onFrostfallInvalidateFetchedRangesOnProcess")
	elseif UI.IsMenuOpen("BarterMenu")
		UI.Invoke("BarterMenu", "_root.Menu_mc.onFrostfallInvalidateFetchedRangesOnProcess")
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.Invoke("Crafting Menu", "_root.Menu.onFrostfallInvalidateFetchedRangesOnProcess")
	endif

	; Also update the bottom bar change data.
	InvalidateFetchedChangeRanges()
endEvent

function InvalidateFetchedChangeRanges()
	if UI.IsMenuOpen("InventoryMenu")
		UI.Invoke("InventoryMenu", "_root.Menu_mc.onFrostfallInvalidateChangeRanges")
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.Invoke("ContainerMenu", "_root.Menu_mc.onFrostfallInvalidateChangeRanges")
	elseif UI.IsMenuOpen("BarterMenu")
		UI.Invoke("BarterMenu", "_root.Menu_mc.onFrostfallInvalidateChangeRanges")
	endif
endFunction

Event UpdateBottomBarWarmth(int aiWarmth)
	if UI.IsMenuOpen("InventoryMenu")
		UI.InvokeInt("InventoryMenu", "_root.Menu_mc.bottomBar.updateFrostfallWarmth", aiWarmth)
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.InvokeInt("ContainerMenu", "_root.Menu_mc.bottomBar.updateFrostfallWarmth", aiWarmth)
	elseif UI.IsMenuOpen("BarterMenu")
		UI.InvokeInt("BarterMenu", "_root.Menu_mc.bottomBar.updateFrostfallWarmth", aiWarmth)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.InvokeInt("Crafting Menu", "_root.Menu.BottomBarInfo.updateFrostfallWarmth", aiWarmth)
	endif
endEvent

Event UpdateBottomBarCoverage(int aiCoverage)
	if UI.IsMenuOpen("InventoryMenu")
		UI.InvokeInt("InventoryMenu", "_root.Menu_mc.bottomBar.updateFrostfallCoverage", aiCoverage)
	elseif UI.IsMenuOpen("ContainerMenu")
		UI.InvokeInt("ContainerMenu", "_root.Menu_mc.bottomBar.updateFrostfallCoverage", aiCoverage)
	elseif UI.IsMenuOpen("BarterMenu")
		UI.InvokeInt("BarterMenu", "_root.Menu_mc.bottomBar.updateFrostfallCoverage", aiCoverage)
	elseif UI.IsMenuOpen("Crafting Menu")
		UI.InvokeInt("Crafting Menu", "_root.Menu.BottomBarInfo.updateFrostfallCoverage", aiCoverage)
	endif
endEvent

function SendEvent_UpdateWarmthAndCoverage()
    int handle_1 = ModEvent.Create("Frost_UpdateWarmth")
    if handle_1
    	ModEvent.PushBool(handle_1, false)
        ModEvent.Send(handle_1)
    endif
    int handle_2 = ModEvent.Create("Frost_UpdateCoverage")
    if handle_2
    	ModEvent.PushBool(handle_2, false)
        ModEvent.Send(handle_2)
    endif
endFunction
