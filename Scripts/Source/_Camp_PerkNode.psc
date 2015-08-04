scriptname _Camp_PerkNode extends ObjectReference

int property current_rank auto hidden
GlobalVariable property perk_global auto
GlobalVariable property perk_max_rank_global auto
message property perk_description_eligible auto
message property perk_description_ineligible auto
ObjectReference property downstream_node_1_ref auto hidden
ObjectReference property downstream_node_2_ref auto hidden
ObjectReference property downstream_line_1_ref auto hidden
ObjectReference property downstream_line_2_ref auto hidden
Activator property downstream_node_1 auto
Activator property downstream_node_2 auto
Activator property downstream_line_1 auto
Activator property downstream_line_2 auto


;Spell property _Camp_PerkLineActive auto
;Spell property _Camp_PerkLineInactive auto

ObjectReference property controller auto hidden

Event OnInit()
    ; Precache the perk rank.
    current_rank = perk_global.GetValueInt()
    if current_rank > 0
        self.PlayAnimation("OwnedWild")
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    (controller as _Camp_PerkNodeControllerBehavior).NodeActivated(self)
EndEvent

function AssignController(ObjectReference akController)
    controller = akController
endFunction

function IncreasePerkRank()
    current_rank = perk_global.GetValueInt()
    if current_rank < perk_max_rank_global.GetValueInt()
        current_rank += 1
        perk_global.SetValueInt(current_rank)
        self.PlayAnimation("OwnedWild")
        ;@TODO: Play SFX
        UpdateLines()
    endif
endFunction

function UpdateLines()
    if current_rank > 0
        if downstream_node_1_ref && downstream_line_1_ref && (downstream_node_1_ref as _Camp_PerkNode).current_rank > 0
            downstream_line_1_ref.PlayAnimation("Unlock")
            ;_Camp_PerkLineActive.Cast(self, downstream_node_1_ref)
            ;_Camp_PerkLineActive.Play(self, akFacingObject = downstream_node_1_ref)
        endif
        if downstream_node_2_ref && downstream_line_2_ref && (downstream_node_2_ref as _Camp_PerkNode).current_rank > 0
            downstream_line_2_ref.PlayAnimation("Unlock")
            ;_Camp_PerkLineActive.Cast(self, downstream_node_2_ref)
            ;_Camp_PerkLineActive.Play(self, akFacingObject = downstream_node_2_ref)
        endif
    endif
endFunction

function AssignDownstreamNodes()
    _Camp_PerkNodeController ctrlr = controller as _Camp_PerkNodeController
    if downstream_node_1
        int idx = ctrlr.NodeActMap.Find(downstream_node_1)
        if idx != -1
            downstream_node_1_ref = ctrlr.NodeRefMap[idx]
        endif
        int jdx = ctrlr.LineActMap.Find(downstream_line_1)
        if jdx != -1
            downstream_line_1_ref = ctrlr.LineRefMap[jdx]
        endif
    endif

    if downstream_node_2
        int idx = ctrlr.NodeActMap.Find(downstream_node_2)
        if idx != -1
            downstream_node_2_ref = ctrlr.NodeRefMap[idx]
        endif
        int jdx = ctrlr.LineActMap.Find(downstream_line_2)
        if jdx != -1
            downstream_line_2_ref = ctrlr.LineRefMap[jdx]
        endif
    endif

    debug.trace("downstream_line_1_ref: " + downstream_line_1_ref)
    UpdateLines()
endFunction