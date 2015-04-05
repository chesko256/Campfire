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
	

	StorePlayerState()
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

function StorePlayerState()
	last_worldspace = this_worldspace
	last_interior_state = in_interior
	last_x = player_x
	last_y = player_y
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

function SetExposureEffects(int iExposureLevel)
	if PlayerIsVampire()
		pPlayer.RemoveSpell(_DE_Hypo_Spell_0_2)
		pPlayer.RemoveSpell(_DE_Hypo_Spell_1)
		pPlayer.RemoveSpell(_DE_Hypo_Spell_2)
		pPlayer.RemoveSpell(_DE_Hypo_Spell_3)
		pPlayer.RemoveSpell(_DE_Hypo_Spell_4)
		pPlayer.RemoveSpell(_DE_Hypo_Spell_4NoFrost)
		pPlayer.RemoveSpell(_DE_Hypo_Spell_5)
		pPlayer.RemoveSpell(_DE_Hypo_Spell_5NoFrost)
		return
	endif


endFunction




; dark souls-like lingering heat effect




function ExposureStatusUpdate()
	float myCurrentEP = _DE_ExposurePoints.GetValue()
	
	if myCurrentEP < 121 && myCurrentEP >= 102
		if pPlayer.HasSpell(_DE_Hypo_Spell_0_2)
			if bIsVampire
				pPlayer.RemoveSpell(_DE_Hypo_Spell_0_2)
			endif
		else
			;Remove all other effects
			pPlayer.RemoveSpell(_DE_Hypo_Spell_1)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_3)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4NoFrost)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5NoFrost)
		
			;Apply "Warm" condition
			if !bIsVampire				;Vampires don't get the warmth bonus
				if (pPlayer.AddSpell(_DE_Hypo_Spell_0_2, false))
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						_DE_HypoState_0.Show()
					endif
				endif
			endif
			ImageSpaceModifier.RemoveCrossFade(4.0)
		endif
	endif
	
	if myCurrentEP < 101 && myCurrentEP >= 81
		if pPlayer.HasSpell(_DE_Hypo_Spell_1)
			if bIsVampire
				pPlayer.RemoveSpell(_DE_Hypo_Spell_1)
			endif
		else
			;Remove all other effects
			pPlayer.RemoveSpell(_DE_Hypo_Spell_0_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_3)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4NoFrost)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5NoFrost)
			
			;Apply "Comfortable" condition
			if !bIsVampire
				if (pPlayer.AddSpell(_DE_Hypo_Spell_1, false))
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						_DE_HypoState_1.Show()
					endif
				endif
			endif
			ImageSpaceModifier.RemoveCrossFade(4.0)
		endif
	endif
	
	if myCurrentEP < 81 && myCurrentEP >= 61
			
		if pPlayer.HasSpell(_DE_Hypo_Spell_2)
			if bIsVampire
				pPlayer.RemoveSpell(_DE_Hypo_Spell_2)
			endif
		else
			;Remove all other effects
			pPlayer.RemoveSpell(_DE_Hypo_Spell_0_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_1)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_3)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4NoFrost)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5NoFrost)
			
			;Apply "Cold" condition
			if !bIsVampire
				if (pPlayer.AddSpell(_DE_Hypo_Spell_2, false))
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						_DE_HypoState_2.Show()
					endif
				endif
			endif
			ImageSpaceModifier.RemoveCrossFade(4.0)
		endif
	endif
	
	if myCurrentEP < 61 && myCurrentEP >= 41
		
		;====HELP TEXT====
		if _DE_HelpDone_ExposurePoints.GetValueInt() == 1
			if _DE_Setting_Help.GetValueInt() == 2
				if !bIsVampire
					ShowHelp(1)
				endif
			endif
		endif
		;====HELP TEXT====
		
		if pPlayer.HasSpell(_DE_Hypo_Spell_3)
			if bIsVampire
				pPlayer.RemoveSpell(_DE_Hypo_Spell_3)
			endif
		else
			;Remove all other effects
			pPlayer.RemoveSpell(_DE_Hypo_Spell_0_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_1)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4NoFrost)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5NoFrost)
			
			;Apply "Very Cold" condition
			if !bIsVampire
				if (pPlayer.AddSpell(_DE_Hypo_Spell_3, false))
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						_DE_HypoState_3.Show()
					endif
				endif
				if pSetting_FullScreenEffects
					_DE_Cold3.ApplyCrossFade(4.0)
				else
					ImageSpaceModifier.RemoveCrossFade(4.0)
				endif
			else
				ImageSpaceModifier.RemoveCrossFade(4.0)
			endif
		endif
	endif
	
	if myCurrentEP < 41 && myCurrentEP >= 21
		if pPlayer.HasSpell(_DE_Hypo_Spell_4)
			if bIsVampire
				pPlayer.RemoveSpell(_DE_Hypo_Spell_4)
			endif
		else
			;Remove all other effects
			pPlayer.RemoveSpell(_DE_Hypo_Spell_0_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_1)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_3)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_5NoFrost)
			
			;Apply "Freezing" condition
			if !bIsVampire
				if myLastRegion >= 7 && pSetting_EffectFrostShader == true		;Snow and Coast regions, show character frost shader
					if (pPlayer.AddSpell(_DE_Hypo_Spell_4, false))
						;ExposureMeter.StartFlash()
						if _DE_Setting_SoundEffects.GetValueInt() == 2
							if (pPlayer.GetBaseObject() as ActorBase).GetSex() == 1
								_DE_Female_FreezingSM.Play(pPlayer)
							else
								_DE_Male_FreezingSM.Play(pPlayer)
							endif
						endif
						if _DE_Setting_ForceFeedback.GetValueInt() == 2
							Game.ShakeController(0.7, 0.3, 1.5)
						endif
						if _DE_Setting_ConditionMsg.GetValueInt() == 2
							_DE_HypoState_4.Show()
						endif
					endif
				else						;Elsewhere, do not show frost shader OR setting is off
					if (pPlayer.AddSpell(_DE_Hypo_Spell_4NoFrost, false))
						;ExposureMeter.StartFlash()
						if _DE_Setting_SoundEffects.GetValueInt() == 2
							if (pPlayer.GetBaseObject() as ActorBase).GetSex() == 1
								_DE_Female_FreezingSM.Play(pPlayer)
							else
								_DE_Male_FreezingSM.Play(pPlayer)
							endif
						endif
						if _DE_Setting_ForceFeedback.GetValueInt() == 2
							Game.ShakeController(0.7, 0.3, 1.5)
						endif
						if _DE_Setting_ConditionMsg.GetValueInt() == 2
							_DE_HypoState_4.Show()
						endif
					endif
				endif
				
				if pSetting_FullScreenEffects
					_DE_Cold4.ApplyCrossFade(4.0)
				else
					ImageSpaceModifier.RemoveCrossFade(4.0)
				endif
			else
				ImageSpaceModifier.RemoveCrossFade(4.0)
			endif
		endif
	endif
	
	if myCurrentEP < 21 && myCurrentEP >= 1
		if pPlayer.HasSpell(_DE_Hypo_Spell_5)
			if bIsVampire == true
				pPlayer.RemoveSpell(_DE_Hypo_Spell_5)
			endif
		else
			;Remove all other effects
			pPlayer.RemoveSpell(_DE_Hypo_Spell_0_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_1)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_2)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_3)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4)
			pPlayer.RemoveSpell(_DE_Hypo_Spell_4NoFrost)
			
			;Apply "Freezing to Death" condition
			if !bIsVampire
				if myLastRegion >= 7 && pSetting_EffectFrostShader == true		;Snow and Coast regions, show character frost shader
					if (pPlayer.AddSpell(_DE_Hypo_Spell_5, false))
						;ExposureMeter.StartFlash()
						if _DE_Setting_SoundEffects.GetValueInt() == 2
							if (pPlayer.GetBaseObject() as ActorBase).GetSex() == 1
								_DE_Female_FreezingToDeathSM.Play(pPlayer)
							else
								_DE_Male_FreezingToDeathSM.Play(pPlayer)
							endif
						endif
						if _DE_Setting_ForceFeedback.GetValueInt() == 2
							Game.ShakeController(0.4, 0.6, 2.5)
						endif
						if _DE_Setting_ConditionMsg.GetValueInt() == 2
							_DE_HypoState_5.Show()
						endif
					endif
				else						;Elsewhere, do not show frost shader
					if (pPlayer.AddSpell(_DE_Hypo_Spell_5NoFrost, false))
						;ExposureMeter.StartFlash()
						if _DE_Setting_SoundEffects.GetValueInt() == 2
							if (pPlayer.GetBaseObject() as ActorBase).GetSex() == 1
								_DE_Female_FreezingToDeathSM.Play(pPlayer)
							else
								_DE_Male_FreezingToDeathSM.Play(pPlayer)
							endif
						endif
						if _DE_Setting_ForceFeedback.GetValueInt() == 2
							Game.ShakeController(0.4, 0.6, 2.5)
						endif
						if _DE_Setting_ConditionMsg.GetValueInt() == 2
							_DE_HypoState_5.Show()
						endif
					endif
				endif
				
				if pSetting_FullScreenEffects
					_DE_Cold5.ApplyCrossFade(4.0)
				else
					ImageSpaceModifier.RemoveCrossFade(4.0)
				endif
			else
					ImageSpaceModifier.RemoveCrossFade(4.0)
			endif
		endif
	endif
	
	if myCurrentEP < 0
		;Oh no...
		if !bIsVampire
			if pSetting_PlayerDeath
				bool bRescue = RescuePlayer()
				if !bRescue
					_DE_ExposureDeath.Show()
					;kill companions, one by one
					wait(3)
					pPlayer.Kill()
					SetExposure(0.0)
				endif
			endif
		else
			SetExposure(0.0)
		endif
	endif
	
	;Store the last known vampirism state
	bLastVampirismState = bIsVampire
endFunction