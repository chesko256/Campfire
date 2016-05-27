scriptname _Frost_PlayerEquipMonitor extends ReferenceAlias

import FrostUtil
import _FrostInternal

int equip_action = 0x20000000
int unequip_action = 0x10000000

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	elseif akBaseObject as Armor
		AddEquipEventToQueue(event_queue, akBaseObject, true)
		ProcessQueuedEvents(event_queue)
	endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	elseif akBaseObject as Armor
		AddEquipEventToQueue(event_queue, akBaseObject, false)
		ProcessQueuedEvents(event_queue)
	endif
EndEvent

function SendEvent_UpdateWarmth()
	FrostDebug(0, "Sending event Frost_UpdateWarmth")
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
endFunction



; Event Queue =================================================================

bool processing_queue = false
int queue_frontidx
int queue_count
int[] event_queue

function InitializeEventQueue()
	event_queue = new int[128]
endFunction

function ProcessQueuedEvents(int[] aiQueue)
	if !processing_queue
		debug.trace("Processing queued events.")
		while !qIsEmpty(aiQueue)
			int entry = qDelete(aiQueue)
			Form the_form
			bool equip = Math.LogicalAnd(entry, equip_action)
			if equip
				entry -= equip_action
				the_form = Game.GetForm(entry)
				debug.trace("the_form " + the_form)
				GetClothingSystem().ObjectEquipped(the_form)
			else
				entry -= unequip_action
				the_form = Game.GetForm(entry)
				GetClothingSystem().ObjectUnequipped(the_form)
			endif
		endWhile
		processing_queue = false
	else
		debug.trace(" !!!! Event queue already being processed, aborting.")
	endif
endFunction

function AddEquipEventToQueue(int[] aiQueue, Form akEntry, bool abEquipped)
	debug.trace(" +++++++ adding to queue " + akEntry + " equipped " + abEquipped)
	
	if !akEntry
		return
	endif

	int entry = akEntry.GetFormID()
	entry %= 16777216
	if abEquipped
		entry += equip_action
	else
		entry += unequip_action
	endif
	bool b = qEnter(aiQueue, entry)
endFunction

bool function qEnter(int[] aiQueue, int aiEntry)
	; Add an entry to the event queue to process FIFO. The 0xN00000000 digit
	; stores the action (2 = equipped, 1 = unequipped), the other digits store
	; the FormID. The leading digit is stripped by the function processing 
	; the queue entry.
	; Adapted from https://www.cs.bu.edu/teaching/c/queue/array/funcs.html

	int newEntryIdx

	if qIsFull(aiQueue)
		; print error
		return false
	endif

	newEntryIdx = (queue_frontidx + queue_count) % aiQueue.Length
	aiQueue[newEntryIdx] = aiEntry
	queue_count += 1
	debug.trace(" +++++++ queue enter " + aiEntry + " queue_count " + queue_count)
	return true
endFunction

int function qDelete(int[] aiQueue)
	; Remove an entry from the queue and return it.
	; Adapted from https://www.cs.bu.edu/teaching/c/queue/array/funcs.html

	int oldElement

	if queue_count <= 0
		; print error
		return -1
	endif

	; Save the element so we can return it.
	oldElement = aiQueue[queue_frontidx]

	; Advance the index of the front,
	; making sure it wraps around the
	; array properly.

	queue_frontidx += 1
	queue_frontidx %= aiQueue.Length

	queue_count -= 1
	debug.trace(" ------- queue delete " + oldElement + " queue_count " + queue_count)

	return oldElement
endFunction

bool function qIsFull(int[] aiQueue)
	; Return if the queue is full or not.

	if queue_count >= aiQueue.Length
		return true
	else
		return false
	endif
endFunction

bool function qIsEmpty(int[] aiQueue)
	if queue_count <= 0
		return true
	else
		return false
	endif
endFunction