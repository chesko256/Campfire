scriptname _Frost_BaseSystem extends Quest

GlobalVariable property Required_UpdateFrequencyGlobal auto
{The global variable that determines how often this system should update.}

; @TODO: DEBUG TESTING ONLY
Event OnInit()
	; @TODO: Conditionalize
	StartSystem()
endEvent

function StartSystem()
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
	Update()
	RegisterForSingleUpdate(Required_UpdateFrequencyGlobal.GetValue())
endEvent

; @Overridden by system
function Update()
endFunction
