Scriptname _Frost_ExposureSystem extends _Frost_BaseSystem

import Math
import CampUtil
import FrostUtil
import _FrostInternal

Quest property _Frost_MainQuest auto
Actor property PlayerRef auto
GlobalVariable property TimeScale auto
GlobalVariable property _Frost_Setting_ExposureRate auto
GlobalVariable property _Frost_Setting_ExposureOn auto
GlobalVariable property _Frost_Setting_ExposurePauseDialogue auto
GlobalVariable property _Frost_Setting_ExposurePauseCombat auto
GlobalVariable property _Frost_Setting_MaxExposureMode auto
GlobalVariable property _Frost_Setting_NoFastTravel auto
GlobalVariable property _Frost_Setting_ConditionMessages auto
GlobalVariable property _Frost_Setting_FullScreenEffects auto
GlobalVariable property _Frost_Setting_SoundEffects auto
GlobalVariable property _Frost_Setting_ForceFeedback auto
GlobalVariable property _Frost_WetLevel auto
GlobalVariable property _Frost_ExposureLevel auto
GlobalVariable property _Frost_CurrentTemperature auto
GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_AttributeCoverage auto
GlobalVariable property _Frost_AttributeExposure auto
GlobalVariable property _Frost_CurrentHeatSourceSize auto
GlobalVariable property _Frost_Calc_ExtremeMultiplier auto
GlobalVariable property _Frost_Calc_StasisMultiplier auto
GlobalVariable property _Frost_Calc_ExtremeTemp auto
GlobalVariable property _Frost_Calc_StasisTemp auto
GlobalVariable property _Frost_Calc_MaxWarmth auto
GlobalVariable property _Frost_Calc_MaxCoverage auto
GlobalVariable property _Frost_FrostbiteChance auto
GlobalVariable property _Frost_PerkRank_InnerFire auto
GlobalVariable property EndurancePerkPointsEarned auto
GlobalVariable property EndurancePerkPointsTotal auto
GlobalVariable property EndurancePerkPointProgress auto
GlobalVariable property EndurancePerkPoints auto
Message property _Frost_HypoState_5 auto
Message property _Frost_HypoState_4 auto
Message property _Frost_HypoState_3 auto
Message property _Frost_HypoState_2 auto
Message property _Frost_HypoState_1 auto
Message property _Frost_HypoState_0 auto
Message property _Frost_HypoState_0_Min auto
Message property _Frost_ExposureDeathMsg auto
Message property _Frost_PerkAdvancement auto
Message property _Frost_PerkEarned auto
Message property _Frost_WarmUpMessage auto
Message property _Frost_ExposureCap_FaintHeat auto
Message property _Frost_ExposureCap_ColdShelter auto
Message property _Frost_ExposureCap_Warm auto
Message property _Frost_FrostbiteMessage_Body auto
Message property _Frost_FrostbiteMessage_Head auto
Message property _Frost_FrostbiteMessage_Hands auto
Message property _Frost_FrostbiteMessage_Feet auto
MiscObject property _Frost_DummyItem auto
ImageSpaceModifier property _Frost_ColdISM_Level5 auto
ImageSpaceModifier property _Frost_ColdISM_Level4 auto
ImageSpaceModifier property _Frost_ColdISM_Level3 auto
Sound property _Frost_Female_FreezingSM auto
Sound property _Frost_Female_FreezingToDeathSM auto
Sound property _Frost_Male_FreezingSM auto
Sound property _Frost_Male_FreezingToDeathSM auto
Spell property _Frost_InnerFireSpell auto
Potion property _Frost_FrostbittenPotionBody auto
Potion property _Frost_FrostbittenPotionHead auto
Potion property _Frost_FrostbittenPotionHands auto
Potion property _Frost_FrostbittenPotionFeet auto
Keyword property _Frost_FrostbiteBodyKW auto
Keyword property _Frost_FrostbiteHeadKW auto
Keyword property _Frost_FrostbiteHandsKW auto
Keyword property _Frost_FrostbiteFeetKW auto

FormList property _Frost_WorldspacesExteriorOblivion auto

float property MIN_EXPOSURE = 0.0 autoReadOnly
float property MAX_EXPOSURE = 120.0 autoReadOnly
int property HEAT_FACTOR = 5 autoReadOnly
int property TENT_FACTOR = 1 autoReadOnly
int property WARM_TENT_BONUS = 1 autoReadOnly
float property EXPOSURE_LEVEL_5 = 100.0 autoReadOnly
float property EXPOSURE_LEVEL_4 = 80.0 autoReadOnly
float property EXPOSURE_LEVEL_3 = 60.0 autoReadOnly
float property EXPOSURE_LEVEL_2 = 40.0 autoReadOnly
float property EXPOSURE_LEVEL_1 = 20.0 autoReadOnly

float current_temperature = 10.0
float last_update_time = 0.0
float this_update_time = 0.0
float  this_update_game_time = 0.0
float last_update_game_time = 0.0
float player_x = 0.0
float player_y = 0.0
float last_x = 0.0
float last_y = 0.0
float distance_moved = 0.0
int exposure_level = 0
int last_exposure_level = 0
int warm_message_debounce = 0
bool totalwarm_message_debounce = false
WorldSpace this_worldspace = None
WorldSpace last_worldspace = None
Weather current_weather = None
bool in_tent = false
bool tent_is_warm = false
bool in_shelter = false
bool is_meditating = false
bool is_vampire = false
bool last_vampire_state = false
bool in_interior = false
bool was_in_interior = false
bool near_heat = false
bool was_near_heat = false
bool can_display_limit_msg = true

function RegisterForEvents()
	RegisterForModEvent("Frost_OnInnerFireMeditate", "OnInnerFireMeditate")
	RegisterForModEvent("Campfire_CampfirePerkPurchased", "CampfirePerkPurchased")
endFunction

function Update()
	if last_update_time == 0.0
		; Skip the first update
		last_update_time = Game.GetRealHoursPassed()
		last_update_game_time = Utility.GetCurrentGameTime()
		return
	endif

	this_update_time = Game.GetRealHoursPassed()
	this_update_game_time = Utility.GetCurrentGameTime()
	RefreshAbleToFastTravel()
	RefreshPlayerStateData()
	UpdateExposure()

	if warm_message_debounce > 0
		warm_message_debounce -= 1
	endif

	last_update_time = this_update_time
	last_update_game_time = this_update_game_time
endFunction

function UpdateExposure()
	if _Frost_Setting_ExposurePauseDialogue.GetValueInt() == 2 && PlayerIsInDialogue()
		return
	endif

	if _Frost_Setting_ExposurePauseCombat.GetValueInt() == 2 && PlayerRef.IsInCombat()
		return
	endif

	if is_vampire == true && last_vampire_state == false
		; The player just became a vampire. Cure their Frostbite.
	endif

	; If enough game time has passed since the last update, modify based on waiting instead.
	float time_delta_game_hours = (Utility.GetCurrentGameTime() - last_update_game_time) * 24.0
	ExposureValueUpdate(time_delta_game_hours)
	ExposureEffectsUpdate()

	StoreLastPlayerState()
endFunction

function ModAttributeExposure(float amount, float limit, bool allow_skill_advancement = true)
	; Note: Limit values above 0 will result in the system "pushing up" (increasing) against
	; it once it clamps to the limit.

	float exp_attr = _Frost_AttributeExposure.GetValue()
	if exp_attr == limit
		if limit == MIN_EXPOSURE && amount < 0
			; Already at minimum
			SendEvent_UpdateExposureMeter()
			return
		elseif limit > MIN_EXPOSURE && amount > 0
			; Already at maximum
			SendEvent_UpdateExposureMeter()
			return
		endif
	endif

	bool advance_skill = false
	float exposure = exp_attr + amount
	bool increasing = amount > 0

	if increasing
		advance_skill = true
	endif

	if is_meditating
		advance_skill = false
	endif

	bool limit_condition_triggered = false
	if exposure > limit && increasing
		if exp_attr <= limit
			; This update would push us above the limit, cap at the limit
			exposure = limit
			advance_skill = false
			if limit < MAX_EXPOSURE && limit > MIN_EXPOSURE
				; Something is preventing the player from getting colder, display message.
				if can_display_limit_msg
					if in_tent || in_shelter
						_Frost_ExposureCap_ColdShelter.Show()
					endif
					can_display_limit_msg = false
				endif
				limit_condition_triggered = true
			endif
		else
			; We're increasing and already above the limit, do nothing
			SendEvent_UpdateExposureMeter()
			return
		endif
	elseif exposure < limit && !increasing
		if exp_attr >= limit
			; This update would push us below the limit, cap at the limit
			exposure = limit
			advance_skill = false
			if limit < MAX_EXPOSURE && limit > MIN_EXPOSURE
				; Something is preventing the player from getting warmer, display message.
				if !in_interior && (near_heat || in_tent || is_meditating) && can_display_limit_msg
					_Frost_ExposureCap_Warm.Show()
					can_display_limit_msg = false
				endif
				limit_condition_triggered = true
			endif
		else
			; We're decreasing and already below the limit
			SendEvent_UpdateExposureMeter()
			return
		endif
	endif

	DisplayWarmUpMessage(increasing, limit)

	_Frost_AttributeExposure.SetValue(exposure)
	FrostDebug(1, "@@@@ Exposure ::: Current Exposure: " + exposure + " (" + amount + ")")

	if advance_skill && allow_skill_advancement
		AdvanceEnduranceSkill()
	endif

	if limit_condition_triggered == false
		can_display_limit_msg = true
	endif

	SendEvent_UpdateExposureMeter()
endFunction

function RefreshPlayerStateData()
	current_temperature = GetEffectiveTemperature()
	if GetCurrentTent() && CurrentTentHasShelter()
		in_tent	= true
	else
		in_tent = false
	endif
	tent_is_warm = IsCurrentTentWarm()
	in_shelter = IsPlayerTakingShelter()
	this_worldspace = PlayerRef.GetWorldSpace()
	player_x = PlayerRef.GetPositionX()
	player_y = PlayerRef.GetPositionY()
	in_interior = CampUtil.IsRefInInterior(PlayerRef)
	distance_moved = GetDistanceMoved()
	
	bool fast_travelled = GetFastTravelled(distance_moved)
	if fast_travelled
		SetAfterFastTravelCondition()
	endif
endFunction

function StoreLastPlayerState()
	last_worldspace = this_worldspace
	was_in_interior = in_interior
	was_near_heat = near_heat
	last_x = player_x
	last_y = player_y
	last_vampire_state = is_vampire
	last_exposure_level = exposure_level
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

	if FrostUtil.GetCompatibilitySystem().isDLC2Loaded
		WorldSpace my_ws = PlayerRef.GetWorldspace()
		if _Frost_WorldspacesExteriorOblivion.HasForm(my_ws)
			Game.EnableFastTravel()
			return
		endif
	endif
	; Is the player riding a dragon?
	if (_Frost_MainQuest as _Frost_ConditionValues).IsRidingFlyingMount
		Game.EnableFastTravel()
		return
	endif

	if _Frost_Setting_NoFastTravel.GetValueInt() == 2
		Game.EnableFastTravel(false)
	else
		Game.EnableFastTravel()
	endif
endFunction

float function GetDistanceMoved()
	return abs(sqrt(pow((player_x - last_x), 2) + pow((player_y - last_y), 2)))
endFunction

bool function GetFastTravelled(float afDistance)
	if this_worldspace == last_worldspace && afDistance > 30000.0
		if !FrostUtil.IsNearFastTravelException()
			if was_in_interior == in_interior
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
	ModAttributeExposure(-MAX_EXPOSURE, EXPOSURE_LEVEL_1 + 1)
    ExposureEffectsUpdate()
    _Frost_WetnessSystem wet = GetWetnessSystem()
    wet.ModAttributeWetness(-wet.MAX_WETNESS, wet.MIN_WETNESS)
    wet.UpdateWetLevel()
endFunction

function ExposureEffectsUpdate()
	float current_exposure = _Frost_AttributeExposure.GetValue()
	UpdateExposureLevel()
	
	if exposure_level == 6
		HandleMaxExposure()
	endif

	if exposure_level >= 4
		GetFrostbite()
	endif

	; Add and remove the dummy item to force the player's movement speed to update.
	if last_exposure_level != exposure_level
		PlayerRef.AddItem(_Frost_DummyItem, 1, true)
		PlayerRef.RemoveItem(_Frost_DummyItem, 1, true)
	endif

	ApplyVisualEffects()
	ApplySoundEffects()
	ApplyForceFeedback()
endFunction

function UpdateExposureLevel()
	float current_exposure = _Frost_AttributeExposure.GetValue()
	if current_exposure >= MAX_EXPOSURE
		exposure_level = 6
	elseif current_exposure >= EXPOSURE_LEVEL_5
		exposure_level = 5
	elseif current_exposure >= EXPOSURE_LEVEL_4
		exposure_level = 4
	elseif current_exposure >= EXPOSURE_LEVEL_3
		exposure_level = 3
	elseif current_exposure >= EXPOSURE_LEVEL_2
		exposure_level = 2
	elseif current_exposure >= EXPOSURE_LEVEL_1
		exposure_level = 1
	elseif current_exposure > MIN_EXPOSURE
		exposure_level = 0
	elseif current_exposure == MIN_EXPOSURE
		exposure_level = -1
	endif
	if exposure_level > 0
		totalwarm_message_debounce = false
	endif
	ShowExposureStateMessage()

	_Frost_ExposureLevel.SetValueInt(exposure_level)
endFunction

function ShowExposureStateMessage()
	if _Frost_Setting_ConditionMessages.GetValueInt() == 2
		bool increasing = exposure_level > last_exposure_level
		if increasing && exposure_level == 5 && last_exposure_level != 5
			_Frost_HypoState_5.Show()
		elseif increasing && exposure_level == 4 && last_exposure_level != 4
			_Frost_HypoState_4.Show()
		elseif increasing && exposure_level == 3 && last_exposure_level != 3
			_Frost_HypoState_3.Show()
		elseif increasing && exposure_level == 2 && last_exposure_level != 2
			_Frost_HypoState_2.Show()
			ShowTutorial_Exposure()
		elseif increasing && exposure_level == 1 && last_exposure_level != 1
			_Frost_HypoState_1.Show()
		elseif increasing && exposure_level == 0 && last_exposure_level != 0 && last_exposure_level != -1
			_Frost_HypoState_0.Show()
		elseif exposure_level == -1 && last_exposure_level != -1 && !totalwarm_message_debounce
			_Frost_HypoState_0_Min.Show()
			totalwarm_message_debounce = true
		endif
	endif
endFunction

function ApplyVisualEffects()
	; Make sure to clear ISM if a vampire, or existing effect if setting toggled off
	if _Frost_Setting_FullScreenEffects.GetValueInt() == 1
		ImageSpaceModifier.RemoveCrossFade(4.0)
		return
	endif

	if exposure_level <= 2
		ImageSpaceModifier.RemoveCrossFade(4.0)
	elseif exposure_level == 3
		_Frost_ColdISM_Level3.ApplyCrossFade(4.0)
	elseif exposure_level == 4
		_Frost_ColdISM_Level4.ApplyCrossFade(4.0)
	elseif exposure_level == 5
		_Frost_ColdISM_Level5.ApplyCrossFade(4.0)
	endif
endFunction

function ApplySoundEffects()
	if _Frost_Setting_SoundEffects.GetValueInt() == 2
		bool gender = PlayerRef.GetActorBase().GetSex() == 1
 		bool increasing = exposure_level > last_exposure_level
		if increasing && exposure_level == 4 && last_exposure_level != 4
			if gender == 1
				_Frost_Female_FreezingSM.Play(PlayerRef)
			else
				_Frost_Male_FreezingSM.Play(PlayerRef)
			endif
		elseif increasing && exposure_level == 5 && last_exposure_level != 5
			if gender == 1
				_Frost_Female_FreezingToDeathSM.Play(PlayerRef)
			else
				_Frost_Male_FreezingToDeathSM.Play(PlayerRef)
			endif
		endif
	endif
endFunction

function ApplyForceFeedback()
	if _Frost_Setting_ForceFeedback.GetValueInt() == 2
		bool increasing = exposure_level > last_exposure_level
		if increasing && exposure_level == 4 && last_exposure_level != 4
			Game.ShakeController(0.7, 0.3, 1.5)
		elseif increasing && exposure_level == 5 && last_exposure_level != 5
			Game.ShakeController(0.4, 0.6, 2.5)
		endif
	endif
endFunction

function HandleMaxExposure()
	if _Frost_Setting_MaxExposureMode.GetValueInt() == 3
		; Kill companions, one by one.
		Actor[] followers = new Actor[3]
		followers[0] = CampUtil.GetTrackedFollower(1)
		followers[1] = CampUtil.GetTrackedFollower(2)
		followers[2] = CampUtil.GetTrackedFollower(3)
		int i = 0
		while i < followers.Length
			if followers[i]
				followers[i].Kill()
				Utility.Wait(2)
			endif
			i += 1
		endWhile
		; Now, kill the player.			
		_Frost_ExposureDeathMsg.Show()
		Utility.Wait(3)
		PlayerRef.Kill()

	elseif _Frost_Setting_MaxExposureMode.GetValueInt() == 2
		SendEvent_OnRescuePlayer(PlayerRef.IsSwimming())
	else
		; Do nothing.
	endif
endFunction

bool function PlayerIsInDialogue()
	if UI.IsMenuOpen("Dialogue Menu")
		return true
	else
		return false
	endif
endFunction

float function GetEffectiveTemperature()
	; Get the effective temperature, taking the player's Coverage into account.

	float current_temp = _Frost_CurrentTemperature.GetValue()
	float temp_increase = 0
	
	current_weather = GetCurrentWeatherActual()
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
	int wet_level = _Frost_WetLevel.GetValueInt()
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

function ExposureValueUpdate(float game_hours_passed)
	int heat_amount = 0
	int current_heat_size = 0

	current_heat_size = _Frost_CurrentHeatSourceSize.GetValueInt()
	if current_heat_size > 0
		near_heat = true
		heat_amount = HEAT_FACTOR * _Frost_CurrentHeatSourceSize.GetValueInt()
	else
		near_heat = false
		if in_tent || in_interior
			if tent_is_warm
				heat_amount = TENT_FACTOR + WARM_TENT_BONUS
			else
				heat_amount = TENT_FACTOR
			endif
		elseif is_meditating
			heat_amount = 3
		endif
	endif

	FrostDebug(0, "@@@@ Exposure ::: near_heat: " + near_heat + ", in_interior: " + in_interior + ", in_tent: " + in_tent + ", tent_is_warm: " + tent_is_warm)

	if in_interior
		if near_heat
			GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
		else
			GetWarmer(heat_amount, EXPOSURE_LEVEL_1, game_hours_passed)
		endif
	elseif is_meditating
		GetWarmer(heat_amount, EXPOSURE_LEVEL_4, game_hours_passed)
	else
		if current_temperature <= -15
			if near_heat
				if in_tent
					if tent_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
					elseif !tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_2, game_hours_passed)
					endif
				elseif in_shelter
					GetWarmer(heat_amount, EXPOSURE_LEVEL_2, game_hours_passed)
				else
					GetWarmer(heat_amount, EXPOSURE_LEVEL_3, game_hours_passed)
				endif
			elseif !near_heat
				if in_tent
					if tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_2, game_hours_passed)
					elseif !tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_3, game_hours_passed)
					endif
				elseif !in_tent
					GetColder(heat_amount, EXPOSURE_LEVEL_5, game_hours_passed)
				endif
			endif
	
		elseif current_temperature <= 0
			if near_heat
				if in_tent
					if tent_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
					elseif !tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_1, game_hours_passed)
					endif
				elseif in_shelter
					GetWarmer(heat_amount, EXPOSURE_LEVEL_1, game_hours_passed)
				else
					GetWarmer(heat_amount, EXPOSURE_LEVEL_2, game_hours_passed)
				endif
			elseif !near_heat
				if in_tent
					if tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_1, game_hours_passed)
					elseif !tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_2, game_hours_passed)
					endif
				elseif !in_tent
					GetColder(heat_amount, EXPOSURE_LEVEL_4, game_hours_passed)
				endif
			endif
	
		elseif current_temperature < 10
			if near_heat
				if in_tent
					if tent_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
					elseif !tent_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
					endif
				elseif in_shelter
					GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
				else
					GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
				endif
			elseif !near_heat
				if in_tent
					if tent_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
					elseif !tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_1, game_hours_passed)
					endif
				elseif !in_tent
					GetColder(heat_amount, EXPOSURE_LEVEL_2, game_hours_passed)
				endif
			endif
	
		elseif current_temperature >= 10
			if near_heat
				if in_tent
					if tent_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
					elseif !tent_is_warm
						GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
					endif
				elseif in_shelter
					GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
				else
					GetWarmer(heat_amount, MIN_EXPOSURE, game_hours_passed)
				endif
			elseif !near_heat
				if in_tent
					if tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_1, game_hours_passed)
					elseif !tent_is_warm
						GetWarmer(heat_amount, EXPOSURE_LEVEL_1, game_hours_passed)
					endif
				elseif !in_tent
					GetWarmer(heat_amount, EXPOSURE_LEVEL_1, game_hours_passed)
				endif
			endif
		endif
	endif
endFunction

function GetWarmer(int heat_amount, float limit, float game_hours_passed)
	if _Frost_AttributeExposure.GetValue() < limit
		FrostDebug(1, "@@@@ Exposure ::: Exposure less than limit, getting colder.")
		GetColder(heat_amount, limit, game_hours_passed)
	else
		FrostDebug(1, "@@@@ Exposure ::: GetWarmer : Limit " + Math.Ceiling(limit) + " : GameHoursPassed " + game_hours_passed)
		if game_hours_passed >= 1.0
			float duration_amount = 15.0 * game_hours_passed
			ModAttributeExposure(-duration_amount, limit, allow_skill_advancement=false)
		else
			ModAttributeExposure(-heat_amount, limit)
		endif
	endif
endFunction

function GetColder(int heat_amount, float limit, float game_hours_passed)
	FrostDebug(1, "@@@@ Exposure ::: GetColder : Limit " + Math.Ceiling(limit) + " : GameHoursPassed " + game_hours_passed)
	float update_freq = UpdateFrequencyGlobal.GetValue()
	float time_delta_seconds = (this_update_time - last_update_time) * 3600.0
	if time_delta_seconds > (update_freq * 2)
		time_delta_seconds = (update_freq * 2)
	endif
	
	; Reduce the player's exposurke rate by up to 90%.
	float exposure_reduction = 1.0 - (((_Frost_AttributeWarmth.GetValueInt() * 90.0) / _Frost_Calc_MaxWarmth.GetValue()) / 100.0)	
	; Rise (multiplier on Y-axis) over Run (distance from hemeostasis temperature)
	float slope = _Frost_Calc_ExtremeMultiplier.GetValue()/(_Frost_Calc_ExtremeTemp.GetValue() - _Frost_Calc_StasisTemp.GetValue())
    float a_x = current_temperature
    float a_b = (-slope + _Frost_Calc_StasisMultiplier.GetValue()) * _Frost_Calc_StasisTemp.GetValue()    
    ; Slope-intercept form solving for Y
    float temp_multiplier = (slope * a_x) + a_b
    float wet_factor = GetWetFactor()
    
    ; Master Exposure loss formula
	float amount = ((((temp_multiplier / 3) * wet_factor) * exposure_reduction) * time_delta_seconds) * _Frost_Setting_ExposureRate.GetValue()
	FrostDebug(0, "@@@@ Exposure ::: Calc Values - temp_multiplier " + temp_multiplier + " wet_factor " + wet_factor + " exposure_reduction " + exposure_reduction + " time_delta_seconds " + time_delta_seconds + " _Frost_Setting_ExposureRate " + _Frost_Setting_ExposureRate.GetValue())

	if game_hours_passed >= 1.0
		float duration_amount = (limit / 4) * game_hours_passed
		ModAttributeExposure(duration_amount, limit, allow_skill_advancement=false)
	elseif in_tent
		ModAttributeExposure(amount, limit)
	else
		ModAttributeExposure(amount, MAX_EXPOSURE)
	endif
endFunction

function GetFrostbite(bool force_frostbite = false)
	if IsPlayerVampire()
		return
	endif
	_Frost_ClothingSystem clothing = GetClothingSystem()
	bool wearing_body = clothing.body_warmth
	bool wearing_head = clothing.head_warmth
	bool wearing_hands = clothing.hands_warmth
	bool wearing_feet = clothing.feet_warmth
	float frostbite_chance 
	if force_frostbite
		frostbite_chance = 0.5
	else
		frostbite_chance = _Frost_FrostbiteChance.GetValue()
	endif

	if (!wearing_body || force_frostbite) && !PlayerRef.HasEffectKeyword(_Frost_FrostbiteBodyKW)
		if Utility.RandomFloat() <= frostbite_chance
			PlayerRef.EquipItem(_Frost_FrostbittenPotionBody, abSilent = true)
			_Frost_FrostbiteMessage_Body.Show()
		endif
	endif
	if (!wearing_head || force_frostbite) && !PlayerRef.HasEffectKeyword(_Frost_FrostbiteHeadKW)
		if Utility.RandomFloat() <= frostbite_chance
			PlayerRef.EquipItem(_Frost_FrostbittenPotionHead, abSilent = true)
			_Frost_FrostbiteMessage_Head.Show()
		endif
	endif
	if (!wearing_hands || force_frostbite) && !PlayerRef.HasEffectKeyword(_Frost_FrostbiteHandsKW)
		if Utility.RandomFloat() <= frostbite_chance
			PlayerRef.EquipItem(_Frost_FrostbittenPotionHands, abSilent = true)
			_Frost_FrostbiteMessage_Hands.Show()
		endif
	endif
	if (!wearing_feet || force_frostbite) && !PlayerRef.HasEffectKeyword(_Frost_FrostbiteFeetKW)
		if Utility.RandomFloat() <= frostbite_chance
			PlayerRef.EquipItem(_Frost_FrostbittenPotionFeet, abSilent = true)
			_Frost_FrostbiteMessage_Feet.Show()
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

function DisplayWarmUpMessage(bool exposure_increasing, float limit)
	if !exposure_increasing && !was_near_heat && near_heat && exposure_level > 0 && warm_message_debounce == 0
		if (!in_tent && !in_shelter) && limit > 0.0
			_Frost_ExposureCap_FaintHeat.Show()
			warm_message_debounce = 3
		else
			_Frost_WarmUpMessage.Show()
			warm_message_debounce = 3
		endif
	endif
endFunction

; Endurance Skill
function AdvanceEnduranceSkill()
    if EndurancePerkPointsEarned.GetValueInt() < EndurancePerkPointsTotal.GetValueInt()
    	if in_interior || GetCurrentTent() || _Frost_CurrentHeatSourceSize.GetValueInt() > 0
    		return
    	endif
    	if (current_temperature <= 0) || (current_temperature < 10 && GetWeatherClassificationActual(current_weather) >= 2)
    		; continue
    	else
    		return
    	endif

        int next_level = EndurancePerkPointsEarned.GetValueInt() + 1

        ; 40, 80, 120, 160...
        float ticks_required = 40 * next_level

        float new_progress = (1.0 / ticks_required)
        float current_progress = EndurancePerkPointProgress.GetValue()
        float total_progress = current_progress + new_progress
        EndurancePerkPointProgress.SetValue(total_progress)

        if (EndurancePerkPointProgress.GetValue() + 0.01) >= 1.0
            FrostDebug(1, "Granting an Endurance perk point.")
            ; Grant perk point
            _Frost_PerkEarned.Show()
            EndurancePerkPointsEarned.SetValueInt(EndurancePerkPointsEarned.GetValueInt() + 1)
            EndurancePerkPoints.SetValueInt(EndurancePerkPoints.GetValueInt() + 1)

            if EndurancePerkPointsEarned.GetValueInt() >= EndurancePerkPointsTotal.GetValueInt()
                EndurancePerkPointProgress.SetValue(1.0)
            else
                EndurancePerkPointProgress.SetValue(0.0)
            endif
        else
        	if current_progress < 0.50 && total_progress >= 0.50
            	FrostDebug(1, "Endurance perk progress value: " + EndurancePerkPointProgress.GetValue())
            	_Frost_PerkAdvancement.Show()
            endif
        endif
    endif
endFunction

function ModExposure(float amount, float limit = -1.0)
	if limit == -1.0
		if amount <= 0
			limit = MIN_EXPOSURE
		else
			limit = MAX_EXPOSURE
		endif
	endif
	ModAttributeExposure(amount, limit, false)
	ExposureEffectsUpdate()
endFunction

function SetExposure(float value, bool force_meter_display = false)
	_Frost_AttributeExposure.SetValue(value)
	if force_meter_display
		SendEvent_ForceExposureMeterDisplay()
	else
		SendEvent_UpdateExposureMeter()
	endif
	ExposureEffectsUpdate()
endFunction

Event OnInnerFireMeditate(bool abMeditating)
	if abMeditating
		is_meditating = true
	else
		is_meditating = false
	endif
endEvent

Event CampfirePerkPurchased()
	if _Frost_PerkRank_InnerFire.GetValueInt() > 0
		PlayerRef.AddSpell(_Frost_InnerFireSpell)
	endif
endEvent

function SendEvent_ForceExposureMeterDisplay(bool flash = false)
	int handle = ModEvent.Create("Frost_ForceExposureMeterDisplay")
	if handle
		ModEvent.PushBool(handle, flash)
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_UpdateExposureMeter()
	int handle = ModEvent.Create("Frost_UpdateExposureMeter")
	if handle
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_OnRescuePlayer(bool in_water)
	int handle = ModEvent.Create("Frost_OnRescuePlayer")
	if handle
		ModEvent.PushBool(handle, in_water)
		ModEvent.Send(handle)
	endif
endFunction

;@TODO: Am I adding apocrypha / etc to oblivion worldspaces?
;@TODO: Exception gear
;@TODO: Implement Settings Profiles
;@TODO: Implement all armor compatibility
;@TODO: Reimplement tutorials
;@TODO: Conditionalize Weathersense acquire on hotkey
;@TODO: Hook up SkyUI MCM
;@TODO: Verify vampire crap (including BSV)
;@TODO: If the point delta on the limit is < 1, don't display limit message.
;@TODO: In rain, coverage should determine if you lose exposure, even in warm areas.
;@TODO: Check how long to reach max Endurance
;@TODO: Riverwood starting gear
;@TODO: Global and function for frostfall version
;@TODO: Global and function for API version

; Campfire stuff
;@TODO: Smelters still aren't working as heat sources.
;@TODO: Block Campfire hotkeys on Enchanting / renaming / other crafting menus
;@TODO: Add way to put out campfire without frost spell
;@TODO: Kick people out of attached furniture objects before pick up
;@TODO: Public "can cook" injected global