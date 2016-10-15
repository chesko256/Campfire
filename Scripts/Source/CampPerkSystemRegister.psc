scriptname CampPerkSystemRegister extends ReferenceAlias

import Utility

Activator property required_node_controller auto
{ The node controller to register on startup. }
String property mod_name = "Unknown" auto
{ Optional: The name of the mod / plug-in. Displayed only in Papyrus log. }

bool campfire_is_loaded = false

Event OnInit()
	; Let the error potentially occur; can't afford for this to not happen.
	RegisterForModEvent("Campfire_Loaded", "OnCampfireLoaded")
	Wait(RandomFloat(3.0, 6.0))
	AttemptRegistration()
EndEvent

Event OnPlayerLoadGame()
	RegisterForModEvent("Campfire_Loaded", "OnCampfireLoaded")
	Wait(RandomFloat(3.0, 6.0))
	AttemptRegistration()
EndEvent

Event OnCampfireLoaded()
	campfire_is_loaded = true
endEvent

function AttemptRegistration()
	int i = 0
	while !campfire_is_loaded && i < 20
		Wait(0.5)
		i += 1
	endWhile

	GlobalVariable CampfireAPIVersion = Game.GetFormFromFile(0x03F1BE, "Campfire.esm") as GlobalVariable
	if CampfireAPIVersion && CampfireAPIVersion.GetValueInt() >= 4
		bool b = CampUtil.RegisterPerkTree(required_node_controller, mod_name)
	else
		debug.trace("[Campfire] ERROR: Unable to register Campfire Skill System for " + mod_name + ". Campfire was not found or the version loaded is not compatible. Expected API 4 or higher, got " + CampfireAPIVersion.GetValueInt())
	endif
	campfire_is_loaded = false
endFunction