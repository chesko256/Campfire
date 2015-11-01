scriptname _Frost_ShelterSystem extends _Frost_BaseSystem

import CampUtil
import _FrostInternal

Actor property PlayerRef auto
GlobalVariable property _Frost_IsTakingShelter auto
GlobalVariable property _Frost_ShelterDetectLastSeenTime auto
ObjectReference property _Frost_ShelterDetectOriginRef auto
ObjectReference property _Frost_ShelterDetectSensorRef auto
ObjectReference property _Frost_AnchorRef auto
Spell property _Frost_ShelterDetectBeam auto

; Debug

function Update()
	if !(IsRefInInterior(PlayerRef))
		float time_delta_seconds = (Game.GetRealHoursPassed() - _Frost_ShelterDetectLastSeenTime.GetValue()) * 3600.0
		int current_val = _Frost_IsTakingShelter.GetValueInt()
		if time_delta_seconds > 4.0
			if current_val == 1
				FrostDebug(1, "|||| Shelter ::: Started taking shelter.")
			endif
			_Frost_IsTakingShelter.SetValue(2)
		else
			if current_val == 2
				FrostDebug(1, "|||| Shelter ::: Stopped taking shelter.")
			endif
			_Frost_IsTakingShelter.SetValue(1)
		endif
		_Frost_ShelterDetectOriginRef.MoveTo(PlayerRef, 0.0, 0.0, 130.0)
		_Frost_ShelterDetectSensorRef.MoveTo(PlayerRef, 0.0, 0.0, 1200.0)
		_Frost_ShelterDetectBeam.Cast(_Frost_ShelterDetectOriginRef, _Frost_ShelterDetectSensorRef)
	endif
endFunction

function StopSystem()
	_Frost_ShelterDetectOriginRef.MoveTo(_Frost_AnchorRef)
	_Frost_ShelterDetectSensorRef.MoveTo(_Frost_AnchorRef)
	parent.StopSystem()
endFunction