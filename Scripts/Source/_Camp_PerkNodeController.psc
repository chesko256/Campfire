scriptname _Camp_PerkNodeController extends _Camp_PlaceableObjectBase
{Handles node graph behavior and presentation.}

import _CampInternal

Actor property PlayerRef auto

ObjectReference property myCampfire auto hidden
ObjectReference property _Camp_PerkBGColliderRef auto hidden
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

Activator property PerkNode0 auto
Activator property PerkNode1 auto
Activator property PerkNode2 auto
Activator property PerkNode3 auto
Activator property PerkNode4 auto
Activator property PerkNode5 auto
Activator property PerkNode6 auto
Activator property PerkNode7 auto
Activator property PerkNode8 auto
Activator property PerkNode9 auto
Activator property PerkNode10 auto
Activator property PerkNode11 auto
Activator property PerkLine0 auto
Activator property PerkLine1 auto
Activator property PerkLine2 auto
Activator property PerkLine3 auto
Activator property PerkLine4 auto
Activator property PerkLine5 auto
Activator property PerkLine6 auto
Activator property PerkLine7 auto
Activator property PerkLine8 auto
Activator property PerkLine9 auto
Activator property PerkLine10 auto
Activator property PerkLine11 auto

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

ObjectReference property PerkNodeController_PositionRef auto
ObjectReference property PerkNode0_PositionRef auto
ObjectReference property PerkNode1_PositionRef auto
ObjectReference property PerkNode2_PositionRef auto
ObjectReference property PerkNode3_PositionRef auto
ObjectReference property PerkNode4_PositionRef auto
ObjectReference property PerkNode5_PositionRef auto
ObjectReference property PerkNode6_PositionRef auto
ObjectReference property PerkNode7_PositionRef auto
ObjectReference property PerkNode8_PositionRef auto
ObjectReference property PerkNode9_PositionRef auto
ObjectReference property PerkNode10_PositionRef auto
ObjectReference property PerkNode11_PositionRef auto
ObjectReference property PerkLine0_PositionRef auto
ObjectReference property PerkLine1_PositionRef auto
ObjectReference property PerkLine2_PositionRef auto
ObjectReference property PerkLine3_PositionRef auto
ObjectReference property PerkLine4_PositionRef auto
ObjectReference property PerkLine5_PositionRef auto
ObjectReference property PerkLine6_PositionRef auto
ObjectReference property PerkLine7_PositionRef auto
ObjectReference property PerkLine8_PositionRef auto
ObjectReference property PerkLine9_PositionRef auto
ObjectReference property PerkLine10_PositionRef auto
ObjectReference property PerkLine11_PositionRef auto

ObjectReference[] property NodeRefMap auto hidden
ObjectReference[] property LineRefMap auto hidden
Activator[] property NodeActMap auto hidden
Activator[] property LineActMap auto hidden

bool property TakedownInitiated = false auto hidden

function Initialize()
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
endFunction

;@Override _Camp_PlaceableObjectBase
function GetResults()
    if PerkNode0Future
        myPerkNode0 = GetFuture(PerkNode0Future).get_result()
        if myPerkNode0
            (myPerkNode0 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[0] = myPerkNode0
        endif
    endif
    if PerkNode1Future
        myPerkNode1 = GetFuture(PerkNode1Future).get_result()
        if myPerkNode1
            (myPerkNode1 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[1] = myPerkNode1
        endif
    endif
    if PerkNode2Future
        myPerkNode2 = GetFuture(PerkNode2Future).get_result()
        if myPerkNode2
            (myPerkNode2 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[2] = myPerkNode2
        endif
    endif
    if PerkNode3Future
        myPerkNode3 = GetFuture(PerkNode3Future).get_result()
        if myPerkNode3
            (myPerkNode3 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[3] = myPerkNode3
        endif
    endif
    if PerkNode4Future
        myPerkNode4 = GetFuture(PerkNode4Future).get_result()
        if myPerkNode4
            (myPerkNode4 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[4] = myPerkNode4
        endif
    endif
    if PerkNode5Future
        myPerkNode5 = GetFuture(PerkNode5Future).get_result()
        if myPerkNode5
            (myPerkNode5 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[5] = myPerkNode5
        endif
    endif
    if PerkNode6Future
        myPerkNode6 = GetFuture(PerkNode6Future).get_result()
        if myPerkNode6
            (myPerkNode6 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[6] = myPerkNode6
        endif
    endif
    if PerkNode7Future
        myPerkNode7 = GetFuture(PerkNode7Future).get_result()
        if myPerkNode7
            (myPerkNode7 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[7] = myPerkNode7
        endif
    endif
    if PerkNode8Future
        myPerkNode8 = GetFuture(PerkNode8Future).get_result()
        if myPerkNode8
            (myPerkNode8 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[8] = myPerkNode8
        endif
    endif
    if PerkNode9Future
        myPerkNode9 = GetFuture(PerkNode9Future).get_result()
        if myPerkNode9
            (myPerkNode9 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[9] = myPerkNode9
        endif
    endif
    if PerkNode10Future
        myPerkNode10 = GetFuture(PerkNode10Future).get_result()
        if myPerkNode10
            (myPerkNode10 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[10] = myPerkNode10
        endif
    endif
    if PerkNode11Future
        myPerkNode11 = GetFuture(PerkNode11Future).get_result()
        if myPerkNode11
            (myPerkNode11 as _Camp_PerkNode).AssignController(self)
            NodeRefMap[11] = myPerkNode11
        endif
    endif
    if PerkLine0Future
        myPerkLine0 = GetFuture(PerkLine0Future).get_result()
        if myPerkLine0
            myPerkLine0.SetScale(PerkLine0_PositionRef.GetScale())
            myPerkLine0.EnableNoWait()
            LineRefMap[0] = myPerkLine0
        endif
    endif
    if PerkLine1Future
        myPerkLine1 = GetFuture(PerkLine1Future).get_result()
        if myPerkLine1
            myPerkLine1.SetScale(PerkLine1_PositionRef.GetScale())
            myPerkLine1.EnableNoWait()
            LineRefMap[1] = myPerkLine1
        endif
    endif
    if PerkLine2Future
        myPerkLine2 = GetFuture(PerkLine2Future).get_result()
        if myPerkLine2
            myPerkLine2.SetScale(PerkLine2_PositionRef.GetScale())
            myPerkLine2.EnableNoWait()
            LineRefMap[2] = myPerkLine2
        endif
    endif
    if PerkLine3Future
        myPerkLine3 = GetFuture(PerkLine3Future).get_result()
        if myPerkLine3
            myPerkLine3.SetScale(PerkLine3_PositionRef.GetScale())
            myPerkLine3.EnableNoWait()
            LineRefMap[3] = myPerkLine3
        endif
    endif
    if PerkLine4Future
        myPerkLine4 = GetFuture(PerkLine4Future).get_result()
        if myPerkLine4
            myPerkLine4.SetScale(PerkLine4_PositionRef.GetScale())
            myPerkLine4.EnableNoWait()
            LineRefMap[4] = myPerkLine4
        endif
    endif
    if PerkLine5Future
        myPerkLine5 = GetFuture(PerkLine5Future).get_result()
        if myPerkLine5
            myPerkLine5.SetScale(PerkLine5_PositionRef.GetScale())
            myPerkLine5.EnableNoWait()
            LineRefMap[5] = myPerkLine5
        endif
    endif
    if PerkLine6Future
        myPerkLine6 = GetFuture(PerkLine6Future).get_result()
        if myPerkLine6
            myPerkLine6.SetScale(PerkLine6_PositionRef.GetScale())
            myPerkLine6.EnableNoWait()
            LineRefMap[6] = myPerkLine6
        endif
    endif
    if PerkLine7Future
        myPerkLine7 = GetFuture(PerkLine7Future).get_result()
        if myPerkLine7
            myPerkLine7.SetScale(PerkLine7_PositionRef.GetScale())
            myPerkLine7.EnableNoWait()
            LineRefMap[7] = myPerkLine7
        endif
    endif
    if PerkLine8Future
        myPerkLine8 = GetFuture(PerkLine8Future).get_result()
        if myPerkLine8
            myPerkLine8.SetScale(PerkLine8_PositionRef.GetScale())
            myPerkLine8.EnableNoWait()
            LineRefMap[8] = myPerkLine8
        endif
    endif
    if PerkLine9Future
        myPerkLine9 = GetFuture(PerkLine9Future).get_result()
        if myPerkLine9
            myPerkLine9.SetScale(PerkLine9_PositionRef.GetScale())
            myPerkLine9.EnableNoWait()
            LineRefMap[9] = myPerkLine9
        endif
    endif
    if PerkLine10Future
        myPerkLine10 = GetFuture(PerkLine10Future).get_result()
        if myPerkLine10
            myPerkLine10.SetScale(PerkLine10_PositionRef.GetScale())
            myPerkLine10.EnableNoWait()
            LineRefMap[10] = myPerkLine10
        endif
    endif
    if PerkLine11Future
        myPerkLine11 = GetFuture(PerkLine11Future).get_result()
        if myPerkLine11
            myPerkLine11.SetScale(PerkLine11_PositionRef.GetScale())
            myPerkLine11.EnableNoWait()
            LineRefMap[11] = myPerkLine11
        endif
    endif

    if myPerkNode0
        (myPerkNode0 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode1
        (myPerkNode1 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode2
        (myPerkNode2 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode3
        (myPerkNode3 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode4
        (myPerkNode4 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode5
        (myPerkNode5 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode6
        (myPerkNode6 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode7
        (myPerkNode7 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode8
        (myPerkNode8 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode9
        (myPerkNode9 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode10
        (myPerkNode10 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
    if myPerkNode11
        (myPerkNode11 as _Camp_PerkNode).AssignDownstreamNodes()
    endif
endFunction

function TakeDown()
    TakedownInitiated = true
    parent.TakeDown()
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
endFunction

ObjectReference function PlaceObject_PerkNode(Activator akPerkNode, ObjectReference akPerkNodePositionRef)
    return PlacementSystem.PlaceObject(self, akPerkNode, akPerkNodePositionRef)
endFunction

ObjectReference function PlaceObject_PerkLine(Activator akPerkLine, ObjectReference akPerkLinePositionRef)
    return PlacementSystem.PlaceObject(self, akPerkLine, akPerkLinePositionRef,                \
                                       x_local_ang_adjust = akPerkLinePositionRef.GetAngleX(), \
                                       z_local_ang_adjust = akPerkLinePositionRef.GetAngleZ(), \
                                       initially_disabled = true, inverted_local_y = true, is_propped = true)
endFunction