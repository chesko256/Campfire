scriptname _DE_ShelterDetectQuestScript extends Quest

ObjectReference property _DE_ShelterDetectOrigin auto
ObjectReference property _DE_ShelterDetectSensor2 auto
ObjectReference property _DE_Anchor auto
Spell property _DE_ShelterDetectBeam auto
_DE_EPMonitor_1_6 property MainScript auto
Actor property pPlayer auto
bool property bIsRunning auto

function ShelterDetectStart()
	bIsRunning = true
	RegisterForSingleUpdate(1.0)
endFunction

Event OnUpdate()
	if !(MainScript.bInInterior)
		_DE_ShelterDetectOrigin.MoveTo(pPlayer, 0.0, 0.0, 130.0)
		_DE_ShelterDetectSensor2.MoveTo(pPlayer, 0.0, 0.0, 1200.0)
		;debug.trace("[Frostfall] Origin Pos: X " + _DE_ShelterDetectOrigin.GetPositionX() + ", Y " + _DE_ShelterDetectOrigin.GetPositionY() + ", Z " + _DE_ShelterDetectOrigin.GetPositionZ())
		;debug.trace("[Frostfall] Sensor Pos: X " + _DE_ShelterDetectSensor2.GetPositionX() + ", Y " + _DE_ShelterDetectSensor2.GetPositionY() + ", Z " + _DE_ShelterDetectSensor2.GetPositionZ())
		_DE_ShelterDetectBeam.Cast(_DE_ShelterDetectOrigin, _DE_ShelterDetectSensor2)
	endif
	if !(MainScript.ShutdownState)
		RegisterForSingleUpdate(4.0)
	else
		;Store them away when not in use
		_DE_ShelterDetectOrigin.MoveTo(_DE_Anchor)
		_DE_ShelterDetectSensor2.MoveTo(_DE_Anchor)
		bIsRunning = false
	endif
endEvent