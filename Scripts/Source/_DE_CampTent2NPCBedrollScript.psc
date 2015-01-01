Scriptname _DE_CampTent2NPCBedrollScript extends ObjectReference  

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_CampTent2NPCBedrollScript
; Attached To (EditorID)..: 
; Description ............: Shows the player a message when they try to use any bed roll other than their own.
; Author .................: Chesko
; Last Approved (version) : 2.6
; Status .................: Complete
; Remarks ................: Follower implementation in Frostfall 2.6.
; ===============================================================================================================================

;ObjectReference property myMaster auto
message property _DE_Tent_FollowerBedroll auto

Event OnInit()
	self.BlockActivation()
endEvent

;/event OnUpdate()
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(1)
	else
		(myMaster as _DE_Tent).DispatchSpareBedrollEvent(self, none, false)
	endif
endEvent/;

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef as Actor) == Game.GetPlayer()
		_DE_Tent_FollowerBedroll.Show()
	endif
	;/else
		(myMaster as _DE_Tent).DispatchSpareBedrollEvent(self, akActionRef, true)
		RegisterForSingleUpdate(1)	
	endif/;
endEvent

;/function SetMaster(ObjectReference akObject)
	myMaster = akObject
endFunction

ObjectReference function GetMaster()
	return myMaster
endFunction/;