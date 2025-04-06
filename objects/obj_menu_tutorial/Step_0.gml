// Naviguer entre les pages
if (keyboard_check_pressed(vk_right)) {
    current_page = (current_page + 1) mod page_count;
	audio_play_sound(snd_option_select, 1, false);
}
if (keyboard_check_pressed(vk_left)) {
    current_page = (current_page - 1 + page_count) mod page_count;
	audio_play_sound(snd_option_select, 1, false);
}

// Quitter le tutoriel (retour au menu principal)
if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
	audio_play_sound(snd_select_move, 1, false);
    menu_state = "main"; // ou appeler une fonction/menu reset
}
