scriptname _Camp_ObjectPlacementThreadSystem extends Quest
{Handles thread delegation for object placement.}

Quest property CampfireObjectPlacementSystem auto
Activator property _Camp_TentObjectFutureActivator auto
ObjectReference property _Camp_FutureAnchor auto
Static property XMarker auto

ObjectReference function PlaceTentObjectAsync(ObjectReference center_object, ObjectReference object_position_reference, 		\
							  ObjectReference origin, Form form_to_place, float[] origin_angle,									\
							  float x_local_ang_adjust = 0.0, float y_local_ang_adjust = 0.0, float z_local_ang_adjust = 0.0,   \
							  float z_global_ang_adjust = 0.0, float z_hanging_offset = 0.0, bool inverted_local_y = false,     \
							  bool initially_disabled = false, bool is_propped = false, bool is_hanging = false)

	ObjectReference future
	while !future
		if !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread01).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread01).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread02).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread02).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread03).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread03).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread04).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread04).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread05).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread05).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread06).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread06).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread07).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread07).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread08).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread08).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread09).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread09).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread10).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread10).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread11).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread11).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread12).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread12).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread13).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread13).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread14).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread14).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread15).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread15).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread16).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread16).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread17).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread17).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread18).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread18).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread19).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread19).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread20).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread20).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread21).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread21).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread22).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread22).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread23).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread23).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread24).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread24).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread25).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread25).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread26).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread26).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread27).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread27).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread28).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread28).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread29).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread29).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		elseif !(CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread30).busy()
			future = (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThread30).get_async(_Camp_TentObjectFutureActivator, _Camp_FutureAnchor, XMarker, center_object, object_position_reference, \
																					  	origin, form_to_place, origin_angle, 		 \
																					  	x_local_ang_adjust, y_local_ang_adjust,    \
																					  	z_local_ang_adjust, z_global_ang_adjust,   \
																					  	z_hanging_offset, inverted_local_y,        \
																					  	initially_disabled, is_propped, is_hanging)
			;debug.trace("[Campfire] >>>> Arming future " + future)
		else
			;Threads are full; wait and try again.
			;@TODO: Add timeout
			utility.wait(0.1)
		endif
	endWhile

	return future
endFunction
