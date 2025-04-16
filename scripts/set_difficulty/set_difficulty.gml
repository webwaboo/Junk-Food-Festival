function set_difficulty() {
    switch (global.difficulty) {
        case "Easy":
            global.bloc_timer_max = game_get_speed(gamespeed_fps) * 7;
            break;

        case "Normal":
            global.bloc_timer_max = game_get_speed(gamespeed_fps) * 4;
            break;

        case "Hard":
            global.bloc_timer_max = game_get_speed(gamespeed_fps) * 2;
            break;
    }

    // Réinitialise le timer à sa nouvelle valeur
    global.bloc_timer = global.bloc_timer_max;

    // Tu peux ajouter d'autres effets ici :
    // - vitesse d'envoi ?
    // - fréquence d'apparition d’un bonus ?
    // - comportement AI plus tard ?
}
