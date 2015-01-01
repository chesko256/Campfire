Scriptname _DE_EPMonitor_1_6 extends Quest conditional

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_EPMonitor_1_6
; Attached To (EditorID)..: Quest _DE_Main_1_6
; Description ............: The main script. Controls Exposure Point mechanic. Monitors weather and player state.
; Author .................: Chesko
; Last Approved (version) : 2.6
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

import debug
import utility
import math

;#Region PROPERTIES=====================================================================================================================
;#Settings=====================================================================
float property pSetting_ExposureRate = 1.0 auto hidden
bool property pSetting_FastTravelDisable = false auto hidden
bool property pSetting_NoWait = false auto hidden
bool property pSetting_CombatDisable = true auto hidden
bool property pSetting_IsRunning = false auto hidden
bool property pSetting_FastTravelProcessing = true auto hidden
bool property pSetting_Tutorials = true auto hidden
bool property pSetting_EffectFrostShader = true auto hidden
bool property pSetting_EffectWetShader = true auto hidden
bool property pSetting_MovementPenalty = true auto hidden
bool property pSetting_DynamicCampfires = true auto hidden
bool property pSetting_Help = true auto hidden
bool property pSetting_FullScreenEffects = true auto hidden
bool property pSetting_PlayerDeath = true auto hidden
bool property pSetting_MsgWeather = true auto hidden
bool property pSetting_VampireImmunity = true auto hidden
bool property ShutdownState = false auto hidden

;#ActiveMagicEffects===========================================================
MagicEffect property _DE_aaaArmorFFSelf_1 auto
MagicEffect property _DE_aaaArmorFFSelf_2 auto
MagicEffect property _DE_aaaArmorFFSelf_3 auto

;#Actors=======================================================================
Actor property pPlayer auto

;#Books========================================================================
book property _DE_SurvivorsGuide auto


;#Animation and SFX============================================================
Idle property IdleWarmHandsCrouched auto
Idle property IdleWarmHandsStanding auto
Idle property IdleStop_Loose auto
FormList property _DE_SmallFires auto
Sound property _DE_Female_FreezingSM auto
Sound property _DE_Female_FreezingToDeathSM auto
Sound property _DE_Male_FreezingSM auto
Sound property _DE_Male_FreezingToDeathSM auto

;#Global Variables=============================================================
GlobalVariable property _DE_fExtremeTemp auto
GlobalVariable property _DE_fExtremeMult auto
GlobalVariable property _DE_fStasisTemp auto
GlobalVariable property _DE_fStasisMult auto
GlobalVariable property GameHour auto
GlobalVariable Property TimeScale  Auto 
GlobalVariable Property _DE_ExposurePoints Auto 
{Exposure Points value.}
GlobalVariable property _DE_BadWeather auto
{0 = clear. 1 = mild rain. 2 = severe rain. 3 = mild snow. 4 = severe snow.}
GlobalVariable property _DE_SwimState auto
{0 = not swimming, 1 = swimming.}
GlobalVariable property _DE_EPDebug auto
{1 = debug output on. 0 = off.}
GlobalVariable property _DE_CurrentTemp auto
GlobalVariable property _DE_fShelterTime auto
GlobalVariable property _DE_HasWaterSkin auto
{Whether or not the player has a waterskin from Last Seed.}
GlobalVariable property _DE_InHotArea auto
{2 = In an area governed by Sun's Height.}
GlobalVariable property _DE_Setting_DialogueStop auto
GlobalVariable property _DE_Setting_Help auto
GlobalVariable property _DE_Setting_ConditionMsg auto
GlobalVariable property _DE_Setting_Animation auto
GlobalVariable property _DE_Setting_SoundEffects auto
GlobalVariable property _DE_Setting_ForceFeedback auto
GlobalVariable property _DE_Setting_SystemMsg auto
GlobalVariable property _DE_fBody auto
GlobalVariable property _DE_fHead auto
GlobalVariable property _DE_fHands auto
GlobalVariable property _DE_fFeet auto
GlobalVariable property _DE_WellInsulatedApplied auto
GlobalVariable property StartFrostfall auto
GlobalVariable property _DE_SKSEVersion auto
GlobalVariable property _DE_CampsitePlacementOn auto
GlobalVariable property _DE_DialogueState auto
GlobalVariable property _DE_NearSmallFire auto
GlobalVariable property _DE_HotkeyWeathersense auto
GlobalVariable property _DE_HotkeySurvivalSkills auto
GlobalVariable property _DE_ArmorPerk1Active auto
GlobalVariable property _DE_ArmorPerk2Active auto
GlobalVariable property _DE_ArmorPerk3Active auto
GlobalVariable property _DE_ShelterState auto
GlobalVariable property _DE_WarmingHandsToggle auto

;#Magic Effects================================================================
MagicEffect property _DE_CloakState_Spell_BoundLesser auto
MagicEffect property _DE_CloakState_Spell_BoundGreater auto

;#Quests=======================================================================
Quest property _DE_Main_1_6 auto
Quest property CompatibilityQuest auto
Quest property _DE_TrackingQuest auto
Quest property _DE_LightableFiresQuest auto

;#Reference Aliases============================================================
ReferenceAlias property Alias_DE_Player auto
ReferenceAlias property _DE_CompatibilityPlayer auto

;#Scripts======================================================================
_DE_Compatibility property Compatibility auto
PlayerVampireQuestScript property VampireQuestRef auto
_DE_ShelterDetectQuestScript property ShelterQuest auto
_DE_ClothingMonitor_1_7 property FrostfallArmor auto

;#FormLists====================================================================
FormList property _DE_HeatSources auto
{Form list that stores the list of objects designated as heat sources.}
FormList property _DE_OtherHeatSources auto
{Form list that stores the list of objects designated as heat sources that are not fires.}
FormList property _DE_FastTravelExceptions auto
{Form list that stores the list of objects designated as fast travel exceptions (i.e. Carriages).}
FormList property _DE_HeatSources_Big auto
{Form list that stores the list of objects designated as "big" heat sources.}
FormList property _DE_HeatSources_Med auto
{Form list that stores the list of objects designated as "medium" heat sources.}
FormList property _DE_SleepObjects auto
{Form list that stores the list of objects designated as exterior beds.}
Formlist property _DE_SevereWeatherList auto
FormList property _DE_OvercastWeatherList auto
Formlist property _DE_Axes auto
Formlist property _DE_WorldspacesExteriorPineForest auto
Formlist property _DE_WorldspacesExteriorVolcanicTundra auto
Formlist property _DE_WorldspacesExteriorFallForest auto
Formlist property _DE_WorldspacesExteriorWhiterun auto
Formlist property _DE_WorldspacesExteriorTundraMarsh auto
Formlist property _DE_WorldspacesExteriorCoast auto
Formlist property _DE_WorldspacesExteriorSnowy auto
Formlist property _DE_WorldspacesExteriorOblivion auto
Formlist property _DE_WorldspacesInteriors auto
Formlist property _DE_SmallHideTents auto
Formlist property _DE_LargeHideTents auto
Formlist property _DE_SmallLeatherTents auto
Formlist property _DE_LargeLeatherTents auto
Formlist property _DE_ExposureExceptions auto
FormList property _DE_Waterfalls auto
FormList property _DE_ModWaterSkins auto

;#Messages=====================================================================
message property _DE_HypoState_0a auto
message property _DE_HypoState_0 auto
message property _DE_HypoState_1 auto
message property _DE_HypoState_2 auto
message property _DE_HypoState_3 auto
message property _DE_HypoState_4 auto
message property _DE_HypoState_5 auto
message property _DE_WetStateMsg_Wet1 auto
{Damp.}
message property _DE_WetStateMsg_Wet2 auto
{Wet.}
message property _DE_WetStateMsg_Wet3 auto
{Soaked.}
message property _DE_WetStateMsg_Dry auto
message property _DE_WarmUp auto
message property _DE_TravelOn auto
;Help System
message property _DE_Help_ExposurePoints auto
message property _DE_Help_Vampirism auto
message property _DE_Help_Wet auto
message property _DE_Help_SurvivalSkills auto

message property _DE_BookMenu_FirstTime auto
message property _DE_BookMenu_FirstTime2 auto
message property _DE_BookMenu_FirstTime3 auto

message property _DE_Weather_BlizzardToClear auto
message property _DE_Weather_ClearToFog1 auto
message property _DE_Weather_ClearToFog2 auto
message property _DE_Weather_ClearToFog3 auto
message property _DE_Weather_ClearToFog4 auto
message property _DE_Weather_ClearToFog5 auto
message property _DE_Weather_ClearToFog6 auto
message property _DE_Weather_ClearToFog7 auto
message property _DE_Weather_ClearToSnow auto
message property _DE_Weather_ClearToSnowMountain auto
message property _DE_Weather_ClearToSnowSevere auto
message property _DE_Weather_RainToClear auto
message property _DE_Weather_RainToFog auto
message property _DE_Weather_RainToSnow auto
message property _DE_Weather_RainToSnowSevere auto
message property _DE_Weather_SnowToClear auto
message property _DE_Weather_StormToClear auto
message property _DE_Weather_ClearToRain auto
message property _DE_Weather_ClearToStorm auto
message property _DE_Weather_FogToRain auto
message property _DE_Weather_FogToStorm auto
message property _DE_Weather_SnowToRain auto
message property _DE_ExposureDeath auto
message property _DE_Tent_Needed auto
message property _DE_Tent_LeakingWater auto
message property _DE_Tent_WarmCap auto
message property _DE_Tent_ColdCap auto
message property _DE_ColdCap auto

;#Keywords=====================================================================
Keyword property _DE_FoodBuffKeyword10 auto
Keyword property _DE_FoodBuffKeyword15 auto
Keyword property _DE_FoodBuffKeyword20 auto
Keyword property _DE_FoodBuffKeyword25 auto
Keyword property _DE_WetStateKeyword auto
Keyword property ActorTypeUndead auto
Keyword property LocTypeInn auto
Keyword property ActorTypeDragon auto

;#Spells=======================================================================
Spell property _DE_Hypo_Spell_0_2 auto
{Warm.}
Spell property _DE_Hypo_Spell_1 auto
{Comfortable.}
Spell property _DE_Hypo_Spell_2 auto
{Cold.}
Spell property _DE_Hypo_Spell_3 auto
{Very Cold.}
Spell property _DE_Hypo_Spell_4 auto
{Freezing.}
Spell property _DE_Hypo_Spell_5 auto
{Freezing to Death.}
Spell property _DE_Hypo_Spell_4NoFrost auto
Spell property _DE_Hypo_Spell_5NoFrost auto
Spell property _DE_NoWait_Spell auto
spell property _DE_WetState_Spell1 auto
{Spell that applies the new "wet" shader effect (OpticShooter).}
spell property _DE_WetState_Spell2 auto
{Spell that applies the new "wet" shader effect (OpticShooter).}
spell property _DE_WetState_Spell3 auto
{Spell that applies the new "wet" shader effect (OpticShooter).}
spell property _DE_WetState_Spell1NoShader auto
spell property _DE_WetState_Spell2NoShader auto
spell property _DE_WetState_Spell3NoShader auto
spell property _DE_TorchState_Spell auto
{Spell that applies Torch active effect.}
Spell property _DE_Weathersense_Spell Auto
Spell property _DE_SurvivalSkills_Spell auto
Spell property _DE_SurvivalSkillsCombo_Spell auto
Spell property _DE_WEARExamineArmor_Spell auto
spell property _DE_RegionDetect auto
spell property _DE_HarvestWood auto
spell property _DE_PlayerStatus_Spell auto
spell property _DE_ConditioningState_Spell auto
spell property _DE_ConditioningState_Spell_SkyRe auto
spell property _DE_Configuration_Spell auto
spell property _DE_Campfire2Spell auto
spell property _DE_CloakState_Spell auto
spell property _DE_CloakState_Spell_Burlap auto
spell property _DE_CloakState_Spell_Linen auto
spell property _DE_CloakState_Spell_Hide auto
spell property _DE_CloakState_Spell_Fur auto
spell property _DE_WellInsulatedConditionSpell auto
spell property _DE_WalkingStickSpell auto
spell property _DE_HandWarmingSpell auto
spell property _DE_FlyingMountState_Spell auto
spell property _DE_TransmuteWood auto
spell property _DE_WerewolfSwimState auto
spell property _DE_NoWaitWerewolfFix_Spell auto

;#Image Space Modifiers========================================================
imagespacemodifier property _DE_Cold3 auto
imagespacemodifier property _DE_Cold4 auto
imagespacemodifier property _DE_Cold5 auto

;#MiscObjects==================================================================
MiscObject property Firewood01 auto

;#Statics======================================================================
Static property _DE_MageSphere1 auto

;#WorldSpaces==================================================================
WorldSpace property Tamriel auto

;#Local Properties=============================================================
float property pWetPoints = 0.0 auto hidden conditional
{Wet Points value}

bool property TorchState auto hidden																		;Keep this for future UI Widget
{Does the player have a torch equipped?}
bool property IsInRegion1 = false auto hidden
bool property IsInRegion2 = false auto hidden
bool property IsInRegion3 = false auto hidden
bool property IsInRegion4 = false auto hidden
bool property IsInRegion5 = false auto hidden
bool property IsInRegion6 = false auto hidden
bool property IsInRegion7 = false auto hidden
bool property IsInRegion8 = false auto hidden
bool property bInInterior auto hidden
bool property bIsVampire auto hidden

;#MQ102A/B Stuff===============================================================
MiscObject property _DE_CampTent2_LeatherSmall1BR_MISC auto
Armor property _DE_Cloak_BasicBurlap auto
Armor property _DE_ArmorStormcloakBoots auto
ReferenceAlias property RiverwoodFriend auto
bool bGaveRiverwoodFriendItems = false
bool bAddedSpellBooks = false

;#Frostfall 2.6 Stuff=========================================================
Activator property _DE_Campfire_Simple_Rescue auto
Idle Property TG05_KnockOut  Auto  
Idle Property Idle_1stPersonWoozyGetUpFromBed  Auto
ImageSpaceModifier Property SleepyTimeFadeIn  Auto  
ImageSpaceModifier Property FadeToBlackHoldImod  Auto  
ImageSpaceModifier Property FadeToBlackImod  Auto  
Sound Property PHYGenericDirtHeavyH  Auto
Quest property _DE_FollowerQuest auto
Quest property _DE_StaticFollowerQuest auto
Spell property _DE_FollowerSpell auto
ReferenceAlias property Follower1 auto
ReferenceAlias property Follower2 auto
ReferenceAlias property Follower3 auto
ReferenceAlias property Dog auto
ReferenceAlias property StaticFollower1 auto
ReferenceAlias property StaticFollower2 auto
ReferenceAlias property StaticFollower3 auto
ReferenceAlias property StaticDog auto
ReferenceAlias property NearestCampfire auto
GlobalVariable property _DE_FollowerCount auto
GlobalVariable property _DE_HFLoaded auto
GlobalVariable property _DE_RescueChanceAlone auto
GlobalVariable property _DE_RescueChanceFollower auto
int property rescueDestinationIndex auto hidden
float property nearestDist auto hidden
ObjectReference property _DE_RescueDestinationMarker auto
formlist property _DE_Trees auto
formlist property _DE_DeadwoodList auto

ObjectReference property _DE_MarkerTamriel auto
ObjectReference property _DE_MarkerRiverwood auto
ObjectReference property _DE_MarkerRorikstead auto
ObjectReference property _DE_MarkerKynesgrove auto
ObjectReference property _DE_MarkerDragonbridge auto
ObjectReference property _DE_MarkerIvarstead auto
ObjectReference property _DE_MarkerNightgateInn auto
ObjectReference property _DE_MarkerWinterhold auto
ObjectReference property _DE_MarkerWindhelm auto
ObjectReference property _DE_MarkerSolitude auto
ObjectReference property _DE_MarkerMarkarth auto
ObjectReference property _DE_MarkerWhiterun auto
ObjectReference property _DE_MarkerRiften auto
ObjectReference property _DE_MarkerFalkreath auto
ObjectReference property _DE_MarkerMorthal auto
ObjectReference property _DE_MarkerDawnstar auto

book property _DE_RobLetterOther auto
book property _DE_RescueLetterSettlement auto
book property _DE_RescueLetterSpouse auto
book property _DE_RobLetterSettlement_Riverwood auto
book property _DE_RobLetterSettlement_Rorikstead auto
book property _DE_RobLetterSettlement_Kynesgrove auto
book property _DE_RobLetterSettlement_DragonBridge auto
book property _DE_RobLetterSettlement_Ivarstead auto
book property _DE_RobLetterSettlement_NightgateInn auto
book property _DE_RobLetterSettlement_Winterhold auto
book property _DE_RobLetterSettlement_Windhelm auto
book property _DE_RobLetterSettlement_Solitude auto
book property _DE_RobLetterSettlement_Markarth auto
book property _DE_RobLetterSettlement_Whiterun auto
book property _DE_RobLetterSettlement_Riften auto
book property _DE_RobLetterSettlement_Falkreath auto
book property _DE_RobLetterSettlement_Morthal auto
book property _DE_RobLetterSettlement_Dawnstar auto

Message property _DE_RescueMsg_A_1 auto
Message property _DE_RescueMsg_A_2 auto
Message property _DE_RescueMsg_F_1 auto
Message property _DE_RescueMsg_F_2 auto
Message property _DE_RescueMsg_F_3 auto
Message property _DE_RescueMsg_F_4 auto
Message property _DE_RescueMsg_F_5 auto
Message property _DE_RescueMsg_D_1 auto
Message property _DE_RescueMsg_D_2 auto
Message property _DE_RescueMsg_D_3 auto
Message property _DE_RescueMsg_D_4 auto
Message property _DE_RescueMsg_Failsafe auto
Message property _DE_FrostbiteMsg auto

potion property _DE_FrostbittenPotion auto

ReferenceAlias property Alias_LoveInterest auto
Static property COCMarkerHeading auto

MiscObject property Gold001 auto

;#PROPERTIES END=================================================================================================================

objectreference property _DE_ShelterDetectOrigin auto
objectreference property _DE_ShelterDetectSensor auto
objectreference property _DE_DecalPuddleSmallREF auto

;#VARIABLES======================================================================================================================

float fControlTime
float fDistance
float flvLastPosX
float flvLastPosY
float fLastGameHour
Weather wMyWeather
Weather myLastWeather
Weather myLastIncomingWeather
int myLastWeatherTemp
int myLastRegion
int iIsInTent
bool bTakingShelter
bool bFirstUpdate = true
bool bFTMessageLock = false				;Logic lock that prevents "You are prepared to travel" spam in interiors.
int iFireMessageLock = 0 				;Logic lock that prevents "You begin to warm up" spam.
bool bHeatMessageLock = false 			;Logic lock that prevents "You begin to warm up" spam.
bool bPlayerCombatState = false
bool bInInteriorLast
WorldSpace wsThisWorldSpace
WorldSpace wsLastWorldSpace
bool bLastFastTravelState = false
int iRandomNum							;Used for timing purposes
float fThreadLastUpdateTime				;Used for timing purposes
float fLastUpdateTime					;Used for timing purposes
int iShelterNeededCounter = 0
bool bLastVampirismState = false
int iSlowUpdateCounter = 0
GlobalVariable property _DE_FireDistance auto

;Help System							;ZZZWill need to be converted to properties to reset them later
GlobalVariable property _DE_HelpDone_ExposurePoints auto
GlobalVariable property _DE_HelpDone_Vampirism auto
GlobalVariable property _DE_HelpDone_Wet auto

;Alternate Start
int iStartStarsCounter

;Cloaks
float CloakDryRateMod = 1.0
float CloakWetRateMod = 1.0

;#VARIABLES END==================================================================================================================
;#EndRegion

event OnInit()
    RegisterForSingleUpdate(5)
endevent

Event OnUpdate()
	;====================Region Detection=====================
	pPlayer.AddSpell(_DE_RegionDetect, false)
	
	;====================Quest State==========================
	if _DE_TrackingQuest.GetStage() == 0			;Kicks things off for the player
		_DE_TrackingQuest.SetStage(10)
	endif
	
	;What is the state of the primary quest?
	if ShutdownState == false
		if pSetting_IsRunning == true
			StartFrostfall.SetValue(1.0)
			MainLoop()
		else																				;Start Method
			LookToTheStars()
			StartFrostfall.SetValue(0.0)
		endif
	else
		StartFrostfall.SetValue(0.0)
	endif
	
	RegisterForSingleUpdate(5)	
endEvent

function MainLoop()
	;====================Test Code=======================

	;====================Variables=======================
	int FireFactor = 8
	int HeatFactor = 6
	int HideTentFactor = 2
	int LeatherTentFactor = 1
	bool bNearFire = false
	bool bNearOtherHeatSource = false
	int maxTemp
	int iCurrWeatherTemp
	
	;=================Shelter Detection==================
	if !(ShelterQuest.bIsRunning)
		ShelterQuest.ShelterDetectStart()
	endif
	
	;==================Quest State=======================
	if _DE_TrackingQuest.GetStage() < 20
		_DE_TrackingQuest.SetStage(20)
	endif
	if !self.IsRunning()
		FrostfallDebug(2, "Starting main quest...")
		self.Start()
	else
		FrostfallDebug(2, "Main quest running.")
	endif
	if !CompatibilityQuest.IsRunning()
		FrostfallDebug(2, "Starting compatibility quest...")
		CompatibilityQuest.Start()
	else
		FrostfallDebug(2, "Compatibility quest running.")
	endif


	;==================Spells============================
	AddStartupSpells()

	;====Give Alvor / Gerdur items for player============
	AddFriendItems()

	;=====Start Lightable Campfire / Follower Quest======
	if !_DE_LightableFiresQuest.IsRunning()
		_DE_LightableFiresQuest.Start()
	endif
	
	;=====Start Follower Management Quest ===============
	if !_DE_StaticFollowerQuest.IsRunning()
		_DE_StaticFollowerQuest.Start()
	endif

	;=====Update current followers ======================
	_DE_FollowerQuest.Stop()
	_DE_FollowerQuest.Start()
	
	;=================Alias Check========================
	FrostfallDebug(2, "Player alias: " + Alias_DE_Player.GetReference())
	FrostfallDebug(2, "Compatibility alias: " + _DE_CompatibilityPlayer.GetReference())
	if !Alias_DE_Player.GetReference()
		Alias_DE_Player.ForceRefTo(pPlayer)
		FrostfallDebug(2, "The player alias was empty, filling...")
	endif
	if !_DE_CompatibilityPlayer.GetReference()
		_DE_CompatibilityPlayer.ForceRefTo(pPlayer)
		FrostfallDebug(2, "The compatibility alias was empty, filling...")
		Compatibility.RunStartupCheck()
	endif
	
	if Compatibility.WellInsulated == none
		FrostfallDebug(2, "Initial startup check failed, trying again...")
		Compatibility.RunStartupCheck()
	endif
	
	if Compatibility.WellInsulated == none
		messagebox("Frostfall encountered a problem performing startup checks. Try loading this game again. If you continue to experience this error, please verify your game and mod installation.")
	endif
		
	;============Waiting, Distance, Travel, and Player Location===========
	IsPlayerInInterior()
	WaitStateUpdate()										;Can the player wait?
	FastTravelStateUpdate()									;Can the player fast travel?
	
	fDistance = GetDistanceMoved()							;How far has the player moved?
	if fDistance > 0.0
		_DE_WarmingHandsToggle.SetValue(1)
	endif
	bLastFastTravelState = GetFastTravelled(fDistance)		;Did the player fast travel?
	GetFastTravelExceptionProximity()						;Is the player near a fast travel exception?
	
	if bLastFastTravelState
		SetExposure(100.0)
		;Remove wet state effects
		pPlayer.RemoveSpell(_DE_WetState_Spell1)
		pPlayer.RemoveSpell(_DE_WetState_Spell2)
		pPlayer.RemoveSpell(_DE_WetState_Spell3)
		pWetPoints = 0.0
	endif
	
	;====================Weather Discovery=======================
	;Get current weather
	wMyWeather = Weather.GetCurrentWeather()
	
	;Get the current temperature based on the weather
	if !bInInterior
		maxTemp = GetExceptionBlockTemp()
		iCurrWeatherTemp = GetWeatherTemp(maxTemp)
	else
		maxTemp = 0
		iCurrWeatherTemp = 10
	endif
	
	;Store the temperature in a global so that other scripts can use it
	int iCurrTemp = 10
	if maxTemp < iCurrWeatherTemp
		iCurrTemp = maxTemp
	else
		iCurrTemp = iCurrWeatherTemp
	endif
	
	;Is it daytime, or nighttime?
	float myGameHour = GameHour.GetValue()
    if myGameHour > 19.0
        iCurrTemp -= 5
    elseif myGameHour < 7.0
        iCurrTemp -= 5
    endif
	
	_DE_CurrentTemp.SetValue(iCurrTemp)

	;======================Player State==========================
	GetWaterskinState()
	GetVampirismState()
	iIsInTent = GetInTent()
	bNearFire = GetFireState()
	if !bNearFire
		bNearOtherHeatSource = GetOtherHeatSource()
	endif
	bTakingShelter = GetTakingShelter()
	int WetFactor = GetWetState(bNearFire)
	float FoodFactor = GetFoodState()
	float ClothingFactor = GetClothingState()
	float TorchFactor = GetTorchState()
	float CloakFactor = GetCloakState()
	float ConditioningFactor = GetConditioningState()
	float FollowerFactor = GetFollowerFactor()
	
	float Auxfactor = 1 - (FoodFactor + TorchFactor + CloakFactor + ConditioningFactor + FollowerFactor)
	SetPlayerCombatState()
	float FrostFactor = (pPlayer.GetAV("FrostResist")/200)
	
	;====Animation Variable Updates=======
	bool bOutOfDialogue = !UI.IsMenuOpen("Dialogue Menu")
	if bOutOfDialogue
		_DE_DialogueState.SetValue(1)
	else
		_DE_DialogueState.SetValue(2)
	endif

	;====HELP TEXT====
	if _DE_HelpDone_Vampirism.GetValueInt() == 1
		if _DE_Setting_Help.GetValueInt() == 2
			if bIsVampire
				ShowHelp(2)
			endif
		endif
	endif
	;====HELP TEXT====
	
	if bIsVampire
		SetExposure(100.0)
	else
	
		;=================Calculate Exposure Point Loss=========================
		float currEPChange = GetEPChange(iCurrTemp, WetFactor, ClothingFactor, FrostFactor, AuxFactor, bNearFire)		;CHECK THIS
					
		;=================Apply Exposure Point Loss=============================	
		ApplyEP(currEPChange, FireFactor, HeatFactor, HideTentFactor, LeatherTentFactor, WetFactor, bNearFire, bNearOtherHeatSource)
	
	endif
	
	;=================Vampirism Cure Check==================================	
	if bLastVampirismState == true
		if bIsVampire == false
			;The player just cured their vampirism, so give them back their Exposure Points
			SetExposure(70.0)
		endif
	endif
	
	;=================Take Action Based On EP Value=========================
	ExposureStatusUpdate()

	;=================Update Followers (Late Update)========================
	SyncFollowers()
endFunction

function AddStartupSpells()							;Approved 2.5
	pPlayer.AddSpell(_DE_WellInsulatedConditionSpell, false)
	pPlayer.AddSpell(_DE_ConditioningState_Spell, false)
	pPlayer.AddSpell(_DE_ConditioningState_Spell_SkyRe, false)
	pPlayer.AddSpell(_DE_FlyingMountState_Spell, false)
	pPlayer.AddSpell(_DE_WerewolfSwimState, false)
	pPlayer.AddSpell(_DE_NoWaitWerewolfFix_Spell, false)

	if !Compatibility.isSKYUILoaded || _DE_HotkeyWeathersense.GetValueInt() == 0
		pPlayer.AddSpell(_DE_Weathersense_Spell, false) 			;Survival Skills - Weathersense
	else
		pPlayer.RemoveSpell(_DE_Weathersense_Spell)
	endif

	if !Compatibility.isSKYUILoaded || _DE_HotkeySurvivalSkills.GetValueInt() == 0
		pPlayer.AddSpell(_DE_SurvivalSkillsCombo_Spell, false)		;Survival Skills (multi-select)
	else
		pPlayer.RemoveSpell(_DE_SurvivalSkillsCombo_Spell)
	endif

	if !pPlayer.HasSpell(_DE_WalkingStickSpell)
		pPlayer.AddSpell(_DE_WalkingStickSpell, false)
	endif
	if !pPlayer.HasSpell(_DE_HandWarmingSpell)
		pPlayer.AddSpell(_DE_HandWarmingSpell, false)
	endif
	
	if Compatibility.isSKYUILoaded
		pPlayer.RemoveSpell(_DE_Configuration_Spell)
	else
		pPlayer.AddSpell(_DE_Configuration_Spell, false)
	endif

	if Follower1.GetActorReference()
		pPlayer.AddSpell(_DE_FollowerSpell, false)
	elseif Follower2.GetActorReference()
		pPlayer.AddSpell(_DE_FollowerSpell, false)
	elseif Follower3.GetActorReference()
		pPlayer.AddSpell(_DE_FollowerSpell, false)
	else
		pPlayer.RemoveSpell(_DE_FollowerSpell)
	endif
endFunction

function AddFriendItems()
	if bGaveRiverwoodFriendItems == false
		if RiverwoodFriend.GetActorRef() != none
			RiverwoodFriend.GetActorRef().AddItem(_DE_CampTent2_LeatherSmall1BR_MISC)
			RiverwoodFriend.GetActorRef().AddItem(_DE_Cloak_BasicBurlap)
			RiverwoodFriend.GetActorRef().AddItem(_DE_ArmorStormcloakBoots)
			bGaveRiverwoodFriendItems = true
		endif
	endif
endFunction

function ExposureStatusUpdate()						;Approved 2.5
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
	
function LookToTheStars()							;Approved 2.5
	;When the player looks up at the night sky, start the mod.
	if !pSetting_IsRunning
		if pPlayer.GetAngleX() <= -55.0
			if GameHour.GetValue() > 19.0 || GameHour.GetValue() < 7.0
				iStartStarsCounter += 1
				if iStartStarsCounter >= 2
					StartMod()
				endif
			endif
		elseif StartFrostfall.GetValueInt() == 1
			StartMod()
		endif
	endif
endFunction
	
function StartMod()									;Approved 2.5
	if _DE_TrackingQuest.GetStage() == 20
		;Bypass startup routine, user upgraded.
		FrostfallDebug(2, "2.5 Upgrade: Bypassing startup routine...")
		pSetting_IsRunning = true
	else
		;New game / first time user, show startup routine.
		_DE_BookMenu_FirstTime.Show()
		utility.wait(1)
		pPlayer.AddItem(_DE_SurvivorsGuide)
		pSetting_IsRunning = true
		utility.wait(6)
		_DE_BookMenu_FirstTime2.Show()
		utility.wait(1)
		_DE_BookMenu_FirstTime3.Show()
	endif
endFunction

function WaitStateUpdate()							;Approved 2.5
	;Check for Wait Prevention
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

function SyncFollowers()
	;The order that the aliases are filled each cycle is not known, so we have to
	;"debounce" by storing the results locally and not clearing out the local
	;variable unless necessary, to prevent a follower's reference from bouncing
	;between variables.

	bool myF1Found = false
	bool myF2Found = false
	bool myF3Found = false

	if StaticFollower1.GetActorRef() != None
		if StaticFollower1.GetActorRef() == Follower1.GetActorRef()
			myF1Found = true
		elseif StaticFollower1.GetActorRef() == Follower2.GetActorRef()
			myF1Found = true
		elseif StaticFollower1.GetActorRef() == Follower3.GetActorRef()
			myF1Found = true
		endif
	endif
	if myF1Found == false
		;I didn't find the locally stored Follower in an alias, remove it
		StaticFollower1.Clear()
	endif

	if StaticFollower2.GetActorRef() != None
		if StaticFollower2.GetActorRef() == Follower1.GetActorRef()
			myF2Found = true
		elseif StaticFollower2.GetActorRef() == Follower2.GetActorRef()
			myF2Found = true
		elseif StaticFollower2.GetActorRef() == Follower3.GetActorRef()
			myF2Found = true
		endif
	endif
	if myF2Found == false
		StaticFollower2.Clear()
	endif

	if StaticFollower3.GetActorRef() != None
		if StaticFollower3.GetActorRef() == Follower1.GetActorRef()
			myF3Found = true
		elseif StaticFollower3.GetActorRef() == Follower2.GetActorRef()
			myF3Found = true
		elseif StaticFollower3.GetActorRef() == Follower3.GetActorRef()
			myF3Found = true
		endif
	endif
	if myF3Found == false
		StaticFollower3.Clear()
	endif

	bool F1Found = false
	bool F2Found = false
	bool F3Found = false
	
	if Follower1.GetActorRef() != None
		if Follower1.GetActorRef() == StaticFollower1.GetActorRef()
			F1Found = true
		elseif Follower1.GetActorRef() == StaticFollower2.GetActorRef()
			F1Found = true
		elseif Follower1.GetActorRef() == StaticFollower3.GetActorRef()
			F1Found = true
		endif
	endif
	if Follower1.GetActorRef() != None && F1Found == false
		;I didn't find the alias stored in a local variable, fill it in somewhere
		if StaticFollower1.GetActorRef() == none
			StaticFollower1.ForceRefTo(Follower1.GetActorRef())
		elseif StaticFollower2.GetActorRef() == none
			StaticFollower2.ForceRefTo(Follower1.GetActorRef())
		elseif StaticFollower3.GetActorRef() == none
			StaticFollower3.ForceRefTo(Follower1.GetActorRef())
		endif
	endif

	if Follower2.GetActorRef() != None
		if Follower2.GetActorRef() == StaticFollower1.GetActorRef()
			F2Found = true
		elseif Follower2.GetActorRef() == StaticFollower2.GetActorRef()
			F2Found = true
		elseif Follower2.GetActorRef() == StaticFollower3.GetActorRef()
			F2Found = true
		endif
	endif
	if Follower2.GetActorRef() != None && F2Found == false
		if StaticFollower1.GetActorRef() == none
			StaticFollower1.ForceRefTo(Follower2.GetActorRef())
		elseif StaticFollower2.GetActorRef() == none
			StaticFollower2.ForceRefTo(Follower2.GetActorRef())
		elseif StaticFollower3.GetActorRef() == none
			StaticFollower3.ForceRefTo(Follower2.GetActorRef())
		endif
	endif

	if Follower3.GetActorRef() != None
		if Follower3.GetActorRef() == StaticFollower1.GetActorRef()
			F3Found = true
		elseif Follower3.GetActorRef() == StaticFollower2.GetActorRef()
			F3Found = true
		elseif Follower3.GetActorRef() == StaticFollower3.GetActorRef()
			F3Found = true
		endif
	endif
	if Follower3.GetActorRef() != None && F3Found == false
		if StaticFollower1.GetActorRef() == none
			StaticFollower1.ForceRefTo(Follower3.GetActorRef())
		elseif StaticFollower2.GetActorRef() == none
			StaticFollower2.ForceRefTo(Follower3.GetActorRef())
		elseif StaticFollower3.GetActorRef() == none
			StaticFollower3.ForceRefTo(Follower3.GetActorRef())
		endif
	endif

	;Update dog alias
	if Dog.GetActorRef() != None
		if Dog.GetActorRef() != StaticDog.GetActorRef()
			;Store the current dog reference
			StaticDog.ForceRefTo(Dog.GetActorRef())
		endif
	else
		StaticDog.Clear()
	endif


	int i = 0
	if StaticFollower1.GetActorRef() != none
		i += 1
	endif
	if StaticFollower2.GetActorRef() != none
		i += 1
	endif
	if StaticFollower3.GetActorRef() != none
		i += 1
	endif
	_DE_FollowerCount.SetValueInt(i)

	;debug.trace("[Frostfall] Follower sync complete. Results:")
	;debug.trace("[Frostfall]     myFollower1: " + StaticFollower1.GetActorRef())
	;debug.trace("[Frostfall]     myFollower2: " + StaticFollower2.GetActorRef())
	;debug.trace("[Frostfall]     myFollower3: " + StaticFollower3.GetActorRef())
	;debug.trace("[Frostfall]     Dog: " + StaticDog.GetActorRef())

endFunction

float function GetFollowerFactor()
	if _DE_FollowerCount.GetValueInt() > 0
		return 0.05
	else
		return 0.0
	endif
endFunction

function GetVampirismState()						;Approved 2.5
	if pSetting_VampireImmunity
		if pPlayer.GetRace().HasKeyword(ActorTypeUndead)
			bIsVampire = true
		else
			bIsVampire = false
		endif
	else
		bIsVampire = false
	endif
endFunction

function DebugEPReport(int myEP, bool myFire, bool myInterior, float currEPChange)
	;Builds a debug message for monitoring EP change
	
	if _DE_EPDebug.GetValueInt() == 1
		;continue
	else
		return
	endif
	
	string sFire = ""
	string sInterior = ""
	string sTent = ""
	
	if myFire
		sFire = "Fire Detected"
	else
		sFire = "No Fire"
	endif
	
	if myInterior
		sInterior = "/Inside"
	elseif myInterior == 0
		sInterior = "/Outside"
	endif
	
	if iIsInTent == 0
		sTent = "/Not In Tent"
	elseif iIsInTent == 1
		sTent = "/Hide Tent"
	elseif iIsInTent == 2
		sTent = "/Leather Tent"
	elseif iIsInTent == 3
		sTent = "/Conjured Shelter"
	endif
	
	FrostfallDebug(1, "EP: " + myEP + "/" + "WP: " + pWetPoints + "/" + sFire + sInterior + sTent + "/Change: " + (currEPChange * -1.0) + " " + ((GameHour.GetValue() - fLastGameHour) * 180) + "sec")
	fLastGameHour = GameHour.GetValue()	
endFunction

function GetWaterskinState()
	if pPlayer.GetItemCount(_DE_ModWaterSkins) > 0
		_DE_HasWaterSkin.SetValue(2.0)
	else
		_DE_HasWaterSkin.SetValue(0.0)
	endif
endFunction

float function GetTorchState()						;Approved 2.5
	if pPlayer.GetEquippedItemType(0) == 11 || pPlayer.GetEquippedItemType(1) == 11		;If the player has a torch in either hand
		pPlayer.AddSpell(_DE_TorchState_Spell, false)
		return 0.1					;10% bonus to Exposure Resistance
	else
		pPlayer.RemoveSpell(_DE_TorchState_Spell)
		return 0.0
	endif
endFunction

float function GetConditioningState()				;Approved 2.5
	float myConditioning

	if Compatibility.isSKYRELoaded
		int mySkill = pPlayer.GetAV("Lockpicking") as int
		if mySkill >= 100
			myConditioning = 0.1
		elseif mySkill <= 0
			myConditioning = 0.0
		else
			myConditioning = (Floor(mySkill / 10))/100
		endif
	else
		float pLevel = pPlayer.GetLevel()
		if pLevel >= 50.0
			myConditioning = 0.1
		else
			myConditioning = (Floor(pLevel / 5))/100
		endif
	endif
	
	return myConditioning
endFunction

function SetPlayerCombatState()						;Approved 2.5
	if pSetting_CombatDisable == true
		if pPlayer.GetCombatState() == 0
			bPlayerCombatState = false
		else
			bPlayerCombatState = true
		endif
	else
		bPlayerCombatState = false
	endif
endFunction

float function GetFoodState()						;Approved 2.5
	;Check the effects on the player to see if he has one of the food buffs
	if pPlayer.HasEffectKeyword(_DE_FoodBuffKeyword10)
		return 0.05
	elseif pPlayer.HasEffectKeyword(_DE_FoodBuffKeyword15)
		return 0.10
	elseif pPlayer.HasEffectKeyword(_DE_FoodBuffKeyword20)
		return 0.10
	elseif pPlayer.HasEffectKeyword(_DE_FoodBuffKeyword25)
		return 0.15
	else
		return 0.0
	endif
endFunction
	
bool function GetFireState()						;Approved 2.5
	;Find out if the player is standing near a heat source
	bool bNearFire = false

	if bNearFire == false
		objectreference myFire = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources, pPlayer, 300.0)
		if myFire != None
			if !(myFire.IsDisabled())	;Don't warm up near disabled fires
				bNearFire = true
				NearestCampfire.ForceRefTo(myFire)
				_DE_FireDistance.SetValue(pPlayer.GetDistance(myFire))
				if _DE_SmallFires.HasForm(myFire.GetBaseObject())
					if myFire.GetPositionZ() - pPlayer.GetPositionZ() >= 85.0
						;The small fire is high up
						_DE_NearSmallFire.SetValue(1)
						FrostfallDebug(3, "I am near a small fire but it's too high, _DE_HeatSources")
					else
						_DE_NearSmallFire.SetValue(2)
						FrostfallDebug(3, "I am near a small fire, _DE_HeatSources")
					endif
				else
					_DE_NearSmallFire.SetValue(1)
					FrostfallDebug(3, "I am not near a small fire, _DE_HeatSources")
				endif
			endif
		endif
	endif
	
	if bNearFire == false
		objectreference myMedFire = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_Med, pPlayer,  450.0)
		if myMedFire != None
			if !(myMedFire.IsDisabled())
				bNearFire = true
				NearestCampfire.ForceRefTo(myMedFire)
				_DE_FireDistance.SetValue(pPlayer.GetDistance(myMedFire))
				if _DE_SmallFires.HasForm(myMedFire.GetBaseObject())
					_DE_NearSmallFire.SetValue(2)
					FrostfallDebug(3, "I am near a small fire, _DE_HeatSources_Med")
				else
					_DE_NearSmallFire.SetValue(1)
					FrostfallDebug(3, "I am not near a small fire, _DE_HeatSources_Med")
				endif
			endif
		endif
	endif
	
	if bNearFire == false
		objectreference myBigFire = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_Big, pPlayer,  600.0)
		if myBigFire != none
			if !(myBigFire.IsDisabled())
				bNearFire = true
				NearestCampfire.ForceRefTo(myBigFire)
				_DE_FireDistance.SetValue(220.0)	;Set artificially low so things will trigger
				_DE_NearSmallFire.SetValue(1)
			endif
		endif
	endif
	
	if bNearFire == false
		_DE_FireDistance.SetValue(-1)
	endif
	
	;If the player is in an inn, they are warm everywhere inside it.
	Location myLocation = pPlayer.GetCurrentLocation()
	if myLocation != none && myLocation.HasKeyword(LocTypeInn)
		bNearFire = true
	endif

	if bNearFire == true
		if iFireMessageLock <= 2
			if !bIsVampire
				if _DE_ExposurePoints.GetValue() <= 100.0
					int myWeatherClass = GetWeatherClassificationActual(wMyWeather)
					bool bInSnowNoTent = ( _DE_ExposurePoints.GetValue() >= 50.0 && iIsInTent == 0 && myWeatherClass == 3 )
					bool bInRainNoTent = ( _DE_ExposurePoints.GetValue() >= 70.0 && iIsInTent == 0 && myWeatherClass == 2 )
					
					if (( bInSnowNoTent ) || ( bInRainNoTent )) && !bInInterior && !bTakingShelter
						if iFireMessageLock == 2
							_DE_Tent_Needed.Show()
						endif
					else
						if _DE_Setting_ConditionMsg.GetValueInt() == 2 && iFireMessageLock == 1
							_DE_WarmUp.Show()
						endif
					endif
					iFireMessageLock += 1
				else
					iFireMessageLock = 2
				endif
			endif
		endif
		return bNearFire
	else
		_DE_FireDistance.SetValue(-1)
		iFireMessageLock = 0
		return bNearFire
	endif
endFunction

bool function GetOtherHeatSource()					;Approved 2.5
	bool bNearOtherHeatSource = false
	
	ObjectReference myHeat = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_OtherHeatSources, pPlayer, 285.0)
	if myHeat != None
		if !(myHeat.IsDisabled())	;Don't warm up near disabled heat sources
			bNearOtherHeatSource = true
		endif
	endif
	
	
	if bNearOtherHeatSource == true
		if bHeatMessageLock == false
			if !bIsVampire
				if _DE_ExposurePoints.GetValue() < 100.0
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						_DE_WarmUp.Show()
					endif
					bHeatMessageLock = true
				else
					bHeatMessageLock = true
				endif
			endif
		endif
		return bNearOtherHeatSource
	else
		bHeatMessageLock = false
		return bNearOtherHeatSource
	endif
endFunction

int function GetInTent()							;Approved 2.5
	iIsInTent = 0
	
	;0	=	None
	;1	=	Hide Tent
	;2	=	Leather Tent
	;3  =	Conjured Shelter
	
	ObjectReference myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_SmallHideTents, pPlayer, 50.0)
	if myTent
		if pPlayer.GetSitState() == 3
			iIsInTent = 1
			;notification("I'm in a small hide tent!")
			return iIsInTent
		endif
	endif
	
	if !myTent
		myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_LargeHideTents, pPlayer, 146.0)
		if myTent
			iIsInTent = 1
			return iIsInTent
		endif
	endif
	
	if !myTent
		myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_SmallLeatherTents, pPlayer, 85.0)
		if myTent
			if pPlayer.GetSitState() == 3
				iIsInTent = 2
				return iIsInTent
			endif
		endif
	endif
	
	if !myTent
		myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_LargeLeatherTents, pPlayer, 195.0)
		if myTent
			iIsInTent = 2
			return iIsInTent
		endif
	endif

	if !myTent
		myTent = Game.FindClosestReferenceOfTypeFromRef(_DE_MageSphere1, pPlayer, 235.0)
		if myTent
			iIsInTent = 3
			return iIsInTent
		endif
	endif
	
	return 0
endFunction		
	
float function GetCloakState()						;Approved 2.5
	if pPlayer.HasSpell(_DE_CloakState_Spell_Burlap)
		CloakDryRateMod = 0.66
		CloakWetRateMod = 0.66
		return 0.05
	elseif pPlayer.HasSpell(_DE_CloakState_Spell_Linen)
		CloakDryRateMod = 0.75
		CloakWetRateMod = 0.5
		return 0.1
	elseif pPlayer.HasSpell(_DE_CloakState_Spell_Hide)
		CloakDryRateMod = 1.0
		CloakWetRateMod = 0.33
		return 0.07
	elseif pPlayer.HasSpell(_DE_CloakState_Spell_Fur)
		CloakDryRateMod = 0.5
		CloakWetRateMod = 0.66
		return 0.15
	elseif pPlayer.HasSpell(_DE_CloakState_Spell)
		CloakDryRateMod = 1.0
		CloakWetRateMod = 0.66
		return 0.1
	elseif pPlayer.HasMagicEffect(_DE_CloakState_Spell_BoundLesser)
		CloakDryRateMod = 1.0
		CloakWetRateMod = 0.66
		return 0.07
	elseif pPlayer.HasMagicEffect(_DE_CloakState_Spell_BoundGreater)
		CloakDryRateMod = 1.0
		CloakWetRateMod = 0.33
		return 0.12
	else
		CloakDryRateMod = 1.0
		CloakWetRateMod = 1.0
		return 0.0
	endif
endFunction

bool function GetTakingShelter()					;Approved 2.5
	float fDelta = Game.GetRealHoursPassed() - _DE_fShelterTime.GetValue()
	FrostfallDebug(3, "Shelter time delta: " + ((60 * (fDelta)) * 60))
	if fDelta < 0.001388889		;5 seconds
		_DE_ShelterState.SetValue(1.0)
		return false
	else
		_DE_ShelterState.SetValue(2.0)
		return true
	endif
endFunction

function RemoveWetSpells()							;Approved 2.5
	;Don't show wet shader effect when player is in water.	(sanity check)
	pPlayer.RemoveSpell(_DE_WetState_Spell1)
	pPlayer.RemoveSpell(_DE_WetState_Spell2)
	pPlayer.RemoveSpell(_DE_WetState_Spell3)
	pPlayer.RemoveSpell(_DE_WetState_Spell1NoShader)
	pPlayer.RemoveSpell(_DE_WetState_Spell2NoShader)
	pPlayer.RemoveSpell(_DE_WetState_Spell3NoShader)
endFunction

int function GetWetState(bool bNearFire)			;Approved 2.5
	int WetFactor = 0
	int iSwimState = _DE_SwimState.GetValueInt()
	int iWeatherClass = 0
	
	if wMyWeather
		iWeatherClass = GetWeatherClassificationActual(wMyWeather)
	endif
	
	objectreference myWaterfall = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_Waterfalls, pPlayer, 85.0)
	if myWaterfall && myWaterfall.IsEnabled()
		pWetPoints = 750.0
	endif
	
	;What is currently happening?
	;#Region DETERMINE SITUATION
	if iSwimState != 1													;The player is not swimming		
		if bInInterior													;In interiors, the player can warm up/dry off completely, and is unaffected by temperature
			ApplyWetConditionGetDrier(bNearFire)
		else
			if iWeatherClass <= 1		;Pleasant, Cloudy				;In pleasant weather, the player can warm up/dry off completely, with and without a tent
				ApplyWetConditionGetDrier(bNearFire)
			elseif iWeatherClass == 2 && Weather.GetOutgoingWeather() == none && !(_DE_WorldspacesExteriorOblivion.HasForm(wsThisWorldSpace))	;Rainy	;In rainy weather, the player can warm up completely in any tent, and dry off completely in leather tents.
				if iIsInTent == 0 && !bTakingShelter					;No Tent, no shelter
					ApplyWetConditionGetWetter()
				elseif iIsInTent == 1									;Hide Tent
					ApplyWetConditionGetWetterConditional(300.0, bNearFire)
				elseif iIsInTent >= 2 || bTakingShelter					;Leather Tent OR Conjured Shelter OR taking shelter
					ApplyWetConditionGetDrier(bNearFire)
				endif
			elseif iWeatherClass == 3	;Snowy							;In snowy weather, the player can warm up completely in hide tents, and dry off completely in any tent.
				ApplyWetConditionGetDrier(bNearFire)
			else
				ApplyWetConditionGetDrier(bNearFire)					;Fall-through condition.
			endif
		endif
	endif
	;#EndRegion
	
	;#Region CLAMP WETNESS POINTS
	;Clamp Wet Points to a range of 0.0 to 900.0
	if pWetPoints > 750.0
		pWetPoints = 750.0
	elseif pWetPoints < 0.0
		pWetPoints = 0.0
	endif
	;#EndRegion
	
	;#Region ACT ON WETNESS POINTS
	;Calculate Wet Factor based on Wet Points, and apply the correct visual spell.
	;The wet state scripts have the responsibility to apply Spell 3; this is just a sanity check.
	if pWetPoints > 700.0
		WetFactor = 16
		if _DE_SwimState.GetValueInt() == 1
			RemoveWetSpells()
		else
			;Remove the wrong shader effects and apply the right one.
			pPlayer.RemoveSpell(_DE_WetState_Spell1)
			pPlayer.RemoveSpell(_DE_WetState_Spell2)
			if pSetting_EffectWetShader
				if !(pPlayer.HasSpell(_DE_WetState_Spell3))
					pPlayer.AddSpell(_DE_WetState_Spell3, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell3NoShader)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet3.Show()
						endif
					endif
				endif
			else
				if !(pPlayer.HasSpell(_DE_WetState_Spell3NoShader))
					pPlayer.AddSpell(_DE_WetState_Spell3NoShader, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell3)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet3.Show()
						endif
					endif
				endif
			endif
			;====HELP TEXT====
			if _DE_HelpDone_Wet.GetValueInt() == 1
				if _DE_Setting_Help.GetValueInt() == 2
					if !bIsVampire
						ShowHelp(3)
					endif
				endif
			endif
			;====HELP TEXT====
		endif
	elseif pWetPoints > 550.0
		Wetfactor = 8
		if _DE_SwimState.GetValueInt() == 1
			RemoveWetSpells()
		else
			;Remove the wrong shader effects and apply the right one.
			pPlayer.RemoveSpell(_DE_WetState_Spell1)
			pPlayer.RemoveSpell(_DE_WetState_Spell3)
			pPlayer.RemoveSpell(_DE_WetState_Spell1NoShader)
			pPlayer.RemoveSpell(_DE_WetState_Spell3NoShader)
			if pSetting_EffectWetShader
				if !(pPlayer.HasSpell(_DE_WetState_Spell2))
					pPlayer.AddSpell(_DE_WetState_Spell2, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell2NoShader)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet2.Show()
						endif
					endif
				endif
			else
				if !(pPlayer.HasSpell(_DE_WetState_Spell2NoShader))
					pPlayer.AddSpell(_DE_WetState_Spell2NoShader, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell2)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet2.Show()
						endif
					endif
				endif
			endif
		endif
	elseif pWetPoints > 200.0
		WetFactor = 4
		if _DE_SwimState.GetValueInt() == 1
			RemoveWetSpells()
		else
			;Remove the wrong shader effects and apply the right one.
			if pPlayer.HasSpell(_DE_WetState_Spell2)
				pPlayer.RemoveSpell(_DE_WetState_Spell2)
				;Generate puddle underneath the player's feet if not moving, sitting, or riding
				;if !pPlayer.IsRunning() && pPlayer.GetSitState() == 0 && pPlayer.IsOnMount() == false
				;	_DE_DecalPuddleSmallREF.MoveTo(pPlayer, afZOffset = 40.0, abMatchRotation = false)
				;endif
			endif
			pPlayer.RemoveSpell(_DE_WetState_Spell3)
			if pSetting_EffectWetShader
				if !(pPlayer.HasSpell(_DE_WetState_Spell1))
					pPlayer.AddSpell(_DE_WetState_Spell1, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell1NoShader)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet1.Show()
						endif
					endif
				endif
			else
				if !(pPlayer.HasSpell(_DE_WetState_Spell1NoShader))
					pPlayer.AddSpell(_DE_WetState_Spell1NoShader, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell1)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet1.Show()
						endif
					endif
				endif
			endif
		endif
	elseif pWetPoints == 0.0
		WetFactor = 0
		;Remove any visual effects and display a message.
		if pPlayer.HasEffectKeyword(_DE_WetStateKeyword)
			RemoveWetSpells()
			if _DE_Setting_ConditionMsg.GetValueInt() == 2
				if !bIsVampire
					_DE_WetStateMsg_Dry.Show()
				endif
			endif
		endif		
	endif
	;#EndRegion
	
	;Less exposure drain in warmer weather.
	int theTemp = _DE_CurrentTemp.GetValueInt()
	if theTemp >= 15
		WetFactor /= 4
	elseif theTemp > 10
		WetFactor /= 2
	endif
	
	return WetFactor
endFunction

function ApplyWetConditionGetDrier(bool bNearFire)	;Approved 2.5
	if bNearFire
		pWetPoints -= 150.0 * CloakDryRateMod
	else
		pWetPoints -= 6.25 * CloakDryRateMod
	endif
endFunction

function ApplyWetConditionGetWetter()				;Approved 2.5
	if pPlayer.HasPerk(Compatibility.Windbreaker)
		pWetPoints += 27.0 * ( CloakWetRateMod - ( CloakWetRateMod * 0.25  ) )
	else
		pWetPoints += 27.0 * CloakWetRateMod
	endif
endFunction

function ApplyWetConditionGetWetterConditional(float WPCap, bool bNearFire)								;Approved 2.5
	if bNearFire
		if ( pWetPoints <= WPCap && pWetPoints >= WPCap - 50.0 )
			if ( pWetPoints < WPCap )
				;Catch the bounce to show the player that they are completely dry
				if WPCap == 0.0
					if !bIsVampire
						_DE_WetStateMsg_Dry.Show()
					endif
				else
					if !bIsVampire
						_DE_Tent_LeakingWater.Show()
					endif
				endif
			endif
			pWetPoints = WPCap
		elseif pWetPoints < WPCap - 50.0
			;Get wetter normally
			pWetPoints += 27.0 * CloakWetRateMod
		else
			;Get dryer
			if bIsVampire
				pWetPoints -= 250.0
			else
				pWetPoints -= 37.0 * CloakDryRateMod
			endif
		endif
	else
		if ( pWetPoints <= WPCap && pWetPoints >= WPCap - 50.0 )
			if ( pWetPoints < WPCap )
				;Catch the bounce to show the player that they are completely dry
				if WPCap == 0.0
					if !bIsVampire
						_DE_WetStateMsg_Dry.Show()
					endif
				else
					if !bIsVampire
						_DE_Tent_LeakingWater.Show()
					endif
				endif
			endif
			pWetPoints = WPCap
		elseif pWetPoints < WPCap - 50.0
			;Get wetter normally
			pWetPoints += 6.75 * CloakWetRateMod
		else
			;Get dryer
			if bIsVampire
				pWetPoints -= 250.0
			else
				pWetPoints -= 6.25 * CloakDryRateMod
			endif
		endif
	endif
endfunction

float function GetClothingState()					;Approved 2.5
	if FrostfallArmor.bIsBeast
		FrostfallDebug(1, "Clothing factor: 6.0 (Werewolf)")
		return 6.0
	endif

	float ClothingFactor = _DE_fBody.GetValue() + _DE_fHead.GetValue() + _DE_fHands.GetValue() + _DE_fFeet.GetValue()
	
	if pPlayer.HasPerk(Compatibility.WellInsulated) && _DE_WellInsulatedApplied.GetValueInt() == 2
		ClothingFactor *= 1.25
	endif

	;Spell bonuses
	if pPlayer.HasMagicEffect(_DE_aaaArmorFFSelf_3)		;Bearskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			ClothingFactor += 0.9
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			ClothingFactor += 0.75
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			ClothingFactor += 0.6
		else
			ClothingFactor += 0.3	
		endif
	elseif pPlayer.HasMagicEffect(_DE_aaaArmorFFSelf_2)		;Wolfskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			ClothingFactor += 0.6	
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			ClothingFactor += 0.5
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			ClothingFactor += 0.4
		else
			ClothingFactor += 0.2
		endif
	elseif pPlayer.HasMagicEffect(_DE_aaaArmorFFSelf_1)			;Foxskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			ClothingFactor += 0.3	
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			ClothingFactor += 0.25
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			ClothingFactor += 0.2
		else
			ClothingFactor += 0.1
		endif
	endif

	FrostfallDebug(1, "Clothing factor (after spell bonuses): " + ClothingFactor)	

	return ClothingFactor
endFunction

function FastTravelStateUpdate()					;Approved 2.5
	;Can the player fast-travel?
	if pSetting_FastTravelProcessing == true					;(Compatibility) Fast Travel Processing
		if Compatibility.isDLC2Loaded
			WorldSpace myWS = pPlayer.GetWorldspace()
			if _DE_WorldspacesExteriorOblivion.HasForm(myWS)
				Game.EnableFastTravel()
				return
			endif
		endif

		;Is the player riding a dragon?
		if (_DE_Main_1_6 as _DE_ConditionValues).IsRidingFlyingMount
			Game.EnableFastTravel()
			return
		endif

		if pSetting_FastTravelDisable == true						;(Immersion) Fast Travel Disabled
			Game.EnableFastTravel(false)
		elseif _DE_Setting_FastTravel.GetValueInt() == 2						;Fast Travel Cost = On
			if (Compatibility.isSKSELoaded) && (pPlayer.HasSpell(_DE_TransmuteWood)) && (_DE_TransmuteWood.GetEffectiveMagickaCost(pPlayer) < (pPlayer.GetActorValue("Magicka") / pPlayer.GetActorValuePercentage("Magicka")))
				Game.EnableFastTravel()
			elseif pPlayer.GetItemCount(_DE_Axes)
				if bFTMessageLock == false
					_DE_TravelOn.Show()					;"You are now prepared to travel."
					bFTMessageLock = true
				endif
				Game.EnableFastTravel()
			else
				Game.EnableFastTravel(false)
				bFTMessageLock = false
			endif
		else																;Fast Travel Cost = Off
			Game.EnableFastTravel()
		endif
	endif
endFunction

float function GetDistanceMoved()					;Approved 2.5
	;Find out how far the player has travelled between updates.
	float myPosX = pPlayer.GetPositionX()					;Get location
	float myPosY = pPlayer.GetPositionY()
	float myPosXdelta = math.abs(flvLastPosX - myPosX)		;Get distance
	float myPosYdelta = math.abs(flvLastPosY - myPosY)
	float myPosXdeltasq = math.pow(myPosXdelta, 2)					;a^2
	float myPosYdeltasq = math.pow(myPosYdelta, 2)					;b^2
	float myDistance = math.sqrt(myPosXdeltasq + myPosYdeltasq)		;c = sqrt(a^2 + b^2)
	
	;Store the last known player location
	flvLastPosX = myPosX
	flvLastPosY = myPosY
	
	return myDistance
endFunction

function GetFastTravelExceptionProximity()			;Approved 2.5
	if Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_FastTravelExceptions, pPlayer,  600.0) != None
		pFTExceptionDetected = true
	else
		pFTExceptionDetected = false
	endif
endFunction

bool function GetFastTravelled(float myDistance)	;Approved 2.5
	bool bDidFastTravel = false									;Returns whether or not the player fast traveled
	if myDistance > 30000.0
		if pFTExceptionDetected == false						;Player was not near a carriage
			wsThisWorldSpace = pPlayer.GetWorldSpace()
			if bInInteriorLast == bInInterior					;This location and the last location were both exteriors (most likely, given the distance)
				if wsThisWorldSpace == wsLastWorldSpace
					;The Player traveled conventionally; set the player's EP to 100 post-travel
					bDidFastTravel = true
				else
					;We changed WorldSpaces, and should not process Fast Travel effects
				endif
			endif
		else
			;The Player traveled while near a carriage; set the player's EP to 100 post-travel
			bDidFastTravel = true
		endif
	endif
	
	;Store the last known location type for the next call
	bInInteriorLast = bInInterior
	
	;Store the last known player worldspace
	wsLastWorldSpace = wsThisWorldSpace
	
	return bDidFastTravel
endFunction	

int function GetExceptionBlockTemp()				;Approved 2.5
	;Location exception check
	float myX = flvLastPosX							;Re-used from GetDistanceMoved()
	float myY = flvLastPosY							;Re-used from GetDistanceMoved()
	float myZ = pPlayer.GetPositionZ()
	int maxTemp = 100
	
	;notification("Found weather!")
	;Ensure that the player is in the Tamriel WorldSpace so we can check for location blocks
	if pPlayer.GetWorldSpace() == Tamriel
	
		;High Hrothgar
		if (myX <= 74340 &&  myX >= 32000) && (myY <= -21000 && myY >= -66600)
			;I am near High Hrothgar, set maximum temperature values based on altitude
								;						~~~~    _  ~~~~
			if myZ >= 34000			;Elevation 4                ~~/~~\~~~~~~
				maxTemp = -20       ;                        ~~~ /  ~~\~~~
			elseif myZ >= 27500		;Elevation 3               /   ??  \
				maxTemp = -15       ;                        / . ~~   ?? \
			elseif myZ >= 21300		;Elevation 2           .  .  ~~~~   ??\        			<----High Hrothgar
				maxTemp = -10		;					  /  .  .  ~~ ??   \
			elseif myZ >= 15750		;Elevation 1		 / .   .    ??      \
				maxTemp = -5		;					/########  ??########\
			endif					;							o    ))))FUS RO DAH))))
									;						 [ ]|/={===>           			<----Dovahkiin
									;						   / \
									;
		;The Rift Block
		elseif (myX <= 210000 &&  myX >= 53800) && (myY <= -66600 && myY >= -150000)
			;notification("I'm in The Rift Block")
			if myZ >= 16600
				maxTemp = -10
			endif
		;Falkreath Hold Block
		elseif (myX <= 53800 &&  myX >= -42500) && (myY <= -66600 && myY >= -150000)
			;notification("I'm in Falkreath Hold Block")
			if myZ >= 7300
				maxTemp = -10
			endif
		;Bleak Falls Barrow Block
		elseif (myX <= 19400 &&  myX >= -42500) && (myY <= -15000 && myY >= -60900)
			;notification("I'm in Black Falls Barrow Block")
			if myZ >= 1500
				maxTemp = -10
			endif
		;Brittleshin Pass Block
		elseif (myX <= 15300 &&  myX >= -42500) && (myY <= -60900 && myY >= -80000)
			;notification("I'm in Brittleshin Pass Block")
			if myZ >= 2000
				maxTemp = -10
			endif
		;Haafingar Block (Dawnguard: catches Castle Volkihar)
		elseif (myX <= -71000 &&  myX >= -185000) && (myY <= 163000 && myY >= 78000)
			;notification("I'm in Haafingar Block")
			if myZ >= -7000
				maxTemp = -10
			else
				maxTemp = -5
			endif
		endif
	else
		;notification("I'm not in Tamriel")
	endif
	
	return maxTemp
endFunction			

int Function GetWeatherTemp(int myMaxTemp)			;Approved 2.5
	Weather myIncomingWeather
	int myCurrWeatherClass
	int myIncomingWeatherClass
	bool bSevereWeather = false
	bool bIncomingSevere = false
	int myWeatherTemp
	int myBaseTemp
	bool bTransitioning
	
	if Weather.GetCurrentWeatherTransition() >= 1.0								;No incoming weather.
		bTransitioning = false
		myIncomingWeather = none
		myCurrWeatherClass = GetWeatherClassificationActual(wMyWeather)
	else																		;Incoming weather.
		bTransitioning = true
		myIncomingWeather = wMyWeather
		wMyWeather = Weather.GetOutgoingWeather()
		myCurrWeatherClass = GetWeatherClassificationActual(wMyWeather)
		myIncomingWeatherClass = GetWeatherClassificationActual(myIncomingWeather)
	endif
	
	int myRegion = GetPlayerRegion()
	
	if myRegion == 9
		myCurrWeatherClass = 0				;Reset the weather class to 0 to avoid losing EP in planes of Oblivion (Soul Cairn, Apocrypha, etc)
	endif
	
	myBaseTemp = GetBaseTemp(myRegion)
	
	;Is the current weather severe?
	if wMyWeather != none
		if _DE_SevereWeatherList.HasForm(wMyWeather)
			bSevereWeather = true
		endif
	endif
	
	;Is the incoming weather severe?
	if myIncomingWeather != none
		if _DE_SevereWeatherList.HasForm(myIncomingWeather)
			bIncomingSevere = true
		endif
	endif	
	
	if myIncomingWeather != myLastIncomingWeather && myIncomingWeather != none
		ShowWeatherTransitionMsg(myCurrWeatherClass, myIncomingWeatherClass, myRegion, bSevereWeather, bIncomingSevere, myMaxTemp)
	endif
		
	myLastIncomingWeather = myIncomingWeather
	
	;Switch the Current Weather Class to the Incoming Weather Class if necessary for determining temperature.
	if bTransitioning
		wMyWeather = myIncomingWeather
		myCurrWeatherClass = myIncomingWeatherClass
	endif
	
	;Is this the same weather and region from the previous update? If so, don't recalculate
	if wMyWeather == myLastWeather && myRegion == myLastRegion
		return myLastWeatherTemp
	endif	
	
	;Check for Worldspace Exception; if none, determine weather temperature
	if myCurrWeatherClass == -1 											;no classification
		myWeatherTemp = (myBaseTemp - 2) - RandomInt(-1, 1)
		_DE_BadWeather.SetValue(0.0)
	elseif myCurrWeatherClass == 0 											;pleasant
		myWeatherTemp = myBaseTemp - RandomInt(-1, 2)
		_DE_BadWeather.SetValue(0.0)
	elseif myCurrWeatherClass == 1 											;cloudy (foggy)
		myWeatherTemp = (myBaseTemp - 3) - RandomInt(-1, 1)
		_DE_BadWeather.SetValue(0.0)
	elseif myCurrWeatherClass == 2 											;rainy
		if bSevereWeather == false											;mild rain
			myWeatherTemp = (myBaseTemp - 5) - RandomInt(-1, 1)
			_DE_BadWeather.SetValue(1.0)
		else																;severe rain
			myWeatherTemp = (myBaseTemp - 7) - RandomInt(-1, 3)
			_DE_BadWeather.SetValue(2.0)
		endif
	elseif myCurrWeatherClass == 3										 	;snowy
		if bSevereWeather == false											;mild snow
			myWeatherTemp = (myBaseTemp - 5) - RandomInt(-2, 2)
			if myWeatherTemp > -5
				myWeatherTemp = -5
			endif
			_DE_BadWeather.SetValue(3.0)
		else																;snowstorm
			myWeatherTemp = (myBaseTemp - 15) - RandomInt(-2, 2)
			if myWeatherTemp > -10
				myWeatherTemp = -10
			endif
			_DE_BadWeather.SetValue(4.0)
		endif
	endif

	;Store the last weather and temperature
	myLastWeather = wMyWeather
	myLastWeatherTemp = myWeatherTemp
	myLastRegion = myRegion
	
	;notification("Returning new weather temp " + myWeatherTemp)
	return myWeatherTemp
endFunction

int function GetBaseTemp(int myRegion)
	;Determine weather base temperature based on region
	if myRegion == -1						;Region lookup failed
		return 9
	elseif myRegion == 1					;Pine Forest
		return 20
	elseif myRegion == 2					;Volcanic Tundra
		return 18
	elseif myRegion == 3					;Fall Forest	
		return 12
	elseif myRegion == 4 || myRegion == 5	;Reach, Tundra
		return 10
	elseif myRegion == 6					;Tundra Marsh
		return 1
	elseif myRegion == 7					;Coast
		return -5
	elseif myRegion == 8					;Snow
		return -10
	elseif myRegion == 9					;Oblivion
		return 16
	
	;			####Official DLC Compatibility####
	elseif myRegion == 10					;DLC1 Worldspace
		return Compatibility.GetPlayerRegionTempDLC1(flvLastPosX, flvLastPosY)
	elseif myRegion == 11
		return Compatibility.GetPlayerRegionTempDLC2(flvLastPosX, flvLastPosY)
	elseif myRegion == 12
		return Compatibility.GetPlayerRegionTempDLC3(flvLastPosX, flvLastPosY)
	elseif myRegion == 13
		return Compatibility.GetPlayerRegionTempDLC4(flvLastPosX, flvLastPosY)
	
	;			####Landmass Mod Compatibility####
	elseif myRegion == 20
		return Compatibility.GetPlayerRegionTempMod1(flvLastPosX, flvLastPosY)
	elseif myRegion == 21
		return Compatibility.GetPlayerRegionTempMod2(flvLastPosX, flvLastPosY)
	elseif myRegion == 22
		return Compatibility.GetPlayerRegionTempMod3(flvLastPosX, flvLastPosY)
	elseif myRegion == 23
		return Compatibility.GetPlayerRegionTempMod4(flvLastPosX, flvLastPosY)
	elseif myRegion == 24
		return Compatibility.GetPlayerRegionTempMod5(flvLastPosX, flvLastPosY)
	elseif myRegion == 25
		return Compatibility.GetPlayerRegionTempMod6(flvLastPosX, flvLastPosY)
	elseif myRegion == 26
		return Compatibility.GetPlayerRegionTempMod7(flvLastPosX, flvLastPosY)
	elseif myRegion == 27
		return Compatibility.GetPlayerRegionTempMod8(flvLastPosX, flvLastPosY)
	elseif myRegion == 28
		return Compatibility.GetPlayerRegionTempMod9(flvLastPosX, flvLastPosY)
	elseif myRegion == 29
		return Compatibility.GetPlayerRegionTempMod10(flvLastPosX, flvLastPosY)
	elseif myRegion == 30
		return Compatibility.GetPlayerRegionTempMod11(flvLastPosX, flvLastPosY)
	elseif myRegion == 31
		return Compatibility.GetPlayerRegionTempMod12(flvLastPosX, flvLastPosY)
	elseif myRegion == 32
		return Compatibility.GetPlayerRegionTempMod13(flvLastPosX, flvLastPosY)
	elseif myRegion == 33
		return Compatibility.GetPlayerRegionTempMod14(flvLastPosX, flvLastPosY)
	elseif myRegion == 34
		return Compatibility.GetPlayerRegionTempMod15(flvLastPosX, flvLastPosY)
	elseif myRegion == 35
		return Compatibility.GetPlayerRegionTempMod16(flvLastPosX, flvLastPosY)
	elseif myRegion == 36
		return Compatibility.GetPlayerRegionTempMod17(flvLastPosX, flvLastPosY)
	elseif myRegion == 37
		return Compatibility.GetPlayerRegionTempMod18(flvLastPosX, flvLastPosY)
	elseif myRegion == 38
		return Compatibility.GetPlayerRegionTempMod19(flvLastPosX, flvLastPosY)
	elseif myRegion == 39
		return Compatibility.GetPlayerRegionTempMod20(flvLastPosX, flvLastPosY)
	endif
endFunction
													;Approved 2.5
float function GetEPChange(int iCurrWeatherTemp, int WetFactor, float ClothingFactor, float FrostFactor, float AuxFactor, bool bNearFire)
	;Wood harvesting check
	if pPlayer.GetCurrentPackage()
		FrostfallDebug(3, "I'm running the wood harvesting package, returning...")
		return 0
	elseif pPlayer.GetRace().HasKeyword(ActorTypeDragon)
		return 0
	endif

    ;Variables
    float fExtremeTemp = _DE_fExtremeTemp.GetValue()								;-40.0
    float fExtremeMult = _DE_fExtremeMult.GetValue()								;3.0
    float fStasisTemp = _DE_fStasisTemp.GetValue()									;10.0
    float fStasisMult = _DE_fStasisMult.GetValue()									;0.0
	float fTimeDeltaSec
    float myPointLoss
	
    ;Calculate EP Loss
    
    ;Calculate the Temperature Multiplier based on a linear plot using the
    ;Extreme vs. Stasis values as given above.
    
    float fSlope = fExtremeMult/(fExtremeTemp-fStasisTemp)		;Rise (multiplier on Y-axis) over Run (distance from hemeostasis temperature)
    float fX = (iCurrWeatherTemp)					;Plug in X (current weather temperature)
    float fB = (-fSlope + fStasisMult)*fStasisTemp				;Calculate Y-intercept
    
    ;notification("Y = " + fSlope + " * " + fX + " + " + fB)
         
    float fTempMultiplier = (fSlope * fX) + fB     				;Slope-intercept form solving for Y
	
	;=====================Master EP Loss Function=======================
	;First, determine the time in real seconds between the last update and this one
	float fTimeDelta = GetCurrentGameTime() - fLastUpdateTime			;(difference in game-time days)
	if fTimeDelta > 0
		fTimeDeltaSec = (fTimeDelta * 86400)/TimeScale.GetValue()		;(difference in real seconds)
	else
		;Return sane value; prevents large initial negative number from completely ruining later calculations
		fTimeDeltaSec = 6.0
	endif
	
	;messagebox("GetCurrentGameTime: " + GetCurrentGameTime() + " - fLastUpdateTime: " + fLastUpdateTime)
	;messagebox("fTimeDeltaSec = (" + fTimeDelta + " * 86400) / " + TimeScale.GetValueInt() + " = " + fTimeDeltaSec)
	
	;Did the player just wait outside in the cold? Let's find out
	FrostfallDebug(1, "START CODE PATH TRACE")
	if bFirstUpdate == false
		FrostfallDebug(1, "bFirstUpdate == FALSE")
		if fTimeDeltaSec >= 180.0
			FrostfallDebug(1, "Player waited!")
			if bLastFastTravelState == false
				FrostfallDebug(1, "Player did not Fast Travel!")
				if Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_SleepObjects, pPlayer,  600.0) == None	;Not near bed, did not fast travel
					FrostfallDebug(1, "NOT near Sleep Object!")
					if bNearFire == false
						FrostfallDebug(1, "NOT Near Fire, time delta = " + fTimeDeltaSec + ", current temp = " + iCurrWeatherTemp)
						if fTimeDeltaSec >= 360.0			;Player waited 2+ hours
							if bInInterior
								DecreaseExposureToCeiling(20.0, 100.0)
							elseif iCurrWeatherTemp <= -15
								IncreaseExposureToCeiling(40.0, 20.0)
							elseif iCurrWeatherTemp < 0
								IncreaseExposureToCeiling(30.0, 40.0)
							else 							;Warmer than 0
								IncreaseExposureToCeiling(20.0, 70.0)
							endif
						elseif fTimeDeltaSec >= 180.0		;Player waited 1 hours
							if bInInterior
								DecreaseExposureToCeiling(10.0, 100.0)
							elseif iCurrWeatherTemp <= -15
								IncreaseExposureToCeiling(20.0, 20.0)
							elseif iCurrWeatherTemp < 0
								IncreaseExposureToCeiling(10.0, 40.0)
							else 							;Warmer than 0
								IncreaseExposureToCeiling(5.0, 70.0)
							endif
						endif
					else
						FrostfallDebug(1, "NEAR Fire, time delta = " + fTimeDeltaSec + ", current temp = " + iCurrWeatherTemp)
						if iCurrWeatherTemp <= -15
							SetExposure(50.0)
						elseif iCurrWeatherTemp < 0
							SetExposure(120.0)
						else 							;Warmer than 0
							SetExposure(120.0)
						endif
					endif
				else
					FrostfallDebug(1, "Near sleep object, bNearFire = " + bNearFire + ", time delta = " + fTimeDeltaSec + ", current temp = " + iCurrWeatherTemp)
					FrostfallDebug(1, "Inside Tent Type " + iIsInTent)
					if fTimeDeltaSec >= 360.0			;Player waited 2+ hours
						if iCurrWeatherTemp <= -15
							if bInInterior
								SetExposure(100.0)
							elseif iIsInTent == 0
								IncreaseExposureToCeiling(40.0, 20.0)
							elseif iIsInTent == 1
								ChangeStateBasedOnWaiting(bNearFire, 120.0, 0.0, 65.0, 30.0)
							elseif iIsInTent == 2
								ChangeStateBasedOnWaiting(bNearFire, 70.0, 0.0, 55.0, 100.0)
							elseif iIsInTent == 3
								ChangeStateBasedOnWaiting(bNearFire, 120.0, 0.0, 65.0, 100.0)
							endif
						elseif iCurrWeatherTemp < 0
							if bInInterior
								SetExposure(100.0)
							elseif iIsInTent == 0
								IncreaseExposureToCeiling(20.0, 40.0)
							elseif iIsInTent == 1
								ChangeStateBasedOnWaiting(bNearFire, 120.0, 0.0, 75.0, 30.0)
							elseif iIsInTent == 2
								ChangeStateBasedOnWaiting(bNearFire, 100.0, 0.0, 65.0, 100.0)
							elseif iIsInTent == 3
								ChangeStateBasedOnWaiting(bNearFire, 120.0, 0.0, 75.0, 100.0)
							endif
						else 							;Warmer than 0
							if bInInterior
								SetExposure(100.0)
							elseif iIsInTent == 0
								IncreaseExposureToCeiling(10.0, 70.0)
							elseif iIsInTent == 1
								ChangeStateBasedOnWaiting(bNearFire, 120.0, 0.0, 85.0, 30.0)
							elseif iIsInTent == 2
								ChangeStateBasedOnWaiting(bNearFire, 100.0, 0.0, 75.0, 100.0)
							elseif iIsInTent == 3
								ChangeStateBasedOnWaiting(bNearFire, 120.0, 0.0, 85.0, 100.0)
							endif
						endif
					elseif fTimeDeltaSec >= 180.0		;Player waited 1 hours
						if iCurrWeatherTemp <= -15
							if bInInterior
								SetExposure(100.0)
							elseif iIsInTent == 0
								IncreaseExposureToCeiling(20.0, 20.0)
							elseif iIsInTent == 1
								DecreaseExposureToCeiling(20.0, 55.0)
							elseif iIsInTent == 2
								DecreaseExposureToCeiling(10.0, 45.0)
							elseif iIsInTent == 3
								DecreaseExposureToCeiling(20.0, 55.0)
							endif
						elseif iCurrWeatherTemp < 0
							if bInInterior
								SetExposure(100.0)
							elseif iIsInTent == 0
								IncreaseExposureToCeiling(10.0, 40.0)
							elseif iIsInTent == 1
								DecreaseExposureToCeiling(20.0, 65.0)
							elseif iIsInTent == 2
								DecreaseExposureToCeiling(10.0, 55.0)
							elseif iIsInTent == 3
								DecreaseExposureToCeiling(20.0, 65.0)
							endif
						else 							;Warmer than 0
							if bInInterior
								SetExposure(100.0)
							elseif iIsInTent == 0
								IncreaseExposureToCeiling(5.0, 70.0)
							elseif iIsInTent == 1
								DecreaseExposureToCeiling(20.0, 75.0)
							elseif iIsInTent == 2
								DecreaseExposureToCeiling(10.0, 65.0)
							elseif iIsInTent == 3
								DecreaseExposureToCeiling(20.0, 75.0)
							endif
						endif
					endif
				endif
			else
				FrostfallDebug(1, "Player Fast Traveled!")
				SetExposure(100.0)
			endif
		elseif fTimeDeltaSec <= 20.0	;Clamp point loss to 20-seconds between intervals
		
			iSlowUpdateCounter = 0
		
			;=====================Master EP Loss Formula=======================
		
			myPointLoss = ((((((fTempMultiplier * 20) + WetFactor)/(ClothingFactor + FrostFactor)) * AuxFactor) * pSetting_ExposureRate) * fTimeDeltaSec) / 60
		
			;==================================================================
	
			FrostfallDebug(1, "Temp" + fTempMultiplier + " Wet" + WetFactor + " Cl" + ClothingFactor + " Fr" + FrostFactor + " Aux" + AuxFactor + " ER" + pSetting_ExposureRate)
			;notification(myPointLoss + "points " + fTimeDeltaSec + " dTime")
	
		else 	;fTimeDeltaSec > 20.0
			iSlowUpdateCounter += 1
			if iSlowUpdateCounter == 4
				if _DE_Setting_SystemMsg.GetValueInt() == 2
					messagebox("Your game's scripting system is running too slowly in order for Frostfall to run correctly. Please see the Troubleshooting page of the online documentation for tips. Your exposure value will not change until this improves. (Last update took " + fTimeDeltaSec + "sec, expected <20.0sec)")
				endif
			endif
		endif
	
	else
		;notification("Ignoring First Update")
		bFirstUpdate = false
	endif
	
	;Now, calculate EP loss per minute, divided by the correct time factor given by the ratio: divide by 12 every 5 seconds
		
	fLastUpdateTime = GetCurrentGameTime()
	return myPointLoss
endfunction

function ChangeStateBasedOnWaiting(bool bNearFire, float fNearFireExposureSetValue, float fNearFireWetSetValue, float fAwayFromFireExposureSetValue, float fAwayFromFireWetChangeValue)
	FrostfallDebug(1, "Changing state based on waiting...")
	if bNearFire
		FrostfallDebug(1, "Near fire!")
		SetExposure(fNearFireExposureSetValue)
		pWetPoints = fNearFireWetSetValue
	else
		FrostfallDebug(1, "NOT near fire!")
		SetExposure(fAwayFromFireExposureSetValue)
		pWetPoints -= fAwayFromFireWetChangeValue
		if pWetPoints < 0.0
			pWetPoints = 0.0
		endif
	endif
endFunction


												;Approved 2.5
function ApplyEP(float currEPChange, int FireFactor, int HeatFactor, int HideTentFactor, int LeatherTentFactor, int WetFactor, bool bNearFire, bool bNearOtherHeatSource)
	int iWeatherClass = 0
	iWeatherClass = GetWeatherClassificationActual(wMyWeather)
	
	if !bPlayerCombatState
		if bInInterior													;In interiors, the player can warm up/dry off completely, and is unaffected by temperature
			if bNearFire
				ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
			elseif bNearOtherHeatSource
				ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
			else
				if iIsInTent == 0		;No Tent
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						;do nothing
					endif		
				elseif iIsInTent == 1	;Hide Tent
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(100.0, HideTentFactor, currEPChange)
					endif			
				elseif iIsInTent == 2	;Leather Tent
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(85.0, LeatherTentFactor, currEPChange)
					endif
				elseif iIsInTent == 3 	;Conjured Shelter
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(100.0, HideTentFactor, currEPChange)
					endif
				endif
			endif
		else
			if Compatibility.isSKSELoaded
				if _DE_Setting_DialogueStop.GetValueInt() == 2
					if UI.IsMenuOpen("Dialogue Menu")
						return
					endif
				endif
			endif
			
			if Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_ExposureExceptions, pPlayer, 500.0)
				return
			endif
				
			if iWeatherClass <= 1		;Pleasant, Cloudy				;In pleasant weather, the player can warm up/dry off completely, with and without a tent
				if iIsInTent == 0		;No Tent
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_EnvironmentChange(100.0, currEPChange)
					endif
				elseif iIsInTent == 1	;Hide Tent
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(100.0, HideTentFactor, currEPChange)
					endif
				elseif iIsInTent == 2	;Leather Tent
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(85.0, LeatherTentFactor, currEPChange)
					endif
				elseif iIsInTent == 3 	;Conjured Shelter
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(100.0, HideTentFactor, currEPChange)
					endif
				endif

			elseif iWeatherClass == 2	;Rainy							;In rainy weather, the player can warm up completely in any tent, and dry off completely in leather tents.
				if iIsInTent == 0 && !bTakingShelter	;No Tent
					if bNearFire
						;trace("Rain, fire, 0")
						ApplyEPLogic_HeatChange(70.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						;trace("Rain, heat, 0")
						ApplyEPLogic_HeatChange(70.0, HeatFactor, currEPChange)
					else
						;trace("Rain, env, 0")
						ApplyEPLogic_EnvironmentChange(100.0, currEPChange)
					endif
				elseif iIsInTent == 1	;Hide Tent
					if bNearFire
						;trace("Rain, fire, 1")
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource	
						;trace("Rain, heat, 1")
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						;trace("Rain, env, 1")
						ApplyEPLogic_HeatChange(100.0, HideTentFactor, currEPChange)
					endif
				elseif iIsInTent == 2 || bTakingShelter	;Leather Tent
					if bNearFire
						;trace("Rain, fire, 2")
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						;trace("Rain, heat, 2")
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						;trace("Rain, env, 2")
						ApplyEPLogic_HeatChange(85.0, LeatherTentFactor, currEPChange)
					endif
				elseif iIsInTent == 3 	;Conjured Shelter
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(100.0, HideTentFactor, currEPChange)
					endif
				endif
				
			elseif iWeatherClass == 3	;Snowy							;In snowy weather, the player can warm up completely in hide tents, and dry off completely in any tent.
				if iIsInTent == 0		;No Tent
					if bNearFire
						ApplyEPLogic_HeatChange(50.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(50.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_EnvironmentChange(100.0, currEPChange)
					endif
				elseif iIsInTent == 1	;Hide Tent
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(100.0, HideTentFactor, currEPChange)
					endif
				elseif iIsInTent == 2	;Leather Tent
					if bNearFire
						ApplyEPLogic_HeatChange(70.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(70.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(60.0, LeatherTentFactor, currEPChange)
					endif
				elseif iIsInTent == 3 	;Conjured Shelter
					if bNearFire
						ApplyEPLogic_HeatChange(120.0, FireFactor, currEPChange)
					elseif bNearOtherHeatSource
						ApplyEPLogic_HeatChange(120.0, HeatFactor, currEPChange)
					else
						ApplyEPLogic_HeatChange(100.0, HideTentFactor, currEPChange)
					endif
				endif
			endif
		endif
	endif

	DebugEPReport(_DE_ExposurePoints.GetValueInt(), bNearFire, bInInterior, currEPChange)
endFunction

function ApplyEPLogic_HeatChange(float EPCap, int WarmthFactor, float currEPChange)						;Approved 2.5	
	if ( _DE_ExposurePoints.GetValue() >= EPCap )							             	;EP +/=
		if ( _DE_ExposurePoints.GetValue() > EPCap )			            				;EP +
			if EPCap == 120.0
				if _DE_Setting_ConditionMsg.GetValueInt() == 2					            ;"You are completely warm."
					_DE_HypoState_0a.Show()
				endif
				SetExposure(EPCap)								            ;Cap at 120
			else																			; > cap; 			 cool off
				;trace("Inside tent or near fire, but I'm above the max allowed. Cooling off...")
				ApplyEPLogic_EnvironmentChange(EPCap, currEPChange, true)
			endif
		else
			;trace("My EP equals the cap.")
		endif
	else																					;EP -                Set value
		;trace("Inside tent or near fire, warming up...")
		SetExposure(_DE_ExposurePoints.GetValue() + WarmthFactor)
	endif
endFunction

function ApplyEPLogic_EnvironmentChange(float EPCeiling, float currEPChange, bool bNearHeat = false)	;Approved 2.5
	if currEPChange < 0
		if ( _DE_ExposurePoints.GetValue() >= EPCeiling )									;Fire - Temp + EP +   Do Nothing
			;n/a
		else																				;Fire - Temp + EP -   Set Value
			if bNearHeat
				if ((_DE_ExposurePoints.GetValue() - currEPChange) > EPCeiling) && (_DE_ExposurePoints.GetValue() < EPCeiling)
					SetExposure(EPCeiling)
					_DE_Tent_WarmCap.Show()													;you can't seem to get any warmer
				else
					SetExposure(_DE_ExposurePoints.GetValue() - currEPChange)
				endif
			else
				SetExposure(_DE_ExposurePoints.GetValue() - currEPChange)
			endif
		endif
	else																					;Fire - Temp - EP ?   Set Value
		if bNearHeat
			if ((_DE_ExposurePoints.GetValue() - currEPChange) < EPCeiling) && (_DE_ExposurePoints.GetValue() > EPCeiling)
				SetExposure(EPCeiling)
				if iIsInTent > 0 || bTakingShelter
					_DE_Tent_ColdCap.Show()													;Your shelter prevents you from getting colder
				else
					_DE_ColdCap.Show()
				endif
			else
				SetExposure(_DE_ExposurePoints.GetValue() - currEPChange)
			endif
		else
			SetExposure(_DE_ExposurePoints.GetValue() - currEPChange)
		endif
	endif
endFunction

function ShowWeatherTransitionMsg(int myCurrWeatherClass, int myIncomingWeatherClass, int myRegion, bool bSevereWeather, bool bIncomingSevere, int myMaxTemp)
	if !bInInterior && pSetting_MsgWeather
		if myIncomingWeatherClass == -1 || myIncomingWeatherClass == 0
			if myCurrWeatherClass == 2											;Clear weather is incoming, rainy weather is outgoing
				if bSevereWeather == false
					FrostfallDebug(4, "Weather Transition INCOMING: CLEAR     OUTGOING: RAIN")
					_DE_Weather_RainToClear.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: CLEAR     OUTGOING: STORM")
					_DE_Weather_StormToClear.Show()
				endif
			elseif myCurrWeatherClass == 3										;Clear weather is incoming, snowy weather is outgoing
				if bSevereWeather == false
					FrostfallDebug(4, "Weather Transition INCOMING: CLEAR     OUTGOING: SNOW")
					_DE_Weather_SnowToClear.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: CLEAR     OUTGOING: BLIZZARD")
					_DE_Weather_BlizzardToClear.Show()
				endif
			endif
		elseif myIncomingWeatherClass == 1
			if myCurrWeatherClass == -1 || myCurrWeatherClass == 0 				;fog incoming, clear outgoing
				if myRegion == -1
					_DE_Weather_ClearToFog1.Show()
				elseif myRegion == 1	;Pine Forest
					_DE_Weather_ClearToFog2.Show()
				elseif myRegion == 2	;Volcanic Tundra
					_DE_Weather_ClearToFog3.Show()
				elseif myRegion == 3	;Fall Forest
					_DE_Weather_ClearToFog4.Show()
				elseif myRegion == 4	;Reach
					_DE_Weather_ClearToFog5.Show()
				elseif myRegion == 6	;Tundra Marsh
					_DE_Weather_ClearToFog6.Show()
				elseif myRegion == 7	;Coast
					_DE_Weather_ClearToFog7.Show()
				endif
				;#Region Debug Message
				if _DE_EPDebug.GetValueInt() == 1
					FrostfallDebug(4, "Weather Transition INCOMING: FOG     OUTGOING: CLEAR")
				endif
				;#EndRegion
			elseif myCurrWeatherClass == 2										;Fog incoming, rain outgoing
				;#Region Debug Message
				if _DE_EPDebug.GetValueInt() == 1
					FrostfallDebug(4, "Weather Transition INCOMING: FOG     OUTGOING: RAIN")
				endif
				;#EndRegion
				_DE_Weather_RainToFog.Show()
			endif
		elseif myIncomingWeatherClass == 2
			if myCurrWeatherClass == -1 || myCurrWeatherClass == 0 				;Rain incoming, clear outgoing
				if bIncomingSevere == false
					FrostfallDebug(4, "Weather Transition INCOMING: RAIN     OUTGOING: CLEAR")
					_DE_Weather_ClearToRain.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: STORM     OUTGOING: CLEAR")
					_DE_Weather_ClearToStorm.Show()
				endif
			elseif myCurrWeatherClass == 1										;Rain incoming, fog outgoing
				if bIncomingSevere == false
					FrostfallDebug(4, "Weather Transition INCOMING: RAIN     OUTGOING: FOG")
					_DE_Weather_FogToRain.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: STORM     OUTGOING: FOG")
					_DE_Weather_FogToStorm.Show()
				endif
			elseif myCurrWeatherClass == 3										;Rain incoming, snow outgoing
				;#Region Debug Message
				if _DE_EPDebug.GetValueInt() == 1
					FrostfallDebug(4, "Weather Transition INCOMING: RAIN     OUTGOING: SNOW")
				endif
				;#EndRegion
				_DE_Weather_SnowToRain.Show()
			endif
		elseif myIncomingWeatherClass == 3
			if myCurrWeatherClass == -1 || myCurrWeatherClass == 0 				;Snow incoming, clear outgoing
				if bIncomingSevere == false
					FrostfallDebug(4, "Weather Transition INCOMING: SNOW     OUTGOING: CLEAR")
					_DE_Weather_ClearToSnow.Show()
				else
					if myMaxTemp != 100
						FrostfallDebug(4, "Weather Transition INCOMING: MOUNTAIN BLIZZARD    OUTGOING: CLEAR")
						_DE_Weather_ClearToSnowMountain.Show()
					else
						FrostfallDebug(4, "Weather Transition INCOMING: BLIZZARD     OUTGOING: CLEAR")
						_DE_Weather_ClearToSnowSevere.Show()
					endif
				endif
			elseif myCurrWeatherClass == 3										;Snow incoming, rain outgoing
				if bIncomingSevere == false
					FrostfallDebug(4, "Weather Transition INCOMING: SNOW     OUTGOING: RAIN")
					_DE_Weather_RainToSnow.Show()
				else
					FrostfallDebug(4, "Weather Transition INCOMING: BLIZZARD     OUTGOING: RAIN")
					_DE_Weather_RainToSnowSevere.Show()
				endif
			endif
		endif
	endif
endFunction

function FrostfallDebug(int iClassification, string sDebugMessage)
	;1 = Primary exposure system messages.
	;2 = Quest state data
	;3 = Misc info
	;4 = Weather-related
	;5 = Armor
	if _DE_EPDebug.GetValueInt() == iClassification
		trace("[Frostfall] " + sDebugMessage)
	endif
endFunction

function ShowHelp(int iMessage)						;Approved 2.5
	if iMessage == 1
		_DE_Help_ExposurePoints.Show()
		_DE_HelpDone_ExposurePoints.SetValue(2)
	elseif iMessage == 2
		_DE_Help_Vampirism.Show()
		_DE_HelpDone_Vampirism.SetValue(2)
	elseif iMessage == 3
		_DE_Help_Wet.Show()
		_DE_HelpDone_Wet.SetValue(2)
	endif
endFunction

int function GetPlayerRegion()						;Approved 2.5	
	WorldSpace myWS = pPlayer.GetWorldspace()
	
	if IsInRegion1
		return 1
	elseif IsInRegion2
		return 2
	elseif IsInRegion3
		return 3
	elseif IsInRegion4
		return 4
	elseif IsInRegion5
		return 5
	elseif IsInRegion6
		return 6
	elseif IsInRegion7
		return 7
	elseif IsInRegion8
		return 8
	elseif _DE_WorldspacesExteriorPineForest.HasForm(myWS)
		return 1
	elseif _DE_WorldspacesExteriorVolcanicTundra.HasForm(myWS)
		return 2
	elseif _DE_WorldspacesExteriorFallForest.HasForm(myWS)
		return 3
	elseif _DE_WorldspacesExteriorWhiterun.HasForm(myWS)
		return 4
	elseif _DE_WorldspacesExteriorTundraMarsh.HasForm(myWS)
		return 6
	elseif _DE_WorldspacesExteriorCoast.HasForm(myWS)
		return 7
	elseif _DE_WorldspacesExteriorSnowy.HasForm(myWS)
		return 8
	elseif _DE_WorldspacesExteriorOblivion.HasForm(myWS)
		return 9
	elseif Compatibility.isDLC1Loaded && myWS == Compatibility.DLC1WS
		return 10
	elseif Compatibility.isDLC2Loaded && myWS == Compatibility.DLC2WS
		return 11
	elseif Compatibility.isDLC3Loaded && myWS == Compatibility.DLC3WS
		return 12
	elseif Compatibility.isDLC4Loaded && myWS == Compatibility.DLC4WS
		return 13
	elseif Compatibility.isMod1Loaded && myWS == Compatibility.Mod1WS
		return 20
	elseif Compatibility.isMod2Loaded && myWS == Compatibility.Mod2WS
		return 21
	elseif Compatibility.isMod3Loaded && myWS == Compatibility.Mod3WS
		return 22
	elseif Compatibility.isMod4Loaded && myWS == Compatibility.Mod4WS
		return 23
	elseif Compatibility.isMod5Loaded && myWS == Compatibility.Mod5WS
		return 24
	elseif Compatibility.isMod6Loaded && myWS == Compatibility.Mod6WS
		return 25
	elseif Compatibility.isMod7Loaded && myWS == Compatibility.Mod7WS
		return 26
	elseif Compatibility.isMod8Loaded && myWS == Compatibility.Mod8WS
		return 27
	elseif Compatibility.isMod9Loaded && myWS == Compatibility.Mod9WS
		return 28
	elseif Compatibility.isMod10Loaded && myWS == Compatibility.Mod10WS
		return 29
	elseif Compatibility.isMod11Loaded && myWS == Compatibility.Mod11WS
		return 30
	elseif Compatibility.isMod12Loaded && myWS == Compatibility.Mod12WS
		return 31
	elseif Compatibility.isMod13Loaded && myWS == Compatibility.Mod13WS
		return 32
	elseif Compatibility.isMod14Loaded && myWS == Compatibility.Mod14WS
		return 33
	elseif Compatibility.isMod15Loaded && myWS == Compatibility.Mod15WS
		return 34
	elseif Compatibility.isMod16Loaded && myWS == Compatibility.Mod16WS
		return 35
	elseif Compatibility.isMod17Loaded && myWS == Compatibility.Mod17WS
		return 36
	elseif Compatibility.isMod18Loaded && myWS == Compatibility.Mod18WS
		return 37
	elseif Compatibility.isMod19Loaded && myWS == Compatibility.Mod19WS
		return 38
	elseif Compatibility.isMod20Loaded && myWS == Compatibility.Mod20WS
		return 39
	else
		return -1
	endif
endFunction

;@TODO: Switch to CampfireIsInInterior(ObjectReference akObject)
function IsPlayerInInterior()						;Approved 2.5
	if pPlayer.IsInInterior()
		bInInterior = true
	else
		if _DE_WorldspacesInteriors.HasForm(pPlayer.GetWorldSpace())
			bInInterior = true
		else
			bInInterior = false
		endif
	endif
endFunction

int function GetWeatherClassificationActual(Weather myWeather)	
	if !myWeather
		return -1
	endif
	
	if _DE_OvercastWeatherList.HasForm(myWeather)
		return 0
	endif
	
	int iClass = myWeather.GetClassification()
	
	if iClass == 3
		if Compatibility.isDLC2Loaded
			if myWeather == Compatibility.DLC2AshStorm
				return 1
			else
				return 3
			endif
		else
			return 3
		endif
	else
		return iClass
	endif
endFunction

function SetExposure(float myExposure)
	FrostfallDebug(1, "Setting exposure to " + myExposure)
	_DE_ExposurePoints.SetValue(myExposure)
endFunction

function IncreaseExposureToCeiling(float fAmount, float fCeiling)
	FrostfallDebug(1, "Increasing exposure to ceiling, Amount = " + fAmount + ", Ceiling = " + fCeiling)
	if _DE_ExposurePoints.GetValue() > (fCeiling + fAmount)
		SetExposure(_DE_ExposurePoints.GetValue() - fAmount)
	else
		if _DE_ExposurePoints.GetValue() > fCeiling
			SetExposure(fCeiling)
		endif
	endif
endFunction

function DecreaseExposureToCeiling(float fAmount, float fCeiling)
	FrostfallDebug(1, "Decreasing exposure to ceiling, Amount = " + fAmount + ", Ceiling = " + fCeiling)
	if _DE_ExposurePoints.GetValue() < (fCeiling - fAmount)
		SetExposure(_DE_ExposurePoints.GetValue() + fAmount)
	else
		if _DE_ExposurePoints.GetValue() < fCeiling
			SetExposure(fCeiling)
		endif
	endif
endFunction

float function GetDistanceWithPos(float firstX, float firstY, float firstZ, float secondX, float secondY, float secondZ)
	float a = abs(pow((firstZ - secondZ), 2))
	float b = abs(pow((firstY - secondY), 2))
	float c = abs(pow((firstX - secondX), 2))
	float h = a + b + c
	h = sqrt(h)
	;debug.trace("[Frostfall] Distance: " + h)
	return h
endFunction

int function GetNearerIndex(float firstX, float firstY, float firstZ, float secondX, float secondY, float secondZ, int newIndex)
	float tempDist = GetDistanceWithPos(firstX, firstY, firstZ, secondX, secondY, secondZ)
	if tempDist < nearestDist
		nearestDist = tempDist
		return newIndex
	else
		return rescueDestinationIndex
	endif
endFunction

function RescueStartEffect(bool bInWater = false)
	Game.ForceFirstPerson()
	Game.DisablePlayerControls(true,true,true,true,true,true)
	
	if bInWater == false
		pPlayer.PlayIdle(TG05_KnockOut)
		utility.Wait(1.1)
	endif
	FadeToBlackImod.ApplyCrossFade()
	if bInWater == false
		utility.Wait(1.1)
		PHYGenericDirtHeavyH.Play(pPlayer)
		utility.Wait(0.1)
		PHYGenericDirtHeavyH.Play(pPlayer)
		utility.wait(0.8)
		PHYGenericDirtHeavyH.Play(pPlayer)
		utility.Wait(0.3)
	else
		utility.Wait(2.3)
	endif
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)

	;Move player, set exposure
	;Advance time by 2 hours
	if GameHour.GetValue() <= 21.9
		GameHour.SetValue(GameHour.GetValue() + 2.0)
	else
		GameHour.SetValue(0.0)
	endif
	
	_DE_ExposurePoints.SetValueInt(25)
endFunction

function RescueEndEffect()
	FadeToBlackHoldImod.PopTo(SleepyTimeFadeIn)
	pPlayer.PlayIdle(Idle_1stPersonWoozyGetUpFromBed)
	utility.wait(1)
	Game.EnablePlayerControls()
	pPlayer.EquipItem(_DE_FrostbittenPotion, false, true)
	_DE_FrostbiteMsg.Show()
endFunction

function RescueFailsafeMessage()
	_DE_RescueMsg_Failsafe.Show()
endFunction

function RescueMovePlayerAndFollowers(ObjectReference akDestinationObject, float x = 0.0, float y = 0.0, float z = 0.0, float az = 0.0)
	if akDestinationObject != none
		_DE_RescueDestinationMarker.MoveTo(akDestinationObject, abMatchRotation = true)
	else
		_DE_RescueDestinationMarker.MoveTo(pPlayer)
	endif
	if x != 0.0 && y != 0.0 && z != 0.0 && az != 0.0
		_DE_RescueDestinationMarker.SetPosition(x, y, z)
		_DE_RescueDestinationMarker.SetAngle(0.0, 0.0, az)
	endif
	pPlayer.MoveTo(_DE_RescueDestinationMarker, abMatchRotation = true)
	if StaticFollower1.GetActorRef()
		StaticFollower1.GetActorRef().MoveTo(_DE_RescueDestinationMarker)
	endif
	if StaticFollower2.GetActorRef()
		StaticFollower2.GetActorRef().MoveTo(_DE_RescueDestinationMarker)
	endif
	if StaticFollower3.GetActorRef()
		StaticFollower3.GetActorRef().MoveTo(_DE_RescueDestinationMarker)
	endif
	if StaticDog.GetActorRef()
		StaticDog.GetActorRef().MoveTo(_DE_RescueDestinationMarker)
	endif
endFunction

function FindAndMoveToCOCMarker()
	if pPlayer.IsInInterior()
		ObjectReference myMarker = Game.FindClosestReferenceOfTypeFromRef(COCMarkerHeading, pPlayer, 8000.0)
		if myMarker != none
			pPlayer.MoveTo(myMarker, abMatchRotation = true)
			if StaticFollower1.GetActorRef()
				StaticFollower1.GetActorRef().MoveTo(myMarker)
			endif
			if StaticFollower2.GetActorRef()
				StaticFollower2.GetActorRef().MoveTo(myMarker)
			endif
			if StaticFollower3.GetActorRef()
				StaticFollower3.GetActorRef().MoveTo(myMarker)
			endif
			if StaticDog.GetActorRef()
				StaticDog.GetActorRef().MoveTo(myMarker)
			endif
		else
			pPlayer.SetPosition(0.0, 0.0, 0.0)
			if StaticFollower1.GetActorRef()
				StaticFollower1.GetActorRef().SetPosition(0.0, 0.0, 0.0)
			endif
			if StaticFollower2.GetActorRef()
				StaticFollower2.GetActorRef().SetPosition(0.0, 0.0, 0.0)
			endif
			if StaticFollower3.GetActorRef()
				StaticFollower3.GetActorRef().SetPosition(0.0, 0.0, 0.0)
			endif
			if StaticDog.GetActorRef()
				StaticDog.GetActorRef().SetPosition(0.0, 0.0, 0.0)
			endif
		endif
	endif
endFunction

function FindNearestRescueLocation()

	float pX = pPlayer.GetPositionX()
	float pY = pPlayer.GetPositionY()
	float pZ = pPlayer.GetPositionZ()

	nearestDist = 9999999999999999.0
	rescueDestinationIndex = 0
	
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 140737.09, 106343.84, -13651.3, 101)
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 51273.34, 122487.61, -13904.53, 102)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 114249.54, -97344.74, 13451.41, 103)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 3870.03, -788875.62, 4329.36, 104)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -67879.52, 142212.31, -13953.21, 105)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -153431.19, 111832.77, -13880.53, 106)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 168690.56, -51559.07, 5640.32, 107)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 146606.0, -82556.13, -13549.97, 108)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 105746.59, 31246.81, -10390.98, 109)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 83640.48, 110224.12, -13467.42, 110)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 25871.0, 46301.0, -5013.67, 111)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -73657.84, 90966.23, -13923.84, 112)

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -6949.0, 65466.22, -11584.55, 200)		;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -25965.32, -105386.63, 12612.95, 201)	;NPC
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 118200.54, -81600.09, 11014.21, 202)	;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 196353.59, -117115.1, 13223.43, 203)  	;Stendarr's Beacon
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 102442.45, -57511.14, 11076.83, 204)	;Guards
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 122056.44, -35001.86, -9936.53, 205)	;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 71056.38, 57366.27, -3928.56, 206)		;NPCs

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -64154.67, -39697.98, -1086.85, 300)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 185655.47, -37709.24, 5770.93, 301)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 113070.53, -25050.97, -10087.63, 302)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 35403.59, 84115.66, -8072.59, 303)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -20098.11, -62001.73, 636.08, 304)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -56964.62, -55207.97, 1494.54, 305)		;Hunter		
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -15489.56, 26036.83, -1273.99, 306)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -47067.44, 43420.13, -6086.28, 307)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 150894.58, -9137.76, -9304.45, 308)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 158177.19, -83535.55, 11018.53, 309)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -278.40, -60866.98, 614.83, 310)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 153947.91, 17389.73, -4720.31, 311)		;Hunter

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 23226.89, -44453.6, -7.95, 400)			;VILLAGE Riverwood
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 163534.72, -59796.79, 7047.55, 401)	;VILLAGE Shor's Stone
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -83300.04, 8373.52, -4016.59, 402)		;VILLAGE Rorikstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135846.08, 10816.69, -11877.58, 403)	;VILLAGE Kynesgrove
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -100990.3, 83896.63, -11926.16, 404)	;VILLAGE Dragon Bridge
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 76541.18, -65496.84, 10921.82, 405)		;VILLAGE Ivarstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 73552.68, 47321.82, -5894.73, 406)		;VILLAGE Nightgate Inn

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 110166.94, 101580.95, -8954.6, 500)		;CITY Winterhold
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135003.8, 34535.86, -12441.75, 501)		;CITY Windhelm
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -66044.98, 104218.75, -8424.6, 502)		;CITY Solitude
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -172844.2, 5545.82, -3349.18, 503)		;CITY Markarth
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 19192.53, -7429.48, -3609.14, 504)		;CITY Whiterun
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 505)	;CITY Riften
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -32144.70, -87707.61, -3088.38, 506)	;CITY Falkreath
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -40035.86, 65436.5, -13802.67, 507)		;CITY Morthal
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 29357.21, 102187.91, -13208.51, 508)	;CITY Dawnstar

	if _DE_HFLoaded.GetValueInt() == 2
		rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 600)	;HEARTHFIRE Pale
		rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 601)	;HEARTHFIRE Falkreath
		rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 602)	;HEARTHFIRE Morthal
	endif
endFunction

function FindNearestSettlementDLC2()
	float pX = pPlayer.GetPositionX()
	float pY = pPlayer.GetPositionY()
	float pZ = pPlayer.GetPositionZ()

	nearestDist = 9999999999999999.0
	rescueDestinationIndex = 0

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 31684, 34032, 386, 1000)		;Raven Rock
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 73188, 70731, 2899, 1001)		;Skald Village
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 75359, 26012, 1644, 1002)		;Tel Mithryn
endFunction

function GoToNearestSettlementDLC2()
	if rescueDestinationIndex == 1000
		RescueMovePlayerAndFollowers(none, 31684, 34032, 386, 320.44)
	elseif rescueDestinationIndex == 1001
		RescueMovePlayerAndFollowers(none, 731188, 70731, 2899, 65.84)
	elseif rescueDestinationIndex == 1002
		RescueMovePlayerAndFollowers(none, 75359, 26012, 1644, 330.0)
	endif
endFunction

bool function RescuePlayer(bool bInWater = false)
	;Determine rescue type
	if _DE_FollowerCount.GetValueInt() > 0 			;Follower Rescues
		bool bWillBuildFire

		if _DE_RescueChanceFollower.GetValue() < RandomFloat()
			return false
		endif

		RescueStartEffect(bInWater)
		;Check trees
		if Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_Trees, pPlayer, 3000.0) != none || Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_DeadwoodList, pPlayer, 3000.0) != none
			int i = RandomInt(1, 100)
			if i <= 20
				bWillBuildFire = true
			endif
		endif
		;Else, go to nearest location
		if !bWillBuildFire
			if pPlayer.GetWorldspace() == Tamriel
				FindNearestRescueLocation()
				if IsBetween(rescueDestinationIndex, 100, 199)
					RescueFollowerTakenToOther()
				elseif IsBetween(rescueDestinationIndex, 200, 299)
					RescueFollowerPasserby()
				elseif IsBetween(rescueDestinationIndex, 300, 399)
					RescueFollowerHunterCamp()
				elseif IsBetween(rescueDestinationIndex, 400, 599)
					RescueFollowerTakenToNearestSettlement()
				endif
			elseif Compatibility.isDLC1Loaded == true && pPlayer.GetWorldspace() == Compatibility.DLC1WS ;Forgotten Vale
				RescueMovePlayerAndFollowers(none, 14107, 19076, 1924, 20.77)
			elseif Compatibility.isDLC2Loaded == true && pPlayer.GetWorldspace() == Compatibility.DLC2WS ;Solstheim
				FindNearestSettlementDLC2()
				GoToNearestSettlementDLC2()
				;message
			else
				;Failsafe!
				GoToRandomSettlement()
				RescueFailsafeMessage()
			endif
		else
			RescueFollowerBuildsCampfire()
		endif
		RescueEndEffect()
		return true
	
	elseif StaticDog.GetActorRef() != none			;Dog Rescues
		
		if _DE_RescueChanceFollower.GetValue() < RandomFloat()
			return false
		endif

		RescueStartEffect(bInWater)
		if pPlayer.GetWorldspace() == Tamriel
			FindNearestRescueLocation()
			if IsBetween(rescueDestinationIndex, 100, 199)
				RescueDogTakenToOther()
			elseif IsBetween(rescueDestinationIndex, 200, 299)
				RescueDogPasserby()
			elseif IsBetween(rescueDestinationIndex, 300, 399)
				RescueDogHunterCamp()
			elseif IsBetween(rescueDestinationIndex, 400, 599)
				RescueDogTakenToNearestSettlement()
			endif
		elseif Compatibility.isDLC1Loaded == true && pPlayer.GetWorldspace() == Compatibility.DLC1WS ;Forgotten Vale
			RescueMovePlayerAndFollowers(none, 14107, 19076, 1924, 20.77)
		elseif Compatibility.isDLC2Loaded == true && pPlayer.GetWorldspace() == Compatibility.DLC2WS ;Solstheim
			FindNearestSettlementDLC2()
			GoToNearestSettlementDLC2()
			;message
		else
			;Failsafe!
			GoToRandomSettlement()
			RescueFailsafeMessage()
		endif
		RescueEndEffect()
		return true
	else 											;Alone Rescues
		
		if _DE_RescueChanceAlone.GetValue() < RandomFloat()
			return false
		endif

		RescueStartEffect(bInWater)
		if pPlayer.GetWorldspace() == Tamriel
			;Is player near a hunter camp?
			if CheckNearHunterCamp()
				RescueAloneHunterCamp()
			;Is player near passersby?
			elseif CheckNearPasserby()
				RescueAlonePasserby()
			;Decide random fate
			else
				if Alias_LoveInterest.GetActorRef() != none
					int i = RandomInt(1, 100)
					if IsBetween(i, 1, 25)
						RescueAloneTakenToDistantSettlement()
					elseif IsBetween(i, 26, 50)
						RescueAloneTakenToDistantSettlementAndRobbed()
					elseif IsBetween(i, 51, 75)
						RescueAloneTakenHomeToSpouse()
					elseif IsBetween(i , 76, 100)
						RescueAloneTakenToOtherAndRobbed()
					endif
				else
					int i = RandomInt(1, 100)
					if IsBetween(i, 1, 33)
						RescueAloneTakenToDistantSettlement()
					elseif IsBetween(i, 34, 66)
						RescueAloneTakenToDistantSettlementAndRobbed()
					elseif IsBetween(i , 67, 100)
						RescueAloneTakenToOtherAndRobbed()
					endif
				endif
			endif
		elseif Compatibility.isDLC1Loaded == true && pPlayer.GetWorldspace() == Compatibility.DLC1WS ;Forgotten Vale
			RescueMovePlayerAndFollowers(none, 14107, 19076, 1924, 20.77)
		elseif Compatibility.isDLC2Loaded == true && pPlayer.GetWorldspace() == Compatibility.DLC2WS ;Solstheim
			FindNearestSettlementDLC2()
			GoToNearestSettlementDLC2()
			;message
		else
			;Failsafe!
			GoToRandomSettlement()
			RescueFailsafeMessage()
		endif
		RescueEndEffect()
		return true
	endif
endFunction

bool function CheckNearPasserby() 													;DONE
	float pX = pPlayer.GetPositionX()
	float pY = pPlayer.GetPositionY()
	float pZ = pPlayer.GetPositionZ()

	nearestDist = 9999999999999999.0
	rescueDestinationIndex = 0

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -6949.0, 65466.22, -11584.55, 200)		;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -25965.32, -105386.63, 12612.95, 201)	;NPC
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 118200.54, -81600.09, 11014.21, 202)	;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 196353.59, -117115.1, 13223.43, 203)  	;Stendarr's Beacon
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 102442.45, -57511.14, 11076.83, 204)	;Guards
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 122056.44, -35001.86, -9936.53, 205)	;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 71056.38, 57366.27, -3928.56, 206)		;NPCs

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 23226.89, -44453.6, -7.95, 400)			;VILLAGE Riverwood
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 163534.72, -59796.79, 7047.55, 401)	;VILLAGE Shor's Stone
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -83300.04, 8373.52, -4016.59, 402)		;VILLAGE Rorikstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135846.08, 10816.69, -11877.58, 403)	;VILLAGE Kynesgrove
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -100990.3, 83896.63, -11926.16, 404)	;VILLAGE Dragon Bridge
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 76541.18, -65496.84, 10921.82, 405)		;VILLAGE Ivarstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 73552.68, 47321.82, -5894.73, 406)		;VILLAGE Nightgate Inn

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 110166.94, 101580.95, -8954.6, 500)		;CITY Winterhold
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135003.8, 34535.86, -12441.75, 501)		;CITY Windhelm
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -66044.98, 104218.75, -8424.6, 502)		;CITY Solitude
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -172844.2, 5545.82, -3349.18, 503)		;CITY Markarth
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 19192.53, -7429.48, -3609.14, 504)		;CITY Whiterun
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 505)	;CITY Riften
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -32144.70, -87707.61, -3088.38, 506)	;CITY Falkreath
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -40035.86, 65436.5, -13802.67, 507)		;CITY Morthal
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 29357.21, 102187.91, -13208.51, 508)	;CITY Dawnstar
	
	if rescueDestinationIndex != 0 && nearestDist <= 16000.0
		;debug.trace("[Frostfall] I am near a passerby! " + rescueDestinationIndex + " " + nearestDist)
		return true
	else
		;debug.trace("[Frostfall] I am NOT near a passerby! " + rescueDestinationIndex + " " + nearestDist)
		return false
	endif
endFunction

bool function CheckNearHunterCamp()													;DONE
	float pX = pPlayer.GetPositionX()
	float pY = pPlayer.GetPositionY()
	float pZ = pPlayer.GetPositionZ()

	nearestDist = 9999999999999999.0
	rescueDestinationIndex = 0

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -64154.67, -39697.98, -1086.85, 300)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 185655.47, -37709.24, 5770.93, 301)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 113070.53, -25050.97, -10087.63, 302)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 35403.59, 84115.66, -8072.59, 303)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -20098.11, -62001.73, 636.08, 304)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -56964.62, -55207.97, 1494.54, 305)		;Hunter		
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -15489.56, 26036.83, -1273.99, 306)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -47067.44, 43420.13, -6086.28, 307)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 150894.58, -9137.76, -9304.45, 308)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 158177.19, -83535.55, 11018.53, 309)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -278.40, -60866.98, 614.83, 310)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 153947.91, 17389.73, -4720.31, 311)		;Hunter

	if rescueDestinationIndex != 0 && nearestDist <= 16000.0
		return true
	else
		return false
	endif
endFunction

function GoToRandomSettlement()														;DONE
	int i = RandomInt(1, 15)

	if i == 1 				;VILLAGE Riverwood
		RescueMovePlayerAndFollowers(_DE_MarkerRiverwood)
		rescueDestinationIndex = 400
	elseif i == 2			;VILLAGE Rorikstead
		RescueMovePlayerAndFollowers(_DE_MarkerRorikstead)
		rescueDestinationIndex = 402
	elseif i == 3			;VILLAGE Kynesgrove
		RescueMovePlayerAndFollowers(_DE_MarkerKynesgrove)
		rescueDestinationIndex = 403
	elseif i == 4			;VILLAGE Dragon Bridge
		RescueMovePlayerAndFollowers(_DE_MarkerDragonbridge)
		rescueDestinationIndex = 404
	elseif i == 5			;VILLAGE Ivarstead
		RescueMovePlayerAndFollowers(_DE_MarkerIvarstead)
		rescueDestinationIndex = 405
	elseif i == 6			;VILLAGE Nightgate Inn
		RescueMovePlayerAndFollowers(_DE_MarkerNightgateInn)
		rescueDestinationIndex = 406
	elseif i == 7			;CITY Winterhold
		RescueMovePlayerAndFollowers(_DE_MarkerWinterhold)
		rescueDestinationIndex = 500
	elseif i == 8			;CITY Windhelm
		RescueMovePlayerAndFollowers(_DE_MarkerWindhelm)
		rescueDestinationIndex = 501
	elseif i == 9			;CITY Solitude
		RescueMovePlayerAndFollowers(_DE_MarkerSolitude)
		rescueDestinationIndex = 502
	elseif i == 10			;CITY Markarth
		RescueMovePlayerAndFollowers(_DE_MarkerMarkarth)
		rescueDestinationIndex = 503
	elseif i == 11			;CITY Whiterun
		RescueMovePlayerAndFollowers(_DE_MarkerWhiterun)
		rescueDestinationIndex = 504
	elseif i == 12			;CITY Riften
		RescueMovePlayerAndFollowers(_DE_MarkerRiften)
		rescueDestinationIndex = 505
	elseif i == 13			;CITY Falkreath
		RescueMovePlayerAndFollowers(_DE_MarkerFalkreath)
		rescueDestinationIndex = 506
	elseif i == 14			;CITY Morthal
		RescueMovePlayerAndFollowers(_DE_MarkerMorthal)
		rescueDestinationIndex = 507
	elseif i == 15			;CITY Dawnstar
		RescueMovePlayerAndFollowers(_DE_MarkerDawnstar)
		rescueDestinationIndex = 508
	endif
endFunction
function GoToNearestPasserby()														;DONE
	if rescueDestinationIndex == 200
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -6949.0, 65466.22, -11584.55, 186.45)		;NPCs
	elseif rescueDestinationIndex == 201
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -25965.32, -105386.63, 12612.95, 330.95)	;NPC
	elseif rescueDestinationIndex == 202
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 118200.54, -81600.09, 11014.21, 256.17)		;NPCs
	elseif rescueDestinationIndex == 203
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 196353.59, -117115.1, 13223.43, 98.68)  	;Stendarr's Beacon
	elseif rescueDestinationIndex == 204
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 102442.45, -57511.14, 11076.83, 309.25)		;Guards
	elseif rescueDestinationIndex == 205
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 122056.44, -35001.86, -9936.53, 200.32)		;NPCs
	elseif rescueDestinationIndex == 206
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 71056.38, 57366.27, -3928.56, 5.29)			;NPCs
	elseif rescueDestinationIndex == 400 															;VILLAGE Riverwood
		RescueMovePlayerAndFollowers(_DE_MarkerRiverwood)
	elseif rescueDestinationIndex == 402															;VILLAGE Rorikstead
		RescueMovePlayerAndFollowers(_DE_MarkerRorikstead)
	elseif rescueDestinationIndex == 403															;VILLAGE Kynesgrove
		RescueMovePlayerAndFollowers(_DE_MarkerKynesgrove)
	elseif rescueDestinationIndex == 404															;VILLAGE Dragon Bridge
		RescueMovePlayerAndFollowers(_DE_MarkerDragonbridge)
	elseif rescueDestinationIndex == 405															;VILLAGE Ivarstead
		RescueMovePlayerAndFollowers(_DE_MarkerIvarstead)
	elseif rescueDestinationIndex == 406															;VILLAGE Nightgate Inn
		RescueMovePlayerAndFollowers(_DE_MarkerNightgateInn)
	elseif rescueDestinationIndex == 500															;CITY Winterhold
		RescueMovePlayerAndFollowers(_DE_MarkerWinterhold)
	elseif rescueDestinationIndex == 501															;CITY Windhelm
		RescueMovePlayerAndFollowers(_DE_MarkerWindhelm)
	elseif rescueDestinationIndex == 502															;CITY Solitude
		RescueMovePlayerAndFollowers(_DE_MarkerSolitude)
	elseif rescueDestinationIndex == 503															;CITY Markarth
		RescueMovePlayerAndFollowers(_DE_MarkerMarkarth)
	elseif rescueDestinationIndex == 504															;CITY Whiterun
		RescueMovePlayerAndFollowers(_DE_MarkerWhiterun)
	elseif rescueDestinationIndex == 505															;CITY Riften
		RescueMovePlayerAndFollowers(_DE_MarkerRiften)
	elseif rescueDestinationIndex == 506															;CITY Falkreath
		RescueMovePlayerAndFollowers(_DE_MarkerFalkreath)
	elseif rescueDestinationIndex == 507															;CITY Morthal
		RescueMovePlayerAndFollowers(_DE_MarkerMorthal)
	elseif rescueDestinationIndex == 508															;CITY Dawnstar
		RescueMovePlayerAndFollowers(_DE_MarkerDawnstar)
	endif
endFunction
function GoToNearestOther()															;DONE
	if rescueDestinationIndex == 101
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 140737.09, 106343.84, -13651.3, 254.32)
	;elseif rescueDestinationIndex == 102
		;RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 51273.34, 122487.61, -13904.53, 250.15) 	;This one's a bit of a bad joke, heh
	elseif rescueDestinationIndex == 103
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 114249.54, -97344.74, 13451.41, 292.74)
	elseif rescueDestinationIndex == 104
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 3870.03, -788875.62, 4329.36, 13.5)
	elseif rescueDestinationIndex == 105
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -67879.52, 142212.31, -13953.21, 6.74)
	elseif rescueDestinationIndex == 106
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -153431.19, 111832.77, -13880.53, 313.48)
	elseif rescueDestinationIndex == 107
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 168690.56, -51559.07, 5640.32, 16.87)
	elseif rescueDestinationIndex == 108
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 146606.0, -82556.13, -13549.97, 17.79)
	elseif rescueDestinationIndex == 109
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 105746.59, 31246.81, -10390.98, 256.48)
	elseif rescueDestinationIndex == 110
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 83640.48, 110224.12, -13467.42, 83.2)
	elseif rescueDestinationIndex == 111
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 25871.0, 46301.0, -5013.67, 181.87)
	elseif rescueDestinationIndex == 112
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -73657.84, 90966.23, -13923.84, 60.71)
	endif
endFunction
function FindNearestSettlement() 													;DONE
	float pX = pPlayer.GetPositionX()
	float pY = pPlayer.GetPositionY()
	float pZ = pPlayer.GetPositionZ()

	nearestDist = 9999999999999999.0

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 23226.89, -44453.6, -7.95, 400)			;VILLAGE Riverwood
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 163534.72, -59796.79, 7047.55, 401)	;VILLAGE Shor's Stone
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -83300.04, 8373.52, -4016.59, 402)		;VILLAGE Rorikstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135846.08, 10816.69, -11877.58, 403)	;VILLAGE Kynesgrove
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -100990.3, 83896.63, -11926.16, 404)	;VILLAGE Dragon Bridge
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 76541.18, -65496.84, 10921.82, 405)		;VILLAGE Ivarstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 73552.68, 47321.82, -5894.73, 406)		;VILLAGE Nightgate Inn

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 110166.94, 101580.95, -8954.6, 500)		;CITY Winterhold
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135003.8, 34535.86, -12441.75, 501)		;CITY Windhelm
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -66044.98, 104218.75, -8424.6, 502)		;CITY Solitude
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -172844.2, 5545.82, -3349.18, 503)		;CITY Markarth
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 19192.53, -7429.48, -3609.14, 504)		;CITY Whiterun
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 505)	;CITY Riften
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -32144.70, -87707.61, -3088.38, 506)	;CITY Falkreath
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -40035.86, 65436.5, -13802.67, 507)		;CITY Morthal
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 29357.21, 102187.91, -13208.51, 508)	;CITY Dawnstar
endFunction
function GoToNearestSettlement() 													;DONE
	if rescueDestinationIndex == 400 																;VILLAGE Riverwood
		RescueMovePlayerAndFollowers(_DE_MarkerRiverwood)
	elseif rescueDestinationIndex == 402															;VILLAGE Rorikstead
		RescueMovePlayerAndFollowers(_DE_MarkerRorikstead)
	elseif rescueDestinationIndex == 403															;VILLAGE Kynesgrove
		RescueMovePlayerAndFollowers(_DE_MarkerKynesgrove)
	elseif rescueDestinationIndex == 404															;VILLAGE Dragon Bridge
		RescueMovePlayerAndFollowers(_DE_MarkerDragonbridge)
	elseif rescueDestinationIndex == 405															;VILLAGE Ivarstead
		RescueMovePlayerAndFollowers(_DE_MarkerIvarstead)
	elseif rescueDestinationIndex == 406															;VILLAGE Nightgate Inn
		RescueMovePlayerAndFollowers(_DE_MarkerNightgateInn)
	elseif rescueDestinationIndex == 500															;CITY Winterhold
		RescueMovePlayerAndFollowers(_DE_MarkerWinterhold)
	elseif rescueDestinationIndex == 501															;CITY Windhelm
		RescueMovePlayerAndFollowers(_DE_MarkerWindhelm)
	elseif rescueDestinationIndex == 502															;CITY Solitude
		RescueMovePlayerAndFollowers(_DE_MarkerSolitude)
	elseif rescueDestinationIndex == 503															;CITY Markarth
		RescueMovePlayerAndFollowers(_DE_MarkerMarkarth)
	elseif rescueDestinationIndex == 504															;CITY Whiterun
		RescueMovePlayerAndFollowers(_DE_MarkerWhiterun)
	elseif rescueDestinationIndex == 505															;CITY Riften
		RescueMovePlayerAndFollowers(_DE_MarkerRiften)
	elseif rescueDestinationIndex == 506															;CITY Falkreath
		RescueMovePlayerAndFollowers(_DE_MarkerFalkreath)
	elseif rescueDestinationIndex == 507															;CITY Morthal
		RescueMovePlayerAndFollowers(_DE_MarkerMorthal)
	elseif rescueDestinationIndex == 508															;CITY Dawnstar
		RescueMovePlayerAndFollowers(_DE_MarkerDawnstar)
	endif
endFunction
function GiveRandomSettlementNote(bool Robbed = false)
	if Robbed == false
		pPlayer.AddItem(_DE_RescueLetterSettlement)
	else
		if rescueDestinationIndex == 400 																;VILLAGE Riverwood
			pPlayer.AddItem(_DE_RobLetterSettlement_Riverwood)
		elseif rescueDestinationIndex == 402															;VILLAGE Rorikstead
			pPlayer.AddItem(_DE_RobLetterSettlement_Rorikstead)
		elseif rescueDestinationIndex == 403															;VILLAGE Kynesgrove
			pPlayer.AddItem(_DE_RobLetterSettlement_Kynesgrove)
		elseif rescueDestinationIndex == 404															;VILLAGE Dragon Bridge
			pPlayer.AddItem(_DE_RobLetterSettlement_DragonBridge)
		elseif rescueDestinationIndex == 405															;VILLAGE Ivarstead
			pPlayer.AddItem(_DE_RobLetterSettlement_Ivarstead)
		elseif rescueDestinationIndex == 406															;VILLAGE Nightgate Inn
			pPlayer.AddItem(_DE_RobLetterSettlement_NightgateInn)
		elseif rescueDestinationIndex == 500															;CITY Winterhold
			pPlayer.AddItem(_DE_RobLetterSettlement_Winterhold)
		elseif rescueDestinationIndex == 501															;CITY Windhelm
			pPlayer.AddItem(_DE_RobLetterSettlement_Windhelm)
		elseif rescueDestinationIndex == 502															;CITY Solitude
			pPlayer.AddItem(_DE_RobLetterSettlement_Solitude)
		elseif rescueDestinationIndex == 503															;CITY Markarth
			pPlayer.AddItem(_DE_RobLetterSettlement_Markarth)
		elseif rescueDestinationIndex == 504															;CITY Whiterun
			pPlayer.AddItem(_DE_RobLetterSettlement_Whiterun)
		elseif rescueDestinationIndex == 505															;CITY Riften
			pPlayer.AddItem(_DE_RobLetterSettlement_Riften)
		elseif rescueDestinationIndex == 506															;CITY Falkreath
			pPlayer.AddItem(_DE_RobLetterSettlement_Falkreath)
		elseif rescueDestinationIndex == 507															;CITY Morthal
			pPlayer.AddItem(_DE_RobLetterSettlement_Morthal)
		elseif rescueDestinationIndex == 508															;CITY Dawnstar
			pPlayer.AddItem(_DE_RobLetterSettlement_Dawnstar)
		endif
	endif
endFunction
function FindNearestOther()															;DONE
	float pX = pPlayer.GetPositionX()
	float pY = pPlayer.GetPositionY()
	float pZ = pPlayer.GetPositionZ()

	nearestDist = 9999999999999999.0

	rescueDestinationIndex = 0
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 140737.09, 106343.84, -13651.3, 101)
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 51273.34, 122487.61, -13904.53, 102)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 114249.54, -97344.74, 13451.41, 103)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 3870.03, -788875.62, 4329.36, 104)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -67879.52, 142212.31, -13953.21, 105)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -153431.19, 111832.77, -13880.53, 106)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 168690.56, -51559.07, 5640.32, 107)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 146606.0, -82556.13, -13549.97, 108)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 105746.59, 31246.81, -10390.98, 109)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 83640.48, 110224.12, -13467.42, 110)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 25871.0, 46301.0, -5013.67, 111)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -73657.84, 90966.23, -13923.84, 112)
endFunction
function GoToSpouse()																;DONE
	RescueMovePlayerAndFollowers(Alias_LoveInterest.GetActorRef())
	FindAndMoveToCOCMarker()
endFunction
function GoToNearestHunterCamp()													;DONE
	if rescueDestinationIndex == 300
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -64154.67, -39697.98, -1086.85, 335.15)
	elseif rescueDestinationIndex == 301
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 185655.47, -37709.24, 5770.93, 296.40)
	elseif rescueDestinationIndex == 302
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 113070.53, -25050.97, -10087.63, 0.17)
	elseif rescueDestinationIndex == 303
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 35403.59, 84115.66, -8072.59, 197.71)
	elseif rescueDestinationIndex == 304
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -20098.11, -62001.73, 636.08, 124.64)
	elseif rescueDestinationIndex == 305
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -56964.62, -55207.97, 1494.54, 48.39)
	elseif rescueDestinationIndex == 306
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -15489.56, 26036.83, -1273.99, 4.46)
	elseif rescueDestinationIndex == 307
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -47067.44, 43420.13, -6086.28, 317.61)
	elseif rescueDestinationIndex == 308
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 150894.58, -9137.76, -9304.45, 313.79)
	elseif rescueDestinationIndex == 309
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 158177.19, -83535.55, 11018.53, 135.77)
	elseif rescueDestinationIndex == 310
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, -278.40, -60866.98, 614.83, 289.62)
	elseif rescueDestinationIndex == 311
		RescueMovePlayerAndFollowers(_DE_MarkerTamriel, 153947.91, 17389.73, -4720.31, 174.08)
	endif
endFunction
function RobPlayer()																;DONE
	int iGold = pPlayer.GetItemCount(Gold001)
	float pecSteal = RandomFloat(0.01, 0.1)
	int iGoldToSteal = (iGold * pecSteal) as int
	pPlayer.RemoveItem(Gold001, iGoldToSteal)
endFunction

function RescueAloneHunterCamp()													;DONE
	GoToNearestHunterCamp()
	_DE_RescueMsg_A_1.Show()
endFunction
function RescueAlonePasserby()														;DONE
	GoToNearestPasserby()
	_DE_RescueMsg_A_2.Show()
endFunction
function RescueAloneTakenToDistantSettlement()										;DONE
	GoToRandomSettlement()
	GiveRandomSettlementNote()
endFunction
function RescueAloneTakenToDistantSettlementAndRobbed()								;DONE
	GoToRandomSettlement()
	RobPlayer()
	GiveRandomSettlementNote(true)
endFunction
function RescueAloneTakenHomeToSpouse()												;DONE
	GoToSpouse()
	pPlayer.AddItem(_DE_RescueLetterSpouse)
endFunction
function RescueAloneTakenToOtherAndRobbed()											;DONE
	FindNearestOther()
	GoToNearestOther()
	RobPlayer()
	pPlayer.AddItem(_DE_RobLetterOther)
endFunction

function RescueFollowerTakenToNearestSettlement()									;DONE
	FindNearestSettlement()
	GoToNearestSettlement()
	_DE_RescueMsg_F_1.Show()
endFunction
function RescueFollowerHunterCamp()													;DONE
	GoToNearestHunterCamp()
	_DE_RescueMsg_F_2.Show()
endFunction
function RescueFollowerTakenToOther()												;DONE
	GoToNearestOther()
	_DE_RescueMsg_F_3.Show()
endFunction
function RescueFollowerPasserby()													;DONE
	GoToNearestPasserby()
	_DE_RescueMsg_F_4.Show()
endFunction
function RescueFollowerBuildsCampfire()												;DONE
	pPlayer.PlaceAtMe(_DE_Campfire_Simple_Rescue)
	pPlayer.SplineTranslateTo(pPlayer.GetPositionX() + 150.0, pPlayer.GetPositionY(), pPlayer.GetPositionZ(), 0.0, 0.0, 0.0, 1000.0, 1000.0)
	_DE_RescueMsg_F_5.Show()
endFunction

function RescueDogTakenToOther()													;DONE
	GoToNearestOther()
	_DE_RescueMsg_D_1.Show()
endFunction
function RescueDogPasserby()														;DONE
	GoToNearestPasserby()
	_DE_RescueMsg_D_2.Show()
endFunction
function RescueDogHunterCamp()														;DONE
	GoToNearestHunterCamp()
	_DE_RescueMsg_D_3.Show()
endFunction
function RescueDogTakenToNearestSettlement()										;DONE
	GoToNearestSettlement()
	_DE_RescueMsg_D_4.Show()
endFunction

bool function IsBetween(int Value, int Beginning, int End)
	if Value >= Beginning && Value <= End
		return true
	else
		return false
	endif
endFunction

;#Region DEPRECIATED PROPERTIES

string[] property sWeatherFormID auto hidden
{Array that stores all of the FormIDs for all known vanilla weather types.}
bool property pFTExceptionDetected = false auto hidden
{(Deprecated v1.6)Whether or not the player is near a Fast Travel Exception}
GlobalVariable property HirelingRecognizeJenassaCOPY0000 auto hidden
{Unused Skyrim ESM Global for exporting Exposure Point value to external scripts}
;GlobalVariable property _DE_FastTravel_Allow auto			;Deprecated v1.6	;NOTE: 1.6b was built with this property commented out, leave commented
message property _DE_FirstBootMsg auto hidden
{Deprecated 1.6.1.}
message property _DE_FirstBoot_Confirm auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_FirstBoot auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_WetState auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_WetTime auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_LastVel auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_LastLocType auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_Setting_Shutdown auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_Count_FireKit auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_Setting_FastTravel auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_BadWeatherType auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_FireNearTime auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_LastFireState auto hidden
{Deprecated 1.6.1.}
int property pRandomNum = 0 auto hidden
{Deprecated 1.6.1.}
float property pfThreadLastUpdateTime = 0.0 auto hidden
{Deprecated 1.6.1.}
float property pfLastUpdateTime auto hidden
{Deprecated 1.6.1.}
message property _DE_WetStateMsg_Wet auto hidden
{Deprecated 1.6.1.}
message property _DE_WetStateMsg_DryFire auto hidden
{Deprecated 1.6.1.}
message property _DE_Travel_FireKit auto hidden
{Deprecated 1.6.1.}
message property _DE_Travel_Firewood auto hidden
{Deprecated 1.6.1.}
message property _DE_ShutdownComplete auto hidden
{Deprecated 1.6.1.}
int property iRainCycleCounter = 0 auto hidden
{Deprecated 1.6.1.}
float property lastGameHour auto hidden
{Deprecated 1.6.1.}
bool property bRainLatch = false auto hidden
{Deprecated 1.6.1.}
Spell property _DE_FoodSpell1 auto hidden
{Deprecated 1.6.1.}
Spell property _DE_WetState_Spell auto hidden
{Deprecated 1.6.1.}
int property pLastFastTravelState auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_FireNearState auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_LastPosX auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_LastPosY auto hidden
{Deprecated 1.6.1.}
GlobalVariable property _DE_Setting_ExposureRate2 auto hidden
{Deprecated 1.6.1.}
WorldSpace property thisWorldSpace auto hidden
{Deprecated 1.6.1.}
WorldSpace property lastWorldSpace auto hidden
{Deprecated 1.6.1.}
int property thisLocType auto hidden
{Deprecated 1.6.1.}
int property LastLocType auto hidden
{Deprecated 1.6.1.}
float property fPointLoss auto hidden
{Deprecated 1.6.1.}
bool property pFirstUpdate = true auto hidden
{Deprecated 1.6.1.}
bool property pFTMessageLock = false auto hidden
{Deprecated 1.6.1.}
bool property PlayerCombatState = false auto hidden
{Deprecated 1.6.1.}
magiceffect property FoodRestoreStaminaDuration auto hidden
{Deprecated 1.6.1.}
magiceffect property FoodRestoreHealthDuration auto hidden
{Deprecated 1.6.1.}
Keyword property ClothingHands auto hidden
{Deprecated 1.6.1.}
Keyword property ClothingHead auto hidden
{Deprecated 1.6.1.}
Keyword property ClothingFeet auto hidden
{Deprecated 1.6.1.}
Keyword property ClothingBody auto hidden
{Deprecated 1.6.1.}
Keyword property ArmorGauntlets auto hidden
{Deprecated 1.6.1.}
Keyword property ArmorHelmet auto hidden
{Deprecated 1.6.1.}
Keyword property ArmorBoots auto hidden
{Deprecated 1.6.1.}
Keyword property ArmorCuirass auto hidden
{Deprecated 1.6.1.}
Formlist property _DE_Weather auto hidden
{Deprecated 1.6.1.}
weapon property Axe01 auto hidden
{Deprecated 1.6.1.}
weapon property dunHaltedStreamPoachersAxe auto hidden
{Deprecated 1.6.1.}
int[] property iWeatherTemp auto hidden
{Array that stores the corresponding temperature values for all known vanilla weather types.}
;#EndRegion DEPRECIATED PROPERTIES