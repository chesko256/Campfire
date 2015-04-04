scriptname _Camp_LegalAreaCheck extends ReferenceAlias

import CampUtil

GlobalVariable property _Camp_Setting_Legality auto

Keyword property LocTypeDwelling auto
Keyword property LocTypeInn auto
Keyword property LocTypeHouse auto
Keyword property LocTypeJail auto

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
ObjectReference property _Camp_MarkarthCenterMarker auto
ObjectReference property CWSiegeDefendTrigger1Whiterun auto		;Dragon's Reach
ObjectReference property WinterholdCollegeCenterMarker auto		;Resolve manually

Faction property TownDragonBridgeFaction auto
Faction property TownDawnstarFaction auto
Faction property TownWhiterunFaction auto
Faction property TownHelgenFaction auto
Faction property TownFalkreathFaction auto
Faction property TownKarthwastenFaction auto
Faction property TownIvarsteadFaction auto
Faction property TownRoriksteadFaction auto
Faction property TownShorsStoneFaction auto
Faction property TownWinterholdFaction auto
Faction property TownMorthalFaction auto
Faction property TownRiverwoodFaction auto
Faction property TownKynesgroveFaction auto
Faction property TownMarkarthFaction auto
Faction property TownRiftenFaction auto
Faction property TownWindhelmFaction auto
Faction property TownSolitudeFaction auto

;Store camping legal status and catch out-of-order state changes.
bool in_illegal_area = false
bool race_guard = false
bool property InIllegalArea hidden
	function set(bool value)
		if race_guard
			in_illegal_area = !in_illegal_area
			race_guard = false
		else
			if in_illegal_area == value
				race_guard = true
			else
				in_illegal_area = value
			endif
		endif
	endFunction

	bool function get()
		return in_illegal_area
	endFunction
endProperty

Actor property PlayerRef auto
ObjectReference property DLC2RavenRockCenterMarker auto hidden
Faction property DLC2RavenRockGuardFaction auto hidden

bool function GetCampingLegal(bool bIgnoreSetting = false)
	if _Camp_Setting_Legality.GetValueInt() == 1 && !bIgnoreSetting
		return true
	endif
	if InIllegalArea || GetCompatibilitySystem().isDLC2Loaded && PlayerRef.GetDistance(DLC2RavenRockCenterMarker) < 4100.0
		return false
	else
		return true
	endif
endFunction

Faction function GetAreaCampingFaction(ObjectReference akCenter)

	if GetCompatibilitySystem().isDLC2Loaded
		if DLC2RavenRockCenterMarker == none
			DLC2RavenRockCenterMarker = Game.GetFormFromFile(0x020295EA, "Dragonborn.esm") as ObjectReference
		endif
		if DLC2RavenRockGuardFaction == none
			DLC2RavenRockGuardFaction = Game.GetFormFromFile(0x020195AD, "Dragonborn.esm") as Faction
		endif
	endif

	if akCenter.GetDistance(DragonBridgeLocationCenterMarkerREF) < 3200.0
		return TownDragonBridgeFaction
	elseif akCenter.GetDistance(CenterMarkerDawnstar) < 8400.0
		return TownDawnstarFaction
	elseif akCenter.GetDistance(CenterMarkerWhiterun) < 5600.0
		return TownWhiterunFaction
	elseif akCenter.GetDistance(CenterMarkerHelgen) < 4200.0
		return TownHelgenFaction
	elseif akCenter.GetDistance(CenterMarkerFalkreath) < 4000.0
		return TownFalkreathFaction
	elseif akCenter.GetDistance(CenterMarkerKarthwasten) < 4000.0
		return TownKarthwastenFaction
	elseif akCenter.GetDistance(CenterMarkerIvarstead) < 5200.0
		return TownIvarsteadFaction
	elseif akCenter.GetDistance(CenterMarkerRorikstead) < 3000.0
		return TownRoriksteadFaction
	elseif akCenter.GetDistance(CenterMarkerShorsStone) < 2000.0
		return TownShorsStoneFaction
	elseif akCenter.GetDistance(CenterMarkerWinterhold) < 3000.0
		return TownWinterholdFaction
	elseif akCenter.GetDistance(CenterMarkerMorthal) < 5500.0
		return TownMorthalFaction
	elseif akCenter.GetDistance(RiverwoodLocationCenterMarker) < 3700.0
		return TownRiverwoodFaction
	elseif akCenter.GetDistance(KynesgroveLocationCenterMarkerREF) < 5000.0
		return TownKynesgroveFaction
	elseif akCenter.GetDistance(_Camp_MarkarthCenterMarker) < 6000.0
		return TownMarkarthFaction
	elseif akCenter.GetDistance(CenterMarkerRfiten) < 6000.0
		return TownRiftenFaction
	elseif akCenter.GetDistance(WindhelmLocationCenterMarkerREF) < 8000.0
		return TownWindhelmFaction
	elseif akCenter.GetDistance(SolitudeCenterMarker) < 11000.0
		return TownSolitudeFaction
	elseif akCenter.GetDistance(CWSiegeDefendTrigger1Whiterun) < 5600.0
		return TownWhiterunFaction
	elseif akCenter.GetDistance(WinterholdCollegeCenterMarker) < 4000.0
		return TownWinterholdFaction
	elseif GetCompatibilitySystem().isDLC2Loaded && akCenter.GetDistance(DLC2RavenRockCenterMarker) < 4100.0	;RavenRock center marker 
		return DLC2RavenRockGuardFaction
	else
		Location myLoc = akCenter.GetCurrentLocation()
		if myLoc
			if myLoc.HasKeyword(LocTypeDwelling) || myLoc.HasKeyword(LocTypeInn) || myLoc.HasKeyword(LocTypeHouse) || myLoc.HasKeyword(LocTypeJail)
				return akCenter.GetParentCell().GetFactionOwner()
			endif
		endif
	endif
	
	return None
	
endFunction