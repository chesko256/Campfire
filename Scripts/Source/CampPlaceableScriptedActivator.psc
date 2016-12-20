scriptname CampPlaceableScriptedActivator extends _Camp_PlaceableObjectBase
{For the placement of Campfire ACTIVATOR objects. For Furniture, please use CampPlaceableObject.}

import CampUtil
import _CampInternal

; PRIVATE
;Run-time objects
ObjectReference property myExtraStatic1 auto hidden
ObjectReference property myExtraStatic2 auto hidden
ObjectReference property myExtraStatic3 auto hidden
ObjectReference property myExtraStatic4 auto hidden
ObjectReference property myExtraStatic5 auto hidden
ObjectReference property myExtraActivator1 auto hidden
ObjectReference property myExtraActivator2 auto hidden
ObjectReference property myExtraActivator3 auto hidden
ObjectReference property myExtraActivator4 auto hidden
ObjectReference property myExtraActivator5 auto hidden
ObjectReference property myExtraFurniture1 auto hidden
ObjectReference property myExtraFurniture2 auto hidden
ObjectReference property myExtraFurniture3 auto hidden
ObjectReference property myExtraFurniture4 auto hidden
ObjectReference property myExtraFurniture5 auto hidden
ObjectReference property myExtraLight1 auto hidden
ObjectReference property myExtraLight2 auto hidden
ObjectReference property myExtraLight3 auto hidden

;Futures
ObjectReference property myExtraStatic1Future auto hidden
ObjectReference property myExtraStatic2Future auto hidden
ObjectReference property myExtraStatic3Future auto hidden
ObjectReference property myExtraStatic4Future auto hidden
ObjectReference property myExtraStatic5Future auto hidden
ObjectReference property myExtraActivator1Future auto hidden
ObjectReference property myExtraActivator2Future auto hidden
ObjectReference property myExtraActivator3Future auto hidden
ObjectReference property myExtraActivator4Future auto hidden
ObjectReference property myExtraActivator5Future auto hidden
ObjectReference property myExtraFurniture1Future auto hidden
ObjectReference property myExtraFurniture2Future auto hidden
ObjectReference property myExtraFurniture3Future auto hidden
ObjectReference property myExtraFurniture4Future auto hidden
ObjectReference property myExtraFurniture5Future auto hidden
ObjectReference property myExtraLight1Future auto hidden
ObjectReference property myExtraLight2Future auto hidden
ObjectReference property myExtraLight3Future auto hidden

ObjectReference property Required_LinkedActivatorRef auto
{The activator reference that should be activated when using this object.}

function Initialize()
	self.BlockActivation()
	parent.Initialize()
endFunction

function UseObject(ObjectReference akActionRef)
	SetSelectedObjectConjured(self)
	
	
	if akActionRef == Game.GetPlayer()
		if Setting_BypassMenu && !Game.GetPlayer().IsSneaking()
			Required_LinkedActivatorRef.Activate(Game.GetPlayer())
			return
		else
			int i = GetObjectMainMenu().Show()
			if i == 0										;Use
				Required_LinkedActivatorRef.Activate(Game.GetPlayer())
			elseif i == 1									;Pick Up
				PickUp()
			elseif i == 2									;Dispel
				TakeDown()
			else
				;exit
			endif
		endif
	endif
endFunction

function PickUp()
	TakeDown()
	Game.GetPlayer().Additem(Required_InventoryItem, 1, true)
endFunction

function PlaceObjects()
	CampPlaceableScriptedActivatorEx Extended = self as CampPlaceableScriptedActivatorEx

	if Extended
		CenterObject = Extended.RequiredPositionRef_CenterObject
		
		if Extended.Asset_ExtraStatic1 && Extended.PositionRef_ExtraStatic1
			PlaceObject_ExtraStatic1(Extended)
		endif
		if Extended.Asset_ExtraStatic2 && Extended.PositionRef_ExtraStatic2
			PlaceObject_ExtraStatic2(Extended)
		endif
		if Extended.Asset_ExtraStatic3 && Extended.PositionRef_ExtraStatic3
			PlaceObject_ExtraStatic3(Extended)
		endif
		if Extended.Asset_ExtraStatic4 && Extended.PositionRef_ExtraStatic4
			PlaceObject_ExtraStatic4(Extended)
		endif
		if Extended.Asset_ExtraStatic5 && Extended.PositionRef_ExtraStatic5
			PlaceObject_ExtraStatic5(Extended)
		endif
		if Extended.Asset_ExtraActivator1 && Extended.PositionRef_ExtraActivator1
			PlaceObject_ExtraActivator1(Extended)
		endif
		if Extended.Asset_ExtraActivator2 && Extended.PositionRef_ExtraActivator2
			PlaceObject_ExtraActivator2(Extended)
		endif
		if Extended.Asset_ExtraActivator3 && Extended.PositionRef_ExtraActivator3
			PlaceObject_ExtraActivator3(Extended)
		endif
		if Extended.Asset_ExtraActivator4 && Extended.PositionRef_ExtraActivator4
			PlaceObject_ExtraActivator4(Extended)
		endif
		if Extended.Asset_ExtraActivator5 && Extended.PositionRef_ExtraActivator5
			PlaceObject_ExtraActivator5(Extended)
		endif
		if Extended.Asset_ExtraFurniture1 && Extended.PositionRef_ExtraFurniture1
			PlaceObject_ExtraFurniture1(Extended)
		endif
		if Extended.Asset_ExtraFurniture2 && Extended.PositionRef_ExtraFurniture2
			PlaceObject_ExtraFurniture2(Extended)
		endif
		if Extended.Asset_ExtraFurniture3 && Extended.PositionRef_ExtraFurniture3
			PlaceObject_ExtraFurniture3(Extended)
		endif
		if Extended.Asset_ExtraFurniture4 && Extended.PositionRef_ExtraFurniture4
			PlaceObject_ExtraFurniture4(Extended)
		endif
		if Extended.Asset_ExtraFurniture5 && Extended.PositionRef_ExtraFurniture5
			PlaceObject_ExtraFurniture5(Extended)
		endif
		if Extended.Asset_ExtraLight1 && Extended.PositionRef_ExtraLight1
			PlaceObject_ExtraLight1(Extended)
		endif
		if Extended.Asset_ExtraLight2 && Extended.PositionRef_ExtraLight2
			PlaceObject_ExtraLight2(Extended)
		endif
		if Extended.Asset_ExtraLight3 && Extended.PositionRef_ExtraLight3
			PlaceObject_ExtraLight3(Extended)
		endif
	endif
endFunction

function GetResults()
	if myExtraStatic1Future
		myExtraStatic1 = GetFuture(myExtraStatic1Future).get_result()
		myExtraStatic1Future = None
	endif
	if myExtraStatic2Future
		myExtraStatic2 = GetFuture(myExtraStatic2Future).get_result()
		myExtraStatic2Future = None
	endif
	if myExtraStatic3Future
		myExtraStatic3 = GetFuture(myExtraStatic3Future).get_result()
		myExtraStatic3Future = None
	endif
	if myExtraStatic4Future
		myExtraStatic4 = GetFuture(myExtraStatic4Future).get_result()
		myExtraStatic4Future = None
	endif
	if myExtraStatic5Future
		myExtraStatic5 = GetFuture(myExtraStatic5Future).get_result()
		myExtraStatic5Future = None
	endif
	if myExtraActivator1Future
		myExtraActivator1 = GetFuture(myExtraActivator1Future).get_result()
		myExtraActivator1Future = None
	endif
	if myExtraActivator2Future
		myExtraActivator2 = GetFuture(myExtraActivator2Future).get_result()
		myExtraActivator2Future = None
	endif
	if myExtraActivator3Future
		myExtraActivator3 = GetFuture(myExtraActivator3Future).get_result()
		myExtraActivator3Future = None
	endif
	if myExtraActivator4Future
		myExtraActivator4 = GetFuture(myExtraActivator4Future).get_result()
		myExtraActivator4Future = None
	endif
	if myExtraActivator5Future
		myExtraActivator5 = GetFuture(myExtraActivator5Future).get_result()
		myExtraActivator5Future = None
	endif
	if myExtraFurniture1Future
		myExtraFurniture1 = GetFuture(myExtraFurniture1Future).get_result()
		myExtraFurniture1Future = None
	endif
	if myExtraFurniture2Future
		myExtraFurniture2 = GetFuture(myExtraFurniture2Future).get_result()
		myExtraFurniture2Future = None
	endif
	if myExtraFurniture3Future
		myExtraFurniture3 = GetFuture(myExtraFurniture3Future).get_result()
		myExtraFurniture3Future = None
	endif
	if myExtraFurniture4Future
		myExtraFurniture4 = GetFuture(myExtraFurniture4Future).get_result()
		myExtraFurniture4Future = None
	endif
	if myExtraFurniture5Future
		myExtraFurniture5 = GetFuture(myExtraFurniture5Future).get_result()
		myExtraFurniture5Future = None
	endif
	if myExtraLight1Future
		myExtraLight1 = GetFuture(myExtraLight1Future).get_result()
		myExtraLight1Future = None
	endif
	if myExtraLight2Future
		myExtraLight2 = GetFuture(myExtraLight2Future).get_result()
		myExtraLight2Future = None
	endif
	if myExtraLight3Future
		myExtraLight3 = GetFuture(myExtraLight3Future).get_result()
		myExtraLight3Future = None
	endif

	if GetLogLevel() <= 1
		GenerateDebugReport()
	endif
endFunction

function GenerateDebugReport()
	CampDebug(1, "Placement complete. Placed object report:")
	CampDebug(1, "======================================================================")
	CampDebug(1, "**SELF**: " + self)
	CampDebug(1, "myExtraStatic1: " + myExtraStatic1)
	CampDebug(1, "myExtraStatic2: " + myExtraStatic2)
	CampDebug(1, "myExtraStatic3: " + myExtraStatic3)
	CampDebug(1, "myExtraStatic4: " + myExtraStatic4)
	CampDebug(1, "myExtraStatic5: " + myExtraStatic5)
	CampDebug(1, "myExtraActivator1: " + myExtraActivator1)
	CampDebug(1, "myExtraActivator2: " + myExtraActivator2)
	CampDebug(1, "myExtraActivator3: " + myExtraActivator3)
	CampDebug(1, "myExtraActivator4: " + myExtraActivator4)
	CampDebug(1, "myExtraActivator5: " + myExtraActivator5)
	CampDebug(1, "myExtraFurniture1: " + myExtraFurniture1)
	CampDebug(1, "myExtraFurniture2: " + myExtraFurniture2)
	CampDebug(1, "myExtraFurniture3: " + myExtraFurniture3)
	CampDebug(1, "myExtraFurniture4: " + myExtraFurniture4)
	CampDebug(1, "myExtraFurniture5: " + myExtraFurniture5)
	CampDebug(1, "myExtraLight1: " + myExtraLight1)
	CampDebug(1, "myExtraLight2: " + myExtraLight2)
	CampDebug(1, "myExtraLight3: " + myExtraLight3)
	CampDebug(1, "======================================================================")
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function PlaceObject_ExtraStatic1(CampPlaceableScriptedActivatorEx Extended)
	myExtraStatic1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic1, Extended.PositionRef_ExtraStatic1, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic2(CampPlaceableScriptedActivatorEx Extended)
	myExtraStatic2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic2, Extended.PositionRef_ExtraStatic2, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic3(CampPlaceableScriptedActivatorEx Extended)
	myExtraStatic3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic3, Extended.PositionRef_ExtraStatic3, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic4(CampPlaceableScriptedActivatorEx Extended)
	myExtraStatic4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic4, Extended.PositionRef_ExtraStatic4, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic5(CampPlaceableScriptedActivatorEx Extended)
	myExtraStatic5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic5, Extended.PositionRef_ExtraStatic5, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator1(CampPlaceableScriptedActivatorEx Extended)
	myExtraActivator1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator1, Extended.PositionRef_ExtraActivator1, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator2(CampPlaceableScriptedActivatorEx Extended)
	myExtraActivator2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator2, Extended.PositionRef_ExtraActivator2, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator3(CampPlaceableScriptedActivatorEx Extended)
	myExtraActivator3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator3, Extended.PositionRef_ExtraActivator3, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator4(CampPlaceableScriptedActivatorEx Extended)
	myExtraActivator4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator4, Extended.PositionRef_ExtraActivator4, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator5(CampPlaceableScriptedActivatorEx Extended)
	myExtraActivator5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator5, Extended.PositionRef_ExtraActivator5, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture1(CampPlaceableScriptedActivatorEx Extended)
	myExtraFurniture1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture1, Extended.PositionRef_ExtraFurniture1, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture2(CampPlaceableScriptedActivatorEx Extended)
	myExtraFurniture2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture2, Extended.PositionRef_ExtraFurniture2, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture3(CampPlaceableScriptedActivatorEx Extended)
	myExtraFurniture3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture3, Extended.PositionRef_ExtraFurniture3, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture4(CampPlaceableScriptedActivatorEx Extended)
	myExtraFurniture4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture4, Extended.PositionRef_ExtraFurniture4, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture5(CampPlaceableScriptedActivatorEx Extended)
	myExtraFurniture5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture5, Extended.PositionRef_ExtraFurniture5, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraLight1(CampPlaceableScriptedActivatorEx Extended)
	myExtraLight1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight1, Extended.PositionRef_ExtraLight1, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraLight2(CampPlaceableScriptedActivatorEx Extended)
	myExtraLight2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight2, Extended.PositionRef_ExtraLight2, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraLight3(CampPlaceableScriptedActivatorEx Extended)
	myExtraLight3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight3, Extended.PositionRef_ExtraLight3, is_temp = is_temporary)
endFunction

function TakeDown()
	CampDebug(0, self + " TakeDown (CampPlaceableScriptedActivator)")
	parent.TakeDown()

	; No way to do parent.parent.FunctionCall(), so return now.
	if (self as CampConjuredScriptedActivator)
		CampDebug(0, "CampPlaceableScriptedActivator is CampConjuredScriptedActivator, returning.")
		return
	endif

	ForceStopUsingFurniture(self)
	ForceStopUsingFurniture(myExtraFurniture1)
	ForceStopUsingFurniture(myExtraFurniture2)
	ForceStopUsingFurniture(myExtraFurniture3)
	ForceStopUsingFurniture(myExtraFurniture4)
	ForceStopUsingFurniture(myExtraFurniture5)

	TryToDisableAndDeleteRef(myExtraStatic1)
	TryToDisableAndDeleteRef(myExtraStatic2)
	TryToDisableAndDeleteRef(myExtraStatic3)
	TryToDisableAndDeleteRef(myExtraStatic4)
	TryToDisableAndDeleteRef(myExtraStatic5)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraActivator1)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraActivator2)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraActivator3)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraActivator4)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraActivator5)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraFurniture1)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraFurniture2)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraFurniture3)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraFurniture4)
	TryToDisableAndDeletePotentialPlaceableObjectRef(myExtraFurniture5)
	TryToDisableAndDeleteRef(myExtraLight1)
	TryToDisableAndDeleteRef(myExtraLight2)
	TryToDisableAndDeleteRef(myExtraLight3)

	myExtraStatic1 = None
	myExtraStatic2 = None
	myExtraStatic3 = None
	myExtraStatic4 = None
	myExtraStatic5 = None
	myExtraActivator1 = None
	myExtraActivator2 = None
	myExtraActivator3 = None
	myExtraActivator4 = None
	myExtraActivator5 = None
	myExtraFurniture1 = None
	myExtraFurniture2 = None
	myExtraFurniture3 = None
	myExtraFurniture4 = None
	myExtraFurniture5 = None
	myExtraLight1 = None
	myExtraLight2 = None
	myExtraLight3 = None

	TryToDisableAndDeleteRef(self)
endFunction

state BurningDown
	function BurnDown()
		ObjectReference myBigFire
		myBigFire = self.PlaceAtMe(PlacementSystem._Camp_LargeFire, abInitiallyDisabled = true)
		float xs
		float ys
		xs = self.GetWidth()
		ys = self.GetLength()
		if xs == 0.0
			xs = 200.0
		endif
		if ys == 0.0
			ys = 200.0
		endif
		float size
		if xs > ys
			size = xs
		else
			size = ys
		endif
		myBigFire.SetScale(size / 750)
		myBigFire.Enable(true)
		mySmoke.Disable(true)
		TryToPlayShader(self)
		TryToPlayShader(myExtraStatic1)
		TryToPlayShader(myExtraStatic2)
		TryToPlayShader(myExtraStatic3)
		TryToPlayShader(myExtraStatic4)
		TryToPlayShader(myExtraStatic5)
		TryToPlayShader(myExtraActivator1)
		TryToPlayShader(myExtraActivator2)
		TryToPlayShader(myExtraActivator3)
		TryToPlayShader(myExtraActivator4)
		TryToPlayShader(myExtraActivator5)
		TryToPlayShader(myExtraFurniture1)
		TryToPlayShader(myExtraFurniture2)
		TryToPlayShader(myExtraFurniture3)
		TryToPlayShader(myExtraFurniture4)
		TryToPlayShader(myExtraFurniture5)
		utility.wait(10.5)

		TakeDown()
		utility.wait(3.5)
		self.Disable()
		self.PlaceAtMe(PlacementSystem.FallingDustExplosion01)
		utility.wait(7.0)
		TryToDisableAndDeleteRef(self)
	endFunction
endState