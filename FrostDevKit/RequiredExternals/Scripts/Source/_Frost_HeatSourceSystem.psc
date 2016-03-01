scriptname _Frost_HeatSourceSystem extends _Frost_BaseSystem

; Frostfall SDK Required External -- DO NOT RECOMPILE
string script_name = "_Frost_HeatSourceSystem"
Event OnInit()
    while true
        debug.messagebox("Mod Developer: You have recompiled " + script_name + " in the Frostfall Dev Kit. Please exit and delete " + script_name + ".pex from your scripts directory; reinstalling Dev Kit might be necessary. This message will repeat.")
        utility.wait(1)
    endWhile
endEvent

GlobalVariable property _Frost_NearFire auto
GlobalVariable property _Frost_CurrentHeatSourceSize auto
GlobalVariable property _Frost_CurrentHeatSourceDistance auto
