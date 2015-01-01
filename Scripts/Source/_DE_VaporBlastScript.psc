Scriptname _DE_VaporBlastScript extends activemagiceffect  

_DE_EPMonitor_1_6 property Frostfall auto
Spell property _DE_VaporBlastEffects auto
Spell property _DE_WetState_Spell1 auto
Spell property _DE_WetState_Spell2 auto
Spell property _DE_WetState_Spell3 auto
Spell property _DE_WetState_Spell1NoShader auto
Spell property _DE_WetState_Spell2NoShader auto
Spell property _DE_WetState_Spell3NoShader auto
Sound property FXFireOut auto
Actor property PlayerRef auto
Message property _DE_WetStateMsg_Dry auto
Message property _DE_VaporBlastError auto
EffectShader property SteamFXShader auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if Frostfall.pWetPoints > 0.0
		FXFireOut.Play(PlayerRef)
		_DE_VaporBlastEffects.Cast(PlayerRef)
		SteamFXShader.Play(PlayerRef, 1.5)
		utility.wait(1.0)
		PlayerRef.RemoveSpell(_DE_WetState_Spell1)
		PlayerRef.RemoveSpell(_DE_WetState_Spell2)
		PlayerRef.RemoveSpell(_DE_WetState_Spell3)
		PlayerRef.RemoveSpell(_DE_WetState_Spell1NoShader)
		PlayerRef.RemoveSpell(_DE_WetState_Spell2NoShader)
		PlayerRef.RemoveSpell(_DE_WetState_Spell3NoShader)
		Frostfall.pWetPoints = 0.0
		_DE_WetStateMsg_Dry.Show()
	else
		_DE_VaporBlastError.Show()
	endif
endEvent