// Monter / Descendre
if (keyboard_check_pressed(vk_up)) menu_index = (menu_index - 1 + array_length(menu_options)) mod array_length(menu_options);
if (keyboard_check_pressed(vk_down)) menu_index = (menu_index + 1) mod array_length(menu_options);

// Sélection
if (keyboard_check_pressed(vk_enter)) {
    var choix = menu_options[menu_index];

    switch (choix) {
        case "Start":
            room_goto(rm_main_game); // Remplace par ta room principale
            break;
        case "Options":
            room_goto(rm_options); // À créer
            break;
        case "Tutorial":
            room_goto(rm_tutorial); // À créer
            break;
        case "Quit":
            game_end();
            break;
    }
}
