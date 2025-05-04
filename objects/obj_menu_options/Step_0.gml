if (input_check_pressed("up")) {
    menu_index = (menu_index - 1 + array_length(menu_options)) mod array_length(menu_options);
}

if (input_check_pressed("down")) {
    menu_index = (menu_index + 1) mod array_length(menu_options);
}

if (input_check_pressed("accept")) {
    switch (menu_index) {
        case 0:
            // Go to control change screen (placeholder for now)
            show_debug_message("Go to Controls screen");
            break;
        case 1:
            // Go to difficulty screen (placeholder for now)
            show_debug_message("Go to Difficulty screen");
            break;
        case 2:
            // Return to main menu
            room_goto(rm_main_menu); // or instance_destroy(), depending on structure
            break;
    }
}
