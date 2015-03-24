Scriptname _Camp_FollowerRegistration extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("Registering actor: " + akTarget.GetBaseObject().GetName() + " self " + self)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    debug.trace("Unregistering actor: " + akTarget.GetBaseObject().GetName() + " self " + self)
EndEvent

function RegisterFollower()
	;check aliases
	;populate first unoccupied alias
endFunction

function UnregisterFollower()
	;check aliases
	;clear if present
endFunction