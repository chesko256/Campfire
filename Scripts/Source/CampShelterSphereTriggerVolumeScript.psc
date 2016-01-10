scriptname CampShelterSphereTriggerVolumeScript extends ObjectReference
{Attach this script to shelter sphere trigger volume activators.}

import _CampInternal

ObjectReference property ParentTent auto hidden
{Assigned at runtime. The tent this trigger volume belongs to.}
Actor property PlayerRef auto
{The player reference.}
VisualEffect Property _Camp_EnterSphereEffect Auto 
{Particle art played when entering and leaving sphere.}
VisualEffect Property FXCameraAttachDustFineEffect Auto 
{Particle art to attach to camera. Only attaches when player enters.}
sound property AMBRumbleALP auto
{SoundFX to play when player is inside the sphere.}
sound property MAGWardTestDeflect auto
{Sound played when entering and leaving the sphere.}

int time_limit = 600
; How long to play the attached particle FX when inside the sphere.

int instanceID
; The rumble sound FX instance ID.

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		
		; Delay up to 3 seconds for ParentTent to initially populate
		int i = 0
		while !ParentTent && i < 30
			Utility.Wait(0.1)
			i += 1
		endWhile

		if ParentTent
			SetCurrentTent(ParentTent)
		endif
		MAGWardTestDeflect.Play(PlayerRef)
		_Camp_EnterSphereEffect.Play(PlayerRef)
		FXCameraAttachDustFineEffect.Play(PlayerRef, time_limit)
		instanceID = AMBRumbleALP.Play(self)
		Sound.SetInstanceVolume(instanceID, 0.75)
	else
		MAGWardTestDeflect.Play(akActionRef)
		_Camp_EnterSphereEffect.Play(akActionRef)
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		SetCurrentTent(None)
		MAGWardTestDeflect.Play(PlayerRef)
		_Camp_EnterSphereEffect.Play(PlayerRef)
		FXCameraAttachDustFineEffect.Stop(PlayerRef)
		if instanceID
			Sound.StopInstance(instanceID)
		endif
	else
		MAGWardTestDeflect.Play(akActionRef)
		_Camp_EnterSphereEffect.Play(akActionRef)
	endif
EndEvent

Event OnUnLoad()
	FXCameraAttachDustFineEffect.Stop(PlayerRef)
	if instanceID
		Sound.StopInstance(instanceID)
	endif
EndEvent
