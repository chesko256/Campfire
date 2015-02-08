scriptname _Camp_PlaceableObjectBase extends ObjectReference

import CampUtil

; REQUIRED PROPERTIES

;/********p* CampTent/Required_InventoryItem
* SYNTAX
*/;
MiscObject property Required_InventoryItem auto
;/*
* DESCRIPTION
{ Required: The item the player obtains when picking up this object. }
;*********/;

; OPTIONAL PROPERTIES

;/********p* CampTent/Setting_StartUpRotation
* SYNTAX
*/;
Float property Setting_StartUpRotation = 0.0 auto
;/*
* DESCRIPTION
{ Optional: The amount, in degrees, to rotate on the Z axis on start-up. }
;*********/;

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
	Update()
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

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	debug.trace("[Campfire] I was hit by " + akAggressor + " with " + akSource + " (" + akProjectile + ")")
	;if material wood...
		;blah
	;elif material stone...
		;blah
	;elif an arrow...
		;ignore
	;elif a fire spell...
		;burn
	;else
		;fall through to wood
	;endif
EndEvent

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function Update()
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