Scriptname _DE_FollowerAliasScript extends ReferenceAlias  

Event OnInit()
	ObjectReference mySelf = self.GetReference()
	if mySelf
		;debug.trace("[Frostfall] Follower Alias " + self.GetName() + ": Alias filled! Ref: " + mySelf)
	else
		;debug.trace("[Frostfall] Follower Alias: Self equals NONE, aborting!")
	endif
	;debug.trace("[Frostfall] Follower Alias: Done!")
endEvent