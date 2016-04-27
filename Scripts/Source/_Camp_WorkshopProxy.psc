scriptname _Camp_WorkshopProxy extends ObjectReference

Actor property PlayerRef auto
Quest property _Camp_SettlementManager auto Mandatory
WorkshopParentScript Property WorkshopParent auto Mandatory
GlobalVariable property _Camp_StoredProxyErrorCondition auto Mandatory

Keyword property WorkshopEventInitializeLocation auto Mandatory

Message property _Camp_WorkshopMainMenu auto
Message property _Camp_WorkshopDissolveWarning auto
Message property _Camp_WorkshopDissolveWarning2 auto
Message property _Camp_WorkshopRegainControl auto

Activator property _Camp_CampsiteEquipmentActivator auto
ObjectReference property MyWorkshop auto hidden
bool property is_built = false auto hidden
bool property initialized = false auto hidden

Event OnInit()
	SetUpProxy()
	initialized = true
EndEvent

function SetUpProxy()
	if _Camp_StoredProxyErrorCondition.GetValueInt() != 2
		; Break down campsite this came from
		ObjectReference camp = Game.FindClosestReferenceOfTypeFromRef(_Camp_CampsiteEquipmentActivator, self, 4000.0)
		if camp
			ObjectReference camp_workshop = (camp as CampPlaceableCampsite).myCampsiteWorkshop
			if camp_workshop
				(camp_workshop as WorkshopScript).StartWorkshop(false)
			endif
			Game.FadeOutGame(True, True, 0.0, 2.0, True)
			(camp as CampPlaceableCampsite).PickUpAllCampsiteObjects()
			(camp as CampPlaceableCampsite).CampsiteObjects = new ObjectReference[128]
			(camp as CampPlaceableCampsite).TakeDown()
			Utility.Wait(3.0)
			Game.PassTime(1)
			Game.FadeOutGame(False, True, 0.0, 2.0)
		endif

		; Set up the settlement
		MyWorkshop = (_Camp_SettlementManager as _Camp_SettlementManagerScript).GetAvailableCustomWorkshop()
		if MyWorkshop
			(MyWorkshop as _Camp_WorkshopScriptEx).BuildSettlement(self)
		endif
	endif
endFunction

function SetWorkshop(ObjectReference akWorkshop)
	if akWorkshop
		MyWorkshop = akWorkshop
		is_built = true
	endif
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
					(MyWorkshop as _Camp_WorkshopScriptEx).DissolveSettlement()
					is_built = false
				endif
			endif
		endif
	else
		; Take control again.
		i = _Camp_WorkshopRegainControl.Show()
		if i == 0
			SetUpProxy()
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
		MyWorkshop.MoveTo((MyWorkshop as _Camp_WorkshopScriptEx).Anchor)
		debug.trace("Moved to home location.")
	endif
EndEvent

MiscObject property c_Steel_scrap auto
MiscObject property c_Gears_scrap auto
MiscObject property c_Screws_scrap auto
Sound property _Camp_ScrapGenericSM auto

function ScrapWorkshop()
	PlayerRef.AddItem(c_Steel_scrap, 7)
	PlayerRef.AddItem(c_Gears_scrap, 2)
	PlayerRef.AddItem(c_Screws_scrap, 2)
	_Camp_ScrapGenericSM.Play(self)
	self.Disable()
	self.Delete()
endFunction