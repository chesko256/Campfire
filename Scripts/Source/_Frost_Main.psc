Scriptname _Frost_Main extends Quest

Event OnInit()
	if !self.IsRunning()
		self.Start()
		return
	endif
	
	PlayerAlias.ForceRefTo(PlayerRef)
	FrostUtil.GetCompatibilitySystem().RunCompatibility()
	RegisterForSingleUpdate(5)
EndEvent

Event OnUpdate()
	;if some setting is true
		;if Frostfall's exposure system isn't running
			FrostUtil.GetExposureSystem().StartSystem()
		;endif
	;endif
	RegisterForSingleUpdate(5)
EndEvent