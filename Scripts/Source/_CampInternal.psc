scriptname _CampInternal hidden

import math
import CampUtil

_CampfireInternalAPI function GetAPI() global
	return (Game.GetFormFromFile(0x00024095, "Campfire.esm") as Quest) as _CampfireInternalAPI
endFunction

CampfireAPI function GetPublicAPI() global
	return (Game.GetFormFromFile(0x00024095, "Campfire.esm") as Quest) as CampfireAPI
endFunction

Message function GetNotInitializedError() global
	_CampfireInternalAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	return Campfire._Camp_NotInitializedError
endFunction

Keyword function GetMagicDamageFireKeyword() global
	_CampfireInternalAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.MagicDamageFire
endFunction

Keyword function GetMagicDamageFrostKeyword() global
	_CampfireInternalAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.MagicDamageFrost
endFunction

function ClearEquipmentFromCrimeAlias(ObjectReference akObject) global
	_CampfireInternalAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	if akObject == Campfire.IllegalItem1.GetRef()
		Campfire.IllegalItem1.Clear()
	elseif akObject == Campfire.IllegalItem2.GetRef()
		Campfire.IllegalItem2.Clear()
	elseif akObject == Campfire.IllegalItem3.GetRef()
		Campfire.IllegalItem3.Clear()
	endif
endFunction

function TryToEnableRef(ObjectReference akReference, bool bFadeIn = false) global
	;A more concise way to enable references without checking for None first (to avoid Papyrus log errors, etc)
	if akReference
		akReference.Enable(bFadeIn)
	endif
endFunction

function TryToDisableRef(ObjectReference akReference, bool bFadeOut = false) global
	; A more concise way to disable references without checking for None first (to avoid Papyrus log errors, etc)
	if akReference
		akReference.Disable(bFadeOut)
	endif
endFunction

function TryToDisableAndDeleteRef(ObjectReference akReference, bool bFadeOut = false) global
	; A more concise way to disable and delete references without checking for None first (to avoid Papyrus log errors, etc)
	if akReference
		CampDebug(1, "Disabling and deleting reference " + akReference)
		akReference.Disable(bFadeOut)
		akReference.Delete()

		if akReference && akReference.IsEnabled()
			; Try one more time
			CampDebug(2, "Placed object " + akReference + " failed to disable/delete on first attempt, trying again.")
			akReference.Disable(bFadeOut)
			akReference.Delete()
		endif
	endif
endFunction

function TryToDisableAndDeletePotentialPlaceableObjectRef(ObjectReference akReference, bool bFadeOut = false) global
	; A more concise way to disable and delete references without checking for None first (to avoid Papyrus log errors, etc)
	; Handles objects that could potentially be Campfire Placeable Objects.
	if akReference

		if (akReference as _Camp_PlaceableObjectBase)
			(akReference as _Camp_PlaceableObjectBase).TakeDown()
		else
			akReference.Disable(bFadeOut)
			akReference.Delete()

			if akReference && akReference.IsEnabled()
				; Try one more time
				CampDebug(2, "Placed object " + akReference + " failed to disable/delete on first attempt, trying again.")
				akReference.Disable(bFadeOut)
				akReference.Delete()
			endif
		endif
	endif
endFunction

ObjectReference function PlaceAndWaitFor3DLoaded(ObjectReference akOrigin, Form FormToPlace, int Count = 1, bool ForcePersist = false, bool bDisableInteraction = false) global
	;A more concise way to place an object and wait until the object's 3D is loaded.
	;Prevents infinite loop if object never loads.
	;Optionally set bDisableInteraction to True to make this object behave like a static (disable Havok physics) and disable activation.
	ObjectReference myObject
	if akOrigin
		myObject = akOrigin.PlaceAtMe(FormToPlace, Count, ForcePersist, false)
	else
		return None
	endif

	int iTryCount = 0
	while iTryCount < 200
		if !myObject.Is3DLoaded()
			iTryCount += 1
		else
			if bDisableInteraction
				myObject.SetMotionType(4)
				myObject.BlockActivation()
			endif
			return myObject
		endif
	endWhile
	return None
endFunction

function SetLastUsedCampfire(ObjectReference akCampfire) global
	CampfireAPI Campfire = GetPublicAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif
	Campfire.LastUsedCampfire = akCampfire
endFunction

function SetSelectedObjectConjured(ObjectReference akObject) global
	CampfireAPI Campfire = GetPublicAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif
	if akObject && (akObject as _Camp_PlaceableObjectBase).Setting_IsConjured == true
		(Campfire._Camp_MainQuest as _Camp_ConditionValues).IsSelectedObjectConjured = true
	else
		(Campfire._Camp_MainQuest as _Camp_ConditionValues).IsSelectedObjectConjured = false
	endif
endFunction

function SetTentConjured(ObjectReference akTent) global
	CampfireAPI Campfire = GetPublicAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif
	if akTent && (akTent as _Camp_PlaceableObjectBase).Setting_IsConjured == true
		(Campfire._Camp_MainQuest as _Camp_ConditionValues).IsCurrentTentConjured = true
	else
		(Campfire._Camp_MainQuest as _Camp_ConditionValues).IsCurrentTentConjured = false
	endif
endFunction

function SetTentPlayerFullBed(ObjectReference akTent) global
	CampfireAPI Campfire = GetPublicAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif
	if akTent && (akTent as CampTent).Setting_PlayerUsesFullBed == true
		(Campfire._Camp_MainQuest as _Camp_ConditionValues).IsCurrentTentUsingFullBed = true
	else
		(Campfire._Camp_MainQuest as _Camp_ConditionValues).IsCurrentTentUsingFullBed = false
	endif
endFunction

function SetCurrentTent(ObjectReference akTent) global
	CampfireAPI Campfire = GetPublicAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif
	Campfire.CurrentTent = akTent
	if akTent
		CampDebug(0, "Sending event Campfire_OnTentEnter")
		; * Event OnTentEnter(Form akTent, bool abHasShelter)
		; * akTent: The tent ObjectReference entered.
		; * abHasShelter: Whether or not this tent has any overhead shelter.
		bool has_shelter
		if Campfire._Camp_WarmBaseTents.HasForm(akTent.GetBaseObject())
			has_shelter = true
		else
			has_shelter = !akTent.GetBaseObject().HasKeyword(Campfire.isCampfireTentNoShelter)
		endif
		FallbackEventEmitter emitter = GetEventEmitter_OnTentEnter()
    	int handle = emitter.Create("Campfire_OnTentEnter")
    	if handle
    		emitter.PushForm(handle, akTent)
    		emitter.PushBool(handle, has_shelter)
        	emitter.Send(handle)
    	endif
	else
		CampDebug(0, "Sending event Campfire_OnTentLeave")
		; * Event OnTentLeave()
		FallbackEventEmitter emitter = GetEventEmitter_OnTentLeave()
    	int handle = emitter.Create("Campfire_OnTentLeave")
    	if handle
        	emitter.Send(handle)
    	endif
	endif
endFunction

Quest function GetCrimeTrackingQuest() global
	_CampfireInternalAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	return Campfire._Camp_CampingCrimeTracking
endFunction

ReferenceAlias function GetCrimeIllegalItemAlias(int aiAlias) global
	_CampfireInternalAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	if aiAlias == 1
		return Campfire.IllegalItem1
	elseif aiAlias == 2
		return Campfire.IllegalItem2
	elseif aiAlias == 3
		return Campfire.IllegalItem3
	else
		return None
	endif
endFunction

Message function GetObjectMainMenu() global
	_CampfireInternalAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	return Campfire._Camp_ObjectMainMenu
endFunction

float function Get2DDistance(ObjectReference afFirst, ObjectReference afSecond) global
	float a1x = afFirst.GetPositionX()
	float a1y = afFirst.GetPositionY()
	float a2x = afSecond.GetPositionX()
	float a2y = afSecond.GetPositionY()

	return sqrt(pow((a2x - a1x), 2) + pow((a2y - a1y), 2))
endFunction

_Camp_Strings function GetCampfireStrings() global
	_CampfireInternalAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	return (Campfire.CampfireStrings as _Camp_Strings)
endFunction

int function UpdateConjuredObjectID(GlobalVariable akGlobal) global
	if akGlobal
		int new_value = akGlobal.GetValueInt() + 1
		akGlobal.SetValueInt(new_value)
		CampDebug(0, "Sending event Campfire_OnConjuredObjectIDUpdated")
		FallbackEventEmitter emitter = GetEventEmitter_OnConjuredObjectIDUpdated()
    	int handle = emitter.Create("Campfire_OnConjuredObjectIDUpdated")
    	if handle
    		emitter.Send(handle)
   		endif
   		return new_value
   	else
   		return -1
   	endif
endFunction

function ExitMenus() global
	Game.DisablePlayerControls()
	Game.EnablePlayerControls()
endFunction

bool function IsNone(Form akForm) global
	; Objects from unloaded mods
	; will fail '== None' checks because they are
	; 'Form<None>' objects. Check FormID as well.
	int i = 0
	if akForm
		i = akForm.GetFormID()
		if i == 0
			return true
		else
			return false
		endif
	else
		return true
	endif
endFunction

function RaiseCampAPIError() global
	CampDebug(3, "Fatal Internal Campfire API error occurred.")
endFunction

function CampDebug(int aiSeverity, string asLogMessage) global
	int LOG_LEVEL = (Game.GetFormFromFile(0x0203AB34, "Campfire.esm") as GlobalVariable).GetValueInt()
	if LOG_LEVEL <= aiSeverity
		if aiSeverity == 0
			debug.trace("[Campfire][Debug] " + asLogMessage)
		elseif aiSeverity == 1
			debug.trace("[Campfire][Info] " + asLogMessage)
		elseif aiSeverity == 2
			debug.trace("[Campfire][Warning] " + asLogMessage)
		elseif aiSeverity == 3
			debug.trace("[Campfire][ERROR] " + asLogMessage)
		endif
	endif
endFunction

int function GetLogLevel() global
	return (Game.GetFormFromFile(0x0203AB34, "Campfire.esm") as GlobalVariable).GetValueInt()
endFunction
