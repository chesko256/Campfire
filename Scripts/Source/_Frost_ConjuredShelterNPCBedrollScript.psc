Scriptname _Frost_ConjuredShelterNPCBedrollScript extends ObjectReference  

import CampUtil
import _CampInternal

; Resolved in CK
bool property is_bed = true auto
Actor property PlayerRef auto
message property _Camp_Tent_FollowerBedroll auto
message property _Frost_Shelter_FollowerBed auto

; Set by _Frost_ConjuredShelter at runtime
_Frost_ConjuredShelter property ShelterObject auto hidden

Actor my_actor

Event OnInit()
	self.BlockActivation()
endEvent

Event OnActivate(ObjectReference akActionRef)
	CampDebug(0, "Activated by " + akActionRef)
	if (akActionRef as Actor) == PlayerRef
		if is_bed
			_Frost_Shelter_FollowerBed.Show()
		else
			_Camp_Tent_FollowerBedroll.Show()
		endif
	elseif IsTrackedFollower(akActionRef as Actor)
		self.BlockActivation(false)
		utility.wait(0.2)
		my_actor = akActionRef as Actor
		CampDebug(0, "OnActivate my_actor " + my_actor)
		self.Activate(my_actor)
		utility.wait(0.5)
		self.BlockActivation()
	endif
endEvent
