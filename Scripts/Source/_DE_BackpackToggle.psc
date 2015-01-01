scriptname _DE_BackpackToggle extends ObjectReference

import debug
import utility

GlobalVariable property _DE_BackpackDisplayReset auto

Event OnEquipped(Actor akActor)
	if IsInMenuMode()
		wait(0.1)
		_DE_BackpackDisplayReset.SetValueInt(1)
		wait(1)
		_DE_BackpackDisplayReset.SetValueInt(2)
	endif
endEvent