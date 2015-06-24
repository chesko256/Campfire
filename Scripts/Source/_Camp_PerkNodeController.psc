scriptname _Camp_PerkNodeController extends _Camp_PlaceableObjectBase
{Handles node graph behavior and presentation.}

Actor property PlayerRef auto

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


;@Override _Camp_PlaceableObjectBase
function PlaceObjects()
    if PerkNode0 && PerkNode0_PositionRef
        PlaceObject_PerkNode(PerkNode0, PerkNode0_PositionRef, PerkNode0Future)
    endif
    if PerkNode1 && PerkNode1_PositionRef
        PlaceObject_PerkNode(PerkNode1, PerkNode1_PositionRef, PerkNode1Future)
    endif
    if PerkNode2 && PerkNode2_PositionRef
        PlaceObject_PerkNode(PerkNode2, PerkNode2_PositionRef, PerkNode2Future)
    endif
    if PerkNode3 && PerkNode3_PositionRef
        PlaceObject_PerkNode(PerkNode3, PerkNode3_PositionRef, PerkNode3Future)
    endif
    if PerkNode4 && PerkNode4_PositionRef
        PlaceObject_PerkNode(PerkNode4, PerkNode4_PositionRef, PerkNode4Future)
    endif
    if PerkNode5 && PerkNode5_PositionRef
        PlaceObject_PerkNode(PerkNode5, PerkNode5_PositionRef, PerkNode5Future)
    endif
    if PerkNode6 && PerkNode6_PositionRef
        PlaceObject_PerkNode(PerkNode6, PerkNode6_PositionRef, PerkNode6Future)
    endif
    if PerkNode7 && PerkNode7_PositionRef
        PlaceObject_PerkNode(PerkNode7, PerkNode7_PositionRef, PerkNode7Future)
    endif
    if PerkNode8 && PerkNode8_PositionRef
        PlaceObject_PerkNode(PerkNode8, PerkNode8_PositionRef, PerkNode8Future)
    endif
    if PerkNode9 && PerkNode9_PositionRef
        PlaceObject_PerkNode(PerkNode9, PerkNode9_PositionRef, PerkNode9Future)
    endif
    if PerkNode10 && PerkNode10_PositionRef
        PlaceObject_PerkNode(PerkNode10, PerkNode10_PositionRef, PerkNode10Future)
    endif
    if PerkNode11 && PerkNode11_PositionRef
        PlaceObject_PerkNode(PerkNode11, PerkNode11_PositionRef, PerkNode11Future)
    endif
endFunction

;@Override _Camp_PlaceableObjectBase
function GetResults()
    if PerkNode0Future
        myPerkNode0 = GetFuture(PerkNode0Future).get_result()
    endif
    if PerkNode1Future
        myPerkNode1 = GetFuture(PerkNode1Future).get_result()
        AssignDownstreamNodes(myPerkNode1)
    endif
    if PerkNode2Future
        myPerkNode2 = GetFuture(PerkNode2Future).get_result()
        AssignDownstreamNodes(myPerkNode2)
    endif
    if PerkNode3Future
        myPerkNode3 = GetFuture(PerkNode3Future).get_result()
        AssignDownstreamNodes(myPerkNode3)
    endif
    if PerkNode4Future
        myPerkNode4 = GetFuture(PerkNode4Future).get_result()
        AssignDownstreamNodes(myPerkNode4)
    endif
    if PerkNode5Future
        myPerkNode5 = GetFuture(PerkNode5Future).get_result()
        AssignDownstreamNodes(myPerkNode5)
    endif
    if PerkNode6Future
        myPerkNode6 = GetFuture(PerkNode6Future).get_result()
        AssignDownstreamNodes(myPerkNode6)
    endif
    if PerkNode7Future
        myPerkNode7 = GetFuture(PerkNode7Future).get_result()
        AssignDownstreamNodes(myPerkNode7)
    endif
    if PerkNode8Future
        myPerkNode8 = GetFuture(PerkNode8Future).get_result()
        AssignDownstreamNodes(myPerkNode8)
    endif
    if PerkNode9Future
        myPerkNode9 = GetFuture(PerkNode9Future).get_result()
        AssignDownstreamNodes(myPerkNode9)
    endif
    if PerkNode10Future
        myPerkNode10 = GetFuture(PerkNode10Future).get_result()
        AssignDownstreamNodes(myPerkNode10)
    endif
    if PerkNode11Future
        myPerkNode11 = GetFuture(PerkNode11Future).get_result()
        AssignDownstreamNodes(myPerkNode11)
    endif
endFunction

function TakeDown()
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
endFunction

function PlaceObject_PerkNode(Activator akPerkNode, ObjectReference akPerkNodePositionRef, ObjectReference akPerkNodeFuture)
    akPerkNodeFuture = PlacementSystem.PlaceObject(self, akPerkNode, akPerkNodePositionRef) ; is_propped?
endFunction
