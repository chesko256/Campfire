scriptname _Camp_PerkNodeControllerBehavior extends _Camp_PerkNodeController

message property _Camp_PerkGeneral_UpgradeVerify auto

function Update()
    CheckConditions()
endFunction

function CheckConditions()
    if PlayerRef.GetDistance(self) > 512.0
        TakeDown()
    elseif !myCampfire
        TakeDown()
    elseif TakedownInitiated
        ; stop updating
    else
        RegisterForSingleUpdate(5)
    endif
endFunction

function AssignCampfire(ObjectReference akCampfire)
    myCampfire = akCampfire
    RegisterForSingleUpdate(5)
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
        int i = akPerkNode.perk_description_eligible.Show(akPerkNode.perk_global.GetValueInt(), \
                                                          akPerkNode.perk_max_rank_global.GetValueInt(), \
                                                          99)
        ; Increase Rank / Back
        if i == 0
            int j = _Camp_PerkGeneral_UpgradeVerify.Show()
            ; Are you sure you want this perk? Ok / Cancel
            if j == 0
                akPerkNode.IncreasePerkRank() 
            endif
        endif
    else
        akPerkNode.perk_description_ineligible.Show(akPerkNode.perk_global.GetValueInt(), \
                                                    akPerkNode.perk_max_rank_global.GetValueInt(), \
                                                    99)
        ; Back
    endif
endFunction