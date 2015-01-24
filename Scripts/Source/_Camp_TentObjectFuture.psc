scriptname _Camp_TentObjectFuture extends ObjectReference

Quest property CampfireObjectPlacementSystem auto

ObjectReference r
ObjectReference property result hidden
	function set(ObjectReference akResult)
		debug.trace("[CampfireFuture] <<< Value set: " + akResult)
		done = true
		r = akResult
	endFunction
endProperty

bool done = false
bool function done()
	return done
endFunction

ObjectReference function get_result()
	;Terminate the request after 10 seconds, or as soon as we have a result
	int i = 0
	while !done && i < 100
		;debug.trace("[CampfireFuture] @@@ " + self + " Waiting to finish...")
		i += 1
		utility.wait(0.1)
	endWhile
	RegisterForSingleUpdate(0.1)
 
        if i >= 100
            ;Our thread probably encountered an error and is locked up; we need to unlock it.
            (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThreadManager).TryToUnlockThread(self as ObjectReference)
        endif
    ;debug.trace("[CampfireFuture] >>> " + self + " Returning " + r)
	return r
endFunction

Event OnUpdate()
	debug.trace("[CampfireFuture] @@@ Done, tearing down...")
	self.Disable()
	self.Delete()
endEvent