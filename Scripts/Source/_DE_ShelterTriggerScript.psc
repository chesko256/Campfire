Scriptname _DE_ShelterTriggerScript extends ObjectReference  

;/VisualEffect property _DE_EnterSphereEffect auto
Sound property MAGWardTestDeflect auto
Sound property AMBRumbleALP auto

int iSoundID = 0

Event OnTriggerEnter(ObjectReference akActionRef)
	MAGWardTestDeflect.Play(akActionRef)
	_DE_EnterSphereEffect.Play(akActionRef)
	iSoundID = AMBRumbleALP.Play(self)
endEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	MAGWardTestDeflect.Play(akActionRef)
	_DE_EnterSphereEffect.Play(akActionRef)
	if iSoundID != 0
		Sound.StopInstance(iSoundID)
		iSoundID = 0
	endif
endEvent

/;

;Scriptname FXCameraAttachScript extends ObjectReference  
;{Attaches a camera attach fx based on the property set in the reference. Also has a slot to fade in an image space at the same time.}
;===============================================

import game
import utility
import sound

VisualEffect Property ParticleFX Auto 
{Particle art to attach to camera, fog by default}
VisualEffect Property CameraAttachFX2 Auto 
{2nd Particle art to attach to camera, not used by default}
sound property LoopSound auto
{specify sound fx to play, set on reference, none by default}
sound property EntranceSound auto
{Sound played when entering and leaving the trigger volume.}
ImageSpaceModifier Property CrossfadeableISM Auto
{specify crossfaded imagespace to play, set on reference, none by default}
int instanceID
int Property timeLimit = 180 Auto


;===============================================

EVENT ONTRIGGERENTER(ObjectReference akActionRef)
	IF (akActionRef == getPlayer() as ObjectReference)
		EntranceSound.Play(GetPlayer())
		ParticleFX.Play(GetPlayer())
		if (CameraAttachFX2)
			CameraAttachFX2.Play(GetPlayer(), timeLimit)
		endif
		if (CrossfadeableISM)
			CrossfadeableISM.ApplyCrossFade(0.5)
		endif
		if (LoopSound)
			instanceID = LoopSound.Play(Self)
			Sound.SetInstanceVolume(instanceID, 0.75)
		endif
	else
		EntranceSound.Play(akActionRef)
		ParticleFX.Play(akActionRef)
	endif
endEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	IF (akActionRef == getPlayer() as ObjectReference)
		EntranceSound.Play(GetPlayer())
		ParticleFX.Play(GetPlayer())
		if (CameraAttachFX2)
			CameraAttachFX2.Stop(GetPlayer())
		endif
		if (CrossfadeableISM)
			ImageSpaceModifier.RemoveCrossFade(0.3)
		endif
		if (LoopSound)
			StopInstance(instanceID)
		endif
	else
		EntranceSound.Play(akActionRef)
		ParticleFX.Play(akActionRef)
	ENDIF
EndEvent
	
Event OnUnLoad()
	if (CameraAttachFX2)
		CameraAttachFX2.Stop(GetPlayer())
	endif
	if (CrossfadeableISM)
		ImageSpaceModifier.RemoveCrossFade(0.3)
	endif
	if (LoopSound)
		StopInstance(instanceID)
	endif
	;goToState ("waiting")
EndEvent