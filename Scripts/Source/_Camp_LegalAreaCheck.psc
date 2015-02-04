scriptname _Camp_LegalAreaCheck extends ReferenceAlias

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

_Camp_Compatibility property Compatibility auto
Actor property PlayerRef auto
ObjectReference property DLC2RavenRockCenterMarker auto hidden

bool function GetCampingLegal()
	if InIllegalArea || Compatibility.isDLC2Loaded && PlayerRef.GetDistance(DLC2RavenRockCenterMarker) < 4100.0
		return false
	else
		return true
	endif
endFunction
 