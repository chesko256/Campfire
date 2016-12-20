scriptname _Frost_PlayerStateSystem extends _Frost_BaseSystem

import CampUtil
import FrostUtil

Actor property PlayerRef auto
GlobalVariable property _Frost_Setting_NoWaiting auto
GlobalVariable property _Frost_Setting_NoFastTravel auto
GlobalVariable property _Frost_Setting_VampireMode auto
FormList property _Frost_SleepObjects auto
FormList property _Frost_WorldspacesExteriorOblivion auto
FormList property _Frost_WorldspacesFTException auto
FormList property _Frost_FastTravelExceptions auto
Quest property _Frost_MainQuest auto
Spell property _Frost_NoWait_Spell auto

bool property updateInProgress auto hidden
bool property inTent auto hidden
bool property tentIsWarm auto hidden
bool property inShelter auto hidden
bool property inInterior auto hidden
bool property isVampire auto hidden
float property playerX auto hidden
float property playerY auto hidden
float property playerZ auto hidden
float property thisUpdateTime auto hidden
float property thisUpdateGameTime auto hidden
WorldSpace property thisWorldSpace auto hidden

bool lastVampireState = false

function Update()
	updateInProgress = true
	RefreshTime()
	RefreshPlayerStateData()
	RefreshAbleToWait()
	RefreshAbleToFastTravel()
	RefreshVampireState()
	updateInProgress = false
endFunction

function RefreshTime()
	; Time is sampled here for systems (i.e. Exposure) where
	; time and space (position) are very tightly linked.
	thisUpdateTime = Game.GetRealHoursPassed()
	thisUpdateGameTime = Utility.GetCurrentGameTime()
endFunction

function RefreshPlayerStateData()
	if GetCurrentTent() && CurrentTentHasShelter()
		inTent = true
	else
		inTent = false
	endif
	tentIsWarm = IsCurrentTentWarm()
	inShelter = IsPlayerTakingShelter()
	thisWorldSpace = PlayerRef.GetWorldSpace()
	playerX = PlayerRef.GetPositionX()
	playerY = PlayerRef.GetPositionY()
	playerZ = PlayerRef.GetPositionZ()
	inInterior = CampUtil.IsRefInInterior(PlayerRef)
endFunction

;@TODO: Provide FrostUtil.IsAbleToWait()
function RefreshAbleToWait()
	bool hasNoWaitSpell = PlayerRef.HasSpell(_Frost_NoWait_Spell)
	if _Frost_Setting_NoWaiting.GetValueInt() == 2 && 	\
		!IsRefInInterior(PlayerRef) && 					\
		!Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_SleepObjects, PlayerRef, 600.0)
		if !hasNoWaitSpell
			PlayerRef.AddSpell(_Frost_NoWait_Spell, false)
		endif
	else
		if hasNoWaitSpell
			PlayerRef.RemoveSpell(_Frost_NoWait_Spell)
		endif
	endif
endFunction

;@TODO: Possibly wrap in FrostUtil IsAbleToFastTravel() or similar
function RefreshAbleToFastTravel()
	if FrostUtil.GetCompatibilitySystem().isDLC2Loaded
		WorldSpace my_ws = PlayerRef.GetWorldspace()
		if _Frost_WorldspacesExteriorOblivion.HasForm(my_ws) || _Frost_WorldspacesFTException.HasForm(my_ws)
			if !Game.IsFastTravelControlsEnabled()
				Game.EnableFastTravel()
			endif
			return
		endif
	endif

	; Is the player riding a dragon?
	if (_Frost_MainQuest as _Frost_ConditionValues).IsRidingFlyingMount
		if !Game.IsFastTravelControlsEnabled()
			Game.EnableFastTravel()
		endif
		return
	endif

	; Is the player near a fast travel exception?
	ObjectReference exception = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_FastTravelExceptions, PlayerRef,  600.0)
	if exception
		if !Game.IsFastTravelControlsEnabled()
			Game.EnableFastTravel()
		endif
		return
	endif

	if _Frost_Setting_NoFastTravel.GetValueInt() == 2
		if Game.IsFastTravelControlsEnabled()
			Game.EnableFastTravel(false)
		endif
	else
		if !Game.IsFastTravelControlsEnabled()
			Game.EnableFastTravel()
		endif
	endif
endFunction

function RefreshVampireState()
	if _Frost_Setting_VampireMode.GetValueInt() > 0
		if IsPlayerUndead()
			isVampire = true
		else
			isVampire = false
		endif
	else
		isVampire = false
	endif

	if isVampire != lastVampireState
		(_Frost_MainQuest as _Frost_ConditionValues).IsVampire = isVampire
		SendEvent_UpdateWarmth(false)
	endif
	lastVampireState = isVampire
endFunction

function SendEvent_UpdateWarmth(bool abDisplayTextUpdate)
	FallbackEventEmitter emitter = GetEventEmitter_UpdateWarmth()
    int handle = emitter.Create("Frost_UpdateWarmth")
    if handle
    	emitter.PushBool(handle, abDisplayTextUpdate)
        emitter.Send(handle)
    endif
endFunction