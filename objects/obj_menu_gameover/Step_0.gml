// Navigation haut/bas
if (keyboard_check_pressed(vk_up)) {
    menu_index = (menu_index - 1 + array_length(menu_options)) mod array_length(menu_options);
}
if (keyboard_check_pressed(vk_down)) {
    menu_index = (menu_index + 1) mod array_length(menu_options);
}

// Validation
if (keyboard_check_pressed(vk_enter)) {
    var choice = menu_options[menu_index];
    
    switch (choice) {
        case "Rejouer":
            game_restart(); // Redémarre la room actuelle
            break;
        case "Quitter":
            game_end(); // Ferme le jeu
            break;
    }
}
