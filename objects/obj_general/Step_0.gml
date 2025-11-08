//setup tutorial mode for whole game, F11 shortcut for fullscreen, special pause menu for tutorial
global.tutorial_mode = (string_starts_with(room_get_name(room), "rm_tuto_"));
// pause menu for tutorial mode
if(room != rm_menu && room != rm_credits && !instance_exists(obj_pause_menu)){
	if (input_check_pressed("pause") && !global.game_paused) {
		audio_play_sound(snd_pause, 1, false);
	    instance_create_layer(0, 0, "GUI", obj_pause_menu);
	    global.game_paused = true;
	}
}

// press f11 to enable fullscreen
if (keyboard_check_pressed(vk_f11)) {
	if(instance_exists(obj_menu_main)){
	    //window_set_fullscreen(!global.fullscreen);
		global.fullscreen = !global.fullscreen; // toggle
		var new_label = "Fullscreen: " + (global.fullscreen ? "ON" : "OFF");
		window_set_fullscreen(global.fullscreen);
		obj_menu_main.menu_options_options[3] = new_label; // update label in menu
	}else {
	//window_set_fullscreen(!global.fullscreen);
		global.fullscreen = !global.fullscreen; // toggle
		window_set_fullscreen(global.fullscreen)
	}
}
