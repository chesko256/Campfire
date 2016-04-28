scriptname _Camp_WorkshopScriptEx extends WorkshopScript

import _CampInternal

Actor property PlayerRef auto
Quest property Followers auto

; Proxy
Activator property _Camp_PlaceableSettlementWorkshop auto
GlobalVariable property _Camp_StoredProxyErrorCondition auto Mandatory
Static property _Camp_WorkshopBoundary auto Mandatory

GlobalVariable[] property CustomWorkshopBuiltGlobals auto
int property MyCustomWorkshopID auto
{Set on the workshop reference.}

Quest property _Camp_SettlementManager auto Mandatory
Message property _Camp_Error_StoreWorkshop auto

; Emulated Supply Line system
Keyword property WorkshopCaravanKeyword auto
FormList property _Camp_ScrapResources auto
Formlist property _Camp_UnstorableWorkshops auto
Location[] locs
ObjectReference[] wkshops
MiscObject[] external_resource_items_original
int[] external_resource_counts_original
MiscObject[] external_resource_items_spent
int[] external_resource_counts_spent

; Control flow
bool in_workshop_mode = false
bool process_locked = false
bool force_exit = false
bool property activated_by_proxy = false auto

; Identity
ObjectReference property MyProxy auto hidden
ObjectReference property BuildArea auto hidden
ObjectReference property EdgeMarker1 auto hidden
ObjectReference property EdgeMarker2 auto hidden
ObjectReference property EdgeMarker3 auto hidden
ObjectReference property MapMarker auto hidden
ObjectReference property CenterMarker auto hidden
ObjectReference property Anchor auto hidden
ObjectReference property BuildAreaEdge auto hidden


; ///// SET-UP AND TEARDOWN ////////////////////////////////////////////////////////////

function BuildSettlement(ObjectReference akProxy)
	MyProxy = akProxy

	_Camp_SettlementManagerScript manager = _Camp_SettlementManager as _Camp_SettlementManagerScript
	ObjectReference[] myWorkshopObjects = manager.GetCustomWorkshopObjectsByID(MyCustomWorkshopID)
	BuildArea = myWorkshopObjects[1]
	MapMarker = myWorkshopObjects[2]
	CenterMarker = myWorkshopObjects[3]
	Anchor = myWorkshopObjects[4]
	EdgeMarker1 = myWorkshopObjects[5]
	EdgeMarker2 = myWorkshopObjects[6]
	EdgeMarker3 = myWorkshopObjects[7]

	CampDebug(0, "Workshop " + self + " BuildArea " + BuildArea)

	CampDebug(0, "##################### Setting Workshop ownership...")
	SetOwnedByPlayer(true)

	; Move the build area and markers to us.
	BuildArea.MoveTo(PlayerRef)
	EdgeMarker1.MoveTo(PlayerRef)
	EdgeMarker2.MoveTo(PlayerRef)
	EdgeMarker3.MoveTo(PlayerRef)
	CenterMarker.MoveTo(PlayerRef)
	MapMarker.MoveTo(PlayerRef)
	MapMarker.GetLinkedRef().MoveTo(PlayerRef)
	MapMarker.AddToMap(true)

	self.MoveTo(MyProxy)

	(MyProxy as _Camp_WorkshopProxy).SetWorkshop(self)

	BuildAreaEdge = self.PlaceAtMe(_Camp_WorkshopBoundary, abInitiallyDisabled = true)
	BuildAreaEdge.MoveTo(self, afZOffset = 350.0)
	BuildAreaEdge.SetScale(4.0)
	self.AddInventoryEventFilter(_Camp_UnstorableWorkshops)
	self.AddInventoryEventFilter(_Camp_ScrapResources)

	CampDebug(0, "######################New settlement initialized.")
endFunction

function DissolveSettlement()
	; Fade out
	Game.FadeOutGame(True, True, 0.0, 2.0, True)
	
	BuildArea.MoveTo(Anchor)
	EdgeMarker1.MoveTo(Anchor)
	EdgeMarker2.MoveTo(Anchor)
	EdgeMarker3.MoveTo(Anchor)
	MapMarker.MoveTo(Anchor)
	CenterMarker.MoveTo(Anchor)
	BuildAreaEdge.Disable()
	BuildAreaEdge.Delete()
	self.MoveTo(Anchor)

	self.RemoveAllItems(PlayerRef)
	ObjectReference linked_container = GetContainer()
	if linked_container
		linked_container.RemoveAllItems(PlayerRef)
	endif

	WorkshopParentScript p = WorkshopParent
	FollowersScript f = Followers as FollowersScript

	; Move companions and disband settlers
	ObjectReference[] WorkshopActors = p.GetWorkshopActors(self as WorkshopScript)
	int i = 0
	while i < WorkshopActors.length
		p.RemoveActorFromWorkshopPUBLIC(WorkshopActors[i] as WorkshopNPCScript)
		
		if f.IsPossibleCompanion(WorkshopActors[i] as Actor)
			f.DismissCompanion(WorkshopActors[i] as Actor, false, true)
		endif
		i += 1
	endWhile

	; Reset happiness and other stats
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingHappiness].resourceValue, 50.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFood].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingPopulation].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingSafety].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingWater].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingPower].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingBeds].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingRadio].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingDamageCurrent].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingDamageMax].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingLastAttackDaysSince].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingDamageFood].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingDamageWater].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingDamageSafety].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingDamagePower].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingDamagePopulation].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodActual].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingArtillery].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingDamageArtillery].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingPopulationRobots].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingVendorIncome].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingBrahmin].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingMissingFood].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingMissingWater].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingMissingBeds].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingScavengeGeneral].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingScavengeBuilding].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingScavengeParts].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingScavengeRare].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingCaravan].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodTypeCarrot].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodTypeCorn].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodTypeGourd].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodTypeMelon].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodTypeMutfruit].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodTypeRazorgrain].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodTypeTarberry].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingFoodTypeTato].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingPopulationSynths].resourceValue, 0.0)
	(self as WorkshopScript).SetValue(p.WorkshopRatings[p.WorkshopRatingMissingSafety].resourceValue, 0.0)

	; Unregister the workshop
	SetOwnedByPlayer(false)

	MyProxy = none
	BuildArea = none
	EdgeMarker1 = none
	EdgeMarker2 = none
	EdgeMarker3 = none
	MapMarker = none
	CenterMarker = none
	Anchor = none

	; Free up the workshop global
	CustomWorkshopBuiltGlobals[MyCustomWorkshopID].SetValueInt(1)

	Utility.Wait(3.0)
	Game.PassTime(1)
	Game.FadeOutGame(False, True, 0.0, 2.0)
endFunction


; ///// SUPPLY LINES ////////////////////////////////////////////////////////////

; Called from _Camp_WorkshopProxy
bool function EnterWorkshopMode()
	in_workshop_mode = true
	bool supply_lines_exist = FetchLinkedWorkshopResources()
	return supply_lines_exist
endFunction

Event OnWorkshopMode(bool aStart)
	if aStart
		if activated_by_proxy
			activated_by_proxy = false
			parent.OnWorkshopMode(aStart)
			BuildAreaEdge.Enable()
		elseif !force_exit
			; Player started by holding V - check everything, bail them out, and then come back in
			force_exit = true
			bool supply_lines_exist = EnterWorkshopMode()
			if supply_lines_exist
				StartWorkshop(false)
				debug.notification("Supply lines loaded, restarting Workshop.")
				Utility.Wait(0.5)
				activated_by_proxy = true
				StartWorkshop()
			endif
			BuildAreaEdge.Enable()
			force_exit = false
		endif
	else
		if !force_exit
			Utility.Wait(0.5)
			in_workshop_mode = false
			BuildAreaEdge.Disable()
			DisposeAndSyncLinkedWorkshopResources()
			parent.OnWorkshopMode(aStart)
		endif
	endif
endEvent

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	parent.OnWorkshopObjectDestroyed(akReference)

	if _Camp_UnstorableWorkshops.HasForm(akReference.GetBaseObject())
		_Camp_StoredProxyErrorCondition.SetValueInt(2)
		_Camp_Error_StoreWorkshop.Show()
		ObjectReference proxy = self.PlaceAtMe(_Camp_PlaceableSettlementWorkshop)
		
		; Wait for the proxy to initialize
		int i = 0
		while (proxy as _Camp_WorkshopProxy).initialized == false && i < 50
			Utility.Wait(0.1)
		endWhile
		
		(proxy as _Camp_WorkshopProxy).SetWorkshop(self)
		_Camp_StoredProxyErrorCondition.SetValueInt(1)
	endif
endEvent

bool function FetchLinkedWorkshopResources()
	; Dirty hack - Linked workshop resources must be fetched (duplicated) manually due to restrictions
	; related to using a location that was never set up to be a settlement.
	; If you can find a better solution, let me know! chesko.tesmod@gmail.com
	
	external_resource_items_original = new MiscObject[0]
	external_resource_counts_original = new int[0]
	external_resource_items_spent = new MiscObject[0]
	external_resource_counts_spent = new int[0]
	
	locs = new Location[0]
	wkshops = new ObjectReference[0]
	locs = Anchor.GetCurrentLocation().GetAllLinkedLocations(WorkshopCaravanKeyword)

	if locs.Length > 0
		debug.notification("Checking supply lines, please wait...")
	else
		return false
	endif

	CampDebug(0, "############# Getting all linked workshops...")
	int i = 0
	while i < locs.Length
		int workshop_id = WorkshopParent.WorkshopLocations.Find(locs[i])
		if locs[i] != self.myLocation 	; Exclude my own virtual location
			wkshops.Add(WorkshopParent.Workshops[workshop_id])
		endif
		i += 1
	endWhile

	CampDebug(0, "############# Getting all linked resources...")
	int j = 0
	while j < _Camp_ScrapResources.GetSize()
		GetResourceFromAllContainers(wkshops, _Camp_ScrapResources.GetAt(j) as MiscObject)
		j += 1
	endWhile
	CampDebug(0, "############# Done!")
	return true
endFunction

function DisposeAndSyncLinkedWorkshopResources()
	int i = 0
	CampDebug(0, "original resource items list length: " + external_resource_items_original.Length)
	while i < external_resource_items_original.Length
		CampDebug(0, "Finding " + external_resource_items_original[i] + " in spent list.")
		int j = external_resource_items_spent.Find(external_resource_items_original[i])
		if j != -1
			int delta = external_resource_counts_original[i] - external_resource_counts_spent[j]
			if delta > 0
				; We had a net loss of this resource, remove it from linked containers first.
				CampDebug(0, "Deplete from all containers...")
				DepleteResourceFromAllContainers(wkshops, external_resource_items_spent[j], external_resource_counts_spent[j], delta)
			elseif delta < 0
				; We had a net gain of this resource, remove the full amount of the original.
				self.RemoveItem(external_resource_items_original[i], external_resource_counts_original[i], true)
				CampDebug(0, "############# Net gain of " + external_resource_items_original[i] + ", removing " + external_resource_counts_original[i] + " and keeping " + delta)
			endif
		else
			; We didn't spend any of this resource; deplete all of it.
			self.RemoveItem(external_resource_items_original[i], external_resource_counts_original[i], true)
			CampDebug(0, "############# Didn't use " + external_resource_items_original[i] + ", removing " + external_resource_counts_original[i])
		endif
		i += 1
	endWhile
endFunction

function GetResourceFromAllContainers(ObjectReference[] akContainers, MiscObject akResource)
	int pl = 0
	while process_locked && pl < 100
		Utility.Wait(0.1)
		pl += 1
	endWhile
	process_locked = true

	int i = 0
	while i < akContainers.Length
		int amount = akContainers[i].GetItemCount(akResource)
		if amount > 0
			self.AddItem(akResource, amount, true)
			int ext_idx = external_resource_items_original.Find(akResource)
			if ext_idx == -1
				external_resource_items_original.Add(akResource as MiscObject)
				external_resource_counts_original.Add(amount)
				CampDebug(0, "############# Adding " + amount + " " + akResource + " to the external resource list.")
			else
				external_resource_counts_original[ext_idx] += amount
				CampDebug(0, "############# Adding " + amount + " " + akResource + " to the external resource list (append).")
			endif
		endif
		i += 1
	endWhile
	process_locked = false
endFunction

function DepleteResourceFromAllContainers(ObjectReference[] akContainers, MiscObject akResource, int aiAmountUsed, int aiAmountRemaining)
	int pl = 0
	while process_locked && pl < 100
		Utility.Wait(0.1)
		pl += 1
	endWhile
	process_locked = true

	; Remove the unused portion
	self.RemoveItem(akResource, aiAmountRemaining, true)

	; Remove the used portion from external workshops
	int total_amount_to_deplete = aiAmountUsed
	int i = 0
	while i < akContainers.Length && total_amount_to_deplete > 0
		int amount = akContainers[i].GetItemCount(akResource)
		
		if amount > 0
			int amount_to_remove_from_this_container
			if total_amount_to_deplete >= amount
				amount_to_remove_from_this_container = amount
			else
				amount_to_remove_from_this_container = total_amount_to_deplete
			endif

			CampDebug(0, "############# Removing " + amount_to_remove_from_this_container + " " + akResource + " from " + akContainers[i] + " (" + total_amount_to_deplete + " left to remove)")
			akContainers[i].RemoveItem(akResource, amount_to_remove_from_this_container, true)
			total_amount_to_deplete -= amount_to_remove_from_this_container
		endif
		i += 1
	endWhile

	if total_amount_to_deplete > 0
		; deplete from myself
		int self_amount = self.GetItemCount(akResource)
		if self_amount > 0
			if total_amount_to_deplete > self_amount
				CampDebug(0, "[Conquest] Error: We used more than we originally had of " + akResource + "!")
				self.RemoveItem(akResource, self_amount, true)
			else
				self.RemoveItem(akResource, total_amount_to_deplete, true)
				CampDebug(0, "############# Removing " + total_amount_to_deplete + " " + akResource + " from self (" + total_amount_to_deplete + " left to remove)")
			endif
		endif
	endif
	process_locked = false
endFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if _Camp_UnstorableWorkshops.HasForm(akBaseItem)
		
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if _Camp_UnstorableWorkshops.HasForm(akBaseItem)
		return
	endif

	if in_workshop_mode
		int idx = external_resource_items_spent.Find(akBaseItem as MiscObject)
		if idx == -1
			external_resource_items_spent.Add(akBaseItem as MiscObject)
			external_resource_counts_spent.Add(aiItemCount)
		else
			external_resource_counts_spent[idx] += aiItemCount
		endif
	endif
EndEvent
