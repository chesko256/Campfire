scriptname _Camp_ObjectPlacementThreadManager extends Quest
 
Quest property CampfireObjectPlacementSystem auto
Activator property _Camp_ObjectPlacementFutureActivator auto
ObjectReference property _Camp_ObjectPlacementFutureAnchor auto

Static property XMarker auto

int property thread_limit = 10 auto hidden

_Camp_ObjectPlacementThread01 thread01
_Camp_ObjectPlacementThread02 thread02
_Camp_ObjectPlacementThread03 thread03
_Camp_ObjectPlacementThread04 thread04
_Camp_ObjectPlacementThread05 thread05
_Camp_ObjectPlacementThread06 thread06
_Camp_ObjectPlacementThread07 thread07
_Camp_ObjectPlacementThread08 thread08
_Camp_ObjectPlacementThread09 thread09
_Camp_ObjectPlacementThread10 thread10
_Camp_ObjectPlacementThread11 thread11
_Camp_ObjectPlacementThread12 thread12
_Camp_ObjectPlacementThread13 thread13
_Camp_ObjectPlacementThread14 thread14
_Camp_ObjectPlacementThread15 thread15
_Camp_ObjectPlacementThread16 thread16
_Camp_ObjectPlacementThread17 thread17
_Camp_ObjectPlacementThread18 thread18
_Camp_ObjectPlacementThread19 thread19
_Camp_ObjectPlacementThread20 thread20
_Camp_ObjectPlacementThread21 thread21
_Camp_ObjectPlacementThread22 thread22
_Camp_ObjectPlacementThread23 thread23
_Camp_ObjectPlacementThread24 thread24
_Camp_ObjectPlacementThread25 thread25
_Camp_ObjectPlacementThread26 thread26
_Camp_ObjectPlacementThread27 thread27
_Camp_ObjectPlacementThread28 thread28
_Camp_ObjectPlacementThread29 thread29
_Camp_ObjectPlacementThread30 thread30
 
Event OnInit()
    ;Register for the event that will start all threads
    ;NOTE - This needs to be re-registered once per load! Use an alias and OnPlayerLoadGame() in a real implementation.
    RegisterForModEvent("Campfire_OnObjectPlacementStart", "OnObjectPlacementStart")

    ;Let's cast our threads to local variables so things are less cluttered in our code
    thread01 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread01
    thread02 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread02
    thread03 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread03
    thread04 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread04
    thread05 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread05
    thread06 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread06
    thread07 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread07
    thread08 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread08
    thread09 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread09
    thread10 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread10
    thread11 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread11
    thread12 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread12
    thread13 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread13
    thread14 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread14
    thread15 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread15
    thread16 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread16
    thread17 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread17
    thread18 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread18
    thread19 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread19
    thread20 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread20
    thread21 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread21
    thread22 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread22
    thread23 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread23
    thread24 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread24
    thread25 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread25
    thread26 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread26
    thread27 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread27
    thread28 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread28
    thread29 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread29
    thread30 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread30
EndEvent
 
;The 'public-facing' function that our MagicEffect script will interact with.
ObjectReference function PlaceTentObjectAsync(ObjectReference tent_object, Form form_to_place,                                  \
                              ObjectReference object_position_reference,                                                        \
                              float x_local_ang_adjust = 0.0, float y_local_ang_adjust = 0.0, float z_local_ang_adjust = 0.0,   \
                              float z_global_ang_adjust = 0.0, float z_hanging_offset = 0.0, bool inverted_local_y = false,     \
                              bool initially_disabled = false, bool is_propped = false, bool is_hanging = false)
    int i = 0
	ObjectReference future
    
    float[] origin_angle = (tent_object as CampTent).OriginAng
    ObjectReference center_object = (tent_object as CampTent).CenterObject
    ObjectReference origin = tent_object

	while !future
		if !thread01.queued() && thread_limit >= 1
            future = thread01.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
		elseif !thread02.queued() && thread_limit >= 2
			future = thread02.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread03.queued() && thread_limit >= 3
            future = thread03.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread04.queued() && thread_limit >= 4
            future = thread04.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread05.queued() && thread_limit >= 5
            future = thread05.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread06.queued() && thread_limit >= 6
            future = thread06.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread07.queued() && thread_limit >= 7
            future = thread07.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread08.queued() && thread_limit >= 8
            future = thread08.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
		elseif !thread09.queued() && thread_limit >= 9
            future = thread09.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
		elseif !thread10.queued() && thread_limit >= 10
            future = thread10.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread11.queued() && thread_limit >= 11
            future = thread11.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread12.queued() && thread_limit >= 12
            future = thread12.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread13.queued() && thread_limit >= 13
            future = thread13.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread14.queued() && thread_limit >= 14
            future = thread14.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread15.queued() && thread_limit >= 15
            future = thread15.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread16.queued() && thread_limit >= 16
            future = thread16.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread17.queued() && thread_limit >= 17
            future = thread17.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread18.queued() && thread_limit >= 18
            future = thread18.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread19.queued() && thread_limit >= 19
            future = thread19.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread20.queued() && thread_limit >= 20
            future = thread20.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread21.queued() && thread_limit >= 21
            future = thread21.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread22.queued() && thread_limit >= 22
            future = thread22.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread23.queued() && thread_limit >= 23
            future = thread23.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread24.queued() && thread_limit >= 24
            future = thread24.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread25.queued() && thread_limit >= 25
            future = thread25.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread26.queued() && thread_limit >= 26
            future = thread26.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread27.queued() && thread_limit >= 27
            future = thread27.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread28.queued() && thread_limit >= 28
            future = thread28.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread29.queued() && thread_limit >= 29
            future = thread29.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
        elseif !thread30.queued() && thread_limit >= 30
            future = thread30.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        initially_disabled, is_propped, is_hanging)
		else
			;All threads are queued; start all threads, wait, and try again.
            wait_all()
		endif
	endWhile
 
	return future
endFunction
 
function wait_all()
    RaiseEvent_OnObjectPlacementStart()
    begin_waiting()
endFunction

function begin_waiting()
    bool waiting = true
    int i = 0
    while waiting
        if thread01.queued() || thread02.queued() || thread03.queued() || thread04.queued() || thread05.queued() || \
           thread06.queued() || thread07.queued() || thread08.queued() || thread09.queued() || thread10.queued() || \ 
           thread11.queued() || thread12.queued() || thread13.queued() || thread14.queued() || thread15.queued() || \ 
           thread16.queued() || thread17.queued() || thread18.queued() || thread19.queued() || thread20.queued() || \
           thread21.queued() || thread22.queued() || thread23.queued() || thread24.queued() || thread25.queued() || \
           thread26.queued() || thread27.queued() || thread28.queued() || thread29.queued() || thread30.queued()
            i += 1
            Utility.wait(0.1)
            if i >= 100
                debug.trace("Error: A catastrophic error has occurred. All threads have become unresponsive. Please debug this issue or notify the author.")
                i = 0
                ;Fail by returning None. The mod needs to be fixed.
                return
            endif
        else
            waiting = false
        endif
    endWhile
endFunction

;A helper function that can avert permanent thread failure if something goes wrong
function TryToUnlockThread(ObjectReference akFuture)
    bool success = false
    if thread01.has_future(akFuture)
        success = thread01.force_unlock()
    elseif thread02.has_future(akFuture)
        success = thread02.force_unlock()
    elseif thread03.has_future(akFuture)
        success = thread03.force_unlock()
    elseif thread04.has_future(akFuture)
        success = thread04.force_unlock()
    elseif thread05.has_future(akFuture)
        success = thread05.force_unlock()
    elseif thread06.has_future(akFuture)
        success = thread06.force_unlock()
    elseif thread07.has_future(akFuture)
        success = thread07.force_unlock()
    elseif thread08.has_future(akFuture)
        success = thread08.force_unlock()
    elseif thread09.has_future(akFuture)
        success = thread09.force_unlock()
    elseif thread10.has_future(akFuture)
        success = thread10.force_unlock()
    elseif thread11.has_future(akFuture)
        success = thread11.force_unlock()
    elseif thread12.has_future(akFuture)
        success = thread12.force_unlock()
    elseif thread13.has_future(akFuture)
        success = thread13.force_unlock()
    elseif thread14.has_future(akFuture)
        success = thread14.force_unlock()
    elseif thread15.has_future(akFuture)
        success = thread15.force_unlock()
    elseif thread16.has_future(akFuture)
        success = thread16.force_unlock()
    elseif thread17.has_future(akFuture)
        success = thread17.force_unlock()
    elseif thread18.has_future(akFuture)
        success = thread18.force_unlock()
    elseif thread19.has_future(akFuture)
        success = thread19.force_unlock()
    elseif thread20.has_future(akFuture)
        success = thread20.force_unlock()
    elseif thread21.has_future(akFuture)
        success = thread21.force_unlock()
    elseif thread22.has_future(akFuture)
        success = thread22.force_unlock()
    elseif thread23.has_future(akFuture)
        success = thread23.force_unlock()
    elseif thread24.has_future(akFuture)
        success = thread24.force_unlock()
    elseif thread25.has_future(akFuture)
        success = thread25.force_unlock()
    elseif thread26.has_future(akFuture)
        success = thread26.force_unlock()
    elseif thread27.has_future(akFuture)
        success = thread27.force_unlock()
    elseif thread28.has_future(akFuture)
        success = thread28.force_unlock()
    elseif thread29.has_future(akFuture)
        success = thread29.force_unlock()
    elseif thread30.has_future(akFuture)
        success = thread30.force_unlock()
    endif
 
    if !success
        debug.trace("Error: A thread has encountered an error and has become unresponsive.")
    else
        debug.trace("Warning: An unresponsive thread was successfully unlocked.")
    endif
endFunction

function RaiseEvent_OnObjectPlacementStart()
    ;trace("[Campfire] Raising Event: RaiseEvent_OnThreadedPlacement()")

    int handle = ModEvent.Create("Campfire_OnObjectPlacementStart")
    if handle
        ModEvent.Send(handle)
    else
        ;pass
    endif
endFunction