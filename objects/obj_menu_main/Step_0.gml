// handle navigation in control menu, handle toggle of fullscreen, difficulty, rebinding of control
// === Tutoriel ===
if (menu_state == "tutorial") {
    if (input_check_pressed("right")) {
        tutorial_page = min(tutorial_page + 1, array_length(tutorial_images) - 1);
    }
    if (input_check_pressed("left")) {
        tutorial_page = max(tutorial_page - 1, 0);
    }
    if (input_check_pressed("accept") || input_check_pressed("back")) {
        menu_state = "main";
    }
    exit; // ne pas exécuter le reste
}

// === Contrôles ===
if (menu_state == "controls") {
    var keys_array = variable_struct_get_names(global.controls_j1);
    var key_name = keys_array[menu_index];

    if (!waiting_for_key) {
        if (input_check_pressed("up")) {
            menu_index = (menu_index - 1 + array_length(keys_array)) mod array_length(keys_array);
        }
        if (input_check_pressed("down")) {
            menu_index = (menu_index + 1) mod array_length(keys_array);
        }

        if (input_check_pressed("accept")) {
            waiting_for_key = true;
        }

        if (input_check_pressed("back")) {
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

else if (menu_state == "gameplay") {
    if (input_check_pressed("up")) {
        menu_index = (menu_index - 1 + array_length(menu_options_gameplay)) mod array_length(menu_options_gameplay);
        audio_play_sound(snd_option_select, 1, false);
    }
    if (input_check_pressed("down")) {
        menu_index = (menu_index + 1) mod array_length(menu_options_gameplay);
        audio_play_sound(snd_option_select, 1, false);
    }

    if (input_check_pressed("back")) {
        menu_state = "options";
        menu_index = 0;
        exit;
    }

    if (input_check_pressed("accept")) {
        audio_play_sound(snd_select_move, 1, false);
        switch (menu_index) {
            case 0: // Digestion Timer: cycle 0s → 1s → 2s → 3s → 4s → 5s → 6s → 0s
                var _dig_s = (global.digestion_timer_duration / 60 + 1) mod 7;
                global.digestion_timer_duration = _dig_s * 60;
                var _dig_lbl = (global.digestion_timer_duration == 0) ? "Instant" : (string(_dig_s) + "s");
                menu_options_gameplay[0] = "Digestion: " + _dig_lbl;
                save_controls();
                break;
            case 1: // Game Timer: cycle 30s → 60s → 99s → 30s
                switch (global.game_timer_duration) {
                    case 30:  global.game_timer_duration = 60;  break;
                    case 60:  global.game_timer_duration = 99;  break;
                    default:  global.game_timer_duration = 30;  break;
                }
                menu_options_gameplay[1] = "Game Timer: " + string(global.game_timer_duration) + "s";
                save_controls();
                break;
            case 2: // Bonuses
                menu_state = "gameplay_bonuses";
                menu_index = 0;
                break;
            case 3: // Back
                menu_state = "options";
                menu_index = 0;
                break;
        }
    }
    exit;
}

else if (menu_state == "gameplay_bonuses") {
    var _blen = array_length(menu_options_bonuses);
    var _back_idx = _blen - 1; // "Back" is always last

    if (input_check_pressed("up")) {
        menu_index = (menu_index - 1 + _blen) mod _blen;
        audio_play_sound(snd_option_select, 1, false);
    }
    if (input_check_pressed("down")) {
        menu_index = (menu_index + 1) mod _blen;
        audio_play_sound(snd_option_select, 1, false);
    }

    if (input_check_pressed("back")) {
        menu_state = "gameplay";
        menu_index = 0;
        exit;
    }

    // Accept on a bonus row → toggle enabled
    // Accept on Back → go back
    if (input_check_pressed("accept")) {
        audio_play_sound(snd_select_move, 1, false);
        if (menu_index == _back_idx) {
            menu_state = "gameplay";
            menu_index = 0;
        } else {
            switch (menu_index) {
                case 0: global.bonus_500pts_enabled = !global.bonus_500pts_enabled; break;
            }
            // Rebuild label for changed row
            var _en = global.bonus_500pts_enabled;
            var _fr = global.bonus_500pts_freq;
            var _fl;
            switch (_fr) {
                case "often": _fl = "Often (3-7s)";   break;
                case "rare":  _fl = "Rare (20-30s)";  break;
                default:      _fl = "Normal (10-15s)"; break;
            }
            menu_options_bonuses[menu_index] = "[spr_bonus_500pts,0] 500 pts  " + (_en ? "ON" : "OFF") + "  " + _fl;
            save_controls();
        }
    }

    // Left / Right → cycle frequency for the focused bonus row
    if (menu_index != _back_idx && (input_check_pressed("left") || input_check_pressed("right"))) {
        var _freqs = ["often", "normal", "rare"];
        var _fi = 0;
        for (var _i = 0; _i < 3; _i++) {
            if (_freqs[_i] == global.bonus_500pts_freq) { _fi = _i; break; }
        }
        _fi = input_check_pressed("right") ? (_fi + 1) mod 3 : (_fi - 1 + 3) mod 3;
        global.bonus_500pts_freq = _freqs[_fi];
        audio_play_sound(snd_option_select, 1, false);

        // Rebuild label
        var _en2 = global.bonus_500pts_enabled;
        var _fl2;
        switch (global.bonus_500pts_freq) {
            case "often": _fl2 = "Often (3-7s)";   break;
            case "rare":  _fl2 = "Rare (20-30s)";  break;
            default:      _fl2 = "Normal (10-15s)"; break;
        }
        menu_options_bonuses[menu_index] = "[spr_bonus_500pts,0] 500 pts  " + (_en2 ? "ON" : "OFF") + "  " + _fl2;
        save_controls();
    }

    exit;
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
if (input_check_pressed("up")) {
    menu_index = (menu_index - 1 + array_length(options)) mod array_length(options);
	audio_play_sound(snd_option_select, 1, false);

}
if (input_check_pressed("down")) {
    menu_index = (menu_index + 1) mod array_length(options);
	audio_play_sound(snd_option_select, 1, false);
}
	
	if (input_check_pressed("back") && menu_state=="options") {
		menu_state = "main";
		menu_index = 0;
}
	

	
// Sélection
if (input_check_pressed("accept")) {
	audio_play_sound(snd_select_move, 1, false);
    var selection = options[menu_index];

    if (menu_state == "main") {
        switch (selection) {
            case "VS Mode": global.p2_ai_enabled = false; room_goto(rm_main_game); break;
			case "Arcade": global.p2_ai_enabled = true; room_goto(rm_main_game); break;
            case "Options": menu_state = "options"; menu_index = 0; break;
            case "Tutorial": global.p2_ai_enabled = false; room_goto(rm_tuto_1); break;
			case "Credits": room_goto(rm_credits); break;
            case "Quit": game_end(); break;
        }
    } else if (menu_state == "options") {
        switch (selection) {
            case "Controls J1": menu_state = "controls"; menu_index = 0; break;
			case "Controls J2": menu_state = "controls_p2"; menu_index = 0; break;
			/*case "One-Hand Mode: OFF":
			case "One-Hand Mode: ON":
			    global.one_hand_mode = !global.one_hand_mode; // toggle
			    var new_label = "One-Hand Mode: " + (global.one_hand_mode ? "ON" : "OFF");
			    menu_options_options[2] = new_label; // update label in menu
			    break;*/

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

		    menu_options_options[2] = "Difficulty: " + global.difficulty;
		    save_controls();
		    break;

			case "Fullscreen: OFF":
			case "Fullscreen: ON":
				global.fullscreen = !global.fullscreen;
				window_set_fullscreen(global.fullscreen);
				menu_options_options[3] = "Fullscreen: " + (global.fullscreen ? "ON" : "OFF");
				save_controls();
		        break;

            case "Gameplay": menu_state = "gameplay"; menu_index = 0; break;
            case "Back": menu_state = "main"; menu_index = 0; break;
        }
    }
}

