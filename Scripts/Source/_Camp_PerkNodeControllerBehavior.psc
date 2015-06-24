scriptname _Camp_PerkNodeControllerBehavior extends _Camp_PerkNodeController

function Update()
    CheckPlayerProximity()
endFunction

function CheckPlayerProximity()
    if PlayerRef.GetDistance(self) > 1024.0
        TakeDown()
    endif
endFunction

function NodeActivated(ObjectReference akNodeRef)
    bool eligible_for_increase = false
    _Camp_PerkNode node = akNodeRef as _Camp_PerkNode
    _Camp_PerkNode dsnode1 = None
    _Camp_PerkNode dsnode2 = None
    if node.downstream_node_1
        dsnode1 = node.downstream_node_1 as _Camp_PerkNode
    endif
    if node.downstream_node_2
        dsnode2 = node.downstream_node_2 as _Camp_PerkNode
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
    if node.perk_global.GetValueInt() < node.max_rank
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
        int i = akPerkNode.perk_description_eligible.Show() ; available_points, current_rank
        ; Increase Rank / Back
        if i == 0
            int i = _Camp_PerkUpgradeVerify.Show()
            ; Are you sure you want this perk? Ok / Cancel
            if i == 0
                akPerkNode.IncreasePerkRank() 
            endif
        endif
    else
        akPerkNode.perk_description_ineligible.Show()
        ; Back
    endif
endif