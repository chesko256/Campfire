scriptname CampCampfire extends _Camp_PlaceableObjectBase

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

Light property FireAsset_LightSmall auto
Light property FireAsset_LightMed auto
Light property FireAsset_LightLarge auto

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
ObjectReference property myExtinguishSmoke auto hidden ;@TODO: might not need to place
ObjectReference property myLightSmall auto hidden
ObjectReference property myLightMed auto hidden
ObjectReference property myLightLarge auto hidden
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
ObjectReference property myExtinguishSmokeFuture auto hidden ;@TODO: might not need to place
ObjectReference property myLightSmallFuture auto hidden
ObjectReference property myLightMedFuture auto hidden
ObjectReference property myLightLargeFuture auto hidden
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

endFunction

function GetResults()

endFunction

function TakeDown()

endFunction

function ProcessOnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abBashAttack)

endFunction

function ProcessMagicEffect(ObjectReference akCaster, MagicEffect akEffect)

endFunction

State Lit

endState

State Unlit

endState