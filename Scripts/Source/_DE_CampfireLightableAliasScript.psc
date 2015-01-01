scriptname _DE_CampfireLightableAliasScript extends ReferenceAlias

FormList property _DE_LightableCampfires auto
FormList property _DE_GiantLightableCampfires auto
Activator property _DE_Campfire_LightableACT auto
Activator property _DE_Campfire_LightableGiantACT auto

Event OnInit()
	;debug.trace("[Frostfall] Lightable Campfire Alias: Placing controller!")
	ObjectReference mySelf = self.GetReference()
	if mySelf
		if _DE_LightableCampfires.HasForm(mySelf.GetBaseObject())
			mySelf.PlaceAtMe(_DE_Campfire_LightableACT)
		elseif _DE_GiantLightableCampfires.HasForm(mySelf.GetBaseObject())
			mySelf.PlaceAtMe(_DE_Campfire_LightableGiantACT)
		endif
	else
		;debug.trace("[Frostfall] Lightable Campfire Alias: Self equalled NONE, aborting!")
	endif
	;debug.trace("[Frostfall] Lightable Campfire Alias: Done!")
endEvent