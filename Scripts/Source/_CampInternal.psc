scriptname _CampInternal hidden

import math

_CampfireInternalAPI function GetAPI() global
	return (Game.GetFormFromFile(0x00024095, "Campfire.esm") as Quest) as _CampfireInternalAPI
endFunction

CampfireAPI function GetPublicAPI() global
	return (Game.GetFormFromFile(0x00024095, "Campfire.esm") as Quest) as CampfireAPI
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
	;A more concise way to disable references without checking for None first (to avoid Papyrus log errors, etc)
	if akReference
		akReference.Disable(bFadeOut)
	endif
endFunction

function TryToDisableAndDeleteRef(ObjectReference akReference, bool bFadeOut = false) global
	;A more concise way to disable and delete references without checking for None first (to avoid Papyrus log errors, etc)
	if akReference
		akReference.Disable(bFadeOut)
		akReference.Delete()
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

function SetCurrentTent(ObjectReference akTent) global
	CampfireAPI Campfire = GetPublicAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif
	Campfire.CurrentTent = akTent
	if CampUtil.GetCompatibilitySystem().isSKSELoaded
		if akTent
			CampDebug(0, "Sending event Campfire_OnTentEnter")
			; * Event OnTentEnter(Form akTent)
			; * akTent: The tent ObjectReference entered.
    		int handle = ModEvent.Create("Campfire_OnTentEnter")
    		if handle
    			ModEvent.PushForm(handle, akTent)
        		ModEvent.Send(handle)
    		endif
		else
			CampDebug(0, "Sending event Campfire_OnTentLeave")
			; * Event OnTentLeave(Form akTent)
			; * akTent: The tent ObjectReference left.
    		int handle = ModEvent.Create("Campfire_OnTentLeave")
    		if handle
    			ModEvent.PushForm(handle, akTent)
        		ModEvent.Send(handle)
    		endif
		endif
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

function ExitMenus() global
	Game.DisablePlayerControls()
	Game.EnablePlayerControls()
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