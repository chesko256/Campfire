scriptname _Camp_TentObjectFuture extends ObjectReference

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
	while !done
		debug.trace("[CampfireFuture] !!! " + self + " waiting for requested result...")
		utility.wait(0.1)
	endWhile
	RegisterForSingleUpdate(0.1)
	debug.trace("[CampfireFuture] >>> Providing result: " + r)
	return r
endFunction

Event OnUpdate()
	debug.trace("[CampfireFuture] @@@ Done, tearing down...")
	self.Disable()
	self.Delete()
endEvent