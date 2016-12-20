scriptname _Frost_ShelterSystem extends _Frost_BaseSystem

import CampUtil
import _FrostInternal

Actor property PlayerRef auto
_Frost_Compatibility property Compatibility auto
GlobalVariable property _Frost_IsTakingShelter auto
GlobalVariable property _Frost_ShelterDetectLastSeenTime auto
ObjectReference property _Frost_ShelterDetectOriginRef auto
ObjectReference property _Frost_ShelterDetectTargetRef auto
ObjectReference property _Frost_AnchorRef auto
Spell property _Frost_ShelterDetectBeamNear auto
Spell property _Frost_ShelterDetectBeamFar auto

; de-bounce variables
int wac_in_faction_counter = 0
int WAC_DEBOUNCE_THRESHOLD = 3

function Update()
	if !(IsRefInInterior(PlayerRef))
		float time_delta_seconds = (Game.GetRealHoursPassed() - _Frost_ShelterDetectLastSeenTime.GetValue()) * 3600.0
		int current_val = _Frost_IsTakingShelter.GetValueInt()
		bool in_wac_shelter_faction = false
		if Compatibility.isWACLoaded && Compatibility._WetIsUnderShelterFaction && \
			( Weather.GetCurrentWeather().GetClassification() == 2 || Compatibility._WetIsBlizzarding.GetValueInt() == 1)
			; Disable detection references and defer to Wet and Cold's system instead.
			if _Frost_ShelterDetectOriginRef.IsEnabled() || _Frost_ShelterDetectTargetRef.IsEnabled()
				_Frost_ShelterDetectOriginRef.Disable()
				_Frost_ShelterDetectTargetRef.Disable()
			endif
			in_wac_shelter_faction = PlayerRef.IsInFaction(Compatibility._WetIsUnderShelterFaction)
			
			if in_wac_shelter_faction
				wac_in_faction_counter += 1
				if wac_in_faction_counter >= WAC_DEBOUNCE_THRESHOLD
					_Frost_IsTakingShelter.SetValue(2)
				endif
				if wac_in_faction_counter >= WAC_DEBOUNCE_THRESHOLD && current_val == 1
					FrostDebug(1, "|||| Shelter ::: Started taking shelter (Wet and Cold).")
				endif
			else
				if current_val == 2
					FrostDebug(1, "|||| Shelter ::: Stopped taking shelter (Wet and Cold).")
				endif
				_Frost_IsTakingShelter.SetValue(1)
				wac_in_faction_counter = 0
			endif
		else
			if _Frost_ShelterDetectOriginRef.IsDisabled() || _Frost_ShelterDetectTargetRef.IsDisabled()
				_Frost_ShelterDetectOriginRef.Enable()
				_Frost_ShelterDetectTargetRef.Enable()
			endif
			_Frost_ShelterDetectOriginRef.MoveTo(PlayerRef, 0.0, 0.0, 200.0)
			_Frost_ShelterDetectTargetRef.MoveTo(PlayerRef, 0.0, 0.0, 1200.0)
			_Frost_ShelterDetectBeamNear.Cast(_Frost_ShelterDetectOriginRef, _Frost_ShelterDetectTargetRef)
			_Frost_ShelterDetectBeamFar.Cast(_Frost_ShelterDetectOriginRef, _Frost_ShelterDetectTargetRef)
		endif
	endif
endFunction

function StopSystem()
	_Frost_ShelterDetectOriginRef.MoveTo(_Frost_AnchorRef)
	_Frost_ShelterDetectTargetRef.MoveTo(_Frost_AnchorRef)
	parent.StopSystem()
endFunction