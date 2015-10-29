Scriptname _Frost_ExposureSystem extends _Frost_BaseSystem

import CampUtil

Actor property PlayerRef auto
GlobalVariable property _Frost_Setting_ExposureOn auto
GlobalVariable property _Frost_Setting_MaxExposureMode auto
GlobalVariable property _Frost_WetLevel auto
GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_Calc_ExtremeMultiplier auto
GlobalVariable property _Frost_Calc_StasisMultiplier auto
GlobalVariable property _Frost_Calc_ExtremeTemp auto
GlobalVariable property _Frost_Calc_StasisTemp auto
GlobalVariable property _Frost_Calc_MaxWarmth auto
GlobalVariable property _Frost_Calc_MaxCoverage auto

int property FIRE_FACTOR = 8 autoReadOnly
int property HEAT_FACTOR = 6 autoReadOnly
int property TENT_FACTOR = 1 autoReadOnly
int property WARM_TENT_BONUS = 1 autoReadOnly

float last_update_time = 0.0
float this_update_time = 0.0
float distance_moved = 0.0
bool in_interior = false

function StartSystem()
	parent.StartSystem()
	; Exposure-related helper quests
	;/if !ShelterQuest.IsRunning()
		ShelterQuest.Start()
	endif
	if !_Frost_LightableFiresQuest.IsRunning()
		_Frost_LightableFiresQuest.Start()
	endif
	/;
	; Add exposure mechanic spells
endFunction

function StopSystem()
	parent.StopSystem()
endFunction

function Update()
	if last_update_time == 0.0
		; Skip the first update
		last_update_time = Game.GetRealHoursPassed()
		return
	endif

	this_update_time = Game.GetRealHoursPassed()

	if _Frost_Setting_ExposureOn.GetValueInt() == 2
		UpdateExposure()
	else
		StopSystem()
	endif

	last_update_time = this_update_time
endFunction

function UpdateExposure()
	if PlayerIsInDialogue()
		return
	endif

	; Gather data
	RefreshAbleToFastTravel()
	RefreshPlayerStateData()

	int wet_level = _Frost_WetLevel.GetValueInt()
	int warmth = _Frost_AttributeWarmth.GetValueInt()

	; Take action
	if this_vampire_state == false && last_vampire_state == true
		; The player just cured their vampirism. Set their exposure low.
		SetExposure(30.0)
	endif

	CalculateExposureChange()
	ExposureEffectsUpdate()

	StoreLastPlayerState()
endFunction

function RefreshPlayerStateData()
	;/this_worldspace = PlayerRef.GetWorldSpace()
	in_interior = CampUtil.IsRefInInterior(PlayerRef)
	distance_moved = GetDistanceMoved()
	if distance_moved > 0.0
		;@TODO: Let animation quest handle this itself
		;_DE_WarmingHandsToggle.SetValue(1)
	endif

	bool fast_travelled = GetFastTravelled(distance_moved)
	if fast_travelled
		SetAfterFastTravelCondition()
	endif
	/;
endFunction

function StoreLastPlayerState()
	; Store the player's last known position and vampire state.
	;/last_worldspace = this_worldspace
	last_interior_state = in_interior
	last_x = player_x
	last_y = player_y
	last_vampire_state = this_vampire_state
	/;
endFunction

;/function WaitStateUpdate()
	;@TODO: Drive this with a reference alias instead, add all vanilla bed rolls + _Camp_TentLayDownMarker to _Frost_SleepObjects
	; and condition against _Frost_Setting_NoWaitingOutdoors and _Camp_ConditionValues.IsPlayerInInterior

	;@TODO: Provide FrostUtil.PlayerAbleToWait()
endFunction
/;

;@TODO: Possibly wrap in FrostUtil IsAbleToFastTravel() or similar
function RefreshAbleToFastTravel()
	; Can the player fast-travel?

	if Compatibility.isDLC2Loaded
		WorldSpace my_ws = PlayerRef.GetWorldspace()
		if _Frost_WorldspacesExteriorOblivion.HasForm(my_ws)
			Game.EnableFastTravel()
			return
		endif
	endif
	; Is the player riding a dragon?
	if (_Frost_Main as _Frost_ConditionValues).IsRidingFlyingMount
		Game.EnableFastTravel()
		return
	endif

	if _Frost_Setting_NoFastTravel.GetValueInt() == 2
		Game.EnableFastTravel(false)
	else																;Fast Travel Cost = Off
		Game.EnableFastTravel()
	endif
endFunction

float function GetDistanceMoved()
	return abs(sqrt(pow((player_x - last_x), 2) + pow((player_y - last_y), 2)))
endFunction

bool function GetFastTravelled(float afDistance)
	if this_worldspace == last_worldspace && afDistance > 30000.0
		if !FrostUtil.IsNearFastTravelException()
			if last_interior_state == in_interior
				; Across a large distance, we did not move from interior to exterior / vice versa
				return true
			else
				return false
			endif
		else
			; We traveled while near a carriage; set the player's EP to 100 post-travel
			return true
		endif
	else
		return false
	endif
endFunction

function SetAfterFastTravelCondition()
	SetExposure(100.0)
	_Frost_WetnessSystem wet = GetWetnessSystem()
	wet.ModAttributeWetness(-(wet.MAX_WETNESS), 0.0)
endFunction

function ExposureEffectsUpdate()
	float myCurrentEP = _DE_ExposurePoints.GetValue()
	
	if myCurrentEP >= 81
		SetExposureEffects(0)
	elseif myCurrentEP < 81 && myCurrentEP >= 61
		SetExposureEffects(1)
	elseif myCurrentEP < 61 && myCurrentEP >= 41
		SetExposureEffects(2)
	elseif myCurrentEP < 41 && myCurrentEP >= 21
		SetExposureEffects(3)
	elseif myCurrentEP < 21 && myCurrentEP >= 1
		SetExposureEffects(4)
	elseif myCurrentEP < 1
		SetExposureEffects(5)
	endif
endFunction

function SetExposureEffects(int iExposureLevel)
	; Death / Incapacitate
	if iExposureLevel == 5
		HandleMaxExposure()
	endif

	; Freezing to Death
	if iExposureLevel == 4
		PlayerRef.AddSpell(_Frost_Hypo_Spell_4, false)
		PlayerRef.AddSpell(_Frost_Hypo_Spell_4NoFrost, false)
	else
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_4)
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_4NoFrost)
	endif

	; Freezing
	if iExposureLevel == 3
		PlayerRef.AddSpell(_Frost_Hypo_Spell_3, false)
		PlayerRef.AddSpell(_Frost_Hypo_Spell_3NoFrost, false)
	else
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_3)
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_3NoFrost)
	endif

	; Cold
	if iExposureLevel == 2
		PlayerRef.AddSpell(_Frost_Hypo_Spell_2, false)
	else
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_2)
	endif

	; Chilly
	if iExposureLevel == 1
		PlayerRef.AddSpell(_Frost_Hypo_Spell_1, false)
	else
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_1)
	endif

	ApplyVisualEffects(iExposureLevel)
	ShowExposureStateMessage(iExposureLevel)
	ApplySoundEffects(iExposureLevel)
	ApplyForceFeedback(iExposureLevel)
endFunction

function ShowExposureStateMessage(int iExposureLevel)
	if (iExposureLevel != last_exposure_level) && _Frost_Setting_ConditionMsg.GetValueInt() == 2
		if iExposureLevel == 0
			_Frost_HypoState_0.Show()
		elseif iExposureLevel == 1
			_Frost_HypoState_1.Show()
		elseif iExposureLevel == 2
			_Frost_HypoState_2.Show()
			ShowTutorial_Exposure()
		elseif iExposureLevel == 3
			_Frost_HypoState_3.Show()
		elseif iExposureLevel == 4
			_Frost_HypoState_4.Show()
		endif
	endif
endFunction

function ApplyVisualEffects(int iExposureLevel)
	; Make sure to clear ISM if a vampire, or existing effect if setting toggled off
	if _Frost_Setting_FullScreenEffects.GetValueInt() == 1
		ImageSpaceModifier.RemoveCrossFade(4.0)
		return
	endif

	if iExposureLevel <= 2
		ImageSpaceModifier.RemoveCrossFade(4.0)
	elseif iExposureLevel == 3
		_Frost_ColdISM_Level3.ApplyCrossFade(4.0)
	elseif iExposureLevel == 4
		_Frost_ColdISM_Level4.ApplyCrossFade(4.0)
	endif
endFunction

function ApplySoundEffects(int iExposureLevel)
	if iExposureLevel >= 4 && 							\
		iExposureLevel != last_exposure_level && 		\
		_DE_Setting_SoundEffects.GetValueInt() == 2
		
		if PlayerRef.GetActorBase().GetSex() == 1
			_Frost_Female_FreezingSM.Play(PlayerRef)
		else
			_Frost_Male_FreezingSM.Play(PlayerRef)
		endif
	endif
endFunction

function ApplyForceFeedback(int iExposureLevel)
	if _Frost_Setting_ForceFeedback.GetValueInt() == 2
		if iExposureLevel == 4
			Game.ShakeController(0.7, 0.3, 1.5)
		elseif iExposureLevel == 5
			Game.ShakeController(0.4, 0.6, 2.5)
		endif
	endif
endFunction

function HandleMaxExposure()
	if _Frost_Setting_MaxExposureMode.GetValueInt == 3
		; Kill companions, one by one.
		Actor[] followers = new Actor[3]
		followers[0] = CampUtil.GetTrackedFollower(1)
		followers[1] = CampUtil.GetTrackedFollower(2)
		followers[2] = CampUtil.GetTrackedFollower(3)
		int i = 0
		while i < followers.Length
			if followers[i]
				followers[i].Kill()
				utility.wait(2)
			endif
			i += 1
		endWhile
		; Now, kill the player.			
		_Frost_ExposureDeathMsg.Show()
		wait(3)
		PlayerRef.Kill()

	if _Frost_Setting_MaxExposureMode.GetValueInt() == 2
		RescuePlayer()
	else
		; Do nothing.
	endif
endFunction

bool function PlayerIsInDialogue()
	if FrostUtil.GetCompatibilitySystem().IsSKSELoaded
		if UI.IsMenuOpen("Dialogue Menu")
			return true
		else
			return false
		endif
	else
		return false
	endif
endFunction

function CalculateExposureChange()
	; If enough game time has passed since the last update, modify based on waiting instead.
	float time_delta_game_hours = (GetCurrentGameTime() - last_update_time) * 24.0
	if time_delta_game_hours > 1.0
		ModExposureDueToTime(time_delta_game_hours)
		return
	endif

	float time_delta_seconds = (this_update_time - last_update_time) * 3600.0
	if time_delta_seconds > (update_freq * 2)
		time_delta_seconds = (update_freq * 2)
	endif

	; Calculate exposure reduction
	float exposure_reduction = 1.0 - (((_Frost_AttributeWarmth.GetValueInt() * 90.0) / _Frost_Calc_MaxWarmth.GetValue()) / 100.0)

	; Calculate effective temperature
	
	; Rise (multiplier on Y-axis) over Run (distance from hemeostasis temperature)
	float slope = _Frost_Calc_ExtremeMultiplier.GetValue()/(_Frost_Calc_ExtremeTemp.GetValue() - _Frost_Calc_StasisTemp.GetValue())
    float a_x = GetEffectiveTemperature()
    float a_b = (-slope + _Frost_Calc_StasisMultiplier.GetValue()) * _Frost_Calc_StasisTemp.GetValue()
    
    ; Slope-intercept form solving for Y
    float temp_multiplier = (slope * a_x) + a_b

    ; Master Exposure loss formula
	exposure_change = (((temp_multiplier / 3) * WetFactor) * exposure_reduction) * time_delta_seconds
	
	return exposure_change
endfunction

float function GetEffectiveTemperature()
	; Get the effective temperature, taking the player's Coverage into account.

	float current_temp = _Frost_CurrentTemperature.GetValue()
	float temp_increase = 0
	
	Weather current_weather
	bool transitioning = !(Weather.GetCurrentWeatherTransition() >= 1.0)
	if transitioning
		current_weather = Weather.GetOutgoingWeather()
	else
		current_weather = Weather.GetCurrentWeather()
	endif
	int current_weather_class = GetWeatherClassificationActual(current_weather)

	if IsWeatherSevere(current_weather) && current_weather_class == 3
		temp_increase = ((_Frost_AttributeCoverage.GetValue() * 10.0) / _Frost_Calc_MaxCoverage.GetValue())
	elseif current_weather_class >= 2
		temp_increase = ((_Frost_AttributeCoverage.GetValue() * 5.0) / _Frost_Calc_MaxCoverage.GetValue())
	endif
	float effective_temp = current_temp + temp_increase

	FrostDebug(0, "@@@@ Exposure ::: Current Temp: " + current_temp + ", Effective Temp: " + effective_temp)
	return effective_temp
endFunction

function ModExposureDueToTime(float aiHoursPassed)
    float exposure_limit
    float exposure_limit_if_near_fire

    if player_fast_traveled
        ; The player fast traveled.
        ;@TODO: Also reduce wetness.
        SetExposure(100.0)
        return
    endif

    ; define max values
    if in_interior
        exposure_limit = MIN_EXPOSURE
        exposure_limit_if_near_fire = MIN_EXPOSURE
    elseif current_weather_temp <= -15
        if sheltered
            if shelter_is_warm
                exposure_limit = 25.0
                exposure_limit_if_near_fire = MIN_EXPOSURE
            else
                exposure_limit = 40.0
                exposure_limit_if_near_fire = 25.0
            endif
        else
            exposure_limit = 81.0 ; GetTempExposureCeiling()
            exposure_limit_if_near_fire = 50.0
        endif
    elseif current_weather_temp <= 0
        if sheltered
            if shelter_is_warm
                exposure_limit = 15.0
                exposure_limit_if_near_fire = MIN_EXPOSURE
            else
                exposure_limit = 30.0
                exposure_limit_if_near_fire = 20.0
            endif
        else
            exposure_limit = 60.0
            exposure_limit_if_near_fire = 30.0
        endif
    elseif current_weather_temp < 10
        if sheltered
            if shelter_is_warm
                exposure_limit = MIN_EXPOSURE
                exposure_limit_if_near_fire = MIN_EXPOSURE
            else
                exposure_limit = 15.0
                exposure_limit_if_near_fire = MIN_EXPOSURE
            endif
        else
            exposure_limit = 30.0
            exposure_limit_if_near_fire = MIN_EXPOSURE
        endif
    else
        exposure_limit = MIN_EXPOSURE
        exposure_limit_if_near_fire = MIN_EXPOSURE
    endif

    ; If they waited less than 2 hours, halve the amount modified.
    float time_factor
    if aiHoursPassed < 2
        time_factor = 1
    else
        time_factor = 0.5
    endif

    ; Modify exposure based on temperature
    if in_interior
        DecreaseExposureToLimit((MAJOR_EXPOSURE * time_factor), exposure_limit)
    elseif current_weather_temp <= -15
        if near_fire
            DecreaseExposureToLimit((MAJOR_EXPOSURE * time_factor), exposure_limit_if_near_fire)    
        elseif sheltered
            DecreaseExposureToLimit((MAJOR_EXPOSURE * time_factor), exposure_limit)
        else
            IncreaseExposureToLimit((EXTREME_EXPOSURE * time_factor), exposure_limit)
        endif
    elseif current_weather_temp > -15
        if near_fire
            DecreaseExposureToLimit((EXTREME_EXPOSURE * time_factor), exposure_limit_if_near_fire)
        elseif sheltered
            DecreaseExposureToLimit((MAJOR_EXPOSURE * time_factor), exposure_limit)
        else
            IncreaseExposureToLimit((MAJOR_EXPOSURE * time_factor), exposure_limit)
        endif
    endif
endFunction

function ShowTutorial_Exposure()
	if _DE_Setting_Help.GetValueInt() == 2 && _Frost_HelpDone_ExposurePoints.GetValueInt() == 1
		if !PlayerIsVampire()
			_Frost_Help_ExposurePoints.Show()
			_Frost_HelpDone_ExposurePoints.SetValue(2)
		endif
	endif
endFunction

; dark souls-like lingering heat effect