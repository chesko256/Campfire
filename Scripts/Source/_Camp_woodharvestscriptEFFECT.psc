scriptname _Camp_WoodHarvestScriptEFFECT extends ActiveMagicEffect

import debug
import utility
import math
import CampUtil

_Camp_Compatibility property Compatibility auto
_Camp_ConditionValues property Conditions auto

Actor property PlayerRef auto
message property _Camp_WoodHarvestConfirmMsg auto
message property _Camp_WoodHarvestErrorCombat auto
message property _Camp_WoodHarvestErrorNoTrees auto
message property _Camp_WoodHarvestErrorTooCold auto
message property _Camp_DeadwoodHarvestSuccess auto
message property _Camp_BranchHarvestSuccess auto
message property _Camp_WoodHarvest_Stone auto
message property _Camp_StoneError auto
formlist property _Camp_Trees auto
formlist property woodChoppingAxes auto
MiscObject property _Camp_DeadwoodLog auto
MiscObject property _Camp_DeadwoodBranch auto
MiscObject property _Camp_Rock auto
ImageSpaceModifier Property _Camp_FadeDown auto
ImageSpaceModifier Property _Camp_FadeUp auto
ImageSpaceModifier Property _Camp_Black auto
globalvariable property TimeScale auto
globalvariable property GameHour auto
Sound property _Camp_ChopWoodSM auto

;Axes
Weapon property _Camp_StoneWarAxe auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if Compatibility.IsFrostfallLoaded && !FrostUtil.IsWarmEnoughToHarvestWood()
		return
	endif
	
	if PlayerRef.IsInCombat()
		_Camp_WoodHarvestErrorCombat.Show()
		return
	endif

	if Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_Trees, PlayerRef, 3000.0) != none
		Conditions.TreesAreNearby = true
	else
		Conditions.TreesAreNearby = false
		_Camp_WoodHarvestErrorNoTrees.Show()
	endif

	int i = _Camp_WoodHarvestConfirmMsg.Show()
	if i == 0
		HarvestWood()
	elseif i == 1
		HarvestBranches()
	elseif i == 2
		HarvestStone()
	else
		;pass
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

	if PlayerRef.GetItemCount(woodChoppingAxes) > 0
		; Favor using this instead of stone axe
	elseif PlayerRef.GetItemCount(_Camp_StoneWarAxe) > 0
		PlayerRef.RemoveItem(_Camp_StoneWarAxe, 1)
	endif
endFunction

function HarvestBranches()
	_Camp_FadeDown.Apply()
	Wait(1)
	_Camp_FadeDown.PopTo(_Camp_Black)
	AdvanceTime()

	Game.EnablePlayerControls()
	
	wait(2)
	_Camp_Black.PopTo(_Camp_FadeUp)

	GiveDeadwoodBranches()
endFunction

function HarvestStone()
	_Camp_FadeDown.Apply()
	Wait(1)
	_Camp_FadeDown.PopTo(_Camp_Black)
	AdvanceTime()

	Game.EnablePlayerControls()

	wait(2)
	_Camp_Black.PopTo(_Camp_FadeUp)

	float stone_roll = RandomFloat(0.1, 1.0)
	if stone_roll < 0.7
		_Camp_WoodHarvest_Stone.Show()
		PlayerRef.AddItem(_Camp_Rock, 1, true)
	else
		_Camp_StoneError.Show()
	endif
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
	int myHarvest = RandomInt(3, 6)

	if GetTrackedFollowerCount() > 0
		myHarvest += 2
	endif
	
	_Camp_BranchHarvestSuccess.Show(myHarvest)
	PlayerRef.AddItem(_Camp_DeadwoodBranch, myHarvest, true)
endFunction

function AdvanceTime()
	;Advance time by 1 hour
	if GameHour.GetValue() <= 22.9
		GameHour.SetValue(GameHour.GetValue() + 1.0)
	else
		GameHour.SetValue(0.0)
	endif
	if Compatibility.IsFrostfallLoaded
		FrostUtil.Event_LegacyWoodHarvest()
	endif	
endFunction