;/********s* _Camp_PlaceableObjectBase/CampPlaceableObject
* SCRIPTNAME
*/;
scriptname CampPlaceableObject extends _Camp_PlaceableObjectBase
;/*
* OVERVIEW
* The `CampPlaceableObject` script is for creating simple Placeable Objects. It can be
* attached to an Activator or Furniture.
;*********/;

import CampUtil
; @TODO: MOVE TO UTILITY SCRIPT
Message property _Camp_PlaceableObjectSelect auto
Message property _Camp_PlaceableObjectDestroyConfirm auto


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

Event OnInit()
	while !self.Is3DLoaded()
	endWhile
	self.BlockActivation()
EndEvent

State Activated
	Event OnActivate(ObjectReference akActionRef)
		utility.wait(0.1)
	EndEvent
endState

Event OnActivate(ObjectReference akActionRef)
	GoToState("Activated")
	if akActionRef == Game.GetPlayer()
		ObjectInteraction(akActionRef)
	else
		UseObject(akActionRef)
	endif
	GoToState("")
EndEvent

function ObjectInteraction(ObjectReference akActionRef)
	int i = _Camp_PlaceableObjectSelect.Show()
	if i == 0
		UseObject(akActionRef)
	elseif i == 1
		TearDownObject()
	elseif i == 2
		DestroyObjectConfirm(akActionRef)
	elseif i == 3
		;exit
	endif
endFunction

function UseObject(ObjectReference akActionRef)
	self.BlockActivation(false)
	self.Activate(akActionRef)
	utility.wait(0.1)
	self.BlockActivation(true)
endFunction

function DestroyObjectConfirm(ObjectReference akActionRef)
	int i = _Camp_PlaceableObjectDestroyConfirm.Show()
	if i == 0
		TearDownObject(true)
	else
		ObjectInteraction(akActionRef)
	endif
endFunction

function PlaceObjects()
	CampPlaceableObjectEx Extended = self as CampPlaceableObjectEx
	
	if Extended
		if Extended.PositionRef_CenterObjectOverride
			CenterObject = Extended.PositionRef_CenterObjectOverride
		else
			CenterObject = None
		endif
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

function PlaceObject_ExtraStatic1(CampPlaceableObjectEx Extended)
	myExtraStatic1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic1, Extended.PositionRef_ExtraStatic1)
endFunction
function PlaceObject_ExtraStatic2(CampPlaceableObjectEx Extended)
	myExtraStatic2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic2, Extended.PositionRef_ExtraStatic2)
endFunction
function PlaceObject_ExtraStatic3(CampPlaceableObjectEx Extended)
	myExtraStatic3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic3, Extended.PositionRef_ExtraStatic3)
endFunction
function PlaceObject_ExtraStatic4(CampPlaceableObjectEx Extended)
	myExtraStatic4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic4, Extended.PositionRef_ExtraStatic4)
endFunction
function PlaceObject_ExtraStatic5(CampPlaceableObjectEx Extended)
	myExtraStatic5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic5, Extended.PositionRef_ExtraStatic5)
endFunction
function PlaceObject_ExtraActivator1(CampPlaceableObjectEx Extended)
	myExtraActivator1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator1, Extended.PositionRef_ExtraActivator1)
endFunction
function PlaceObject_ExtraActivator2(CampPlaceableObjectEx Extended)
	myExtraActivator2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator2, Extended.PositionRef_ExtraActivator2)
endFunction
function PlaceObject_ExtraActivator3(CampPlaceableObjectEx Extended)
	myExtraActivator3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator3, Extended.PositionRef_ExtraActivator3)
endFunction
function PlaceObject_ExtraActivator4(CampPlaceableObjectEx Extended)
	myExtraActivator4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator4, Extended.PositionRef_ExtraActivator4)
endFunction
function PlaceObject_ExtraActivator5(CampPlaceableObjectEx Extended)
	myExtraActivator5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator5, Extended.PositionRef_ExtraActivator5)
endFunction
function PlaceObject_ExtraFurniture1(CampPlaceableObjectEx Extended)
	myExtraFurniture1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture1, Extended.PositionRef_ExtraFurniture1)
endFunction
function PlaceObject_ExtraFurniture2(CampPlaceableObjectEx Extended)
	myExtraFurniture2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture2, Extended.PositionRef_ExtraFurniture2)
endFunction
function PlaceObject_ExtraFurniture3(CampPlaceableObjectEx Extended)
	myExtraFurniture3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture3, Extended.PositionRef_ExtraFurniture3)
endFunction
function PlaceObject_ExtraFurniture4(CampPlaceableObjectEx Extended)
	myExtraFurniture4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture4, Extended.PositionRef_ExtraFurniture4)
endFunction
function PlaceObject_ExtraFurniture5(CampPlaceableObjectEx Extended)
	myExtraFurniture5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture5, Extended.PositionRef_ExtraFurniture5)
endFunction
function PlaceObject_ExtraLight1(CampPlaceableObjectEx Extended)
	myExtraLight1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight1, Extended.PositionRef_ExtraLight1)
endFunction
function PlaceObject_ExtraLight2(CampPlaceableObjectEx Extended)
	myExtraLight2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight2, Extended.PositionRef_ExtraLight2)
endFunction
function PlaceObject_ExtraLight3(CampPlaceableObjectEx Extended)
	myExtraLight3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraLight3, Extended.PositionRef_ExtraLight3)
endFunction

function TearDownObject(bool destroy = false)
	if destroy
		;play vfx, sfx
	endif

	if myExtraStatic1
		TryToDisableAndDeleteRef(myExtraStatic1)
	endif
	if myExtraStatic2
		TryToDisableAndDeleteRef(myExtraStatic2)
	endif
	if myExtraStatic3
		TryToDisableAndDeleteRef(myExtraStatic3)
	endif
	if myExtraStatic4
		TryToDisableAndDeleteRef(myExtraStatic4)
	endif
	if myExtraStatic5
		TryToDisableAndDeleteRef(myExtraStatic5)
	endif
	if myExtraActivator1
		TryToDisableAndDeleteRef(myExtraActivator1)
	endif
	if myExtraActivator2
		TryToDisableAndDeleteRef(myExtraActivator2)
	endif
	if myExtraActivator3
		TryToDisableAndDeleteRef(myExtraActivator3)
	endif
	if myExtraActivator4
		TryToDisableAndDeleteRef(myExtraActivator4)
	endif
	if myExtraActivator5
		TryToDisableAndDeleteRef(myExtraActivator5)
	endif
	if myExtraFurniture1
		TryToDisableAndDeleteRef(myExtraFurniture1)
	endif
	if myExtraFurniture2
		TryToDisableAndDeleteRef(myExtraFurniture2)
	endif
	if myExtraFurniture3
		TryToDisableAndDeleteRef(myExtraFurniture3)
	endif
	if myExtraFurniture4
		TryToDisableAndDeleteRef(myExtraFurniture4)
	endif
	if myExtraFurniture5
		TryToDisableAndDeleteRef(myExtraFurniture5)
	endif
	if myExtraLight1
		TryToDisableAndDeleteRef(myExtraLight1)
	endif
	if myExtraLight2
		TryToDisableAndDeleteRef(myExtraLight2)
	endif
	if myExtraLight3
		TryToDisableAndDeleteRef(myExtraLight3)
	endif

	if !destroy
		Game.GetPlayer().AddItem(Required_InventoryItem, 1, true)
	endif

	self.Disable()
	self.Delete()
endFunction