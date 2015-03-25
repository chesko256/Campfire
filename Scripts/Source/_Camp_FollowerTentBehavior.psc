scriptname _Camp_FollowerTentBehavior extends ReferenceAlias

Event OnInit()
    debug.trace("[Campfire] Just initialized " + self.GetActorRef() + " as my alias.")
    if self.GetActorRef()
        self.GetActorRef().EvaluatePackage()
    endif
EndEvent