scriptname _Frost_ShelterSystem extends _Frost_BaseSystem

import CampUtil
import _FrostInternal

Actor property PlayerRef auto
_Frost_Compatibility property Compatibility auto
GlobalVariable property _Frost_IsTakingShelter auto
GlobalVariable property _Frost_ShelterDetectLastSeenTime auto
ObjectReference property _Frost_ShelterDetectOriginRef auto
ObjectReference property _Frost_ShelterDetectSensorRef auto
ObjectReference property _Frost_AnchorRef auto
Spell property _Frost_ShelterDetectBeam auto

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
			if _Frost_ShelterDetectOriginRef.IsEnabled() || _Frost_ShelterDetectSensorRef.IsEnabled()
				_Frost_ShelterDetectOriginRef.Disable()
				_Frost_ShelterDetectSensorRef.Disable()
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
			;/if time_delta_seconds > 4.0
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
			/;
			if _Frost_ShelterDetectOriginRef.IsDisabled()
				_Frost_ShelterDetectOriginRef.Enable()
			endif
			_Frost_ShelterDetectOriginRef.MoveTo(PlayerRef, 0.0, 0.0, 1200.0)
			_Frost_ShelterDetectBeam.Cast(_Frost_ShelterDetectOriginRef, PlayerRef)
		endif
	endif
endFunction

function StopSystem()
	_Frost_ShelterDetectOriginRef.MoveTo(_Frost_AnchorRef)
	_Frost_ShelterDetectSensorRef.MoveTo(_Frost_AnchorRef)
	parent.StopSystem()
endFunction