Scriptname _Camp_WoodHarvestingQuestScript extends Quest  

import math

ObjectReference property _Camp_HarvestDeadwoodAct_AspenLogRef1 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenLogRef2 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenLogRef3 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenLogRef4 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenLogRef5 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenLogRef6 auto

ObjectReference property _Camp_HarvestDeadwoodAct_AspenStumpRef1 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenStumpRef2 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenStumpRef3 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenStumpRef4 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenStumpRef5 auto
ObjectReference property _Camp_HarvestDeadwoodAct_AspenStumpRef6 auto

ObjectReference property _Camp_HarvestDeadwoodAct_PineLogSmRef1 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineLogSmRef2 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineLogSmRef3 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineLogSmRef4 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineLogSmRef5 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineLogSmRef6 auto

ObjectReference property _Camp_HarvestDeadwoodAct_PineStumpRef1 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineStumpRef2 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineStumpRef3 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineStumpRef4 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineStumpRef5 auto
ObjectReference property _Camp_HarvestDeadwoodAct_PineStumpRef6 auto

GlobalVariable property _Camp_Setting_DynamicWoodHarvesting auto
ObjectReference property _Camp_WoodHarvestAnchor auto
Actor property PlayerRef auto
float prev_x
float prev_y

Event OnInit()
	RegisterForSingleUpdate(5)
EndEvent

Event OnUpdate()
	float pos_x = PlayerRef.GetPositionX()
	float pos_y = PlayerRef.GetPositionY()
	float x_len = abs(prev_x - pos_x)
	float y_len = abs(prev_y - pos_y)
	float dist = abs(sqrt(pow(x_len, 2.0) + pow(y_len, 2.0)))
	debug.trace("[Campfire] Dist: " + dist)

	if (dist >= 1000.0 || dist >= 100.0 && (PlayerRef.IsRunning() || PlayerRef.IsSprinting()))
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

function RaiseEvent_WoodActivatorReset()
	int handle = ModEvent.Create("Campfire_WoodActivatorReset")
	if handle
		ModEvent.Send(handle)
	endif
endFunction