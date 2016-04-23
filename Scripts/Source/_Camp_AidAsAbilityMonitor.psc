scriptname _Camp_AidAsAbilityMonitor extends ReferenceAlias

import CampUtil

Actor property PlayerRef auto
Message property _Camp_CampsiteExitPipboy auto
Potion property _Camp_SurvivalSkillBuildCampsiteAid auto
Activator property _Camp_CampsiteIndicator auto

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject == _Camp_SurvivalSkillBuildCampsiteAid
		if PlayerCanPlaceObjects()
			if Utility.IsInMenuMode()
				_Camp_CampsiteExitPipboy.Show()
			endif
			; Block until exit menu
			Utility.Wait(0.5)
			if PlayerRef.GetItemCount(_Camp_SurvivalSkillBuildCampsiteAid) == 0
				; Shouldn't ever happen because item is a quest object, but, just in case
				PlayerRef.AddItem(_Camp_SurvivalSkillBuildCampsiteAid, 1, true)
			endif
			CampUtil.GetPlacementSystem().PlaceableObjectUsed(none,   						\
                                                              _Camp_CampsiteIndicator, 		\
										  					  none,							\
										  					  none,							\
										  					  0,							\
										  					  none,               			\
                                                              "", 				    		\
                                                              "",						 	\
                                                              "")
		else
			if PlayerRef.GetItemCount(_Camp_SurvivalSkillBuildCampsiteAid) == 0
				PlayerRef.AddItem(_Camp_SurvivalSkillBuildCampsiteAid, 1, true)
			endif
		endif
	endif
EndEvent