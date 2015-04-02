scriptname _Camp_PlaceableObjectBase extends ObjectReference

import _CampInternal
import CampUtil
import TentSystem

; REQUIRED PROPERTIES

;/********p* _Camp_PlaceableObjectBase/Required_InventoryItem
* SYNTAX
*/;
MiscObject property Required_InventoryItem auto
;/*
* DESCRIPTION
{ Required: The item the player obtains when picking up this object. }
;*********/;

; OPTIONAL PROPERTIES

;/********p* _Camp_PlaceableObjectBase/Setting_StartUpRotation
* SYNTAX
*/;
Float property Setting_StartUpRotation = 0.0 auto
;/*
* DESCRIPTION
{ Optional: The amount, in degrees, to rotate on the Z axis on start-up. }
;*********/;

;/********p* _Camp_PlaceableObjectBase/Setting_Flammable
* SYNTAX
*/;
bool property Setting_Flammable = False auto
;/*
* DESCRIPTION
{ Optional: Whether or not this object can be destroyed by fire. }
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
ObjectReference property myFire5 auto hidden
ObjectReference property myFire6 auto hidden
ObjectReference property mySmoke auto hidden
ObjectReference property myFire1Future auto hidden
ObjectReference property myFire2Future auto hidden
ObjectReference property myFire3Future auto hidden
ObjectReference property myFire4Future auto hidden
ObjectReference property myFire5Future auto hidden
ObjectReference property myFire6Future auto hidden
ObjectReference property mySmokeFuture auto hidden

bool block_spell_hits = false
int fire_level = 0
int damage_stage = 0

Event OnInit()
	int i = 0
    while !self.Is3DLoaded() && i < 50
        utility.wait(0.1)
        i += 1
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

function Update()
	;pass
endFunction

function Initialize()
	CampDebug(0, "Base initialize start")
	PlacementSystem = CampUtil.GetPlacementSystem()
	CampDebug(0, "Got placement system")
	RotateOnStartUp()
	OriginAng = GetAngleData(self)
	CampDebug(0, "Rotated, got OriginAng...")
	PlaceBaseObjects()
	CampDebug(0, "Placed base objects")
	PlaceObjects()
	CampDebug(0, "Placed objects, waiting for all futures...")
	PlacementSystem.wait_all()
	CampDebug(0, "Getting results")
	GetResults()
	initialized = true
	CampDebug(0, "Base initialized")
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function PlaceObjects()
	;Pass
endFunction

function PlaceBaseObjects()
	if Setting_Flammable
		PlaceObject_FireMarkers()
	endif
endFunction

function GetResults()
	CampDebug(0, "Base get results")
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
	if myFire5Future
		myFire5 = GetFuture(myFire5Future).get_result()
	endif
	if myFire6Future
		myFire6 = GetFuture(myFire6Future).get_result()
	endif
	if mySmokeFuture
		mySmoke = GetFuture(mySmokeFuture).get_result()
		float xs = self.GetWidth()
		float ys = self.GetLength()
		if xs == 0.0
			xs = 100.0
		endif
		if ys == 0.0
			ys = 100.0
		endif
		float size
		if xs > ys
			size = xs
		else
			size = ys
		endif
		mySmoke.SetScale(size / 900)
	endif
endFunction

function GuardDestroy()
	DestroyMyself()
endFunction

function DestroyMyself()
	; override
endFunction

function TakeDown()
	TryToDisableAndDeleteRef(myFire1)
	TryToDisableAndDeleteRef(myFire2)
	TryToDisableAndDeleteRef(myFire3)
	TryToDisableAndDeleteRef(myFire4)
	TryToDisableAndDeleteRef(myFire5)
	TryToDisableAndDeleteRef(myFire6)
	TryToDisableAndDeleteRef(mySmoke)
	ClearEquipmentFromCrimeAlias(self)
endFunction

function PlaceObject_FireMarkers()
	CampDebug(0, "Placing fire markers")
	float xr = (self.GetWidth() / 2) * 0.8
	float yr = (self.GetLength() / 2) * 0.8
	CampDebug(0, xr + ", " + yr)

	if xr == 0.0
		xr = 100.0
	endif
	if yr == 0.0
		yr = 100.0
	endif

	CampDebug(0, " Fire marker: xr " + xr + ", yr " + yr)

	myFire1Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	CampDebug(0, "Finished fire future 1")
	myFire2Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	myFire3Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	CampDebug(0, "Finished fire future 3")
	myFire4Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	myFire5Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	myFire6Future = PlacementSystem.PlaceObject(self, PlacementSystem.SmallFire, self, initially_disabled = true, x_pos_offset = Utility.RandomFloat(xr * -1.0, xr), y_pos_offset = Utility.RandomFloat(yr * -1.0, yr))
	mySmokeFuture = PlacementSystem.PlaceObject(self, PlacementSystem._Camp_LargeFireSmoke, self, initially_disabled = true, is_hanging = True, z_hanging_offset = 10.0)
endFunction

_Camp_ObjectFuture function GetFuture(ObjectReference akObjectReference)
	return akObjectReference as _Camp_ObjectFuture
endFunction

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if CampUtil.GetSettingEquipmentFlammable().GetValueInt() == 2 && Setting_Flammable
		ProcessOnHit(akAggressor, akSource, akProjectile, abBashAttack)
	endif
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if CampUtil.GetSettingEquipmentFlammable().GetValueInt() == 2 && Setting_Flammable
		ProcessMagicEffect(akCaster, akEffect)
	endif
EndEvent

function ProcessOnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abBashAttack)
	if akSource == none && (akAggressor as Actor).GetEquippedItemType(0) == 11
		CampDebug(0, "Torch bash!")
		IncreaseFireLevel()
	endif
endFunction

function ProcessMagicEffect(ObjectReference akCaster, MagicEffect akEffect)
	if block_spell_hits == false
		block_spell_hits = true
		if akEffect.HasKeyword(_CampInternal.GetMagicDamageFireKeyword())
			IncreaseFireLevel()
			utility.wait(0.5)
		elseif akEffect.HasKeyword(_CampInternal.GetMagicDamageFrostKeyword())
			DecreaseFireLevel()
			utility.wait(0.5)
		endif
		block_spell_hits = false
	endif
endFunction

function IncreaseFireLevel()
	if fire_level < 9
		fire_level += 1
	endif
	CampDebug(1, "Fire level increased to " + fire_level)
	UpdateFireState()
endFunction

function DecreaseFireLevel()
	if fire_level > 0 && fire_level < 9
		fire_level -= 1
	endif
	CampDebug(1, "Fire level decreased to " + fire_level)
	UpdateFireState()
endFunction

function UpdateFireState()
	if fire_level >= 9
		GoToState("BurningDown")
	elseif fire_level == 8
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToEnableRef(myFire4)
		TryToEnableRef(myFire5)
		TryToEnableRef(myFire6)
		TryToEnableRef(mySmoke, true)
	elseif fire_level == 7
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToEnableRef(myFire4)
		TryToEnableRef(myFire5)
		TryToEnableRef(myFire6)
		TryToEnableRef(mySmoke, true)
	elseif fire_level == 6
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToEnableRef(myFire4)
		TryToEnableRef(myFire5)
		TryToEnableRef(myFire6)
		TryToEnableRef(mySmoke)
	elseif fire_level == 5
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToEnableRef(myFire4)
		TryToEnableRef(myFire5)
		TryToDisableRef(myFire6)
		TryToEnableRef(mySmoke)
	elseif fire_level == 4
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToEnableRef(myFire4)
		TryToDisableRef(myFire5)
		TryToDisableRef(myFire6)
		TryToDisableRef(mySmoke)
	elseif fire_level == 3
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToEnableRef(myFire3)
		TryToDisableRef(myFire4)
		TryToDisableRef(myFire5)
		TryToDisableRef(myFire6)
		TryToDisableRef(mySmoke)
	elseif fire_level == 2
		TryToEnableRef(myFire1)
		TryToEnableRef(myFire2)
		TryToDisableRef(myFire3)
		TryToDisableRef(myFire4)
		TryToDisableRef(myFire5)
		TryToDisableRef(myFire6)
		TryToDisableRef(mySmoke)
	elseif fire_level == 1
		TryToEnableRef(myFire1)
		TryToDisableRef(myFire2)
		TryToDisableRef(myFire3)
		TryToDisableRef(myFire4)
		TryToDisableRef(myFire5)
		TryToDisableRef(myFire6)
		TryToDisableRef(mySmoke)
		GoToState("OnFire")
	else
		TryToDisableRef(myFire1)
		TryToDisableRef(myFire2)
		TryToDisableRef(myFire3)
		TryToDisableRef(myFire4)
		TryToDisableRef(myFire5)
		TryToDisableRef(myFire6)
		TryToDisableRef(mySmoke)
		UnregisterForUpdate()
		GoToState("")
	endif
endFunction

State OnFire
	Event OnBeginState()
		RegisterForSingleUpdate(3)
	endEvent
	Event OnUpdate()
		if fire_level > 0
			IncreaseFireLevel()
			if fire_level < 8
				RegisterForSingleUpdate(3)
			elseif fire_level == 8
				RegisterForSingleUpdate(8)
			endif
		endif
	endEvent
	Event OnActivate(ObjectReference akActionRef)
		CampDebug(1, "Can't use something while it's on fire!")
	EndEvent
endState

State BurningDown
	Event OnUpdate()
		;pass
	endEvent
	Event OnBeginState()
		BurnDown()
	EndEvent
	Event OnActivate(ObjectReference akActionRef)
		CampDebug(1, "Can't use something while it's burning down!")
	EndEvent
	function BurnDown()
		CampDebug(1, "Burning down!")
		;@Override
	endFunction
endState

function BurnDown()
	CampDebug(1, "Not burning down, do nothing.")
endFunction

function TryToPlayShader(ObjectReference akObjectReference)
	if akObjectReference && akObjectReference.Is3DLoaded()
		PlacementSystem._Camp_BurnEffect.Play(akObjectReference)
	endif
endFunction