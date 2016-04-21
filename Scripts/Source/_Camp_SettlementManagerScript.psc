scriptname _Camp_SettlementManagerScript extends Quest

ObjectReference[] property BuildableWorkshopRefs auto
ObjectReference[] property LocationWorkshopRefs auto
ObjectReference[] property BuildAreaRefs auto
ObjectReference[] property EdgeMarkerRefs auto
ObjectReference[] property MapMarkerRefs auto
ObjectReference[] property CenterMarkerRefs auto
ObjectReference[] property AnchorRefs auto

Keyword property WorkshopEventInitializeLocation auto
Keyword property WorkshopLinkedPrimitive auto
Quest property WorkshopParent auto

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

ObjectReference[] function GetAvailableWorkshopObjects()
	; For now, just return the first one.
	ObjectReference[] objs = new ObjectReference[7]
	objs[0] = BuildableWorkshopRefs[0]
	objs[1] = LocationWorkshopRefs[0]
	objs[2] = BuildAreaRefs[0]
	objs[3] = EdgeMarkerRefs[0]
	objs[4] = MapMarkerRefs[0]
	objs[5] = CenterMarkerRefs[0]
	objs[6] = AnchorRefs[0]
	return objs
endFunction
