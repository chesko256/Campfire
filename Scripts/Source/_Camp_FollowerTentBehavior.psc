scriptname _Camp_FollowerTentBehavior extends ReferenceAlias

import _CampInternal

Event OnInit()
    CampDebug(0, "Just initialized " + self.GetActorRef() + " as my alias.")
    utility.wait(0.2)
    if self.GetActorRef()
        self.GetActorRef().EvaluatePackage()
    endif
EndEvent