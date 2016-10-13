scriptname _Frost_ShelterDetectScriptNear extends ObjectReference

import _FrostInternal
import _CampInternal

Actor property PlayerRef auto
GlobalVariable property _Frost_IsTakingShelter auto
FormList property _Camp_WarmBaseTents auto

Event OnInit()
	float dist = self.GetDistance(PlayerRef)
	if dist < 1200.0
		FrostDebug(1, "|||| Shelter ::: Taking shelter. (Dist: " + dist + ") (detector " + self + ")")
		_Frost_IsTakingShelter.SetValueInt(2)
	endif

	; Is this also a warm base-game tent?
	ObjectReference warmTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_WarmBaseTents, PlayerRef, 146.0)
	if warmTent
		SetCurrentTent(warmTent)
	endif

	self.Disable()
	self.Delete()
EndEvent