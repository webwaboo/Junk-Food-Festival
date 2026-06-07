if (global.game_paused) exit;
if (is_game_over()) exit;

y += vspeed;
if (y > room_height) { instance_destroy(); exit; }

var clash = instance_place(x, y, obj_clash_bloc);
if (clash != noone && !clash.handled) {
    clash.handled = true;
    var _duration = 15 * game_get_speed(gamespeed_fps);
    if (clash.bloc_owner == "J1") {
        if (instance_exists(obj_shield_j1)) {
            instance_find(obj_shield_j1, 0).shield_timer = _duration;
        } else {
            instance_create_layer(0, 0, "Instances", obj_shield_j1);
        }
    } else if (clash.bloc_owner == "J2") {
        if (instance_exists(obj_shield_j2)) {
            instance_find(obj_shield_j2, 0).shield_timer = _duration;
        } else {
            instance_create_layer(0, 0, "Instances", obj_shield_j2);
        }
    }
    audio_play_sound(snd_option_select, 1, false);
    instance_destroy();
    with (clash) instance_destroy();
}
