scriptname _Camp_ObjectPlacementSystem extends Quest
{Responsible for handling object placement calculations and returning an ObjectReference back to the caller.}

import math
import CampUtil

int thread_id = -1
bool thread_queued = false
bool thread_working = false
ObjectReference result
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
bool _InitiallyDisabled = false
bool _IsPropped = false
bool _IsHanging = false

Static XMarker

Form function queue_thread(ObjectReference relative_center_object, ObjectReference object_position_reference, \
						 ObjectReference origin, Form form_to_place, float[] origin_angle, \
						 float x_local_ang_adjust = 0.0, float y_local_ang_adjust = 0.0, float z_local_ang_adjust = 0.0, \
						 float z_global_ang_adjust = 0.0, float z_hanging_offset = 0.0, bool inverted_local_y = false, \
						 bool initially_disabled = false, bool is_propped = false, bool is_hanging = false)
	
	thread_queued = true
	if thread_id == -1
		thread_id = GetThreadId()
		;debug.trace("[Campfire] Thread " + self + " assigned Thread ID " + thread_id)
	endif
	_OriginAngle = new float[3]
	if !XMarker
		XMarker = Game.GetFormFromFile(0x0000003B, "Skyrim.esm") as Static
	endif
	_RelativeCenterObject = relative_center_object
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
	_IsPropped = is_propped
	_IsHanging = is_hanging
	;RegisterForModEvent("Campfire_OnThreadedPlacement", "OnThreadedPlacement")
	RaiseEvent_OnThreadedPlacement(thread_id)
	return self

endFunction

Event OnThreadedPlacement(int aiThreadId)
	if thread_queued && aiThreadId == thread_id
		;debug.StartStackProfiling()
		;debug.trace("[Campfire] Thread " + self + " (TID " + thread_id + ") got OnThreadedPlacement, WORKING -----------")
		thread_working = true
		float[] relative_position = new float[6]
		relative_position = GetRelativePosition(_RelativeCenterObject, _ObjectPositionReference)
		result = PlaceAtMeRelative(_Origin, _FormToPlace, _OriginAngle, relative_position, \
				_ZGlobalAngAdjust, _XLocalAngAdjust, _YLocalAngAdjust, _ZLocalAngAdjust, \
				_ZHangingOffset, _InvertedLocalY, _InitiallyDisabled, _IsPropped, _IsHanging)
		clear_thread_vars()
		thread_working = false
		;debug.trace("[Campfire] Thread " + self + " (TID " + thread_id + ") ============== DONE!")
		;debug.StopStackProfiling()
	endif
endEvent

function clear_thread_vars()
	_RelativeCenterObject = None
	_ObjectPositionReference = None
	_Origin = None
	_FormToPlace = None
	_OriginAngle[0] = 0.0
	_OriginAngle[1] = 0.0
	_OriginAngle[2] = 0.0
	_XLocalAngAdjust = 0.0
	_YLocalAngAdjust = 0.0
	_ZLocalAngAdjust = 0.0
	_ZGlobalAngAdjust = 0.0
	_ZHangingOffset = 0.0
	_InvertedLocalY = false
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

float[] function GetAngleData(ObjectReference akObjectReference)
	float[] myReturnArray = new float[3]
    myReturnArray[0] = akObjectReference.GetAngleX()
    myReturnArray[1] = akObjectReference.GetAngleY()
    myReturnArray[2] = akObjectReference.GetAngleZ()
	return myReturnArray
endFunction

float[] function GetRelativePosition(ObjectReference akOrigin, ObjectReference akObject)
	float[] myRelativePosition = new float[6]
	myRelativePosition[0] = akObject.GetPositionX() - akOrigin.GetPositionX()
	myRelativePosition[1] = akObject.GetPositionY() - akOrigin.GetPositionY()
	myRelativePosition[2] = akObject.GetPositionZ() - akOrigin.GetPositionZ()
	myRelativePosition[3] = akObject.GetAngleX()
	myRelativePosition[4] = akObject.GetAngleY()
	myRelativePosition[5] = akObject.GetAngleZ()
	
	return myRelativePosition
endFunction

ObjectReference function PlaceAtMeRelative(ObjectReference akOrigin, Form akFormToPlace, float[] fOriginAng, \
										   float[] fRelativePos, float fZGlobalAngAdjust = 0.0, float fXLocalAngAdjust = 0.0,  \
										   float fYLocalAngAdjust = 0.0, float fZLocalAngAdjust = 0.0, float fZHangingOffset = 0.0, \
										   bool abInvertedLocalY = false, bool abInitiallyDisabled = false, bool abIsPropped = false, \
										   bool abIsHanging = false)
	
	ObjectReference myObject
    ObjectReference myTempMarker = akOrigin.PlaceAtMe(XMarker)
	myTempMarker.MoveTo(myTempMarker, fRelativePos[0], fRelativePos[1], fRelativePos[2])
    
	float[] myNewPos = new float[3]
    myNewPos = GetPosXYZRotateAroundRef(akOrigin, myTempMarker, fOriginAng[0], fOriginAng[1], fOriginAng[2] + fZGlobalAngAdjust)
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

bool function queued()
	;Returns True if this thread has been queued and is processing (or has processed) a result. Only unqueued threads are safe to use. This function does not wait.
	return thread_queued
endFunction

bool function done()
	;Returns True if the result has arrived; otherwise, returns False. This function does not wait.
	return !thread_working
endFunction
	
;/Form function get_result()
	;Waits if necessary; then returns the result.
	while thread_working
	endWhile
	ObjectReference r = result
	result = None
	thread_queued = false
	return r
endFunction
/;

Form function get_result_async()
	;Returns the result. If not available, returns self.
	if result
		ObjectReference r = result
		result = None
		thread_queued = false
		;debug.trace("[Campfire] @@@@@@@@@@@@@@@@@ Thread " + self + " (TID " + thread_id + ") returning requested result: " + r)
		return r
	else
		return self
	endif
endFunction

;/ObjectReference function get_result()
	;debug.trace("[Campfire] Thread " + self + " had result request")
	if thread_working
		;debug.trace("[Campfire] Thread " + self + " Nothing to return yet")
		return None
	else
		;debug.trace("[Campfire] Thread " + self + " returning result " + result)
		ObjectReference rslt = result
		result = None
		thread_queued = false
		return rslt
	endif
endFunction
/;