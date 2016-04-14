scriptname _Camp_SettlementManagerScript extends Quest

ObjectReference[] property BuildableWorkshopRefs auto
ObjectReference[] property BuildAreaRefs auto
ObjectReference[] property EdgeMarkerRefs auto
ObjectReference[] property MapMarkerRefs auto
ObjectReference[] property CenterMarkerRefs auto

Keyword property WorkshopLinkCenter auto
{Set up in the CK}

function InitializeSettlements()
	int i = 0
	;while i < 5
	while i < 1
		ObjectReference new_workshop = BuildableWorkshopReferences[i]
		ObjectReference new_build_area = new_workshop.GetLinkedRef(WorkshopLinkCenter)	
		Location new_location = new_workshop.GetCurrentLocation()
		(new_workshop as WorkshopScript).myLocation = new_location
		WorkshopEventInitializeLocation.SendStoryEventAndWait(new_location)
		i += 1
	endWhile
	
	bool success = (WorkshopParent as WorkshopParentScript).ReinitializeLocationsPUBLIC(BuildableWorkshopReferences, self as _Camp_SettlementManagerScript)
	if success
		debug.trace("WORKSHOP INIT SUCCESSFUL")
	else
		debug.trace("WORKSHOP INIT FAILED")
	endif
endFunction

ObjectReference[] function GetAvailableWorkshopObjects()
	; For now, just return the first one.
	ObjectReference[] objs = new ObjectReference[5]
	objs[0] = BuildableWorkshopRefs[0]
	objs[1] = BuildAreaRefs[0]
	objs[2] = EdgeMarkerRefs[0]
	objs[3] = MapMarkerRefs[0]
	objs[4] = CenterMarkerRefs[0]
	return objs
endFunction
