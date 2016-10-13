scriptname CampPerkNodeController extends _Camp_PlaceableObjectBase
{Handles node graph behavior and presentation.}

import _CampInternal


Activator property PerkNode00 auto
{ The 0th perk node. }
Activator property PerkNode01 auto
{ The 1st perk node. }
Activator property PerkNode02 auto
{ The 2nd perk node. }
Activator property PerkNode03 auto
{ The 3rd perk node. }
Activator property PerkNode04 auto
{ The 4th perk node. }
Activator property PerkNode05 auto
{ The 5th perk node. }
Activator property PerkNode06 auto
{ The 6th perk node. }
Activator property PerkNode07 auto
{ The 7th perk node. }
Activator property PerkNode08 auto
{ The 8th perk node. }
Activator property PerkNode09 auto
{ The 9th perk node. }
Activator property PerkNode10 auto
{ The 10th perk node. }
Activator property PerkNode11 auto
{ The 11th perk node. }
Activator property PerkLine00 auto
{ The 0th perk line. }
Activator property PerkLine01 auto
{ The 1st perk line. }
Activator property PerkLine02 auto
{ The 2nd perk line. }
Activator property PerkLine03 auto
{ The 3rd perk line. }
Activator property PerkLine04 auto
{ The 4th perk line. }
Activator property PerkLine05 auto
{ The 5th perk line. }
Activator property PerkLine06 auto
{ The 6th perk line. }
Activator property PerkLine07 auto
{ The 7th perk line. }
Activator property PerkLine08 auto
{ The 8th perk line. }
Activator property PerkLine09 auto
{ The 9th perk line. }
Activator property PerkLine10 auto
{ The 10th perk line. }
Activator property PerkLine11 auto
{ The 11th perk line. }
Static property PerkArtPlane auto
{ The perk art. }

ObjectReference property PerkNode00Future auto hidden
ObjectReference property PerkNode01Future auto hidden
ObjectReference property PerkNode02Future auto hidden
ObjectReference property PerkNode03Future auto hidden
ObjectReference property PerkNode04Future auto hidden
ObjectReference property PerkNode05Future auto hidden
ObjectReference property PerkNode06Future auto hidden
ObjectReference property PerkNode07Future auto hidden
ObjectReference property PerkNode08Future auto hidden
ObjectReference property PerkNode09Future auto hidden
ObjectReference property PerkNode10Future auto hidden
ObjectReference property PerkNode11Future auto hidden
ObjectReference property PerkLine00Future auto hidden
ObjectReference property PerkLine01Future auto hidden
ObjectReference property PerkLine02Future auto hidden
ObjectReference property PerkLine03Future auto hidden
ObjectReference property PerkLine04Future auto hidden
ObjectReference property PerkLine05Future auto hidden
ObjectReference property PerkLine06Future auto hidden
ObjectReference property PerkLine07Future auto hidden
ObjectReference property PerkLine08Future auto hidden
ObjectReference property PerkLine09Future auto hidden
ObjectReference property PerkLine10Future auto hidden
ObjectReference property PerkLine11Future auto hidden
ObjectReference property PerkArtPlaneFuture auto hidden

ObjectReference property myCampfire auto hidden
ObjectReference property myPerkArtPlane auto hidden
ObjectReference property myPerkNode00 auto hidden
ObjectReference property myPerkNode01 auto hidden
ObjectReference property myPerkNode02 auto hidden
ObjectReference property myPerkNode03 auto hidden
ObjectReference property myPerkNode04 auto hidden
ObjectReference property myPerkNode05 auto hidden
ObjectReference property myPerkNode06 auto hidden
ObjectReference property myPerkNode07 auto hidden
ObjectReference property myPerkNode08 auto hidden
ObjectReference property myPerkNode09 auto hidden
ObjectReference property myPerkNode10 auto hidden
ObjectReference property myPerkNode11 auto hidden
ObjectReference property myPerkLine00 auto hidden
ObjectReference property myPerkLine01 auto hidden
ObjectReference property myPerkLine02 auto hidden
ObjectReference property myPerkLine03 auto hidden
ObjectReference property myPerkLine04 auto hidden
ObjectReference property myPerkLine05 auto hidden
ObjectReference property myPerkLine06 auto hidden
ObjectReference property myPerkLine07 auto hidden
ObjectReference property myPerkLine08 auto hidden
ObjectReference property myPerkLine09 auto hidden
ObjectReference property myPerkLine10 auto hidden
ObjectReference property myPerkLine11 auto hidden

ObjectReference property PerkNodeController_PositionRef auto
ObjectReference property PerkNode00_PositionRef auto
ObjectReference property PerkNode01_PositionRef auto
ObjectReference property PerkNode02_PositionRef auto
ObjectReference property PerkNode03_PositionRef auto
ObjectReference property PerkNode04_PositionRef auto
ObjectReference property PerkNode05_PositionRef auto
ObjectReference property PerkNode06_PositionRef auto
ObjectReference property PerkNode07_PositionRef auto
ObjectReference property PerkNode08_PositionRef auto
ObjectReference property PerkNode09_PositionRef auto
ObjectReference property PerkNode10_PositionRef auto
ObjectReference property PerkNode11_PositionRef auto
ObjectReference property PerkLine00_PositionRef auto
ObjectReference property PerkLine01_PositionRef auto
ObjectReference property PerkLine02_PositionRef auto
ObjectReference property PerkLine03_PositionRef auto
ObjectReference property PerkLine04_PositionRef auto
ObjectReference property PerkLine05_PositionRef auto
ObjectReference property PerkLine06_PositionRef auto
ObjectReference property PerkLine07_PositionRef auto
ObjectReference property PerkLine08_PositionRef auto
ObjectReference property PerkLine09_PositionRef auto
ObjectReference property PerkLine10_PositionRef auto
ObjectReference property PerkLine11_PositionRef auto
ObjectReference property PerkArtPlane_PositionRef auto

ObjectReference[] property NodeRefMap auto hidden
ObjectReference[] property LineRefMap auto hidden
Activator[] property NodeActMap auto hidden
Activator[] property LineActMap auto hidden

bool property InteractionLocked = true auto hidden

function Initialize()
    int i = 0
    while !self.Is3DLoaded() && i < 50
        utility.wait(0.1)
        i += 1
    endWhile

    self.SetAngle(0.0, 0.0, \
                  self.GetAngleZ() + self.GetHeadingAngle(Game.GetPlayer()) + 180.0)

    NodeRefMap = new ObjectReference[12]
    LineRefMap = new ObjectReference[12]
    NodeActMap = new Activator[12]
    LineActMap = new Activator[12]

    NodeActMap[0] = PerkNode00
    NodeActMap[1] = PerkNode01
    NodeActMap[2] = PerkNode02
    NodeActMap[3] = PerkNode03
    NodeActMap[4] = PerkNode04
    NodeActMap[5] = PerkNode05
    NodeActMap[6] = PerkNode06
    NodeActMap[7] = PerkNode07
    NodeActMap[8] = PerkNode08
    NodeActMap[9] = PerkNode09
    NodeActMap[10] = PerkNode10
    NodeActMap[11] = PerkNode11

    LineActMap[0] = PerkLine00
    LineActMap[1] = PerkLine01
    LineActMap[2] = PerkLine02
    LineActMap[3] = PerkLine03
    LineActMap[4] = PerkLine04
    LineActMap[5] = PerkLine05
    LineActMap[6] = PerkLine06
    LineActMap[7] = PerkLine07
    LineActMap[8] = PerkLine08
    LineActMap[9] = PerkLine09
    LineActMap[10] = PerkLine10
    LineActMap[11] = PerkLine11

    parent.Initialize()

    CheckCampfireExists()
endFunction

;@Override _Camp_PlaceableObjectBase
function PlaceObjects()
    CenterObject = PerkNodeController_PositionRef
    if PerkNode00 && PerkNode00_PositionRef
        PerkNode00Future = PlaceObject_PerkNode(PerkNode00, PerkNode00_PositionRef)
    endif
    if PerkNode01 && PerkNode01_PositionRef
        PerkNode01Future = PlaceObject_PerkNode(PerkNode01, PerkNode01_PositionRef)
    endif
    if PerkNode02 && PerkNode02_PositionRef
        PerkNode02Future = PlaceObject_PerkNode(PerkNode02, PerkNode02_PositionRef)
    endif
    if PerkNode03 && PerkNode03_PositionRef
        PerkNode03Future = PlaceObject_PerkNode(PerkNode03, PerkNode03_PositionRef)
    endif
    if PerkNode04 && PerkNode04_PositionRef
        PerkNode04Future = PlaceObject_PerkNode(PerkNode04, PerkNode04_PositionRef)
    endif
    if PerkNode05 && PerkNode05_PositionRef
        PerkNode05Future = PlaceObject_PerkNode(PerkNode05, PerkNode05_PositionRef)
    endif
    if PerkNode06 && PerkNode06_PositionRef
        PerkNode06Future = PlaceObject_PerkNode(PerkNode06, PerkNode06_PositionRef)
    endif
    if PerkNode07 && PerkNode07_PositionRef
        PerkNode07Future = PlaceObject_PerkNode(PerkNode07, PerkNode07_PositionRef)
    endif
    if PerkNode08 && PerkNode08_PositionRef
        PerkNode08Future = PlaceObject_PerkNode(PerkNode08, PerkNode08_PositionRef)
    endif
    if PerkNode09 && PerkNode09_PositionRef
        PerkNode09Future = PlaceObject_PerkNode(PerkNode09, PerkNode09_PositionRef)
    endif
    if PerkNode10 && PerkNode10_PositionRef
        PerkNode10Future = PlaceObject_PerkNode(PerkNode10, PerkNode10_PositionRef)
    endif
    if PerkNode11 && PerkNode11_PositionRef
        PerkNode11Future = PlaceObject_PerkNode(PerkNode11, PerkNode11_PositionRef)
    endif
    if PerkLine00_PositionRef
        PerkLine00Future = PlaceObject_PerkLine(PerkLine00, PerkLine00_PositionRef)
    endif
    if PerkLine01_PositionRef
        PerkLine01Future = PlaceObject_PerkLine(PerkLine01, PerkLine01_PositionRef)
    endif
    if PerkLine02_PositionRef
        PerkLine02Future = PlaceObject_PerkLine(PerkLine02, PerkLine02_PositionRef)
    endif
    if PerkLine03_PositionRef
        PerkLine03Future = PlaceObject_PerkLine(PerkLine03, PerkLine03_PositionRef)
    endif
    if PerkLine04_PositionRef
        PerkLine04Future = PlaceObject_PerkLine(PerkLine04, PerkLine04_PositionRef)
    endif
    if PerkLine05_PositionRef
        PerkLine05Future = PlaceObject_PerkLine(PerkLine05, PerkLine05_PositionRef)
    endif
    if PerkLine06_PositionRef
        PerkLine06Future = PlaceObject_PerkLine(PerkLine06, PerkLine06_PositionRef)
    endif
    if PerkLine07_PositionRef
        PerkLine07Future = PlaceObject_PerkLine(PerkLine07, PerkLine07_PositionRef)
    endif
    if PerkLine08_PositionRef
        PerkLine08Future = PlaceObject_PerkLine(PerkLine08, PerkLine08_PositionRef)
    endif
    if PerkLine09_PositionRef
        PerkLine09Future = PlaceObject_PerkLine(PerkLine09, PerkLine09_PositionRef)
    endif
    if PerkLine10_PositionRef
        PerkLine10Future = PlaceObject_PerkLine(PerkLine10, PerkLine10_PositionRef)
    endif
    if PerkLine11_PositionRef
        PerkLine11Future = PlaceObject_PerkLine(PerkLine11, PerkLine11_PositionRef)
    endif
    if PerkArtPlane_PositionRef
        PerkArtPlaneFuture = PlaceObject_ArtPlane(PerkArtPlane, PerkArtPlane_PositionRef)
    endif
endFunction

;@Override _Camp_PlaceableObjectBase
function GetResults()
    if PerkArtPlaneFuture
        myPerkArtPlane = GetFuture(PerkArtPlaneFuture).get_result()
        myPerkArtPlane.EnableNoWait(true)
        int i = 0
        while !myPerkArtPlane.Is3DLoaded() && i < 50
            utility.wait(0.1)
            i += 1
        endWhile
        Sound skill_glow_sound = Game.GetFormFromFile(0x06CC5D, "Skyrim.esm") as Sound ; UISkillsGlow
        skill_glow_sound.Play(myPerkArtPlane)
    endif
    ;utility.wait(2.0)

    if PerkLine00Future
        myPerkLine00 = GetFuture(PerkLine00Future).get_result()
        if myPerkLine00
            myPerkLine00.SetScale(PerkLine00_PositionRef.GetScale())
            myPerkLine00.EnableNoWait()
            LineRefMap[0] = myPerkLine00
            PerkLine00Future = None
        endif
    endif
    if PerkLine01Future
        myPerkLine01 = GetFuture(PerkLine01Future).get_result()
        if myPerkLine01
            myPerkLine01.SetScale(PerkLine01_PositionRef.GetScale())
            myPerkLine01.EnableNoWait()
            LineRefMap[1] = myPerkLine01
            PerkLine01Future = None
        endif
    endif
    if PerkLine02Future
        myPerkLine02 = GetFuture(PerkLine02Future).get_result()
        if myPerkLine02
            myPerkLine02.SetScale(PerkLine02_PositionRef.GetScale())
            myPerkLine02.EnableNoWait()
            LineRefMap[2] = myPerkLine02
            PerkLine02Future = None
        endif
    endif
    if PerkLine03Future
        myPerkLine03 = GetFuture(PerkLine03Future).get_result()
        if myPerkLine03
            myPerkLine03.SetScale(PerkLine03_PositionRef.GetScale())
            myPerkLine03.EnableNoWait()
            LineRefMap[3] = myPerkLine03
            PerkLine03Future = None
        endif
    endif
    if PerkLine04Future
        myPerkLine04 = GetFuture(PerkLine04Future).get_result()
        if myPerkLine04
            myPerkLine04.SetScale(PerkLine04_PositionRef.GetScale())
            myPerkLine04.EnableNoWait()
            LineRefMap[4] = myPerkLine04
            PerkLine04Future = None
        endif
    endif
    if PerkLine05Future
        myPerkLine05 = GetFuture(PerkLine05Future).get_result()
        if myPerkLine05
            myPerkLine05.SetScale(PerkLine05_PositionRef.GetScale())
            myPerkLine05.EnableNoWait()
            LineRefMap[5] = myPerkLine05
            PerkLine05Future = None
        endif
    endif
    if PerkLine06Future
        myPerkLine06 = GetFuture(PerkLine06Future).get_result()
        if myPerkLine06
            myPerkLine06.SetScale(PerkLine06_PositionRef.GetScale())
            myPerkLine06.EnableNoWait()
            LineRefMap[6] = myPerkLine06
            PerkLine06Future = None
        endif
    endif
    if PerkLine07Future
        myPerkLine07 = GetFuture(PerkLine07Future).get_result()
        if myPerkLine07
            myPerkLine07.SetScale(PerkLine07_PositionRef.GetScale())
            myPerkLine07.EnableNoWait()
            LineRefMap[7] = myPerkLine07
            PerkLine07Future = None
        endif
    endif
    if PerkLine08Future
        myPerkLine08 = GetFuture(PerkLine08Future).get_result()
        if myPerkLine08
            myPerkLine08.SetScale(PerkLine08_PositionRef.GetScale())
            myPerkLine08.EnableNoWait()
            LineRefMap[8] = myPerkLine08
            PerkLine08Future = None
        endif
    endif
    if PerkLine09Future
        myPerkLine09 = GetFuture(PerkLine09Future).get_result()
        if myPerkLine09
            myPerkLine09.SetScale(PerkLine09_PositionRef.GetScale())
            myPerkLine09.EnableNoWait()
            LineRefMap[9] = myPerkLine09
            PerkLine09Future = None
        endif
    endif
    if PerkLine10Future
        myPerkLine10 = GetFuture(PerkLine10Future).get_result()
        if myPerkLine10
            myPerkLine10.SetScale(PerkLine10_PositionRef.GetScale())
            myPerkLine10.EnableNoWait()
            LineRefMap[10] = myPerkLine10
            PerkLine10Future = None
        endif
    endif
    if PerkLine11Future
        myPerkLine11 = GetFuture(PerkLine11Future).get_result()
        if myPerkLine11
            myPerkLine11.SetScale(PerkLine11_PositionRef.GetScale())
            myPerkLine11.EnableNoWait()
            LineRefMap[11] = myPerkLine11
            PerkLine11Future = None
        endif
    endif

    if PerkNode00Future
        myPerkNode00 = GetFuture(PerkNode00Future).get_result()
        if myPerkNode00
            (myPerkNode00 as CampPerkNode).AssignController(self)
            NodeRefMap[0] = myPerkNode00
            PerkNode00Future = None
        endif
    endif
    if PerkNode01Future
        myPerkNode01 = GetFuture(PerkNode01Future).get_result()
        if myPerkNode01
            (myPerkNode01 as CampPerkNode).AssignController(self)
            NodeRefMap[1] = myPerkNode01
            PerkNode01Future = None
        endif
    endif
    if PerkNode02Future
        myPerkNode02 = GetFuture(PerkNode02Future).get_result()
        if myPerkNode02
            (myPerkNode02 as CampPerkNode).AssignController(self)
            NodeRefMap[2] = myPerkNode02
            PerkNode02Future = None
        endif
    endif
    if PerkNode03Future
        myPerkNode03 = GetFuture(PerkNode03Future).get_result()
        if myPerkNode03
            (myPerkNode03 as CampPerkNode).AssignController(self)
            NodeRefMap[3] = myPerkNode03
            PerkNode03Future = None
        endif
    endif
    if PerkNode04Future
        myPerkNode04 = GetFuture(PerkNode04Future).get_result()
        if myPerkNode04
            (myPerkNode04 as CampPerkNode).AssignController(self)
            NodeRefMap[4] = myPerkNode04
            PerkNode04Future = None
        endif
    endif
    if PerkNode05Future
        myPerkNode05 = GetFuture(PerkNode05Future).get_result()
        if myPerkNode05
            (myPerkNode05 as CampPerkNode).AssignController(self)
            NodeRefMap[5] = myPerkNode05
            PerkNode05Future = None
        endif
    endif
    if PerkNode06Future
        myPerkNode06 = GetFuture(PerkNode06Future).get_result()
        if myPerkNode06
            (myPerkNode06 as CampPerkNode).AssignController(self)
            NodeRefMap[6] = myPerkNode06
            PerkNode06Future = None
        endif
    endif
    if PerkNode07Future
        myPerkNode07 = GetFuture(PerkNode07Future).get_result()
        if myPerkNode07
            (myPerkNode07 as CampPerkNode).AssignController(self)
            NodeRefMap[7] = myPerkNode07
            PerkNode07Future = None
        endif
    endif
    if PerkNode08Future
        myPerkNode08 = GetFuture(PerkNode08Future).get_result()
        if myPerkNode08
            (myPerkNode08 as CampPerkNode).AssignController(self)
            NodeRefMap[8] = myPerkNode08
            PerkNode08Future = None
        endif
    endif
    if PerkNode09Future
        myPerkNode09 = GetFuture(PerkNode09Future).get_result()
        if myPerkNode09
            (myPerkNode09 as CampPerkNode).AssignController(self)
            NodeRefMap[9] = myPerkNode09
            PerkNode09Future = None
        endif
    endif
    if PerkNode10Future
        myPerkNode10 = GetFuture(PerkNode10Future).get_result()
        if myPerkNode10
            (myPerkNode10 as CampPerkNode).AssignController(self)
            NodeRefMap[10] = myPerkNode10
            PerkNode10Future = None
        endif
    endif
    if PerkNode11Future
        myPerkNode11 = GetFuture(PerkNode11Future).get_result()
        if myPerkNode11
            (myPerkNode11 as CampPerkNode).AssignController(self)
            NodeRefMap[11] = myPerkNode11
            PerkNode11Future = None
        endif
    endif

    if myPerkNode00
        (myPerkNode00 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode01
        (myPerkNode01 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode02
        (myPerkNode02 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode03
        (myPerkNode03 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode04
        (myPerkNode04 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode05
        (myPerkNode05 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode06
        (myPerkNode06 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode07
        (myPerkNode07 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode08
        (myPerkNode08 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode09
        (myPerkNode09 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode10
        (myPerkNode10 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode11
        (myPerkNode11 as CampPerkNode).AssignDownstreamNodes()
    endif
    InteractionLocked = false
endFunction

function TakeDown()
    int i = 0
    while InteractionLocked && i < 100
        utility.wait(0.1)
        i += 1
    endWhile
    if myCampfire
        (myCampfire as CampCampfire).myPerkNodeController = None
    endif

    if myPerkNode00
        (myPerkNode00 as CampPerkNode).ClearData()
    endif
    if myPerkNode01
        (myPerkNode01 as CampPerkNode).ClearData()
    endif
    if myPerkNode02
        (myPerkNode02 as CampPerkNode).ClearData()
    endif
    if myPerkNode03
        (myPerkNode03 as CampPerkNode).ClearData()
    endif
    if myPerkNode04
        (myPerkNode04 as CampPerkNode).ClearData()
    endif
    if myPerkNode05
        (myPerkNode05 as CampPerkNode).ClearData()
    endif
    if myPerkNode06
        (myPerkNode06 as CampPerkNode).ClearData()
    endif
    if myPerkNode07
        (myPerkNode07 as CampPerkNode).ClearData()
    endif
    if myPerkNode08
        (myPerkNode08 as CampPerkNode).ClearData()
    endif
    if myPerkNode09
        (myPerkNode09 as CampPerkNode).ClearData()
    endif
    if myPerkNode10
        (myPerkNode10 as CampPerkNode).ClearData()
    endif
    if myPerkNode11
        (myPerkNode11 as CampPerkNode).ClearData()
    endif

    TryToDisableAndDeleteRef(myPerkNode00)
    TryToDisableAndDeleteRef(myPerkNode01)
    TryToDisableAndDeleteRef(myPerkNode02)
    TryToDisableAndDeleteRef(myPerkNode03)
    TryToDisableAndDeleteRef(myPerkNode04)
    TryToDisableAndDeleteRef(myPerkNode05)
    TryToDisableAndDeleteRef(myPerkNode06)
    TryToDisableAndDeleteRef(myPerkNode07)
    TryToDisableAndDeleteRef(myPerkNode08)
    TryToDisableAndDeleteRef(myPerkNode09)
    TryToDisableAndDeleteRef(myPerkNode10)
    TryToDisableAndDeleteRef(myPerkNode11)
    TryToDisableAndDeleteRef(myPerkLine00)
    TryToDisableAndDeleteRef(myPerkLine01)
    TryToDisableAndDeleteRef(myPerkLine02)
    TryToDisableAndDeleteRef(myPerkLine03)
    TryToDisableAndDeleteRef(myPerkLine04)
    TryToDisableAndDeleteRef(myPerkLine05)
    TryToDisableAndDeleteRef(myPerkLine06)
    TryToDisableAndDeleteRef(myPerkLine07)
    TryToDisableAndDeleteRef(myPerkLine08)
    TryToDisableAndDeleteRef(myPerkLine09)
    TryToDisableAndDeleteRef(myPerkLine10)
    TryToDisableAndDeleteRef(myPerkLine11)
    TryToDisableAndDeleteRef(myPerkArtPlane)

    NodeRefMap = new ObjectReference[12]
    LineRefMap = new ObjectReference[12]
    NodeActMap = new Activator[12]
    LineActMap = new Activator[12]

    myCampfire = None
    myPerkNode00 = None
    myPerkNode01 = None
    myPerkNode02 = None
    myPerkNode03 = None
    myPerkNode04 = None
    myPerkNode05 = None
    myPerkNode06 = None
    myPerkNode07 = None
    myPerkNode08 = None
    myPerkNode09 = None
    myPerkNode10 = None
    myPerkNode11 = None
    myPerkLine00 = None
    myPerkLine01 = None
    myPerkLine02 = None
    myPerkLine03 = None
    myPerkLine04 = None
    myPerkLine05 = None
    myPerkLine06 = None
    myPerkLine07 = None
    myPerkLine08 = None
    myPerkLine09 = None
    myPerkLine10 = None
    myPerkLine11 = None
    myPerkArtPlane = None

    TryToDisableAndDeleteRef(self)
endFunction

ObjectReference function PlaceObject_PerkNode(Activator akPerkNode, ObjectReference akPerkNodePositionRef)
    return PlacementSystem.PlaceObject(self, akPerkNode, akPerkNodePositionRef, initially_disabled = true, is_temp = is_temporary)
endFunction

ObjectReference function PlaceObject_PerkLine(Activator akPerkLine, ObjectReference akPerkLinePositionRef)
    return PlacementSystem.PlaceObject(self, akPerkLine, akPerkLinePositionRef,                \
                                       x_local_ang_adjust = akPerkLinePositionRef.GetAngleX(), \
                                       z_local_ang_adjust = akPerkLinePositionRef.GetAngleZ(), \
                                       initially_disabled = true, inverted_local_y = true, is_propped = true, is_temp = is_temporary)
endFunction

ObjectReference function PlaceObject_ArtPlane(Static akArtPlane, ObjectReference akArtPlanePositionRef)
    return PlacementSystem.PlaceObject(self, akArtPlane, akArtPlanePositionRef, initially_disabled = true, is_temp = is_temporary)
endFunction

FormList function GetCampfireFormList()
    FormList list = Game.GetFormFromFile(0x06BBE8, "Campfire.esm") as FormList
    if !list
        list = Game.GetFormFromFile(0x06BBE8, "Campfire.esp") as FormList
    endif
    return list
endFunction

function CheckCampfireExists()
    ; Campfire 1.8 Fix: Try to find a nearby campfire and kill myself if not found.
    FormList _Camp_CampfireCampfires = GetCampfireFormList()

    ObjectReference nearbyCampfire = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_CampfireCampfires, self, 100.0)
    if !nearbyCampfire || nearbyCampfire.IsDisabled()
        CampDebug(2, "(Init/Attach) Found invalid Campfire perk node controller " + self + ". Cleaning up.")
        int i = 0
        while !initialized && i < 20
            Utility.Wait(1)
            i += 1
        endWhile
        TakeDown()
        CampDebug(2, self + " removed.")
    endif
endFunction

Event OnCellAttach()
    CheckCampfireExists()
EndEvent

Event OnCellDetach()
    CampDebug(2, "Checking if Perk Node Controller is valid on cell detach. (myCampfire = " + myCampfire + ")")
    if !myCampfire
        CampDebug(2, "(Detach) Found invalid Campfire perk node controller " + self + " (parent campfire did not exist). Cleaning up.")
        TakeDown()
        CampDebug(2, self + " removed.")
    elseif myCampfire.IsDisabled()
        CampDebug(2, "(Detach) Found invalid Campfire perk node controller " + self + " (parent campfire " + myCampfire + " was disabled). Cleaning up.")
        TakeDown()
        CampDebug(2, self + " removed.")
    endif
EndEvent