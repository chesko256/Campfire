;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname _DE_Frag_DogLayByFire Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
debug.trace("[Frostfall] Dog attempting idle")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
debug.trace("[Frostfall] Dog lay down package finished")
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
