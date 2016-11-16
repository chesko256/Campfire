scriptname _Frost_PlayerEquipMonitor extends ReferenceAlias

import CampUtil
import FrostUtil
import _FrostInternal

Quest property _Frost_MainQuest auto
Keyword property _FrostData_ArmorPrecache auto

Message property _Frost_Help_Warmth auto
Message property _Frost_Help_Warmth2 auto
GlobalVariable property _Frost_Setting_DisplayTutorials auto
GlobalVariable property _Frost_HelpDone_Warmth auto

Event OnRaceSwitchComplete()
    if IsPlayerTransformed()
        FrostDebug(1, "I am now a werewolf or vampire lord.")
        ModPlayerExposure(-120.0, 0.0)
        (_Frost_MainQuest as _Frost_ConditionValues).IsBeast = true
        SendEvent_UpdateWarmth(false)
    else
        FrostDebug(1, "I am now not a werewolf or vampire lord.")
        (_Frost_MainQuest as _Frost_ConditionValues).IsBeast = false
        SendEvent_UpdateWarmth(false)
    endif
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	TryToAddArmorToPrecache(akBaseItem, _FrostData_ArmorPrecache)
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth(false)
	elseif akBaseObject as Armor
		ShowProtectionTutorial()
		bool b = qEnter(form_queue, action_queue, akBaseObject, true)
		ProcessQueuedEvents(form_queue, action_queue)
	endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Light
		SendEvent_UpdateWarmth(false)
	elseif akBaseObject as Armor
		bool b = qEnter(form_queue, action_queue, akBaseObject, false)
		ProcessQueuedEvents(form_queue, action_queue)
	endif
EndEvent

function SendEvent_UpdateWarmth(bool abDisplayTextUpdate)
	FrostDebug(0, "Sending event Frost_UpdateWarmth")
	FallbackEventEmitter emitter = GetEventEmitter_UpdateWarmth()
    int handle = emitter.Create("Frost_UpdateWarmth")
    if handle
    	emitter.PushBool(handle, abDisplayTextUpdate)
        emitter.Send(handle)
    endif
endFunction



; Event Queue =================================================================

bool property processing_queue = false auto hidden
int property queue_count = 0 auto hidden
int queue_frontidx
Form[] form_queue
int[] action_queue
int EQUIP_ACTION = 2
int UNEQUIP_ACTION = 1
form next_form = None
int next_action = -1

function InitializeEventQueue()
	form_queue = new Form[128]
	action_queue = new int[128]
endFunction

function ProcessQueuedEvents(Form[] akFormQueue, int[] aiActionQueue, bool aiRecursiveCall = false)
	; debug.trace("ProcessQueuedEvents processing_queue " + processing_queue + " aiRecursiveCall " + aiRecursiveCall)
	if !processing_queue || aiRecursiveCall == true
		processing_queue = true
		bool update_required = false
		_Frost_ClothingSystem clothing = GetClothingSystem()
		; debug.trace(">>>>>>> Processing queued events.")
		while !qIsEmpty()
			qDelete(akFormQueue, aiActionQueue)

			if next_action == -1
				return
			endif

			bool result = false
			if next_action == EQUIP_ACTION
				result = clothing.ObjectEquipped(next_form)
			else
				result = clothing.ObjectUnequipped(next_form)
			endif
			if result == true
				update_required = true
			endif
		endWhile

		if update_required
        	clothing.RecalculateProtectionData(clothing.WornGearMainForms, clothing.WornGearForms, clothing.WornGearValues, clothing._Frost_WornGearData)
        	clothing.SendEvent_UpdateWarmthAndCoverage(true)
    	endif

    	; Did another event sneak in?
    	if queue_count > 0
    		ProcessQueuedEvents(akFormQueue, aiActionQueue, true)
    	endif
    	processing_queue = false
		; debug.trace("<<<<<<< Finished processing queue.")
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
	; debug.trace("newEntryIdx = " + newEntryIdx)
	akFormQueue[newEntryIdx] = akEntry

	if abAction
		action_val = EQUIP_ACTION
	else
		action_val = UNEQUIP_ACTION
	endif

	aiActionQueue[newEntryIdx] = action_val

	queue_count += 1
	; debug.trace(" +++++++ queue enter " + akEntry + " " + action_val + " queue_count " + queue_count)
	return true
endFunction

function qDelete(Form[] akFormQueue, int[] aiActionQueue)
	; Remove an entry from the queue and return it.
	; Adapted from https://www.cs.bu.edu/teaching/c/queue/array/funcs.html

	;int[] oldElements = new int[2]
	next_form = None
	next_action = -1

	if queue_count <= 0
		; print error
		;oldElements[0] = -1
		;oldElements[1] = -1
		return
	endif

	; Save the element so we can return it.
	;oldElements[0] = akFormQueue[queue_frontidx]
	; debug.trace("oldElements[0] base = " + akFormQueue[queue_frontidx])
	; debug.trace("oldElements[0] = " + oldElements[0])
	; debug.trace("oldElements[0] one's complement = " + Math.LogicalNot(Math.LogicalNot(oldElements[0])))
	next_form = akFormQueue[queue_frontidx]
	next_action = aiActionQueue[queue_frontidx]
	; oldElements[1] = aiActionQueue[queue_frontidx]

	; Advance the index of the front,
	; making sure it wraps around the
	; array properly.

	queue_frontidx += 1
	queue_frontidx %= akFormQueue.Length

	queue_count -= 1
	; debug.trace(" ------- queue delete " + next_form + " " + next_action + " queue_count " + queue_count)

	; return oldElements
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


function ShowProtectionTutorial()
	if _Frost_Setting_DisplayTutorials.GetValueInt() == 2 && Utility.IsInMenuMode() && _Frost_HelpDone_Warmth.GetValueInt() == 1
		_Frost_Help_Warmth.Show()
		_Frost_Help_Warmth2.Show()
		_Frost_HelpDone_Warmth.SetValue(2)
	endif
endFunction