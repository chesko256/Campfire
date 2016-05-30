scriptname _Frost_PlayerEquipMonitor extends ReferenceAlias

import FrostUtil
import _FrostInternal

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	elseif akBaseObject as Armor
		bool b = qEnter(form_queue, action_queue, akBaseObject, true)
		ProcessQueuedEvents(form_queue, action_queue)
	endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth()
	elseif akBaseObject as Armor
		bool b = qEnter(form_queue, action_queue, akBaseObject, false)
		ProcessQueuedEvents(form_queue, action_queue)
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
Form[] form_queue
int[] action_queue
int EQUIP_ACTION = 2
int UNEQUIP_ACTION = 1

function InitializeEventQueue()
	form_queue = new Form[128]
	action_queue = new int[128]
endFunction

function ProcessQueuedEvents(Form[] akFormQueue, int[] aiActionQueue)
	if !processing_queue
		processing_queue = true
		debug.trace("Processing queued events.")
		while !qIsEmpty()
			int[] entry = qDelete(akFormQueue, aiActionQueue)
			
			if entry[0] == -1
				return
			endif

			Form the_form = Game.GetForm(entry[0])
			if entry[1] == EQUIP_ACTION
				GetClothingSystem().ObjectEquipped(the_form)
			else
				GetClothingSystem().ObjectUnequipped(the_form)
			endif
		endWhile
		processing_queue = false
	else
		debug.trace(" !!!! Event queue already being processed, aborting.")
	endif
endFunction

function AddEquipEventToQueue(Form[] akFormQueue, int[] aiActionQueue, Form akEntry, bool abEquipped)
	debug.trace(" +++++++ adding to queue " + akEntry + " equipped " + abEquipped)
	
	if !akEntry
		return
	endif

	
endFunction

bool function qEnter(Form[] akFormQueue, int[] aiActionQueue, Form akEntry, bool abAction)
	; Add an entry to the event queue to process FIFO. The aiActionQueue
	; stores the action (2 = equipped, 1 = unequipped), the akFormQueue stores the Form.
	; Adapted from https://www.cs.bu.edu/teaching/c/queue/array/funcs.html

	int newEntryIdx
	int action_val = 0

	if !akEntry
		return false
	endif

	if qIsFull(akFormQueue)
		; print error
		return false
	endif

	newEntryIdx = (queue_frontidx + queue_count) % akFormQueue.Length
	akFormQueue[newEntryIdx] = akEntry

	if abAction
		action_val = EQUIP_ACTION
	else
		action_val = UNEQUIP_ACTION
	endif

	aiActionQueue[newEntryIdx] = action_val

	queue_count += 1
	debug.trace(" +++++++ queue enter " + akEntry + " queue_count " + queue_count)
	return true
endFunction

int[] function qDelete(Form[] akFormQueue, int[] aiActionQueue)
	; Remove an entry from the queue and return it.
	; Adapted from https://www.cs.bu.edu/teaching/c/queue/array/funcs.html

	int[] oldElements = new int[2]

	if queue_count <= 0
		; print error
		oldElements[0] = -1
		oldElements[1] = -1
		return oldElements
	endif

	; Save the element so we can return it.
	oldElements[0] = akFormQueue[queue_frontidx].GetFormID()
	oldElements[1] = aiActionQueue[queue_frontidx]

	; Advance the index of the front,
	; making sure it wraps around the
	; array properly.

	queue_frontidx += 1
	queue_frontidx %= akFormQueue.Length

	queue_count -= 1
	debug.trace(" ------- queue delete " + oldElements[0] + " " + oldElements[1] + " queue_count " + queue_count)

	return oldElements
endFunction

bool function qIsFull(Form[] akQueue)
	; Return if the queue is full or not.

	if queue_count >= akQueue.Length
		return true
	else
		return false
	endif
endFunction

bool function qIsEmpty()
	if queue_count <= 0
		return true
	else
		return false
	endif
endFunction