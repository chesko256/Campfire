scriptname _Camp_SettlementManagerScript extends Quest

ObjectReference[] property BuildableWorkshopRefs auto
ObjectReference[] property BuildAreaRefs auto
ObjectReference[] property EdgeMarkerRefs auto
ObjectReference[] property MapMarkerRefs auto
ObjectReference[] property CenterMarkerRefs auto
ObjectReference[] property AnchorRefs auto

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
	;while i < 5
	while i < 1
		ObjectReference new_workshop = BuildableWorkshopRefs[i]
		ObjectReference new_build_area = new_workshop.GetRefsLinkedToMe(WorkshopLinkedPrimitive)[0]
		Location new_location = new_workshop.GetCurrentLocation()
		(new_workshop as WorkshopScript).myLocation = new_location
		(new_workshop as WorkshopScript).myMapMarker = MapMarkerRefs[i]
		WorkshopEventInitializeLocation.SendStoryEventAndWait(new_location)
		i += 1
	endWhile
	
	bool success = (WorkshopParent as WorkshopParentScript).ReinitializeLocationsPUBLIC((BuildableWorkshopRefs as WorkshopScript[]), WorkshopParent as WorkshopParentScript)
	if success
		debug.trace("WORKSHOP INIT SUCCESSFUL")
	else
		debug.trace("WORKSHOP INIT FAILED")
	endif
endFunction

ObjectReference[] function GetCustomWorkshopObjectsByID(int aiID)
	ObjectReference[] objs = new ObjectReference[6]
	objs[0] = BuildableWorkshopRefs[aiID]
	objs[1] = BuildAreaRefs[aiID]
	objs[2] = EdgeMarkerRefs[aiID]
	objs[3] = MapMarkerRefs[aiID]
	objs[4] = CenterMarkerRefs[aiID]
	objs[5] = AnchorRefs[aiID]
	return objs
endFunction

ObjectReference function GetAvailableCustomWorkshop()
	return BuildableWorkshopRefs[ShowWorkshopSelectMenu1()]
endFunction

int function ShowWorkshopSelectMenu1()
	int i = _Camp_WorkshopSelectName1.Show()
	if i == 0
		return 0
	elseif i == 1
		return 1
	elseif i == 2
		return 2
	elseif i == 3
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
		return 4
	elseif i == 2
		return 5
	elseif i == 3
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
		return 7
	elseif i == 2
		return 8
	elseif i == 3
		return 9
	endif
endFunction