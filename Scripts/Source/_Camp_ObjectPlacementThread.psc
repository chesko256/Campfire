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

;Passed in externally, to avoid setting a property on many threads.
Static XMarker

ObjectReference function get_async(Activator akFuture, ObjectReference akFutureAnchor, 																\
						Static XMarkerStatic, ObjectReference relative_center_object, ObjectReference object_position_reference, 					\
						ObjectReference origin, Form form_to_place, float[] origin_angle, 															\
						float x_local_ang_adjust = 0.0, float y_local_ang_adjust = 0.0, float z_local_ang_adjust = 0.0, 							\
						float z_global_ang_adjust = 0.0, float z_hanging_offset = 0.0, bool inverted_local_y = false, 								\
						float x_pos_offset = 0.0, float y_pos_offset = 0.0,	float z_pos_offset,														\
						bool initially_disabled = false, bool is_propped = false, bool is_hanging = false)
	
	CampDebug(0, "get_async")
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
	
	future = akFutureAnchor.PlaceAtMe(akFuture)
	CampDebug(0, "Returning future " + future)
	return future
endFunction

Event OnUpdate()
	if thread_queued
		CampDebug(0, self + "Thread was queued")
		float[] relative_position = new float[6]
		relative_position = GetRelativePosition(_RelativeCenterObject, _ObjectPositionReference)
		CampDebug(0, "position reference " + _ObjectPositionReference)
		ObjectReference result = PlaceAtMeRelative(_Origin, _FormToPlace, _OriginAngle, relative_position, \
				_ZGlobalAngAdjust, _XLocalAngAdjust, _YLocalAngAdjust, _ZLocalAngAdjust, \
				_ZHangingOffset, _InvertedLocalY, _XPosOffset, _YPosOffset, _ZPosOffset, _InitiallyDisabled, _IsPropped, _IsHanging)
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
endFunction

float[] function GetPosXYZRotateAroundRef(ObjectReference akOrigin, ObjectReference akObject, float fAngleX, float fAngleY, float fAngleZ)

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

float[] function GetRelativePosition(ObjectReference akOrigin, ObjectReference akObject)
	int i = 0
	utility.wait(5)
	while (!akOrigin.Is3DLoaded() || !akObject.Is3DLoaded())
		utility.wait(0.1)
		i += 1
		CampDebug(0, "Waiting on objects to load before calcs...")
		if i >= 50
			CampDebug(0, "Ran out of time waiting for objects to load.")
			float[] none_return = new Float[6]
			return none_return
		endif
	endWhile

	CampDebug(0, self + "Getting relative position of " + akOrigin + " and " + akObject)
	CampDebug(0, "Here we go before failure...!")
	float objx = akObject.GetPositionX()
	float objy = akObject.GetPositionY()
	float objz = akObject.GetPositionZ()
	CampDebug(0, " obj x y z " + objx + ", " + objy + ", " + objz)
	float orgx = akOrigin.GetPositionX()
	float orgy = akOrigin.GetPositionY()
	float orgz = akOrigin.GetPositionZ()
	CampDebug(0, " org x y z " + orgx + ", " + orgy + ", " + orgz)

	CampDebug(0, "For giggles, here is the thing that dies: " + (objx - orgx))
	CampDebug(0, "I did it!")
	float[] myRelativePosition = new float[6]
	CampDebug(0, self + "myRelativePosition: " + myRelativePosition)
	myRelativePosition[0] = akObject.GetPositionX() - akOrigin.GetPositionX()
	CampDebug(0, self + "myRelativePosition: " + myRelativePosition)
	myRelativePosition[1] = akObject.GetPositionY() - akOrigin.GetPositionY()
	CampDebug(0, self + "myRelativePosition: " + myRelativePosition)
	myRelativePosition[2] = akObject.GetPositionZ() - akOrigin.GetPositionZ()
	CampDebug(0, self + "myRelativePosition: " + myRelativePosition)
	myRelativePosition[3] = akObject.GetAngleX()
	CampDebug(0, self + "myRelativePosition: " + myRelativePosition)
	myRelativePosition[4] = akObject.GetAngleY()
	CampDebug(0, self + "myRelativePosition: " + myRelativePosition)
	myRelativePosition[5] = akObject.GetAngleZ()
	CampDebug(0, self + "(End) Relative position: " + myRelativePosition)
	
	return myRelativePosition
endFunction

ObjectReference function PlaceAtMeRelative(ObjectReference akOrigin, Form akFormToPlace, float[] fOriginAng, \
										   float[] fRelativePos, float fZGlobalAngAdjust = 0.0, float fXLocalAngAdjust = 0.0,  \
										   float fYLocalAngAdjust = 0.0, float fZLocalAngAdjust = 0.0, float fZHangingOffset = 0.0, \
										   bool abInvertedLocalY = false, float afXPosOffset = 0.0, float afYPosOffset = 0.0, float afZPosOffset = 0.0,	\
										   bool abInitiallyDisabled = false, bool abIsPropped = false, bool abIsHanging = false)

	ObjectReference myObject
    ObjectReference myTempMarker = akOrigin.PlaceAtMe(XMarker)
    myTempMarker.MoveTo(myTempMarker, fRelativePos[0], fRelativePos[1], fRelativePos[2])
        
	float[] myNewPos = new float[3]
    myNewPos = GetPosXYZRotateAroundRef(akOrigin, myTempMarker, fOriginAng[0], fOriginAng[1], fOriginAng[2] + fZGlobalAngAdjust)
    if afXPosOffset != 0.0 || afYPosOffset != 0.0
    	float[] local_offsets = GlobalToLocalOffset(afXPosOffset, afYPosOffset, fOriginAng[2] + fZGlobalAngAdjust)
    	myTempMarker.MoveTo(akOrigin, myNewPos[0] + local_offsets[0], myNewPos[1] + local_offsets[1], myNewPos[2])
    else
    	myTempMarker.MoveTo(akOrigin, myNewPos[0], myNewPos[1], myNewPos[2])
    endif
	
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
	
	if abInitiallyDisabled
		myObject = myTempMarker.PlaceAtMe(akFormToPlace, abInitiallyDisabled = true)
	else
		myObject = myTempMarker.PlaceAtMe(akFormToPlace)
	endif
    
    TryToDisableAndDeleteRef(myTempMarker)

    return myObject
endFunction

float[] function GlobalToLocalOffset(float x_offset, float y_offset, float z_angle)
	;float[] function GetOffsets(Actor akSource, Float afDistance = 100.0, float afOffset = 0.0)
    Float YDist = Sin(z_angle)
    Float XDist = Cos(z_angle)

    XDist *= x_offset
    YDist *= y_offset

    Float[] Offsets = New Float[2]
    Offsets[0] = YDist
    Offsets[1] = XDist
    Return Offsets
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