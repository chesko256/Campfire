scriptname _Camp_LegalAreaCheck extends ReferenceAlias

import CampUtil

GlobalVariable property _Camp_Setting_Legality auto

Keyword property LocTypeInn auto
Keyword property LocTypeHouse auto
Keyword property LocTypeBar auto

;@TBD
; Center marker references

;@TBD
; Factions

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

bool function GetCampingLegal(bool bIgnoreSetting = false)
	if _Camp_Setting_Legality.GetValueInt() == 1 && !bIgnoreSetting
		return true
	endif
	if InIllegalArea
		return false
	else
		return true
	endif
endFunction

Faction function GetAreaCampingFaction(ObjectReference akCenter)

	; Check center marker references
	;@TBD
	Location myLoc = akCenter.GetCurrentLocation()
	if myLoc
		if myLoc.HasKeyword(LocTypeInn) || myLoc.HasKeyword(LocTypeHouse) || myLoc.HasKeyword(LocTypeBar)
			return akCenter.GetParentCell().GetFactionOwner()
		endif
	endif
	
	return None
	
endFunction