Scriptname _Camp_CreateItemScript extends ActiveMagicEffect

objectreference property _Camp_CraftingObjectREF auto
message property _Camp_GeneralError_Swimming auto
Actor property PlayerRef auto

Event OnInit()
	Craft()
endEvent

function Craft()
	_Camp_CraftingObjectREF.Activate(PlayerRef)
endFunction