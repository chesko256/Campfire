scriptname _DE_CampTanningRackObject extends ObjectReference

message property _DE_TanningRackSelect auto
message property _DE_TanningRackDestroy auto
message property _DE_FurniturePickUpError auto
MiscObject property _DE_CampTanningRack auto
GlobalVariable property _DE_CampsitePlacementOn auto

Event OnInit()
	while !self.Is3DLoaded()
	endWhile
	
	self.BlockActivation()
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
	int i = _DE_TanningRackSelect.Show()
	if i == 0			;Use
		self.Activate(akActionRef, true)
	elseif i == 1
		;Pack up tanning rack
		if self.IsFurnitureInUse()
			_DE_FurniturePickUpError.Show()
		else
			akActionRef.AddItem(_DE_CampTanningRack)
			self.Disable()
			self.Delete()
		endif
	elseif i == 2
		;Destroy
		;fade down
		;pop black
		;play construction noise
		self.Disable()
		self.Delete()
		;fade up
		_DE_TanningRackDestroy.Show()
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