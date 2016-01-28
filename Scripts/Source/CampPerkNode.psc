scriptname CampPerkNode extends ObjectReference

int property current_rank auto hidden
GlobalVariable property perk_global auto
GlobalVariable property perk_max_rank_global auto
Sound property _Camp_UISkillsPerkSelect auto
message property perk_description auto
message property skill_description auto
bool property double_perk_description_values = false auto
int property description_value_modifier = 1 auto
int property description_value_iterator = 1 auto
int property secondary_description_value_modifier = 1 auto
int property secondary_description_value_iterator = 1 auto
ObjectReference property downstream_node_1_ref auto hidden
ObjectReference property downstream_node_2_ref auto hidden
ObjectReference property downstream_line_1_ref auto hidden
ObjectReference property downstream_line_2_ref auto hidden
Activator property downstream_node_1 auto
Activator property downstream_node_2 auto
Activator property downstream_line_1 auto
Activator property downstream_line_2 auto

ObjectReference property controller auto hidden

Event OnInit()
    
EndEvent

Event OnActivate(ObjectReference akActionRef)
    (controller as _Camp_PerkNodeControllerBehavior).NodeActivated(self)
EndEvent

function AssignController(ObjectReference akController)
    controller = akController

    ; Node spawns initially disabled. We are setting the node up now, so enable it.
    self.EnableNoWait()

    int i = 0
    while !self.Is3DLoaded() && i < 50
        utility.wait(0.1)
        i += 1
    endWhile
    utility.wait(0.1)

    ; Precache the perk rank and set visual state.
    current_rank = perk_global.GetValueInt()
    if current_rank > 0
        self.PlayAnimation("OwnedWild")
    endif
endFunction

function IncreasePerkRank()
    current_rank = perk_global.GetValueInt()
    if current_rank < perk_max_rank_global.GetValueInt()
        current_rank += 1
        perk_global.SetValueInt(current_rank)
        self.PlayAnimation("OwnedWild")
        _Camp_UISkillsPerkSelect.Play(self)
        UpdateLines()
    endif
endFunction

function UpdateLines()
    if current_rank > 0
        if downstream_node_1_ref && downstream_line_1_ref && (downstream_node_1_ref as _Camp_PerkNode).current_rank > 0
            int i = 0
            while !downstream_line_1_ref.Is3DLoaded() && i < 50
                utility.wait(0.1)
                i += 1
            endWhile
            downstream_line_1_ref.PlayAnimation("Unlock")
        endif
        if downstream_node_2_ref && downstream_line_2_ref && (downstream_node_2_ref as _Camp_PerkNode).current_rank > 0
            int i = 0
            while !downstream_line_2_ref.Is3DLoaded() && i < 50
                utility.wait(0.1)
                i += 1
            endWhile
            downstream_line_2_ref.PlayAnimation("Unlock")
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
    
    UpdateLines()
endFunction