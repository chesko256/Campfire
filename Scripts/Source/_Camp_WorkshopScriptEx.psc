scriptname _Camp_WorkshopScriptEx extends WorkshopScript

ObjectReference property _Camp_Settlement1RefAnchor auto
Keyword property WorkshopCaravanKeyword auto
FormList property _Camp_ScrapResources auto
Location[] locs
ObjectReference[] wkshops
MiscObject[] external_resource_items_original
int[] external_resource_counts_original
MiscObject[] external_resource_items_spent
int[] external_resource_counts_spent

Event OnWorkshopMode(bool aStart)
	if aStart
		FetchLinkedWorkshopResources()
	else
		DisposeLinkedWorkshopResources()
	endif
	parent.OnWorkshopMode(aStart)
endEvent

function FetchLinkedWorkshopResources()
	; Dirty hack - Linked workshop resources must be fetched (duplicated) manually due to restrictions
	; related to using a location that was never set up to be a settlement.
	; If you can find a better solution, let me know! chesko.tesmod@gmail.com
	locs = new Location[0]
	wkshops = new ObjectReference[0]
	locs = _Camp_Settlement1RefAnchor.GetCurrentLocation().GetAllLinkedLocations(WorkshopCaravanKeyword)

	if locs.Length > 0
		debug.notification("Fetching supply line resources...")
	endif

	debug.trace("############# Getting all linked workshops...")
	int i = 0
	while i < locs.Length
		int workshop_id = WorkshopParent.WorkshopLocations.Find(locs[i])
		if locs[i] != self.myLocation 	; Exclude my own virtual location
			wkshops.Add(WorkshopParent.Workshops[workshop_id])
		endif
		i += 1
	endWhile

	debug.trace("############# Getting all linked resources...")
	int j = 0
	while j < _Camp_ScrapResources.GetSize()
		GetResourceFromAllContainers(wkshops, _Camp_ScrapResources.GetAt(j) as MiscObject)
		j += 1
	endWhile
	debug.trace("############# Done!")
endFunction

function DisposeAndSyncLinkedWorkshopResources()
	int i = 0
	while i < external_resource_items_spent.Length
		int j = external_resource_items_original.Find(external_resource_items_spent[i])
		int delta = external_resource_counts_original[j] - external_resource_counts_spent[i]
		if delta > 0
			; We had a net loss of this resource, remove it from linked containers first.
			DepleteResourceFromAllContainers(wkshops, external_resource_items_spent[i], delta)
		elseif delta < 0
			; We had a net gain of this resource, remove the full amount of the original.
			self.RemoveItem(external_resource_items_spent[i], external_resource_counts_spent[i], true)
		endif
		i += 1
	endWhile
endFunction

function GetResourceFromAllContainers(ObjectReference[] akContainers, MiscObject akResource)
	; lock
	self.AddInventoryEventFilter(_Camp_ScrapResources)
	external_resource_items_original = new MiscObject[0]
	external_resource_counts_original = new int[0]
	external_resource_items_spent = new MiscObject[0]
	external_resource_counts_spent = new int[0]
	int i = 0
	while i < akContainers.Length
		int amount = akContainers[i].GetItemCount(akResource)
		if amount > 0
			self.AddItem(akResource, amount, true)
			int ext_idx = external_resource_items.Find(akResource)
			if ext_idx == -1
				external_resource_items_original.Add(akResource)
				external_resource_counts_original.Add(amount)
			else
				external_resource_counts_original[ext_idx] += amount
			endif
		endif
		i += 1
	endWhile
endFunction

function DepleteResourceFromAllContainers(ObjectReference[] akContainers, MiscObject akResource, int aiCount)
	int amount_remaining = aiCount
	int i = 0
	while i < akContainers.Length && amount_remaining > 0
		int amount = akContainers[i].GetItemCount(akResource)
		
		if amount > 0
			
			int amount_to_remove
			if amount_remaining >= amount
				amount_to_remove = amount
			else
				amount_to_remove = amount_remaining
			endif

			akContainers[i].RemoveItem(akResource, amount_to_remove, true)
			amount_remaining -= amount_to_remove
		endif
		i += 1
	endWhile

	if amount_remaining > 0
		; deplete from myself
		int self_amount = self.GetItemCount(akResource)
		if self_amount > 0
			if amount_remaining > self_amount
				debug.trace("[Campfire] Error: We used more than we originally had of " + akResource + "!")
				self.RemoveItem(akResource, self_amount, true)
			else
				self.RemoveItem(akResource, amount_remaining, true)
			endif
		endif
	endif
endFunction

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	; if crafting...
	int idx = external_resource_items_spent.Find(akBaseItem)
	if idx == -1
		external_resource_items_spent.Add(akBaseItem)
		external_resource_counts_spent.Add(aiItemCount)
	else
		external_resource_counts_spent[idx] += aiItemCount
	endif
EndEvent