scriptName _Camp_InstinctsEffects extends ActiveMagicEffect
{Modified from magicImodBeginLoopEnd}

Actor property PlayerRef auto
Bool Property bPlayerOnly = False auto
{Set this if you only want this Imod to play if the player is the spell caster.}
float property fDelay = 0.83 auto
{time to wait before switching to constant Imod}
GlobalVariable property AltVFXGlobal auto
{If this global is 1, use the Alt Intro FX.}
GlobalVariable property SFXGlobal auto
{If this global is 1, don't play SFX.}
ImageSpaceModifier property IntroFX auto
{IsMod applied at the start of the spell effect}
ImageSpaceModifier property AltIntroFX auto
{IsMod applied at the start of the spell effect}
ImageSpaceModifier property LoopFX auto
{main isMod for spell}
ImageSpaceModifier property OutroFX auto
{IsMod applied at the end of the spell effect}
Float Property fImodStrength = 1.0 auto
{IsMod Strength from 0.0 to 1.0}
Sound property SFX auto

Bool bIsOkToPlay = true
bool bIsFinishing = false
actor TargetActor
actor CasterActor

Event OnEffectStart(Actor Target, Actor Caster)
	TargetActor = Target
	CasterActor = Caster
	
	if bPlayerOnly
		if CasterActor != PlayerRef
			bIsOkToPlay = False
		endif
	endif
	
	if bIsOkToPlay
		bool use_alt_intro = AltVFXGlobal.GetValueInt() == 1
		bool play_sfx = SFXGlobal.GetValueInt() == 2
		IntroFX.Remove()
		AltIntroFX.Remove()
		LoopFX.Remove()
		OutroFX.Remove()
		if use_alt_intro
			AltIntroFX.Apply(fImodStrength)
		else
			IntroFX.Apply(fImodStrength)
		endif
		if play_sfx
			int sid = SFX.Play(PlayerRef)
			Sound.SetInstanceVolume(sid, 0.5)
		endif
		utility.Wait(fDelay)
		if bIsFinishing == False
			if use_alt_intro
				AltIntroFX.PopTo(LoopFX, fImodStrength)
			else
				IntroFX.PopTo(LoopFX, fImodStrength)
			endif
		endif
	endif
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	bIsFinishing = True
	if bIsOkToPlay
		IntroFX.Remove()
		AltIntroFX.Remove()
		LoopFX.PopTo(OutroFX,fImodStrength)
	endif
endEvent
