scriptname _Camp_TentObjectFuture extends ObjectReference

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
	while !done
		utility.wait(0.1)
	endWhile
	RegisterForSingleUpdate(0.1)
	return r
endFunction

Event OnUpdate()
	self.Disable()
	self.Delete()
endEvent