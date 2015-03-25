scriptname _Camp_WoodHarvestScriptEFFECT extends ActiveMagicEffect

import debug
import utility
import math
import CampUtil

_Camp_Compatibility property Compatibility auto

Actor property PlayerRef auto
message property _Camp_WoodHarvestConfirmMsg auto
message property _Camp_WoodHarvestNoAxeConfirmMsg auto
message property _Camp_WoodHarvestErrorCombat auto
message property _Camp_WoodHarvestErrorNoTrees auto
message property _Camp_WoodHarvestErrorTooCold auto
message property _Camp_DeadwoodHarvestSuccess auto
message property _Camp_BranchHarvestSuccess auto
message property _DE_WoodHarvest_Stone auto
formlist property _Camp_Trees auto
formlist property woodChoppingAxes auto
MiscObject property _Camp_DeadwoodLog auto
MiscObject property _Camp_DeadwoodBranch auto
MiscObject property _DE_Rock auto
MiscObject property _DE_RockFrag auto
ImageSpaceModifier Property _Camp_FadeDown auto
ImageSpaceModifier Property _Camp_FadeUp auto
ImageSpaceModifier Property _Camp_Black auto
globalvariable property TimeScale auto
globalvariable property GameHour auto
;globalvariable property _DE_ExposurePoints auto
;globalvariable property _DE_CurrentTemp auto
Sound property _Camp_ChopWoodSM auto

;Axes
Weapon property _DE_StoneWarAxe auto

Event OnEffectStart(Actor akTarget, Actor akCaster)	
	;@TODO: Wrap in IsFrostfallLoaded	
	;if _DE_ExposurePoints.GetValue() <= 20.0
	;	_Camp_WoodHarvestErrorTooCold.Show()
	;	return
	;endif
	;@TODO: Wrap in IsFrostfallLoaded
	
	if PlayerRef.IsInCombat()
		_Camp_WoodHarvestErrorCombat.Show()
		return
	endif

	if Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_Trees, PlayerRef, 3000.0) != none
		if PlayerRef.GetItemCount(woodChoppingAxes) > 0
			int i = _Camp_WoodHarvestConfirmMsg.Show()
			if i == 0
				HarvestWood()
			endif
		else
			int i = _Camp_WoodHarvestNoAxeConfirmMsg.Show()
			if i == 0
				HarvestWoodNoAxe()
			endif
		endif
	else
		_Camp_WoodHarvestErrorNoTrees.Show()
	endif
endEvent

function HarvestWood()
	_Camp_FadeDown.Apply()
	Wait(1)
	_Camp_FadeDown.PopTo(_Camp_Black)
	AdvanceTime()

	Game.EnablePlayerControls()
	
	_Camp_ChopWoodSM.Play(PlayerRef)
	wait(1)
	_Camp_ChopWoodSM.Play(PlayerRef)
	wait(1)
	_Camp_ChopWoodSM.Play(PlayerRef)
	wait(1)
	_Camp_Black.PopTo(_Camp_FadeUp)

	GiveDeadwoodLogs()
	GiveDeadwoodBranches()
endFunction

function HarvestWoodNoAxe()
	_Camp_FadeDown.Apply()
	Wait(1)
	_Camp_FadeDown.PopTo(_Camp_Black)
	AdvanceTime()

	Game.EnablePlayerControls()
	
	wait(2)
	_Camp_Black.PopTo(_Camp_FadeUp)

	GiveDeadwoodBranches()
endFunction

function GiveDeadwoodLogs()
	int myHarvest = RandomInt(4, 8)

	if GetTrackedFollowerCount() > 0
		myHarvest += 2
	endif
	
	_Camp_DeadwoodHarvestSuccess.Show(myHarvest)
	PlayerRef.AddItem(_Camp_DeadwoodLog, myHarvest, true)
endFunction

function GiveDeadwoodBranches()
	int myHarvest = RandomInt(3, 7)

	if GetTrackedFollowerCount() > 0
		myHarvest += RandomInt(2, 4)
	endif
	
	_Camp_BranchHarvestSuccess.Show(myHarvest)
	PlayerRef.AddItem(_Camp_DeadwoodBranch, myHarvest, true)
	
	;float myStone = RandomFloat()
	;if _Camp_FollowerCount.GetValueInt() > 0
	;	myStone += 0.15
	;endif
	;if myStone >= 0.80
	;	_DE_WoodHarvest_Stone.Show()
	;	PlayerRef.AddItem(_DE_Rock, 1, true)
	;endif
endFunction

function AdvanceTime()
	;Advance time by 1 hour
	if GameHour.GetValue() <= 22.9
		GameHour.SetValue(GameHour.GetValue() + 1.0)
	else
		GameHour.SetValue(0.0)
	endif
	
	;@TODO: Wrap in IsFrostfallLoaded
	;/
	float myTemp = _DE_CurrentTemp.GetValue()
	
	if myTemp <= -15
		_DE_ExposurePoints.Mod(-20.0)
	elseif myTemp <= -10
		_DE_ExposurePoints.Mod(-15.0)
	elseif myTemp <= -5
		_DE_ExposurePoints.Mod(-10.0)
	elseif myTemp <= 0
		_DE_ExposurePoints.Mod(-5.0)
	endif
	
	if _DE_ExposurePoints.GetValue() < 20.0
		_DE_ExposurePoints.SetValue(20.0)
	endif
	/;
	;@TODO: Wrap in IsFrostfallLoaded
	
endFunction