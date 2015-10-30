Scriptname _Frost_ExposureSystem extends _Frost_BaseSystem

import CampUtil

Actor property PlayerRef auto
GlobalVariable property TimeScale auto
GlobalVariable property _Frost_Setting_ExposureOn auto
GlobalVariable property _Frost_Setting_ExposurePauseDialogue auto
GlobalVariable property _Frost_Setting_ExposurePauseCombat auto
GlobalVariable property _Frost_Setting_MaxExposureMode auto
GlobalVariable property _Frost_WetLevel auto
GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_IsTakingShelter auto
GlobalVariable property _Frost_Calc_ExtremeMultiplier auto
GlobalVariable property _Frost_Calc_StasisMultiplier auto
GlobalVariable property _Frost_Calc_ExtremeTemp auto
GlobalVariable property _Frost_Calc_StasisTemp auto
GlobalVariable property _Frost_Calc_MaxWarmth auto
GlobalVariable property _Frost_Calc_MaxCoverage auto

float property MIN_EXPOSURE = 0.0 autoReadOnly
float property MAX_EXPOSURE = 120.0 autoReadOnly
int property HEAT_FACTOR = 4 autoReadOnly
int property SHELTER_FACTOR = 1 autoReadOnly
int property WARM_SHELTER_BONUS = 1 autoReadOnly

float current_temperature = 10.0
float last_update_time = 0.0
float this_update_time = 0.0
float last_x = 0.0
float last_y = 0.0
float distance_moved = 0.0
WorldSpace this_worldspace = None
WorldSpace last_worldspace = None
bool in_shelter = false
bool shelter_is_warm = false
bool last_vampire_state = false
bool in_interior = false

function StartSystem()
	parent.StartSystem()
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
	RefreshAbleToFastTravel()
	RefreshPlayerStateData()
	UpdateExposure()
	last_update_time = this_update_time
endFunction

function UpdateExposure()
	if _Frost_Setting_ExposurePauseDialogue.GetValueInt() == 2 && PlayerIsInDialogue()
		return
	endif

	if _Frost_Setting_ExposurePauseCombat.GetValueInt() == 2 && PlayerRef.IsInCombat()
		return
	endif

	if this_vampire_state == true && last_vampire_state == false
		; The player just became a vampire. Cure their Frostbite.
	endif

	; If enough game time has passed since the last update, modify based on waiting instead.
	float time_delta_game_hours = (GetCurrentGameTime() - last_update_time) * 24.0
	ExposureValueUpdate(time_delta_game_hours)
	ExposureEffectsUpdate()

	StoreLastPlayerState()
endFunction

function ModAttributeExposure(float amount, float limit)
	; Note: Limit values above 0 will result in the system "pushing up" (increasing) against
	; it once it clamps to the limit.

	float exp_attr = _Frost_AttributeExposure.GetValue()
	if exp_attr == limit
		if limit == MIN_EXPOSURE && amount < 0
			; Already at minimum
			return
		elseif limit > MIN_EXPOSURE && amount > 0
			; Already at maximum
			return
		endif
	endif

	float exposure = exp_attr + amount
	if exposure > limit && amount > 0
		exposure = limit
		if limit < MAX_EXPOSURE && limit > MIN_EXPOSURE
			; Something is preventing the player from getting colder, display message.
		endif
	elseif exposure < limit && amount < 0
		exposure = limit
		if limit < MAX_EXPOSURE && limit > MIN_EXPOSURE
			; Something is preventing the player from getting warmer, display message.
		endif
	endif
	_Frost_AttributeExposure.SetValue(exposure)
	FrostDebug(1, "@@@@ Exposure ::: Current Exposure: " + exposure + " (" + amount + ")")
endFunction


function RefreshPlayerStateData()
	current_temperature = GetEffectiveTemperature()
	in_shelter = GetInShelter()
	shelter_is_warm = IsCurrentTentWarm()
	this_worldspace = PlayerRef.GetWorldSpace()
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
endFunction

function StoreLastPlayerState()
	; Store the player's last known position and vampire state.
	last_worldspace = this_worldspace
	last_interior_state = in_interior
	last_x = player_x
	last_y = player_y
	last_vampire_state = this_vampire_state
endFunction

;/function WaitStateUpdate()
	;@TODO: Drive this with a reference alias instead, add all vanilla bed rolls + _Camp_TentLayDownMarker to _Frost_SleepObjects
	; and condition against _Frost_Setting_NoWaitingOutdoors and _Camp_ConditionValues.IsPlayerInInterior

	;@TODO: Provide FrostUtil.PlayerAbleToWait()
endFunction
/;

;@TODO: Possibly wrap in FrostUtil IsAbleToFastTravel() or similar
;@TODO: Check fast travel exceptions too, like black book
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
	ModAttributeExposure(-MAX_EXPOSURE, MIN_EXPOSURE)
    ExposureEffectsUpdate()
    _Frost_WetnessSystem wet = GetWetnessSystem()
    wet.ModAttributeWetness(-wet.MAX_WETNESS, wet.MIN_WETNESS)
    wet.UpdateWetLevel()
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

function GetExposureChange()
	
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

float function GetWetFactor()
	wet_level = _Frost_WetLevel.GetValueInt()
	if wet_level == 0
		return 1.0
	elseif wet_level == 1
		return 1.3
	elseif wet_level == 2
		return 1.6
	elseif wet_level == 3
		return 2.0
	endif
endFunction

function ExposureValueUpdate(float afHoursPassed)
	bool near_heat = false
	int heat_amount = 0
	int current_heat_size = 0

	current_heat_size = _Frost_CurrentHeatSourceSize.GetValueInt()
	if current_heat_size > 0
		near_heat = true
		heat_amount = HEAT_FACTOR * _Frost_CurrentHeatSourceSize.GetValueInt()
	else
		if in_shelter || in_interior
			if shelter_is_warm
				heat_amount = SHELTER_FACTOR + WARM_SHELTER_BONUS
			else
				heat_amount = SHELTER_FACTOR
			endif
		endif
	endif

	FrostDebug(0, "@@@@ Exposure ::: near_heat: " + near_heat + ", in_interior: " + in_interior + ", in_shelter: " + in_shelter + ", shelter_is_warm: " + shelter_is_warm)

	if in_interior
		GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
	else
		if current_temperature <= -15
			if near_heat
				if in_shelter
					if shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					elseif !shelter_is_warm
						GetWarmer(heat_amount, 25.0, afHoursPassed)
					endif
				elseif !in_shelter
					GetWarmer(heat_amount, 50.0, afHoursPassed)
				endif
			elseif !near_heat
				if in_shelter
					if shelter_is_warm
						GetWarmer(heat_amount, 25.0, afHoursPassed)
					elseif !shelter_is_warm
						GetWarmer(heat_amount, 40.0, afHoursPassed)
					endif
				elseif !in_shelter
					GetColder(heat_amount, 81.0)
				endif
			endif
	
		elseif current_temperature <= 0
			if near_heat
				if in_shelter
					if shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					elseif !shelter_is_warm
						GetWarmer(heat_amount, 15.0, afHoursPassed)
					endif
				elseif !in_shelter
					GetWarmer(heat_amount, 30.0, afHoursPassed)
				endif
			elseif !near_heat
				if in_shelter
					if shelter_is_warm
						GetWarmer(heat_amount, 15.0, afHoursPassed)
					elseif !shelter_is_warm
						GetWarmer(heat_amount, 30.0, afHoursPassed)
					endif
				elseif !in_shelter
					GetColder(heat_amount, 60.0)
				endif
			endif
	
		elseif current_temperature < 10
			if near_heat
				if in_shelter
					if shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					elseif !shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					endif
				elseif !in_shelter
					GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
				endif
			elseif !near_heat
				if in_shelter
					if shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					elseif !shelter_is_warm
						GetWarmer(heat_amount, 15.0, afHoursPassed)
					endif
				elseif !in_shelter
					GetColder(heat_amount, 30.0)
				endif
			endif
	
		elseif current_temperature >= 10
			if near_heat
				if in_shelter
					if shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					elseif !shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					endif
				elseif !in_shelter
					GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
				endif
			elseif !near_heat
				if in_shelter
					if shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					elseif !shelter_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, afHoursPassed)
					endif
				elseif !in_shelter
					GetColder(heat_amount, MIN_EXPOSURE)
				endif
			endif
		endif
	endif
endFunction

bool function GetInShelter()
	if GetCurrentTent()
		return true
	elseif _Frost_IsTakingShelter.GetValueInt() == 2
		return true
	else
		return false
	endif
endFunction

function GetWarmer(int heat_amount, float limit, float game_hours_passed)
	if game_hours_passed >= 1.0
		float update_freq = UpdateFrequencyGlobal.GetValue()
		float ticks = (((game_hours_passed * 3600.0) / TimeScale.GetValue()) / update_freq)
		ModAttributeExposure((-heat_amount * ticks, limit)
	else
		ModAttributeExposure(-heat_amount, limit)
	endif
endFunction

function GetColder(int heat_amount, float limit, float game_hours_passed)
	if _Frost_AttributeExposure.GetValue() > limit
		FrostDebug(1, "@@@@ Exposure ::: Exposure greater than limit, warming up.")
		GetWarmer(heat_amount, limit, game_hours_passed)
	else
		float update_freq = UpdateFrequencyGlobal.GetValue()
		float time_delta_seconds = (this_update_time - last_update_time) * 3600.0
		if time_delta_seconds > (update_freq * 2)
			time_delta_seconds = (update_freq * 2)
		endif

		; Reduce the player's exposure rate by up to 90%.
		float exposure_reduction = 1.0 - (((_Frost_AttributeWarmth.GetValueInt() * 90.0) / _Frost_Calc_MaxWarmth.GetValue()) / 100.0)
	
		; Rise (multiplier on Y-axis) over Run (distance from hemeostasis temperature)
		float slope = _Frost_Calc_ExtremeMultiplier.GetValue()/(_Frost_Calc_ExtremeTemp.GetValue() - _Frost_Calc_StasisTemp.GetValue())
    	float a_x = current_temperature
    	float a_b = (-slope + _Frost_Calc_StasisMultiplier.GetValue()) * _Frost_Calc_StasisTemp.GetValue()
    
    	; Slope-intercept form solving for Y
    	float temp_multiplier = (slope * a_x) + a_b
    	float wet_factor = GetWetFactor()

    	; Master Exposure loss formula
		amount = (((temp_multiplier / 3) * wet_factor) * exposure_reduction) * time_delta_seconds

		if game_hours_passed >= 1.0
			float ticks = (((game_hours_passed * 3600.0) / TimeScale.GetValue()) / update_freq)
			ModAttributeExposure((amount * ticks, limit)
		else
			ModAttributeExposure(amount, limit)
		endif
	endif
endFunction

function ShowTutorial_Exposure()
	;/if _DE_Setting_Help.GetValueInt() == 2 && _Frost_HelpDone_ExposurePoints.GetValueInt() == 1
		if !PlayerIsVampire()
			_Frost_Help_ExposurePoints.Show()
			_Frost_HelpDone_ExposurePoints.SetValue(2)
		endif
	endif
	/;
endFunction

; dark souls-like lingering heat effect