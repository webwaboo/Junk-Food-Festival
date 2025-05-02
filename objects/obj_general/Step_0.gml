global.tutorial_mode = (string_starts_with(room_get_name(room), "rm_tuto_"));
if(room != rm_menu && room != rm_credits && !instance_exists(obj_pause_menu)){
	if (keyboard_check_pressed(vk_escape) && !global.game_paused) {
		audio_play_sound(snd_pause, 1, false);
	    instance_create_layer(0, 0, "GUI", obj_pause_menu);
	    global.game_paused = true;
	}
}