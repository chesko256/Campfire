scriptname _DE_WaterDetect extends ReferenceAlias

_DE_EPMonitor_1_6 property Frostfall auto
_DE_Compatibility property Compatibility auto

Spell property _DE_ColdWater_1 auto
Spell property _DE_ColdWater_2 auto
Spell property _DE_ColdWater_3 auto
Spell property _DE_ColdWater_3_Perk auto
Spell property _DE_WetState_Spell1 auto
Spell property _DE_WetState_Spell2 auto
Spell property _DE_WetState_Spell3 auto
Spell property _DE_WetState_Spell3NoShader auto

Actor property PlayerRef auto

GlobalVariable property _DE_SwimState auto
GlobalVariable property _DE_WetTime auto
GlobalVariable property _DE_ExposurePoints auto
GlobalVariable property _DE_CurrentTemp auto
GlobalVariable property _DE_EPDebug auto
GlobalVariable property GameHour auto

message property _DE_WaterTemp1 auto
message property _DE_WaterTemp2 auto
message property _DE_WaterTemp3 auto
message property _DE_WaterTemp4 auto
keyword property _DE_WaterPotionKW auto

float msgTimeDiff
float LastWaterMessageTime
bool bProcessingSwimming = false

Event OnInit()
	bool bReg1 = RegisterForAnimationEvent(PlayerRef, "SoundPlay.FSTSwimSwim")
	bool bReg2 = RegisterForAnimationEvent(PlayerRef, "MTState")

	FrostfallDebug(3, "[Frostfall] I initialized and registered for swimming animation events!  SoundPlay.FSTSwimSwim:" + bReg1 + ", MTState:" + bReg2)
endEvent

Event OnPlayerLoadGame()
	bool bReg1 = RegisterForAnimationEvent(PlayerRef, "SoundPlay.FSTSwimSwim")
	bool bReg2 = RegisterForAnimationEvent(PlayerRef, "MTState")

	FrostfallDebug(3, "[Frostfall] I loaded the game and registered for swimming animation events!  SoundPlay.FSTSwimSwim:" + bReg1 + ", MTState:" + bReg2)
endEvent

Event OnRaceSwitchComplete()
	bool bReg1 = RegisterForAnimationEvent(PlayerRef, "SoundPlay.FSTSwimSwim")
	bool bReg2 = RegisterForAnimationEvent(PlayerRef, "MTState")

	FrostfallDebug(3, "[Frostfall] I Switched races and registered for swimming animation events!  SoundPlay.FSTSwimSwim:" + bReg1 + ", MTState:" + bReg2)
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	FrostfallDebug(3, "[Frostfall] Received animation event " + asEventName)
	if asEventName == "SoundPlay.FSTSwimSwim"
		_DE_SwimState.SetValue(1)
		HandleSwimming()
	elseif asEventName == "MTState"
		while bProcessingSwimming == true
			FrostfallDebug(3, "[Frostfall] Queuing not swimming state change...")
			utility.wait(0.1)
		endwhile
		_DE_SwimState.SetValue(0)
		HandleNotSwimming()
	endif
endEvent

function SetSwimState(bool bIsSwimming)
	FrostfallDebug(3, "[Frostfall] Werewolf set swim state externally to " + bIsSwimming + ".")
	if bIsSwimming
		_DE_SwimState.SetValue(1)
		HandleSwimming()
	else
		while bProcessingSwimming == true
			FrostfallDebug(3, "[Frostfall] Queuing not swimming state change...")
			utility.wait(0.1)
		endwhile
		_DE_SwimState.SetValue(0)
		HandleNotSwimming()
	endif
endFunction

event OnUpdate()
	if _DE_SwimState.GetValueInt() == 0
		;do nothing
	else
		if Frostfall.bInInterior == true
		elseif Frostfall.pSetting_IsRunning == false
		elseif PlayerRef.HasEffectKeyword(_DE_WaterPotionKW)
		elseif Frostfall.bIsVampire == true
		else
			if Frostfall.pSetting_IsRunning == true && Frostfall.ShutdownState == false
				ApplyTempEffects()
			endif
		endif
		RegisterForSingleUpdate(3)
	endif
endEvent

function HandleSwimming()
	bProcessingSwimming = true
	;Player is soaking wet
	Frostfall.pWetPoints = 750.0
	
	;Remove visual effects while in water
	PlayerRef.RemoveSpell(_DE_WetState_Spell1)
	PlayerRef.RemoveSpell(_DE_WetState_Spell2)
	PlayerRef.RemoveSpell(_DE_WetState_Spell3)
	
	if Frostfall.bInInterior == true 						;do not affect the player inside
	elseif Frostfall.pSetting_IsRunning == false			;do not affect the player if Frostfall isn't running
	elseif PlayerRef.HasEffectKeyword(_DE_WaterPotionKW)	;do not affect the player when using the water potion
	elseif Frostfall.bIsVampire == true						;do not affect the player if a vampire
	else
		if Frostfall.pSetting_IsRunning == true && Frostfall.ShutdownState == false
			ApplyTempEffects()
		endif
	endif
	RegisterForSingleUpdate(3)
	bProcessingSwimming = false
endfunction

function HandleNotSwimming()
	PlayerRef.RemoveSpell(_DE_ColdWater_1)
	PlayerRef.RemoveSpell(_DE_ColdWater_2)
	PlayerRef.RemoveSpell(_DE_ColdWater_3)
	
	if Frostfall.pWetPoints >= 600.0
		if Frostfall.pSetting_IsRunning == true && Frostfall.ShutdownState == false
			if Frostfall.pSetting_EffectWetShader
				PlayerRef.AddSpell(_DE_WetState_Spell3, false)
			else
				PlayerRef.AddSpell(_DE_WetState_Spell3NoShader, false)
			endif
		else
			if Frostfall.pSetting_EffectWetShader
				PlayerRef.AddSpell(_DE_WetState_Spell3, false)
				utility.wait(6.0)
				PlayerRef.RemoveSpell(_DE_WetState_Spell3)
				Frostfall.pWetPoints = 0.0
			else
				PlayerRef.AddSpell(_DE_WetState_Spell3NoShader, false)
				utility.wait(6.0)
				PlayerRef.RemoveSpell(_DE_WetState_Spell3NoShader)
				Frostfall.pWetPoints = 0.0
			endif
		endif
	endif
endFunction

function ApplyTempEffects()
	bool bSapStamina = true
	if Compatibility.isSKYRELoaded
		if Game.GetPlayer().HasPerk(Compatibility.GlacialSwimmer)
			bSapStamina = false
		endif
	endif
	;Check temperature and apply effects as needed
	int iTemp = _DE_CurrentTemp.GetValueInt()
	int waterTemp = iTemp + 2		;Tweak to keep worst conditions out of Tundra (Whiterun) areas
	msgTimeDiff = (GameHour.GetValue() - LastWaterMessageTime)
	if waterTemp > 10
		if msgTimeDiff > 1.0
			_DE_WaterTemp1.Show()
			LastWaterMessageTime = GameHour.GetValue()
		endif
	elseif waterTemp <= 10 && waterTemp > 5
		if bSapStamina
			ApplyColdWaterSpell(_DE_ColdWater_1, 80.0, _DE_WaterTemp2)
		else
			ApplyColdWaterSpell(none, 80.0, _DE_WaterTemp2)
		endif
	elseif waterTemp <= 5 && waterTemp > 0
		if bSapStamina
			ApplyColdWaterSpell(_DE_ColdWater_2, 70.0, _DE_WaterTemp3)
		else
			ApplyColdWaterSpell(none, 70.0, _DE_WaterTemp3)
		endif
	elseif waterTemp < 0
		if bSapStamina
			ApplyColdWaterSpell(_DE_ColdWater_3, 60.0, _DE_WaterTemp4)
		else
			ApplyColdWaterSpell(_DE_ColdWater_3_Perk, 60.0, _DE_WaterTemp4)
		endif
	endif
endFunction

function ApplyColdWaterSpell(Spell akSpell = none, float fExposureDamage, message akMessage)
	if akSpell && akSpell as Spell
		if PlayerRef.HasSpell(akSpell) == false
			PlayerRef.AddSpell(akSpell, false)
		endif
	endif
	if _DE_ExposurePoints.GetValue() > fExposureDamage				;Damage the player's current EP
		_DE_ExposurePoints.SetValue(fExposureDamage)
	endif
	if msgTimeDiff > 1.0
		akMessage.Show()
		LastWaterMessageTime = GameHour.GetValue()
	endif
endFunction

function FrostfallDebug(int iClassification, string sDebugMessage)
	;1 = Primary exposure system messages.
	;2 = Quest state data
	;3 = Misc info
	;4 = Weather-related
	if _DE_EPDebug.GetValueInt() == iClassification
		debug.trace(sDebugMessage)
	endif
endFunction