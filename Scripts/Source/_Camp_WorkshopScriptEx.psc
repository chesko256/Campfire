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

bool in_workshop_mode = false
bool process_locked = false
bool property activated_by_proxy = false auto

; Called from _Camp_WorkshopProxy
function EnterWorkshopMode()
	in_workshop_mode = true
	FetchLinkedWorkshopResources()
endFunction

Event OnWorkshopMode(bool aStart)
	if !aStart
		Utility.Wait(1)
		in_workshop_mode = false
		DisposeAndSyncLinkedWorkshopResources()
	else
		if activated_by_proxy
			activated_by_proxy = false
			; continue
		else
			; Player started by holding V - bail them out, check everything, and then come back in
			StartWorkshop(false)
			EnterWorkshopMode()
			activated_by_proxy = true
			OnActivate(Game.GetPlayer())
		endif
	endif
	parent.OnWorkshopMode(aStart)
endEvent

function FetchLinkedWorkshopResources()
	; Dirty hack - Linked workshop resources must be fetched (duplicated) manually due to restrictions
	; related to using a location that was never set up to be a settlement.
	; If you can find a better solution, let me know! chesko.tesmod@gmail.com
	self.AddInventoryEventFilter(_Camp_ScrapResources)
	external_resource_items_original = new MiscObject[31]
	external_resource_counts_original = new int[31]
	external_resource_items_spent = new MiscObject[31]
	external_resource_counts_spent = new int[31]
	
	locs = new Location[0]
	wkshops = new ObjectReference[0]
	locs = _Camp_Settlement1RefAnchor.GetCurrentLocation().GetAllLinkedLocations(WorkshopCaravanKeyword)

	if locs.Length > 0
		debug.notification("Checking supply lines...")
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
	debug.trace("original resource items list length: " + external_resource_items_original.Length)
	while i < external_resource_items_original.Length
		debug.trace("Finding " + external_resource_items_original[i] + " in spent list.")
		int j = external_resource_items_spent.Find(external_resource_items_original[i])
		if j != -1
			int delta = external_resource_counts_original[i] - external_resource_counts_spent[j]
			if delta > 0
				; We had a net loss of this resource, remove it from linked containers first.
				debug.trace("Deplete from all containers...")
				DepleteResourceFromAllContainers(wkshops, external_resource_items_spent[j], delta)
			elseif delta < 0
				; We had a net gain of this resource, remove the full amount of the original.
				self.RemoveItem(external_resource_items_original[i], external_resource_counts_original[i], true)
				debug.trace("############# Net gain of " + external_resource_items_original[i] + ", removing " + external_resource_counts_original[i] + " and keeping " + delta)
			endif
		else
			; We didn't spend any of this resource; deplete all of it.
			self.RemoveItem(external_resource_items_original[i], external_resource_counts_original[i], true)
			debug.trace("############# Didn't use " + external_resource_items_original[i] + ", removing " + external_resource_counts_original[i])
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
				int m = ArrayAddForm(external_resource_items_original, akResource as MiscObject)
				if m != -1
					external_resource_counts_original[m] = amount
				endif
				debug.trace("############# Adding " + amount + " " + akResource + " to the external resource list.")
			else
				external_resource_counts_original[ext_idx] += amount
				debug.trace("############# Adding " + amount + " " + akResource + " to the external resource list (append).")
			endif
		endif
		i += 1
	endWhile
	process_locked = false
endFunction

function DepleteResourceFromAllContainers(ObjectReference[] akContainers, MiscObject akResource, int aiCount)
	int pl = 0
	while process_locked && pl < 100
		Utility.Wait(0.1)
		pl += 1
	endWhile
	process_locked = true

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

			debug.trace("############# Removing " + amount_to_remove + " " + akResource + " from " + akContainers[i] + " (" + amount_remaining + " left to remove)")
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
				debug.trace("############# Removing " + amount_remaining + " " + akResource + " from self (" + amount_remaining + " left to remove)")
			endif
		endif
	endif
	process_locked = false
endFunction

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	debug.trace("############# Items removed from Workshop: " + akBaseItem)
	if in_workshop_mode
		int idx = external_resource_items_spent.Find(akBaseItem as MiscObject)
		if idx == -1
			int m = ArrayAddForm(external_resource_items_spent, akBaseItem as MiscObject)
			if m != -1
				external_resource_counts_spent[m] = aiItemCount
			endif
		else
			external_resource_counts_spent[idx] += aiItemCount
		endif
	endif
EndEvent

int function ArrayAddForm(MiscObject[] myArray, MiscObject myForm)
;Adds a form to the first available element in the array.
	;		return	= the index the element was stored at.

	int i = 0
	while i < myArray.Length
		if IsNone(myArray[i])
			myArray[i] = myForm
			return i
		else
			i += 1
		endif
	endWhile
	return -1
endFunction

; Array elements that contain forms from unloaded mods
; will fail '== None' checks because they are
; 'Activator<None>' objects. Check FormID as well.
bool function IsNone(Form akForm) global
	int i = 0
	if akForm
		i = akForm.GetFormID()
		if i == 0
			return true
		else
			return false
		endif
	else
		return true
	endif
endFunction