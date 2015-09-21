Scriptname _Frost_ExposureSystem extends Quest

float property EXPOSURE_UPDATE_FREQUENCY = 5.0 autoReadOnly
int property FIRE_FACTOR = 8 autoReadOnly
int property HEAT_FACTOR = 6 autoReadOnly
int property TENT_FACTOR = 1 autoReadOnly
int property WARM_TENT_BONUS = 1 autoReadOnly

float distance_moved = 0.0

function StartSystem()
	if !self.IsRunning()
		self.Start()
	endif

	; Exposure-related helper quests
	if !ShelterQuest.IsRunning()
		ShelterQuest.Start()
	endif
	if !_Frost_LightableFiresQuest.IsRunning()
		_Frost_LightableFiresQuest.Start()
	endif

	; Add exposure mechanic spells

endFunction

function StopSystem()
	if self.IsRunning()
		self.Stop()
	endif
endFunction

Event OnInit()
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	if _Frost_Setting_ExposureOn.GetValueInt() == 2
		UpdateExposure()
		RegisterForSingleUpdate(EXPOSURE_UPDATE_FREQUENCY)
	else
		self.Stop()
	endif
endEvent

function UpdateExposure()
	
	if PlayerIsInDialogue()
		return
	endif

	; Gather data
	WaitStateUpdate()
	FastTravelStateUpdate()
	PlayerStateUpdate()

	; Super cereal
	int WetPenalty = GetWetPenalty(bNearFire)
	int FoodBonus = GetFoodState()
	int ClothingBonus = GetClothingState()
	int HeldHeatBonus = GetHeldHeatState()
	int CloakBonus = GetCloakState()
	int ConditioningBonus = GetConditioningState()
	int FollowerBonus = GetFollowerFactor()
	int SpellModification = GetSpellModification()
	int FrostResistBonus = GetFrostResistBonus()

	;@TODO: Check _Frost_ExposureProtectionData instead
	int TotalProtection = FoodBonus + ClothingBonus + HeldHeatBonus + FrostResistBonus + \
						  ConditioningBonus + FollowerBonus + SpellModification + WetPenalty

	; Take action
	if this_vampire_state == false && last_vampire_state == true
		; The player just cured their vampirism. Set their exposure low.
		SetExposure(30.0)
	endif

	CalculateExposureChange()
	ExposureEffectsUpdate()

	StoreLastPlayerState()
endFunction

function PlayerStateUpdate()
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

;@TODO: Possibly wrap in FrostUtil IsAbleToWait() or similar
function WaitStateUpdate()
	if pSetting_NoWait == true
		;If the player is inside, or near a bedroll, disable the spell
		if bInInterior || Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_SleepObjects, pPlayer,  600.0) != None
			pPlayer.RemoveSpell(_DE_NoWait_Spell)
		else
			pPlayer.AddSpell(_DE_NoWait_Spell, false)
		endif
	else
		pPlayer.RemoveSpell(_DE_NoWait_Spell)
	endif
endFunction

;@TODO: Possibly wrap in FrostUtil IsAbleToFastTravel() or similar
function FastTravelStateUpdate()

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
	;Remove wet state effects
	PlayerRef.RemoveSpell(_Frost_WetState_Spell1)
	PlayerRef.RemoveSpell(_Frost_WetState_Spell2)
	PlayerRef.RemoveSpell(_Frost_WetState_Spell3)
	pWetPoints = 0.0
endFunction

int function GetExceptionBlockTemp()
	;@TODO: Put this_z somewhere else
	float this_z = pPlayer.GetPositionZ()
	int max_temp = 100
	
	; Exception blocks are only in Tamriel
	if PlayerRef.GetWorldSpace() == Tamriel
		
		; High Hrothgar
		if IsValueWithin(player_x, 32000, 74340) && IsValueWithin(player_y, -66600, -21000)
			; I am near High Hrothgar, set maximum temperature values based on altitude
									;                     ~~~~    _  ~~~~
			if this_z >= 34000		;Elevation 4              ~~/~~\~~~~~~
				max_temp = -20      ;                     ~~~ /  ~~\~~~
			elseif this_z >= 27500	;Elevation 3            /   ??  \
				max_temp = -15      ;                    / . ~~   ?? \
			elseif this_z >= 21300	;Elevation 2       .  .  ~~~~   ??\        			<----High Hrothgar
				max_temp = -10		;				  /  .  .  ~~ ??   \
			elseif this_z >= 15750	;Elevation 1 	/ .   .    ??      \
				max_temp = -5		;              /########  ??########\
			endif					;							o    ))))FUS RO DAH))))
									;						 [ ]|/={===>           			<----Dovahkiin
									;						   / \
									;
		; The Rift Block
		elseif IsValueWithin(player_x, 53800, 210000) && IsValueWithin(player_y, -150000, -66600)
			FrostDebug(0, "Entered The Rift Block")
			if this_z >= 16600
				max_temp = -10
			endif
		; Falkreath Hold Block
		elseif IsValueWithin(player_x, -42500, 53800) && IsValueWithin(player_y, -150000, -66600)
			FrostDebug(0, "Entered Falkreath Hold Block")
			if this_z >= 7300
				max_temp = -10
			endif
		; Bleak Falls Barrow Block
		elseif IsValueWithin(player_x, -42500, 19400) && IsValueWithin(player_y, -60900, -15000)
			FrostDebug(0, "Entered Black Falls Barrow Block")
			if this_z >= 1500
				max_temp = -10
			endif
		; Brittleshin Pass Block
		elseif IsValueWithin(player_x, -42500, 15300) && IsValueWithin(player_y, -80000, -60900)
			FrostDebug(0, "Entered Brittleshin Pass Block")
			if this_z >= 2000
				max_temp = -10
			endif
		; Haafingar Block (Dawnguard: catches Castle Volkihar)
		elseif IsValueWithin(player_x, -185000, -71000) && IsValueWithin(player_y, 78000, 163000)
			FrostDebug(0, "Entered Haafingar Block")
			if this_z >= -7000
				max_temp = -10
			else
				max_temp = -5
			endif
		endif
	else
		;notification("I'm not in Tamriel")
	endif
	
	return maxTemp
endFunction

function ExposureEffectsUpdate()
	float myCurrentEP = _DE_ExposurePoints.GetValue()
	
	elseif myCurrentEP >= 81
		SetExposureEffects(0)
	if myCurrentEP < 81 && myCurrentEP >= 61
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
	bool player_is_vampire = PlayerIsVampire()

	; Death / Incapacitate
	if iExposureLevel == 5 && !player_is_vampire
		HandleMaxExposure()
	endif

	; Freezing to Death
	if iExposureLevel == 4 && !player_is_vampire
		PlayerRef.AddSpell(_Frost_Hypo_Spell_4, false)
		PlayerRef.AddSpell(_Frost_Hypo_Spell_4NoFrost, false)
	else
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_4)
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_4NoFrost)
	endif

	; Freezing
	if iExposureLevel == 3 && !player_is_vampire
		PlayerRef.AddSpell(_Frost_Hypo_Spell_3, false)
		PlayerRef.AddSpell(_Frost_Hypo_Spell_3NoFrost, false)
	else
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_3)
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_3NoFrost)
	endif

	; Cold
	if iExposureLevel == 2 && !player_is_vampire
		PlayerRef.AddSpell(_Frost_Hypo_Spell_2, false)
	else
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_2)
	endif

	; Chilly
	if iExposureLevel == 1 && !player_is_vampire
		PlayerRef.AddSpell(_Frost_Hypo_Spell_1, false)
	else
		PlayerRef.RemoveSpell(_Frost_Hypo_Spell_1)
	endif

	ApplyVisualEffects(iExposureLevel)
	if !player_is_vampire
		ShowExposureStateMessage(iExposureLevel)
		ApplySoundEffects(iExposureLevel)
		ApplyForceFeedback(iExposureLevel)
	endif
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
	if _Frost_Setting_FullScreenEffects.GetValueInt() == 1 || PlayerIsVampire()
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
	if _Frost_Setting_ExposureIsFatal.GetValueInt() == 2
		bool is_rescued = RescuePlayer()
		if !is_rescued
			
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
		endif
	endif
endFunction

int function GetFoodBonus()
	if PlayerRef.HasEffectKeyword(_Frost_FoodBuffKeyword10)
		return 1
	elseif PlayerRef.HasEffectKeyword(_Frost_FoodBuffKeyword15)
		return 2
	elseif PlayerRef.HasEffectKeyword(_Frost_FoodBuffKeyword20)
		return 3
	elseif PlayerRef.HasEffectKeyword(_Frost_FoodBuffKeyword25)
		return 4
	else
		return 0
	endif
endFunction

;@TODO: Roll into Equip Monitor
float function GetHeldHeatState()
	if PlayerRef.GetEquippedItemType(0) == 11 || PlayerRef.GetEquippedItemType(1) == 11
		; The player has equipped a torch.
		;PlayerRef.AddSpell(_DE_TorchState_Spell, false)
		;return 0.1
	endif
	if ;Player has fire spell equipped
		;give more bonus, based on Augmented Flames perk
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
endif

function CalculateExposureChange()
	; If enough game time has passed since the last update, modify based on waiting instead.
	float time_delta_game_days = GetCurrentGameTime() - last_update_time
	float time_delta_game_hours = time_delta_game_days * 24.0

	if time_delta_game_hours > 1.0
		ModExposureDueToTime(time_delta_game_hours)
		return
	endif

	; Determine real time that would have transpired relative to game time.
	float time_delta_real_seconds
	if time_delta_game_days > 0.0
		time_delta_real_seconds = (time_delta_game_days * 86400) / TimeScale.GetValue()
	else
		; Return sane value
		time_delta_real_seconds = 6.0
	endif
	
	if fTimeDeltaSec <= 20.0	;Clamp point loss to 20-seconds between intervals
		iSlowUpdateCounter = 0
		
		; Master Exposure loss formula
		exposure_loss = ((((((fTempMultiplier * 20) + WetFactor)/(ClothingFactor + FrostFactor)) * AuxFactor) * pSetting_ExposureRate) * fTimeDeltaSec) / 60
			
	else
		iSlowUpdateCounter += 1
		if iSlowUpdateCounter == 4 && _Frost_Setting_SystemMsg.GetValueInt() == 2
			debug.messagebox("Your game's scripting system is running too slowly in order for Frostfall to run correctly. Please see the Troubleshooting page of the online documentation for tips. Your exposure value will not change until this improves. (Last update took " + time_delta_real_seconds + "sec, expected <20.0sec)")
		endif
	endif
	
	return exposure_loss
endfunction

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