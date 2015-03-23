Scriptname _Frost_WoodHarvestingQuestScript extends Quest  

import math

GlobalVariable property _Camp_Setting_DynamicWoodHarvesting auto
ObjectReference property _Camp_WoodHarvestAnchor auto
FormList property _Camp_WoodHarvestActivators auto
Actor property PlayerRef auto
bool looking_at_node = false
float prev_x
float prev_y

Event OnInit()
	RegisterForSingleUpdate(7)
	RegisterForCrosshairRef()
EndEvent

Event OnUpdate()
	float pos_x = PlayerRef.GetPositionX()
	float pos_y = PlayerRef.GetPositionY()
	float x_len = abs(prev_x - pos_x)
	float y_len = abs(prev_y - pos_y)
	float dist = abs(sqrt(pow(x_len, 2.0) + pow(y_len, 2.0)))
	debug.trace("[Campfire] Dist: " + dist)

	if looking_at_node
		debug.trace("[Campfire] Player looking at node; standing by...")
	elseif (dist >= 1000.0 || dist >= 100.0 && (PlayerRef.IsRunning() || PlayerRef.IsSprinting()))
		debug.trace("[Campfire] Refreshing wood aliases.")
		RaiseEvent_WoodActivatorReset()
		self.Stop()
		int i = 0
		while !self.IsStopped() && i < 50
			utility.wait(0.1)
		endWhile
		self.Start()
		prev_x = pos_x
		prev_y = pos_y
	else
		debug.trace("[Campfire] Player didn't move; standing by...")
	endif
	;@TODO
	;if _Camp_Setting_DynamicWoodHarvesting.GetValueInt() == 2
		RegisterForSingleUpdate(5)
	;endif
EndEvent

Event OnCrosshairRefChange(ObjectReference ref)
	if ref && _Camp_WoodHarvestActivators.HasForm(ref.GetBaseObject())
		looking_at_node = true
	else
		looking_at_node = false
	endif
EndEvent

function RaiseEvent_WoodActivatorReset()
	int handle = ModEvent.Create("Campfire_WoodActivatorReset")
	if handle
		ModEvent.Send(handle)
	endif
endFunction