scriptname _Camp_ObjectFuture extends ObjectReference

Quest property CampfireObjectPlacementSystem auto

ObjectReference r
ObjectReference property result hidden
	function set(ObjectReference akResult)
		done = true
		r = akResult
	endFunction
endProperty

bool done = false
bool function done()
	return done
endFunction

ObjectReference function get_result()
	debug.trace("Object future " + self + " returning " + r)
	;Terminate the request after 10 seconds, or as soon as we have a result
	int i = 0
	while !done && i < 100
		i += 1
		utility.wait(0.1)
	endWhile
	StartTimer(0.1)
 
        if i >= 100
            ;Our thread probably encountered an error and is locked up; we need to unlock it.
            (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThreadManager).TryToUnlockThread(self as ObjectReference)
        endif
	return r
endFunction

Event OnTimer(int aiTimerID)
	r = None
	result = None
	self.Disable()
	self.Delete()
endEvent