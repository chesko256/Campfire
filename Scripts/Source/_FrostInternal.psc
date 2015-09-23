scriptname _FrostInternal hidden

int property WEATHERCLASS_CLEAR = 1 autoReadOnly
int property WEATHERCLASS_RAIN = 2 autoReadOnly
int property WEATHERCLASS_SNOW = 3 autoReadOnly

bool function IsBetweenInclusive(float Value, float Beginning, float End) global
	if Value >= Beginning && Value <= End
		return true
	else
		return false
	endif
endFunction

function FrostDebug(int aiSeverity, string asLogMessage) global
	int LOG_LEVEL = (Game.GetFormFromFile(0, "Frostfall.esp") as GlobalVariable).GetValueInt()
	if LOG_LEVEL <= aiSeverity
		if aiSeverity == 0
			debug.trace("[Frostfall][Debug] " + asLogMessage)
		elseif aiSeverity == 1
			debug.trace("[Frostfall][Info] " + asLogMessage)
		elseif aiSeverity == 2
			debug.trace("[Frostfall][Warning] " + asLogMessage)
		elseif aiSeverity == 3
			debug.trace("[Frostfall][ERROR] " + asLogMessage)
		endif
	endif
endFunction