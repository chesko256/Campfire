scriptname _DE_CampCookingPotObject extends ObjectReference

import debug

message property _DE_CookingPotSelect auto
message property _DE_CookingPotError auto
message property _DE_FurniturePickUpError auto
MiscObject property _DE_CampCookingPot_MISC auto
Formlist property _DE_HeatSources_All auto

Activator property _DE_CookingPot_Steam auto
ObjectReference property mySteam auto hidden
GlobalVariable property _DE_CampsitePlacementOn auto

bool bCanUpdate = true

Event OnInit()
	while !self.Is3DLoaded()
	endWhile
	self.BlockActivation()
	;utility.wait(1.0)
	
	RegisterForSingleUpdate(3)
endEvent

Event OnCellAttach()
	bCanUpdate = true
	RegisterForSingleUpdate(3)
endEvent

Event OnCellDetach()
	bCanUpdate = false
endEvent

Event OnUpdate()
	if !mySteam
		mySteam = self.PlaceAtMe(_DE_CookingPot_Steam, abInitiallyDisabled = true)
	endif
	ObjectReference myref = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_All, self, 300.0)
	if myref != none && myref.IsEnabled()
		if mySteam
			mySteam.Enable(true)
		endif
	else
		if mySteam
			mySteam.Disable(true)
		endif
	endif
	
	if bCanUpdate
		RegisterForSingleUpdate(3)
	endif
	
endEvent
	
Event OnActivate(ObjectReference akActionRef)

	GoToState("ActivationLock")

	if !((akActionRef as Actor) == Game.GetPlayer())
		GoToState("")
		return
	endif

	if _DE_CampsitePlacementOn.GetValueInt() == 2
		;Don't allow activation during placement.
		GoToState("")
		return
	endif

	int i = _DE_CookingPotSelect.Show()
	if i == 0			;Use
		ObjectReference myref = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_All, self, 260.0)
		if myref != none && myref.IsEnabled()
			self.Activate(akActionRef, true)
		else
			_DE_CookingPotError.Show()
		endif
	elseif i == 1
		;Pack up cooking pot
		if self.IsFurnitureInUse()
			_DE_FurniturePickUpError.Show()
		else
			akActionRef.AddItem(_DE_CampCookingPot_MISC)
			mySteam.Disable()
			mySteam.Delete()
			self.Disable()
			self.Delete()
		endif
	else
		;Do nothing
	endif
	
	GoToState("")
	
endEvent

State ActivationLock
	Event OnActivate(ObjectReference akActionRef)
		;debug.trace("[FROSTFALL] Duplicate activation ignored...")
	endEvent
endState