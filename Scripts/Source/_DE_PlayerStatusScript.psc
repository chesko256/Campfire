scriptname _DE_PlayerStatusScript extends ActiveMagicEffect

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_PlayerStatusScript
; Attached To (EditorID)..: 
; Description ............: Drives the View Status window and all associated rank and suggestion logic.
; Author .................: Chesko
; Last Approved (version) : 2.0
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

import math
import debug

_DE_EPMonitor_1_6 property MainScript auto
_DE_ClothingMonitor_1_7 property EquipScript auto
PlayerVampireQuestScript property VampireQuestRef auto
_DE_Compatibility property Compatibility auto
MagicEffect property _DE_aaaArmorFFSelf_1 auto
MagicEffect property _DE_aaaArmorFFSelf_2 auto
MagicEffect property _DE_aaaArmorFFSelf_3 auto
MagicEffect property _DE_CloakState_Spell_BoundLesser auto
MagicEffect property _DE_CloakState_Spell_BoundGreater auto
message property _DE_PlayerStatusScreen_Rank1 auto
message property _DE_PlayerStatusScreen_Rank2 auto
message property _DE_PlayerStatusScreen_Rank3 auto
message property _DE_PlayerStatusScreen_Rank4 auto
message property _DE_PlayerStatusScreen_Rank5 auto
message property _DE_PlayerStatusScreen_Rank6 auto
message property _DE_PlayerStatusScreen_Rank7 auto
message property _DE_PlayerStatusScreen_RankVampire auto
message property _DE_PlayerStatusScreen_RankWerewolf auto
message property _DE_PlayerStatusScreen_Rank1_Positive auto
message property _DE_PlayerStatusScreen_Rank2_Positive auto
message property _DE_PlayerStatusScreen_Rank3_Positive auto
message property _DE_PlayerStatusScreen_Rank4_Positive auto
message property _DE_PlayerStatusScreen_Rank5_Positive auto
message property _DE_PlayerStatusScreen_Rank6_Positive auto
message property _DE_PlayerStatusScreen_Rank7_Positive auto
message property _DE_PlayerStatusScreen_RankVampire_Positive auto
message property _DE_PlayerStatusScreen_RankWerewolf_Positive auto
message property _DE_Rank1 auto
message property _DE_Rank2 auto
message property _DE_Rank3 auto
message property _DE_Rank4 auto
message property _DE_Rank5 auto
message property _DE_Rank6 auto
message property _DE_Rank7 auto
message property _DE_RankVampire auto
message property _DE_RankWerewolf auto
message property _DE_RankTips_Adaptation auto
message property _DE_RankTips_Axe auto
message property _DE_RankTips_ClothingMissing auto
message property _DE_RankTips_ClothingWarm auto
message property _DE_RankTips_FrostResist auto
message property _DE_RankTips_Misc auto
message property _DE_RankTips_Torch auto
message property _DE_PlayerStatusScreenHelp auto
GlobalVariable property _DE_ExposurePoints auto
GlobalVariable property _DE_fHands auto
GlobalVariable property _DE_fBody auto
GlobalVariable property _DE_fFeet auto
GlobalVariable property _DE_fHead auto
GlobalVariable property _DE_WellInsulatedApplied auto
GlobalVariable property _DE_ArmorPerk1Active auto
GlobalVariable property _DE_ArmorPerk2Active auto
GlobalVariable property _DE_ArmorPerk3Active auto
Actor property PlayerRef auto
Keyword property _DE_FoodBuffKeyword10 auto
Keyword property _DE_FoodBuffKeyword15 auto
Keyword property _DE_FoodBuffKeyword20 auto
Keyword property _DE_FoodBuffKeyword25 auto
Keyword property ActorTypeUndead auto
Keyword property ImmuneParalysis auto
Keyword property ActorTypeCreature auto
Spell property _DE_TorchState_Spell auto
Spell property _DE_CloakState_Spell auto
Spell property _DE_CloakState_Spell_Burlap auto
Spell property _DE_CloakState_Spell_Linen auto
Spell property _DE_CloakState_Spell_Hide auto
Spell property _DE_CloakState_Spell_Fur auto
Spell property _DE_TransmuteWood auto
Spell property _DE_FollowerSpell auto
formlist property _DE_Axes auto
light property Torch01 auto
Race property WerewolfBeastRace auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	ShowMenu()
endEvent

function ShowMenu()

	;Get Exposure Protection
	float myBodyRating
	if _DE_fBody.GetValue() != 0.1
		myBodyRating = _DE_fBody.GetValue()
	else
		myBodyRating = 0
	endif
	
	float myHandsRating = _DE_fHands.GetValue()
	float myFeetRating = _DE_fFeet.GetValue()
	float myHeadRating = _DE_fHead.GetValue()
	
	;messagebox("body " + myBodyRating + " hands " + myHandsRating + " feet " + myFeetRating + " head " + myHeadRating)
	
	;Calculate spell bonuses
	float mySpellRating = 0.0
	if PlayerRef.HasMagicEffect(_DE_aaaArmorFFSelf_1)			;Foxskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			mySpellRating += 0.3	
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			mySpellRating += 0.25
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			mySpellRating += 0.2
		else
			mySpellRating += 0.1
		endif
	elseif PlayerRef.HasMagicEffect(_DE_aaaArmorFFSelf_2)		;Wolfskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			mySpellRating += 0.6	
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			mySpellRating += 0.5
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			mySpellRating += 0.4
		else
			mySpellRating += 0.2
		endif
	elseif PlayerRef.HasMagicEffect(_DE_aaaArmorFFSelf_3)		;Bearskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			mySpellRating += 0.9	
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			mySpellRating += 0.75
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			mySpellRating += 0.6
		else
			mySpellRating += 0.3	
		endif
	endif

	float myRating = myBodyRating + myHandsRating + myFeetRating + myHeadRating + mySpellRating
	bool bHasWellInsulated = PlayerRef.HasPerk(Compatibility.WellInsulated) && _DE_WellInsulatedApplied.GetValueInt() == 2
	if bHasWellInsulated
		myRating *= 1.25
	endif
	
	if PlayerRef.GetRace().HasKeyword(ActorTypeCreature) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
		myRating = 6.0
		mySpellRating = 6.0
	endif

	float myTotalRating
	
	;What is the total rating amount given the player's settings?
	if EquipScript.pSetting_Armor == true
		myTotalRating = 275
	else
		myTotalRating = 225
	endif
	
	if myRating > myTotalRating
		myTotalRating = myRating
	endif
	
	;Get Exposure Resistance
	float myER = 0.0
	;Food
	if PlayerRef.HasEffectKeyword(_DE_FoodBuffKeyword10)
		myER += 5
	elseif PlayerRef.HasEffectKeyword(_DE_FoodBuffKeyword15)
		myER += 10
	elseif PlayerRef.HasEffectKeyword(_DE_FoodBuffKeyword20)
		myER += 10
	elseif PlayerRef.HasEffectKeyword(_DE_FoodBuffKeyword25)
		myER += 15
	endif
	;Torch
	if PlayerRef.HasSpell(_DE_TorchState_Spell)
		myER += 10
	endif
	;Cloak
	if PlayerRef.HasSpell(_DE_CloakState_Spell)
		myER += 10
	elseif PlayerRef.HasSpell( _DE_CloakState_Spell_Burlap)
		myER += 5
	elseif PlayerRef.HasSpell(_DE_CloakState_Spell_Linen)
		myER += 10
	elseif PlayerRef.HasSpell(_DE_CloakState_Spell_Hide)
		myER += 7
	elseif PlayerRef.HasSpell(_DE_CloakState_Spell_Fur)
		myER += 15
	elseif PlayerRef.HasMagicEffect(_DE_CloakState_Spell_BoundLesser)
		myER += 7
	elseif PlayerRef.HasMagicEffect(_DE_CloakState_Spell_BoundGreater)
		myER += 12
	endif

	if PlayerRef.HasSpell(_DE_FollowerSpell)
		myER += 5
	endif
	
	;Get Adaptation Bonus
	float myAdaptation
	
	if Compatibility.isSKYRELoaded
		int mySkill = PlayerRef.GetAV("Lockpicking") as int
		if mySkill >= 100
			myAdaptation = 10.0
		elseif mySkill <= 0
			myAdaptation = 0.0
		else
			myAdaptation = (Floor(mySkill / 10))
		endif
	else
		float pLevel = PlayerRef.GetLevel()
		if pLevel >= 50.0
			myAdaptation = 10.0
		else
			myAdaptation = (Floor(pLevel / 5))
		endif
	endif
	
	;myAdaptation *= 100
	;trace("My Adaptation = " + myAdaptation)
	myER += myAdaptation
	
	int myRank = GetRank(myBodyRating, myHandsRating, myFeetRating, myHeadRating, myTotalRating, myAdaptation)
	
	;messagebox("My rank = " + myRank)
	
	int ibutton
	float myEP
	
	if _DE_ExposurePoints.GetValueInt() > 120.0				;Don't show the player that it is greater than 120 - will self-correct next cycle
		myEP = 120
	else
		myEP = _DE_ExposurePoints.GetValueInt()
	endif
	
	if myRank == 9
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_RankWerewolf_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_RankWerewolf.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	elseif myRank == 8
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_RankVampire_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_RankVampire.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	elseif myRank == 7
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_Rank7_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_Rank7.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	elseif myRank == 6
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_Rank6_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_Rank6.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	elseif myRank == 5
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_Rank5_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_Rank5.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	elseif myRank == 4
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_Rank4_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_Rank4.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	elseif myRank == 3
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_Rank3_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_Rank3.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	elseif myRank == 2
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_Rank2_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_Rank2.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	elseif myRank == 1
		if myEP >= 100
			ibutton = _DE_PlayerStatusScreen_Rank1_Positive.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		else
			ibutton = _DE_PlayerStatusScreen_Rank1.Show(myEP - 100, (MainScript.pWetPoints/750) * 100, (myRating * 100), myTotalRating, (mySpellRating * 100), PlayerRef.GetAV("FrostResist"), myER)
		endif
	endif
	
	if ibutton == 0
		ShowHelp()
	elseif ibutton == 1
		ShowRank(myRank, myBodyRating, myHandsRating, myFeetRating, myHeadRating, myRating, myAdaptation)
	elseif ibutton == 2
		;exit
	endif
	
endFunction

int function GetRank(float myBodyRating, float myHandsRating, float myFeetRating, float myHeadRating, float myRating, float myAdaptation)

	int myRank
	float myRankPoints = 0.0
	int bodypoints = 0
	int handspoints = 0
	int feetpoints = 0
	int headpoints = 0
	float myFrostPoints = 0.0
	
	
	bool bIsVampire = GetVampirismState()
	if bIsVampire
		return 8
	endif

	if PlayerRef.GetRace().HasKeyword(ActorTypeCreature) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
		return 9
	endif
	
	;Player is not a vampire or werewolf, continue
	;Adaptation rank points
	myRankPoints += myAdaptation
	
	;Clothing rank points
	if EquipScript.pSetting_Armor == true
		if myBodyRating == 1.75
			bodypoints = 10
		elseif myBodyRating == 1.25
			bodypoints = 5
		elseif myBodyrating == 0.75
			bodypoints = 3		
		endif
		
		if myHandsRating == 0.25
			handspoints = 5
		elseif myHandsRating == 0.12
			handspoints = 3
		elseif myHandsRating == 0.05
			handspoints = 1
		endif
		
		if myFeetRating == 0.25
			feetpoints = 5
		elseif myFeetRating == 0.13
			feetpoints = 3
		elseif myFeetRating == 0.05
			feetpoints = 1
		endif
		
		if myHeadRating == 0.5
			headpoints = 5
		elseif myHeadRating == 0.35
			headpoints = 3
		elseif myHeadRating == 0.15
			headpoints = 1
		endif
		
	else
		if myBodyRating > 0
			bodypoints = 10
		endif
		if myHandsRating > 0
			handspoints = 5
		endif
		if myFeetRating > 0
			feetpoints = 5
		endif
		if myHeadRating > 0
			headpoints = 5
		endif
	endif
	
	;Add up clothing rank points
	int myGearPoints = bodypoints + headpoints + feetpoints + handspoints
	myRankPoints += myGearPoints
	
	if PlayerRef.GetItemCount(_DE_Axes) > 0 || PlayerRef.HasSpell(_DE_TransmuteWood)
		myRankPoints += 10
	endif
	
	if PlayerRef.GetItemCount(Torch01) > 0
		myRankPoints += 5
	endif
	
	float PlayerFR = PlayerRef.GetAV("FrostResist")
	
	if PlayerFR >= 0.5
		myRankPoints += 10
	else
		myRankPoints += (PlayerFR * 100) / 5
	endif
	
	;trace("[Frostfall] Rank Points: " + myRankPoints)
	
	if myRankPoints == 60.0
		myRank = 7
	elseif myRankPoints < 60.0 && myRankPoints >= 51.0
		myRank = 6
	elseif myRankPoints < 51.0 && myRankPoints >= 41.0
		myRank = 5
	elseif myRankPoints < 41.0 && myRankPoints >= 31.0
		myRank = 4
	elseif myRankPoints < 31.0 && myRankPoints >= 21.0
		myRank = 3
	elseif myRankPoints < 21.0 && myRankPoints >= 11.0
		myRank = 2
	elseif myRankPoints < 11.0
		myRank = 1
	endif
	
	;messagebox("myRankPoints = " + myRankPoints)
	
	return myRank
	
endFunction



function ShowHelp()
	int ibutton = _DE_PlayerStatusScreenHelp.Show()
	if ibutton == 0
		ShowMenu()
	endif
endFunction

function ShowRank(int iRank, float myBodyRating, float myHandsRating, float myFeetRating, float myHeadRating, float myRating, float myAdaptation)
	
	int ibutton
	if iRank == 9
		ibutton = _DE_RankWerewolf.Show()
	elseif iRank == 8
		ibutton = _DE_RankVampire.Show()
	elseif iRank == 7
		ibutton = _DE_Rank7.Show()
	elseif iRank == 6
		ibutton = _DE_Rank6.Show()
	elseif iRank == 5
		ibutton = _DE_Rank5.Show()
	elseif iRank == 4
		ibutton = _DE_Rank4.Show()
	elseif iRank == 3
		ibutton = _DE_Rank3.Show()
	elseif iRank == 2
		ibutton = _DE_Rank2.Show()
	elseif iRank == 1
		ibutton = _DE_Rank1.Show()
	endif
	
	if iRank >= 8
		if ibutton == 0
			ShowMenu()
		endif
	else
		if ibutton == 0
			DisplayTips(myBodyRating, myHandsRating, myFeetRating, myHeadRating, myRating, myAdaptation)
		elseif ibutton == 1
			ShowMenu()
		endif
	endif
	
endFunction

function DisplayTips(float myBodyRating, float myHandsRating, float myFeetRating, float myHeadRating, float myRating, float myAdaptation)
	
	;messagebox("myrating = " + myRating)
	
	;Show clothing tips
	if myBodyRating > 0.1 && myHandsRating > 0.0 && myFeetRating > 0.0 && myHeadRating > 0.0
		if EquipScript.pSetting_Armor == true
			if myRating < 2.75
				_DE_RankTips_ClothingWarm.Show()
			endif
		endif
	else
		_DE_RankTips_ClothingMissing.Show()
	endif
	
	;Show Axe tip
	if PlayerRef.GetItemCount(_DE_Axes) < 1 && !PlayerRef.HasSpell(_DE_TransmuteWood)
		_DE_RankTips_Axe.Show()
	endif
	
	;Show adaptation tip
	if myAdaptation < 5
		_DE_RankTips_Adaptation.Show()
	endif
	
	;Show torch tip
	if PlayerRef.GetItemCount(Torch01) < 1
		_DE_RankTips_Torch.Show()
	endif
	
	;Show frost resist tip
	if PlayerRef.GetAV("FrostResist") < 0.5
		_DE_RankTips_FrostResist.Show()
	endif
	
	;Show misc tips
	_DE_RankTips_Misc.Show()
	
	ShowMenu()
	
endFunction

bool function GetVampirismState()					;Approved 2.0

	if MainScript.pSetting_VampireImmunity
		bool bIsVampire = false
		if PlayerRef.GetRace().HasKeyword(ActorTypeUndead)
			return true
		else
			return false
		endif
	else
		return false
	endif
endFunction