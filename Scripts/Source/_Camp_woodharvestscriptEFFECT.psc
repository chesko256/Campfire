scriptname _Camp_WoodHarvestScriptEFFECT extends ActiveMagicEffect

import debug
import utility
import math
import CampUtil
import _CampInternal

_Camp_Compatibility property Compatibility auto
_Camp_ConditionValues property Conditions auto

Actor property PlayerRef auto
message property _Camp_WoodHarvestConfirmMsg auto
message property _Camp_WoodHarvestErrorCombat auto
message property _Camp_WoodHarvestErrorNoTrees auto
message property WoodChoppingFailureMessage auto
message property _Camp_WoodHarvestErrorTooCold auto
message property _Camp_DeadwoodHarvestSuccess auto
message property _Camp_BranchHarvestSuccess auto
message property _Camp_WoodHarvest_Stone auto
formlist property _Camp_Trees auto
formlist property woodChoppingAxes auto
MiscObject property _Camp_DeadwoodLog auto
MiscObject property _Camp_DeadwoodBranch auto
ImageSpaceModifier Property _Camp_FadeDown auto
ImageSpaceModifier Property _Camp_FadeUp auto
ImageSpaceModifier Property _Camp_Black auto
globalvariable property TimeScale auto
globalvariable property GameHour auto
globalvariable property _Camp_PerkRank_Resourceful auto
globalvariable property _Camp_HarvestWoodEnabled auto
Sound property _Camp_ChopWoodSM auto
Sound property _Camp_GatherBranchesSM auto
VisualEffect property _Camp_ForceBlackVFX auto

;Axes
Weapon property _Camp_StoneWarAxe auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if _Camp_HarvestWoodEnabled.GetValueInt() != 2
		return
	endif

	if Compatibility.isFrostfallLoaded && !FrostUtil.IsWarmEnoughToHarvestWood()
		return
	endif
	
	if PlayerRef.IsInCombat()
		_Camp_WoodHarvestErrorCombat.Show()
		return
	endif

	if !PlayerCanPlaceObjects()
		return
	endif

	if Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_Trees, PlayerRef, 3000.0) != none
		Conditions.TreesAreNearby = true
	else
		Conditions.TreesAreNearby = false
		_Camp_WoodHarvestErrorNoTrees.Show()
		return
	endif

	int i = _Camp_WoodHarvestConfirmMsg.Show()
	if i == 0
		HarvestWood()
	elseif i == 1
		HarvestBranches()
	else
		;pass
	endif
endEvent

function HarvestWood()
	if PlayerRef.GetItemCount(woodChoppingAxes) == 0 && PlayerRef.GetItemCount(_Camp_StoneWarAxe) == 0
		WoodChoppingFailureMessage.Show()
		OnEffectStart(PlayerRef, PlayerRef)
		return
	endif
	_Camp_FadeDown.Apply()
	Wait(1)
	_Camp_ForceBlackVFX.Play(PlayerRef)
	_Camp_FadeDown.PopTo(_Camp_Black)
	
	AdvanceTime()

	Game.EnablePlayerControls()
	
	int id = _Camp_ChopWoodSM.Play(PlayerRef)
	Sound.SetInstanceVolume(id, 0.3)
	wait(1)
	id = _Camp_ChopWoodSM.Play(PlayerRef)
	Sound.SetInstanceVolume(id, 0.3)
	wait(1)
	id = _Camp_ChopWoodSM.Play(PlayerRef)
	Sound.SetInstanceVolume(id, 0.3)
	wait(1)
	_Camp_ForceBlackVFX.Stop(PlayerRef)
	_Camp_Black.PopTo(_Camp_FadeUp)

	if PlayerRef.GetItemCount(woodChoppingAxes) > 0
		GiveDeadwoodLogs()
	elseif PlayerRef.GetItemCount(_Camp_StoneWarAxe) > 0
		GiveDeadwoodLogs(true)
	endif
endFunction

function HarvestBranches()
	_Camp_FadeDown.Apply()
	Wait(1)
	_Camp_ForceBlackVFX.Play(PlayerRef)
	_Camp_FadeDown.PopTo(_Camp_Black)

	AdvanceTime()

	Game.EnablePlayerControls()

	int id = _Camp_GatherBranchesSM.Play(PlayerRef)
	Sound.SetInstanceVolume(id, 0.8)
	wait(1)
	id = _Camp_GatherBranchesSM.Play(PlayerRef)
	Sound.SetInstanceVolume(id, 0.8)
	wait(1)
	id = _Camp_GatherBranchesSM.Play(PlayerRef)
	Sound.SetInstanceVolume(id, 0.8)
	wait(1)
	_Camp_ForceBlackVFX.Stop(PlayerRef)
	_Camp_Black.PopTo(_Camp_FadeUp)

	GiveDeadwoodBranches()
endFunction

function GiveDeadwoodLogs(bool abUsingStoneAxe = false)
	int myHarvest
	if abUsingStoneAxe
		myHarvest = RandomInt(2, 4)
	else
		myHarvest = RandomInt(3, 6)
	endif

	if _Camp_PerkRank_Resourceful.GetValueInt() > 0
		int i = myHarvest
		while i > 0
			if Utility.RandomFloat() <= _Camp_PerkRank_Resourceful.GetValueInt() * 0.25
				myHarvest += 1
			endif
			i -= 1
		endWhile
	endif

	int follower_harvest = 0
	if GetTrackedFollowerCount() > 0
		follower_harvest = RandomInt(0, 2)
	endif
	
	string follower_string
	if follower_harvest > 0
		_Camp_Strings str = GetCampfireStrings()
		string fname = PickRandomFollowerOrAnimal()
		if follower_harvest == 1
			follower_string = fname + str.Follower_gathered + follower_harvest + str.FollowerHarvestDeadwood
		elseif follower_harvest > 1
			follower_string = fname + str.Follower_gathered + follower_harvest + str.FollowerHarvestDeadwoodPlural
		endif
	endif

	_Camp_DeadwoodHarvestSuccess.Show(myHarvest)
	if follower_harvest > 0
		myHarvest += follower_harvest
		debug.notification(follower_string)
	endif
	PlayerRef.AddItem(_Camp_DeadwoodLog, myHarvest, true)
endFunction

function GiveDeadwoodBranches()
	int myHarvest = RandomInt(3, 6)

	if _Camp_PerkRank_Resourceful.GetValueInt() > 0
		int i = myHarvest
		while i > 0
			if Utility.RandomFloat() <= _Camp_PerkRank_Resourceful.GetValueInt() * 0.25
				myHarvest += 1
			endif
			i -= 1
		endWhile
	endif

	int follower_harvest = 0
	if GetTrackedFollowerCount() > 0 || GetTrackedAnimalCount() > 0
		follower_harvest = RandomInt(0, 2)
	endif

	string follower_string
	if follower_harvest > 0
		_Camp_Strings str = GetCampfireStrings()
		string fname = PickRandomFollowerOrAnimal()
		if follower_harvest == 1
			follower_string = fname + str.Follower_gathered + follower_harvest + str.FollowerHarvestBranches
		elseif follower_harvest > 1
			follower_string = fname + str.Follower_gathered + follower_harvest + str.FollowerHarvestBranchesPlural
		endif
	endif
	
	_Camp_BranchHarvestSuccess.Show(myHarvest)
	if follower_harvest > 0
		myHarvest += follower_harvest
		debug.notification(follower_string)
	endif
	PlayerRef.AddItem(_Camp_DeadwoodBranch, myHarvest, true)
endFunction

function AdvanceTime()
	;Advance time by 30 minutes
	if GameHour.GetValue() <= 22.9
		GameHour.SetValue(GameHour.GetValue() + 0.5)
	else
		GameHour.SetValue(23.999999)
	endif
	if Compatibility.IsFrostfallLoaded
		FrostUtil.Event_LegacyWoodHarvest()
	endif	
endFunction

string function PickRandomFollowerOrAnimal()
	if !Compatibility.isSKSELoaded
		if GetTrackedFollowerCount() > 0
			return GetCampfireStrings().FollowerNameGeneric
		else
			return GetCampfireStrings().AnimalNameGeneric
		endif
	endif
	string[] tmp = new String[4]
	int i = 1
	int j = 0
	while i <= 3
		Actor af = GetTrackedFollower(i)
		if af
			tmp[j] = af.GetBaseObject().GetName()
			j += 1
		endif
		i += 1
	endWhile
	Actor aa = GetTrackedAnimal()
	if aa
		tmp[j] = aa.GetBaseObject().GetName()
	endif
	int len = tmp.Find("") - 1
	
	return tmp[Utility.RandomInt(0, len)]
endFunction