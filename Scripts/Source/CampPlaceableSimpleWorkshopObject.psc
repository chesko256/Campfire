scriptname CampPlaceableSimpleWorkshopObject extends _Camp_PlaceableObjectBase
{For the placement of Campfire FURNITURE Workshop objects. For Activators, please use CampPlaceableScriptedWorkshopActivator.}

import CampUtil
import _CampInternal

function Initialize()
	parent.Initialize()
endFunction

function UseObject(ObjectReference akActionRef)	
	; pass
endFunction

function PickUp()
	TakeDown()
	Game.GetPlayer().Additem(Required_InventoryItem, 1, true)
endFunction

function PlaceObjects()
	; pass
endFunction

function GetResults()
	if GetLogLevel() <= 1
		GenerateDebugReport()
	endif
endFunction

function GenerateDebugReport()
	CampDebug(1, "Placement complete. Placed object report:")
	CampDebug(1, "======================================================================")
	CampDebug(1, "**SELF**: " + self)
	CampDebug(1, "======================================================================")
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function TakeDown()
	CampDebug(0, self + " TakeDown (CampPlaceableObject)")
	parent.TakeDown()

	ForceStopUsingFurniture(self)
	TryToDisableAndDeleteRef(self)
endFunction
