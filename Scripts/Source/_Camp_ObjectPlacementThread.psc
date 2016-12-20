scriptname _Camp_ObjectPlacementThread extends Quest
{Object Placement base class. Responsible for handling object placement calculations. Returns a Future back to the caller.}

import math
import _CampInternal
import CampUtil

ObjectReference future
bool thread_queued = false
ObjectReference _RelativeCenterObject
ObjectReference _ObjectPositionReference
ObjectReference _Origin
Form _FormToPlace
float[] _OriginAngle
float _XLocalAngAdjust = 0.0
float _YLocalAngAdjust = 0.0
float _ZLocalAngAdjust = 0.0
float _ZGlobalAngAdjust = 0.0
float _ZHangingOffset = 0.0
bool _InvertedLocalY = false
float _XPosOffset = 0.0
float _YPosOffset = 0.0
float _ZPosOffset = 0.0
bool _InitiallyDisabled = false
bool _IsPropped = false
bool _IsHanging = false
bool _IsTemp = false
bool _IsInteractionDisabled = false

;Passed in externally, to avoid setting a property on many threads.
Static XMarker

ObjectReference function get_async(Activator akFuture, ObjectReference akFutureAnchor, 																\
						Static XMarkerStatic, ObjectReference relative_center_object, ObjectReference object_position_reference, 					\
						ObjectReference origin, Form form_to_place, float[] origin_angle, 															\
						float x_local_ang_adjust = 0.0, float y_local_ang_adjust = 0.0, float z_local_ang_adjust = 0.0, 							\
						float z_global_ang_adjust = 0.0, float z_hanging_offset = 0.0, bool inverted_local_y = false, 								\
						float x_pos_offset = 0.0, float y_pos_offset = 0.0,	float z_pos_offset,														\
						bool initially_disabled = false, bool is_propped = false, bool is_hanging = false, bool is_temp = false,					\
						bool is_interaction_disabled = false)
	
	CampDebug(0, self + " get_async placing form " + form_to_place)
	thread_queued = true

	_OriginAngle = new float[3]
	XMarker = XMarkerStatic
	if relative_center_object
		_RelativeCenterObject = relative_center_object
	else
		_RelativeCenterObject = origin
	endif
	_ObjectPositionReference = object_position_reference
	_Origin = origin
	_FormToPlace = form_to_place
	_OriginAngle = origin_angle
	_XLocalAngAdjust = x_local_ang_adjust
	_YLocalAngAdjust = y_local_ang_adjust
	_ZLocalAngAdjust = z_local_ang_adjust
	_ZGlobalAngAdjust = z_global_ang_adjust
	_ZHangingOffset = z_hanging_offset
	_InvertedLocalY = inverted_local_y
	_XPosOffset = x_pos_offset
	_YPosOffset = y_pos_offset
	_ZPosOffset = z_pos_offset
	_InitiallyDisabled = initially_disabled
	_IsPropped = is_propped
	_IsHanging = is_hanging
	_IsTemp = is_temp
	_IsInteractionDisabled = is_interaction_disabled
	
	future = akFutureAnchor.PlaceAtMe(akFuture)
	CampDebug(0, "Returning future: " + future)
	return future
endFunction

Event OnUpdate()
	if thread_queued
		float[] relative_position = new float[6]
		relative_position = GetRelativePosition(_RelativeCenterObject, _ObjectPositionReference, _XPosOffset, _YPosOffset)
		ObjectReference result = PlaceAtMeRelative(_Origin, _FormToPlace, _OriginAngle, relative_position, \
				_ZGlobalAngAdjust, _XLocalAngAdjust, _YLocalAngAdjust, _ZLocalAngAdjust, \
				_ZHangingOffset, _InvertedLocalY, _XPosOffset, _YPosOffset, _ZPosOffset, _InitiallyDisabled, _IsPropped, _IsHanging, _IsTemp, _IsInteractionDisabled)
		(future as _Camp_ObjectFuture).result = result
		clear_thread_vars()
		thread_queued = false
	endif
endEvent

function clear_thread_vars()
	future = None
	_RelativeCenterObject = None
	_ObjectPositionReference = None
	_Origin = None
	_FormToPlace = None
	_XLocalAngAdjust = 0.0
	_YLocalAngAdjust = 0.0
	_ZLocalAngAdjust = 0.0
	_ZGlobalAngAdjust = 0.0
	_ZHangingOffset = 0.0
	_InvertedLocalY = false
	_XPosOffset = 0.0
	_YPosOffset = 0.0
	_ZPosOffset = 0.0
	_InitiallyDisabled = false
	_IsPropped = false
	_IsHanging = false
	_IsTemp = false
	_IsInteractionDisabled = false
endFunction

float[] function GetPosXYZRotateAroundRef(ObjectReference akOrigin, ObjectReference akObject, float afXPosOffset, float afYPosOffset, float fAngleX, float fAngleY, float fAngleZ)

	;-----------\
	;Description \ 
	;----------------------------------------------------------------
	;Rotates a 3D position (akObject) offset from the center of 
	;rotation (akOrigin) by the supplied degrees fAngleX, fAngleY,
	;fAngleZ, and returns the new 3D position of the point.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		fNewPos[0]	= 	The new X position of the point
	;		fNewPos[1]	= 	The new Y position of the point
	;		fNewPos[2]	= 	The new Z position of the point

	;				|1			0			0		|
	;Rx(t) = 		|0			cos(t)		-sin(t)	|
	;				|0			sin(t)		cos(t)	|
	;
	;				|cos(t)		0			sin(t)	|
	;Ry(t) =		|0			1			0		|
	;				|-sin(t)	0			cos(t)	|
	;
	;				|cos(t)		-sin(t)		0		|
	;Rz(t) = 		|sin(t)		cos(t)		0		|
	;				|0			0			1		|
	
	;R * v = Rv, where R = rotation matrix, v = column vector of point [ x y z ], Rv = column vector of point after rotation
		
	fAngleX = -(fAngleX)
	fAngleY = -(fAngleY)
	fAngleZ = -(fAngleZ)
	
	float myOriginPosX = akOrigin.GetPositionX()
	float myOriginPosY = akOrigin.GetPositionY()
	float myOriginPosZ = akOrigin.GetPositionZ()

	; Find the local offset values
	;/float local_theta = 0.0
	if afXPosOffset != 0.0 
		local_theta = atan(afYPosOffset / afXPosOffset)
	endif
	float local_dist = sqrt(pow(afXPosOffset, 2) + pow(afYPosOffset, 2))
	float new_theta = (local_theta + fAngleZ)
	if new_theta > 180.0
		new_theta -= 360.0
	endif
	float new_c = 180.0 - (abs(new_theta) + 90.0)
	float new_opp = (local_dist * sin(new_theta))
	float new_adj = (local_dist * sin(new_c))

	if afXPosOffset || afYPosOffset
		CampDebug(1, "obj: " + akObject)
		CampDebug(1, "new x: " + new_adj)
		CampDebug(1, "new y: " + new_opp)
	endif/;

	float fInitialX = akObject.GetPositionX() - myOriginPosX
	float fInitialY = akObject.GetPositionY() - myOriginPosY
	float fInitialZ = akObject.GetPositionZ() - myOriginPosZ
	
	float fNewX
	float fNewY
	float fNewZ
	
	;Objects in Skyrim are rotated in order of Z, Y, X, so we will do that here as well.
	
	;Z-axis rotation matrix
	float fVectorX = fInitialX
	float fVectorY = fInitialY
	float fVectorZ = fInitialZ
	fNewX = (fVectorX * cos(fAngleZ)) + (fVectorY * sin(-fAngleZ)) + (fVectorZ * 0)
	fNewY = (fVectorX * sin(fAngleZ)) + (fVectorY * cos(fAngleZ)) + (fVectorZ * 0)
	fNewZ = (fVectorX * 0) + (fVectorY * 0) + (fVectorZ * 1)	
	
	;Y-axis rotation matrix
	fVectorX = fNewX
	fVectorY = fNewY
	fVectorZ = fNewZ
	fNewX = (fVectorX * cos(fAngleY)) + (fVectorY * 0) + (fVectorZ * sin(fAngleY))
	fNewY = (fVectorX * 0) + (fVectorY * 1) + (fVectorZ * 0)
	fNewZ = (fVectorX * sin(-fAngleY)) + (fVectorY * 0) + (fVectorZ * cos(fAngleY))
	
	;X-axis rotation matrix
	fVectorX = fNewX
	fVectorY = fNewY
	fVectorZ = fNewZ	
	fNewX = (fVectorX * 1) + (fVectorY * 0) + (fVectorZ * 0)
	fNewY = (fVectorX * 0) + (fVectorY * cos(fAngleX)) + (fVectorZ * sin(-fAngleX))
	fNewZ = (fVectorX * 0) + (fVectorY * sin(fAngleX)) + (fVectorZ * cos(fAngleX))
	
	;Return result
	float[] fNewPos = new float[3]
	fNewPos[0] = fNewX
	fNewPos[1] = fNewY
	fNewPos[2] = fNewZ
	return fNewPos 
endFunction

float[] function GetRelativePosition(ObjectReference akOrigin, ObjectReference akObject, float afXPosOffset, float afYPosOffset)
	float[] myRelativePosition = new float[6]
	; 2D rotation matrix - https://en.wikipedia.org/wiki/Rotation_matrix#In_two_dimensions
	float theta = 0.0
	float x_prime = 0.0
	float y_prime = 0.0
	
	theta = -(akObject.GetAngleZ())

	x_prime = (afXPosOffset * cos(theta)) - (afYPosOffset * sin(theta))
	y_prime = (afXPosOffset * sin(theta)) + (afYPosOffset * cos(theta))
	
	myRelativePosition[0] = (akObject.GetPositionX() + x_prime) - akOrigin.GetPositionX()
	myRelativePosition[1] = (akObject.GetPositionY() + y_prime) - akOrigin.GetPositionY()
	myRelativePosition[2] = akObject.GetPositionZ() - akOrigin.GetPositionZ()
	myRelativePosition[3] = akObject.GetAngleX()
	myRelativePosition[4] = akObject.GetAngleY()
	myRelativePosition[5] = akObject.GetAngleZ()
	return myRelativePosition
endFunction

ObjectReference function PlaceAtMeRelative(ObjectReference akOrigin, Form akFormToPlace, float[] fOriginAng, \
										   float[] fRelativePos, float fZGlobalAngAdjust = 0.0, float fXLocalAngAdjust = 0.0,  \
										   float fYLocalAngAdjust = 0.0, float fZLocalAngAdjust = 0.0, float fZHangingOffset = 0.0, \
										   bool abInvertedLocalY = false, float afXPosOffset = 0.0, float afYPosOffset = 0.0, float afZPosOffset = 0.0,	\
										   bool bInitiallyDisabled = false, bool abIsPropped = false, bool abIsHanging = false, bool abIsTemp = false, 	\
										   bool bDisableInteraction = false)
	
	ObjectReference myObject
    ObjectReference myTempMarker = akOrigin.PlaceAtMe(XMarker)
    myTempMarker.MoveTo(myTempMarker, fRelativePos[0], fRelativePos[1], fRelativePos[2])
        
	float[] myNewPos = new float[3]
    myNewPos = GetPosXYZRotateAroundRef(akOrigin, myTempMarker, afXPosOffset, afYPosOffset, fOriginAng[0], fOriginAng[1], fOriginAng[2] + fZGlobalAngAdjust)
   	myTempMarker.MoveTo(akOrigin, myNewPos[0], myNewPos[1], myNewPos[2])
	
	if abIsPropped
		if abInvertedLocalY
			myTempMarker.SetAngle(fXLocalAngAdjust, -(fOriginAng[2] + fYLocalAngAdjust), fZLocalAngAdjust)
		else
			myTempMarker.SetAngle(fXLocalAngAdjust, fOriginAng[2] + fYLocalAngAdjust, fZLocalAngAdjust)
		endif
	elseif abIsHanging
		myTempMarker.MoveTo(myTempMarker, afZOffset = fZHangingOffset)
		myTempMarker.SetAngle(0.0, 0.0, myTempMarker.GetAngleZ() + fRelativePos[5] + fZLocalAngAdjust)
	else
		myTempMarker.MoveTo(myTempMarker, afZOffset = afZPosOffset)
		myTempMarker.SetAngle(myTempMarker.GetAngleX() + fRelativePos[3] + fXLocalAngAdjust, \
							  myTempMarker.GetAngleY() + fRelativePos[4] + fYLocalAngAdjust, \
							  myTempMarker.GetAngleZ() + fRelativePos[5] + fZLocalAngAdjust)
	endif
	
	bool spawn_persistent = true
	if abIsTemp
		spawn_persistent = false
	endif

	; Move miscellaneous items / lights out of view to start with
	if bDisableInteraction
		myTempMarker.SetPosition(myTempMarker.GetPositionX(), myTempMarker.GetPositionY(), myTempMarker.GetPositionZ() - 350.0)
	endif
	
	myObject = myTempMarker.PlaceAtMe(akFormToPlace, abForcePersist = spawn_persistent, abInitiallyDisabled = bInitiallyDisabled)
    
    if bDisableInteraction && akFormToPlace as MiscObject
    	int i = 0
    	while !myObject.Is3DLoaded() && i < 50
    		if myObject.IsDisabled()
    			CampDebug(0, "myObject " + myObject + " incorrectly spawned as disabled.")
    			myObject.EnableNoWait()
    		endif
    		Utility.Wait(0.1)
    		i += 1
    	endWhile
    	myObject.SetMotionType(myObject.Motion_Keyframed)
		myObject.BlockActivation()
		
		; Move the object back to the spawn position; it might have fallen
		myObject.MoveTo(myTempMarker)
    endif

    TryToDisableAndDeleteRef(myTempMarker)

    return myObject
endFunction

;Allows the Thread Manager to determine if this thread is available
bool function queued()
	return thread_queued
endFunction
 
;For Thread Manager troubleshooting.
bool function has_future(ObjectReference akFuture)
    if akFuture == future
        return true
    else
        return false
    endif
endFunction
 
;For Thread Manager troubleshooting.
bool function force_unlock()
    clear_thread_vars()
    thread_queued = false
    return true
endFunction