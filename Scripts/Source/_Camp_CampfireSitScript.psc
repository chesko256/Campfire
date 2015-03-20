Scriptname _Camp_CampfireSitScript extends ObjectReference  

bool was_first_person = false

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if Game.GetPlayer().GetAnimationVariableBool("IsFirstPerson")
			was_first_person = True
			Game.ForceThirdPerson()
		endif

		Game.DisablePlayerControls(abCamSwitch = true)
		utility.wait(2.0)
		
		while self.IsFurnitureInUse()
			utility.wait(0.2)
		endWhile
		
		Game.EnablePlayerControls()

		if was_first_person
			Game.ForceFirstPerson()
		endif
	endif
EndEvent