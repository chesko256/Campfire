scriptname _CampInternal hidden

; Campfire SDK Required External -- DO NOT RECOMPILE
string script_name = "_CampInternal"
Event OnInit()
    while true
        debug.messagebox("Mod Developer: You have recompiled " + script_name + " in the Campfire Dev Kit. Please exit and delete " + script_name + ".pex from your scripts directory; reinstalling Dev Kit might be necessary. This message will repeat.")
        utility.wait(1)
    endWhile
endEvent

function CampDebug(int aiSeverity, string asLogMessage) global
endFunction