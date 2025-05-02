if (keyboard_check_pressed(vk_up)) {
    pause_index = (pause_index - 1 + array_length(pause_options)) mod array_length(pause_options);
	audio_play_sound(snd_option_select, 1, false);
}
if (keyboard_check_pressed(vk_down)) {
    pause_index = (pause_index + 1) mod array_length(pause_options);
	audio_play_sound(snd_option_select, 1, false);
}
if (keyboard_check_pressed(vk_enter)) {
    var selection = pause_options[pause_index];
	audio_play_sound(snd_select_move, 1, false);
    switch (selection) {
        case "Continue":
            instance_destroy(); // Supprime le menu → reprend le jeu
            global.game_paused = false;
            break;

        case "Restart":
            room_restart();
            break;

        case "Quit to Title":
            room_goto(rm_menu);
            break;
    }
}
