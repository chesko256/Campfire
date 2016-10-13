scriptname _Frost_BaseSystem extends Quest

import _FrostInternal

GlobalVariable property UpdateFrequencyGlobal auto
{The global variable that determines how often this system should update. If left blank, this system is event-driven.}

bool initialized = false

function StartSystem()
	FrostDebug(-1, "StartSystem " + self)
	if !self.IsRunning()
		self.Start()
	endif
	if UpdateFrequencyGlobal
		RegisterForSingleUpdate(1)
	endif
	StartUp()
	initialized = true
endFunction

function StopSystem()
	self.UnregisterForUpdate()
	if self.IsRunning()
		self.Stop()
	endif
	ShutDown()
	initialized = false
endFunction

; @Override
function StartUp()
	; pass
endFunction

; @Override
function ShutDown()
	; pass
endFunction

bool function IsSystemRunning()
	return initialized
endFunction

Event OnUpdate()
	float start_time = Game.GetRealHoursPassed()
	Update()
	if UpdateFrequencyGlobal
		RegisterForSingleUpdate(UpdateFrequencyGlobal.GetValue())
		FrostDebug(-1, self + " update finished in " + ((Game.GetRealHoursPassed() - start_time) * 3600.0) + " seconds.")
	endif
endEvent

; @Overridden by system
function Update()
endFunction
