// Naviguer entre les pages
if (input_check_pressed("right")) {
    current_page = (current_page + 1) mod page_count;
	audio_play_sound(snd_option_select, 1, false);
}
if (input_check_pressed("left")) {
    current_page = (current_page - 1 + page_count) mod page_count;
	audio_play_sound(snd_option_select, 1, false);
}

// Quitter le tutoriel (retour au menu principal)
if (input_check_pressed("back")) {
    instance_destroy();
	audio_play_sound(snd_select_move, 1, false);
    menu_state = "main"; // ou appeler une fonction/menu reset
}
