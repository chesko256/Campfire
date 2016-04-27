scriptname _Camp_SettlementManagerScript extends Quest

ObjectReference[] property BuildableWorkshopRefs auto
ObjectReference[] property BuildAreaRefs auto
ObjectReference[] property EdgeMarker1Refs auto
ObjectReference[] property EdgeMarker2Refs auto
ObjectReference[] property EdgeMarker3Refs auto
ObjectReference[] property MapMarkerRefs auto
ObjectReference[] property CenterMarkerRefs auto
ObjectReference[] property AnchorRefs auto

GlobalVariable property _Camp_Workshop1Built auto
GlobalVariable property _Camp_Workshop2Built auto
GlobalVariable property _Camp_Workshop3Built auto
GlobalVariable property _Camp_Workshop4Built auto
GlobalVariable property _Camp_Workshop5Built auto
GlobalVariable property _Camp_Workshop6Built auto
GlobalVariable property _Camp_Workshop7Built auto
GlobalVariable property _Camp_Workshop8Built auto
GlobalVariable property _Camp_Workshop9Built auto
GlobalVariable property _Camp_Workshop10Built auto

Keyword property WorkshopEventInitializeLocation auto
Keyword property WorkshopLinkedPrimitive auto
Quest property WorkshopParent auto

Message property _Camp_WorkshopSelectName1 auto
Message property _Camp_WorkshopSelectName2 auto
Message property _Camp_WorkshopSelectName3 auto

CustomEvent WorkshopInitializeLocation

Event OnInit()
	InitializeSettlements()
EndEvent

function InitializeSettlements()
	int i = 0
	while i < 10
		ObjectReference new_workshop = BuildableWorkshopRefs[i]
		Location new_location = new_workshop.GetCurrentLocation()
		(new_workshop as WorkshopScript).myLocation = new_location
		(new_workshop as WorkshopScript).myMapMarker = MapMarkerRefs[i]
		WorkshopEventInitializeLocation.SendStoryEventAndWait(new_location)
		i += 1
	endWhile
	
	bool success = (WorkshopParent as WorkshopParentScript).ReinitializeLocationsPUBLIC((BuildableWorkshopRefs as WorkshopScript[]), WorkshopParent as WorkshopParentScript)
	if success
		debug.trace("[Conquest] Custom workshops initialized.")
	else
		debug.trace("[Conquest] ERROR - Custom workshops init FAILED.")
	endif
endFunction

ObjectReference[] function GetCustomWorkshopObjectsByID(int aiID)
	ObjectReference[] objs = new ObjectReference[8]
	objs[0] = BuildableWorkshopRefs[aiID]
	objs[1] = BuildAreaRefs[aiID]
	objs[2] = MapMarkerRefs[aiID]
	objs[3] = CenterMarkerRefs[aiID]
	objs[4] = AnchorRefs[aiID]
	objs[5] = EdgeMarker1Refs[aiID]
	objs[6] = EdgeMarker2Refs[aiID]
	objs[7] = EdgeMarker3Refs[aiID]
	return objs
endFunction

ObjectReference function GetAvailableCustomWorkshop()
	return BuildableWorkshopRefs[ShowWorkshopSelectMenu1()]
endFunction

int function ShowWorkshopSelectMenu1()
	int i = _Camp_WorkshopSelectName1.Show()
	if i == 0
		_Camp_Workshop1Built.SetValueInt(2)
		return 0
	elseif i == 1
		_Camp_Workshop2Built.SetValueInt(2)
		return 1
	elseif i == 2
		_Camp_Workshop3Built.SetValueInt(2)
		return 2
	elseif i == 3
		_Camp_Workshop4Built.SetValueInt(2)
		return 3
	elseif i == 4
		return ShowWorkshopSelectMenu2()
	endif
endFunction

int function ShowWorkshopSelectMenu2()
	int i = _Camp_WorkshopSelectName2.Show()
	if i == 0
		return ShowWorkshopSelectMenu1()
	elseif i == 1
		_Camp_Workshop5Built.SetValueInt(2)
		return 4
	elseif i == 2
		_Camp_Workshop6Built.SetValueInt(2)
		return 5
	elseif i == 3
		_Camp_Workshop7Built.SetValueInt(2)
		return 6
	elseif i == 4
		return ShowWorkshopSelectMenu3()
	endif
endFunction

int function ShowWorkshopSelectMenu3()
	int i = _Camp_WorkshopSelectName3.Show()
	if i == 0
		return ShowWorkshopSelectMenu2()
	elseif i == 1
		_Camp_Workshop8Built.SetValueInt(2)
		return 7
	elseif i == 2
		_Camp_Workshop9Built.SetValueInt(2)
		return 8
	elseif i == 3
		_Camp_Workshop10Built.SetValueInt(2)
		return 9
	endif
endFunction