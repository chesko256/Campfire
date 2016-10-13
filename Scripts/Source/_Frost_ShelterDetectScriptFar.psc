scriptname _Frost_ShelterDetectScriptFar extends ObjectReference

import CampUtil
import _FrostInternal
import _CampInternal

Actor property PlayerRef auto
GlobalVariable property _Frost_IsTakingShelter auto
FormList property _Camp_WarmBaseTents auto

Event OnInit()
	float dist = self.GetDistance(PlayerRef)
	if dist > 1200.0
		FrostDebug(1, "|||| Shelter ::: Not taking shelter. (Dist: " + dist + ") (detector " + self + ")")
		_Frost_IsTakingShelter.SetValueInt(1)

		; Clear any base game warm tents
		ObjectReference tent = GetCurrentTent()
		if tent
			if _Camp_WarmBaseTents.HasForm(tent.GetBaseObject())
				SetCurrentTent(None)
			endif
		endif
	endif
	self.Disable()
	self.Delete()
EndEvent