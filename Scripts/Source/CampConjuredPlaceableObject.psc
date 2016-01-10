scriptname CampConjuredPlaceableObject extends CampPlaceableObjectEx
{For the placement of Campfire conjured FURNITURE objects. For Activators, please use CampConjuredScriptedActivator.}

import _CampInternal

;Misc
EffectShader property ShockDisintegrate01FXS auto
VisualEffect property MGTeleportInEffect auto

function TakeDown()
	parent.TakeDown()

	ForceStopUsingFurniture(self)
	ForceStopUsingFurniture(myExtraFurniture1)
	ForceStopUsingFurniture(myExtraFurniture2)
	ForceStopUsingFurniture(myExtraFurniture3)
	ForceStopUsingFurniture(myExtraFurniture4)
	ForceStopUsingFurniture(myExtraFurniture5)

	; Warp out visible objects
	WarpOutRef(myExtraStatic1)
	WarpOutRef(myExtraStatic2)
	WarpOutRef(myExtraStatic3)
	WarpOutRef(myExtraStatic4)
	WarpOutRef(myExtraStatic5)
	WarpOutRef(myExtraActivator1)
	WarpOutRef(myExtraActivator2)
	WarpOutRef(myExtraActivator3)
	WarpOutRef(myExtraActivator4)
	WarpOutRef(myExtraActivator5)
	WarpOutRef(myExtraFurniture1)
	WarpOutRef(myExtraFurniture2)
	WarpOutRef(myExtraFurniture3)
	WarpOutRef(myExtraFurniture4)
	WarpOutRef(myExtraFurniture5)

	; Remove references
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

function WarpInObjects()
	if myExtraStatic1
		myExtraStatic1.EnableNoWait()
		PlayWarpInEffect(myExtraStatic1)
	endif
	if myExtraStatic2
		myExtraStatic2.EnableNoWait()
		PlayWarpInEffect(myExtraStatic2)
	endif
	if myExtraStatic3
		myExtraStatic3.EnableNoWait()
		PlayWarpInEffect(myExtraStatic3)
	endif
	if myExtraStatic4
		myExtraStatic4.EnableNoWait()
		PlayWarpInEffect(myExtraStatic4)
	endif
	if myExtraStatic5
		myExtraStatic5.EnableNoWait()
		PlayWarpInEffect(myExtraStatic5)
	endif
	if myExtraActivator1
		myExtraActivator1.EnableNoWait()
		PlayWarpInEffect(myExtraActivator1)
	endif
	if myExtraActivator2
		myExtraActivator2.EnableNoWait()
		PlayWarpInEffect(myExtraActivator2)
	endif
	if myExtraActivator3
		myExtraActivator3.EnableNoWait()
		PlayWarpInEffect(myExtraActivator3)
	endif
	if myExtraActivator4
		myExtraActivator4.EnableNoWait()
		PlayWarpInEffect(myExtraActivator4)
	endif
	if myExtraActivator5
		myExtraActivator5.EnableNoWait()
		PlayWarpInEffect(myExtraActivator5)
	endif
	if myExtraFurniture1
		myExtraFurniture1.EnableNoWait()
		PlayWarpInEffect(myExtraFurniture1)
	endif
	if myExtraFurniture2
		myExtraFurniture2.EnableNoWait()
		PlayWarpInEffect(myExtraFurniture2)
	endif
	if myExtraFurniture3
		myExtraFurniture3.EnableNoWait()
		PlayWarpInEffect(myExtraFurniture3)
	endif
	if myExtraFurniture4
		myExtraFurniture4.EnableNoWait()
		PlayWarpInEffect(myExtraFurniture4)
	endif
	if myExtraFurniture5
		myExtraFurniture5.EnableNoWait()
		PlayWarpInEffect(myExtraFurniture5)
	endif
endFunction

function PlayWarpInEffect(ObjectReference akObject)
	if akObject && Is3DLoadedFinite(akObject)
		MGTeleportInEffect.Play(akObject, 3.0)
	endif
endFunction

function WarpOutRef(ObjectReference akObject)
	if akObject && akObject.IsEnabled() && Is3DLoadedFinite(akObject)
		ShockDisintegrate01FXS.Play(akObject)
		Utility.Wait(0.1)
	endif
endFunction

bool function Is3DLoadedFinite(ObjectReference akObject)
	;Prevents an infinite loop waiting for an object that may
	;never load correctly.
	int i = 0
	while !akObject.Is3DLoaded() && i < 500
		i += 1
	endWhile
	if i >= 500
		return false
	else
		return true
	endif
endFunction

; Warp-in objects
function PlaceObject_ExtraStatic1(CampPlaceableObjectEx Extended)
	myExtraStatic1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic1, Extended.PositionRef_ExtraStatic1, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic2(CampPlaceableObjectEx Extended)
	myExtraStatic2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic2, Extended.PositionRef_ExtraStatic2, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic3(CampPlaceableObjectEx Extended)
	myExtraStatic3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic3, Extended.PositionRef_ExtraStatic3, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic4(CampPlaceableObjectEx Extended)
	myExtraStatic4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic4, Extended.PositionRef_ExtraStatic4, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraStatic5(CampPlaceableObjectEx Extended)
	myExtraStatic5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraStatic5, Extended.PositionRef_ExtraStatic5, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator1(CampPlaceableObjectEx Extended)
	myExtraActivator1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator1, Extended.PositionRef_ExtraActivator1, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator2(CampPlaceableObjectEx Extended)
	myExtraActivator2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator2, Extended.PositionRef_ExtraActivator2, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator3(CampPlaceableObjectEx Extended)
	myExtraActivator3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator3, Extended.PositionRef_ExtraActivator3, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator4(CampPlaceableObjectEx Extended)
	myExtraActivator4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator4, Extended.PositionRef_ExtraActivator4, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraActivator5(CampPlaceableObjectEx Extended)
	myExtraActivator5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraActivator5, Extended.PositionRef_ExtraActivator5, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture1(CampPlaceableObjectEx Extended)
	myExtraFurniture1Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture1, Extended.PositionRef_ExtraFurniture1, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture2(CampPlaceableObjectEx Extended)
	myExtraFurniture2Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture2, Extended.PositionRef_ExtraFurniture2, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture3(CampPlaceableObjectEx Extended)
	myExtraFurniture3Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture3, Extended.PositionRef_ExtraFurniture3, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture4(CampPlaceableObjectEx Extended)
	myExtraFurniture4Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture4, Extended.PositionRef_ExtraFurniture4, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ExtraFurniture5(CampPlaceableObjectEx Extended)
	myExtraFurniture5Future = PlacementSystem.PlaceObject(self, Extended.Asset_ExtraFurniture5, Extended.PositionRef_ExtraFurniture5, initially_disabled = true, is_temp = is_temporary)
endFunction