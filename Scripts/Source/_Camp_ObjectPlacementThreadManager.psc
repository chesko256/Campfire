scriptname _Camp_ObjectPlacementThreadManager extends Quest

import math
import CampUtil
import _CampInternal

bool property locked = false auto hidden

_Camp_Compatibility property Compatibility auto

;Object Placement
Quest property CampfireObjectPlacementSystem auto
Activator property _Camp_ObjectPlacementFutureActivator auto
ObjectReference property _Camp_ObjectPlacementFutureAnchor auto
GlobalVariable property _Camp_Setting_MaxThreads auto
GlobalVariable property _Camp_LastPlacementHeightOffset auto

;Fire
Form property SmallFire auto hidden
Activator property _Camp_LargeFire auto
Activator property _Camp_LargeFireSmoke auto
Activator property _Camp_ObjectRubbleFire auto
Explosion property _Camp_CollapseFireball auto
Explosion property FallingDustExplosion01 auto
EffectShader property _Camp_BurnEffect auto

;Placement Indicator
_Camp_LegalAreaCheck property Legal auto
Actor property PlayerRef auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto
GlobalVariable property _Camp_HelpDone_PlacementError auto
GlobalVariable property _Camp_Setting_AdvancedPlacement auto
ObjectReference property _Camp_Anchor auto
ObjectReference property _Camp_IndicatorFutureRefA auto
ObjectReference property _Camp_IndicatorFutureRefB auto
ObjectReference property _Camp_IndicatorFutureRefC auto
ObjectReference property _Camp_IndicatorTriggerRef auto
ObjectReference property _Camp_ZTestShooterREF_A auto
ObjectReference property _Camp_ZTestShooterREF_B auto
ObjectReference property _Camp_ZTestShooterREF_C auto
ObjectReference property _Camp_ZTestReceiverREF_A auto
ObjectReference property _Camp_ZTestReceiverREF_B auto
ObjectReference property _Camp_ZTestReceiverREF_C auto
EffectShader property _Camp_VisPlacement auto
EffectShader property _Camp_VisError auto
Message property _Camp_Placement_Cancelled auto
Message property _Camp_Placement_Cancelled_CollisionBug auto
Message property _Camp_PlacementIllegal auto
Message property _Camp_IndicatorSelect auto
Message property _Camp_PlaceObjectError_Perk auto
Message property _Camp_PlaceObjectError_Item auto

;Crime
Quest property _Camp_CampingCrimeTracking auto
ReferenceAlias property IllegalItem1 auto
ReferenceAlias property IllegalItem2 auto
ReferenceAlias property IllegalItem3 auto

;Misc
Static property XMarker auto

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

_Camp_ObjectPlacementIndicatorThread01 PlacementIndicatorThread1
_Camp_ObjectPlacementIndicatorThread02 PlacementIndicatorThread2
_Camp_ObjectPlacementIndicatorThread03 PlacementIndicatorThread3

; Placement Cancellation Reason Enum
int STOPPLACEMENT_UNKNOWN                       = -1
int STOPPLACEMENT_CANT_PLACE_OBJECTS            = 0
int STOPPLACEMENT_CATASTROPHIC_ERROR            = 1
int STOPPLACEMENT_NO_INGREDIENTS                = 2
int STOPPLACEMENT_NO_ITEMS                      = 3
int STOPPLACEMENT_SUCCESS                       = 4
int STOPPLACEMENT_SUCCESS_ILLEGAL               = 5
int STOPPLACEMENT_USER_CANCELLED                = 6
 
Event OnInit()
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

    PlacementIndicatorThread1 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementIndicatorThread01
    PlacementIndicatorThread2 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementIndicatorThread02
    PlacementIndicatorThread3 = CampfireObjectPlacementSystem as _Camp_ObjectPlacementIndicatorThread03
EndEvent

function RequestLock(ObjectReference akObject)
    int i = 0
    while locked && i < 30
        CampDebug(1, akObject + ": Waiting until placement system available. (Timeout in " + (30 - i) + ")")
        Utility.Wait(1)
        i += 1
    endWhile
    if i >= 30
        CampDebug(3, akObject + ": Timed out waiting for placement system lock. Continuing anyway.")
    endif
    CampDebug(1, akObject + ": Placement system lock granted.")
    locked = true
endFunction

function ReleaseLock(ObjectReference akObject)
    Utility.Wait(0.5)
    CampDebug(1, akObject + ": Placement system lock released.")
    locked = false
endFunction

ObjectReference function PlaceObject(ObjectReference origin_object, Form form_to_place,                                         \
                              ObjectReference object_position_reference,                                                        \
                              float x_local_ang_adjust = 0.0, float y_local_ang_adjust = 0.0, float z_local_ang_adjust = 0.0,   \
                              float z_global_ang_adjust = 0.0, float z_hanging_offset = 0.0, bool inverted_local_y = false,     \
                              float x_pos_offset = 0.0, float y_pos_offset = 0.0, float z_pos_offset = 0.0,                     \
                              bool initially_disabled = false, bool is_propped = false, bool is_hanging = false,                \
                              bool is_temp = false, bool is_interaction_disabled = false)

	ObjectReference future

    float[] origin_angle = (origin_object as _Camp_PlaceableObjectBase).OriginAng
    ObjectReference center_object = (origin_object as _Camp_PlaceableObjectBase).CenterObject
    ObjectReference origin = origin_object

    int thread_limit = _Camp_Setting_MaxThreads.GetValueInt()
	while !future
        CampDebug(0, "Checking threads for placement of " + form_to_place)
		if !thread01.queued() && thread_limit >= 1
            CampDebug(0, "Queuing thread 01")
            future = thread01.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
		elseif !thread02.queued() && thread_limit >= 2
            CampDebug(0, "Queuing thread 02")
			future = thread02.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread03.queued() && thread_limit >= 3
            CampDebug(0, "Queuing thread 03")
            future = thread03.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread04.queued() && thread_limit >= 4
            CampDebug(0, "Queuing thread 04")
            future = thread04.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread05.queued() && thread_limit >= 5
            CampDebug(0, "Queuing thread 05")
            future = thread05.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread06.queued() && thread_limit >= 6
            CampDebug(0, "Queuing thread 06")
            future = thread06.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread07.queued() && thread_limit >= 7
            CampDebug(0, "Queuing thread 07")
            future = thread07.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread08.queued() && thread_limit >= 8
            CampDebug(0, "Queuing thread 08")
            future = thread08.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
		elseif !thread09.queued() && thread_limit >= 9
            CampDebug(0, "Queuing thread 09")
            future = thread09.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
		elseif !thread10.queued() && thread_limit >= 10
            CampDebug(0, "Queuing thread 10")
            future = thread10.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread11.queued() && thread_limit >= 11
            CampDebug(0, "Queuing thread 11")
            future = thread11.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread12.queued() && thread_limit >= 12
            CampDebug(0, "Queuing thread 12")
            future = thread12.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread13.queued() && thread_limit >= 13
            CampDebug(0, "Queuing thread 13")
            future = thread13.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread14.queued() && thread_limit >= 14
            CampDebug(0, "Queuing thread 14")
            future = thread14.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread15.queued() && thread_limit >= 15
            CampDebug(0, "Queuing thread 15")
            future = thread15.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread16.queued() && thread_limit >= 16
            CampDebug(0, "Queuing thread 16")
            future = thread16.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread17.queued() && thread_limit >= 17
            CampDebug(0, "Queuing thread 17")
            future = thread17.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread18.queued() && thread_limit >= 18
            CampDebug(0, "Queuing thread 18")
            future = thread18.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread19.queued() && thread_limit >= 19
            CampDebug(0, "Queuing thread 19")
            future = thread19.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread20.queued() && thread_limit >= 20
            CampDebug(0, "Queuing thread 20")
            future = thread20.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread21.queued() && thread_limit >= 21
            CampDebug(0, "Queuing thread 21")
            future = thread21.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread22.queued() && thread_limit >= 22
            CampDebug(0, "Queuing thread 22")
            future = thread22.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread23.queued() && thread_limit >= 23
            CampDebug(0, "Queuing thread 23")
            future = thread23.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread24.queued() && thread_limit >= 24
            CampDebug(0, "Queuing thread 24")
            future = thread24.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread25.queued() && thread_limit >= 25
            CampDebug(0, "Queuing thread 25")
            future = thread25.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread26.queued() && thread_limit >= 26
            CampDebug(0, "Queuing thread 26")
            future = thread26.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread27.queued() && thread_limit >= 27
            CampDebug(0, "Queuing thread 27")
            future = thread27.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread28.queued() && thread_limit >= 28
            CampDebug(0, "Queuing thread 28")
            future = thread28.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread29.queued() && thread_limit >= 29
            CampDebug(0, "Queuing thread 29")
            future = thread29.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
        elseif !thread30.queued() && thread_limit >= 30
            CampDebug(0, "Queuing thread 30")
            future = thread30.get_async(_Camp_ObjectPlacementFutureActivator, _Camp_ObjectPlacementFutureAnchor,    \
                                        XMarker, center_object, object_position_reference,      \
                                        origin, form_to_place, origin_angle,                    \
                                        x_local_ang_adjust, y_local_ang_adjust,                 \
                                        z_local_ang_adjust, z_global_ang_adjust,                \
                                        z_hanging_offset, inverted_local_y,                     \
                                        x_pos_offset, y_pos_offset, z_pos_offset,               \
                                        initially_disabled, is_propped, is_hanging, is_temp,    \
                                        is_interaction_disabled)
		else
			;All threads are queued; start all threads, wait, and try again.
            CampDebug(0, "wait_all start")
            wait_all()
		endif
	endWhile
	return future
endFunction

function StartPlacement(ObjectReference akIndicator)
    CampDebug(1, "Starting object placement using indicator " + akIndicator)
    ; Block inventory menu access
    Game.DisablePlayerControls(false, false, false, false, false, true, false, false)
    was_hit = false
    akIndicator.SetAngle(0.0, 0.0, 0.0)
    _Camp_CurrentlyPlacingObject.SetValueInt(2)
    if _Camp_Setting_AdvancedPlacement.GetValueInt() == 2
        _Camp_IndicatorTriggerRef.MoveTo(PlayerRef)
    endif
endFunction

function StopPlacement(int aiReason = -1)
    string reason
    if aiReason == STOPPLACEMENT_UNKNOWN
        reason = "Unknown reason."
    elseif aiReason == STOPPLACEMENT_CANT_PLACE_OBJECTS
        reason = "Player can't place objects or was hit recently."
    elseif aiReason == STOPPLACEMENT_SUCCESS
        reason = "Player successfully placed object."
    elseif aiReason == STOPPLACEMENT_SUCCESS_ILLEGAL
        reason = "Player successfully placed object (illegally)."
    elseif aiReason == STOPPLACEMENT_USER_CANCELLED
        reason = "Player cancelled placement."
    elseif aiReason == STOPPLACEMENT_NO_INGREDIENTS
        reason = "Player lacks required ingredients."
    elseif aiReason == STOPPLACEMENT_NO_ITEMS
        reason = "Player lacks required items."
    elseif aiReason == STOPPLACEMENT_CATASTROPHIC_ERROR
        reason = "The catastrophic placement error occurred."
    endif

    CampDebug(1, "Stopping object placement. Reason: " + reason)
    Game.EnablePlayerControls()
    _Camp_CurrentlyPlacingObject.SetValueInt(1)
    _Camp_IndicatorTriggerRef.MoveTo(_Camp_Anchor)
    _Camp_ZTestShooterREF_A.MoveTo(_Camp_Anchor)
    _Camp_ZTestShooterREF_B.MoveTo(_Camp_Anchor)
    _Camp_ZTestShooterREF_C.MoveTo(_Camp_Anchor)
    _Camp_ZTestReceiverREF_A.MoveTo(_Camp_Anchor)
    _Camp_ZTestReceiverREF_B.MoveTo(_Camp_Anchor)
    _Camp_ZTestReceiverREF_C.MoveTo(_Camp_Anchor)
endFunction

bool was_hit = false
function PlayerHitEvent(ObjectReference akAggressor, Form akSource, Projectile akProjectile)
    if akSource as Spell
        if (akSource as Spell).IsHostile()
            was_hit = true
        else
            was_hit = false
        endif
    else
        was_hit = true
    endif
endFunction

bool function UpdateIndicator(ObjectReference akIndicator, Form akFormToPlace,  \
                              MiscObject akInventoryItem,                       \
                              Float afDistance, Float afHeightOffset,           \
                              Float afRotationOffset, Bool abSnapToTerrain,     \
                              Ingredient akIngredient, MiscObject akMiscItem,   \
                              int aiCost)
    if !PlayerCanPlaceObjects(abPlayerBusyCheck = false) || was_hit
        was_hit = false
        StopPlacement(STOPPLACEMENT_CANT_PLACE_OBJECTS)
        return false
    endif
    
    ;Scenario: The catastrophic placement error was encountered.
    if _Camp_CurrentlyPlacingObject.GetValueInt() == 3 && _Camp_HelpDone_PlacementError.GetValueInt() == 1
        StopPlacement(STOPPLACEMENT_CATASTROPHIC_ERROR)
        if _Camp_HelpDone_PlacementError.GetValue() == 1
            int i = _Camp_Placement_Cancelled_CollisionBug.Show()
            if i == 0
                ;Yes
                _Camp_Setting_AdvancedPlacement.SetValue(1)
            elseif i == 1
                ;No
            elseif i == 2
                ;No - Don't ask again
                _Camp_HelpDone_PlacementError.SetValue(2)
            endif
        endif
        _Camp_Placement_Cancelled.Show()
        return false

    ;Scenario: placing object (advanced)
    elseif _Camp_CurrentlyPlacingObject.GetValueInt() == 2 && _Camp_Setting_AdvancedPlacement.GetValueInt() == 2
        UpdateIndicatorPosition(akIndicator, afDistance, afHeightOffset, afRotationOffset, abSnapToTerrain)
        ;@TODO: Handle "heat link" feature
        ;Update placement indicator shader
        if !LegalToCampHere() && IsCrimeToPlaceInTowns(akFormToPlace)
            _Camp_VisPlacement.Stop(akIndicator)
            _Camp_VisError.Play(akIndicator)
        else
            _Camp_VisError.Stop(akIndicator)
            _Camp_VisPlacement.Play(akIndicator)
        endif
        return true
    
    ;Scenario: placing object (simple)
    elseif _Camp_CurrentlyPlacingObject.GetValueInt() == 2 && _Camp_Setting_AdvancedPlacement.GetValueInt() == 1
        UpdateIndicatorPositionSimple(akIndicator, afDistance, afHeightOffset, afRotationOffset)
        if !LegalToCampHere() && IsCrimeToPlaceInTowns(akFormToPlace)
            _Camp_VisPlacement.Stop(akIndicator)
            _Camp_VisError.Play(akIndicator)
        else
            _Camp_VisError.Stop(akIndicator)
            _Camp_VisPlacement.Play(akIndicator)
        endif
        _Camp_CurrentlyPlacingObject.SetValueInt(1)
        return true

    ;Scenario: Player activated the placement indicator
    else
        CampDebug(0, "LegalToCampHere: " + LegalToCampHere())
        CampDebug(0, "IsCrimeToPlaceInTowns: " + IsCrimeToPlaceInTowns(akFormToPlace))

        _Camp_LastPlacementHeightOffset.SetValue(afHeightOffset)

        if !LegalToCampHere() && IsCrimeToPlaceInTowns(akFormToPlace)
            int ibutton = _Camp_PlacementIllegal.Show()
            if ibutton == 0
                ;Place it anyway
                if akIngredient && aiCost > 0
                    if PlayerRef.GetItemCount(akIngredient) >= aiCost
                        PlayerRef.RemoveItem(akIngredient, aiCost)
                    else
                        StopPlacement(STOPPLACEMENT_NO_INGREDIENTS)
                        return false
                    endif
                elseif akMiscItem && aiCost > 0
                    if PlayerRef.GetItemCount(akMiscItem) >= aiCost
                        PlayerRef.RemoveItem(akMiscItem, aiCost)
                    else
                        StopPlacement(STOPPLACEMENT_NO_ITEMS)
                        return false
                    endif
                endif

                akIndicator.Disable()
                ObjectReference campitem = akIndicator.PlaceAtMe(akFormToPlace, abForcePersist = !(IsPlaceableObjectTemporary(akFormToPlace)))
                
                ; Raise optional SKSE event
                SendEvent_OnObjectPlaced(campitem)

                if akInventoryItem
                    (campitem as _Camp_PlaceableObjectBase).Required_InventoryItem = akInventoryItem
                    PlayerRef.RemoveItem(akInventoryItem, 1, true)
                endif
                StopPlacement(STOPPLACEMENT_SUCCESS_ILLEGAL)

                ;Raise the ire of those around you
                _Camp_CampingCrimeTracking.Stop()
                int i = 0
                while !_Camp_CampingCrimeTracking.IsStopped() && i < 30
                    utility.wait(0.1)
                    i += 1
                endWhile
                _Camp_CampingCrimeTracking.Start()
                if !IllegalItem1.GetRef()
                    IllegalItem1.ForceRefTo(campitem)
                elseif !IllegalItem2.GetRef()
                    IllegalItem2.ForceRefTo(campitem)
                elseif !IllegalItem3.GetRef()
                    IllegalItem3.ForceRefTo(campitem)
                endif

                return false
            elseif ibutton == 1
                StopPlacement(STOPPLACEMENT_USER_CANCELLED)
                _Camp_Placement_Cancelled.Show()
                return false
            elseif ibutton == 2     ;Back
                _Camp_CurrentlyPlacingObject.SetValueInt(2)
                return true
            endif
        else
            int ibutton = _Camp_IndicatorSelect.Show()
            if ibutton == 0
                if akIngredient && aiCost > 0
                    if PlayerRef.GetItemCount(akIngredient) >= aiCost
                        PlayerRef.RemoveItem(akIngredient, aiCost)
                    else
                        StopPlacement(STOPPLACEMENT_NO_INGREDIENTS)
                        return false
                    endif
                elseif akMiscItem && aiCost > 0
                    if PlayerRef.GetItemCount(akMiscItem) >= aiCost
                        PlayerRef.RemoveItem(akMiscItem, aiCost)
                    else
                        StopPlacement(STOPPLACEMENT_NO_ITEMS)
                        return false
                    endif
                endif

                akIndicator.Disable()
                ObjectReference campitem = akIndicator.PlaceAtMe(akFormToPlace, abForcePersist = !(IsPlaceableObjectTemporary(akFormToPlace)))
                ; Raise optional SKSE event
                SendEvent_OnObjectPlaced(campitem)

                if akInventoryItem
                    (campitem as _Camp_PlaceableObjectBase).Required_InventoryItem = akInventoryItem
                    PlayerRef.RemoveItem(akInventoryItem, 1, true)
                endif
                StopPlacement(STOPPLACEMENT_SUCCESS)
                return false
            elseif ibutton == 1     ;Exit Placement
                StopPlacement(STOPPLACEMENT_USER_CANCELLED)
                _Camp_Placement_Cancelled.Show()
                return false
            elseif ibutton == 2     ;Back
                _Camp_CurrentlyPlacingObject.SetValueInt(2)
                return true
            endif
        endif
    endif
endFunction

function UpdateIndicatorPositionSimple(ObjectReference akIndicator, float afDistance, float afHeightOffset = 1.0, float afRotationOffset = 0.0)
    float[] center_point = new float[2]
    center_point = GetOffsets(PlayerRef, afDistance)

    PlacementIndicatorThread1.get_async(center_point[0], center_point[1], 0.0, 0.0)
    SendEvent_OnIndicatorUpdateStart()

    bool waiting = true
    int i = 0
    While waiting
        if !(_Camp_IndicatorFutureRefA as _Camp_IndicatorFuture).done()
            i += 1
            Utility.wait(0.01)
            if i >= 50
                ;Our threads became locked up. Clear and resume, possibly throw an error.
                i = 0
                return
            endif
        else
            waiting = false
        endif
    endWhile

    float a = (_Camp_IndicatorFutureRefA as _Camp_IndicatorFuture).get_result()

    float[] player_position = new float[3]
    player_position = GetPositionData(PlayerRef)

    While !akIndicator.Is3DLoaded()
        Utility.Wait(0.1)
    endWhile

    akIndicator.TranslateTo(player_position[0] + center_point[0],         \
                                player_position[1] + center_point[1],     \
                                a + afHeightOffset,                       \
                                0.0, 0.0,                                 \
                                PlayerRef.GetAngleZ() + afRotationOffset, \
                                5000.0, 0.0)
endFunction


function UpdateIndicatorPosition(ObjectReference akIndicator, float afDistance, float afHeightOffset = 1.0, float afRotationOffset = 0.0, bool abSnapToTerrain = true)
    float[] center_point = new float[2]
    center_point = GetOffsets(PlayerRef, afDistance)

    PlacementIndicatorThread1.get_async(center_point[0], center_point[1], 0.0, -43.3)
    PlacementIndicatorThread2.get_async(center_point[0], center_point[1], -50.0, 43.3)
    PlacementIndicatorThread3.get_async(center_point[0], center_point[1], 50.0, 43.3)
    SendEvent_OnIndicatorUpdateStart()

    bool waiting = true
    int i = 0
    While waiting
        if !(_Camp_IndicatorFutureRefA as _Camp_IndicatorFuture).done() || \
           !(_Camp_IndicatorFutureRefB as _Camp_IndicatorFuture).done() || \
           !(_Camp_IndicatorFutureRefC as _Camp_IndicatorFuture).done()
            i += 1
            Utility.wait(0.01)
            if i >= 50
                ;Our threads became locked up. Clear and resume, possibly throw an error.
                i = 0
                return
            endif
        else
            waiting = false
        endif
    endWhile

    float[] rotation = new float[3]
    float[] player_position = new float[3]
    float[] snap_data = new float[3]

    float a = (_Camp_IndicatorFutureRefA as _Camp_IndicatorFuture).get_result()
    float b = (_Camp_IndicatorFutureRefB as _Camp_IndicatorFuture).get_result()
    float c = (_Camp_IndicatorFutureRefC as _Camp_IndicatorFuture).get_result()

    player_position = GetPositionData(PlayerRef)
    snap_data = GetTerrainRotation(a, b, c)

    ;Clamp height difference between player and indicator to 300 units
    if abs(player_position[2] - snap_data[2]) > 300.0
        snap_data[2] = player_position[2]
    endif

    While !akIndicator.Is3DLoaded()
        Utility.Wait(0.1)
    endWhile

    if abSnapToTerrain
        akIndicator.TranslateTo(player_position[0] + center_point[0],     \
                                player_position[1] + center_point[1],     \
                                snap_data[2] + afHeightOffset,            \
                                snap_data[0],                             \
                                snap_data[1],                             \
                                PlayerRef.GetAngleZ() + afRotationOffset, \
                                5000.0, 0.0)
    else
        akIndicator.TranslateTo(player_position[0] + center_point[0],     \
                                player_position[1] + center_point[1],     \
                                snap_data[2] + afHeightOffset,            \
                                0.0,                                      \
                                0.0,                                      \
                                PlayerRef.GetAngleZ() + afRotationOffset, \
                                5000.0, 0.0)
    endif

    if _Camp_IndicatorTriggerRef.GetPositionX() != player_position[0] || _Camp_IndicatorTriggerRef.GetPositionY() != player_position[1]
        _Camp_IndicatorTriggerRef.MoveTo(PlayerRef)
    endif
endFunction

function PlaceableObjectUsed(MiscObject akInventoryItem, Activator akPlacementIndicator, Ingredient akIngredient, MiscObject akMiscItem, Int aiCost, Perk akPerk, Message akIngredientError, Message akMiscItemError, Message akPerkError)
    bool can_use = MeetsRequirements(akIngredient, akMiscItem, aiCost, akPerk, akIngredientError, akMiscItemError, akPerkError)
    if !can_use
        return
    endif

    ExitMenus()
    ObjectReference ref = PlayerRef.PlaceAtMe(akPlacementIndicator as Activator)
    CampPlacementIndicator indicator = ref as CampPlacementIndicator
    indicator.required_inventory_item = akInventoryItem
    ;debug.trace("[Campfire] " + indicator.required_inventory_item)
    if akIngredient
        indicator.required_ingredient = akIngredient
        indicator.cost = aiCost
    elseif akMiscItem
        indicator.required_miscitem = akMiscItem
        indicator.cost = aiCost
    endif
    indicator.Ready()
endFunction

function UsableObjectUsed(Activator akActivatorToUse, Furniture akFurnitureToUse, Ingredient akIngredient, MiscObject akMiscItem, Int aiCost, Perk akPerk, Message akIngredientError, Message akMiscItemError, Message akPerkError)
    bool can_use = MeetsRequirements(akIngredient, akMiscItem, aiCost, akPerk, akIngredientError, akMiscItemError, akPerkError)
    if !can_use
        return
    endif
    
    ExitMenus()

    ; Take the required items now since we don't wait for placement
    if akIngredient && aiCost > 0
        PlayerRef.RemoveItem(akIngredient, aiCost)
    elseif akMiscItem && aiCost > 0
        PlayerRef.RemoveItem(akMiscItem, aiCost)
    endif

    ; It is the object's responsibility to activate the player once loaded,
    ; and cleaning itself up.
    if akActivatorToUse
        PlayerRef.PlaceAtMe(akActivatorToUse)
    elseif akFurnitureToUse
        PlayerRef.PlaceAtMe(akFurnitureToUse)
    endif
endFunction

bool function MeetsRequirements(Ingredient akIngredient, MiscObject akMiscItem, Int aiCost, Perk akPerk, Message akIngredientError, Message akMiscItemError, Message akPerkError)
    if PlayerCanPlaceObjects()
        _Camp_Strings str = GetCampfireStrings()
        if akPerk
            if !PlayerRef.HasPerk(akPerk)
                _Camp_PlaceObjectError_Perk.Show()
                if akPerkError
                    akPerkError.Show()
                elseif Compatibility.isSKSELoaded
                    debug.notification(akPerk.GetName() + str.IngredientRequired)
                endif
                return false
            endif
        endif
        if akIngredient && aiCost > 0
            if !(PlayerRef.GetItemCount(akIngredient) >= aiCost)
                _Camp_PlaceObjectError_Item.Show()
                if akIngredientError
                    akIngredientError.Show(aiCost)
                elseif Compatibility.isSKSELoaded
                    debug.notification(aiCost + " " + akIngredient.GetName() + str.IngredientRequired)
                endif
                return false
            endif
        elseif akMiscItem && aiCost > 0
            if !(PlayerRef.GetItemCount(akMiscItem) >= aiCost)
                _Camp_PlaceObjectError_Item.Show()
                if akMiscItemError
                    akMiscItemError.Show(aiCost)
                elseif Compatibility.isSKSELoaded
                    debug.notification(aiCost + " " + akMiscItem.GetName() + str.IngredientRequired)
                endif
                return false
            endif
        endif
    else
        return false
    endif
    return true
endFunction

function SendEvent_OnIndicatorUpdateStart()
    RegisterForSingleUpdate(0.1)
endFunction

function wait_all()
    SendEvent_OnObjectPlacementStart()
    begin_waiting()
endFunction

function begin_waiting()
    CampDebug(0, "Waiting on threads...")
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
                CampDebug(3, "A catastrophic error has occurred. All threads have become unresponsive. Please debug this issue or notify the author.")
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
        CampDebug(3, "A thread has encountered an error and has become unresponsive.")
    else
        CampDebug(2, "An unresponsive thread was successfully unlocked.")
    endif
endFunction

function SendEvent_OnObjectPlacementStart()
    ; Thread scripts on this object will receive this OnUpdate event and begin placement.
    RegisterForSingleUpdate(0.1)
endFunction

float[] function GetOffsets(Actor akSource, Float afDistance = 100.0, float afOffset = 0.0)
    Float A = akSource.GetAngleZ() + afOffset
    Float YDist = Sin(A)
    Float XDist = Cos(A)

    XDist *= afDistance
    YDist *= afDistance

    Float[] Offsets = New Float[2]
    Offsets[0] = YDist
    Offsets[1] = XDist
    Return Offsets
EndFunction

Float[] function GetTerrainRotation(float t1_zA, float t1_zB, float t1_zC)

    int YRot = 0    ;0 == no rotation; -1 == negative rotation; 1 == positive rotation
    int XRot = 0    ;0 == no rotation; -1 == negative rotation; 1 == positive rotation
    float ZPos      ;The Z-position of the object.
    
    ;Triangle 1 parameters
    ;(Triangle 1 is the triangle formed by the rays that are fired from the sky. It is a 60-60-60 triangle.

    ;GU = Game Units
    ;          A
    ;         / \
    ; 100GU  / 60\  100GU
    ;       /     \
    ;      /60   60\
    ;    B ---------C
    ;       100GU

    float t1_sideX = 100    ;Fixed game units between vertices
    
    ;Triangle 2 parameters
    ;           |\
    ;           |C\
    ;           |  \
    ;           |   \
    ;           |    \
    ;           |     \
    ;b = zB - zC|      \ a
    ;           |       \
    ;           |        \
    ;           |         \
    ;           |          \
    ;           |90(A)     B\
    ;           --------------
    ;               c=100GU
    ;
    ;               Y rotation = B

    ;float t2_angA = 90.0       ;Not used
    float t2_angB               ;SOLVE          <----- Y Rotation
    ;float t2_angC              ;Not used
    float t2_sideA              ;SOLVE
    float t2_sideB              ;SOLVE
    float t2_sideC = 100.0
    float t2_midpoint           ;SOLVE          ;Expressed as Z-value, not relative to the triangle

    ;Triangle 3 parameters
    ;                   |\
    ;                   |C\
    ;                   |  \
    ;                   |   \
    ;                   |    \
    ;                   |     \
    ;b = (zB - zC)/2    |      \ a
    ;                   |       \
    ;                   |        \
    ;                   |         \
    ;                   |          \
    ;                   |90(A)     B\
    ;                   --------------
    ;                       c=86.6GU
    ;
    ;               X rotation = B

    ;float t3_angA = 90.0           ;Not used
    float t3_angB                   ;SOLVE     <------ X Rotation
    ;float t3_angC                  ;Not used
    float t3_sideA                  ;SOLVE
    float t3_sideB                  ;SOLVE
    float t3_sideC = 86.6

    ;Determine the angle of the segment B, C

    ;Which way is Triangle 2 oriented? (Solve Triangle 2 Side B)
    if t1_zB > t1_zC
        YRot = -1               ;Roll right
        t2_sideB = t1_zB - t1_zC
        t2_midpoint = t1_zB - ((t1_zB - t1_zC) / 2)
    elseif t1_zC > t1_zB
        YRot = 1                ;Roll left
        t2_sideB = t1_zC - t1_zB
        t2_midpoint = t1_zC - ((t1_zC - t1_zB) / 2)
    elseif t1_zC == t1_zB
        YRot = 0                ;No roll
        t2_sideB = 0
        t2_midpoint = t1_zB
    endif
    
    ;Solve Triangle 2 side A and angle B
    if t2_sideB != 0
        t2_sideA = pow(t2_sideB, 2) + pow(t2_sideC, 2)      ;a^2 = b^2 + c^2
        t2_sideA = sqrt(t2_sideA)
    
        float t2_sinangB = t2_sideB / t2_sideA              ;sin(B)/b = sin(A)/a  =  sin(B)/b = 1/a     =      sin(B) = b/a
        t2_angB = asin(t2_sinangB)
    else
        t2_angB = 0
    endif
    
    ;Which way is Triangle 3 oriented? (Solve Triangle 3 Side B)
    if t1_zA > t2_midpoint
        t3_sideB = t1_zA - t2_midpoint
        ZPos = (t3_sideB/2) + t2_midpoint
        XRot = 1
    elseif t1_zA < t2_midpoint
        t3_sideB = t2_midpoint - t1_zA
        ZPos = (t3_sideB/2) + t1_zA
        XRot = -1
    elseif t1_zA == t2_midpoint
        t3_sideB = 0
        ZPos = t1_zA
        XRot = 0
    endif

    ;Solve Triangle 3 side A and angle B
    if t3_sideB != 0
        t3_sideA = pow(t3_sideB, 2) + pow(t3_sideC, 2)      ;a^2 = b^2 + c^2
        t3_sideA = sqrt(t3_sideA)
        float t3_sinangB = t3_sideB / t3_sideA              ;sin(B)/b = sin(A)/a  =  sin(B)/b = 1/a     =      sin(B) = b/a
        t3_angB = asin(t3_sinangB)
    else
        t3_angB = 0
    endif

    float[] myReturnValues = new float[3]
    
    ;Clamp rotation values to less than 45 degrees.
    if t3_angB * XRot > 25.0
        myReturnValues[0] = 25.0
    elseif t3_angB * XRot < -25.0
        myReturnValues[0] = -25.0
    else
        myReturnValues[0] = t3_angB * XRot
    endif
    
    if t2_angB * YRot > 25.0
        myReturnValues[1] = 25.0
    elseif t2_angB * YRot < -25.0
        myReturnValues[1] = -25.0
    else
        myReturnValues[1] = t2_angB * YRot
    endif
    
    myReturnValues[2] = ZPos 

    return myReturnValues
endFunction