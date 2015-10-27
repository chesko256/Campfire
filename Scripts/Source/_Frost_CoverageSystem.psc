scriptname _Frost_CoverageSystem extends _Frost_BaseSystem

import FrostUtil
import _FrostInternal

GlobalVariable property _Frost_AttributeCoverage auto
GlobalVariable property _Frost_DatastoreInitialized auto
GlobalVariable property _Frost_PerkRank_Windbreaker auto

int current_windbreaker_bonus

function RegisterForEvents()
	debug.trace("Registerd for Frost_UpdateCoverage")
	RegisterForModEvent("Frost_UpdateCoverage", "UpdateCoverage")
endFunction

Event UpdateCoverage()
	int coverage
	coverage += GetClothingSystem().GetArmorCoverage()
	coverage += current_windbreaker_bonus
	
	; spells
	
	_FrostInternal.FrostDebug(0, "==== Coverage ::: Coverage Value: " + coverage)
	_Frost_AttributeCoverage.SetValueInt(coverage)
	SendEvent_UpdateBottomBarCoverage(coverage)
endEvent

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