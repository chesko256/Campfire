scriptname _DE_PlaceableObject extends ObjectReference

import math

_DE_GetCampingLegal property Legal auto
;_DE_EPMonitor_1_6 property Frostfall auto
float property fZOffset auto
float property fZAngleOffset auto
Activator property myPlacedActivator auto
Furniture property myPlacedFurniture auto
Ingredient property myRequiredIngredient auto
{Fill only the ingredient or the misc item property, not both.}
MiscObject property myRequiredItem auto
{Fill only the ingredient or the misc item property, not both.}
message property myRequirementErrorMsg auto
{Fill if a required ingredient or item is necessary.}
message property _DE_PlacedObjectIllegalLocation auto
message property _DE_PlacedObjectChoice auto
ObjectReference property _DE_XMarker_Placement auto
ObjectReference property _DE_Anchor auto
GlobalVariable property _DE_Setting_SimplePlacement auto

Event OnActivate(ObjectReference akActionRef)
endEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if !akNewContainer
		if _DE_Setting_SimplePlacement.GetValueInt() == 2
			self.BlockActivation()
			GoToState("Dropped")
		else
			self.BlockActivation(false)
			GoToState("")
		endif
	else
		GoToState("")
	endif
endEvent

State Dropped
Event OnActivate(ObjectReference akActionRef)
	if self
		if self.IsActivationBlocked()
			GoToState("ActivationLock")
			if _DE_Setting_SimplePlacement.GetValueInt() == 2 && akActionRef == Game.GetPlayer()
				if !(Legal.GetCampingLegal())
					IllegalCampingMessage()
				else
					PlaceObjectMessage()
				endif
			else
				akActionRef.AddItem(self, abSilent = true)
			endif
			GoToState("Dropped")
		endif
	endif
	RegisterForSingleUpdate(720000)		;Force this reference to become persistent
endEvent
endState

State ActivationLock
	Event OnActivate(ObjectReference akActionRef)
		;debug.trace("[FROSTFALL] Duplicate activation ignored...")
	endEvent
endState

function PlaceObjectMessage()
	int i = _DE_PlacedObjectChoice.Show()
	if i == 0
		if myRequiredIngredient
			if Game.GetPlayer().GetItemCount(myRequiredIngredient) >= 1
				PlaceObject()
			else
				myRequirementErrorMsg.Show()
			endif
		elseif myRequiredItem
			if Game.GetPlayer().GetItemCount(myRequiredItem) >= 1
				PlaceObject()
			else
				myRequirementErrorMsg.Show()
			endif
		else
			PlaceObject()
		endif
	elseif i == 1
		Game.GetPlayer().AddItem(self)
	else
		;exit
	endif
endFunction

function PlaceObject()
	if myPlacedFurniture
		float[] myOffset = new float[2]
		myOffset = GetOffsets(Game.GetPlayer(), 150.0)
		_DE_XMarker_Placement.MoveTo(Game.GetPlayer(), myOffset[0], myOffset[1], fZOffset, abMatchRotation = false)
		_DE_XMarker_Placement.SetAngle(0.0, 0.0, Game.GetPlayer().GetAngleZ() - fZAngleOffset)
		_DE_XMarker_Placement.PlaceAtMe(myPlacedFurniture)
		_DE_XMarker_Placement.MoveTo(_DE_Anchor)
	elseif myPlacedActivator
		float[] myOffset = new float[2]
		myOffset = GetOffsets(Game.GetPlayer(), 150.0)
		_DE_XMarker_Placement.MoveTo(Game.GetPlayer(), myOffset[0], myOffset[1], fZOffset, abMatchRotation = false)
		_DE_XMarker_Placement.SetAngle(0.0, 0.0, Game.GetPlayer().GetAngleZ() - fZAngleOffset)
		_DE_XMarker_Placement.PlaceAtMe(myPlacedActivator)
		_DE_XMarker_Placement.MoveTo(_DE_Anchor)
	endif
	self.Disable()
	self.Delete()
endFunction

function IllegalCampingMessage()
	int i = _DE_PlacedObjectIllegalLocation.Show()
	if i == 0
		Game.GetPlayer().AddItem(self)
	else
		;exit
	endif
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
