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
	WaitStateUpdate()
	FastTravelStateUpdate()
	PlayerStateUpdate()
	
	ExposureStatusUpdate()

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

function ExposureStatusUpdate()
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

function ShowTutorial_Exposure()
	if _DE_Setting_Help.GetValueInt() == 2 && _Frost_HelpDone_ExposurePoints.GetValueInt() == 1
		if !PlayerIsVampire()
			_Frost_Help_ExposurePoints.Show()
			_Frost_HelpDone_ExposurePoints.SetValue(2)
		endif
	endif
endFunction

; dark souls-like lingering heat effect