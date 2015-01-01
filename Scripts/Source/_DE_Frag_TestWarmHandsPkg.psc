;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname _DE_Frag_TestWarmHandsPkg Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
;debug.trace("[Frostfall] Follower attempting idle")
if akActor == StaticFollower1.GetActorRef()
	if _DE_FollowerAnimLock1.GetValueInt() == 1
		int i = Utility.RandomInt(0, 99)
		if i <= 49
			akActor.PlayIdle(IdleWarmHandsStanding)
		else
			akActor.PlayIdle(IdleWarmHandsCrouched)
		endif
		_DE_FollowerAnimLock1.SetValueInt(2)
	endif
elseif akActor == StaticFollower2.GetActorRef()
	if _DE_FollowerAnimLock2.GetValueInt() == 1
		int i = Utility.RandomInt(0, 99)
		if i <= 49
			akActor.PlayIdle(IdleWarmHandsStanding)
		else
			akActor.PlayIdle(IdleWarmHandsCrouched)
		endif
		_DE_FollowerAnimLock2.SetValueInt(2)
	endif
elseif akActor == StaticFollower3.GetActorRef()
	if _DE_FollowerAnimLock3.GetValueInt() == 1
		int i = Utility.RandomInt(0, 99)
		if i <= 49
			akActor.PlayIdle(IdleWarmHandsStanding)
		else
			akActor.PlayIdle(IdleWarmHandsCrouched)
		endif
		_DE_FollowerAnimLock3.SetValueInt(2)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
;debug.trace("[Frostfall] Follower warm hands package finished")
akActor.PlayIdle(IdleStop_Loose)
if akActor == StaticFollower1.GetActorRef()
	_DE_FollowerAnimLock1.SetValueInt(1)
elseif akActor == StaticFollower2.GetActorRef()
	_DE_FollowerAnimLock2.SetValueInt(1)
elseif akActor == StaticFollower3.GetActorRef()
	_DE_FollowerAnimLock3.SetValueInt(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
;debug.trace("[Frostfall] Follower warm hands package start")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property IdleWarmHandsCrouched  Auto  

Idle Property IdleWarmHandsStanding  Auto  

Idle Property IdleStop_Loose  Auto  

ReferenceAlias Property StaticFollower1  Auto  

ReferenceAlias Property StaticFollower2  Auto  

ReferenceAlias Property StaticFollower3  Auto  

GlobalVariable Property _DE_FollowerAnimLock1  Auto  

GlobalVariable Property _DE_FollowerAnimLock2  Auto  

GlobalVariable Property _DE_FollowerAnimLock3  Auto  
