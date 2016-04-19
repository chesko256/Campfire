Scriptname _Frost_FrostResistSystem extends _Frost_BaseSystem

Actor property PlayerRef auto
Spell property _Frost_FrostResistBonusSpell auto

float old_amount

function Update()
	CheckFrostResist()
endFunction

function CheckFrostResist()
	float amount = PlayerRef.GetAV("FrostResist") / 2.0
	if amount != old_amount
		UpdateFrostResistBonus(amount)
	endif
endFunction

function UpdateFrostResistBonus(float new_amount)
	if new_amount > 50.0
		new_amount = 50.0
	endif

	_Frost_FrostResistBonusSpell.SetNthEffectMagnitude(0, new_amount)
	PlayerRef.RemoveSpell(_Frost_FrostResistBonusSpell)
	Utility.WaitMenuMode(0.1)
	PlayerRef.AddSpell(_Frost_FrostResistBonusSpell, false)
	old_amount = new_amount
endFunction