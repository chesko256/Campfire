scriptname CampCampfire extends _Camp_PlaceableObjectBase

import _CampInternal

furniture property FireAsset_SitFurniture1 auto
furniture property FireAsset_SitFurniture2 auto
furniture property FireAsset_SitFurniture3 auto
furniture property FireAsset_SitFurniture4 auto

static property FireAsset_ClutterStatic1 auto
static property FireAsset_ClutterStatic2 auto
Activator property FireAsset_ClutterActivator1 auto
Activator property FireAsset_ClutterActivator2 auto
Furniture property FireAsset_ClutterFurniture1 auto
Furniture property FireAsset_ClutterFurniture2 auto

ObjectReference property PositionRef_SitFurniture1 auto
ObjectReference property PositionRef_SitFurniture2 auto
ObjectReference property PositionRef_SitFurniture3 auto
ObjectReference property PositionRef_SitFurniture4 auto
ObjectReference property PositionRef_ClutterStatic1 auto
ObjectReference property PositionRef_ClutterStatic2 auto
ObjectReference property PositionRef_ClutterActivator1 auto
ObjectReference property PositionRef_ClutterActivator2 auto
ObjectReference property PositionRef_ClutterFurniture1 auto
ObjectReference property PositionRef_ClutterFurniture2 auto

; PRIVATE
;Run-time objects
ObjectReference property myGroundArt auto hidden
ObjectReference property myFuelLit auto hidden
ObjectReference property myFuelUnlit auto hidden
ObjectReference property myEmbers auto hidden
ObjectReference property myAshes auto hidden
ObjectReference property myLight auto hidden
ObjectReference property myClutterStatic1 auto hidden
ObjectReference property myClutterStatic2 auto hidden
ObjectReference property myClutterActivator1 auto hidden
ObjectReference property myClutterActivator2 auto hidden
ObjectReference property myClutterFurniture1 auto hidden
ObjectReference property myClutterFurniture2 auto hidden

;Futures
ObjectReference property myGroundArtFuture auto hidden
ObjectReference property myFuelLitFuture auto hidden
ObjectReference property myFuelUnlitFuture auto hidden
ObjectReference property myEmbersFuture auto hidden
ObjectReference property myAshesFuture auto hidden
ObjectReference property myLightFuture auto hidden
ObjectReference property myClutterStatic1Future auto hidden
ObjectReference property myClutterStatic2Future auto hidden
ObjectReference property myClutterActivator1Future auto hidden
ObjectReference property myClutterActivator2Future auto hidden
ObjectReference property myClutterFurniture1Future auto hidden
ObjectReference property myClutterFurniture2Future auto hidden

Event OnActivate(ObjectReference akActionRef)
    ;Bring up campfire crafting menu
endEvent

Event OnUpdateGameTime()

endEvent

Event OnCellDetach()

endEvent

Event OnCellAttach()

endEvent

function PlaceObjects()
    ;Optional
    if FireAsset_SitFurniture1 && PositionRef_SitFurniture1
        PlaceObject_SitFurniture1()
    endif
    if FireAsset_SitFurniture2 && PositionRef_SitFurniture2
        PlaceObject_SitFurniture2()
    endif
    if FireAsset_SitFurniture3 && PositionRef_SitFurniture3
        PlaceObject_SitFurniture3()
    endif
    if FireAsset_SitFurniture4 && PositionRef_SitFurniture4
        PlaceObject_SitFurniture4()
    endif
    if FireAsset_ClutterStatic1 && PositionRef_ClutterStatic1
        PlaceObject_ClutterStatic1()
    endif
    if FireAsset_ClutterStatic2 && PositionRef_ClutterStatic2
        PlaceObject_ClutterStatic2()
    endif
    if FireAsset_ClutterActivator1 && PositionRef_ClutterActivator1
        PlaceObject_ClutterActivator1()
    endif
    if FireAsset_ClutterActivator2 && PositionRef_ClutterActivator2
        PlaceObject_ClutterActivator2()
    endif
    if FireAsset_ClutterFurniture1 && PositionRef_ClutterFurniture1
        PlaceObject_ClutterFurniture1()
    endif
    if FireAsset_ClutterFurniture2 && PositionRef_ClutterFurniture2
        PlaceObject_ClutterFurniture2()
    endif

    ;Required
    PlaceObject_myGroundArt()
    PlaceObject_myEmbers()
    PlaceObject_myAshes()
endFunction

function GetResults()
    if myGroundArtFuture
        myGroundArt = GetFuture(myGroundArtFuture).get_result()
    endif
    if myFuelLitFuture
        myFuelLit = GetFuture(myFuelLitFuture).get_result()
    endif
    if myFuelUnlitFuture
        myFuelUnlit = GetFuture(myFuelUnlitFuture).get_result()
    endif
    if myEmbersFuture
        myEmbers = GetFuture(myEmbersFuture).get_result()
    endif
    if myAshesFuture
        myAshes = GetFuture(myAshesFuture).get_result()
    endif
    if myLightFuture
        myLight = GetFuture(myLightFuture).get_result()
    endif
    if myClutterStatic1Future
        myClutterStatic1 = GetFuture(myClutterStatic1Future).get_result()
    endif
    if myClutterStatic2Future
        myClutterStatic2 = GetFuture(myClutterStatic2Future).get_result()
    endif
    if myClutterActivator1Future
        myClutterActivator1 = GetFuture(myClutterActivator1Future).get_result()
    endif
    if myClutterActivator2Future
        myClutterActivator2 = GetFuture(myClutterActivator2Future).get_result()
    endif
    if myClutterFurniture1Future
        myClutterFurniture1 = GetFuture(myClutterFurniture1Future).get_result()
    endif
    if myClutterFurniture2Future
        myClutterFurniture2 = GetFuture(myClutterFurniture2Future).get_result()
    endif
endFunction

function TakeDown()
    TryToDisableAndDeleteRef(myGroundArt)
    TryToDisableAndDeleteRef(myFuelLit)
    TryToDisableAndDeleteRef(myFuelUnlit)
    TryToDisableAndDeleteRef(myEmbers)
    TryToDisableAndDeleteRef(myAshes)
    TryToDisableAndDeleteRef(myLight)
    TryToDisableAndDeleteRef(myClutterStatic1)
    TryToDisableAndDeleteRef(myClutterStatic2)
    TryToDisableAndDeleteRef(myClutterActivator1)
    TryToDisableAndDeleteRef(myClutterActivator2)
    TryToDisableAndDeleteRef(myClutterFurniture1)
    TryToDisableAndDeleteRef(myClutterFurniture2)
endFunction

function PlaceObject_SitFurniture1()

endFunction
function PlaceObject_SitFurniture2()

endFunction
function PlaceObject_SitFurniture3()

endFunction
function PlaceObject_SitFurniture4()

endFunction
function PlaceObject_ClutterStatic1()

endFunction
function PlaceObject_ClutterStatic2()

endFunction
function PlaceObject_ClutterActivator1()

endFunction
function PlaceObject_ClutterActivator2()

endFunction
function PlaceObject_ClutterFurniture1()

endFunction
function PlaceObject_ClutterFurniture2()

endFunction
function PlaceObject_myGroundArt()

endFunction
function PlaceObject_myEmbers()

endFunction
function PlaceObject_myAshes()

endFunction

function ProcessOnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abBashAttack)

endFunction

function ProcessMagicEffect(ObjectReference akCaster, MagicEffect akEffect)

endFunction

State Lit

endState

State Unlit

endState