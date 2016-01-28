scriptname CampPerkNodeController extends _Camp_PlaceableObjectBase
{Handles node graph behavior and presentation.}

import _CampInternal

Activator property PerkNode0 auto
{ The 0th perk node. The origin (starting) node. }
Activator property PerkNode1 auto
{ The 1st perk node. }
Activator property PerkNode2 auto
{ The 2nd perk node. }
Activator property PerkNode3 auto
{ The 3rd perk node. }
Activator property PerkNode4 auto
{ The 4th perk node. }
Activator property PerkNode5 auto
{ The 5th perk node. }
Activator property PerkNode6 auto
{ The 6th perk node. }
Activator property PerkNode7 auto
{ The 7th perk node. }
Activator property PerkNode8 auto
{ The 8th perk node. }
Activator property PerkNode9 auto
{ The 9th perk node. }
Activator property PerkNode10 auto
{ The 10th perk node. }
Activator property PerkNode11 auto
{ The 11th perk node. }
Activator property PerkLine0 auto
{ The 0th perk line. }
Activator property PerkLine1 auto
{ The 1st perk line. }
Activator property PerkLine2 auto
{ The 2nd perk line. }
Activator property PerkLine3 auto
{ The 3rd perk line. }
Activator property PerkLine4 auto
{ The 4th perk line. }
Activator property PerkLine5 auto
{ The 5th perk line. }
Activator property PerkLine6 auto
{ The 6th perk line. }
Activator property PerkLine7 auto
{ The 7th perk line. }
Activator property PerkLine8 auto
{ The 8th perk line. }
Activator property PerkLine9 auto
{ The 9th perk line. }
Activator property PerkLine10 auto
{ The 10th perk line. }
Activator property PerkLine11 auto
{ The 11th perk line. }
Static property PerkArtPlane auto
{ The perk art plane graphic object. }
Sound property UISkillsGlow auto
{ Auto-fill in CK. }

ObjectReference property PerkNode0Future auto hidden
ObjectReference property PerkNode1Future auto hidden
ObjectReference property PerkNode2Future auto hidden
ObjectReference property PerkNode3Future auto hidden
ObjectReference property PerkNode4Future auto hidden
ObjectReference property PerkNode5Future auto hidden
ObjectReference property PerkNode6Future auto hidden
ObjectReference property PerkNode7Future auto hidden
ObjectReference property PerkNode8Future auto hidden
ObjectReference property PerkNode9Future auto hidden
ObjectReference property PerkNode10Future auto hidden
ObjectReference property PerkNode11Future auto hidden
ObjectReference property PerkLine0Future auto hidden
ObjectReference property PerkLine1Future auto hidden
ObjectReference property PerkLine2Future auto hidden
ObjectReference property PerkLine3Future auto hidden
ObjectReference property PerkLine4Future auto hidden
ObjectReference property PerkLine5Future auto hidden
ObjectReference property PerkLine6Future auto hidden
ObjectReference property PerkLine7Future auto hidden
ObjectReference property PerkLine8Future auto hidden
ObjectReference property PerkLine9Future auto hidden
ObjectReference property PerkLine10Future auto hidden
ObjectReference property PerkLine11Future auto hidden
ObjectReference property PerkArtPlaneFuture auto hidden

ObjectReference property myCampfire auto hidden
ObjectReference property myPerkArtPlane auto hidden
ObjectReference property myPerkNode0 auto hidden
ObjectReference property myPerkNode1 auto hidden
ObjectReference property myPerkNode2 auto hidden
ObjectReference property myPerkNode3 auto hidden
ObjectReference property myPerkNode4 auto hidden
ObjectReference property myPerkNode5 auto hidden
ObjectReference property myPerkNode6 auto hidden
ObjectReference property myPerkNode7 auto hidden
ObjectReference property myPerkNode8 auto hidden
ObjectReference property myPerkNode9 auto hidden
ObjectReference property myPerkNode10 auto hidden
ObjectReference property myPerkNode11 auto hidden
ObjectReference property myPerkLine0 auto hidden
ObjectReference property myPerkLine1 auto hidden
ObjectReference property myPerkLine2 auto hidden
ObjectReference property myPerkLine3 auto hidden
ObjectReference property myPerkLine4 auto hidden
ObjectReference property myPerkLine5 auto hidden
ObjectReference property myPerkLine6 auto hidden
ObjectReference property myPerkLine7 auto hidden
ObjectReference property myPerkLine8 auto hidden
ObjectReference property myPerkLine9 auto hidden
ObjectReference property myPerkLine10 auto hidden
ObjectReference property myPerkLine11 auto hidden

ObjectReference property PerkNodeController_PositionRef auto
{ The perk node controller position reference. }
ObjectReference property PerkNode0_PositionRef auto
{ The 0th perk node position reference. }
ObjectReference property PerkNode1_PositionRef auto
{ The 1st perk node position reference. }
ObjectReference property PerkNode2_PositionRef auto
{ The 2nd perk node position reference. }
ObjectReference property PerkNode3_PositionRef auto
{ The 3rd perk node position reference. }
ObjectReference property PerkNode4_PositionRef auto
{ The 4th perk node position reference. }
ObjectReference property PerkNode5_PositionRef auto
{ The 5th perk node position reference. }
ObjectReference property PerkNode6_PositionRef auto
{ The 6th perk node position reference. }
ObjectReference property PerkNode7_PositionRef auto
{ The 7th perk node position reference. }
ObjectReference property PerkNode8_PositionRef auto
{ The 8th perk node position reference. }
ObjectReference property PerkNode9_PositionRef auto
{ The 9th perk node position reference. }
ObjectReference property PerkNode10_PositionRef auto
{ The 10th perk node position reference. }
ObjectReference property PerkNode11_PositionRef auto
{ The 11th perk node position reference. }
ObjectReference property PerkLine0_PositionRef auto
{ The 0th perk line position reference. }
ObjectReference property PerkLine1_PositionRef auto
{ The 1st perk line position reference. }
ObjectReference property PerkLine2_PositionRef auto
{ The 2nd perk line position reference. }
ObjectReference property PerkLine3_PositionRef auto
{ The 3rd perk line position reference. }
ObjectReference property PerkLine4_PositionRef auto
{ The 4th perk line position reference. }
ObjectReference property PerkLine5_PositionRef auto
{ The 5th perk line position reference. }
ObjectReference property PerkLine6_PositionRef auto
{ The 6th perk line position reference. }
ObjectReference property PerkLine7_PositionRef auto
{ The 7th perk line position reference. }
ObjectReference property PerkLine8_PositionRef auto
{ The 8th perk line position reference. }
ObjectReference property PerkLine9_PositionRef auto
{ The 9th perk line position reference. }
ObjectReference property PerkLine10_PositionRef auto
{ The 10th perk line position reference. }
ObjectReference property PerkLine11_PositionRef auto
{ The 11th perk line position reference. }
ObjectReference property PerkArtPlane_PositionRef auto
{ The perk art plane graphic object position reference. }

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

    NodeActMap[0] = PerkNode0
    NodeActMap[1] = PerkNode1
    NodeActMap[2] = PerkNode2
    NodeActMap[3] = PerkNode3
    NodeActMap[4] = PerkNode4
    NodeActMap[5] = PerkNode5
    NodeActMap[6] = PerkNode6
    NodeActMap[7] = PerkNode7
    NodeActMap[8] = PerkNode8
    NodeActMap[9] = PerkNode9
    NodeActMap[10] = PerkNode10
    NodeActMap[11] = PerkNode11

    LineActMap[0] = PerkLine0
    LineActMap[1] = PerkLine1
    LineActMap[2] = PerkLine2
    LineActMap[3] = PerkLine3
    LineActMap[4] = PerkLine4
    LineActMap[5] = PerkLine5
    LineActMap[6] = PerkLine6
    LineActMap[7] = PerkLine7
    LineActMap[8] = PerkLine8
    LineActMap[9] = PerkLine9
    LineActMap[10] = PerkLine10
    LineActMap[11] = PerkLine11

    parent.Initialize()
endFunction

;@Override _Camp_PlaceableObjectBase
function PlaceObjects()
    CenterObject = PerkNodeController_PositionRef
    if PerkNode0 && PerkNode0_PositionRef
        PerkNode0Future = PlaceObject_PerkNode(PerkNode0, PerkNode0_PositionRef)
    endif
    if PerkNode1 && PerkNode1_PositionRef
        PerkNode1Future = PlaceObject_PerkNode(PerkNode1, PerkNode1_PositionRef)
    endif
    if PerkNode2 && PerkNode2_PositionRef
        PerkNode2Future = PlaceObject_PerkNode(PerkNode2, PerkNode2_PositionRef)
    endif
    if PerkNode3 && PerkNode3_PositionRef
        PerkNode3Future = PlaceObject_PerkNode(PerkNode3, PerkNode3_PositionRef)
    endif
    if PerkNode4 && PerkNode4_PositionRef
        PerkNode4Future = PlaceObject_PerkNode(PerkNode4, PerkNode4_PositionRef)
    endif
    if PerkNode5 && PerkNode5_PositionRef
        PerkNode5Future = PlaceObject_PerkNode(PerkNode5, PerkNode5_PositionRef)
    endif
    if PerkNode6 && PerkNode6_PositionRef
        PerkNode6Future = PlaceObject_PerkNode(PerkNode6, PerkNode6_PositionRef)
    endif
    if PerkNode7 && PerkNode7_PositionRef
        PerkNode7Future = PlaceObject_PerkNode(PerkNode7, PerkNode7_PositionRef)
    endif
    if PerkNode8 && PerkNode8_PositionRef
        PerkNode8Future = PlaceObject_PerkNode(PerkNode8, PerkNode8_PositionRef)
    endif
    if PerkNode9 && PerkNode9_PositionRef
        PerkNode9Future = PlaceObject_PerkNode(PerkNode9, PerkNode9_PositionRef)
    endif
    if PerkNode10 && PerkNode10_PositionRef
        PerkNode10Future = PlaceObject_PerkNode(PerkNode10, PerkNode10_PositionRef)
    endif
    if PerkNode11 && PerkNode11_PositionRef
        PerkNode11Future = PlaceObject_PerkNode(PerkNode11, PerkNode11_PositionRef)
    endif
    if PerkLine0_PositionRef
        PerkLine0Future = PlaceObject_PerkLine(PerkLine0, PerkLine0_PositionRef)
    endif
    if PerkLine1_PositionRef
        PerkLine1Future = PlaceObject_PerkLine(PerkLine1, PerkLine1_PositionRef)
    endif
    if PerkLine2_PositionRef
        PerkLine2Future = PlaceObject_PerkLine(PerkLine2, PerkLine2_PositionRef)
    endif
    if PerkLine3_PositionRef
        PerkLine3Future = PlaceObject_PerkLine(PerkLine3, PerkLine3_PositionRef)
    endif
    if PerkLine4_PositionRef
        PerkLine4Future = PlaceObject_PerkLine(PerkLine4, PerkLine4_PositionRef)
    endif
    if PerkLine5_PositionRef
        PerkLine5Future = PlaceObject_PerkLine(PerkLine5, PerkLine5_PositionRef)
    endif
    if PerkLine6_PositionRef
        PerkLine6Future = PlaceObject_PerkLine(PerkLine6, PerkLine6_PositionRef)
    endif
    if PerkLine7_PositionRef
        PerkLine7Future = PlaceObject_PerkLine(PerkLine7, PerkLine7_PositionRef)
    endif
    if PerkLine8_PositionRef
        PerkLine8Future = PlaceObject_PerkLine(PerkLine8, PerkLine8_PositionRef)
    endif
    if PerkLine9_PositionRef
        PerkLine9Future = PlaceObject_PerkLine(PerkLine9, PerkLine9_PositionRef)
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
        UISkillsGlow.Play(myPerkArtPlane)
    endif
    ;utility.wait(2.0)

    if PerkLine0Future
        myPerkLine0 = GetFuture(PerkLine0Future).get_result()
        if myPerkLine0
            myPerkLine0.SetScale(PerkLine0_PositionRef.GetScale())
            myPerkLine0.EnableNoWait()
            LineRefMap[0] = myPerkLine0
            PerkLine0Future = None
        endif
    endif
    if PerkLine1Future
        myPerkLine1 = GetFuture(PerkLine1Future).get_result()
        if myPerkLine1
            myPerkLine1.SetScale(PerkLine1_PositionRef.GetScale())
            myPerkLine1.EnableNoWait()
            LineRefMap[1] = myPerkLine1
            PerkLine1Future = None
        endif
    endif
    if PerkLine2Future
        myPerkLine2 = GetFuture(PerkLine2Future).get_result()
        if myPerkLine2
            myPerkLine2.SetScale(PerkLine2_PositionRef.GetScale())
            myPerkLine2.EnableNoWait()
            LineRefMap[2] = myPerkLine2
            PerkLine2Future = None
        endif
    endif
    if PerkLine3Future
        myPerkLine3 = GetFuture(PerkLine3Future).get_result()
        if myPerkLine3
            myPerkLine3.SetScale(PerkLine3_PositionRef.GetScale())
            myPerkLine3.EnableNoWait()
            LineRefMap[3] = myPerkLine3
            PerkLine3Future = None
        endif
    endif
    if PerkLine4Future
        myPerkLine4 = GetFuture(PerkLine4Future).get_result()
        if myPerkLine4
            myPerkLine4.SetScale(PerkLine4_PositionRef.GetScale())
            myPerkLine4.EnableNoWait()
            LineRefMap[4] = myPerkLine4
            PerkLine4Future = None
        endif
    endif
    if PerkLine5Future
        myPerkLine5 = GetFuture(PerkLine5Future).get_result()
        if myPerkLine5
            myPerkLine5.SetScale(PerkLine5_PositionRef.GetScale())
            myPerkLine5.EnableNoWait()
            LineRefMap[5] = myPerkLine5
            PerkLine5Future = None
        endif
    endif
    if PerkLine6Future
        myPerkLine6 = GetFuture(PerkLine6Future).get_result()
        if myPerkLine6
            myPerkLine6.SetScale(PerkLine6_PositionRef.GetScale())
            myPerkLine6.EnableNoWait()
            LineRefMap[6] = myPerkLine6
            PerkLine6Future = None
        endif
    endif
    if PerkLine7Future
        myPerkLine7 = GetFuture(PerkLine7Future).get_result()
        if myPerkLine7
            myPerkLine7.SetScale(PerkLine7_PositionRef.GetScale())
            myPerkLine7.EnableNoWait()
            LineRefMap[7] = myPerkLine7
            PerkLine7Future = None
        endif
    endif
    if PerkLine8Future
        myPerkLine8 = GetFuture(PerkLine8Future).get_result()
        if myPerkLine8
            myPerkLine8.SetScale(PerkLine8_PositionRef.GetScale())
            myPerkLine8.EnableNoWait()
            LineRefMap[8] = myPerkLine8
            PerkLine8Future = None
        endif
    endif
    if PerkLine9Future
        myPerkLine9 = GetFuture(PerkLine9Future).get_result()
        if myPerkLine9
            myPerkLine9.SetScale(PerkLine9_PositionRef.GetScale())
            myPerkLine9.EnableNoWait()
            LineRefMap[9] = myPerkLine9
            PerkLine9Future = None
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

    if PerkNode0Future
        myPerkNode0 = GetFuture(PerkNode0Future).get_result()
        if myPerkNode0
            (myPerkNode0 as CampPerkNode).AssignController(self)
            NodeRefMap[0] = myPerkNode0
            PerkNode0Future = None
        endif
    endif
    if PerkNode1Future
        myPerkNode1 = GetFuture(PerkNode1Future).get_result()
        if myPerkNode1
            (myPerkNode1 as CampPerkNode).AssignController(self)
            NodeRefMap[1] = myPerkNode1
            PerkNode1Future = None
        endif
    endif
    if PerkNode2Future
        myPerkNode2 = GetFuture(PerkNode2Future).get_result()
        if myPerkNode2
            (myPerkNode2 as CampPerkNode).AssignController(self)
            NodeRefMap[2] = myPerkNode2
            PerkNode2Future = None
        endif
    endif
    if PerkNode3Future
        myPerkNode3 = GetFuture(PerkNode3Future).get_result()
        if myPerkNode3
            (myPerkNode3 as CampPerkNode).AssignController(self)
            NodeRefMap[3] = myPerkNode3
            PerkNode3Future = None
        endif
    endif
    if PerkNode4Future
        myPerkNode4 = GetFuture(PerkNode4Future).get_result()
        if myPerkNode4
            (myPerkNode4 as CampPerkNode).AssignController(self)
            NodeRefMap[4] = myPerkNode4
            PerkNode4Future = None
        endif
    endif
    if PerkNode5Future
        myPerkNode5 = GetFuture(PerkNode5Future).get_result()
        if myPerkNode5
            (myPerkNode5 as CampPerkNode).AssignController(self)
            NodeRefMap[5] = myPerkNode5
            PerkNode5Future = None
        endif
    endif
    if PerkNode6Future
        myPerkNode6 = GetFuture(PerkNode6Future).get_result()
        if myPerkNode6
            (myPerkNode6 as CampPerkNode).AssignController(self)
            NodeRefMap[6] = myPerkNode6
            PerkNode6Future = None
        endif
    endif
    if PerkNode7Future
        myPerkNode7 = GetFuture(PerkNode7Future).get_result()
        if myPerkNode7
            (myPerkNode7 as CampPerkNode).AssignController(self)
            NodeRefMap[7] = myPerkNode7
            PerkNode7Future = None
        endif
    endif
    if PerkNode8Future
        myPerkNode8 = GetFuture(PerkNode8Future).get_result()
        if myPerkNode8
            (myPerkNode8 as CampPerkNode).AssignController(self)
            NodeRefMap[8] = myPerkNode8
            PerkNode8Future = None
        endif
    endif
    if PerkNode9Future
        myPerkNode9 = GetFuture(PerkNode9Future).get_result()
        if myPerkNode9
            (myPerkNode9 as CampPerkNode).AssignController(self)
            NodeRefMap[9] = myPerkNode9
            PerkNode9Future = None
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

    if myPerkNode0
        (myPerkNode0 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode1
        (myPerkNode1 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode2
        (myPerkNode2 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode3
        (myPerkNode3 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode4
        (myPerkNode4 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode5
        (myPerkNode5 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode6
        (myPerkNode6 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode7
        (myPerkNode7 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode8
        (myPerkNode8 as CampPerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode9
        (myPerkNode9 as CampPerkNode).AssignDownstreamNodes()
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
    (myCampfire as CampCampfire).myPerkNodeController = None
    TryToDisableAndDeleteRef(myPerkNode0)
    TryToDisableAndDeleteRef(myPerkNode1)
    TryToDisableAndDeleteRef(myPerkNode2)
    TryToDisableAndDeleteRef(myPerkNode3)
    TryToDisableAndDeleteRef(myPerkNode4)
    TryToDisableAndDeleteRef(myPerkNode5)
    TryToDisableAndDeleteRef(myPerkNode6)
    TryToDisableAndDeleteRef(myPerkNode7)
    TryToDisableAndDeleteRef(myPerkNode8)
    TryToDisableAndDeleteRef(myPerkNode9)
    TryToDisableAndDeleteRef(myPerkNode10)
    TryToDisableAndDeleteRef(myPerkNode11)
    TryToDisableAndDeleteRef(myPerkLine0)
    TryToDisableAndDeleteRef(myPerkLine1)
    TryToDisableAndDeleteRef(myPerkLine2)
    TryToDisableAndDeleteRef(myPerkLine3)
    TryToDisableAndDeleteRef(myPerkLine4)
    TryToDisableAndDeleteRef(myPerkLine5)
    TryToDisableAndDeleteRef(myPerkLine6)
    TryToDisableAndDeleteRef(myPerkLine7)
    TryToDisableAndDeleteRef(myPerkLine8)
    TryToDisableAndDeleteRef(myPerkLine9)
    TryToDisableAndDeleteRef(myPerkLine10)
    TryToDisableAndDeleteRef(myPerkLine11)
    TryToDisableAndDeleteRef(myPerkArtPlane)

    myCampfire = None
    myPerkNode0 = None
    myPerkNode1 = None
    myPerkNode2 = None
    myPerkNode3 = None
    myPerkNode4 = None
    myPerkNode5 = None
    myPerkNode6 = None
    myPerkNode7 = None
    myPerkNode8 = None
    myPerkNode9 = None
    myPerkNode10 = None
    myPerkNode11 = None
    myPerkLine0 = None
    myPerkLine1 = None
    myPerkLine2 = None
    myPerkLine3 = None
    myPerkLine4 = None
    myPerkLine5 = None
    myPerkLine6 = None
    myPerkLine7 = None
    myPerkLine8 = None
    myPerkLine9 = None
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