if (global.game_paused) exit;
if (is_game_over()) exit;

y += vspeed;
if (y > room_height) { instance_destroy(); exit; }

var clash = instance_place(x, y, obj_clash_bloc);
if (clash != noone && !clash.handled) {
    clash.handled = true;
    var _duration = 10 * game_get_speed(gamespeed_fps);
    if (clash.bloc_owner == "J1") global.quick_shot_j1_timer = _duration;
    else if (clash.bloc_owner == "J2") global.quick_shot_j2_timer = _duration;
    audio_play_sound(snd_option_select, 1, false);
    instance_destroy();
    with (clash) instance_destroy();
}
