Scriptname _DE_ColdWaterNearDeath extends activemagiceffect  

_DE_Compatibility property Compatibility auto
_DE_EPMonitor_1_6 property Frostfall auto
Keyword property _DE_WaterPotionKW auto
Actor property PlayerRef auto
Spell property _DE_ColdWater_3 auto
Spell property _DE_ColdWater_3_Perk auto
Spell property _DE_ColdWater_Death auto
imagespacemodifier property DismayingShoutImod auto
GlobalVariable property _DE_SwimState auto
GlobalVariable property _DE_Setting_Water auto
GlobalVariable property _DE_Setting_ConditionMsg auto
GlobalVariable property _DE_Setting_ForceFeedback auto
message property _DE_WaterTemp4a auto
message property _DE_WaterTemp4b auto
message property _DE_WaterTemp4c auto
int iUpdate = 0
int iSurvivalTime
int GlacialPerkFactor = 1
int AdaptationFactor = 0

import utility
import math

bool bMessage3Shown = false
bool bMessage2Shown = false
bool bMessage1Shown = false
bool bOddBeat = true


Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	if Compatibility.isSKYRELoaded
		if PlayerRef.HasPerk(Compatibility.GlacialSwimmer)
			GlacialPerkFactor = 2
		else
			GlacialPerkFactor = 1
		endif
	else
		GlacialPerkFactor = 1
	endif
	
	AdaptationFactor = GetConditioningSwimming()
	
	iSurvivalTime = (30 * GlacialPerkFactor) + AdaptationFactor
	;debug.notification("Survival time = " + iSurvivalTime)
	if Frostfall.pSetting_FullScreenEffects
		if !(PlayerRef.HasSpell(_DE_ColdWater_Death))
			DismayingShoutImod.Apply(3)
		endif
	endif
	if _DE_Setting_ForceFeedback.GetValueInt() == 2
		if !(PlayerRef.HasSpell(_DE_ColdWater_Death))
			ForceFeedbackQuick()
		endif
	endif
	if _DE_Setting_Water.GetValueInt() == 2
		iUpdate = 0
		bMessage3Shown = false
		bMessage2Shown = false
		bMessage1Shown = false
		RegisterForSingleUpdate(1)
	endif
	
endEvent

event OnEffectFinish(Actor akTarget, Actor akCaster)
	iUpdate = 0
	bMessage3Shown = false
	bMessage2Shown = false
	bMessage1Shown = false
endEvent

Event OnUpdate()

	float fPercentage = (iUpdate as float)/(iSurvivalTime as float)
	
	if _DE_SwimState.GetValueInt() == 1
		
		if PlayerRef.HasEffectKeyword(_DE_WaterPotionKW)
			RegisterForSingleUpdate(1.0)
			return
		endif
		
		if fPercentage >= 1.0
			PlayerRef.RemoveSpell(_DE_ColdWater_3)
			PlayerRef.RemoveSpell(_DE_ColdWater_3_Perk)
			bool bRescue = Frostfall.RescuePlayer(true)
			if !bRescue
				PlayerRef.AddSpell(_DE_ColdWater_Death)	
			endif
			
		elseif fPercentage >= 0.83
			if _DE_Setting_ConditionMsg.GetValueInt() == 2
				if !bMessage3Shown
					_DE_WaterTemp4c.Show()					;(25s)You can't feel anything. Darkness engulfs your mind.
					bMessage3Shown = true
				endif
			endif
			if bOddBeat
				ForceFeedback(fPercentage)
				bOddBeat = false
				RegisterForSingleUpdate(0.4)
			else
				bOddBeat = true
				RegisterForSingleUpdate(1.0)
			endif
		elseif fPercentage >= 0.66
			if _DE_Setting_ConditionMsg.GetValueInt() == 2
				if !bMessage2Shown
					_DE_WaterTemp4b.Show()					;(20s)You feel your consciousness slipping.
					bMessage2Shown = true
				endif
			endif
			if bOddBeat
				ForceFeedback(fPercentage)
				bOddBeat = false
				RegisterForSingleUpdate(0.4)
			else
				bOddBeat = true
				RegisterForSingleUpdate(1.0)
			endif
		elseif fPercentage >= 0.33
			if _DE_Setting_ConditionMsg.GetValueInt() == 2
				if !bMessage1Shown
					_DE_WaterTemp4a.Show()					;(10s)Your limbs begin to feel numb.
					bMessage1Shown = true
				endif
			endif
			ForceFeedback(fPercentage)
			RegisterForSingleUpdate(0.6)
		else
			ForceFeedback(fPercentage)
			RegisterForSingleUpdate(0.8)
		endif
	else
		PlayerRef.RemoveSpell(_DE_ColdWater_3)
		PlayerRef.RemoveSpell(_DE_ColdWater_3_Perk)
	endif

	iUpdate += 1
	
endEvent

function ForceFeedbackQuick()
	Game.ShakeController(1.0, 1.0, 1.0)
endFunction

function ForceFeedback(float fPercentage)
	if _DE_Setting_ForceFeedback.GetValueInt() == 2
		if !(PlayerRef.HasSpell(_DE_ColdWater_Death))
			if fPercentage >= 1.0
				;no feedback
			elseif fPercentage >= 0.83
				Game.ShakeController(0.0, 0.8, 0.3)
				wait(0.6)
				;Game.ShakeController(0.6, 0.5, 0.2)
			elseif fPercentage >= 0.66
				Game.ShakeController(0.6, 0.0, 0.3)
				wait(0.6)
				Game.ShakeController(0.7, 0.8, 0.2)
			elseif fPercentage >= 0.33
				Game.ShakeController(0.7, 0.0, 0.2)
				wait(0.4)
				Game.ShakeController(0.8, 0.9, 0.2)
			else
				Game.ShakeController(0.8, 0.0, 0.2)
				wait(0.2)
				Game.ShakeController(1.0, 1.0, 0.2)
			endif
		endif
	else
		if !(PlayerRef.HasSpell(_DE_ColdWater_Death))
			if fPercentage >= 1.0
				;nothing
			elseif fPercentage >= 0.83
				wait(0.6)
			elseif fPercentage >= 0.66
				wait(0.6)
			elseif fPercentage >= 0.33
				wait(0.4)
			else
				wait(0.2)
			endif
		endif
	endif
endFunction

int function GetConditioningSwimming()
	
	int myConditioning
	
	if Compatibility.isSKYRELoaded
		int mySkill = PlayerRef.GetAV("Lockpicking") as int
		if mySkill >= 100
			myConditioning = 30
		elseif mySkill <= 0
			myConditioning = 0
		else
			myConditioning = (Floor(mySkill / 10)) * 3
		endif
	else
		int pLevel = PlayerRef.GetLevel()
		if pLevel >= 50
			myConditioning = 30
		else
			myConditioning = (Floor(pLevel / 5)) * 3
		endif
	endif
	
	return myConditioning
	
endFunction