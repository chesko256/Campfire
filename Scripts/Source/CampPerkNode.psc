scriptname CampPerkNode extends ObjectReference

; Required
GlobalVariable property required_perk_rank_global auto
{ The global that represents the current rank of this perk. }
GlobalVariable property required_perk_rank_global_max auto
{ The global that represents the max possible rank of this perk. }
int property required_description_value_count = 1 auto
{ How many description values to display. Can range from 0 (no numeric display values in description) to 2. }
message property required_perk_description auto
{ This node's perk description. }
message property required_skill_description auto
{ The overall skill description. }

; Optional
int property description_value_modifier = 1 auto
{ The display value starting offset. For instance, modifier = 5 and iterator = 5 at rank 0 will show 10, rank 1 will show 15, etc. }
int property description_value_iterator = 1 auto
{ The display value to count up by, per rank. Shows the NEXT rank value. For instance, iterator = 5 at rank 0 will show 5, rank 1 will show 10, and so on. }
int property secondary_description_value_modifier = 1 auto
{ The display value starting offset. For instance, modifier = 5 and iterator = 5 at rank 0 will show 10, rank 1 will show 15, etc. }
int property secondary_description_value_iterator = 1 auto
{ The display value to count up by, per rank. Shows the NEXT rank value. For instance, iterator = 5 at rank 0 will show 5, rank 1 will show 10, and so on. }
Activator property downstream_node_1 auto
{ A connected node below this one in the tree. If no downstream node, this node is implicitly the origin (starting) node. }
Activator property downstream_node_2 auto
{ A connected node below this one in the tree. If no downstream node, this node is implicitly the origin (starting) node. }
Activator property downstream_line_1 auto
{ A connected line activator that connects to downstream node 1. }
Activator property downstream_line_2 auto
{ A connected line activator that connects to downstream node 2. }

; Run-time objects
ObjectReference property downstream_node_1_ref auto hidden
ObjectReference property downstream_node_2_ref auto hidden
ObjectReference property downstream_line_1_ref auto hidden
ObjectReference property downstream_line_2_ref auto hidden
ObjectReference property controller auto hidden

int property current_rank auto hidden

Event OnInit()
    
EndEvent

Event OnActivate(ObjectReference akActionRef)
    (controller as CampPerkNodeControllerBehavior).NodeActivated(self)
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
    current_rank = required_perk_rank_global.GetValueInt()
    if current_rank > 0
        self.PlayAnimation("OwnedWild")
    endif
endFunction

function IncreasePerkRank()
    current_rank = required_perk_rank_global.GetValueInt()
    if current_rank < required_perk_rank_global_max.GetValueInt()
        current_rank += 1
        required_perk_rank_global.SetValueInt(current_rank)
        self.PlayAnimation("OwnedWild")
        Sound select_sound = Game.GetFormFromFile(0x04844A, "Campfire.esm") as Sound ; _Camp_UISkillsPerkSelect
        select_sound.Play(self)
        UpdateLines()
    endif
endFunction

function UpdateLines()
    if current_rank > 0
        if downstream_node_1_ref && downstream_line_1_ref && (downstream_node_1_ref as CampPerkNode).current_rank > 0
            int i = 0
            while !downstream_line_1_ref.Is3DLoaded() && i < 50
                utility.wait(0.1)
                i += 1
            endWhile
            downstream_line_1_ref.PlayAnimation("Unlock")
        endif
        if downstream_node_2_ref && downstream_line_2_ref && (downstream_node_2_ref as CampPerkNode).current_rank > 0
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
    CampPerkNodeController ctrlr = controller as CampPerkNodeController
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

function ClearData()
    downstream_node_1_ref = None
    downstream_node_2_ref = None
    downstream_line_1_ref = None
    downstream_line_2_ref = None
    controller = None
endFunction