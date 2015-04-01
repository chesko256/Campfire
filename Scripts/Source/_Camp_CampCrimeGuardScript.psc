Scriptname _Camp_CampCrimeGuardScript extends ReferenceAlias  

import _CampInternal

Actor property PlayerRef auto
Scene property _Camp_CampingCrimeTrackingGuardScene auto
ReferenceAlias property IllegalItem1 auto
ReferenceAlias property IllegalItem2 auto
ReferenceAlias property IllegalItem3 auto

Event OnInit()
	if self.GetActorRef()
		RegisterForSingleUpdate(5)
	endif
EndEvent

Event OnUpdate()
	CampDebug(0, "Guard " + self.GetActorRef() + " hunting for player...")
	if self.GetActorRef().GetDistance(PlayerRef) <= 2048.0
		CampDebug(0, "Found you!")
		_Camp_CampingCrimeTrackingGuardScene.Start()
	elseif self.GetActorRef().GetDistance(PlayerRef) > 2048.0
		CampDebug(0, "Player is too far away, stop hunting.")
		StopHunting()
	elseif !IllegalItem1.GetRef() && !IllegalItem2.GetRef() && !IllegalItem3.GetRef()
		CampDebug(0, "No more illegal items, stop hunting.")
		StopHunting()
	else
		CampDebug(0, "Waiting...")
		RegisterForSingleUpdate(5)
	endif
EndEvent

function StopHunting()
	self.GetOwningQuest().Stop()
	IllegalItem1.Clear()
	IllegalItem2.Clear()
	IllegalItem3.Clear()
	self.Clear()
endFunction