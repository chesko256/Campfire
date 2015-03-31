scriptname _Camp_ObjectPlacementIndicatorThread extends Quest hidden

ObjectReference property future auto
Actor property PlayerRef auto
ObjectReference property shooter_ref auto
ObjectReference property receiver_ref auto
Spell property z_test_spell auto

bool thread_queued = false

float _center_point_x
float _center_point_y
float _x_offset
float _y_offset

function get_async(float center_point_x, float center_point_y, float x_offset, float y_offset)
	thread_queued = true
	_center_point_x = center_point_x
	_center_point_y = center_point_y
	_x_offset = x_offset
	_y_offset = y_offset
endFunction

Event OnUpdate()
	if thread_queued
		float pos_x = _center_point_x + _x_offset
		float pos_y = _center_point_y + _y_offset
		shooter_ref.MoveTo(PlayerRef, pos_x, pos_y, 175.0)
		receiver_ref.MoveTo(PlayerRef, pos_x, pos_y, -300.0)
		z_test_spell.Cast(shooter_ref, receiver_ref)
		thread_queued = false
	endif
endEvent

bool function queued()
	return thread_queued
endFunction
 
bool function force_unlock()
    thread_queued = false
    return true
endFunction