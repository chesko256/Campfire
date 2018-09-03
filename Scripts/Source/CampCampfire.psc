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
import CampUtil

; OPTIONAL PROPERTIES

;/********p* CampCampfire/Setting_DisableAgeOut
* SYNTAX
*/;
bool property Setting_DisableAgeOut auto
{
* DESCRIPTION
* Optional: If true, this campfire will not "age out" (delete itself) from the world after 24 hours. Handy for use with Conjured Shelters, where the shelter is responsible for destroying this object. }
;*********/;

;/********p* CampCampfire/FireAsset_SitFurniture1
* SYNTAX
*/;
furniture property FireAsset_SitFurniture1 auto
{
* DESCRIPTION
* Optional: An optional furniture to sit on. }
;*********/;

;/********p* CampCampfire/FireAsset_SitFurniture2
* SYNTAX
*/;
furniture property FireAsset_SitFurniture2 auto
{
* DESCRIPTION
* Optional: An optional furniture to sit on. }
;*********/;

;/********p* CampCampfire/FireAsset_SitFurniture3
* SYNTAX
*/;
furniture property FireAsset_SitFurniture3 auto
{
* DESCRIPTION
* Optional: An optional furniture to sit on. }
;*********/;

;/********p* CampCampfire/FireAsset_SitFurniture4
* SYNTAX
*/;
furniture property FireAsset_SitFurniture4 auto
{
* DESCRIPTION
* Optional: An optional furniture to sit on. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterStatic1
* SYNTAX
*/;
static property FireAsset_ClutterStatic1 auto
{
* DESCRIPTION
* Optional: A static to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterStatic2
* SYNTAX
*/;
static property FireAsset_ClutterStatic2 auto
{
* DESCRIPTION
* Optional: A static to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterActivator1
* SYNTAX
*/;
Activator property FireAsset_ClutterActivator1 auto
{
* DESCRIPTION
* Optional: An activator to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterActivator2
* SYNTAX
*/;
Activator property FireAsset_ClutterActivator2 auto
{
* DESCRIPTION
* Optional: An activator to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterFurniture1
* SYNTAX
*/;
Furniture property FireAsset_ClutterFurniture1 auto
{
* DESCRIPTION
* Optional: A furniture to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_ClutterFurniture2
* SYNTAX
*/;
Furniture property FireAsset_ClutterFurniture2 auto
{
* DESCRIPTION
* Optional: A furniture to place in or around the fire. }
;*********/;

;/********p* CampCampfire/FireAsset_UpliftedTriggerVolume
* SYNTAX
*/;
Activator property FireAsset_UpliftedTriggerVolume auto
{
* DESCRIPTION
* Optional: A trigger volume that grants a bonus when the player exits it. }
;*********/;

;/********p* CampCampfire/RequiredPositionRef_CampfireBase
* SYNTAX
*/;
ObjectReference property RequiredPositionRef_CampfireBase auto
{
* DESCRIPTION
* Optional: Position reference of the campfire base. }
;*********/;

;/********p* CampCampfire/PositionRef_SitFurniture1
* SYNTAX
*/;
ObjectReference property PositionRef_SitFurniture1 auto
{
* DESCRIPTION
* Optional: Position reference of the sit furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_SitFurniture2
* SYNTAX
*/;
ObjectReference property PositionRef_SitFurniture2 auto
{
* DESCRIPTION
* Optional: Position reference of the sit furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_SitFurniture3
* SYNTAX
*/;
ObjectReference property PositionRef_SitFurniture3 auto
{
* DESCRIPTION
* Optional: Position reference of the sit furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_SitFurniture4
* SYNTAX
*/;
ObjectReference property PositionRef_SitFurniture4 auto
{
* DESCRIPTION
* Optional: Position reference of the sit furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterStatic1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic1 auto
{
* DESCRIPTION
* Optional: Position reference of the clutter static. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterStatic2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterStatic2 auto
{
* DESCRIPTION
* Optional: Position reference of the clutter static. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterActivator1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator1 auto
{
* DESCRIPTION
* Optional: Position reference of the clutter activator. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterActivator2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterActivator2 auto
{
* DESCRIPTION
* Optional: Position reference of the clutter activator. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterFurniture1
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture1 auto
{
* DESCRIPTION
* Optional: Position reference of the clutter furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_ClutterFurniture2
* SYNTAX
*/;
ObjectReference property PositionRef_ClutterFurniture2 auto
{
* DESCRIPTION
* Optional: Position reference of the clutter furniture. }
;*********/;

;/********p* CampCampfire/PositionRef_CookPotSnapMarker
* SYNTAX
*/;
ObjectReference property PositionRef_CookPotSnapMarker auto
{
* DESCRIPTION
* Optional: Position reference of the cook pot snap marker. }
;*********/;

; PRIVATE
;Common objects
Activator property _Camp_PerkNodeController_Camping auto
Activator property _Camp_PerkNavControllerAct auto
Activator property _Camp_Campfire_Embers auto
Activator property _Camp_Campfire_Ashes auto
Activator property _Camp_Campfire_Steam auto
Static property _Camp_CampfireCookPotSnapMarker auto
Sound property FXFireOut auto
Sound property _Camp_UISkillsPerkEnter auto
Explosion property _Camp_PerkSystemEnterExplosion01 auto
ImpactDataSet property MAGFlames01ImpactSet auto
Message property _Camp_Campfire_Menu auto
Message property _Camp_Campfire_MenuNoTime auto
Message property _Camp_Campfire_SitError auto
Message property _Camp_Campfire_LightFail auto
Message property _Camp_Campfire_RefundFuelMsg auto
Message property _Camp_Campfire_RefundFuelMsgSpent auto
Message property _Camp_Campfire_Skill_Camping auto
Message property _Camp_Campfire_Skill_Endurance auto
Message property _Camp_Campfire_Skill_Provisioning auto
Message property _Camp_Campfire_Skill_Fishing auto
Message property _Camp_Campfire_LitError auto
Message property _Camp_TalkMenu auto
Message property _Camp_PerkAdvancement auto
Message property _Camp_PerkEarned auto
Actor property PlayerRef auto
GlobalVariable property _Camp_LastUsedCampfireSize auto
GlobalVariable property _Camp_LastUsedCampfireStage auto
GlobalVariable property _Camp_Setting_ManualFireLighting auto
GlobalVariable property _Camp_Setting_CampfireMode auto
GlobalVariable property _Camp_LastSelectedSkill auto
GlobalVariable property _Camp_WasFirstPersonBeforeUse auto
GlobalVariable property _Camp_TinderQualityTimeRate auto
GlobalVariable property CampingPerkPoints auto
GlobalVariable property CampingPerkPointsEarned auto
GlobalVariable property CampingPerkPointsTotal auto
GlobalVariable property CampingPerkPointProgress auto
GlobalVariable property CampfireCanCookFood auto
MiscObject property _Camp_CampfireItem_GoodWeather auto
MiscObject property _Camp_CampfireItem_DestructionSkill auto
MiscObject property RuinedBook auto
MiscObject property _Camp_DeadwoodBranch auto
MiscObject property _Camp_Kindling auto
MiscObject property Firewood01 auto
MiscObject property _Camp_DeadwoodLog auto
MiscObject property _Camp_CookingPot_MISC auto
MiscObject property _Camp_BlankItem auto
Furniture property _Camp_CookingPot auto

Activator property _Camp_Fuel_Crackling_DeadwoodLit auto
Activator property _Camp_Fuel_Crackling_DeadwoodUnlit auto
Activator property _Camp_Fuel_Crackling_FirewoodLit auto
Activator property _Camp_Fuel_Crackling_FirewoodUnlit auto
Light property _Camp_Campfire_Light_4 auto
Message property _Camp_CampfireNoFuelMsg auto

;Run-time objects
ObjectReference property myFuelLit auto hidden
ObjectReference property myFuelUnlit auto hidden
ObjectReference property myEmbers auto hidden
ObjectReference property myAshes auto hidden
ObjectReference property myLight auto hidden
ObjectReference property mySteam auto hidden
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
ObjectReference property myUpliftedTriggerVolume auto hidden

;Futures
ObjectReference property myFuelLitFuture auto hidden
ObjectReference property myFuelUnlitFuture auto hidden
ObjectReference property myEmbersFuture auto hidden
ObjectReference property myAshesFuture auto hidden
ObjectReference property myLightFuture auto hidden
ObjectReference property mySteamFuture auto hidden
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
ObjectReference property myUpliftedTriggerVolumeFuture auto hidden

ObjectReference property myPerkNodeController auto hidden
ObjectReference property myPerkNavController auto hidden
GlobalVariable property _Camp_PerkRank_Resourceful auto
GlobalVariable property _Camp_PerkNodeControllerCount auto

GlobalVariable property _Camp_Setting_EnableTutorials auto
Message property _Camp_Tutorial_FireBuilding_1 auto
Message property _Camp_Tutorial_FireBuilding_2 auto
Message property _Camp_Tutorial_FireBuilding_3 auto
Message property _Camp_Tutorial_FireBuilding_4 auto
Message property _Camp_Tutorial_FireBuilding_5 auto
Message property _Camp_Tutorial_SkillSystem_1 auto
Message property _Camp_Tutorial_SkillSystem_2 auto
Message property _Camp_Tutorial_SkillSystem_3 auto
GlobalVariable property _Camp_Tutorial_FireBuilding1_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding2_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding3_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding4_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding5_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem1_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem2_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem3_Displayed auto

int EMBERS_DURATION = 4
int ASH_DURATION = 24

; Fuel refund tracking values
int property supplied_branches = 0 auto hidden
int property supplied_kindling = 0 auto hidden
int property supplied_books = 0 auto hidden
int property supplied_deadwood = 0 auto hidden
int property supplied_firewood = 0 auto hidden
float last_put_out_time
float last_lit_time

bool in_use = false
bool eligible_for_deletion = false
bool attached = true

int property campfire_stage = 0 auto hidden     ;0 = empty or ash, 1 = embers, 2 = burning, 3 = unlit fuel no tinder, 4 = unlit fuel and tinder, 5 = attempting to be lit
int property campfire_size = 0 auto hidden      ;0 = not built, 1 = fragile, 2 = flickering, 3 = crackling, 4 = roaring
float property base_time_to_light = 0.0 auto hidden ; The base time to light with the supplied tinder (modified by skill)
bool property is_tinder_oil = false auto hidden ; Is the tinder oil?
float last_update_registration_time             ;when this campfire last registered
float burn_duration                             ;how long this campfire will burn (set by fuel)
float remaining_time                            ;total time this campfire will last
int current_skill_index = 0

ObjectReference property FireLightingReference auto hidden

function Initialize()
    self.BlockActivation()
    parent.Initialize()
    last_update_registration_time = Utility.GetCurrentGameTime()
    remaining_time = ASH_DURATION
    RegisterForSingleUpdateGameTime(remaining_time)
    CampDebug(0, "Campfire registered for update in " + remaining_time + " hours.")
endFunction

function Update()
    ; Only used to cause player to use the campfire in a non-blocking way from another script
    PlayerUseCampfire()
endFunction

function RegisterForCampfireCallback(float seconds_to_callback)
    RegisterForSingleUpdate(seconds_to_callback)
endFunction

Event OnActivate(ObjectReference akActionRef)
    DoActivate(akActionRef)
EndEvent

function DoActivate(ObjectReference akActionRef)
    if eligible_for_deletion
        CampDebug(1, "Campfire " + self + " unqueued for deletion.")
        eligible_for_deletion = false
        remaining_time = ASH_DURATION
        RegisterForSingleUpdateGameTime(remaining_time)
    endif

    SetSelectedObjectConjured(self)
    SetLastUsedCampfire(self)
    ; Should we refund the player fuel because it was put out?
    if campfire_stage == 3 && campfire_size > 1
        remaining_time = ASH_DURATION
        RefundRemainingFuel()
        BurnToAshes()
    endif

    _Camp_LastUsedCampfireSize.SetValueInt(campfire_size)
    _Camp_LastUsedCampfireStage.SetValueInt(campfire_stage)
    if campfire_size >= 2 && campfire_stage == 2
        CampfireCanCookFood.SetValueInt(1)
    else
        CampfireCanCookFood.SetValueInt(0)
    endif

    if akActionRef == Game.GetPlayer() && !in_use
        ; Calculate the displayed time remaining
        float displayed_time = GetRemainingDisplayTime()
        
        int i
        if displayed_time > 0.0
            i = _Camp_Campfire_Menu.Show(displayed_time as int, ((displayed_time * 60) as int) % 60)

        else
            i = _Camp_Campfire_MenuNoTime.Show()
        endif

        if i == 0
            PlayerUseCampfire()
        elseif i == 1
            ;Sit
            SetWasFirstPerson()
            SitDown()
        elseif i == 2
            ;Talk To...
            ShowTalkMenu()
        elseif i == 3
            ;Put Out
            if campfire_size > 0 && campfire_stage == 2
                PutOutFire()
            endif
        elseif i == 4
            ;Destroy
            if campfire_size > 0 && campfire_stage == 2
                PutOutFire()
            endif
            RefundRemainingFuel()
            Utility.Wait(1.0)
            TakeDown()
        elseif i == 5
            ;Place Cooking Pot
            if PlayerRef.GetItemCount(_Camp_CookingPot_MISC) > 0
                myCookPotSnapMarker.PlaceAtMe(_Camp_CookingPot, abForcePersist = !(IsPlaceableObjectTemporary(_Camp_CookingPot)))
                PlayerRef.RemoveItem(_Camp_CookingPot_MISC, 1, true)
            endif
        elseif i == 6
            ;Skills
            if !myPerkNodeController
                bool b = ShowSkills()
                if !b
                    DoActivate(akActionRef)
                endif
            endif
        elseif i == 7
            ;Get Up
            mySitFurniture2.Activate(PlayerRef)
        elseif i == 8
            ;Cancel
        endif
    endif
endFunction

function PlayerUseCampfire()
    in_use = true
    _Camp_Compatibility compatibility = GetCompatibilitySystem()
    float currentX = PlayerRef.GetPositionX()
    float currentY = PlayerRef.GetPositionY()
    self.BlockActivation(false)
    self.Activate(PlayerRef)

    ;Wait until the player is "using" the object, or enough time passes, if not Skyrim VR.
    if !compatibility.isSkyrimVR
        int j = 0
        while !self.IsFurnitureInUse() && j < 50
            utility.wait(0.1)
            j += 1
        endWhile
    endif

    ;Do they need the Blank item?
    PlayerRef.AddItem(_Camp_BlankItem, 1, true)

    ;Do they need the Clear Weather item?
    Weather inc_weather = Weather.GetCurrentWeather()
    Weather out_weather = Weather.GetOutgoingWeather()            
    int inc_weatherclass = 0
    int out_weatherclass = 0
    if inc_weather
        inc_weatherclass = inc_weather.GetClassification()
    endif
    if out_weather
        out_weatherclass = out_weather.GetClassification()
    endif
    float trans = Weather.GetCurrentWeatherTransition()
    if (inc_weatherclass <= 1 && trans >= 0.5) || (trans < 0.5 && out_weatherclass <= 1)
        PlayerRef.AddItem(_Camp_CampfireItem_GoodWeather, 1, true)
    endif

    ;Do they need the Destruction Skill item?
    if (PlayerRef.GetAV("Destruction") >= 20.0)
        PlayerRef.AddItem(_Camp_CampfireItem_DestructionSkill, 1, true)
    endif

    ; Make sure that a valid campfire mode has been set. If not, set them to Quick mode.
    int mode = _Camp_Setting_CampfireMode.GetValueInt()
    if mode < 0 || mode > 1
        _Camp_Setting_CampfireMode.SetValueInt(0)
        SendEvent_SaveSettingToProfile("campfire_mode", 0)
    endif

    ShowTutorial(1)

    ;Wait until they finish.
    if compatibility.isSkyrimVR
        while PlayerRef.GetPositionX() == currentX && PlayerRef.GetPositionY() == currentY
            utility.wait(1)
        endWhile
    else
        while self.IsFurnitureInUse()
            utility.wait(1)
        endWhile
    endif
    int gw_count = PlayerRef.GetItemCount(_Camp_CampfireItem_GoodWeather)
    int ds_count = PlayerRef.GetItemCount(_Camp_CampfireItem_DestructionSkill)
    int a_count = PlayerRef.GetItemCount(_Camp_BlankItem)
    PlayerRef.RemoveItem(_Camp_CampfireItem_GoodWeather, gw_count, true)
    PlayerRef.RemoveItem(_Camp_CampfireItem_DestructionSkill, ds_count, true)
    PlayerRef.RemoveItem(_Camp_BlankItem, a_count, true)
    ;Return to the previous state.
    self.BlockActivation()
    in_use = false
endFunction

function ShowTalkMenu()
    int i = _Camp_TalkMenu.Show()
    Actor follower
    if i == 0           ;Follower 1
        follower = GetTrackedFollower(1)
    elseif i == 1       ;Follower 2
        follower = GetTrackedFollower(2)
    elseif i == 2       ;Follower 3
        follower = GetTrackedFollower(3)
    elseif i == 3       ;No one
        return
    endif

    if follower
        follower.Activate(PlayerRef)
    endif
endFunction

function ShowTutorial(int aiTutorialIndex)
    if _Camp_Setting_EnableTutorials.GetValueInt() == 1
        return
    endif

    if _Camp_Setting_CampfireMode.GetValueInt() == 0
        return
    endif

    if aiTutorialIndex == 1 && _Camp_Tutorial_FireBuilding1_Displayed.GetValueInt() != 2
        int i = _Camp_Tutorial_FireBuilding_1.Show()
        if i == 0
            _Camp_Tutorial_FireBuilding1_Displayed.SetValueInt(2)
            ShowTutorial(2)
        elseif i == 1
            _Camp_Tutorial_FireBuilding1_Displayed.SetValueInt(2)
            _Camp_Tutorial_FireBuilding2_Displayed.SetValueInt(2)
            _Camp_Tutorial_FireBuilding3_Displayed.SetValueInt(2)
            _Camp_Tutorial_FireBuilding4_Displayed.SetValueInt(2)
            _Camp_Tutorial_FireBuilding5_Displayed.SetValueInt(2)
        endif
    elseif aiTutorialIndex == 2 && _Camp_Tutorial_FireBuilding2_Displayed.GetValueInt() != 2
        _Camp_Tutorial_FireBuilding_2.Show()
        _Camp_Tutorial_FireBuilding2_Displayed.SetValueInt(2)
    elseif aiTutorialIndex == 3 && _Camp_Tutorial_FireBuilding3_Displayed.GetValueInt() != 2
        _Camp_Tutorial_FireBuilding_3.Show()
        _Camp_Tutorial_FireBuilding3_Displayed.SetValueInt(2)
    elseif aiTutorialIndex == 4 && _Camp_Tutorial_FireBuilding4_Displayed.GetValueInt() != 2
        _Camp_Tutorial_FireBuilding_4.Show()
        _Camp_Tutorial_FireBuilding4_Displayed.SetValueInt(2)
    elseif aiTutorialIndex == 5 && _Camp_Tutorial_FireBuilding5_Displayed.GetValueInt() != 2
        _Camp_Tutorial_FireBuilding_5.Show()
        _Camp_Tutorial_FireBuilding5_Displayed.SetValueInt(2)
    elseif aiTutorialIndex == 11 && _Camp_Tutorial_SkillSystem1_Displayed.GetValueInt() != 2
        int i = _Camp_Tutorial_SkillSystem_1.Show()
        if i == 0
            _Camp_Tutorial_SkillSystem1_Displayed.SetValueInt(2)
            ShowTutorial(12)
            ShowTutorial(13)
        elseif i == 1
            _Camp_Tutorial_SkillSystem1_Displayed.SetValueInt(2)
            _Camp_Tutorial_SkillSystem2_Displayed.SetValueInt(2)
            _Camp_Tutorial_SkillSystem3_Displayed.SetValueInt(2)
        endif
    elseif aiTutorialIndex == 12 && _Camp_Tutorial_SkillSystem2_Displayed.GetValueInt() != 2
        _Camp_Tutorial_SkillSystem_2.Show()
        _Camp_Tutorial_SkillSystem2_Displayed.SetValueInt(2)
    elseif aiTutorialIndex == 13 && _Camp_Tutorial_SkillSystem3_Displayed.GetValueInt() != 2
        _Camp_Tutorial_SkillSystem_3.Show()
        _Camp_Tutorial_SkillSystem3_Displayed.SetValueInt(2)
    endif
endFunction

Event OnCellAttach()
    attached = true    
EndEvent

Event OnCellDetach()
    attached = false
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
    if PositionRef_CookPotSnapMarker
        PlaceObject_myCookPotSnapMarker()
    endif

    ;Required
    PlaceObject_mySteam()
    PlaceObject_myEmbers()
    PlaceObject_myAshes()
    PlaceObject_myUpliftedTriggerVolume()
endFunction

function GetResults()
    if mySteamFuture
        mySteam = GetFuture(mySteamFuture).get_result()
        mySteamFuture = None
    endif
    if myFuelLitFuture
        myFuelLit = GetFuture(myFuelLitFuture).get_result()
        myFuelLitFuture = None
    endif
    if myFuelUnlitFuture
        myFuelUnlit = GetFuture(myFuelUnlitFuture).get_result()
        myFuelUnlitFuture = None
    endif
    if myEmbersFuture
        myEmbers = GetFuture(myEmbersFuture).get_result()
        myEmbersFuture = None
    endif
    if myAshesFuture
        myAshes = GetFuture(myAshesFuture).get_result()
        if Setting_IsConjured
            myAshes.SetScale(0.7)
        endif
        myAshesFuture = None
    endif
    if mySitFurniture1Future
        mySitFurniture1 = GetFuture(mySitFurniture1Future).get_result()
        mySitFurniture1Future = None
    endif
    if mySitFurniture2Future
        mySitFurniture2 = GetFuture(mySitFurniture2Future).get_result()
        mySitFurniture2Future = None
    endif
    if mySitFurniture3Future
        mySitFurniture3 = GetFuture(mySitFurniture3Future).get_result()
        mySitFurniture3Future = None
    endif
    if mySitFurniture4Future
        mySitFurniture4 = GetFuture(mySitFurniture4Future).get_result()
        mySitFurniture4Future = None
    endif
    if myClutterStatic1Future
        myClutterStatic1 = GetFuture(myClutterStatic1Future).get_result()
        myClutterStatic1Future = None
    endif
    if myClutterStatic2Future
        myClutterStatic2 = GetFuture(myClutterStatic2Future).get_result()
        myClutterStatic2Future = None
    endif
    if myClutterActivator1Future
        myClutterActivator1 = GetFuture(myClutterActivator1Future).get_result()
        myClutterActivator1Future = None
    endif
    if myClutterActivator2Future
        myClutterActivator2 = GetFuture(myClutterActivator2Future).get_result()
        myClutterActivator2Future = None
    endif
    if myClutterFurniture1Future
        myClutterFurniture1 = GetFuture(myClutterFurniture1Future).get_result()
        myClutterFurniture1Future = None
    endif
    if myClutterFurniture2Future
        myClutterFurniture2 = GetFuture(myClutterFurniture2Future).get_result()
        myClutterFurniture2Future = None
    endif
    if myCookPotSnapMarkerFuture
        myCookPotSnapMarker = GetFuture(myCookPotSnapMarkerFuture).get_result()
        myCookPotSnapMarkerFuture = None
    endif
    if myUpliftedTriggerVolumeFuture
        myUpliftedTriggerVolume = GetFuture(myUpliftedTriggerVolumeFuture).get_result()
        if myUpliftedTriggerVolume
            myUpliftedTriggerVolume.MoveTo(myUpliftedTriggerVolume, afZOffset = -300.0)
        endif
        myUpliftedTriggerVolumeFuture = None
    endif

    if GetLogLevel() <= 1
        GenerateDebugReport()
    endif
endFunction

function GenerateDebugReport()
    CampDebug(1, "Placement complete. Placed object report:")
    CampDebug(1, "======================================================================")
    CampDebug(1, "**SELF**: " + self)
    CampDebug(1, "myFuelLit: " + myFuelLit)
    CampDebug(1, "myFuelUnlit: " + myFuelUnlit)
    CampDebug(1, "myEmbers: " + myEmbers)
    CampDebug(1, "myAshes: " + myAshes)
    CampDebug(1, "myLight: " + myLight)
    CampDebug(1, "mySteam: " + mySteam)
    CampDebug(1, "myClutterStatic1: " + myClutterStatic1)
    CampDebug(1, "myClutterStatic2: " + myClutterStatic2)
    CampDebug(1, "myClutterActivator1: " + myClutterActivator1)
    CampDebug(1, "myClutterActivator2: " + myClutterActivator2)
    CampDebug(1, "myClutterFurniture1: " + myClutterFurniture1)
    CampDebug(1, "myClutterFurniture2: " + myClutterFurniture2)
    CampDebug(1, "mySitFurniture1: " + mySitFurniture1)
    CampDebug(1, "mySitFurniture2: " + mySitFurniture2)
    CampDebug(1, "mySitFurniture3: " + mySitFurniture3)
    CampDebug(1, "mySitFurniture4: " + mySitFurniture4)
    CampDebug(1, "myCookPotSnapMarker: " + myCookPotSnapMarker)
    CampDebug(1, "myUpliftedTriggerVolume: " + myUpliftedTriggerVolume)
    CampDebug(1, "======================================================================")
endFunction

function TakeDown()
    (myUpliftedTriggerVolume as _Camp_UpliftedTriggerVolumeScript).FireBurnedOut()
    if myPerkNodeController
        (myPerkNodeController as CampPerkNodeController).TakeDown()
    endif
    if myPerkNavController
        (myPerkNavController as _Camp_PerkNavController).TakeDown()
    endif
    UnregisterForUpdateGameTime()

    ForceStopUsingFurniture(mySitFurniture1)
    ForceStopUsingFurniture(mySitFurniture2)
    ForceStopUsingFurniture(mySitFurniture3)
    ForceStopUsingFurniture(mySitFurniture4)
    ForceStopUsingFurniture(FireLightingReference)

    TryToDisableAndDeleteRef(mySteam)
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
    TryToDisableAndDeleteRef(FireLightingReference)
    TryToDisableAndDeleteRef(myUpliftedTriggerVolume)

    myPerkNodeController = None
    myPerkNavController = None
    mySteam = None
    myFuelLit = None
    myFuelUnlit = None
    myEmbers = None
    myAshes = None
    myLight = None
    myClutterStatic1 = None
    myClutterStatic2 = None
    myClutterActivator1 = None
    myClutterActivator2 = None
    myClutterFurniture1 = None
    myClutterFurniture2 = None
    myCookPotSnapMarker = None
    mySitFurniture1 = None
    mySitFurniture2 = None
    mySitFurniture3 = None
    mySitFurniture4 = None
    FireLightingReference = None
    myUpliftedTriggerVolume = None

    if GetLastUsedCampfire() == self
        SetLastUsedCampfire(None)
    endif

    ClearEquipmentFromCrimeAlias(self)
    SendEvent_OnObjectRemoved(self.GetBaseObject(), self.GetPositionX(), self.GetPositionY(), self.GetPositionZ(), \
                              self.GetAngleX(), self.GetAngleY(), self.GetAngleZ(), false)
    TryToDisableAndDeleteRef(self)
endFunction

function PlaceObject_SitFurniture1()
    mySitFurniture1Future = PlacementSystem.PlaceObject(self, FireAsset_SitFurniture1, PositionRef_SitFurniture1, is_temp = is_temporary)
endFunction
function PlaceObject_SitFurniture2()
    ; Player
    if GetCompatibilitySystem().isSkyrimVR
        Furniture VRSitMarker = Game.GetFormFromFile(0x0207BEA2, "Campfire.esm") as Furniture
        mySitFurniture2Future = PlacementSystem.PlaceObject(self, VRSitMarker, PositionRef_SitFurniture2, z_pos_offset = -8.0, is_temp = is_temporary)
    else
        mySitFurniture2Future = PlacementSystem.PlaceObject(self, FireAsset_SitFurniture2, PositionRef_SitFurniture2, is_temp = is_temporary)
    endif
endFunction
function PlaceObject_SitFurniture3()
    mySitFurniture3Future = PlacementSystem.PlaceObject(self, FireAsset_SitFurniture3, PositionRef_SitFurniture3, is_temp = is_temporary)
endFunction
function PlaceObject_SitFurniture4()
    mySitFurniture4Future = PlacementSystem.PlaceObject(self, FireAsset_SitFurniture4, PositionRef_SitFurniture4, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic1()
    myClutterStatic1Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterStatic1, PositionRef_ClutterStatic1, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic2()
    myClutterStatic2Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterStatic2, PositionRef_ClutterStatic2, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterActivator1()
    myClutterActivator1Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterActivator1, PositionRef_ClutterActivator1, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterActivator2()
    myClutterActivator2Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterActivator2, PositionRef_ClutterActivator2, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterFurniture1()
    myClutterFurniture1Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterFurniture1, PositionRef_ClutterFurniture1, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterFurniture2()
    myClutterFurniture2Future = PlacementSystem.PlaceObject(self, FireAsset_ClutterFurniture2, PositionRef_ClutterFurniture2, is_temp = is_temporary)
endFunction
function PlaceObject_mySteam()
    mySteamFuture = PlacementSystem.PlaceObject(self, _Camp_Campfire_Steam, RequiredPositionRef_CampfireBase, initially_disabled=true, is_temp = is_temporary)
endFunction
function PlaceObject_myEmbers()
    myEmbersFuture = PlacementSystem.PlaceObject(self, _Camp_Campfire_Embers, RequiredPositionRef_CampfireBase, initially_disabled=true, is_temp = is_temporary)
endFunction
function PlaceObject_myAshes()
    myAshesFuture = PlacementSystem.PlaceObject(self, _Camp_Campfire_Ashes, RequiredPositionRef_CampfireBase, initially_disabled=true, is_temp = is_temporary)
endFunction
function PlaceObject_myCookPotSnapMarker()
    myCookPotSnapMarkerFuture = PlacementSystem.PlaceObject(self, _Camp_CampfireCookPotSnapMarker, PositionRef_CookPotSnapMarker, is_hanging = true, is_temp = is_temporary)
endFunction
function PlaceObject_myUpliftedTriggerVolume()
    myUpliftedTriggerVolumeFuture = PlacementSystem.PlaceObject(self, FireAsset_UpliftedTriggerVolume, RequiredPositionRef_CampfireBase, is_temp = is_temporary)
endFunction

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
    if akEffect.HasKeyword(GetMagicDamageFrostKeyword())
        if campfire_size > 0 && campfire_stage == 2
            PutOutFire()
        endif
    elseif akEffect.HasKeyword(GetMagicDamageFireKeyword()) && _Camp_Setting_CampfireMode.GetValueInt() == 0
        if campfire_size > 0 && campfire_stage >= 3
            LightFire()
        endif
    endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    if akSource == none && (akAggressor as Actor).GetEquippedItemType(0) == 11 && _Camp_Setting_CampfireMode.GetValueInt() == 0
        if campfire_size > 0 && campfire_stage >= 3
            LightFire()
        endif
    endif
EndEvent

function SetFuel(Activator akFuelLit, Activator akFuelUnlit, Light akLight, int aiBurnDuration, bool abFuelRefresh = false)
    CampDebug(1, "Fuel set: " + akFuelLit + "," + akFuelUnlit + "," + akLight)
    burn_duration = aiBurnDuration * ((_Camp_PerkRank_Resourceful.GetValueInt() * 0.25) + 1)

    ;If there is pre-existing fuel, get rid of it
    TryToDisableAndDeleteRef(myFuelUnlit)
    TryToDisableAndDeleteRef(myFuelLit)
    TryToDisableAndDeleteRef(myLight)

    ;Place the new fuel
    myFuelUnlit = self.PlaceAtMe(akFuelUnlit, abInitiallyDisabled = true)
    myFuelLit = self.PlaceAtMe(akFuelLit, abInitiallyDisabled = true)
    myLight = self.PlaceAtMe(akLight, abInitiallyDisabled = true)
    myLight.MoveTo(myLight, afZOffset = 100.0)

    if Setting_IsConjured
        myFuelLit.SetScale(0.7)
        myFuelLit.SetAngle(0.0, 0.0, myFuelLit.GetAngleZ() + 45.0)
        myFuelUnlit.SetScale(0.7)
        myFuelUnlit.SetAngle(0.0, 0.0, myFuelUnlit.GetAngleZ() + 45.0)
    endif

    if campfire_stage == 2
        LightFire(abFuelRefresh)
    else
        PlaceFuel()
    endif
endFunction

function SitDown()
    if !(mySitFurniture2.IsFurnitureInUse())
        Game.ForceThirdPerson()
        mySitFurniture2.Activate(PlayerRef)
    else
        ;There is nowhere to sit.
        _Camp_Campfire_SitError.Show()
    endif
endFunction

; ========== Campfire Perk System

bool function ShowSkills()
    if campfire_stage == 2
        EnterTreeSystem(_Camp_LastSelectedSkill.GetValueInt())
        return true
    else
        ; "Your campfire must be lit to use this."
        _Camp_Campfire_LitError.Show()
        return false
    endif
endFunction

function EnterTreeSystem(int idx)
    ShowTutorial(11)
    self.PlaceAtMe(_Camp_PerkSystemEnterExplosion01)
    _Camp_UISkillsPerkEnter.Play(self)
    ShowBugNav()
    ShowPerkTree(idx)
    current_skill_index = idx
    _Camp_LastSelectedSkill.SetValueInt(idx)
    if myPerkNodeController
        (myPerkNodeController as CampPerkNodeControllerBehavior).AssignCampfire(self)
    endif
    if myPerkNavController
        (myPerkNavController as _Camp_PerkNavController).AssignCampfire(self)
    endif
endFunction

function ShowBugNav()
    if !myPerkNavController
        myPerkNavController = self.PlaceAtMe(_Camp_PerkNavControllerAct)
    endif
endFunction

function ShowPerkTree(int idx)
    Activator nc = GetCompatibilitySystem().PerkNodeControllers[idx]
    if nc != None
        myPerkNodeController = self.PlaceAtMe(nc)
        _Camp_LastSelectedSkill.SetValue(idx)
    endif
endFunction

bool function ShowPerkDesc(int idx)
    if myPerkNodeController
        CampPerkNodeControllerBehavior controller = (myPerkNodeController as CampPerkNodeControllerBehavior)
        int i = controller.required_skill_description.Show(controller.required_perk_points_available.GetValueInt(), controller.required_perk_point_progress.GetValue() * 100.0)

        if i == 0
            return true
        else
            return false
        endif
    else
        return false
    endif
endFunction

; Called by the Nav Controller if necessary
function TakeDownPerkTree()
    if myPerkNodeController
        (myPerkNodeController as CampPerkNodeController).TakeDown()
    endif
endFunction

function ShowNextPerkTree()
    _Camp_Compatibility cs = GetCompatibilitySystem()
    TakeDownPerkTree()
    bool tree_found = false
    int i = current_skill_index + 1
    while !tree_found && i != current_skill_index
        if i > (_Camp_PerkNodeControllerCount.GetValueInt() - 1)
            i = 0
        endif
        if cs.PerkNodeControllers[i]
            tree_found = true
            ShowPerkTree(i)
            current_skill_index = i
            _Camp_LastSelectedSkill.SetValueInt(i)
            if myPerkNodeController
                (myPerkNodeController as CampPerkNodeControllerBehavior).AssignCampfire(self)
            endif
        endif
        i += 1
    endWhile
endFunction

function ShowPrevPerkTree()
    _Camp_Compatibility cs = GetCompatibilitySystem()
    TakeDownPerkTree()
    bool tree_found = false
    int i = current_skill_index - 1
    while !tree_found && i != current_skill_index
        if i < 0
            i = (_Camp_PerkNodeControllerCount.GetValueInt() - 1)
        endif
        if cs.PerkNodeControllers[i]
            tree_found = true
            ShowPerkTree(i)
            current_skill_index = i
            _Camp_LastSelectedSkill.SetValueInt(i)
            if myPerkNodeController
                (myPerkNodeController as CampPerkNodeControllerBehavior).AssignCampfire(self)
            endif
        endif
        i -= 1
    endWhile
endFunction

; Camping Skill
function AdvanceCampingSkill()
    if CampingPerkPointsEarned.GetValueInt() < CampingPerkPointsTotal.GetValueInt()
        CampDebug(1, "Advancing Camping skill.")
        int next_level = CampingPerkPointsEarned.GetValueInt() + 1

        ; 3, 5, 7, 9, 10, 11, 12, 13...
        float fires_required
        if next_level <= 4
            fires_required = (2 * next_level) + 1
        else
            fires_required = (9 + (next_level - 4))
        endif

        float progress_value = (1.0 / fires_required)
        CampingPerkPointProgress.SetValue(CampingPerkPointProgress.GetValue() + progress_value)
        CampDebug(1, "Camping perk progress value: " + CampingPerkPointProgress.GetValue())

        if (CampingPerkPointProgress.GetValue() + 0.01) >= 1.0
            CampDebug(1, "Granting a Camping perk point.")
            ; Grant perk point
            _Camp_PerkEarned.Show()
            CampingPerkPointsEarned.SetValueInt(CampingPerkPointsEarned.GetValueInt() + 1)
            CampingPerkPoints.SetValueInt(CampingPerkPoints.GetValueInt() + 1)

            if CampingPerkPointsEarned.GetValueInt() >= CampingPerkPointsTotal.GetValueInt()
                CampingPerkPointProgress.SetValue(1.0)
            else
                CampingPerkPointProgress.SetValue(0.0)
            endif
        else
            _Camp_PerkAdvancement.Show()
        endif
    endif
endFunction

; ========== Fuel Placement and Management

function RefundRemainingFuel()
    int hours_burnt = Math.Ceiling((last_put_out_time * 24.0) - (last_lit_time * 24.0))
    
    ; Eat fuel for each hour burned
    while hours_burnt > 0
        if supplied_books >= 2
            supplied_books -= 2
        elseif supplied_branches >= 2
            supplied_branches -= 2
        elseif supplied_kindling >= 2
            supplied_kindling -= 2
        endif

        if supplied_firewood >= 1
            supplied_firewood -= 1
        elseif supplied_deadwood >= 1
            supplied_deadwood -= 1
        endif

        hours_burnt -= 1
    endWhile

    ; Give back the remaining
    if supplied_books > 0 || supplied_branches > 0 || supplied_kindling > 0 || supplied_firewood > 0 || supplied_deadwood > 0
        _Camp_Campfire_RefundFuelMsg.Show()
    else
        if burn_duration > 0    ; Don't show this message if campfire is empty
            _Camp_Campfire_RefundFuelMsgSpent.Show()
        endif
    endif

    if supplied_books > 0
        PlayerRef.AddItem(RuinedBook, supplied_books)
    endif
    if supplied_branches > 0
        PlayerRef.AddItem(_Camp_DeadwoodBranch, supplied_branches)
    endif
    if supplied_kindling > 0
        PlayerRef.AddItem(_Camp_Kindling, supplied_kindling)
    endif
    if supplied_firewood > 0
        PlayerRef.AddItem(Firewood01, supplied_firewood)
    endif
    if supplied_deadwood > 0
        PlayerRef.AddItem(_Camp_DeadwoodLog, supplied_deadwood)
    endif

    ; Clear the counts to start fresh next time
    DepleteAllRefundFuel()
endFunction

function DepleteAllRefundFuel()
    supplied_firewood = 0
    supplied_deadwood = 0
    supplied_books = 0
    supplied_kindling = 0
    supplied_branches = 0
endFunction

function SetTinder(int aiQualityRank, bool abIsTinderOil)
    campfire_stage = 4
    _Camp_LastUsedCampfireStage.SetValueInt(campfire_stage)
    base_time_to_light = aiQualityRank * _Camp_TinderQualityTimeRate.GetValue()
    if base_time_to_light < 1.0
        base_time_to_light = 1.0
    endif
    is_tinder_oil = abIsTinderOil
    CampDebug(1, "Set tinder with time to light of " + base_time_to_light)
    
    ShowTutorial(4)
endFunction

function PlaceFuel()
    CampDebug(0, "PlaceFuel")
    myFuelUnlit.EnableNoWait()
    myFuelLit.DisableNoWait()
    myLight.DisableNoWait()
    myEmbers.DisableNoWait()
    RegisterForSingleUpdateGameTime(ASH_DURATION)
    last_update_registration_time = Utility.GetCurrentGameTime()
    last_lit_time = 0.0
    last_put_out_time = 0.0
    remaining_time = ASH_DURATION
    CampDebug(1, "Campfire registered for update in " + ASH_DURATION + " hours.")
    campfire_stage = 3
    _Camp_LastUsedCampfireStage.SetValueInt(campfire_stage)
    ShowTutorial(3)
endFunction

function LightFire(bool abFuelRefresh = false)
    CampDebug(0, "LightFire")
    base_time_to_light = 0.0
    myFuelUnlit.DisableNoWait()
    myFuelLit.EnableNoWait()
    myLight.EnableNoWait()
    myEmbers.DisableNoWait()
    myAshes.EnableNoWait(true)
    RegisterForSingleUpdateGameTime(burn_duration)
    if !abFuelRefresh
        last_lit_time = Utility.GetCurrentGameTime()
    endif
    last_update_registration_time = Utility.GetCurrentGameTime()
    remaining_time = burn_duration + EMBERS_DURATION + ASH_DURATION
    CampDebug(1, "Campfire registered for update in " + burn_duration + " hours.")
    campfire_stage = 2
    _Camp_LastUsedCampfireStage.SetValueInt(campfire_stage)
    ShowTutorial(5)
endFunction

function PutOutFire()
    CampDebug(0, "PutOutFire")
    myFuelUnlit.EnableNoWait()
    myFuelLit.DisableNoWait()
    myLight.DisableNoWait()
    RegisterForSingleUpdateGameTime(ASH_DURATION)
    last_put_out_time = Utility.GetCurrentGameTime()
    last_update_registration_time = Utility.GetCurrentGameTime()
    remaining_time = ASH_DURATION
    CampDebug(1, "Campfire registered for update in " + remaining_time + " hours.")
    campfire_stage = 3

    FXFireOut.Play(self)
    mySteam.Enable()
    utility.wait(2)
    mySteam.Disable(true)

    (myUpliftedTriggerVolume as _Camp_UpliftedTriggerVolumeScript).FireBurnedOut()

    if myPerkNodeController
        (myPerkNodeController as CampPerkNodeController).TakeDown()
    endif
    if myPerkNavController
        (myPerkNavController as _Camp_PerkNavController).TakeDown()
    endif
endFunction

function BurnToEmbers()
    CampDebug(0, "BurnToEmbers")
    
    myFuelUnlit.DisableNoWait(true)
    myFuelLit.DisableNoWait(true)
    myLight.DisableNoWait(true)
    myEmbers.EnableNoWait()
    myAshes.EnableNoWait()
    (myUpliftedTriggerVolume as _Camp_UpliftedTriggerVolumeScript).FireBurnedOut()

    last_update_registration_time = Utility.GetCurrentGameTime()
    RegisterForSingleUpdateGameTime(remaining_time - ASH_DURATION)

    CampDebug(1, "Campfire registered for update in " + (remaining_time - ASH_DURATION) + " hours.")
    campfire_stage = 1
    campfire_size = 0

    DepleteAllRefundFuel()

    if myPerkNodeController
        (myPerkNodeController as CampPerkNodeController).TakeDown()
    endif
    if myPerkNavController
        (myPerkNavController as _Camp_PerkNavController).TakeDown()
    endif
endFunction

function BurnToAshes()
    CampDebug(0, "BurnToAshes or Refunding Fuel")

    myFuelUnlit.DisableNoWait(true)
    myFuelLit.DisableNoWait(true)
    myLight.DisableNoWait()
    myEmbers.DisableNoWait(true)
    myAshes.EnableNoWait()
    (myUpliftedTriggerVolume as _Camp_UpliftedTriggerVolumeScript).FireBurnedOut()

    last_update_registration_time = Utility.GetCurrentGameTime()
    RegisterForSingleUpdateGameTime(remaining_time)
    CampDebug(1, "Campfire registered for update in " + remaining_time + " hours.")
    campfire_stage = 0
    campfire_size = 0
    
    DepleteAllRefundFuel()

    if myPerkNodeController
        (myPerkNodeController as CampPerkNodeController).TakeDown()
    endif
    if myPerkNavController
        (myPerkNavController as _Camp_PerkNavController).TakeDown()
    endif
endFunction

Event OnUpdateGameTime()
    utility.wait(0.1)
    float this_time = (Utility.GetCurrentGameTime() * 24.0)
    float time_delta = this_time - (last_update_registration_time * 24.0)
    remaining_time -= time_delta
    ; Floor the time to smooth inaccuracy of when the update actually occurs
    CampDebug(0, "Campfire remaining time " + Math.Floor(remaining_time))

    if remaining_time < 1
        if !Setting_DisableAgeOut
            if attached
                CampDebug(1, "Campfire " + self + " queued for deletion.")
                eligible_for_deletion = true
            else
                TakeDown()
            endif
        endif
    else
        if remaining_time <= ASH_DURATION
            BurnToAshes()
        elseif Math.Floor(remaining_time) <= (ASH_DURATION + EMBERS_DURATION)
            BurnToEmbers()
        endif
    endif
endEvent

function SetWasFirstPerson()
    if PlayerRef.GetAnimationVariableBool("IsFirstPerson")
        _Camp_WasFirstPersonBeforeUse.SetValueInt(2)
    else
        _Camp_WasFirstPersonBeforeUse.SetValueInt(1)
    endif
endFunction

float function GetRemainingDisplayTime()
    float total_burn_time
    if campfire_stage == 0 || campfire_stage >= 3
        total_burn_time = remaining_time - ASH_DURATION
    else
        total_burn_time = remaining_time - (ASH_DURATION + EMBERS_DURATION)
    endif
    float remaining_burn_time = total_burn_time - ((Utility.GetCurrentGameTime() - last_update_registration_time) * 24.0)
    return remaining_burn_time
endFunction

function SetBonusLevel(int aiBonusLevel)
    if myUpliftedTriggerVolume
        (myUpliftedTriggerVolume as _Camp_UpliftedTriggerVolumeScript).bonus_level = aiBonusLevel
    endif
endFunction

; @NOFALLBACK
function SendEvent_SaveSettingToProfile(string asSettingName, int aiSettingValue)
    if GetCompatibilitySystem().isSKYUILoaded
        int handle = ModEvent.Create("Campfire_SaveSettingToProfile")
        if handle
            ModEvent.PushString(handle, asSettingName)
            ModEvent.PushInt(handle, aiSettingValue)
            ModEvent.Send(handle)
        endif
    endif
endFunction

GlobalVariable property _Camp_PerkRank_Firecraft auto
{This script no longer uses this property as of Campfire 1.6.}