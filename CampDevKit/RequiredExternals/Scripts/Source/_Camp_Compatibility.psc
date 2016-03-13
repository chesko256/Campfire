Scriptname _Camp_Compatibility extends ReferenceAlias

; Campfire SDK Required External -- DO NOT RECOMPILE
string script_name = "_Camp_Compatibility"
Event OnInit()
    while true
        debug.messagebox("Mod Developer: You have recompiled " + script_name + " in the Campfire Dev Kit. Please exit and delete " + script_name + ".pex from your scripts directory; reinstalling Dev Kit might be necessary. This message will repeat.")
        utility.wait(1)
    endWhile
endEvent

bool property isSKSELoaded auto hidden
Activator[] property PerkNodeControllers auto hidden

bool function CampfirePerkSystemRegister(Activator akNodeController, string asPluginName = "Unknown")
endFunction

bool function CampfirePerkSystemUnregister(Activator akNodeController, string asPluginName = "Unknown")
endFunction