scriptname _Frost_CoverageSystem extends _Frost_BaseSystem

import CampUtil
import FrostUtil
import _FrostInternal

GlobalVariable property _Frost_AttributeCoverage auto
GlobalVariable property FrostfallAttributeCoverageReadOnly auto
GlobalVariable property _Frost_DatastoreInitialized auto
bool property windbreaker_perk_active auto hidden

bool property updating_coverage = false auto hidden

function RegisterForEvents()
	FallbackEventEmitter updateCoverageEvent = GetEventEmitter_UpdateCoverage()
	FallbackEventEmitter campfirePerkEvent = GetEventEmitter_CampfirePerkPurchased()

	updateCoverageEvent.RegisterFormForModEventWithFallback("Frost_UpdateCoverage", "UpdateCoverage", self)
	campfirePerkEvent.RegisterFormForModEventWithFallback("Campfire_CampfirePerkPurchased", "CampfirePerkPurchased", self)
endFunction

Event UpdateCoverage(bool abDisplayTextUpdate)
	int i = 20
    while updating_coverage == true && i > 0
        utility.wait(0.2)
        i -= 1
    endWhile

    updating_coverage = true
	int coverage
	_Frost_ClothingSystem clothing = GetClothingSystem()
	coverage += clothing.GetArmorCoverage(clothing.WornGearValues)
	if windbreaker_perk_active
		coverage += Math.Ceiling(coverage * 0.25)
	endif

	; spells
	
	_FrostInternal.FrostDebug(0, "==== Coverage ::: Coverage Value: " + coverage)
	int old_coverage = _Frost_AttributeCoverage.GetValueInt()
	_Frost_AttributeCoverage.SetValueInt(coverage)
	FrostfallAttributeCoverageReadOnly.SetValueInt(coverage)
	SendEvent_UpdateBottomBarCoverage(coverage)
	updating_coverage = false

	if abDisplayTextUpdate
		if FrostUtil.GetCompatibilitySystem().isUIPackageInstalled
			return
		else
			if old_coverage != coverage
				GetClothingSystem().RegisterForSingleUpdate(2)
			endif
		endif
	endif
endEvent

function SetWindbreaker(bool active)
	if active
		windbreaker_perk_active = true
	else
		windbreaker_perk_active = false
	endif
endFunction

;@NOFALLBACK
function SendEvent_UpdateBottomBarCoverage(int aiCoverage)
	if GetSKSELoaded()
    	if _Frost_DatastoreInitialized.GetValueInt() != 2
        	return
    	endif

    	FrostDebug(0, "Sending event Frost_UpdateBottomBarCoverage")
    	int handle = ModEvent.Create("Frost_UpdateBottomBarCoverage")
    	if handle
        	ModEvent.PushInt(handle, aiCoverage)
        	ModEvent.Send(handle)
    	endif
    endif
endFunction

Event CampfirePerkPurchased()
	UpdateCoverage(false)
endEvent