Scriptname _Camp_WoodActivatorScript extends ObjectReference  

import _CampInternal
import CampUtil
import Utility

Actor property PlayerRef auto
Idle property IdleWipeBrow auto
Idle property IdleStop_Loose auto
Idle property IdleStudy auto
Spell property _Camp_ChoppingAxeDisplay auto
Imagespacemodifier property _Camp_FadeDown auto
Imagespacemodifier property _Camp_Black auto
Imagespacemodifier property _Camp_FadeUp auto
FormList property woodChoppingAxes auto
Message property WoodChoppingFailureMessage auto
Sound property _Camp_ChopWoodSM auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		if PlayerRef.GetItemCount(woodChoppingAxes) == 0
			WoodChoppingFailureMessage.Show()
			return
		endif

		bool was_first_person = False
		if PlayerRef.GetAnimationVariableBool("IsFirstPerson")
			was_first_person = True
			Game.ForceThirdPerson()
		endif

		Game.DisablePlayerControls()
		wait(0.2)
		PlayerRef.PlayIdle(IdleStudy)
		wait(0.5)
		;_Camp_FadeDown.Apply()
		wait(0.5)
		;_Camp_FadeDown.PopTo(_Camp_Black)
		PlayerRef.PlayIdle(IdleStop_Loose)
		_Camp_ChopWoodSM.Play(PlayerRef)
		wait(1.5)
		PlayerRef.AddSpell(_Camp_ChoppingAxeDisplay, false)
		_Camp_ChopWoodSM.Play(PlayerRef)
		wait(1.5)
		debug.notification("Turn tree into logs (smack smack smack)...")
		_Camp_ChopWoodSM.Play(PlayerRef)
		wait(1.5)
		;_Camp_Black.PopTo(_Camp_FadeUp)
		wait(0.5)
		PlayerRef.PlayIdle(IdleWipeBrow)
		wait(2.2)
		PlayerRef.PlayIdle(IdleStop_Loose)
		wait(0.5)
		Game.EnablePlayerControls()
		PlayerRef.RemoveSpell(_Camp_ChoppingAxeDisplay)
		
		if was_first_person
			Game.ForceFirstPerson()
		endif
	endif
EndEvent

function WaitUntilSitState(int SitState)
	int i = 0
	while PlayerRef.GetSitState() != SitState && i < 50
		wait(0.1)
		i += 1
	endWhile
endFunction