scriptname _Seed_PlayerEventMonitor extends ReferenceAlias

import Utility

Quest property _Seed_SpoilSystemQuest auto
Quest property _Seed_FatigueSystemQuest auto
Quest property _Seed_HungerSystemQuest auto
Quest property _Seed_ThirstSystemQuest auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if (_Seed_SpoilSystemQuest as _Seed_SpoilSystem).spoil_in_progress
		debug.trace("[Seed] ########################### Discarding OnItemAdded event, spoil cycle in progress.")
		return
	endif
	;debug.trace("[Seed] Player OnItemAdded akBaseItem=" + akBaseItem + ", aiItemCount=" + aiItemCount + ", akItemReference=" + akItemReference + ", akSourceContainer=" + akSourceContainer)
	if IsTrackableFood(akBaseItem)
		(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToContainer(akBaseItem, aiItemCount, akSourceContainer, self.GetActorRef(), akItemReference)
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	;debug.trace("[Seed] Player OnItemRemoved akBaseItem=" + akBaseItem + ", aiItemCount=" + aiItemCount + ", akItemReference=" + akItemReference + ", akDestContainer=" + akDestContainer)
	if (_Seed_SpoilSystemQuest as _Seed_SpoilSystem).spoil_in_progress
		debug.trace("[Seed] ########################### Discarding OnItemRemoved event, spoil cycle in progress.")
		return
	endif
	if IsTrackableFood(akBaseItem)
		if (!akItemReference && !akDestContainer) || (akItemReference && !akItemReference.Is3DLoaded())
			(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodConsumed(akBaseItem, self.GetActorRef(), aiItemCount)
		else
			; Did I drop the item, or was it moved to another container?
			if !akItemReference && akDestContainer
				; Player to container transfer
				(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToContainer(akBaseItem, aiItemCount, self.GetActorRef(), akDestContainer, None)
			elseif akItemReference && !akDestContainer
				; Player to world transfer
				ObjectReference[] world_refs_1
				ObjectReference[] world_refs_2
				if aiItemCount > 128
					world_refs_1 = new ObjectReference[128]
					world_refs_2 = new ObjectReference[128]
				elseif aiItemCount > 1
					world_refs_1 = new ObjectReference[128]
					world_refs_2 = new ObjectReference[1]
				else
					world_refs_1 = new ObjectReference[1]
					world_refs_2 = new ObjectReference[1]
				endif

				While IsInMenuMode()
					utility.wait(0.2)
				endWhile

				akItemReference.DisableNoWait()
				int i = 0
				; Flag persistent to force position data to be correct for the reference, but don't persist rotten food
				bool flag_persistent = !(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HasSpoilStage4Name(akBaseItem.GetName())
				while i < aiItemCount && i < 256
					ObjectReference ref = akItemReference.PlaceAtMe(akBaseItem, 1, flag_persistent, true)
					BigArrayAddRef_Do(i, ref, world_refs_1, world_refs_2)
					ref.MoveTo(ref, afXOffset = Utility.RandomFloat(0.0, 20.0), afYOffset = Utility.RandomFloat(0.0, 20.0))
					ref.enable()
					i += 1
				endWhile
				akItemReference.Delete()
				(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToWorld(akBaseItem, self.GetActorRef(), world_refs_1)

				if aiItemCount > 128
					utility.wait(0.2)
					(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HandleFoodTransferToWorld(akBaseItem, self.GetActorRef(), world_refs_2)
				endif
			endif
		endif
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if abHitBlocked
		(_Seed_HungerSystemQuest as _Seed_HungerSystem).PlayerHit()
		(_Seed_ThirstSystemQuest as _Seed_ThirstSystem).PlayerHit()
	endif
EndEvent

Event OnSpellCast(Form akSpell)
	if akSpell && akSpell as Spell
		debug.trace("[Seed] Player casting spell " + akSpell)
		(_Seed_FatigueSystemQuest as _Seed_FatigueSystem).SpellCast(akSpell as Spell)
	endif
EndEvent

bool function IsTrackableFood(Form akBaseItem)
	if (akBaseItem as Potion) && (akBaseItem as Potion).IsFood() && !(_Seed_SpoilSystemQuest as _Seed_SpoilSystem).HasSpoilStage4Name(akBaseItem.GetName())
		return true
	else
		return false
	endif
endFunction

function BigArrayAddRef_Do(int index, ObjectReference akReference, ObjectReference[] array1, ObjectReference[] array2)
    if index > 255
        ;@TODO: Log error
        return
    endif
    if index > 127
        array2[(index - 128)] = akReference
    else
        array1[index] = akReference
    endif
endFunction
