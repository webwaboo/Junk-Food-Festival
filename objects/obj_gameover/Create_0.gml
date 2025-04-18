// Valeur par défaut (à écraser à la création)
vainqueur = "J1";
alpha = 1;

if (!instance_exists(obj_menu_gameover)) {
    instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, "GUI", obj_menu_gameover);
}

audio_play_sound(snd_last_hit, 1, false);