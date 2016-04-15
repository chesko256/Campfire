scriptname _Camp_WorkshopProxy extends ObjectReference

Actor property PlayerRef auto
Quest property _Camp_SettlementManager auto Mandatory
Keyword property WorkshopEventInitializeLocation auto Mandatory
ObjectReference property _Camp_SettlementMapMarker1 auto

ObjectReference property MyWorkshop auto hidden
ObjectReference property BuildArea auto hidden
ObjectReference property EdgeMarker auto hidden
ObjectReference property MapMarker auto hidden
ObjectReference property CenterMarker auto hidden

Event OnInit()
	BuildSettlement()
EndEvent

function BuildSettlement()
	; Get the next available workshop.
	_Camp_SettlementManagerScript manager = _Camp_SettlementManager as _Camp_SettlementManagerScript
	
	ObjectReference[] myWorkshopObjects = manager.GetAvailableWorkshopObjects()
	MyWorkshop = myWorkshopObjects[0]
	BuildArea = myWorkshopObjects[1]
	EdgeMarker = myWorkshopObjects[2]
	MapMarker = myWorkshopObjects[3]
	CenterMarker = myWorkshopObjects[4]

	debug.trace("MyWorkshop " + MyWorkshop + " BuildArea " + BuildArea)

	; Move the build area and markers to us.
	MyWorkshop.MoveTo(self)
	BuildArea.MoveTo(self)
	EdgeMarker.MoveTo(self)
	CenterMarker.MoveTo(self)
	;MapMarker.MoveTo(self)

	; Test map marker
	_Camp_SettlementMapMarker1REF.MoveTo(self)
	_Camp_SettlementMapMarker1REF.AddToMap(true)

	self.Disable()
	self.Delete()

	debug.trace("New settlement initialized.")
endFunction

