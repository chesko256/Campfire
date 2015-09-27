Scriptname _Camp_CraftingObjectEffectScript extends ActiveMagicEffect

import debug 
import utility
Actor property PlayerRef auto
objectreference property _Camp_CraftingObjectREF auto
message property _Camp_GeneralError_Mounted auto

Event OnInit()
	if !PlayerRef.IsOnMount()
    	_Camp_CraftingObjectREF.Activate(Game.GetPlayer())
    else
    	_Camp_GeneralError_Mounted.Show()
    endif
endEvent