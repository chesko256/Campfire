scriptname _Frost_ShelterDetectScriptFar extends ObjectReference

import _FrostInternal

Actor property PlayerRef auto
GlobalVariable property _Frost_IsTakingShelter auto

Event OnInit()
	float dist = self.GetDistance(PlayerRef)
	if dist > 1200.0
		FrostDebug(1, "|||| Shelter ::: Not taking shelter. (Dist: " + dist + ") (detector " + self + ")")
		_Frost_IsTakingShelter.SetValueInt(1)
	endif
	self.Disable()
	self.Delete()
EndEvent