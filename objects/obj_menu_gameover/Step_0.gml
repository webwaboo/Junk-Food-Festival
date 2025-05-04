// Navigation haut/bas
if (input_check_pressed("up")) {
    menu_index = (menu_index - 1 + array_length(menu_options)) mod array_length(menu_options);
	audio_play_sound(snd_option_select, 1, false);
}
if (input_check_pressed("down")) {
    menu_index = (menu_index + 1) mod array_length(menu_options);
	audio_play_sound(snd_option_select, 1, false);
}

// Validation
if (input_check_pressed("accept")) {
    var choice = menu_options[menu_index];
    audio_play_sound(snd_select_move, 1, false);
    switch (choice) {
        case "Replay":
			room_restart()// Redémarre la room actuelle
			break;
		 case "Main Menu":
            game_restart(); // Redémarre le jeu
            break;
        case "Quit":
            game_end(); // Ferme le jeu
            break;
    }
}
