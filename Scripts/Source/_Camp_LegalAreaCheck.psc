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

	if PlayerRef.GetDistance(DragonBridgeLocationCenterMarkerREF) < 3200.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerDawnstar) < 8400.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerWhiterun) < 5600.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerHelgen) < 4200.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerFalkreath) < 4000.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerKarthwasten) < 4000.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerIvarstead) < 5200.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerRorikstead) < 3000.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerShorsStone) < 2000.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerWinterhold) < 3000.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerMorthal) < 5500.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerSolitudeSawmill) < 1200.0
		return false
	elseif PlayerRef.GetDistance(RiverwoodLocationCenterMarker) < 3700.0
		return false
	elseif PlayerRef.GetDistance(KynesgroveLocationCenterMarkerREF) < 5000.0
		return false
	elseif PlayerRef.GetDistance(_DE_MarkarthCenterMarker) < 6000.0
		return false
	elseif PlayerRef.GetDistance(CenterMarkerRfiten) < 6000.0
		return false
	elseif PlayerRef.GetDistance(WindhelmLocationCenterMarkerREF) < 8000.0
		return false
	elseif PlayerRef.GetDistance(SolitudeCenterMarker) < 11000.0
		return false
	elseif PlayerRef.GetDistance(CWSiegeDefendTrigger1Whiterun) < 5600.0
		return false
	elseif PlayerRef.GetDistance(WinterholdCollegeCenterMarker) < 4000.0
		return false
	;@TODO: Necessary to check IsRunning?
	elseif _Camp_MainQuest.IsRunning() && Compatibility.isDLC2Loaded && PlayerRef.GetDistance(DLC2RavenRockCenterMarker) < 4100.0	;RavenRock center marker 
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
 