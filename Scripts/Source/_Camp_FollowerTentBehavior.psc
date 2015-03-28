scriptname _Camp_FollowerTentBehavior extends ReferenceAlias

Event OnInit()
    debug.trace("[Campfire] Just initialized " + self.GetActorRef() + " as my alias.")
    utility.wait(0.2)
    if self.GetActorRef()
        self.GetActorRef().EvaluatePackage()
    endif
EndEvent