scriptname _Camp_ObjectPlacementThreadManager extends Quest

; Campfire SDK Required External -- DO NOT RECOMPILE
string script_name = "_Camp_ObjectPlacementThreadManager"
Event OnInit()
    while true
        debug.messagebox("Mod Developer: You have recompiled " + script_name + " in the Campfire Dev Kit. Please exit and delete " + script_name + ".pex from your scripts directory; reinstalling Dev Kit might be necessary. This message will repeat.")
        utility.wait(1)
    endWhile
endEvent

Form property SmallFire auto hidden
Activator property _Camp_LargeFire auto
Activator property _Camp_LargeFireSmoke auto
Activator property _Camp_ObjectRubbleFire auto
Explosion property _Camp_CollapseFireball auto
Explosion property FallingDustExplosion01 auto
EffectShader property _Camp_BurnEffect auto

ObjectReference function PlaceObject(ObjectReference origin_object, Form form_to_place,                                         \
                              ObjectReference object_position_reference,                                                        \
                              float x_local_ang_adjust = 0.0, float y_local_ang_adjust = 0.0, float z_local_ang_adjust = 0.0,   \
                              float z_global_ang_adjust = 0.0, float z_hanging_offset = 0.0, bool inverted_local_y = false,     \
                              float x_pos_offset = 0.0, float y_pos_offset = 0.0, float z_pos_offset = 0.0,                     \
                              bool initially_disabled = false, bool is_propped = false, bool is_hanging = false,                \
                              bool is_temp = false, bool is_interaction_disabled = false)
endFunction

function wait_all()
endFunction