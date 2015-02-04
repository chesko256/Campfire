scriptname _Camp_LegalAreaCheck extends ReferenceAlias

import debug

bool property CampingLegal auto hidden

Actor property PlayerRef auto

FormList property _DE_CampingRestrictedWorldspaces auto

Quest property _Camp_MainQuest auto
_Camp_Compatibility property Compatibility auto
GlobalVariable property _DE_IsCampingLegal auto
ObjectReference property DragonBridgeLocationCenterMarkerREF auto
ObjectReference property CenterMarkerDawnstar auto
ObjectReference property CenterMarkerHelgen auto
ObjectReference property CenterMarkerFalkreath auto
ObjectReference property CenterMarkerRfiten auto
ObjectReference property CenterMarkerKarthwasten auto
ObjectReference property CenterMarkerIvarstead auto
ObjectReference property CenterMarkerRorikstead auto
ObjectReference property CenterMarkerShorsStone auto
ObjectReference property CenterMarkerWinterhold auto
ObjectReference property CenterMarkerMorthal auto
ObjectReference property CenterMarkerWhiterun auto
ObjectReference property SolitudeCenterMarker auto
ObjectReference property CenterMarkerSolitudeSawmill auto
ObjectReference property RiverwoodLocationCenterMarker auto
ObjectReference property KynesgroveLocationCenterMarkerREF auto
ObjectReference property WindhelmLocationCenterMarkerREF auto
ObjectReference property _DE_MarkarthCenterMarker auto
ObjectReference property CWSiegeDefendTrigger1Whiterun auto		;Dragon's Reach
ObjectReference property WinterholdCollegeCenterMarker auto		;Resolve manually
ObjectReference property DLC2RavenRockCenterMarker auto hidden

Worldspace property WindhelmWorld auto
Worldspace property RiftenWorld auto
Worldspace property MarkarthWorld auto
Worldspace property WhiterunWorld auto
Worldspace property SolitudeWorld auto

Keyword property LocTypeDwelling auto
Keyword property LocTypeInn auto
Keyword property LocTypeHouse auto
Keyword property LocTypeJail auto

bool bIsRunning = false
Location myLoc

ObjectReference[] CenterMarkers
ObjectReference nearest

Event OnCellChange()
	;Precompute nearest marker
	float nearest_distance

	if _Camp_MainQuest.IsRunning() && Compatibility.isDLC2Loaded
		if DLC2RavenRockCenterMarker == none
			DLC2RavenRockCenterMarker = Game.GetFormFromFile(0x020295EA, "Dragonborn.esm") as ObjectReference
		endif
	endif

	nearest = CenterMarkerDawnstar
	nearest_distance = PlayerRef.GetDistance(CenterMarkerDawnstar)

	if PlayerRef.GetDistance(CenterMarkerWhiterun) < nearest_distance
		nearest = CenterMarkerWhiterun
	endif
	if PlayerRef.GetDistance(CenterMarkerHelgen) < nearest_distance
		nearest = CenterMarkerHelgen
	endif
	if PlayerRef.GetDistance(CenterMarkerFalkreath) < nearest_distance
		nearest = CenterMarkerFalkreath
	endif
	if PlayerRef.GetDistance(CenterMarkerKarthwasten) < nearest_distance
		nearest = CenterMarkerKarthwasten
	endif
	if PlayerRef.GetDistance(CenterMarkerIvarstead) < nearest_distance
		nearest = CenterMarkerIvarstead
	endif
	if PlayerRef.GetDistance(CenterMarkerRorikstead) < nearest_distance
		nearest = CenterMarkerRorikstead
	endif
	if PlayerRef.GetDistance(CenterMarkerShorsStone) < nearest_distance
		nearest = CenterMarkerShorsStone
	endif
	if PlayerRef.GetDistance(CenterMarkerWinterhold) < nearest_distance
		nearest = CenterMarkerWinterhold
	endif
	if PlayerRef.GetDistance(CenterMarkerMorthal) < nearest_distance
		nearest = CenterMarkerMorthal
	endif
	if PlayerRef.GetDistance(CenterMarkerSolitudeSawmill) < nearest_distance
		nearest = CenterMarkerSolitudeSawmill
	endif
	if PlayerRef.GetDistance(RiverwoodLocationCenterMarker) < nearest_distance
		nearest = RiverwoodLocationCenterMarker
	endif
	if PlayerRef.GetDistance(KynesgroveLocationCenterMarkerREF) < nearest_distance
		nearest = KynesgroveLocationCenterMarkerREF
	endif
	if PlayerRef.GetDistance(_DE_MarkarthCenterMarker) < nearest_distance
		nearest = _DE_MarkarthCenterMarker
	endif
	if PlayerRef.GetDistance(CenterMarkerRfiten) < nearest_distance
		nearest = CenterMarkerRfiten
	endif
	if PlayerRef.GetDistance(WindhelmLocationCenterMarkerREF) < nearest_distance
		nearest = WindhelmLocationCenterMarkerREF
	endif
	if PlayerRef.GetDistance(SolitudeCenterMarker) < nearest_distance
		nearest = SolitudeCenterMarker
	endif
	if PlayerRef.GetDistance(CWSiegeDefendTrigger1Whiterun) < nearest_distance
		nearest = CWSiegeDefendTrigger1Whiterun
	endif
	if PlayerRef.GetDistance(WinterholdCollegeCenterMarker) < nearest_distance
		nearest = WinterholdCollegeCenterMarker
	endif
	if PlayerRef.GetDistance(DLC2RavenRockCenterMarker) < nearest_distance
		nearest = DLC2RavenRockCenterMarker
	endif

	debug.trace("[Campfire] Nearest is " + nearest)
endEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	myLoc = akNewLoc
endEvent

Event OnUpdate()
	CampingLegal = GetCampingLegal()
	if bIsRunning
		RegisterForSingleUpdate(1)
	endif
endEvent

function GetCampingLegalStart()
	bIsRunning = true
	;trace("[FROSTFALL] Starting camping legality check...")
	RegisterForSingleUpdate(1)
endFunction

function GetCampingLegalStop()
	;trace("[FROSTFALL] Stopping camping legality check...")
	bIsRunning = false
endFunction

bool function GetCampingLegal()
	;@TODO: Necessary to check IsRunning?
	if _Camp_MainQuest.IsRunning() && Compatibility.isDLC2Loaded
		if DLC2RavenRockCenterMarker == none
			DLC2RavenRockCenterMarker = Game.GetFormFromFile(0x020295EA, "Dragonborn.esm") as ObjectReference
		endif
	endif

	if nearest == DragonBridgeLocationCenterMarkerREF && PlayerRef.GetDistance(DragonBridgeLocationCenterMarkerREF) < 3200.0
		return false
	elseif nearest == CenterMarkerDawnstar && PlayerRef.GetDistance(CenterMarkerDawnstar) < 8400.0
		return false
	elseif nearest == CenterMarkerWhiterun && PlayerRef.GetDistance(CenterMarkerWhiterun) < 5600.0
		return false
	elseif nearest == CenterMarkerHelgen && PlayerRef.GetDistance(CenterMarkerHelgen) < 4200.0
		return false
	elseif nearest == CenterMarkerFalkreath && PlayerRef.GetDistance(CenterMarkerFalkreath) < 4000.0
		return false
	elseif nearest == CenterMarkerKarthwasten && PlayerRef.GetDistance(CenterMarkerKarthwasten) < 4000.0
		return false
	elseif nearest == CenterMarkerIvarstead && PlayerRef.GetDistance(CenterMarkerIvarstead) < 5200.0
		return false
	elseif nearest == CenterMarkerRorikstead && PlayerRef.GetDistance(CenterMarkerRorikstead) < 3000.0
		return false
	elseif nearest == CenterMarkerShorsStone && PlayerRef.GetDistance(CenterMarkerShorsStone) < 2000.0
		return false
	elseif nearest == CenterMarkerWinterhold && PlayerRef.GetDistance(CenterMarkerWinterhold) < 3000.0
		return false
	elseif nearest == CenterMarkerMorthal && PlayerRef.GetDistance(CenterMarkerMorthal) < 5500.0
		return false
	elseif nearest == CenterMarkerSolitudeSawmill && PlayerRef.GetDistance(CenterMarkerSolitudeSawmill) < 1200.0
		return false
	elseif nearest == RiverwoodLocationCenterMarker && PlayerRef.GetDistance(RiverwoodLocationCenterMarker) < 3700.0
		return false
	elseif nearest == KynesgroveLocationCenterMarkerREF && PlayerRef.GetDistance(KynesgroveLocationCenterMarkerREF) < 5000.0
		return false
	elseif nearest == _DE_MarkarthCenterMarker && PlayerRef.GetDistance(_DE_MarkarthCenterMarker) < 6000.0
		return false
	elseif nearest == CenterMarkerRfiten && PlayerRef.GetDistance(CenterMarkerRfiten) < 6000.0
		return false
	elseif nearest == WindhelmLocationCenterMarkerREF && PlayerRef.GetDistance(WindhelmLocationCenterMarkerREF) < 8000.0
		return false
	elseif nearest == SolitudeCenterMarker && PlayerRef.GetDistance(SolitudeCenterMarker) < 11000.0
		return false
	elseif nearest == CWSiegeDefendTrigger1Whiterun && PlayerRef.GetDistance(CWSiegeDefendTrigger1Whiterun) < 5600.0
		return false
	elseif nearest == WinterholdCollegeCenterMarker && PlayerRef.GetDistance(WinterholdCollegeCenterMarker) < 4000.0
		return false
	;@TODO: Necessary to check IsRunning?
	elseif Compatibility.isDLC2Loaded && nearest == DLC2RavenRockCenterMarker && PlayerRef.GetDistance(DLC2RavenRockCenterMarker) < 4100.0	;RavenRock center marker 
		return false
	else
		if _DE_CampingRestrictedWorldspaces.HasForm(PlayerRef.GetWorldspace())
			return false
		elseif myLoc
			if myLoc.HasKeyword(LocTypeDwelling) || myLoc.HasKeyword(LocTypeInn) || myLoc.HasKeyword(LocTypeHouse) || myLoc.HasKeyword(LocTypeJail)
				return false
			endif
		endif
	endif
	
	;trace("[FROSTFALL] I can camp here!")
	return true
	
endFunction
 