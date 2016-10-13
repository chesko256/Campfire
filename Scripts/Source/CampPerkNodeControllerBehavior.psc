scriptname CampPerkNodeControllerBehavior extends CampPerkNodeController

import CampUtil

message property required_skill_description auto
{ Fill with the skill overview description message. }
GlobalVariable property required_perk_points_available auto
{ Fill with the "points available" skill global variable. Should contain an integer. }
GlobalVariable property required_perk_point_progress auto
{ Fill with the "skill progress" global variable. Should contain a float, 0.0 (0%) to 1.0 (100%). }

GlobalVariable property CampfireIsPerkEligibleToBuy auto hidden
{ Filled at runtime. }
message property _Camp_PerkGeneral_UpgradeVerify auto hidden
{ Filled at runtime. }

function Initialize()
    parent.Initialize()
endFunction

function AssignCampfire(ObjectReference akCampfire)
    myCampfire = akCampfire
endFunction

function NodeActivated(ObjectReference akNodeRef)
    bool eligible_for_increase = false
    CampPerkNode node = akNodeRef as CampPerkNode
    CampPerkNode dsnode1 = None
    CampPerkNode dsnode2 = None
    if node.downstream_node_1
        dsnode1 = node.downstream_node_1_ref as CampPerkNode
    endif
    if node.downstream_node_2
        dsnode2 = node.downstream_node_2_ref as CampPerkNode
    endif

    bool is_starting_node = false
    if !dsnode1 && !dsnode2
        is_starting_node = true
    endif

    bool downstream_node_purchased = false
    if (dsnode1 && dsnode1.required_perk_rank_global.GetValueInt() >= 1) || \
       (dsnode2 && dsnode2.required_perk_rank_global.GetValueInt() >= 1)
       downstream_node_purchased = true
    endif

    bool below_max_rank = false
    if node.required_perk_rank_global.GetValueInt() < node.required_perk_rank_global_max.GetValueInt()
        below_max_rank = true
    endif

    bool points_available = false
    if required_perk_points_available.GetValueInt() > 0
        points_available = true
    endif

    if (is_starting_node || downstream_node_purchased) && below_max_rank && points_available
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

function ShowPerkDescription(CampPerkNode akPerkNode, bool abEligibleForIncrease = false)
    if !CampfireIsPerkEligibleToBuy
        CampfireIsPerkEligibleToBuy = Game.GetFormFromFile(0x01CC0D02, "Update.esm") as GlobalVariable
    endif

    if !_Camp_PerkGeneral_UpgradeVerify
        _Camp_PerkGeneral_UpgradeVerify = Game.GetFormFromFile(0x043826, "Campfire.esm") as Message
    endif

    if abEligibleForIncrease
        CampfireIsPerkEligibleToBuy.SetValueInt(1)
    else
        CampfireIsPerkEligibleToBuy.SetValueInt(0)
    endif

    int desc_val
    if akPerkNode.required_perk_rank_global.GetValueInt() < akPerkNode.required_perk_rank_global_max.GetValueInt()
        desc_val = akPerkNode.required_perk_rank_global.GetValueInt() + 1
    else
        desc_val = akPerkNode.required_perk_rank_global_max.GetValueInt()
    endif

    int i
    if akPerkNode.required_description_value_count == 2
        i = akPerkNode.required_perk_description.Show((desc_val * akPerkNode.description_value_iterator) + akPerkNode.description_value_modifier, \
                                             (desc_val * akPerkNode.secondary_description_value_iterator) + akPerkNode.secondary_description_value_modifier, \
                                             akPerkNode.required_perk_rank_global.GetValueInt(), \    
                                             akPerkNode.required_perk_rank_global_max.GetValueInt(), \           
                                             required_perk_points_available.GetValueInt(), \
                                             (required_perk_point_progress.GetValue() * 100.0))
    elseif akPerkNode.required_description_value_count == 1
        i = akPerkNode.required_perk_description.Show((desc_val * akPerkNode.description_value_iterator) + akPerkNode.description_value_modifier, \
                                             akPerkNode.required_perk_rank_global.GetValueInt(), \    
                                             akPerkNode.required_perk_rank_global_max.GetValueInt(), \           
                                             required_perk_points_available.GetValueInt(), \
                                             (required_perk_point_progress.GetValue() * 100.0))
    else
        i = akPerkNode.required_perk_description.Show(akPerkNode.required_perk_rank_global.GetValueInt(), \    
                                             akPerkNode.required_perk_rank_global_max.GetValueInt(), \           
                                             required_perk_points_available.GetValueInt(), \
                                             (required_perk_point_progress.GetValue() * 100.0))
    endif

    ; Increase Rank / Back
    if i == 0
        int j = _Camp_PerkGeneral_UpgradeVerify.Show()    
        ; Are you sure you want this perk? Ok / Cancel    
        if j == 0        
            akPerkNode.IncreasePerkRank()
            required_perk_points_available.SetValueInt(required_perk_points_available.GetValueInt() - 1)
            SendEvent_CampfirePerkPurchased()
        endif
    elseif i == 1
        akPerkNode.required_skill_description.Show(required_perk_points_available.GetValueInt(), \
                                             (required_perk_point_progress.GetValue() * 100.0))
        ShowPerkDescription(akPerkNode, abEligibleForIncrease)
    endif
endFunction

function SendEvent_CampfirePerkPurchased()
    FallbackEventEmitter emitter = GetEventEmitter_CampfirePerkPurchased()
    int handle = emitter.Create("Campfire_CampfirePerkPurchased")
    if handle
        emitter.Send(handle)
    endif
endFunction
