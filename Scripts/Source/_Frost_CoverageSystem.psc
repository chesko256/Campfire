scriptname _Frost_CoverageSystem extends _Frost_BaseSystem

import FrostUtil
import _FrostInternal

GlobalVariable property _Frost_AttributeCoverage auto
GlobalVariable property _Frost_DatastoreInitialized auto
bool property windbreaker_perk_active auto hidden

function RegisterForEvents()
	debug.trace("Registerd for Frost_UpdateCoverage")
	RegisterForModEvent("Frost_UpdateCoverage", "UpdateCoverage")
	RegisterForModEvent("Campfire_CampfirePerkPurchased", "CampfirePerkPurchased")
endFunction

Event UpdateCoverage()
	int coverage
	coverage += GetClothingSystem().GetArmorCoverage()
	if windbreaker_perk_active
		coverage += Math.Ceiling(coverage * 0.25)
	endif

	; spells
	
	_FrostInternal.FrostDebug(0, "==== Coverage ::: Coverage Value: " + coverage)
	_Frost_AttributeCoverage.SetValueInt(coverage)
	SendEvent_UpdateBottomBarCoverage(coverage)
endEvent

function SetWindbreaker(bool active)
	if active
		windbreaker_perk_active = true
	else
		windbreaker_perk_active = false
	endif
endFunction

function SendEvent_UpdateBottomBarCoverage(int aiCoverage)
    if _Frost_DatastoreInitialized.GetValueInt() != 2
        return
    endif

    FrostDebug(0, "Sending event Frost_UpdateBottomBarCoverage")
    int handle = ModEvent.Create("Frost_UpdateBottomBarCoverage")
    if handle
        ModEvent.PushInt(handle, aiCoverage)
        ModEvent.Send(handle)
    endif
endFunction

Event CampfirePerkPurchased()
	UpdateCoverage()
endEvent