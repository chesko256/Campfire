scriptname _Frost_PlayerEquipMonitor extends ReferenceAlias

import FrostUtil

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	elseif akBaseObject as Armor
		AddEquipEventToQueue(event_queue, akBaseObject, true)
		ProcessQueue()
		;GetClothingSystem().ObjectEquipped(akBaseObject)
	endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	elseif akBaseObject as Armor
		AddEquipEventToQueue(event_queue, akBaseObject, false)
		ProcessQueue()
		;GetClothingSystem().ObjectUnequipped(akBaseObject)
	endif
EndEvent

function SendEvent_UpdateWarmth()
	_FrostInternal.FrostDebug(0, "Sending event Frost_UpdateWarmth")
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

function AddEquipEventToQueue(int[] aiQueue, Form akEntry, bool abEquipped)
	int entry = akEntry.GetFormID()
	if abEquipped
		entry += 0x200000000
	else
		entry += 0x100000000
	endif
	bool b = qEnter(aiQueue, entry)
endFunction

function ProcessQueue()
	if !processing_queue
		;Zhu Li, do the thing!
		processing_queue = false
	endif
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
	return true
endFunction

function qDelete(int[] aiQueue, int aiEntryToDelete)
	; Remove an entry from the queue and return it.

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