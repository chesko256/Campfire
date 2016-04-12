scriptname _Camp_InitializeSettlement extends ObjectReference

ObjectReference property _Camp_NewWorkshop1 auto
ObjectReference property _Camp_NewWorkshop2 auto
ObjectReference property _Camp_NewWorkshop3 auto
ObjectReference property _Camp_NewWorkshop4 auto
ObjectReference property _Camp_NewWorkshop5 auto
Keyword property WorkshopLinkCenter auto

Event OnInit()
	InitializeSettlement()
EndEvent

function InitializeSettlement()
	; Get the next available workshop.
	ObjectReference new_workshop = GetAvailableWorkshop()
	ObjectReference new_build_area = new_workshop.GetLinkedRef(WorkshopLinkCenter)
	debug.trace("new_workshop " + new_workshop + " new_build_area " + new_build_area)

	; Move the workshop and build area to us.
	new_workshop.MoveTo(self)
	new_build_area.MoveTo(self)
	self.disable()
	self.delete()
	debug.trace("New settlement initialized.")
endFunction

ObjectReference function GetAvailableWorkshop()
	; For now, just return the first one.
	return _Camp_NewWorkshop1
endFunction