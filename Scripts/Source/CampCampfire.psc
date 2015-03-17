;/********s* _Camp_PlaceableObjectBase/CampCampfire
* SCRIPTNAME
*/;
scriptname CampCampfire extends _Camp_PlaceableObjectBase
;/*
* OVERVIEW
* Attach this script to a Furniture object that will become a campfire. Works like other
* placeable objects, but contains logic specific to campfires.
;*********/;

import _CampInternal

; OPTIONAL PROPERTIES

;/********p* CampCampfire/FireAsset_SitFurniture1
* SYNTAX
*/;
furniture property FireAsset_SitFurniture1 auto
;/*
* DESCRIPTION
{ Optional: An optional furniture to sit on. }
;*********/;

;/********p* CampCampfire/FireAsset_SitFurniture2
* SYNTAX
*/;
furniture property FireAsset_SitFurniture2 auto
;/*
* DESCRIPTION
{ Optional: An optional furniture to sit on. }
;*********/;

;/********p* CampCampfire/FireAsset_SitFurniture3
* SYNTAX
*/;
furniture property FireAsset_SitFurniture3 auto
;/*
* DESCRIPTION
{ Optional: An optional furniture to sit on. }
;*********/;

;/********p* CampCampfire/FireAsset_SitFurniture4
* SYNTAX
*/;
furniture property FireAsset_SitFurniture4 auto
;/*
* DESCRIPTION
{ Optional: An optional furniture to sit on. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterStatic1
* SYNTAX
*/;
static property FireAsset_ClutterStatic1 auto
;/*
* DESCRIPTION
{ Optional: A static to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterStatic2
* SYNTAX
*/;
static property FireAsset_ClutterStatic2 auto
;/*
* DESCRIPTION
{ Optional: A static to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterActivator1
* SYNTAX
*/;
Activator property FireAsset_ClutterActivator1 auto
;/*
* DESCRIPTION
{ Optional: An activator to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterActivator2
* SYNTAX
*/;
Activator property FireAsset_ClutterActivator2 auto
;/*
* DESCRIPTION
{ Optional: An activator to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterFurniture1
* SYNTAX
*/;
Furniture property FireAsset_ClutterFurniture1 auto
;/*
* DESCRIPTION
{ Optional: A furniture to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterFurniture2
* SYNTAX
*/;
Furniture property FireAsset_ClutterFurniture2 auto
;/*
* DESCRIPTION
{ Optional: A furniture to place in or around the fire. }
;*********/;

;/********p* CampCampfire/RequiredPositionRef_CampfireBase
* SYNTAX
*/;
ObjectReference property RequiredPositionRef_CampfireBase auto
;/*
* DESCRIPTION
{ Optional: Position reference of the campfire base. }
;*********/;

;/********p* CampCampfire/PositionRef_SitFurniture1
* SYNTAX
*/;
ObjectReference property PositionRef_SitFurniture1 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the sit furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_SitFurniture2
* SYNTAX
*/;
ObjectReference property PositionRef_SitFurniture2 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the sit furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_SitFurniture3
* SYNTAX
*/;
ObjectReference property PositionRef_SitFurniture3 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the sit furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_SitFurniture4
* SYNTAX
*/;
ObjectReference property PositionRef_SitFurniture4 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the sit furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterStatic1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic1 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the clutter static. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterStatic2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic2 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the clutter static. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterActivator1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator1 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the clutter activator. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterActivator2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator2 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the clutter activator. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterFurniture1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture1 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the clutter furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterFurniture2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture2 auto
;/*
* DESCRIPTION
{ Optional: Position reference of the clutter furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_CookPotSnapMarker
* SYNTAX
*/;
ObjectReference property PositionRef_CookPotSnapMarker auto
;/*
* DESCRIPTION
{ Optional: Position reference of the cook pot snap marker. }
;*********/;

; PRIVATE
;Common objects
Activator property _Camp_Campfire_Embers auto
Activator property _Camp_Campfire_Ashes auto
Static property _Camp_CampfireCookPotSnapMarker auto
Message property _Camp_Campfire_Menu auto
Message property _Camp_Campfire_SitError auto
Actor property PlayerRef auto
GlobalVariable property _Camp_LastUsedCampfireSize auto
GlobalVariable property _Camp_LastUsedCampfireStage auto

;Run-time objects
;ObjectReference property myGroundArt auto hidden
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
ObjectReference property mySitFurniture1 auto hidden
ObjectReference property mySitFurniture2 auto hidden
ObjectReference property mySitFurniture3 auto hidden
ObjectReference property mySitFurniture4 auto hidden
ObjectReference property myCookPotSnapMarker auto hidden

;Futures
;ObjectReference property myGroundArtFuture auto hidden
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
ObjectReference property mySitFurniture1Future auto hidden
ObjectReference property mySitFurniture2Future auto hidden
ObjectReference property mySitFurniture3Future auto hidden
ObjectReference property mySitFurniture4Future auto hidden
ObjectReference property myCookPotSnapMarkerFuture auto hidden

int EMBERS_DURATION = 2
int ASH_DURATION = 24

bool adding_fuel = false
bool eligible_for_deletion = false

int property campfire_stage = 0 auto hidden                 ;0 = empty or ash, 1 = embers, 2 = burning, 3 = unlit fuel
int property campfire_size = 0 auto hidden                  ;0 = not built, 1 = fragile, 2 = flickering, 3 = crackling, 4 = roaring
float last_update_registration_time     ;when this campfire last registered
int burn_duration                       ;how long this campfire will burn (set by fuel)
float remaining_time                    ;total time this campfire will last

function Initialize()
    self.BlockActivation()
    parent.Initialize()
endFunction

Event OnActivate(ObjectReference akActionRef)
    SetLastUsedCampfire(self)
    _Camp_LastUsedCampfireSize.SetValueInt(campfire_size)
    _Camp_LastUsedCampfireStage.SetValueInt(campfire_stage)

    if !adding_fuel
        int i = _Camp_Campfire_Menu.Show()
        if i == 0
            adding_fuel = true
            self.BlockActivation(false)
            self.Activate(PlayerRef)
            while self.IsFurnitureInUse()
                utility.wait(0.1)
            endWhile
            self.BlockActivation()
            adding_fuel = false
        elseif i == 1
            ;Sit
            SitDown()
        elseif i == 2
            ;Destroy
            TakeDown()
        elseif i == 3
            ;Cancel
        endif
    endif
endEvent

Event OnCellDetach()
    if eligible_for_deletion
        TakeDown()
    endif
endEvent

function PlaceObjects()
    CenterObject = RequiredPositionRef_CampfireBase
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
    ;PlaceObject_myGroundArt()
    PlaceObject_myEmbers()
    PlaceObject_myAshes()
    PlaceObject_myCookPotSnapMarker()
endFunction

function GetResults()
    ;if myGroundArtFuture
    ;    myGroundArt = GetFuture(myGroundArtFuture).get_result()
    ;endif
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
    if mySitFurniture1Future
        mySitFurniture1 = GetFuture(mySitFurniture1Future).get_result()
    endif
    if mySitFurniture2Future
        mySitFurniture2 = GetFuture(mySitFurniture2Future).get_result()
    endif
    if mySitFurniture3Future
        mySitFurniture3 = GetFuture(mySitFurniture3Future).get_result()
    endif
    if mySitFurniture4Future
        mySitFurniture4 = GetFuture(mySitFurniture4Future).get_result()
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
    if myCookPotSnapMarkerFuture
        myCookPotSnapMarker = GetFuture(myCookPotSnapMarkerFuture).get_result()
    endif
endFunction

function TakeDown()
    ;TryToDisableAndDeleteRef(myGroundArt)
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
    TryToDisableAndDeleteRef(myCookPotSnapMarker)
    TryToDisableAndDeleteRef(mySitFurniture1)
    TryToDisableAndDeleteRef(mySitFurniture2)
    TryToDisableAndDeleteRef(mySitFurniture3)
    TryToDisableAndDeleteRef(mySitFurniture4)
    TryToDisableAndDeleteRef(self)
endFunction

function PlaceObject_SitFurniture1()
    mySitFurniture1Future = PlacementSystem.PlaceObject(self, FireAsset_SitFurniture1, PositionRef_SitFurniture1)
endFunction
function PlaceObject_SitFurniture2()
    mySitFurniture2Future = PlacementSystem.PlaceObject(self, FireAsset_SitFurniture2, PositionRef_SitFurniture2)
endFunction
function PlaceObject_SitFurniture3()
    mySitFurniture3Future = PlacementSystem.PlaceObject(self, FireAsset_SitFurniture3, PositionRef_SitFurniture3)
endFunction
function PlaceObject_SitFurniture4()
    mySitFurniture4Future = PlacementSystem.PlaceObject(self, FireAsset_SitFurniture4, PositionRef_SitFurniture4)
endFunction
function PlaceObject_ClutterStatic1()
    myClutterStatic1Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterStatic1, PositionRef_ClutterStatic1)
endFunction
function PlaceObject_ClutterStatic2()
    myClutterStatic2Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterStatic2, PositionRef_ClutterStatic2)
endFunction
function PlaceObject_ClutterActivator1()
    myClutterActivator1Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterActivator1, PositionRef_ClutterActivator1)
endFunction
function PlaceObject_ClutterActivator2()
    myClutterActivator2Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterActivator2, PositionRef_ClutterActivator2)
endFunction
function PlaceObject_ClutterFurniture1()
    myClutterFurniture1Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterFurniture1, PositionRef_ClutterFurniture1)
endFunction
function PlaceObject_ClutterFurniture2()
    myClutterFurniture2Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterFurniture2, PositionRef_ClutterFurniture2)
endFunction
;function PlaceObject_myGroundArt()
;    myGroundArt = PlacementSystem.PlaceObject(self, FireAsset_GroundArt, PositionRef_GroundArt)
;endFunction
function PlaceObject_myEmbers()
    myEmbersFuture = PlacementSystem.PlaceObject(self, _Camp_Campfire_Embers, RequiredPositionRef_CampfireBase, initially_disabled=true)
endFunction
function PlaceObject_myAshes()
    myAshesFuture = PlacementSystem.PlaceObject(self, _Camp_Campfire_Ashes, RequiredPositionRef_CampfireBase, initially_disabled=true)
endFunction
function PlaceObject_myCookPotSnapMarker()
    myCookPotSnapMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_CampfireCookPotSnapMarker, PositionRef_CookPotSnapMarker)
endFunction

function ProcessOnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abBashAttack)

endFunction

function ProcessMagicEffect(ObjectReference akCaster, MagicEffect akEffect)

endFunction

function SetFuel(Activator akFuelLit, Activator akFuelUnlit, Light akLight, int aiBurnDuration)
    debug.trace("[Campfire] Fuel set: " + akFuelLit + "," + akFuelUnlit + "," + akLight)
    burn_duration = aiBurnDuration
    myFuelUnlit = self.PlaceAtMe(akFuelUnlit, abInitiallyDisabled = true)
    myFuelLit = self.PlaceAtMe(akFuelLit, abInitiallyDisabled = true)
    myLight = self.PlaceAtMe(akLight, abInitiallyDisabled = true)
    myLight.MoveTo(myLight, afZOffset = 100.0)
    campfire_stage = 3

    ;@TODO: If manual lighting,
        ;
        ;
    ;else,
        LightFire()
        _Camp_LastUsedCampfireStage.SetValueInt(2)
    ;endif
endFunction

function SitDown()
    ObjectReference[] mySitMarkers = new ObjectReference[4]
    mySitMarkers[0] = mySitFurniture1
    mySitMarkers[1] = mySitFurniture2
    mySitMarkers[2] = mySitFurniture3
    mySitMarkers[3] = mySitFurniture4
    mySitMarkers = SelectionSort(mySitMarkers)

    if !(mySitMarkers[0].IsFurnitureInUse())
        mySitMarkers[0].Activate(PlayerRef)
    elseif !(mySitMarkers[1].IsFurnitureInUse())
        mySitMarkers[1].Activate(PlayerRef)
    elseif !(mySitMarkers[2].IsFurnitureInUse())
        mySitMarkers[2].Activate(PlayerRef)
    elseif !(mySitMarkers[3].IsFurnitureInUse())
        mySitMarkers[3].Activate(PlayerRef)
    else
        ;There is nowhere to sit.
        _Camp_Campfire_SitError.Show()
    endif
endFunction

;Add a stage for just lit but no ash, then turn on ash after 15 in-game minutes

function LightFire()
    debug.trace("[Campfire] LightFire")
    myFuelUnlit.DisableNoWait()
    myFuelLit.EnableNoWait()
    myLight.EnableNoWait()
    RegisterForSingleUpdateGameTime(burn_duration)
    last_update_registration_time = Utility.GetCurrentGameTime()
    remaining_time = burn_duration + EMBERS_DURATION + ASH_DURATION
    campfire_stage = 3
endFunction

function BurnToEmbers()
    debug.trace("[Campfire] BurnToEmbers")
    myFuelUnlit.DisableNoWait(true)
    myFuelLit.DisableNoWait(true)
    myLight.DisableNoWait(true)
    myEmbers.EnableNoWait()
    myAshes.EnableNoWait()
    last_update_registration_time = Utility.GetCurrentGameTime()
    RegisterForSingleUpdateGameTime(remaining_time - ASH_DURATION)
    campfire_stage = 2
endFunction

function BurnToAshes()
    debug.trace("[Campfire] BurnToAshes")
    myFuelUnlit.DisableNoWait(true)
    myFuelLit.DisableNoWait(true)
    myLight.DisableNoWait()
    myEmbers.DisableNoWait(true)
    myAshes.EnableNoWait()
    last_update_registration_time = Utility.GetCurrentGameTime()
    RegisterForSingleUpdateGameTime(remaining_time)
    campfire_stage = 1
endFunction

Event OnUpdateGameTime()
    utility.wait(0.1)
    float this_time = (Utility.GetCurrentGameTime() * 24.0)
    float time_delta = this_time - (last_update_registration_time * 24.0)
    remaining_time -= time_delta
    debug.trace("[Campfire] Remaining time " + remaining_time)

    if remaining_time < 1
        TakeDown()
    else
        if remaining_time <= ASH_DURATION
            BurnToAshes()
        elseif remaining_time <= (ASH_DURATION + EMBERS_DURATION)
            BurnToEmbers()
        endif
    endif
endEvent

ObjectReference[] function SelectionSort(ObjectReference[] array)
    ;From https://en.wikipedia.org/wiki/Selection_sort, converted to Papyrus
    int i
    int j = 0
    int iMin
    int n = array.Length
    while j < n - 1
        iMin = j
        i = j + 1
        while i < n
            if array[i].GetDistance(PlayerRef) < array[iMin].GetDistance(PlayerRef)
                iMin = i
            endif
            i += 1
        endWhile
        if iMin != j
            ObjectReference temp = array[j]
            array[j] = array[iMin]
            array[iMin] = temp
        endif
        j += 1
    endWhile
    return array
endFunction