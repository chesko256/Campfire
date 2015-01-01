scriptname _DE_CampEnchantingObject extends ObjectReference

message property _DE_EnchantingSelect auto
message property _DE_FurniturePickUpError auto
MiscObject property _DE_EnchantingMISC auto
Sound property ITMGenericUp auto
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
	int i = _DE_EnchantingSelect.Show()
	if i == 0			;Use
		self.Activate(akActionRef, true)
	elseif i == 1
		;Pack up enchanter's circle
		if self.IsFurnitureInUse()
			_DE_FurniturePickUpError.Show()
		else
			akActionRef.AddItem(_DE_EnchantingMISC, abSilent = true)
			utility.wait(0.2)
			ITMGenericUp.Play(self)
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