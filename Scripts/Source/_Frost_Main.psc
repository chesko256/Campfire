Scriptname _Frost_Main extends Quest
{This script handles starting the mod for the first time, setting appropriate start-up aliases, and running compatibility on startup.}

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
	;if the mod hasn't ever been activated && we're staring up at the night sky
		StartModFirstTime()
		FrostUtil.GetExposureSystem().StartSystem()
	;else
		RegisterForSingleUpdate(5)
	;endif
EndEvent

function StartModFirstTime()
	; Display the message
	; Give the book
endFunction