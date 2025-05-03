// Effet fondu progressif
if (alpha < 1) {
    alpha += 0.05;
}

// Navigation
if (keyboard_check_pressed(vk_up)) {
    menu_index = (menu_index - 1 + array_length(menu_options)) mod array_length(menu_options);
	audio_play_sound(snd_option_select, 1, false);
}
if (keyboard_check_pressed(vk_down)) {
    menu_index = (menu_index + 1) mod array_length(menu_options);
	audio_play_sound(snd_option_select, 1, false);
}

// Sélection
if (keyboard_check_pressed(vk_enter)) {
    var choice = menu_options[menu_index];
	audio_play_sound(snd_select_move, 1, false);
    
    switch (choice) {
        case "Next Level":
            var next_room = room_next(room);
			//chexk next rom exist else gack to main menu
			if (next_room != -1) {
				room_goto(next_room);
			} else {
				// Fallback si aucune room suivante
				room_goto(rm_menu);
			}

            break;
        case "Retry":
            room_restart();
            break;
        case "Quit to Title":
            room_goto(rm_menu);
            break;
    }
}
