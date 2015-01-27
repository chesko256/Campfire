scriptname _Camp_PlaceableObjectBase extends ObjectReference

import CampUtil

; REQUIRED PROPERTIES
MiscObject property Required_InventoryItem auto
{REQUIRED: The item the player obtains when picking up this object.}

; OPTIONAL PROPERTIES
Float property Setting_StartUpRotation = 0.0 auto
{Optional: The amount, in degrees, to rotate on the Z axis on start-up.}

; PRIVATE
_Camp_ObjectPlacementThreadManager property PlacementSystem auto hidden

bool property initialized = false auto hidden

float[] property OriginAng auto hidden

ObjectReference property CenterObject auto hidden

Event OnInit()
	while !self.Is3DLoaded()
	endWhile
	;We need to get out of OnInit() quickly, so member functions on this object can be called.
	RegisterForSingleUpdate(0.1)
endEvent

Event OnUpdate()
	if !initialized
		Initialize()
		return
	endif
	OnUpdateContinue()
endEvent

function Initialize()
	PlacementSystem = CampUtil.GetPlacementSystem()
	RotateOnStartUp()
	OriginAng = GetAngleData(self)
	PlaceObjects()
	PlacementSystem.wait_all()
	GetResults()
	initialized = true
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function OnUpdateContinue()
	;pass
endFunction

function PlaceObjects()
	;pass
endFunction

function GetResults()
	;pass
endFunction

_Camp_ObjectFuture function GetFuture(ObjectReference akObjectReference)
	return akObjectReference as _Camp_ObjectFuture
endFunction