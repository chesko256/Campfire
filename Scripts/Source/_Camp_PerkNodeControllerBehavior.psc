scriptname _Camp_PerkNodeControllerBehavior extends _Camp_PerkNodeController

message property _Camp_PerkGeneral_UpgradeVerify auto
_Camp_ConditionValues property Conditions auto

function AssignCampfire(ObjectReference akCampfire)
    myCampfire = akCampfire
endFunction

function NodeActivated(ObjectReference akNodeRef)
    bool eligible_for_increase = false
    _Camp_PerkNode node = akNodeRef as _Camp_PerkNode
    _Camp_PerkNode dsnode1 = None
    _Camp_PerkNode dsnode2 = None
    if node.downstream_node_1
        dsnode1 = node.downstream_node_1_ref as _Camp_PerkNode
    endif
    if node.downstream_node_2
        dsnode2 = node.downstream_node_2_ref as _Camp_PerkNode
    endif

    bool is_starting_node = false
    if !dsnode1 && !dsnode2
        is_starting_node = true
    endif

    bool downstream_node_purchased = false
    if (dsnode1 && dsnode1.perk_global.GetValueInt() >= 1) || \
       (dsnode2 && dsnode2.perk_global.GetValueInt() >= 1)
       downstream_node_purchased = true
    endif

    bool below_max_rank = false
    if node.perk_global.GetValueInt() < node.perk_max_rank_global.GetValueInt()
        below_max_rank = true
    endif

    if (is_starting_node || downstream_node_purchased) && below_max_rank
        eligible_for_increase = true
    endif

    if eligible_for_increase
        ShowPerkDescription(node, true)
    else
        ShowPerkDescription(node)
    endif
endFunction

function ExitNodeActivated()
    TakeDown()
endFunction

function ShowPerkDescription(_Camp_PerkNode akPerkNode, bool abEligibleForIncrease = false)
    if abEligibleForIncrease
        Conditions.IsPerkEligible = true
    else
        Conditions.IsPerkEligible = false
    endif

    int desc_val
    if akPerkNode.perk_global.GetValueInt() < akPerkNode.perk_max_rank_global.GetValueInt()
        desc_val = akPerkNode.perk_global.GetValueInt() + 1
    else
        desc_val = akPerkNode.perk_max_rank_global.GetValueInt()
    endif

    int i
    if akPerkNode.double_perk_description_values
        i = akPerkNode.perk_description.Show((desc_val * akPerkNode.description_value_modifier), (desc_val * akPerkNode.secondary_description_value_modifier), \
                                             akPerkNode.perk_global.GetValueInt(), \    
                                             akPerkNode.perk_max_rank_global.GetValueInt(), \           
                                             99)
    else
        i = akPerkNode.perk_description.Show((desc_val * akPerkNode.description_value_modifier), akPerkNode.perk_global.GetValueInt(), \    
                                             akPerkNode.perk_max_rank_global.GetValueInt(), \           
                                             99)
    endif

    ; Increase Rank / Back
    if i == 0
        int j = _Camp_PerkGeneral_UpgradeVerify.Show()    
        ; Are you sure you want this perk? Ok / Cancel    
        if j == 0        
            akPerkNode.IncreasePerkRank() 
        endif
    endif
endFunction