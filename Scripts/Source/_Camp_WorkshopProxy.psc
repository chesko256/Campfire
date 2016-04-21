scriptname _Camp_WorkshopProxy extends ObjectReference

Actor property PlayerRef auto
Quest property _Camp_SettlementManager auto Mandatory
WorkshopParentScript Property WorkshopParent auto Mandatory

Keyword property WorkshopEventInitializeLocation auto Mandatory

Message property _Camp_WorkshopMainMenu auto
Message property _Camp_WorkshopDissolveWarning auto
Message property _Camp_WorkshopDissolveWarning2 auto
Message property _Camp_WorkshopRegainControl auto

ObjectReference property MyWorkshop auto hidden
ObjectReference property MyLocWorkshop auto hidden
ObjectReference property BuildArea auto hidden
ObjectReference property EdgeMarker auto hidden
ObjectReference property MapMarker auto hidden
ObjectReference property CenterMarker auto hidden
ObjectReference property Anchor auto hidden

bool property is_built = false auto hidden

Event OnInit()
	BuildSettlement()
EndEvent

function BuildSettlement()
	; Get the next available workshop.
	_Camp_SettlementManagerScript manager = _Camp_SettlementManager as _Camp_SettlementManagerScript
	
	ObjectReference[] myWorkshopObjects = manager.GetAvailableWorkshopObjects()
	MyWorkshop = myWorkshopObjects[0]
	MyLocWorkshop = myWorkshopObjects[1]
	BuildArea = myWorkshopObjects[2]
	EdgeMarker = myWorkshopObjects[3]
	MapMarker = myWorkshopObjects[4]
	CenterMarker = myWorkshopObjects[5]
	Anchor = myWorkshopObjects[6]

	debug.trace("MyWorkshop " + MyWorkshop + " BuildArea " + BuildArea)

	debug.trace("##################### Setting Workshop ownership...")
	(MyWorkshop as WorkshopScript).SetOwnedByPlayer(true)

	; Move the build area and markers to us.
	BuildArea.MoveTo(PlayerRef)
	EdgeMarker.MoveTo(PlayerRef)
	CenterMarker.MoveTo(PlayerRef)
	MapMarker.MoveTo(PlayerRef)
	MapMarker.GetLinkedRef().MoveTo(PlayerRef)
	MapMarker.AddToMap(true)

	MyWorkshop.MoveTo(self)

	; debug.trace("##################### Setting Fake Workshop ownership...")
	; The "fake" location workshop is required in order to assign settlers to it (move or supply line)
	; because a workshop MUST be physically located in our named location. Also for linked resources.
	;  (MyLocWorkshop as WorkshopScript).myLocation = MyLocWorkshop.GetCurrentLocation()
	;  (MyLocWorkshop as WorkshopScript).myMapMarker = MapMarker
	;  (MyLocWorkshop as WorkshopScript).SetOwnedByPlayer(true)

	;_Camp_SettlementManagerScript mgr = _Camp_SettlementManager as _Camp_SettlementManagerScript
	;WorkshopParentScript wp = mgr.WorkshopParent as WorkshopParentScript
	;MyWorkshop.GetLinkedRef(wp.WorkshopLinkContainer).MoveTo(PlayerRef)
	;self.Disable()
	;self.Delete()

	is_built = true
	debug.trace("######################New settlement initialized.")
endFunction


Event OnActivate(ObjectReference akActionRef)
	int i

	if is_built
		i = _Camp_WorkshopMainMenu.Show()
		if i == 0	; Workshop
			bool b = (MyWorkshop as _Camp_WorkshopScriptEx).EnterWorkshopMode()
			(MyWorkshop as _Camp_WorkshopScriptEx).activated_by_proxy = true
			(MyWorkshop as _Camp_WorkshopScriptEx).OnActivate(PlayerRef)
		elseif i == 1 ; Transfer
			MyWorkshop.Activate(PlayerRef, abDefaultProcessingOnly = true)
		elseif i == 2 ; Dissolve Settlement
			int j = _Camp_WorkshopDissolveWarning.Show()
			if j == 0
				int k = _Camp_WorkshopDissolveWarning2.Show()
				if k == 0
					DissolveSettlement()
				endif
			endif
		endif
	else
		; Take control again.
		i = _Camp_WorkshopRegainControl.Show()
		if i == 0
			BuildSettlement()
		elseif i == 1
			ScrapWorkshop()
		endif
	endif
EndEvent

Event OnLoad()
	if is_built && MyWorkshop
		MyWorkshop.MoveTo(self)
		debug.trace("Moved to proxy.")
	endif
EndEvent

Event OnUnload()
	if is_built && MyWorkshop
		MyWorkshop.MoveTo(Anchor)
		debug.trace("Moved to home location.")
	endif
EndEvent

function DissolveSettlement()
	; Fade out
	
	MyWorkshop.MoveTo(Anchor)
	BuildArea.MoveTo(Anchor)
	EdgeMarker.MoveTo(Anchor)
	MapMarker.MoveTo(Anchor)
	CenterMarker.MoveTo(Anchor)

	MyWorkshop.RemoveAllItems(PlayerRef)
	ObjectReference linked_container = (MyWorkshop as WorkshopScript).GetContainer()
	if linked_container
		linked_container.RemoveAllItems(PlayerRef)
	endif

	; Reassign companions

	; Unregister the workshop
	(MyWorkshop as WorkshopScript).SetOwnedByPlayer(false)

	MyWorkshop = none
	MyLocWorkshop = none
	BuildArea = none
	EdgeMarker = none
	MapMarker = none
	CenterMarker = none
	Anchor = none
endFunction

MiscObject property c_Steel_scrap auto
MiscObject property c_Aluminum_scrap auto
MiscObject property c_Gears_scrap auto
MiscObject property c_Screws_scrap auto
Sound property _Camp_ScrapGenericSM auto

function ScrapWorkshop()
	PlayerRef.AddItem(c_Steel_scrap, 7)
	PlayerRef.AddItem(c_Aluminum_scrap, 2)
	PlayerRef.AddItem(c_Gears_scrap, 2)
	PlayerRef.AddItem(c_Screws_scrap, 2)
	_Camp_ScrapGenericSM.Play(self)
	self.Disable()
	self.Delete()
endFunction