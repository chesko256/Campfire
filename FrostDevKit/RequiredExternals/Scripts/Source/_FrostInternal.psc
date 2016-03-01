scriptname _FrostInternal hidden

; Frostfall SDK Required External -- DO NOT RECOMPILE
string script_name = "_FrostInternal"
Event OnInit()
    while true
        debug.messagebox("Mod Developer: You have recompiled " + script_name + " in the Frostfall Dev Kit. Please exit and delete " + script_name + ".pex from your scripts directory; reinstalling Dev Kit might be necessary. This message will repeat.")
        utility.wait(1)
    endWhile
endEvent

function FrostDebug(int aiSeverity, string asLogMessage) global
endFunction