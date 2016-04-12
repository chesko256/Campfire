scriptname _Camp_PlaceableObjectBase extends ObjectReference

import _CampInternal
import CampUtil
; import TentSystem

; OPTIONAL PROPERTIES

;/********p* _Camp_PlaceableObjectBase/Setting_StartUpRotation
* SYNTAX
*/;
Float property Setting_StartUpRotation = 0.0 auto
{
* DESCRIPTION
* Optional: The amount, in degrees, to rotate on the Z axis on start-up. }
;*********/;

;/********p* _Camp_PlaceableObjectBase/Setting_BypassMenu
* SYNTAX
*/;
bool property Setting_BypassMenu = False auto
{
* DESCRIPTION
* Optional: If true, no menu will be shown when clicking on this object and the default action will be taken. The intended use is that this object is created and destroyed by another object, like a conjured shelter. Otherwise, you would have no way to destroy the object once placed. }
;*********/;

MiscObject property Required_InventoryItem auto Mandatory
{The item to return to the player when this object is Stored at a workshop.}

; PRIVATE
_Camp_ObjectPlacementThreadManager property PlacementSystem auto hidden
bool property initialized = false auto hidden
bool property is_temporary = false auto hidden
float[] property OriginAng auto hidden
ObjectReference property CenterObject auto hidden

Event OnInit()
	CampDebug(0, self + " OnInit()")
	int i = 0
	if self.IsEnabled()
    	while !self.Is3DLoaded() && i < 50
        	utility.wait(0.1)
        	i += 1
        	CampDebug(0, self + " waiting for initial 3D Loaded. (i = " + i + ")")
    	endWhile
    endif
	;We need to get out of OnInit() quickly, so member functions on this object can be called.
	StartTimer(0.1)
endEvent

Event OnTimer(int aiTimerID)
	if !initialized
		Initialize()
		return
	endif
	Update()
endEvent

Event OnActivate(ObjectReference akActionRef)
	if !initialized
		return
	endif
	UseObject(akActionRef)
EndEvent

function Update()
	; override
endFunction

function Initialize()
	PlacementSystem = CampUtil.GetPlacementSystem()
	RotateOnStartUp()
	OriginAng = GetAngleData(self)
	is_temporary = IsPlaceableObjectTemporary(self.GetBaseObject())

	; Make sure the placement system is available.
	PlacementSystem.RequestLock(self)

	PlaceBaseObjects()
	PlaceObjects()
	PlacementSystem.wait_all()
	GetBaseResults()
	GetResults()

	; Make the placement system available again.
	PlacementSystem.ReleaseLock(self)

	initialized = true
	CampDebug(0, self + " base initialized")
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function PlaceObjects()
	; override
endFunction

function UseObject(ObjectReference akActionRef)
	; override
endFunction

function PlaceBaseObjects()
	; pass
endFunction

function GetResults()
	; override
endFunction

function GetBaseResults()
	; pass
endFunction

function GuardDestroy()
	DestroyMyself()
endFunction

function DestroyMyself()
	; override
endFunction

function TakeDown()
	CampDebug(0, "_Camp_PlaceableObjectBase taking down " + self)
	; Raise optional SKSE event
	;/
	var[] akargs
	akargs[0] = self.GetBaseObject()
	akargs[1] = self.GetPositionX()
	akargs[2] = self.GetPositionY()
	akargs[3] = self.GetPositionZ()
	akargs[4] = self.GetAngleX()
	akargs[5] = self.GetAngleY()
	akargs[6] = self.GetAngleZ()
	akargs[7] = IsTent(self)
	;@SKYRIMOLD
	;SendCustomEvent("CampfireOnObjectRemoved", akargs)
	/;
endFunction

_Camp_ObjectFuture function GetFuture(ObjectReference akObjectReference)
	return akObjectReference as _Camp_ObjectFuture
endFunction

function ForceStopUsingFurniture(ObjectReference akFurnitureRef)
	if akFurnitureRef
		if akFurnitureRef.IsFurnitureInUse()
			; Someone is using this furniture. Discover them and kick them out.
			ObjectReference akUser = Game.FindClosestActorFromRef(akFurnitureRef, 100.0)
			if akUser
				; Move the furniture to prevent future use
				akFurnitureRef.MoveTo(akFurnitureRef, afZOffset = -2000.0)

				; Remove the actor
				akUser.MoveTo(akUser, 1.0, 1.0, 1.0)
				Utility.Wait(0.25)
			endif
		endif
	endif
endFunction

Event OnTimerGameTime(int aiTimerID)
	TakeDown()
endEvent
