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
	bool b = CampUtil.RegisterPerkTree(required_node_controller, mod_name)
endFunction