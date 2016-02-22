scriptname _Camp_LegalAreaCheck extends ReferenceAlias

; Campfire SDK Required External -- DO NOT RECOMPILE
string script_name = "_Camp_LegalAreaCheck"
Event OnInit()
    while true
        debug.messagebox("Mod Developer: You have recompiled " + script_name + " in the Campfire Dev Kit. Please exit and delete " + script_name + ".pex from your scripts directory; reinstalling Dev Kit might be necessary. This message will repeat.")
        utility.wait(1)
    endWhile
endEvent

bool function GetCampingLegal(bool bIgnoreSetting = false)
endFunction

Faction function GetAreaCampingFaction(ObjectReference akCenter)
endFunction