// === Tutoriel ===
if (menu_state == "tutorial") {
    if (keyboard_check_pressed(vk_right)) {
        tutorial_page = min(tutorial_page + 1, array_length(tutorial_images) - 1);
    }
    if (keyboard_check_pressed(vk_left)) {
        tutorial_page = max(tutorial_page - 1, 0);
    }
    if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter)) {
        menu_state = "main";
    }
    exit; // ne pas exécuter le reste
}

// === Contrôles ===
if (menu_state == "controls") {
    var keys_array = variable_struct_get_names(global.controls_j1);
    var key_name = keys_array[menu_index];

    if (!waiting_for_key) {
        if (keyboard_check_pressed(vk_up)) {
            menu_index = (menu_index - 1 + array_length(keys_array)) mod array_length(keys_array);
        }
        if (keyboard_check_pressed(vk_down)) {
            menu_index = (menu_index + 1) mod array_length(keys_array);
        }

        if (keyboard_check_pressed(vk_enter)) {
            waiting_for_key = true;
        }

        if (keyboard_check_pressed(vk_escape)) {
            menu_state = "options";
            menu_index = 0;
        }
    } else {
        // Rebinding keys
        if (!keyboard_check(keyboard_lastkey)) {
            var newkey = keyboard_lastkey;
            global.controls_j1[$ keys_array[menu_index]] = newkey;
			//save new binding
			save_controls();

            waiting_for_key = false;
        }
    }

    exit; // pour éviter la suite aussi
}

else if (menu_state == "controls_p2") {
    var keys_array = variable_struct_get_names(global.controls_j2);
    var key_name = keys_array[menu_index];

    if (!waiting_for_key) {
        if (keyboard_check_pressed(vk_up)) {
            menu_index = (menu_index - 1 + array_length(keys_array)) mod array_length(keys_array);
        }
        if (keyboard_check_pressed(vk_down)) {
            menu_index = (menu_index + 1) mod array_length(keys_array);
        }

        if (keyboard_check_pressed(vk_enter)) {
            waiting_for_key = true;
        }

        if (keyboard_check_pressed(vk_escape)) {
            menu_state = "options";
            menu_index = 0;
        }
    } else {
        if (!keyboard_check(keyboard_lastkey)) {
            var newkey = keyboard_lastkey;
            global.controls_j2[$ key_name] = newkey;
            save_controls(); // ✅ mise à jour instantanée
            waiting_for_key = false;
        }
    }

    exit;
}



// === Menus classiques ===
var options = (menu_state == "main") ? menu_options_main : menu_options_options;

// Navigation dans les menus classiques
if (keyboard_check_pressed(vk_up)) {
    menu_index = (menu_index - 1 + array_length(options)) mod array_length(options);
	audio_play_sound(snd_option_select, 1, false);

}
if (keyboard_check_pressed(vk_down)) {
    menu_index = (menu_index + 1) mod array_length(options);
	audio_play_sound(snd_option_select, 1, false);
}
	
	if (keyboard_check_pressed(vk_escape) && menu_state=="options") {
		menu_state = "main";
		menu_index = 0;
}
	

	
// Sélection
if (keyboard_check_pressed(vk_enter)) {
	audio_play_sound(snd_select_move, 1, false);
    var selection = options[menu_index];

    if (menu_state == "main") {
        switch (selection) {
            case "Start": room_goto(rm_main_game); break;
            case "Options": menu_state = "options"; menu_index = 0; break;
            case "Tutorial": menu_state = "tutorial"; menu_index = 0; break;
            case "Quit": game_end(); break;
        }
    } else if (menu_state == "options") {
        switch (selection) {
            case "Controls J1": menu_state = "controls"; menu_index = 0; break;
			case "Controls J2": menu_state = "controls_p2"; menu_index = 0; break;
			case "One-Hand Mode: OFF":
			case "One-Hand Mode: ON":
			    global.one_hand_mode = !global.one_hand_mode; // toggle
			    var new_label = "One-Hand Mode: " + (global.one_hand_mode ? "ON" : "OFF");
			    menu_options_options[2] = new_label; // update label in menu
			    break;

            //case "Difficulty": show_debug_message("Difficulty screen coming soon"); break;
			case "Difficulty: Easy":
			case "Difficulty: Normal":
			case "Difficulty: Hard":
			    // Cycle vers la difficulté suivante
			    switch (global.difficulty) {
			        case "Easy":    global.difficulty = "Normal"; break;
			        case "Normal":  global.difficulty = "Hard"; break;
			        case "Hard":    global.difficulty = "Easy"; break;
			    }

		    // Met à jour l'affichage dans le menu
		    menu_options_options[3] = "Difficulty: " + global.difficulty;
		    break;

            case "Back": menu_state = "main"; menu_index = 0; break;
        }
    }
}


