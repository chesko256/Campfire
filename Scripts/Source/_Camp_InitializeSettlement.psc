scriptname _Camp_InitializeSettlement extends ObjectReference

Location property _Camp_WorkshopLocation1 auto
ObjectReference property _Camp_BuildableWorkshopREF1 auto
ObjectReference property _Camp_Workshop1EdgeMarker auto
ObjectReference property _Camp_Workshop1MapMarker auto
ObjectReference property _Camp_Workshop1CenterMarker auto

ObjectReference property _Camp_NewWorkshop2 auto
ObjectReference property _Camp_NewWorkshop3 auto
ObjectReference property _Camp_NewWorkshop4 auto
ObjectReference property _Camp_NewWorkshop5 auto

Quest property WorkshopParent auto
Quest property _Camp_MainQuest auto
Keyword property WorkshopEventInitializeLocation auto
Keyword property WorkshopLinkCenter auto

Event OnInit()
	InitializeSettlement()
EndEvent

function InitializeSettlement()
	; Get the next available workshop.
	ObjectReference new_workshop = GetAvailableWorkshop()
	ObjectReference new_build_area = new_workshop.GetLinkedRef(WorkshopLinkCenter)
	debug.trace("new_workshop " + new_workshop + " new_build_area " + new_build_area)
	(new_workshop as WorkshopScript).myLocation = new_workshop.GetCurrentLocation()

	WorkshopEventInitializeLocation.SendStoryEventAndWait(_Camp_WorkshopLocation1)
	WorkshopScript[] newWorkshops = new WorkshopScript[1]
	newWorkshops[0] = (new_workshop as WorkshopScript)
	bool b = (WorkshopParent as WorkshopParentScript).ReinitializeLocationsPUBLIC(newWorkshops, _Camp_MainQuest)

	if b
		debug.trace("WORKSHOP INIT SUCCESSFUL")
	else
		debug.trace("WORKSHOP INIT FAILED")
	endif
	; Move the workshop and build area to us.
	new_workshop.MoveTo(self)
	new_build_area.MoveTo(self)
	_Camp_Workshop1EdgeMarker.MoveTo(self)
	_Camp_Workshop1MapMarker.MoveTo(self)
	_Camp_Workshop1CenterMarker.MoveTo(self)

	

	self.disable()
	self.delete()
	debug.trace("New settlement initialized.")
endFunction

ObjectReference function GetAvailableWorkshop()
	; For now, just return the first one.
	return _Camp_BuildableWorkshopREF1
endFunction