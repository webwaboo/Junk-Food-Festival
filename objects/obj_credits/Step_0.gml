if (keyboard_check_pressed(vk_anykey) || input_gamepad_any_pressed(0)) {
    room_goto(rm_menu)
}

// Scroll vers le haut
credits_y -= scroll_speed;

// Remonter tout en haut puis revenir au menu principal
if (credits_y + array_length(credits_list) * 200 < 0) {
    room_goto(rm_menu); // Retour au menu
}
