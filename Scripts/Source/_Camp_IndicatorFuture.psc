scriptname _Camp_IndicatorFuture extends ObjectReference

Quest property CampfireObjectPlacementSystem auto

float r
float property result hidden
	function set(float akResult)
		done = true
		r = akResult
	endFunction
endProperty

bool done = false
bool function done()
	return done
endFunction

float function get_result()
	;Terminate the request after 10 seconds, or as soon as we have a result
	int i = 0
	while !done && i < 100
		i += 1
		utility.wait(0.1)
	endWhile 
    if i >= 100
        ;Our thread probably encountered an error and is locked up; we need to unlock it.
        (CampfireObjectPlacementSystem as _Camp_ObjectPlacementThreadManager).TryToUnlockThread(self as ObjectReference)
    endif
    done = false
	return r
endFunction