Scriptname _DE_SurvivalSkillsScript extends ActiveMagicEffect

import debug 
import utility
objectreference property _DE_CraftingObjectREF auto
GlobalVariable property _DE_SwimState auto
message property _DE_SurvivalSkillsSwimmingError auto

Event OnInit()
	Craft()
endEvent

function Craft()
	
	_DE_CraftingObjectREF.Activate(Game.GetPlayer())
	
endFunction