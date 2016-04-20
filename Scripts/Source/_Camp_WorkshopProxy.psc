scriptname _Camp_WorkshopProxy extends ObjectReference

Actor property PlayerRef auto
Quest property _Camp_SettlementManager auto Mandatory

Keyword property WorkshopEventInitializeLocation auto Mandatory

Message property _Camp_WorkshopMainMenu auto

ObjectReference property MyWorkshop auto hidden
ObjectReference property BuildArea auto hidden
ObjectReference property EdgeMarker auto hidden
ObjectReference property MapMarker auto hidden
ObjectReference property CenterMarker auto hidden

ObjectReference property _Camp_Settlement1WorkshopLocREF auto
ObjectReference property _Camp_Settlement1RefAnchor auto

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
	BuildArea.MoveTo(PlayerRef)
	EdgeMarker.MoveTo(PlayerRef)
	CenterMarker.MoveTo(PlayerRef)
	MapMarker.MoveTo(PlayerRef)
	MapMarker.GetLinkedRef().MoveTo(PlayerRef)
	MapMarker.AddToMap(true)

	debug.trace("#####################Setting Workshop ownership...")
	(MyWorkshop as WorkshopScript).SetOwnedByPlayer(true)
	debug.trace("#####################Setting Fake Workshop ownership...")
	(_Camp_Settlement1WorkshopLocREF as WorkshopScript).myLocation = _Camp_Settlement1WorkshopLocREF.GetCurrentLocation()
	(_Camp_Settlement1WorkshopLocREF as WorkshopScript).myMapMarker = MapMarker
	(_Camp_Settlement1WorkshopLocREF as WorkshopScript).SetOwnedByPlayer(true)

	;_Camp_SettlementManagerScript mgr = _Camp_SettlementManager as _Camp_SettlementManagerScript
	;WorkshopParentScript wp = mgr.WorkshopParent as WorkshopParentScript
	;MyWorkshop.GetLinkedRef(wp.WorkshopLinkContainer).MoveTo(PlayerRef)
	;self.Disable()
	;self.Delete()

	debug.trace("######################New settlement initialized.")
endFunction


Event OnActivate(ObjectReference akActionRef)
	int i = _Camp_WorkshopMainMenu.Show()
	if i == 0	; Workshop
		(MyWorkshop as _Camp_WorkshopScriptEx).EnterWorkshopMode()
		(MyWorkshop as _Camp_WorkshopScriptEx).activated_by_proxy = true
		(MyWorkshop as _Camp_WorkshopScriptEx).OnActivate(PlayerRef)
	elseif i == 1 ; Dissolve Settlement

	else

	endif
EndEvent
