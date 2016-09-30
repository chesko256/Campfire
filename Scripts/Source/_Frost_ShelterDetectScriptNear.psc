scriptname _Frost_ShelterDetectScriptNear extends ObjectReference

import _FrostInternal

Actor property PlayerRef auto
GlobalVariable property _Frost_IsTakingShelter auto

Event OnInit()
	float dist = self.GetDistance(PlayerRef)
	if dist < 1200.0
		FrostDebug(1, "|||| Shelter ::: Taking shelter. (Dist: " + dist + ") (detector " + self + ")")
		_Frost_IsTakingShelter.SetValueInt(2)
	endif
	self.Disable()
	self.Delete()
EndEvent