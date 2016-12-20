scriptname CampPlaceableContainer extends _Camp_PlaceableObjectBase

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

ObjectReference property Required_LinkedContainerRef auto
{The container reference that should be accessed when using this placeable object. Don't forget to make your container reference non-respawning!}

function Initialize()
	self.BlockActivation()
	parent.Initialize()
endFunction

function UseObject(ObjectReference akActionRef)
	SetSelectedObjectConjured(self)

	if akActionRef == Game.GetPlayer()
		if Setting_BypassMenu && !Game.GetPlayer().IsSneaking()
			Required_LinkedContainerRef.Activate(Game.GetPlayer())
			return
		else
			int i = GetObjectMainMenu().Show()
			if i == 0										;Use
				Required_LinkedContainerRef.Activate(Game.GetPlayer())
			elseif i == 1									;Pick Up
				PickUp()
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
	CampPlaceableContainerEx Extended = self as CampPlaceableContainerEx

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
	endif
	if myExtraStatic2Future
		myExtraStatic2 = GetFuture(myExtraStatic2Future).get_result()
	endif
	if myExtraStatic3Future
		myExtraStatic3 = GetFuture(myExtraStatic3Future).get_result()
	endif
	if myExtraStatic4Future
		myExtraStatic4 = GetFuture(myExtraStatic4Future).get_result()
	endif
	if myExtraStatic5Future
		myExtraStatic5 = GetFuture(myExtraStatic5Future).get_result()
	endif
	if myExtraActivator1Future
		myExtraActivator1 = GetFuture(myExtraActivator1Future).get_result()
	endif
	if myExtraActivator2Future
		myExtraActivator2 = GetFuture(myExtraActivator2Future).get_result()
	endif
	if myExtraActivator3Future
		myExtraActivator3 = GetFuture(myExtraActivator3Future).get_result()
	endif
	if myExtraActivator4Future
		myExtraActivator4 = GetFuture(myExtraActivator4Future).get_result()
	endif
	if myExtraActivator5Future
		myExtraActivator5 = GetFuture(myExtraActivator5Future).get_result()
	endif
	if myExtraFurniture1Future
		myExtraFurniture1 = GetFuture(myExtraFurniture1Future).get_result()
	endif
	if myExtraFurniture2Future
		myExtraFurniture2 = GetFuture(myExtraFurniture2Future).get_result()
	endif
	if myExtraFurniture3Future
		myExtraFurniture3 = GetFuture(myExtraFurniture3Future).get_result()
	endif
	if myExtraFurniture4Future
		myExtraFurniture4 = GetFuture(myExtraFurniture4Future).get_result()
	endif
	if myExtraFurniture5Future
		myExtraFurniture5 = GetFuture(myExtraFurniture5Future).get_result()
	endif
	if myExtraLight1Future
		myExtraLight1 = GetFuture(myExtraLight1Future).get_result()
	endif
	if myExtraLight2Future
		myExtraLight2 = GetFuture(myExtraLight2Future).get_result()
	endif
	if myExtraLight3Future
		myExtraLight3 = GetFuture(myExtraLight3Future).get_result()
	endif
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function PlaceObject_ExtraStatic1(CampPlaceableContainerEx Extended)
	myExtraStatic1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic1, Extended.PositionRef_ExtraStatic1, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic2(CampPlaceableContainerEx Extended)
	myExtraStatic2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic2, Extended.PositionRef_ExtraStatic2, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic3(CampPlaceableContainerEx Extended)
	myExtraStatic3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic3, Extended.PositionRef_ExtraStatic3, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic4(CampPlaceableContainerEx Extended)
	myExtraStatic4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic4, Extended.PositionRef_ExtraStatic4, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic5(CampPlaceableContainerEx Extended)
	myExtraStatic5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic5, Extended.PositionRef_ExtraStatic5, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator1(CampPlaceableContainerEx Extended)
	myExtraActivator1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator1, Extended.PositionRef_ExtraActivator1, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator2(CampPlaceableContainerEx Extended)
	myExtraActivator2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator2, Extended.PositionRef_ExtraActivator2, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator3(CampPlaceableContainerEx Extended)
	myExtraActivator3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator3, Extended.PositionRef_ExtraActivator3, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator4(CampPlaceableContainerEx Extended)
	myExtraActivator4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator4, Extended.PositionRef_ExtraActivator4, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator5(CampPlaceableContainerEx Extended)
	myExtraActivator5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator5, Extended.PositionRef_ExtraActivator5, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture1(CampPlaceableContainerEx Extended)
	myExtraFurniture1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture1, Extended.PositionRef_ExtraFurniture1, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture2(CampPlaceableContainerEx Extended)
	myExtraFurniture2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture2, Extended.PositionRef_ExtraFurniture2, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture3(CampPlaceableContainerEx Extended)
	myExtraFurniture3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture3, Extended.PositionRef_ExtraFurniture3, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture4(CampPlaceableContainerEx Extended)
	myExtraFurniture4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture4, Extended.PositionRef_ExtraFurniture4, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture5(CampPlaceableContainerEx Extended)
	myExtraFurniture5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture5, Extended.PositionRef_ExtraFurniture5, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraLight1(CampPlaceableContainerEx Extended)
	myExtraLight1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight1, Extended.PositionRef_ExtraLight1, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraLight2(CampPlaceableContainerEx Extended)
	myExtraLight2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight2, Extended.PositionRef_ExtraLight2, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraLight3(CampPlaceableContainerEx Extended)
	myExtraLight3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight3, Extended.PositionRef_ExtraLight3, is_temp = is_temporary)
endFunction

function TakeDown()
	CampDebug(0, self + " TakeDown (CampPlaceableContainer)")
	parent.TakeDown()

	; No way to do parent.parent.FunctionCall(), so return now.
	if (self as CampConjuredContainer)
		CampDebug(0, "CampPlaceableContainer is CampConjuredContainer, returning.")
		return
	endif

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