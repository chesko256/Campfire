Scriptname _DE_Visualize extends ObjectReference

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_Visualize
; Attached To (EditorID)..: 
; Description ............: Base placement visualization class. Drives all placement logic.
; Author .................: Chesko
; Last Approved (version) : 2.0
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

import utility
import math
import debug

Actor property PlayerRef auto

_Camp_LegalAreaCheck property Legal auto

form property myPlacedItem auto hidden
form property myPlacementRequirement auto hidden

GlobalVariable property _DE_ZTestValA auto
GlobalVariable property _DE_ZTestValB auto
GlobalVariable property _DE_ZTestValC auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto
;GlobalVariable property _DE_SwimState auto
GlobalVariable property _Camp_Setting_Legality auto
GlobalVariable property _DE_Setting_Help auto
GlobalVariable property _DE_HelpDone_Visualize auto
GlobalVariable property TimeScale auto
GlobalVariable property _DE_Setting_SimplePlacement auto
GlobalVariable property _DE_HelpDone_PlacementError auto
ObjectReference property myTrigger auto hidden
ObjectReference property _DE_ZTestShooterREF auto
ObjectReference property _DE_ZTestReceiverREF auto
ObjectReference property _DE_Anchor auto

message property myVisPrompt auto hidden
message property myRequirementErrorMsg auto hidden
message property _DE_CampVisIllegal auto
message property _DE_Help_Visualize auto
message property _DE_Placement_Cancelled auto
message property _DE_Placement_Cancelled_CollisionBug auto

Spell property _DE_ZTestSpellA auto
Spell property _DE_ZTestSpellB auto
Spell property _DE_ZTestSpellC auto

EffectShader property _DE_VisError auto
EffectShader property _DE_VisWarm auto

MiscObject property myInvItem auto hidden

float fLastUpdateTime
float fUpdateSpeed = 0.5
int iSlowUpdateCounter

function StartPlacement()
	
	;#Help Text=========================
	bool bShowHelp = _DE_HelpDone_Visualize.GetValueInt() == 1 && _DE_Setting_Help.GetValueInt() == 2
	if bShowHelp
		_DE_Help_Visualize.Show()
		_DE_HelpDone_Visualize.SetValue(2)
	endif
	;#Help Text=========================
	self.SetAngle(0.0, 0.0, 0.0)
	_Camp_CurrentlyPlacingObject.SetValue(2)
	myTrigger.MoveTo(PlayerRef)
	Legal.GetCampingLegalStart()
	RegisterForSingleUpdate(fUpdateSpeed)

endFunction

function PerformPlacement(float fDistance, formlist akWarmList = none, float fHeight = 1.0, float fRot = 0.0, float fHeatDist = 0.0, bool bLockToPlayer = false)
	
	float fTimeDeltaSec = GetCurrentRealTime() - fLastUpdateTime			;(difference in game-time days)

	;@TODO: Drop IsInCombat, check for OnHit event instead
	bool bHaltPlacement = PlayerRef.IsInCombat() || PlayerRef.IsSwimming() || self.GetDistance(PlayerRef) > 3000.0
	if bHaltPlacement
		StopPlacement()
		GiveBackItem()
		_DE_Placement_Cancelled.Show()
		_Camp_CurrentlyPlacingObject.SetValue(1)
		return
	endif
	
	float myX = PlayerRef.GetPositionX()
	float myY = PlayerRef.GetPositionY()
	float myZ = PlayerRef.GetPositionZ()
	
	float[] myCenterPoint = new float[2]
	myCenterPoint = GetTerrainAngleData(fDistance)
	
	if _Camp_CurrentlyPlacingObject.GetValueInt() == 3 && _DE_HelpDone_PlacementError.GetValue() == 1
		StopPlacement()
		GiveBackItem()
		if _DE_HelpDone_PlacementError.GetValue() == 1
			int i = _DE_Placement_Cancelled_CollisionBug.Show()
			if i == 0
				;Yes
				_DE_Setting_SimplePlacement.SetValue(2)
			elseif i == 1
				;No
			elseif i == 2
				;No - Don't Ask Again
				_DE_HelpDone_PlacementError.SetValue(2)
			endif
		endif
		_DE_Placement_Cancelled.Show()
		_Camp_CurrentlyPlacingObject.SetValue(1)
		return
	elseif _Camp_CurrentlyPlacingObject.GetValueInt() == 2
	
		;I have gathered the Z-Test data. Use that data to learn the x and y axis rotation of the terrain.
		float[] myRot = new float[3]
		myRot = GetTerrainRotation(_DE_ZTestValA.GetValue(), _DE_ZTestValB.GetValue(), _DE_ZTestValC.GetValue())
		
		if self.IsDisabled()
			self.Enable()
		endif
		while !self.Is3DLoaded()
			wait(0.1)
		endWhile
		
		if (myZ - myRot[2] > 300.0) || (myZ - myRot[2] < -300.0)
			;trace("[Frostfall] Z variance is too big, clamping")
			myRot[2] = myZ
		endif
		
		if bLockToPlayer
			self.TranslateTo(myX + myCenterPoint[0], myY + myCenterPoint[1], myZ + fHeight, 0.0, 0.0, PlayerRef.GetAngleZ() + fRot, 5000.0, 0.0)
		else
			self.TranslateTo(myX + myCenterPoint[0], myY + myCenterPoint[1], myRot[2] + fHeight, myRot[0], myRot[1], PlayerRef.GetAngleZ() + fRot, 5000.0, 0.0)
		endif
		if myTrigger.GetPositionX() != myX || myTrigger.GetPositionY() != myY || myTrigger.GetPositionZ() != myZ
			myTrigger.MoveTo(PlayerRef)
		endif
		
		if _Camp_Setting_Legality.GetValueInt() == 1 && !Legal.CampingLegal
			_DE_VisError.Play(self)
		else
			if akWarmList
				ObjectReference myref = Game.FindClosestReferenceOfAnyTypeInListFromRef(akWarmList, self, fHeatDist)
				if myref != none && myref.IsEnabled()
					_DE_VisWarm.Play(self)
				else
					_DE_VisError.Stop(self)
					_DE_VisWarm.Stop(self)
				endif
			else
				_DE_VisError.Stop(self)
				_DE_VisWarm.Stop(self)
			endif
		endif
		
		RegisterForSingleUpdate(fUpdateSpeed)
	else
		if _Camp_Setting_Legality.GetValueInt() == 1 && !Legal.CampingLegal
			int ibutton = _DE_CampVisIllegal.Show()
			if ibutton == 0
				StopPlacement()
				GiveBackItem()
				_Camp_CurrentlyPlacingObject.SetValue(1)
				_DE_Placement_Cancelled.Show()
			elseif ibutton == 1		;Back
				_Camp_CurrentlyPlacingObject.SetValue(2)
				RegisterForSingleUpdate(fUpdateSpeed)
			endif
		else
			int ibutton = myVisPrompt.Show()
			if ibutton == 0
				if myPlacementRequirement
					if PlayerRef.GetItemCount(myPlacementRequirement) > 0
						PlayerRef.RemoveItem(myPlacementRequirement, 1)
					else
						StopPlacement()
						GiveBackItem()
						myRequirementErrorMsg.Show()
						return
					endif
				endif
				self.Disable()
				myTrigger.MoveTo(_DE_Anchor)
				ObjectReference myObjectRef = self.PlaceAtMe(myPlacedItem, abInitiallyDisabled = false)
				;myObjectRef.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ())
				myObjectRef.Enable()
				StopPlacement()
			elseif ibutton == 1		;Exit Placement
				StopPlacement()
				GiveBackItem()
				_DE_Placement_Cancelled.Show()
			elseif ibutton == 2		;Back
				_Camp_CurrentlyPlacingObject.SetValue(2)
				RegisterForSingleUpdate(fUpdateSpeed)
			endif
		endif
	endif
	
	;trace("[FROSTFALL] Placement time delta: " + fTimeDeltaSec + "sec")
	
	fLastUpdateTime = GetCurrentRealTime()
	
endFunction

function StopPlacement()
	myTrigger.MoveTo(_DE_Anchor)
	_DE_ZTestShooterREF.MoveTo(_DE_Anchor)
	_DE_ZTestReceiverREF.MoveTo(_DE_Anchor)
	Legal.GetCampingLegalStop()
	self.Disable()
	self.Delete()
endFunction

function GiveBackItem()

	if myInvItem
		PlayerRef.AddItem(myInvItem, abSilent = true)
	endif

endFunction

float[] function GetTerrainAngleData(float afDistance)
	float[] t1_posA = new float[2]
	float[] t1_posB = new float[2]
	float[] t1_posC = new float[2]
	float[] myCenterPoint = new float[2]
		
	;1) Find the campsite item midpoint
	myCenterPoint = GetOffsets(PlayerRef, afDistance)
	
	t1_posA[0] = myCenterPoint[0]						;B		;C
	t1_posA[1] = myCenterPoint[1] - 43.3				
	t1_posB[0] = myCenterPoint[0] - 50.0					;A
	t1_posB[1] = myCenterPoint[1] + 43.3
	t1_posC[0] = myCenterPoint[0] + 50.0
	t1_posC[1] = myCenterPoint[1] + 43.3
	
	;messagebox("t1_posA = " + t1_posA[0] + "," + t1_posA[1])
	
	;trace("===============Moving shooter...================")
	;debug.trace("[Frostfall] Moving ZTestShooterRef to " + PlayerRef + ", " + t1_posA[0] + ", " + t1_posA[1])
	_DE_ZTestShooterREF.MoveTo(PlayerRef, t1_posA[0], t1_posA[1], 175.0)
	_DE_ZTestReceiverREF.MoveTo(PlayerRef, t1_posA[0], t1_posA[1], -300.0)
	_DE_ZTestSpellA.Cast(_DE_ZTestShooterREF, _DE_ZTestReceiverREF)
	;debug.trace("[Frostfall] Moving ZTestShooterRef to " + PlayerRef + ", " + t1_posB[0] + ", " + t1_posB[1])
	_DE_ZTestShooterREF.MoveTo(PlayerRef, t1_posB[0], t1_posB[1], 175.0)
	_DE_ZTestReceiverREF.MoveTo(PlayerRef, t1_posB[0], t1_posB[1], -300.0)
	_DE_ZTestSpellB.Cast(_DE_ZTestShooterREF, _DE_ZTestReceiverREF)
	;debug.trace("[Frostfall] Moving ZTestShooterRef to " + PlayerRef + ", " + t1_posC[0] + ", " + t1_posC[1])
	_DE_ZTestShooterREF.MoveTo(PlayerRef, t1_posC[0], t1_posC[1], 175.0)
	_DE_ZTestReceiverREF.MoveTo(PlayerRef, t1_posC[0], t1_posC[1], -300.0)
	_DE_ZTestSpellC.Cast(_DE_ZTestShooterREF, _DE_ZTestReceiverREF)
	;trace("===============End moving shooter...================")



	return myCenterPoint
	
endFunction

Float[] function GetTerrainRotation(float t1_zA, float t1_zB, float t1_zC)

	int YRot = 0	;0 == no rotation; -1 == negative rotation; 1 == positive rotation
	int XRot = 0	;0 == no rotation; -1 == negative rotation; 1 == positive rotation
	float ZPos		;The Z-position of the object.
	
	;Triangle 1 parameters
	;(Triangle 1 is the triangle formed by the rays that are fired from the sky. It is a 60-60-60 triangle.

	;GU = Game Units
	;          A
	;         / \
	; 100GU  / 60\  100GU
	;       /     \
	;      /60   60\
	;    B ---------C
	;		100GU

	float t1_sideX = 100	;Fixed game units between vertices
	
	;Triangle 2 parameters
	;			|\
	;			|C\
	;			|  \
	;			|   \
	;			|    \
	;			|     \
	;b = zB - zC|      \ a
	;			|	    \
	;			|		 \
	;			|		  \
	;			|		   \
	;			|90(A)     B\
	;		    --------------
	;			    c=100GU
	;
	;				Y rotation = B

	;float t2_angA = 90.0		;Not used
	float t2_angB				;SOLVE          <----- Y Rotation
	;float t2_angC				;Not used
	float t2_sideA				;SOLVE
	float t2_sideB				;SOLVE
	float t2_sideC = 100.0
	float t2_midpoint			;SOLVE			;Expressed as Z-value, not relative to the triangle

	;Triangle 3 parameters
	;					|\
	;					|C\
	;					|  \
	;					|   \
	;					|    \
	;					|     \
	;b = (zB - zC)/2	|      \ a
	;					|	    \
	;	 				|		 \
	;					|		  \
	;					|		   \
	;					|90(A)     B\
	;		  			--------------
	;					    c=86.6GU
	;
	;				X rotation = B

	;float t3_angA = 90.0			;Not used
	float t3_angB					;SOLVE     <------ X Rotation
	;float t3_angC					;Not used
	float t3_sideA					;SOLVE
	float t3_sideB					;SOLVE
	float t3_sideC = 86.6

	

	;Determine the angle of the segment B, C

	;Which way is Triangle 2 oriented? (Solve Triangle 2 Side B)
	if t1_zB > t1_zC
		YRot = -1				;Roll right
		t2_sideB = t1_zB - t1_zC
		t2_midpoint = t1_zB - ((t1_zB - t1_zC) / 2)
		;messagebox("t2_sideB = " + t1_zB + " - " + t1_zC)
	elseif t1_zC > t1_zB
		YRot = 1				;Roll left
		t2_sideB = t1_zC - t1_zB
		;messagebox("t2_sideB = " + t1_zC + " - " + t1_zB)
		t2_midpoint = t1_zC - ((t1_zC - t1_zB) / 2)
	elseif t1_zC == t1_zB
		YRot = 0				;No roll
		t2_sideB = 0
		t2_midpoint = t1_zB
	endif

	;messagebox("The height of Triangle 2 side B is " + t2_sideB)
	
	;Solve Triangle 2 side A and angle B
	if t2_sideB != 0
		t2_sideA = pow(t2_sideB, 2) + pow(t2_sideC, 2)		;a^2 = b^2 + c^2
		t2_sideA = sqrt(t2_sideA)
	
		float t2_sinangB = t2_sideB / t2_sideA				;sin(B)/b = sin(A)/a  =  sin(B)/b = 1/a     =      sin(B) = b/a
		t2_angB = asin(t2_sinangB)
		;messagebox("Computed " + t2_angB + " from arccos(" + t2_sinangB + "), from " + t2_sideB + " over " + t2_sideA)
	else
		t2_angB = 0
	endif
	
	;messagebox("The height of Triangle 2 side A is " + t2_sideA)
	;messagebox("The angle of Triangle 2 angle B is " + t2_angB)
	
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

	;messagebox("The height of Triangle 3 side B is " + t3_sideB)
	
	;Solve Triangle 3 side A and angle B
	if t3_sideB != 0
		t3_sideA = pow(t3_sideB, 2) + pow(t3_sideC, 2)		;a^2 = b^2 + c^2
		t3_sideA = sqrt(t3_sideA)
		float t3_sinangB = t3_sideB / t3_sideA				;sin(B)/b = sin(A)/a  =  sin(B)/b = 1/a     =      sin(B) = b/a
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