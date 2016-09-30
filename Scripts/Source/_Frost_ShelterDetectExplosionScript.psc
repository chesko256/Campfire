scriptname _Frost_ShelterDetectExplosionScript extends ObjectReference

import _FrostInternal

ObjectReference property _Frost_ShelterDetectOriginRef auto
GlobalVariable property _Frost_IsTakingShelter auto


;@TODO: switch to using origin; deprecate the sensor; fire from origin
Event OnInit()
	float dist = self.GetDistance(_Frost_ShelterDetectOriginRef)
	if dist < 1000.0
		FrostDebug(1, "|||| Shelter ::: Taking shelter. (Dist: " + dist + ")")
		_Frost_IsTakingShelter.SetValueInt(2)
	else
		FrostDebug(1, "|||| Shelter ::: Not taking shelter. (Dist: " + dist + ")")
		_Frost_IsTakingShelter.SetValueInt(1)
	endif
	self.Disable()
	self.Delete()
EndEvent