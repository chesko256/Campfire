scriptname _Camp_LegalAreaCheck extends ReferenceAlias

import CampUtil

GlobalVariable property _Camp_Setting_Legality auto
Formlist property _Camp_Workshops auto

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
	if InIllegalArea
		return false
	else
		if Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_Workshops, PlayerRef, 7250.0)
			return false
		else
			return true
		endif
	endif
endFunction
