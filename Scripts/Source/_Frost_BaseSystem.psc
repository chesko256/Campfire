scriptname _Frost_BaseSystem extends Quest

import _FrostInternal

GlobalVariable property Required_UpdateFrequencyGlobal auto
{The global variable that determines how often this system should update.}

; @TODO: DEBUG TESTING ONLY
Event OnInit()
	; @TODO: Conditionalize
	StartSystem()
endEvent

function StartSystem()
	FrostDebug(0, "StartSystem " + self)
	if !self.IsRunning()
		self.Start()
	endif
	RegisterForSingleUpdate(1)
endFunction

function StopSystem()
	self.UnregisterForUpdate()
	if self.IsRunning()
		self.Stop()
	endif
endFunction

Event OnUpdate()
	float start_time = Game.GetRealHoursPassed()
	Update()
	RegisterForSingleUpdate(Required_UpdateFrequencyGlobal.GetValue())
	FrostDebug(0, self + " update finished in " + ((Game.GetRealHoursPassed() - start_time) * 3600.0) + " seconds.")
endEvent

; @Overridden by system
function Update()
endFunction
