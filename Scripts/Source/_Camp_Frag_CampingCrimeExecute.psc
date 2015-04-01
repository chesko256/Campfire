;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname _Camp_Frag_CampingCrimeExecute Extends Scene Hidden

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
_CampInternal.CampDebug(0, "Phase 3 start.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
_CampInternal.CampDebug(0, "The guard arrest scene ended.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
_CampInternal.CampDebug(0, "Phase 4 start.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
IllegalItem3.GetRef().PlaceAtMe(CampUtil.GetPlacementSystem().FallingDustExplosion01)
(IllegalItem3.GetRef() as _Camp_PlaceableObjectBase).GuardDestroy()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
_CampInternal.CampDebug(0, "The player removed the offending items. Aborting.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
_CampInternal.CampDebug(0, "Phase 1 start (roaming to player).")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
IllegalItem1.GetRef().PlaceAtMe(CampUtil.GetPlacementSystem().FallingDustExplosion01)
(IllegalItem1.GetRef() as _Camp_PlaceableObjectBase).GuardDestroy()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
_CampInternal.CampDebug(0, "Phase 2 start.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
_CampInternal.CampDebug(0, "The guard arrest scene began.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
_CampInternal.CampDebug(0, "Phase 7 start.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
_CampInternal.CampDebug(0, "The player left the area. Aborting.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
IllegalItem2.GetRef().PlaceAtMe(CampUtil.GetPlacementSystem().FallingDustExplosion01)
(IllegalItem2.GetRef() as _Camp_PlaceableObjectBase).GuardDestroy()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
_CampInternal.CampDebug(0, "Phase 6 start.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
_CampInternal.CampDebug(0, "Phase 5 start.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
_CampInternal.CampDebug(0, "The player failed to comply. Giving fine.")
Guard.GetActorRef().SendTrespassAlarm(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Guard  Auto  

ReferenceAlias Property IllegalItem1  Auto  

ReferenceAlias Property IllegalItem2  Auto  

ReferenceAlias Property IllegalItem3  Auto  
