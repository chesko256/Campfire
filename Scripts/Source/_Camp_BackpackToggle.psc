scriptname _Camp_BackpackToggle extends ObjectReference

import utility

GlobalVariable property _Camp_BackpackDisplayReset auto

Event OnEquipped(Actor akActor)
	if IsInMenuMode()
		wait(0.1)
		_Camp_BackpackDisplayReset.SetValueInt(1)
		wait(1)
		_Camp_BackpackDisplayReset.SetValueInt(2)
	endif
endEvent