Scriptname _Camp_WoodActivatorScript extends ObjectReference  

import _CampInternal

Actor property PlayerRef auto
Furniture property _Camp_LogChoppingFurniture auto

Event OnInit()
	Game.ForceThirdPerson()
	debug.SendAnimationEvent(PlayerRef, "attackPowerStartInPlace")
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		;ObjectReference f = PlaceAndWaitFor3DLoaded(PlayerRef, _Camp_LogChoppingFurniture)
		;f.Activate(PlayerRef)
		;utility.wait(1)
		debug.SendAnimationEvent(PlayerRef, "IdleExecutionerIdleEnterInstant")
		;debug.SendAnimationEvent(PlayerRef, "AnimObjectUnequip")
	endif
EndEvent