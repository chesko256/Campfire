scriptname _SeedInternal

bool function IsUpToAndBetween(float fValue, float fUpperBound, float fLowerBound) global
    if fValue <= fUpperBound && fValue > fLowerBound
        return true
    else
        return false
    endif
endFunction

function SeedDebug(int aiSeverity, string asLogMessage) global
	int LOG_LEVEL = (Game.GetFormFromFile(0x0, "LastSeed.esp") as GlobalVariable).GetValueInt()
	if LOG_LEVEL <= 3 && LOG_LEVEL <= aiSeverity
		if aiSeverity == -1
			debug.trace("[Last Seed][SystemPerformance] " + asLogMessage)
		elseif aiSeverity == 0
			debug.trace("[Last Seed][Debug] " + asLogMessage)
		elseif aiSeverity == 1
			debug.trace("[Last Seed][Info] " + asLogMessage)
		elseif aiSeverity == 2
			debug.trace("[Last Seed][Warning] " + asLogMessage)
		elseif aiSeverity == 3
			debug.trace("[Last Seed][ERROR] " + asLogMessage)
		endif
	endif
endFunction