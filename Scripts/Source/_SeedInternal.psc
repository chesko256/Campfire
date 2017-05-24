scriptname _SeedInternal

bool function IsUpToAndBetween(float fValue, float fUpperBound, float fLowerBound) global
    if fLowerBound == 0.0
    	if fValue <= fUpperBound && fValue >= fLowerBound
        	return true
    	else
        	return false
    	endif
    else
    	if fValue <= fUpperBound && fValue > fLowerBound
        	return true
    	else
        	return false
    	endif
    endif
endFunction

function SeedDebug(int aiSeverity, string asLogMessage) global
	int LOG_LEVEL = (Game.GetFormFromFile(0x0000B6CE, "LastSeed.esp") as GlobalVariable).GetValueInt()
	if LOG_LEVEL <= 3 && LOG_LEVEL <= aiSeverity
		if aiSeverity == -1
			debug.trace("[LastSeed][SystemPerformance] " + asLogMessage)
		elseif aiSeverity == 0
			debug.trace("[LastSeed][Debug] " + asLogMessage)
		elseif aiSeverity == 1
			debug.trace("[LastSeed][Info] " + asLogMessage)
		elseif aiSeverity == 2
			debug.trace("[LastSeed][Warning] " + asLogMessage)
		elseif aiSeverity == 3
			debug.trace("[LastSeed][ERROR] " + asLogMessage)
		endif
	endif
endFunction