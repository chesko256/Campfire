Scriptname _Camp_CampCrimeOnlookerScript extends ReferenceAlias

Actor property PlayerRef auto
Scene property _Camp_CampingCrimeTrackingOnlookerScene auto

Event OnInit()
	if self.GetActorRef()
		TryToStartOnlookerScene()
	endif
EndEvent

function TryToStartOnlookerScene()
	debug.trace("[Campfire] Onlooker " + self.GetActorRef() + " hunting for player...")
	if self.GetActorRef().GetDistance(PlayerRef) <= 2048.0
		debug.trace("[Campfire] Found you!")
		_Camp_CampingCrimeTrackingOnlookerScene.Start()
	endif
endFunction