scriptname CampPerkSystemRegister extends ReferenceAlias

import Utility

Activator property required_node_controller auto
{ The node controller to register on startup. }
String property mod_name = "Unknown" auto
{ Optional: The name of the mod / plug-in. Displayed only in Papyrus log. }

Event OnInit()
	Wait(RandomFloat(3.0, 6.0))
	AttemptRegistration()
EndEvent

Event OnPlayerLoadGame()
	Wait(RandomFloat(3.0, 6.0))
	AttemptRegistration()
EndEvent

function AttemptRegistration()
	GlobalVariable campfire_version = Game.GetFormFromFile(0x051666, "Campfire.esm") as GlobalVariable
	if campfire_version && campfire_version.GetValue() >= 1.7
		bool b = CampUtil.RegisterPerkTree(required_node_controller, mod_name)
	else
		debug.trace("[Campfire] ERROR: Unable to register Campfire Skill System for " + mod_name + ". Campfire was not found or the version loaded is not compatible. Expected 1.7 or higher, got " + campfire_version.GetValue())
	endif
endFunction