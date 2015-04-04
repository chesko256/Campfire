Scriptname _Camp_CraftingObjectEffectScript extends ActiveMagicEffect

import debug 
import utility
objectreference property _Camp_CraftingObjectREF auto

Event OnInit()
    _Camp_CraftingObjectREF.Activate(Game.GetPlayer())
endEvent