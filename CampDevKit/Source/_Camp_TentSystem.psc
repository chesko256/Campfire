scriptname _Camp_TentSystem extends Quest

; Campfire SDK Required External -- DO NOT RECOMPILE
string script_name = "_Camp_TentSystem"
Event OnInit()
    while true
        debug.messagebox("Mod Developer: You have recompiled " + script_name + " in the Campfire SDK. Please exit and delete " + script_name + ".pex from your scripts directory; reinstalling SDK might be necessary. This message will repeat.")
        utility.wait(1)
    endWhile
endEvent