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
GlobalVariable property _Frost_Setting_ConditionMessages auto
GlobalVariable property _Frost_Setting_FullScreenEffects auto
GlobalVariable property _Frost_Setting_SoundEffects auto
GlobalVariable property _Frost_Setting_ForceFeedback auto
GlobalVariable property _Frost_Setting_DisplayTutorials auto
GlobalVariable property _Frost_Setting_VampireMode auto
GlobalVariable property _Frost_WetLevel auto
GlobalVariable property _Frost_ExposureLevel auto
GlobalVariable property _Frost_CurrentTemperature auto
GlobalVariable property _Frost_AttributeWarmth auto
GlobalVariable property _Frost_AttributeCoverage auto
GlobalVariable property _Frost_AttributeExposure auto
GlobalVariable property _Frost_AttributeExposureMeter auto
GlobalVariable property _Frost_ExposureTarget auto
GlobalVariable property FrostfallAttributeExposureReadOnly auto
GlobalVariable property FrostfallExposureLevelReadOnly auto
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
GlobalVariable property _Frost_HelpDone_Exposure auto
FormList property _Frost_ExposureExceptions auto
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
Message property _frost_StatusTemp_Steady_Fire_Chilly auto
Message property _frost_StatusTemp_Steady_Shelter_Chilly auto
Message property _frost_StatusTemp_Steady_FireShelter_Chilly auto
Message property _Frost_ExposureCap_Warm auto
Message property _Frost_FrostbiteMessage_Body auto
Message property _Frost_FrostbiteMessage_Head auto
Message property _Frost_FrostbiteMessage_Hands auto
Message property _Frost_FrostbiteMessage_Feet auto
Message property _Frost_Help_Exposure auto
MiscObject property _Frost_DummyItem auto
ImageSpaceModifier property _Frost_ColdISM_Level5 auto
ImageSpaceModifier property _Frost_ColdISM_Level4 auto
ImageSpaceModifier property _Frost_ColdISM_Level3 auto
Sound property _Frost_Female_FreezingSM auto
Sound property _Frost_Female_FreezingToDeathSM auto
Sound property _Frost_Male_FreezingSM auto
Sound property _Frost_Male_FreezingToDeathSM auto
Static property CampfireHeatsourceOverrideNormal auto
Static property CampfireHeatsourceOverrideWarm auto
Static property XMarker auto
Spell property _Frost_InnerFireSpell auto
Potion property _Frost_FrostbittenPotionBody auto
Potion property _Frost_FrostbittenPotionHead auto
Potion property _Frost_FrostbittenPotionHands auto
Potion property _Frost_FrostbittenPotionFeet auto
ReferenceAlias property HeatSource auto
Keyword property _Frost_FrostbiteBodyKW auto
Keyword property _Frost_FrostbiteHeadKW auto
Keyword property _Frost_FrostbiteHandsKW auto
Keyword property _Frost_FrostbiteFeetKW auto
Keyword property ActorTypeDragon auto

ReferenceAlias property DialogueSpeaker auto
Quest property _Frost_PlayerDialogueDetect auto
Quest property DLC2DialogueRavenRock auto hidden

float property MIN_EXPOSURE = 0.0 autoReadOnly
float property MAX_EXPOSURE = 120.0 autoReadOnly
int property HEAT_FACTOR = 4 autoReadOnly
int property AMBIENT_FACTOR = 1 autoReadOnly
int property TENT_FACTOR = 1 autoReadOnly
int property WARM_TENT_BONUS = 1 autoReadOnly
float property EXPOSURE_LEVEL_5 = 100.0 autoReadOnly
float property EXPOSURE_LEVEL_4 = 80.0 autoReadOnly
float property EXPOSURE_LEVEL_3 = 60.0 autoReadOnly
float property EXPOSURE_LEVEL_2 = 40.0 autoReadOnly
float property EXPOSURE_LEVEL_1 = 20.0 autoReadOnly

float currentTemperature = 10.0
float lastUpdateTime = 0.0
float thisUpdateTime = 0.0
float  thisUpdateGameTime = 0.0
float lastUpdateGameTime = 0.0

int exposureLevel = 0
int lastExposureLevel = 0
float lastExposureTarget = 0.0
float lastExposure = 0.0
int warmMessageDebounce = 0
bool totalWarmMessageDebounce = false
Weather currentWeather = None
bool canDisplayLimitMsg = true
bool recentlyFastTravelled = false
bool ismRunning = false

; Current State
float playerX = 0.0
float playerY = 0.0
bool inTent = false
bool tentIsWarm = false
bool inShelter = false
bool inInterior = false
bool nearHeat = false
bool isVampire = false
bool isMeditating = false
WorldSpace thisWorldSpace = None

; Historic State
float lastX = 0.0
float lastY = 0.0
float distanceMoved = 0.0
bool wasInTent = false
bool wasInShelter = false
bool wasInInterior = false
bool wasNearHeat = false
bool lastVampireState = false
WorldSpace lastWorldSpace = None


function RegisterForEvents()
	FallbackEventEmitter meditateEvent = GetEventEmitter_OnInnerFireMeditate()
	FallbackEventEmitter campfirePerkEvent = GetEventEmitter_CampfirePerkPurchased()
	
	meditateEvent.RegisterFormForModEventWithFallback("Frost_OnInnerFireMeditate", "OnInnerFireMeditate", self)
	campfirePerkEvent.RegisterFormForModEventWithFallback("Campfire_CampfirePerkPurchased", "CampfirePerkPurchased", self)
endFunction

function Update()
	if lastUpdateTime == 0.0
		; Skip the first update
		lastUpdateTime = Game.GetRealHoursPassed()
		lastUpdateGameTime = Utility.GetCurrentGameTime()
		return
	endif

	currentTemperature = GetEffectiveTemperature()

	GetCurrentPlayerState()

	distanceMoved = GetDistanceMoved()
	recentlyFastTravelled = GetFastTravelled(distanceMoved)
	if recentlyFastTravelled
		SetAfterFastTravelCondition()
	endif

	float target = CalculateExposureTarget()
	_Frost_ExposureTarget.SetValue(target)

	; Display the exposure meter in contextual mode if the
	; exposure target changes dramatically.
	if abs(lastExposureTarget - target) >= 20.0
		SendEvent_ForceExposureMeterDisplay()
	endif

	; Update the indicator
	if target >= EXPOSURE_LEVEL_1
		SendEvent_UpdateExposureMeterIndicator((target - EXPOSURE_LEVEL_1) / 100)
	else
		SendEvent_UpdateExposureMeterIndicator(0.0)
	endif

	UpdateExposure(target)

	if warmMessageDebounce > 0
		warmMessageDebounce -= 1
	endif

	lastExposureTarget = target
	lastUpdateTime = thisUpdateTime
	lastUpdateGameTime = thisUpdateGameTime
endFunction

float function CalculateExposureTarget()
	;@TODO: Pull this out to Heat Source System
	if HeatSource
		ObjectReference hs = HeatSource.GetRef()
		if hs
			Form hsBase = hs.GetBaseObject()
			if hsBase == CampfireHeatsourceOverrideNormal
				return EXPOSURE_LEVEL_1
			elseif hsBase == CampfireHeatsourceOverrideWarm
				return MIN_EXPOSURE
			endif
		endif
	endif

	; Temperature increases the target
	float SLOPE = -5.1
	float Y_INT = 102.0
	float currentTemp = _Frost_CurrentTemperature.GetValue()
	float TEMP_MOD = (SLOPE * currentTemp) + Y_INT

	; Wetness increases the target
	float WETNESS_MOD = GetPlayerWetnessLevel()
	if WETNESS_MOD == 3
		WETNESS_MOD = 4
	endif
	WETNESS_MOD *= 10

	; Warmth rating decreases the target
	float WARMTH_MOD = (GetPlayerWarmth() * 40.0) / 550.0

	; Shelter decreases the target
	ObjectReference tent = GetCurrentTent()
	bool takingShelter = IsPlayerTakingShelter()
	float SHELTER_MOD = 0.0
	if tent
		if IsTentWarm(tent)
			SHELTER_MOD = 80.0
		elseif IsTentWaterproof(tent) || takingShelter
			SHELTER_MOD = 50.0
		endif
	elseif takingShelter
		SHELTER_MOD = 50.0
	endif

	; Fire decreases the target
	float HEAT_MOD = GetPlayerHeatSourceLevel() * 40.0

	float target = (TEMP_MOD + WETNESS_MOD) - (WARMTH_MOD + SHELTER_MOD + HEAT_MOD)

	if target > MAX_EXPOSURE
		target = MAX_EXPOSURE
	elseif target < MIN_EXPOSURE
		target = MIN_EXPOSURE
	endif

	; Cap at 'Freezing' if using Inner Flame
	if isMeditating && target > EXPOSURE_LEVEL_4
		target = EXPOSURE_LEVEL_4
	endif

	return target
endFunction

function UpdateExposure(float afExposureTarget)
	if recentlyFastTravelled
		FrostDebug(1, "Player fast travelled.")
		StoreLastPlayerState()
		return
	endif

	if FrostUtil.GetCompatibilitySystem().isDLC2Loaded
		if !DLC2DialogueRavenRock
			DLC2DialogueRavenRock = Game.GetFormFromFile(0x018B0F, "Dragonborn.esm") as Quest
		endif
		if (DLC2DialogueRavenRock as DLC2DialogueRRQuestScript).RidingTheBoat == true
			FrostDebug(1, "Player is riding the boat to Solstheim.")
			StoreLastPlayerState()
			return
		endif
	endif

	if _Frost_Setting_ExposurePauseDialogue.GetValueInt() == 2 && PlayerIsInDialogue()
		StoreLastPlayerState()
		return
	endif

	if _Frost_Setting_ExposurePauseCombat.GetValueInt() == 2 && PlayerRef.IsInCombat()
		StoreLastPlayerState()
		return
	endif

	ObjectReference exception = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_ExposureExceptions, PlayerRef, 600.0)
	if exception
		StoreLastPlayerState()
		return
	endif

	; Immunity conditions
	if PlayerRef.HasKeyword(ActorTypeDragon)
		(_Frost_MainQuest as _Frost_ConditionValues).IsImmune = true
		return
	else
		(_Frost_MainQuest as _Frost_ConditionValues).IsImmune = false
	endif

	; If enough game time has passed since the last update, modify based on waiting instead.
	float timeDeltaGameHours = (Utility.GetCurrentGameTime() - lastUpdateGameTime) * 24.0
	
	ExposureValueUpdate(afExposureTarget, timeDeltaGameHours)
	ExposureEffectsUpdate()

	StoreLastPlayerState()
endFunction

function ModAttributeExposure(float amount, float target, bool allow_skill_advancement = true)
	float exp_attr = _Frost_AttributeExposure.GetValue()
	if exp_attr == target
		SendEvent_UpdateExposureMeter()
		return
	endif

	bool advance_skill = false
	float exposure = exp_attr + amount
	bool increasing = amount > 0

	if increasing
		advance_skill = true
	endif

	if isMeditating
		advance_skill = false
	endif

	bool limit_condition_triggered = false
	if exposure > target && increasing
		if exp_attr <= target
			; This update would push us above the target, cap at the target
			exposure = target
			advance_skill = false
			if target < MAX_EXPOSURE && target > EXPOSURE_LEVEL_1
				; Something is preventing the player from getting colder, display message.
				if canDisplayLimitMsg
					if nearHeat && !(inTent || inShelter)
						_frost_StatusTemp_Steady_Fire_Chilly.Show()
					elseif !nearHeat && (inTent || inShelter)
						_frost_StatusTemp_Steady_Shelter_Chilly.Show()
					elseif nearHeat && (inTent || inShelter)
						_frost_StatusTemp_Steady_FireShelter_Chilly.Show()
					endif
					canDisplayLimitMsg = false
				endif
				limit_condition_triggered = true
			endif
		else
			; We're increasing and already above the target, do nothing
			SendEvent_UpdateExposureMeter()
			return
		endif
	elseif exposure < target && !increasing
		if exp_attr >= target
			; This update would push us below the target, cap at the target
			exposure = target
			advance_skill = false
			if target < MAX_EXPOSURE && target > EXPOSURE_LEVEL_1
				; Something is preventing the player from getting warmer, display message.
				if !inInterior && (nearHeat || inTent || isMeditating) && canDisplayLimitMsg
					_Frost_ExposureCap_Warm.Show()
					canDisplayLimitMsg = false
				endif
				limit_condition_triggered = true
			endif
		else
			; We're decreasing and already below the target
			SendEvent_UpdateExposureMeter()
			return
		endif
	endif

	DisplayWarmUpMessage(exposure, target)

	_Frost_AttributeExposure.SetValue(exposure)
	FrostfallAttributeExposureReadOnly.SetValue(exposure)
	SetExposureMeterPercentValue(exposure)
	SetExposureMeterGlow(exposure)

	FrostDebug(1, "@@@@ Exposure ::: Current Exposure: " + exposure + " (" + amount + ")")

	if advance_skill && allow_skill_advancement
		AdvanceEnduranceSkill()
	endif

	if limit_condition_triggered == false
		canDisplayLimitMsg = true
	endif

	SendEvent_UpdateExposureMeter()

	; Hack to force the meter to stay on until completely warm when warming up
	if !increasing && abs(amount) >= GetExposureMeterHandler().improvement_display_delta_threshold
		if exposure < 20.0 && exposure >= 0.0
			SendEvent_ForceExposureMeterDisplay()
		endif
	endif
endFunction

function SetExposureMeterGlow(float exposureValue)
	if ((exposureValue > 20.0 && lastExposure <= 20.0) || \
		(exposureValue <= 20.0 && lastExposure <= 20.0) || \
		(exposureValue <= 20.0 && lastExposure > 20.0))
		SendEvent_SetExposureMeterGlow(exposureValue)
	endif
	lastExposure = exposureValue
endFunction

function SetExposureMeterPercentValue(float exposureValue)
	float exposure_meter_value = exposureValue - 20.0
	if exposure_meter_value < 0.0
		exposure_meter_value = 0.0
	endif
	_Frost_AttributeExposureMeter.SetValue(exposure_meter_value)
endFunction

function GetCurrentPlayerState()
	_Frost_PlayerStateSystem stateSystem = GetPlayerStateSystem()

	; Ensure that we get the complete state at the sample interval.
	while stateSystem.updateInProgress
		FrostDebug(0, "@@@@ Exposure ::: Waiting for Player State System to finish update.")
		Utility.Wait(0.2)
	endWhile

	thisUpdateTime = stateSystem.thisUpdateTime
	thisUpdateGameTime = stateSystem.thisUpdateGameTime
	inTent = stateSystem.inTent
	tentIsWarm = stateSystem.tentIsWarm
	inShelter = stateSystem.inShelter
	thisWorldSpace = stateSystem.thisWorldSpace
	playerX = stateSystem.playerX
	playerY = stateSystem.playerY
	inInterior = stateSystem.inInterior
endFunction

function StoreLastPlayerState()
	lastWorldSpace = thisWorldSpace
	wasInInterior = inInterior
	wasInTent = inTent
	wasInShelter = inShelter
	wasNearHeat = nearHeat
	lastX = playerX
	lastY = playerY
	lastVampireState = isVampire
	lastExposureLevel = exposureLevel
endFunction

float function GetDistanceMoved()
	return abs(sqrt(pow((playerX - lastX), 2) + pow((playerY - lastY), 2)))
endFunction

bool function GetFastTravelled(float afDistance)
	if afDistance <= 30000.0
		return false
	endif

	if FrostUtil.IsNearFastTravelException()
		return true
	endif

	if thisWorldSpace != lastWorldSpace && ((thisUpdateGameTime - lastUpdateGameTime) * 24.0) < 1.0
		return false
	endif

	if wasInInterior != inInterior
		return false
	endif

	; We traveled a large distance in the same worldspace (or across a significant timespan)
	; not near a fast travel exception and did not zone in/out of an interior. We fast travelled.
	return true
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

	if exposureLevel == 6
		if isVampire && _Frost_Setting_VampireMode.GetValueInt() == 2
			;pass
		else
			HandleMaxExposure()
		endif
	endif

	if exposureLevel >= 4
		GetFrostbite()
	endif

	ApplyVisualEffects()
	ApplySoundEffects()
	ApplyForceFeedback()
endFunction

function UpdateExposureLevel()
	float current_exposure = _Frost_AttributeExposure.GetValue()
	if current_exposure >= MAX_EXPOSURE
		exposureLevel = 6
	elseif current_exposure >= EXPOSURE_LEVEL_5
		exposureLevel = 5
	elseif current_exposure >= EXPOSURE_LEVEL_4
		exposureLevel = 4
	elseif current_exposure >= EXPOSURE_LEVEL_3
		exposureLevel = 3
	elseif current_exposure >= EXPOSURE_LEVEL_2
		exposureLevel = 2
	elseif current_exposure >= EXPOSURE_LEVEL_1
		exposureLevel = 1
	elseif current_exposure > MIN_EXPOSURE
		exposureLevel = 0
	elseif current_exposure == MIN_EXPOSURE
		exposureLevel = -1
	endif
	if exposureLevel > 0
		totalWarmMessageDebounce = false
	endif
	ShowExposureStateMessage()

	_Frost_ExposureLevel.SetValueInt(exposureLevel)
	FrostfallExposureLevelReadOnly.SetValueInt(exposureLevel)
endFunction

function ShowExposureStateMessage()
	if _Frost_Setting_ConditionMessages.GetValueInt() == 2
		bool increasing = exposureLevel > lastExposureLevel
		if increasing && exposureLevel == 5 && lastExposureLevel != 5
			_Frost_HypoState_5.Show()
		elseif increasing && exposureLevel == 4 && lastExposureLevel != 4
			_Frost_HypoState_4.Show()
		elseif increasing && exposureLevel == 3 && lastExposureLevel != 3
			_Frost_HypoState_3.Show()
		elseif increasing && exposureLevel == 2 && lastExposureLevel != 2
			_Frost_HypoState_2.Show()
			ShowTutorial_Exposure()
		elseif increasing && exposureLevel == 1 && lastExposureLevel != 1
			_Frost_HypoState_1.Show()
		elseif increasing && exposureLevel == 0 && lastExposureLevel != 0 && lastExposureLevel != -1
			_Frost_HypoState_0.Show()
		elseif exposureLevel == -1 && lastExposureLevel != -1 && !totalWarmMessageDebounce
			_Frost_HypoState_0_Min.Show()
			totalWarmMessageDebounce = true
		endif
	endif
endFunction

function ApplyVisualEffects()
	; Make sure to clear ISM if a vampire, or existing effect if setting toggled off
	if _Frost_Setting_FullScreenEffects.GetValueInt() == 1
		if ismRunning
			_Frost_ColdISM_Level3.Remove()
			_Frost_ColdISM_Level4.Remove()
			_Frost_ColdISM_Level5.Remove()
			ismRunning = false
		endif
		return
	endif

	if exposureLevel <= 2
		if ismRunning
			_Frost_ColdISM_Level3.Remove()
			_Frost_ColdISM_Level4.Remove()
			_Frost_ColdISM_Level5.Remove()
			ismRunning = false
		endif
	elseif exposureLevel == 3
		_Frost_ColdISM_Level3.ApplyCrossFade(4.0)
		ismRunning = true
	elseif exposureLevel == 4
		_Frost_ColdISM_Level4.ApplyCrossFade(4.0)
		ismRunning = true
	elseif exposureLevel == 5
		_Frost_ColdISM_Level5.ApplyCrossFade(4.0)
		ismRunning = true
	endif
endFunction

function ApplySoundEffects()
	if _Frost_Setting_SoundEffects.GetValueInt() == 2
		bool gender = PlayerRef.GetActorBase().GetSex() == 1
 		bool increasing = exposureLevel > lastExposureLevel
		if increasing && exposureLevel == 4 && lastExposureLevel != 4
			if gender == 1
				_Frost_Female_FreezingSM.Play(PlayerRef)
			else
				_Frost_Male_FreezingSM.Play(PlayerRef)
			endif
		elseif increasing && exposureLevel == 5 && lastExposureLevel != 5
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
		bool increasing = exposureLevel > lastExposureLevel
		if increasing && exposureLevel == 4 && lastExposureLevel != 4
			Game.ShakeController(0.7, 0.3, 1.5)
		elseif increasing && exposureLevel == 5 && lastExposureLevel != 5
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

		if PlayerRef.IsOnMount()
			_Frost_ExposureDeathMsg.Show()
			Utility.Wait(3)
			KnockPlayerOffHorse()
			PlayerRef.Kill()
		else
			_Frost_ExposureDeathMsg.Show()
			Utility.Wait(3)
			PlayerRef.Kill()
		endif
	elseif _Frost_Setting_MaxExposureMode.GetValueInt() == 2
		if PlayerRef.IsOnMount()
			KnockPlayerOffHorse()
		endif
		
		SendEvent_OnRescuePlayer(PlayerRef.IsSwimming())
	else
		; Do nothing.
	endif
endFunction

function KnockPlayerOffHorse()
	knocking_off_horse = false
	RegisterForCameraState()
	ObjectReference heading = PlayerRef.PlaceAtMe(XMarker)
	float[] heading_pos = GetOffsets(PlayerRef, 500.0, 90.0)
	heading.MoveTo(PlayerRef, heading_pos[0], heading_pos[1])
	Utility.Wait(0.2)
	heading.PushActorAway(PlayerRef, 5.0)
	Utility.Wait(0.5)
	int i = 0
	while knocking_off_horse && i < 30
		Utility.Wait(0.5)
		i += 1
	endWhile
	UnregisterForCameraState()
	heading.Disable()
	heading.Delete()
endFunction

bool knocking_off_horse = false
Event OnPlayerCameraState(int oldState, int newState)
	if newState == 11
		knocking_off_horse = true
	else
		knocking_off_horse = false
	endif
EndEvent

bool function PlayerIsInDialogue()
	if GetSKSELoaded()
		if UI.IsMenuOpen("Dialogue Menu")
			return true
		else
			return false
		endif
	else
		_Frost_PlayerDialogueDetect.Stop()
		_Frost_PlayerDialogueDetect.Start()
		if DialogueSpeaker.GetActorRef()
			return true
		else
			return false
		endif
	endif
endFunction

float function GetEffectiveTemperature()
	; Get the effective temperature, taking the player's Coverage into account.

	float current_temp = _Frost_CurrentTemperature.GetValue()
	float temp_increase = 0

	currentWeather = GetCurrentWeatherActual()
	int current_weather_class = GetWeatherClassificationActual(currentWeather)

	if IsWeatherSevere(currentWeather) && current_weather_class == 3
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

function ExposureValueUpdate(float afExposureTarget, float gameHoursPassed)
	int heatAmount = 0
	int currentHeatSize = 0

	; If the player is near a heat source, how fast should they warm up?
	currentHeatSize = _Frost_CurrentHeatSourceSize.GetValueInt()
	if currentHeatSize > 0
		nearHeat = true
		heatAmount = HEAT_FACTOR * _Frost_CurrentHeatSourceSize.GetValueInt()
	else
		nearHeat = false
		heatAmount = AMBIENT_FACTOR
		if inTent
			heatAmount += TENT_FACTOR
			if tentIsWarm
				heatAmount += WARM_TENT_BONUS
			endif
		endif
	endif

	FrostDebug(0, "@@@@ Exposure ::: nearHeat: " + nearHeat + ", inInterior: " + inInterior + ", inTent: " + inTent + ", tentIsWarm: " + tentIsWarm)

	float currentExposure = _Frost_AttributeExposure.GetValue()
	if currentExposure < afExposureTarget
		GetColder(afExposureTarget, gameHoursPassed)
	else
		GetWarmer(heatAmount, afExposureTarget, gameHoursPassed)
	endif
endFunction

function GetWarmer(int heat_amount, float target, float game_hours_passed)
	FrostDebug(1, "@@@@ Exposure ::: GetWarmer : Target " + Math.Ceiling(target) + " : GameHoursPassed " + game_hours_passed)
	if game_hours_passed >= 1.0
		float duration_amount = 15.0 * game_hours_passed
		ModAttributeExposure(-duration_amount, target, allow_skill_advancement=false)
	else
		ModAttributeExposure(-heat_amount, target)
	endif
endFunction

function GetColder(float target, float game_hours_passed)
	FrostDebug(1, "@@@@ Exposure ::: GetColder : Target " + Math.Ceiling(target) + " : GameHoursPassed " + game_hours_passed)
	float update_freq = UpdateFrequencyGlobal.GetValue()
	float time_delta_seconds = (thisUpdateTime - lastUpdateTime) * 3600.0
	if time_delta_seconds > (update_freq * 2)
		time_delta_seconds = (update_freq * 2)
	endif

	; Reduce the player's exposure rate by up to 90%.
	float exposure_reduction = 1.0 - (((_Frost_AttributeWarmth.GetValueInt() * 90.0) / _Frost_Calc_MaxWarmth.GetValue()) / 100.0)
	; Rise (multiplier on Y-axis) over Run (distance from hemeostasis temperature)
	float slope = _Frost_Calc_ExtremeMultiplier.GetValue()/(_Frost_Calc_ExtremeTemp.GetValue() - _Frost_Calc_StasisTemp.GetValue())
	float a_x = currentTemperature
	float a_b = (-slope + _Frost_Calc_StasisMultiplier.GetValue()) * _Frost_Calc_StasisTemp.GetValue()
	; Slope-intercept form solving for Y
	float temp_multiplier = (slope * a_x) + a_b
	float wet_factor = GetWetFactor()

    ; Master Exposure loss formula
	float amount = ((((temp_multiplier / 3) * wet_factor) * exposure_reduction) * time_delta_seconds) * _Frost_Setting_ExposureRate.GetValue()
	FrostDebug(0, "@@@@ Exposure ::: Calc Values - temp_multiplier " + temp_multiplier + " wet_factor " + wet_factor + " exposure_reduction " + exposure_reduction + " time_delta_seconds " + time_delta_seconds + " _Frost_Setting_ExposureRate " + _Frost_Setting_ExposureRate.GetValue())

	if game_hours_passed >= 1.0
		float duration_amount = (target / 4) * game_hours_passed
		if target > EXPOSURE_LEVEL_4
			target = EXPOSURE_LEVEL_4
		endif
		ModAttributeExposure(duration_amount, target, allow_skill_advancement=false)
	else
		ModAttributeExposure(amount, target)
	endif
endFunction

function GetFrostbite(bool force_frostbite = false)
	if isVampire
		return
	endif
	_Frost_ClothingSystem clothing = GetClothingSystem()
	bool wearing_body = clothing.WornGearValues[0] > 0
	bool wearing_head = clothing.WornGearValues[2] > 0
	bool wearing_hands = clothing.WornGearValues[4] > 0
	bool wearing_feet = clothing.WornGearValues[6] > 0
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
	if _Frost_Setting_DisplayTutorials.GetValueInt() == 2 && _Frost_HelpDone_Exposure.GetValueInt() == 1
		_Frost_Help_Exposure.Show()
		_Frost_HelpDone_Exposure.SetValue(2)
	endif
endFunction

function DisplayWarmUpMessage(float exposure, float target)
	; suddenly near heat
	; enough time has passed
	if (warmMessageDebounce == 0 && (!wasNearHeat && nearHeat)) || (!wasInTent && inTent) || (!wasInShelter && inShelter && nearHeat)
		if exposure < target
			(_Frost_MainQuest as _Frost_WeathersenseMessages).DisplayTemperatureMessage(true)
			warmMessageDebounce = 3
		else
			_Frost_WarmUpMessage.Show()
			warmMessageDebounce = 3
		endif
	endif
endFunction

; Endurance Skill
function AdvanceEnduranceSkill()
    if EndurancePerkPointsEarned.GetValueInt() < EndurancePerkPointsTotal.GetValueInt()
    	if inInterior || GetCurrentTent() || _Frost_CurrentHeatSourceSize.GetValueInt() > 0
    		return
    	endif
    	if (currentTemperature <= 0) || (currentTemperature < 10 && GetWeatherClassificationActual(currentWeather) >= 2)
    		; continue
    	else
    		return
    	endif

        int next_level = EndurancePerkPointsEarned.GetValueInt() + 1

        ; 200, 400, 600, 800...
        float ticks_required = 150 * next_level

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
	FrostfallAttributeExposureReadOnly.SetValue(value)
	SetExposureMeterPercentValue(value)
	SetExposureMeterGlow(value)
	if force_meter_display
		SendEvent_ForceExposureMeterDisplay()
	else
		SendEvent_UpdateExposureMeter()
	endif
	ExposureEffectsUpdate()
endFunction

float[] function GetOffsets(Actor akSource, Float afDistance = 100.0, float afOffset = 0.0)
	Float A = akSource.GetAngleZ() + afOffset
	Float YDist = Sin(A)
	Float XDist = Cos(A)

	XDist *= afDistance
	YDist *= afDistance

	Float[] Offsets = New Float[2]
	Offsets[0] = YDist
	Offsets[1] = XDist
	Return Offsets
EndFunction


Event OnInnerFireMeditate(bool abMeditating)
	if abMeditating
		isMeditating = true
	else
		isMeditating = false
	endif
endEvent

Event CampfirePerkPurchased()
	if _Frost_PerkRank_InnerFire.GetValueInt() > 0
		PlayerRef.AddSpell(_Frost_InnerFireSpell)
	endif
endEvent

;@NOFALLBACK
function SendEvent_ForceExposureMeterDisplay(bool flash = false)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frostfall_ForceExposureMeterDisplay")
		if handle
			ModEvent.PushBool(handle, flash)
			ModEvent.Send(handle)
		endif
	endif
endFunction

;@NOFALLBACK
function SendEvent_UpdateExposureMeter()
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frostfall_UpdateExposureMeter")
		if handle
			ModEvent.Send(handle)
		endif
	endif
endFunction

;@NOFALLBACK
function SendEvent_UpdateExposureMeterIndicator(float percent)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frostfall_UpdateExposureMeterIndicator")
		if handle
			ModEvent.PushFloat(handle, percent)
			ModEvent.Send(handle)
		endif
	endif
endFunction

;@NOFALLBACK
function SendEvent_SetExposureMeterGlow(float percent)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frostfall_SetExposureMeterGlow")
		if handle
			ModEvent.PushFloat(handle, percent)
			ModEvent.Send(handle)
		endif
	endif
endFunction

function SendEvent_OnRescuePlayer(bool in_water)
	FallbackEventEmitter emitter = GetEventEmitter_OnRescuePlayer()
	int handle = emitter.Create("Frost_OnRescuePlayer")
	if handle
		emitter.PushBool(handle, in_water)
		emitter.Send(handle)
	endif
endFunction

;@TODO: Am I adding apocrypha / etc to oblivion worldspaces?
;@TODO: Exception gear
;@TODO: Implement all armor compatibility
;@TODO: Verify vampire crap (including BSV)

;@TODO: If the point delta on the limit is < 1, don't display limit message.
;@TODO: In rain, coverage should determine if you lose exposure, even in warm areas.
