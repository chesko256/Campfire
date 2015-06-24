scriptname _Camp_PerkNode extends ObjectReference

int property max_rank auto
int property current_rank auto hidden
GlobalVariable property perk_global auto
message property perk_description_eligible auto
message property perk_description_ineligible auto
ObjectReference property downstream_node_1_ref auto hidden
ObjectReference property downstream_node_2_ref auto hidden
Activator property downstream_node_1 auto
Activator property downstream_node_2 auto

Spell property _Camp_PerkLineActive auto
Spell property _Camp_PerkLineInactive auto

ObjectReference property controller auto hidden

Event OnInit()
    ; Precache the perk rank.
    current_rank = perk_global.GetValueInt()
    if current_rank > 0
        ; Play animation
    endif

    (controller as _Camp_PerkNodeControllerBehavior).AssignDownstreamNodes(self)
    UpdateLines()
EndEvent

function IncreasePerkRank()
    current_rank = akNode.perk_global.GetValueInt()
    if current_rank < akNode.max_rank
        current_rank += 1
        akNode.perk_global.SetValueInt(current_rank)
        ; Play animation
        UpdateLines()
    endif
endFunction

Event OnActivate(ObjectReference akActionRef)
    (controller as _Camp_PerkNodeControllerBehavior).NodeActivated(self)
EndEvent

function UpdateLines()
    if current_rank > 0
        if downstream_node_1_ref && (downstream_node_1_ref as _Camp_PerkNode).current_rank > 0
            _Camp_PerkLineActive.Cast(self, downstream_node_1_ref)
        endif
        if downstream_node_2_ref && (downstream_node_2_ref as _Camp_PerkNode).current_rank > 0
            _Camp_PerkLineActive.Cast(self, downstream_node_2_ref)
        endif
    endif
endFunction

function AssignDownstreamNodes()
    _Camp_PerkNodeController ctrlr = controller as _Camp_PerkNodeController
    if downstream_node_1
        if downstream_node_1 == ctrlr.PerkNode0
            downstream_node_1_ref = ctrlr.myPerkNode0
        elseif downstream_node_1 == ctrlr.PerkNode1
            downstream_node_1_ref = ctrlr.myPerkNode1
        elseif downstream_node_1 == ctrlr.PerkNode2
            downstream_node_1_ref = ctrlr.myPerkNode2
        elseif downstream_node_1 == ctrlr.PerkNode3
            downstream_node_1_ref = ctrlr.myPerkNode3
        elseif downstream_node_1 == ctrlr.PerkNode4
            downstream_node_1_ref = ctrlr.myPerkNode4
        elseif downstream_node_1 == ctrlr.PerkNode5
            downstream_node_1_ref = ctrlr.myPerkNode5
        elseif downstream_node_1 == ctrlr.PerkNode6
            downstream_node_1_ref = ctrlr.myPerkNode6
        elseif downstream_node_1 == ctrlr.PerkNode7
            downstream_node_1_ref = ctrlr.myPerkNode7
        elseif downstream_node_1 == ctrlr.PerkNode8
            downstream_node_1_ref = ctrlr.myPerkNode8
        elseif downstream_node_1 == ctrlr.PerkNode9
            downstream_node_1_ref = ctrlr.myPerkNode9
        elseif downstream_node_1 == ctrlr.PerkNode10
            downstream_node_1_ref = ctrlr.myPerkNode10
        elseif downstream_node_1 == ctrlr.PerkNode11
            downstream_node_1_ref = ctrlr.myPerkNode11
        endif
    endif

    if downstream_node_2
        if downstream_node_2 == ctrlr.PerkNode0
            downstream_node_2_ref = ctrlr.myPerkNode0
        elseif downstream_node_2 == ctrlr.PerkNode1
            downstream_node_2_ref = ctrlr.myPerkNode1
        elseif downstream_node_2 == ctrlr.PerkNode2
            downstream_node_2_ref = ctrlr.myPerkNode2
        elseif downstream_node_2 == ctrlr.PerkNode3
            downstream_node_2_ref = ctrlr.myPerkNode3
        elseif downstream_node_2 == ctrlr.PerkNode4
            downstream_node_2_ref = ctrlr.myPerkNode4
        elseif downstream_node_2 == ctrlr.PerkNode5
            downstream_node_2_ref = ctrlr.myPerkNode5
        elseif downstream_node_2 == ctrlr.PerkNode6
            downstream_node_2_ref = ctrlr.myPerkNode6
        elseif downstream_node_2 == ctrlr.PerkNode7
            downstream_node_2_ref = ctrlr.myPerkNode7
        elseif downstream_node_2 == ctrlr.PerkNode8
            downstream_node_2_ref = ctrlr.myPerkNode8
        elseif downstream_node_2 == ctrlr.PerkNode9
            downstream_node_2_ref = ctrlr.myPerkNode9
        elseif downstream_node_2 == ctrlr.PerkNode10
            downstream_node_2_ref = ctrlr.myPerkNode10
        elseif downstream_node_2 == ctrlr.PerkNode11
            downstream_node_2_ref = ctrlr.myPerkNode11
        endif
    endif
endFunction