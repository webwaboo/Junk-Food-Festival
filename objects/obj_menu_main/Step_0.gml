// === Step Event ===
var options = (menu_state == "main") ? menu_options_main : menu_options_options;

// Navigation
if (keyboard_check_pressed(vk_up)) menu_index = (menu_index - 1 + array_length(options)) mod array_length(options);
if (keyboard_check_pressed(vk_down)) menu_index = (menu_index + 1) mod array_length(options);

// === Gestion du tutoriel ===
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
    exit; // pour ne pas faire le menu_index/enter en dessous
}

else if (menu_state == "controls") {
    var keys_array = ["up", "down", "bloc_up", "bloc_down", "send", "shift"];
    var key_name = keys_array[menu_index];

    if (!waiting_for_key) {
        if (keyboard_check_pressed(vk_up)) menu_index = (menu_index - 1 + array_length(keys_array)) mod array_length(keys_array);
        if (keyboard_check_pressed(vk_down)) menu_index = (menu_index + 1) mod array_length(keys_array);

        if (keyboard_check_pressed(vk_enter)) {
            waiting_for_key = true;
        }

        if (keyboard_check_pressed(vk_escape)) {
            menu_state = "options";
            menu_index = 0;
        }
    } else {
        // Rebinding
        var key = keyboard_lastkey;
        global.controls_j1[$ key_name] = key; // ← syntaxe d'accès struct dynamique
        waiting_for_key = false;
    }
	
	/*var control_keys = variable_struct_get_names(global.controls_j1);
    var key_name = control_keys[menu_index];

    if (!waiting_for_key) {
        if (keyboard_check_pressed(vk_up)) menu_index = (menu_index - 1 + array_length(control_keys)) mod array_length(control_keys);
        if (keyboard_check_pressed(vk_down)) menu_index = (menu_index + 1) mod array_length(control_keys);

        if (keyboard_check_pressed(vk_enter)) {
            waiting_for_key = true;
        }

        if (keyboard_check_pressed(vk_escape)) {
            menu_state = "options";
            menu_index = 0;
        }
    } else {
        // Rebinding
        var key = keyboard_lastkey;
        global.controls_j1[ key_name ] = key;
        waiting_for_key = false;
    }*/
}

// === Sélection dans les menus classiques ===
if (keyboard_check_pressed(vk_enter)) {
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
            case "Controls":  menu_state = "controls"; menu_index = 0; break;
            case "Difficulty": show_debug_message("Difficulty screen coming soon"); break;
            case "Back": menu_state = "main"; menu_index = 0; break;
        }
    }
}


