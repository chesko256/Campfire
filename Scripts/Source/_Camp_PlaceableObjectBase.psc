scriptname _Camp_PlaceableObjectBase extends ObjectReference

import CampUtil
import TentSystem

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
ObjectReference property myFire1 auto hidden
ObjectReference property myFire2 auto hidden
ObjectReference property myFire3 auto hidden
ObjectReference property myFire4 auto hidden
ObjectReference property myBigFire auto hidden
ObjectReference property myFire1Future auto hidden
ObjectReference property myFire2Future auto hidden
ObjectReference property myFire3Future auto hidden
ObjectReference property myFire4Future auto hidden
ObjectReference property myBigFireFuture auto hidden

bool block_spell_hits = false
int fire_stage = 0
int damage_stage = 0

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
	ProcessOnHit(akAggressor, akSource, akProjectile, abBashAttack)
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	ProcessMagicEffect(akCaster, akEffect)
EndEvent

function ProcessOnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abBashAttack)
	debug.trace("[Campfire] I was hit by " + akAggressor + " with " + akSource + " (" + akProjectile + "), bashing: " + abBashAttack)
	if akSource as Weapon && !akProjectile
		debug.trace("[Campfire] Melee attack hit!")
	elseif akSource == none && (akAggressor as Actor).GetEquippedItemType(0) == 11
		debug.trace("[Campfire] Torch bash!")
	endif
endFunction

function ProcessMagicEffect(ObjectReference akCaster, MagicEffect akEffect)
	if block_spell_hits == false
		if akEffect.HasKeyword(CampUtil.GetMagicDamageFireKeyword())
			block_spell_hits = true
			IncreaseFireLevel()
			debug.trace("[Campfire] Fire damage! Stage " + fire_stage)
			utility.wait(0.6)
			block_spell_hits = false
		;elseif akEffect.HasKeyword(CampUtil.GetMagicDamageFrostKeyword())
		;	block_spell_hits = true
		;	DecreaseFireLevel()
		;	debug.trace("[Campfire] Frost damage! Stage " + fire_stage)
		;	utility.wait(0.6)
		;	block_spell_hits = false
		endif
	endif
endFunction

function IncreaseFireLevel()
	if fire_stage < 5
		fire_stage += 1
	endif
	UpdateFireState()
endFunction

function DecreaseFireLevel()
	if fire_stage > 0
		fire_stage -= 1
	endif
	UpdateFireState()
endFunction

function UpdateFireState()
	if fire_stage >= 5
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToEnableRef(myFire4)
		TryToEnableRef(myBigFire)
	elseif fire_stage == 4
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToEnableRef(myFire4)
		TryToDisableRef(myBigFire)
	elseif fire_stage == 3
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToDisableRef(myFire4)
		TryToDisableRef(myBigFire)
	elseif fire_stage == 2
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToDisableRef(myFire3)
		TryToDisableRef(myFire4)
		TryToDisableRef(myBigFire)
	elseif fire_stage == 1
		TryToEnableRef(myFire1)
		TryToDisableRef(myFire2)
		TryToDisableRef(myFire3)
		TryToDisableRef(myFire4)
		TryToDisableRef(myBigFire)
	else
		TryToDisableRef(myFire1)
		TryToDisableRef(myFire2)
		TryToDisableRef(myFire3)
		TryToDisableRef(myFire4)
		TryToDisableRef(myBigFire)
	endif
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function Update()
	;pass
endFunction

function PlaceObjects()
	PlaceObject_FireMarkers()
endFunction

function GetResults()
	if myFire1Future
		myFire1 = GetFuture(myFire1Future).get_result()
	endif
	if myFire2Future
		myFire2 = GetFuture(myFire2Future).get_result()
	endif
	if myFire3Future
		myFire3 = GetFuture(myFire3Future).get_result()
	endif
	if myFire4Future
		myFire4 = GetFuture(myFire4Future).get_result()
	endif
	if myBigFireFuture
		myBigFire = GetFuture(myBigFireFuture).get_result()
		float xs = self.GetWidth()
		float ys = self.GetLength()
		float size
		if xs > ys
			size = xs
		else
			size = ys
		endif
		myBigFire.SetScale(size / 708)
	endif
endFunction

function TakeDown()
	TryToDisableAndDeleteRef(myFire1)
	TryToDisableAndDeleteRef(myFire2)
	TryToDisableAndDeleteRef(myFire3)
	TryToDisableAndDeleteRef(myFire4)
	TryToDisableAndDeleteRef(myBigFire)
endFunction

function PlaceObject_FireMarkers()
	float xr = (self.GetWidth() / 2)
	float yr = (self.GetLength() / 2)

	myFire1Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	myFire2Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	myFire3Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	myFire4Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	myBigFireFuture = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true)
endFunction

_Camp_ObjectFuture function GetFuture(ObjectReference akObjectReference)
	return akObjectReference as _Camp_ObjectFuture
endFunction