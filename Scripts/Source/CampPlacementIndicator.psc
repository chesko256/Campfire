Scriptname CampPlacementIndicator extends ObjectReference

import utility
import math
import debug

_Camp_ObjectPlacementThreadManager property PlacementSystem auto hidden

form property myPlacedItem auto hidden

GlobalVariable property _Camp_CurrentlyPlacingObject auto
;GlobalVariable property _DE_SwimState auto
GlobalVariable property _Camp_Setting_Legality auto
GlobalVariable property _DE_Setting_Help auto
GlobalVariable property _DE_HelpDone_Visualize auto
GlobalVariable property _DE_Setting_SimplePlacement auto
GlobalVariable property _DE_HelpDone_PlacementError auto
ObjectReference property _Camp_IndicatorTriggerRef auto hidden

ObjectReference property _Camp_Anchor auto

message property myVisPrompt auto hidden
message property myRequirementErrorMsg auto hidden
message property _DE_CampVisIllegal auto
message property _DE_Help_Visualize auto
message property _DE_Placement_Cancelled auto
message property _DE_Placement_Cancelled_CollisionBug auto

float fLastUpdateTime
float fUpdateSpeed = 0.5
int iSlowUpdateCounter

Event OnInit()
	PlacementSystem = CampUtil.GetPlacementSystem()
	myVisPrompt = _DE_CampVisPrompt_Tent
	myTrigger = _DE_CampVisTrigger_TentREF
	myInvItem = _DE_CampTentHideLarge_1BR
	myPlacedItem = _DE_CampTent2_LargeHide1BRACT
	
	StartPlacement()
	
endEvent

Event OnUpdate()
	
	PerformPlacement(400.0, _DE_HeatSources_All, 1.0, -180.0, 400.0)
	
endEvent

function StartPlacement()
	;#Help Text=========================
	bool bShowHelp = _DE_HelpDone_Visualize.GetValueInt() == 1 && _DE_Setting_Help.GetValueInt() == 2
	if bShowHelp
		_DE_Help_Visualize.Show()
		_DE_HelpDone_Visualize.SetValue(2)
	endif
	;#Help Text=========================
	self.SetAngle(0.0, 0.0, 0.0)
	_Camp_CurrentlyPlacingObject.SetValue(2)
	_Camp_IndicatorTriggerRef.MoveTo(PlayerRef)
	RegisterForSingleUpdate(fUpdateSpeed)
endFunction

function PerformPlacement(float fDistance, float fHeight = 1.0, float fRot = 0.0, float fHeatDist = 0.0, bool bLockToPlayer = false)
	bool keep_updating = PlacementSystem.PerformPlacement()
	if keep_updating
		RegisterForSingleUpdate(fUpdateSpeed)
	endif
endFunction

function StopPlacement()
	_Camp_IndicatorTriggerRef.MoveTo(_DE_Anchor)
	_DE_ZTestShooterREFA.MoveTo(_DE_Anchor)
	_DE_ZTestReceiverREFA.MoveTo(_DE_Anchor)
	Legal.GetCampingLegalStop()
	self.Disable()
	self.Delete()
endFunction

function GiveBackItem()
	if myInvItem
		PlayerRef.AddItem(myInvItem, abSilent = true)
	endif
endFunction